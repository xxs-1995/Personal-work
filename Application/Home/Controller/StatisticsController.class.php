<?php
namespace Home\Controller;
use Think\Controller;
class StatisticsController extends Controller {

	//算力计算   市场培育奖  算力补贴 算力大赛   代理及分红奖
	public function Statistic(){
        //查出所有人的销量和累积销售
        $user = M('personal')->field('user_id,user_nickname,user_tel,recommend,suanli,dig')->select();
        $condition = M('liveset')->find();
        // 取出所有货币的种类
        $bi = M('bibi')->field('bid,title,num,rate')->select();
        //先算出所有人的算力释放
        foreach ($user as $keyy => &$valuee) {
//            print_r($valuee);die;
            //未开启挖宝自动跳出
            if($valuee['dig'] != 1){
                continue;
            }
            //释放的矿石 、 扣除的算力
            $kk = $valuee['suanli'] * 0.001;
//            print_r($kk);die;   $kk=9.96
            if($kk == 0){
                continue;
            }
            $dig['createtime'] = time();
            $dig['user_id'] = $valuee['user_id'];
            $dig['currency'] = 'suanli';
            $dig['inout'] = 'out';
            $dig['type'] = '释放';
            $dig['suanli'] = $kk;
            $relseses[] = $dig;
            M('personal')->execute("update pa_personal set suanli = suanli - {$kk} where user_id = {$valuee[user_id]}");

            foreach ($bi as $key => $value) {
                //该币种分配的数量
                $num = $kk * $value['rate'];
                //9.96 * 0.8 = 7.968
                $bb['createtime'] = time();
                $bb['user_id'] = $valuee['user_id'];
                //数量够就扣除当前数组 否则用bow补
                if($value['num'] > $num){
                    $bb['title'] = $value['title'];
                    $bb['number'] = $num; 
                    $bb['bid'] = $value['bid'];
                    $biAll[] = $bb;
                    $bi[$key]['num'] -= $num;
                }else{
                    // 小于当前数量 就判断是否是0  0就全用bow补
                    if($value['num'] == 0){
                        $bb['title'] = 'BOW';
                        $bb['number'] = $num; 
                        $bb['bid'] = 3;
                        // $bi[$key]['num'] -= $num;
                        $biAll[] = $bb;
                    }else{
                        //币不够挖的数量，把剩余的币全挖走，剩下的用bow补。
                        $bb['title'] = $value['title'];
                        $bb['number'] = $value['num']; 
                        $bb['bid'] = $value['bid'];
                        $biAll[] = $bb;
                        $bb['title'] = 'BOW';
                        $bb['number'] = $num - $value['num']; 
                        $bb['bid'] = 3;
                        $biAll[] = $bb;
                        $bi[$key]['num'] = 0;
                    }
                }   
                
            }
        }
        M('mining')->addAll($biAll);
        // sql();
        foreach ($bi as $key => $value) {
            M('bibi')->save($value);
        }
        //待领取算力按照比例释放成钻石
        $personal = M('personal')->where('marketaward = 1 and waitsuanli > 0')->field('waitsuanli,user_id')->select();
        foreach ($personal as $key => $value) {
            $money = M('order')->where('recommend = "'.$value['user_id'].'" and createtime > "'.$time.'"')->field('sum(price) sum')->find();
//            print_r($set);die;
            $diamond = $money['sum'] * $condition['cultivationshifang']; //liveset 表  培育释放 字段  钻石
            $dig['createtime'] = time();
            $dig['user_id'] = $valuee['user_id'];
            $dig['currency'] = 'diamond';
            $dig['inout'] = 'in';
            $dig['type'] = '释放';
            $dig['suanli'] = $diamond;
            $relseses[] = $dig;

            //统计钻石 ， 增加用户钻石'
            //所有的统计都放在computing中
            M()->execute("update pa_personal set zdiamonds= zdiamonds + {$diamond},diamonds= diamonds + {$diamond}, waitsuanli = waitsuanli - {$diamond} where user_id = {$value[user_id]}");
        }
        
        // $min = M('mining')->addAll($allmin);
        $rese = M('computing')->addAll($relseses);
        // sql();
        foreach($user as $key => $value){
            //
            $child = M('personal')->where('recommend = "'.$value['user_id'].'"')->field('user_id,user_nickname,user_tel')->select();
            $user[$key]['child'] = $child;
            if($child){
                //查询销售量
                $union1 = '';
                foreach($child as $v){
                    $union1 .= "select num from pa_orderdetails where uid = {$v[user_id]} and  pid in ({$condition['pid']}) union ";
                }
//                echo $union1;die;
                // print_r(substr($union,0,-6));die;
                $volume = M()->query(substr($union1,0,-6));
                //销量
//                echo $volume;
                $num = 0;
                foreach($volume as $va){
                    $num += $va['num'];
                }
                
                // $list[] = array('up' => $value,'down' => $user);
                //销售矿机的数量
                $user[$key]['qualifications'] = $num; 
            }
        }

        //查出矿机团队累积销售
        foreach ($user as $key => $value) {
            $team = $this->getteam($user,$value['user_id']);
            // print_r($team);
            $union2 = '';
            foreach ($team as $k => $v) {
                $union2 .= "select `price` from pa_order where uid = {$v}  union ";
            }
//             echo $union2.'-----';die;
            $total = M()->query(substr($union2,0,-6));
            $price = 0;
            foreach ($total as $ke => $va) {
                $price += $va['price']; 
            } 
            $user[$key]['teamprice'] = $price;
            
            
        }
        //查出算力池大小
        $time = strtotime(date('Ymd',time()));
        $time = 0 ;
        $money = M('order')->where('createtime > "'.$time.'" and fk = 1')->field('sum(price) price')->find();
//        print_r($user);
        $pool = $condition['pool'] / 100 * $money['price'];
        //算力补贴
        $this->subsidy($user,$pool,$condition);
        //算力大赛
        $this->match($user,$pool);
        //代理
        $this->agent();
        // echo 1;
        //市场培育奖
        $this->cultivation($condition);
        

	}



	//算力补贴
	public function subsidy($user,$pool,$condition){
        //当天的补贴请款   subsidy_rete算力补贴比率  subsidy_price团队销售金额   subsidy_num下级销售数量
        // $condition = M('liveset')->field('subsidy_rete,subsidy_price,subsidy_num,pid')->find();
        //两个条件都符合的取出
        foreach ($user as $key => $value) {
            if($value['qualifications'] >= $condition['subsidy_num'] && $value['teamprice'] >= $condition['subsidy_price']){
                //符合条件的人
                $accord[] = $value;
            }else{
                continue;
            }
        }
        //平分算力池
        //一个人应给的算力
     	$once = $pool * $condition['subsidy_rete'] / count($accord);  
     	$data['suanli'] = $once;
     	$data['createtime'] = time();
     	$data['type'] = '算力补贴';
        $data['inout'] = 'in';
        $data['currency'] = 'suanli';
     	foreach ($accord as $key => $value) {
     		$data['user_id'] = $value['user_id'];
     		$add[] = $data;
     		$ids .= $value['user_id'].',';
     	}
        M()->startTrans();
        $adds = M('computing')->addAll($add);
     	$where['user_id'] = array('in',rtrim($ids,','));
     	$suanli = M('personal')->where($where)->setInc('suanli',$once);
        $zsuanli = M('personal')->where($where)->setInc('flowsuanli',$once);
        if($adds && $suanli && $zsuanli){
            M()->commit();
        }else{
            M()->rollback();
        }
     	return ;
    }



    //获取团队的成员  包括当前用户的下级和下级和下级········
    public function getteam($data,$pid){
        //保存
        $arr = array();
        foreach($data as $k => $v){
            if($v['recommend'] == $pid){
                $arr[] = $v['user_id'];
                $arr = array_merge($arr,$this->getteam($data,$v['user_id']));
            }
        }
        return $arr;
    }



    //算力大赛
    public function match($user,$pool){
        //找出所有的大赛 
        $match = M('match')->order('pool desc')->select();

        foreach ($match as $key => $value) {
            $count = 0;
            
            foreach ($user as $k => $v) {
                $id = '';
                //矿机数 销售量达标  考核小区 1/3， 至少直系三个团队;  至少有两个达到规定业绩1/3的团队，剩下的团队相加达到规定的1/3
                if($v['qualifications'] > $value['num'] && $v['teamprice'] > $value['price'] && count($v['child'])> 3){
                    foreach ($v['child'] as $keys => $values) {
                        $child[$keys] .= implode($this->getteam($user,$values['user_id']),',');
                    }
//                    print_r($child);
                    foreach ($child as $ke => $va) {
                        $price = M()->query("select sum(price) sum from pa_order where uid in ({$va})");
                        foreach ($price as $kk => $vv){
                            $order[] = $vv['sum'];
                        }

                    }
//    print_r($order);
                    rsort($order);
                    $totalsum = array_sum($order);
                    $team1 = array_shift($order);
                    $team2 = array_sum($order);
                    //都符合条件
                    if($team2 > $totalsum/4){
                        $count++;
                        $people .= $v['user_id'].',';
                        $peoples[] = $v['user_id'];
                        unset($user[$key]);
                    }
                }
            }
//            echo $count;
//            print_r($peoples);
            $once = $pool / $count;
            $data['suanli'] = $once;
            $data['createtime'] = time();
            $data['type'] = '算力大赛';
            $data['currency'] = 'suanli';
            $data['inout'] = 'in';
            foreach ($peoples as $k => $v) {
                $data['user_id'] = $v;
                $add[] = $data;
                $ids .= $v.',';
            }
            M()->startTrans();
            $adds = M('computing')->addAll($add);

            $where['user_id'] = array('in',rtrim($ids,','));
            $suanli = M('personal')->where($where)->setInc('suanli',$once);

            $zsuanlli = M('personal')->where($where)->setInc('flowsuanli',$once);

            if($adds && $suanli && $zsuanlli){
                M()->commit();
            }else{
                M()->rollback();
            }
        }

    }

    //代理
    public function agent(){
        ini_set('max_execution_time', '0');
        $agent = M('agent')->select();
        foreach ($agent as $key => $value) {
            //按等级分组 
            $agents[$value['address']][] = $value;
            $ids[$value['address']][] .= $value['did'].',';
        }

        $time = strtotime(date('Y-m-d',time()));
        $time = 0;
        $order = M('order o')->join('pa_personal p on p.user_id = o.uid')->field('price,p.province,p.city,p.county')->where('o.createtime > "'.$time.'" and o.fk = 1 and order_type = "shop"')->select();
//    print_r($agents);
        foreach ($agents as $key => $value) {
                //区域销售业绩
                $zprice = 0;
                foreach ($order as $k => $v) {
                    if($v['province'] == $key || $v['city'] == $key || $v['county'] == $key){
                        $zprice += $v['price'];
                    }
                }

                // 平均金额
                $price = $zprice / count($value);
                //代理增加金币
                $data['user_jine'] = 'user_jine + '.$price;
                $data['user_zjine'] = 'user_zjine + '.$price;
                $data['user_id'] = array('in',rtrim($ids[$key],','));
                M('personal')->where()->save($data);
                //生成订单记录
                $orders['suanli'] = $price;
                $orders['type'] = '代理奖励';
                $orders['createtime'] = time();
                $orders['currency'] = 'suanli';
                $orders['type'] = 'in';
                foreach ($value as $ke => $va) {
                    $orders['user_id'] = $va['user_id'];
                    $arr[] = $orders;
                }
                M('computing')->addAll($arr);
            }

    }

    //市场培育奖
    public function cultivation($set){
//        print_r($set);
        //查出所有符合标准的人  有上级和销售数量达标
        $user = M('personal')->where('marketaward = 0 and recommend is not null')->field('user_id,recommend')->select();
        // $set = M('liveset')->find();
        // $user =
        
        M('personal')->select();
        $time = strtotime(date('Ymd',time()));
        $time = 0;
        //按照推荐人分组
        foreach ($user as $key => $value) {
            $users[$value['recommend']][] = $value['user_id'];
        }
        
        foreach ($users as $k => $v) {
            //订单总价
            $orderPrice = M('order')->field('sum(price) sum')->where('recommend = "'.$k.'" and createtime > "'.$time.'"')->find(); 
            $count = count($v);
            //总价按百分比在除以合格的人数
            $price = $orderPrice['sum'] * $set['cultivationrate'] / $count;
            //扣除上级的东西 添加记录 扣除余额
            $prev['createtime'] = time(); 
            $prev['type'] = '市场培育奖'; 
            $prev['inout'] = 'out';
            $prev['currency'] = 'suanli';
            $prev['suanli'] = $orderPrice['sum']; 
            $all[] = $prev;
            //存入符合的人的待领取算力中
            $data['createtime'] = time();
            $data['type'] = '市场培育奖';
            $data['suanli'] = $price;
            $data['inout'] = 'in';
            $data['currency'] = 'suanli';
            $ids = implode(',',$v);
            
            //添加到待领取算力中
            $waitReceice['user_id'] = array('in',$ids);
            $sprice = $price * $set['cultivationrate'];
            M('personal')->where($waitReceice)->setInc('waitsuanli',$sprice);
            //扣除
            M('personal')->where('user_id = "'.$k.'"')->setDec('suanli',$orderPrice['sum']);
            foreach ($v as $ke => $va) {
                //算力表添加
                $data['user_id'] = $va['user_id'];
                $all[] = $data;
                //用户表修改记录
            }
            M('computing')->addAll($all);

        }
     
       return;
        

    }
    

}