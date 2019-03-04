<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {

	public function index(){
		$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id,user_img,mineral,user_tel,flowsuanli,user_nickname,user_number,suanli,user_jine,dig,buy_flowsuanli')->find();
//        print_r($re);die;
		if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        if($re['flowsuanli']==''){
        	$re['flowsuanli']=0;
        }
        // if($re['buy_flowsuanli']=='' || $re['buy_flowsuanli']==null){
        // 	$re['buy_flowsuanli']=0;
        // }
        if($re['dig']==1){
        	for($i=1; $i<=rand(1,2);$i++){
	        	$min_data['user_id'] = $re['user_id'];
	        	$min_data['createtime'] = time();
	        	$min_data['receive'] = 0;
	        	$min_data['title'] = 'BOW';
	        	$min_data['bid'] = 3;
	        	$min_data['number'] = rand(10,999)/100000;
	        	M('mining')->add($min_data);
        	}
        }
        //用户信息
        $re['user_img'] = 'http://'.$_SERVER['SERVER_NAME'].$re['user_img'];

        //是否签到
        $zeroTime = strtotime(date('Y-m-d',time()));
        //查看签到表是否签到
       	$sign = M('computing')->where('user_id = "'.$re['user_id'].'" and type = "sign" and createtime > "'.$zeroTime.'"')->find();

       	$data['sign'] = $sign ? '1' : '0';

        $rete = M('liveset')->find();

        //分享算力 
		$data['flowsuanli'] = $re['flowsuanli'];
		// //区块算力 
		// $data['mysuanli'] = $re['buy_flowsuanli'];
		//我的BOW
		$data['BOW'] = $re['mineral'];
        //算力排名
        $suanliRank = M('personal')->field('user_id,suanli,user_nickname')->order('suanli desc')->select();
        // foreach ($suanliRank as $key => $value) {
        // 	if($value['suanli']>10000){
        // 		$data[$key]['suanli'] = ($value['suanli']/10000).'W';
        // 	}
        // }
//        print_r($suanliRank);die;
        //我的排名
        foreach ($suanliRank as $key => $value) {
        	if($value['user_id'] == $re['user_id']){
        	    //排行第$key+1名
        		$data['myrank'] = $key + 1;
        	}
		}
		$time = time();
		//今日获利次数 ???????
		$data['todaytimes'] = M('mining')->where('receive_time > "'.$zeroTime.'"')->count();
//		print_r($data['todaytimes']);die;
		//总获利次数 ???????
		$data['alltimes'] = M('mining')->count();
		//排行榜
		$data['rank'] = $suanliRank;
		foreach ($data['rank'] as $key => $value) {
			$data['rank'][$key]['order'] = $key+1;
		}
		$data['receive'] = M('mining')->where('user_id = "'.$re['user_id'].'" and receive = 0')->field('number,title,id')->order('createtime desc')->select() ?: array();
		//是否自动挖宝
		$data['dig'] = $re['dig'];
		//我的挖矿记录
		$data['record'] = M('mining')->where('user_id = "'.$re['user_id'].'" and receive = 1')->field('number insur,receive_time,title')->limit(4)->order('receive_time desc')->select() ?: array();
		foreach ($data['record'] as $key => $value) {
        	$data['record'][$key]['receive_time'] = time_tran($value['receive_time']);
		}
		

        return rData('1','请求成功',$data);

    }
    //货币名称
    public function coin()
    {
    	$coin = C('coin');
    	return rData('1','请求成功',$coin);
    }

	//更改自动挖宝状态
	public function changedig(){
		$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id,dig')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
		}
		$re['dig'] = abs($re['dig'] - 1);
		$res = M('personal')->save($re);
		if($res){
			return rData('1','请求成功',$re);
		}else{
			return rData('0','请求失败');
		}
		
	}

	public function wawa()
	{
		$user = M('personal')->select();
		$liveset=M('liveset')->find();
		foreach ($user as $key => $value) {
			$bow1 = $value['flowsuanli']/100*$liveset['convert'];
			// $bow2 = $value['buy_flowsuanli']/100*$liveset['convert2'];
			M('personal')->where("id = {$user['user_id']}")->setDec('flowsuanli',$bow1);
			// M('personal')->where("id = {$user['user_id']}")->setDec('buy_flowsuanli',$bow2);
			// $bow = $bow1+$bow2;
			$bow = $bow1/100*$liveset['manage_fee'];
			$min_data['user_id'] = $value['user_id'];
        	$min_data['createtime'] = time();
        	$min_data['receive'] = 0;
        	$min_data['title'] = C('coin');
        	$min_data['bid'] = 3;
        	$min_data['number'] = $bow;
        	$data[] = $min_data;
		}
		M('mining')->add($data);
	}

    // 点击挖矿
    public function wa(){
    	$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        if($_POST['insur']){
        	$data['id'] = $_POST['insur'];
        	$data['receive'] = 1;
			$data['receive_time'] = time();
			$res = M('mining')->save($data);
			$min = M('mining')->where('id = "'.$_POST['insur'].'"')->find();
        	if($res){
				$buy['user_id'] = $re['user_id'];
				$buy['createtime'] = time();
				$buy['type'] = '挖矿';
				$buy['currency'] = $min['title'];
				$buy['inout'] = 'in';
				$buy['suanli'] = $min['number'];
				$all[] = $buy;
				M('computing')->addAll($all);
				//给我的钱币表填数据
				$mybi = M('mybi')->where('biid = "'.$min['bid'].'" and user_id = "'.$re['user_id'].'"')->find();
				//bow添加到用户表中
				if($mybi['title'] == 'BOW'){
					M()->execute("update pa_personal set mineral = mineral + {$min[number]} , zmineral = zmineral + {$min[number]} where user_id = {$re[user_id]}");
				}else{
					if($mybi){
						M()->execute("update pa_mybi set zbi = zbi + {$min[number]} , bi = bi + {$min[number]} where id = {$mtbi[id]}");
					}else{
						$add['user_id'] = $re['user_id'];
						$add['biid'] = $min['bid'];
						$add['zbi'] = $min['number'];
						$add['bi'] = $min['number'];
						$add['title'] = $min['title'];
						M('mybi')->add($add);
					}
				}
				
				return rData('1','请求成功');
        	}else{
        		return rData('1','暂无数据');
        	}
        }else{
			//返回收入详情， 所有的收入
			$data['record'] = M('mining')->where('user_id = "'.$re['user_id'].'" and receive = 0')->field('number insur,id,title')->order('createtime desc')->select() ?: array();
        	if($data){
        		return rData('1','请求成功',$data);
        	}else{
        		return rData('1','暂无数据');
        	}
        }
	}
	

	//一键领取
	public function receiveAll(){
		$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
		}
		$bi = M('mining')->where('user_id = "'.$re['user_id'].'" and receive = 0')->select();
		if(empty($bi)){
			exit(json_encode(array("state" => '-1',"msg" => '当前没有可以领取的矿石')));
		}
		M()->starttrans();
		if($bi){
			$data['user_id'] = $re['user_id'];
			$data['createtime'] = time();
			$data['type'] = '挖矿';
			$ids = '';
			foreach ($bi as $key => $value) {
				$data['currency'] = $value['title'];
				$data['inout'] = 'in';
				$data['suanli'] = $value['number'];
				$all[] = $data;
				$ids .= $value['id'].',';
				//给我的钱币表填数据
				$mybi = M('mybi')->where('biid = "'.$value['bid'].'" and user_id = "'.$re['user_id'].'"')->find();
				//bow添加到用户表中
				if($value['title'] == 'BOW'){
					$sql1 = M()->execute("update pa_personal set mineral = mineral + {$value[number]} , zmineral = zmineral + {$value[number]} where user_id = {$re[user_id]}");
				}else{
					if($mybi){
						$sql1 = M()->execute("update pa_mybi set zbi = zbi + {$value[number]} , bi = bi + {$value[number]} where id = {$mybi[id]}");
					}else{
						$add['user_id'] = $re['user_id'];
						$add['biid'] = $value['bid'];
						$add['zbi'] = $value['number'];
						$add['bi'] = $value['number'];
						$add['title'] = $value['title'];
						$sql1 = M('mybi')->add($add);
					}
				}
			}	
			$sql2 = M('computing')->addAll($all);
			$ids = rtrim($ids,',');
			$time = time();
			$sql3 = M()->execute("update pa_mining set receive = 1,receive_time = {$time} where id in ({$ids})");
		}
		if($sql1 && $sql3 && $sql2){
			M()->commit();
			return rData('1','请求成功');
		}else{
			M()->rollback();
			return rData('0','请求失败');
		}
	}

	//挖矿记录
	public function record(){
		$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
		}
		// if(!$_POST['inout']){
		// 	$_POST['inout'] = 'in';
		// }
		// $limit = pagex($_POST['page']);
		$data = M('mining')->where('user_id = "'.$re['user_id'].'" and receive = 1')->field('number insur,receive_time')->limit(4)->order('receive_time desc')->select() ?: array();
		// $data = M('computing')->where('user_id = "'.$re['user_id'].'" and `inout` = "'.$_POST['inout'].'"')->field('id,suanli insur,type,createtime')->order('createtime desc')->limit($limit)->select()?:array();
		// sql();
		foreach ($data as $key => $value) {
        	$data[$key]['receive_time'] = time_tran($value['receive_time']);
		}
		return rData('1','请求成功',$data);
	}


    // 签到
    public function sign(){
    	$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        //获取 几天零点的时间戳
        $zeroTime = strtotime(date('Y-m-d',time()));
       	$sign = M('computing')->where('user_id = "'.$re['user_id'].'" and type = "sign" and createtime > "'.$zeroTime.'"')->find();
       	if($sign){
       		return rData('0','请勿重复签到');
		}
		$data['user_id'] = $re['user_id'];
		$data['suanli'] = 1;
		$data['type'] = '签到';
		$data['inout'] = 'in';
		$data['currency'] = 'suanli';
       	$data['createtime'] = time();
       	$res = M('computing')->add($data);
       	print_r($res);die;
		M('personal')->where('user_id = "'.$re['user_id'].'"')->setInc('suanli');
		M('personal')->where('user_id = "'.$re['user_id'].'"')->setInc('flowsuanli');
		   if($res){
        		return rData('1','请求成功');
        	}else{
        		return rData('0','请求失败');
        	}
    }
    //企业账户
    public function enterprise()
    {
    	$data = M('enterprise')->where("moren=1")->find();
    	if($data['qr_code']){
    		$data['qr_code'] = 'http://'.$_SERVER['SERVER_NAME'].$data['qr_code'];
    	}
    	return rData('1','请求成功',$data);
    }
  
    //查看附加算力
    public function additional(){
    	$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        $time = time();
       	//过期时间小于当前时间 
        $suanli = M('computing')->field('id,user_id,suanli,type,createtime')->where('user_id = "'.$re['user_id'].'" and (timeout > "'.$time.'" or timeout = 0)')->select() ?: array();
        foreach ($suanli as $key => $value) {
        	$suanli[$key]['createtime'] = date('m-d H:i',$value['createtime']);
        	switch ($value['type']) {
        		case 'buy':
        			$suanli[$key]['type'] = '租用';
        			break;
        		case 'give':
        			$suanli[$key]['type'] = '推荐奖励';
        			break;
        		case 'sign':
        			$suanli[$key]['type'] = '签到';
        			break;
        	}
        }
        return rData('1','请求成功',$suanli);
    }
    public function category()
    {
    	$cate = M('category')->where('type = "p"')->field('cid,name')->order('sort')->select();
    	// array_unshift($cate,['cid'=>0,'name'=>'全部']);
    	return rData('1','请求成功',$cate);
    }
    public function zec_ratio()
    {
    	$liveset = M('liveset')->find();
    	$data['zec_ratio'] = $liveset['zec_ratio'];
    	$data['zec_usd_rate'] = $liveset['zec_usd_rate'];
    	return rData('1','请求成功',$data);
    }

    //矿机列表
    public function buylist(){
		$big = M('ad')->field('ad_img')->order('sort desc')->where('position = "shop"')->select()?:'';
		if(isset($_POST['cid']) && $_POST['cid']!=0){
			$where['cid'] = $_POST['cid'];
		}
		$liveset = M('liveset')->find();
		$goods = M('product p')->field('p.id,p.title,p.price,p.image_id')->where($where)->select() ?: array();
		foreach ($goods as $key => $value) {
			// $goods[$key]['price'] = sprintf('%.4f',$value['price']/$liveset['zec_ratio']);
			$image = M('images')->where('id = "'.$value['image_id'].'"')->find();
			if($image['savepath']){
				$goods[$key]['img'] = YICHONG.$image['savepath'];
			}
		}
		$data['goods'] = $goods;
		return rData('1','请求成功',$data);
	}
	//商品列表
	public function buylistn(){
		$liveset = M('liveset')->find();
		$big = M('ad')->field('ad_img')->order('sort desc')->where('position = "shop"')->find()?:'';
		$big['ad_img'] = YICHONG.$big['ad_img'];
		$data['big'] = $big;
		$cate = M('category')->where('type = "p"')->field('cid,name')->order('sort')->select();
		foreach ($cate as $key => $value) {
			$goods = M('product p')->field('p.id,p.title,p.price,p.image_id')->where('cid = "'.$value['cid'].'"')->select() ?: array();
			$cate[$key]['goods'] = $goods;
			foreach ($cate[$key]['goods'] as $k => $v) {
				$image = M('images')->where('id = "'.$v['image_id'].'"')->find();
				if($image['savepath']){
					$cate[$key]['goods'][$k]['image_id'] = YICHONG.$image['savepath'];
					// $cate[$key]['goods'][$k]['price'] = sprintf('%.4f',$v['price']/$liveset['zec_ratio']);
				}
			}
		}
		$data['data'] = $cate;
		// $data['all'] = M('product p')->field('p.id,p.title,p.price,p.image_id')->select() ?: array();
		// foreach ($data['all'] as $key => $value) {
		// 	$all_img = M('images')->where('id = "'.$value['image_id'].'"')->find();
		// 	if($all_img['savepath']){
		// 		$data['all'][$key]['image_id'] = YICHONG.$all_img['savepath'];
		// 	}
		// }
		$data['access_token'] = $_POST['access_token'];
		return rData('1','请求成功',$data);
    }


	// 商品详情
	public function shopdetail(){
		if(!$_POST['id']){
			return rData('-1','参数错误');
		}
		$liveset = M('liveset')->find();
		$goods = M('product')->field('id,title,price,image_id,content')->where('id = "'.$_POST['id'].'"')->find();
		$img = M('images')->where('id = "'.$goods['image_id'].'"')->find();
		$goods['image'] = 'http://'.$_SERVER['SERVER_NAME'].$img['savepath'];
		// $goods['price'] = sprintf('%.4f',$goods['price']/$liveset['zec_ratio']);
		return rData('1','请求成功',$goods);
	}


    
    // 我的页面
    public function myMessage(){
    	$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id,user_jine,user_nickname,user_img')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
       	$re['user_img'] = 'http://'.$_SERVER['SERVER_NAME'].$re['user_img'];
        $data = $re;
        $rate = M('liveset')->find();
        $data['cny'] =  $re['user_jine'] * $rate['cny'];
        return rData('1','请求成功',$data);

    }

	//无限极分类
	public function getTree($data, $pId)
	{
	$tree = '';
	foreach($data as $k => $v)
	{
	  if($v['pid'] == $pId)
	  {        
	   //父亲找到儿子
	   $v['son'] = $this->getTree($data, $v['com_id']);
	   $tree[] = $v;
	   unset($data[$k]);
	  }
	}
	return $tree;
	}

	//转账
	public function give(){
    	$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id,user_jine,user_tel')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }	

        //传手机号为转账
        if(!$_POST['phone'] || !$_POST['insur']){
        	return rData('1','请求成功',$re);
        }
        if($re['user_jine'] < $_POST['insur']){
        	return rData('0','insur不足');
        }
        if($_POST['phone'] == $re['user_tel']){
        	return rData('0','不能转给自己');
        }
        $him = M('personal')->where('user_tel = "'.$_POST['phone'].'"')->find();
        if(!$him){
        	return rData('0','账户不存在');
        }
        M()->startTrans();
        $me = M('personal')->where('user_tel = "'.$re['user_tel'].'"')->setDec('user_jine',$_POST['insur']);
        $he = M('personal')->where('user_tel = "'.$_POST['phone'].'"')->setInc('user_jine',$_POST['insur']);
        $data[] = array('user_id'=>$re['user_id'],'goods_name' => '-'.$_POST['insur'],'createtime'=>time());
        $data[] = array('user_id'=>$him['user_id'],'goods_name' => '+'.$_POST['insur'],'createtime'=>time());
        $order = M('order')->addall($data);
        if($he && $me && $order){
        	M()->commit();
        	return rData('1','请求成功');
        }else{
        	M()->rollback();
        	return rData('0','请求失败');
        }
	}

	//交易记录
	public function order(){
		$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
		$data = M('order')->where('user_id = "'.$re['user_id'].'"')->select() ?: array();
		foreach ($data as $key => $value) {
			$data[$key]['createtime'] = date('m-d H:i',$value['createtime']);
		}
		return rData('1','请求成功',$data);
	}
	//资讯客服  关于我们 分类文章
	public function article(){
		if(!$_POST['cate']){
			return rData('-1','参数错误');
		}
		$article = M('news n')->where('c.name = "'.$_POST['cate'].'"')->join('pa_category c on c.cid = n.cid')->select();
		if($article){
			return rData('1','请求成功',$article);
		}else{
			return rData('1','暂无数据');
		}
	}

	//我的战绩
	public function achievements(){
		$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id,suanli,user_jine,user_number')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
		}
		$data['ones'] = M('personal')->where('recommend = "'.$re['user_id'].'"')->count();
		$data['twos'] = M('personal')->where('recommend2 = "'.$re['user_id'].'"')->count();
		$data['suanli'] = $re['suanli'];
		$data['user_jine'] = $re['user_jine'];
		$data['user_number'] = $re['user_number'];
		$article = M('news n')->where('c.name = "奖励规则"')->field('title,content')->join('pa_category c on c.cid = n.cid')->find();
		$data['content'] = $article['content'];
		return rData('1','请求成功',$data);
		
	}


	//广告
	public function advert(){
		$data = M('ad')->field('id,ad_link,ad_img')->order('sort desc')->where('position = "banner"')->select();
		foreach ($data as $key => $value) {
			$data[$key]['ad_img'] = YICHONG.$value['ad_img'];
		}
		return rData('1','请求成功',$data);
	}

	public function advertdetail(){
		$id = $_GET['id'];
		$content = M('ad')->where('id = "'.$id.'"')->find();
		$this->data = $content;
		$this->display('detail');
	}

    //邀请卡
	public function invite(){
		$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id,user_number')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
		}
		$register_img = $this->register_img($re['user_id'],$re['user_number']);
		$data['qr'] = YICHONG.'/'.$register_img;
		$data['user'] = $re;
		$data['one_count'] = M('personal')->where('recommend = "'.$re['user_id'].'"')->count() ? : 0;
		$data['one_gain'] = M('computing')->where("user_id = {$re['user_id']} and type='sale'")->sum('suanli') ? : 0;

		$data['two_count'] = M('personal')->where('recommend2 = "'.$re['user_id'].'"')->count() ? : 0;
		$data['two_gain'] = M('computing')->where("user_id = {$re['user_id']} and type='sale2'")->sum('suanli') ? : 0;
		return rData('1','请求成功',$data);
	}


	//攻略	
	public function gonglue(){
		$article = M('news n')->where('c.name = "算力攻略"')->field('title,content')->join('pa_category c on c.cid = n.cid')->select();
		$this->art = $article;
		$this->display();

	}

	public function award()
	{
		$award = M('news n')->where('c.name = "奖励规则"')->field('title,content')->join('pa_category c on c.cid = n.cid')->select();
		return rData('1','请求成功',$award);
	}

	//blockworld首页
	public function block(){
		$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
		if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
		}
		$data['totalnumber'] = M('personal')->count();
		$data['num'] = M('personal')->where('user_type != 1')->count();
		$data['big'] =  M('ad')->field('id,ad_link,ad_img')->order('sort desc')->where('position = "blockworld"')->find()?:'';
		$data['big']['ad_img'] = YICHONG.$data['big']['ad_img'];
		$data['banner'] = M('ad')->field('ad_link,ad_img')->order('sort desc')->where('position = "banner"')->select()?:array();
		foreach ($data['banner'] as $key => $value) {
			$data['banner'][$key]['ad_img'] = YICHONG.$value['ad_img'];
		}
		// $notice = M('news n')->where('c.name = "城市公告"')->field('title,id')->join('pa_category c on c.cid = n.cid')->select()?:array();
		$notice = M('news')->field('id,title')->select()?:array();
		// $article = M('news n')->where('c.name = "BlockWorld挖矿简介"')->field('title,id')->join('pa_category c on c.cid = n.cid')->select()?:array();
		// $data['article'] = $article;
		$data['notice'] = $notice;
		$liveset = M('liveset')->find();
    	$data['zec_ratio'] = $liveset['zec_ratio'];
    	$data['zec_usd_rate'] = $liveset['zec_usd_rate'];
    	$data['bow'] = $re['mineral'];
    	$data['suanli'] = $re['suanli'];
    	$data['flowsuanli'] = $re['flowsuanli'];
		return rData('1','请求成功',$data);


	}
	//头条列表
	public function news_list()
	{
		$data = M('news')->field('id,title')->select();
		return rData('1','请求成功',$data);
	}

	//详情页
	public function detail(){
		$id = $_POST['id'];
		$article = M('news')->where('id = "'.$id.'"')->field('id,title,content')->find();

		return rData('1','请求成功',$article);
	}


	//生成datakey
	public function getDatakey(){
		$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id,datakey')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
		}
		if($re['datakey']){
			return rData('1','请求成功',$re['datakey']);
		}
		$key = sha1(rand(1111,9999).time().$re['user_id']);
		$res = M()->execute("update pa_personal set `datakey` = '{$key}' where user_id = {$re['user_id']}");
		if($res){
			return rData('1','请求成功',$key);
		}else{
			return rData('0','请求失败');
		}
	}

	/*
         * 宝石交易
         * method post
    */
    public function multiplayertransaction(){
        
        if(IS_POST){
        	$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id,datakey')->find();
	        if(!$re){
	            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
			}
            $data = M('exchange')->where('states = 1 and state = 2 and userid!="'.$re['user_id'].'"')->order('createtime desc')->field('id,createtime,exnum,exnumber,exprice,userid')->order('createtime desc')->select();
            if(!$data){
            	return rData('2','暂无数据');
            }
            foreach($data as $key => $value){
                $user = M('personal')->where('user_id = "'.$value['userid'].'"')->field('user_nickname')->find();
                $data[$key]['user_nickname']= $user['user_nickname'] ;
            }
            return rData('1','请求成功',$data);
        }else{
            return rData('-1','访问方式错误','');
        }

    }

    //马上兑换详情
    public function immediatelyinfo(){
        /**
         * method post
         * params access_token
         * params exnumber
         */
        $re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        if(!$_POST['exnumber']){
            exit(json_encode(array("state" => '-1',"msg" => '参数错误')));
        }
       $data =  M('exchange')->where('exnumber = "'.$_POST['exnumber'].'" and states = 1 and state = 2')->field('id,exnumber,exnum,userid,exprice,exnum,extype')->find();
       $exchange = M('personal')->where('user_id = "'.$data['userid'].'"')->find();
       $data['userid'] = $exchange['user_nickname'];
        if($data){
    		if($data['extype']==1){
    			$data['extype']='BOW';
    		}else if($data['extype']==2){
    			$data['extype']='算力';
    		}

            $value = [
                'state'=>'1',
                'msg'=>'请求成功',
                'data'=>$data
            ];
        }else{
            $value = [
                'state'=>'2',
                'msg'=>'该商品已兑换结束',
            ];
        }
        exit(json_encode($value));
    }

    // 马上兑换
    public function immediately(){
        /**
         * method post
         * params access_token
         * params exnumber
         * params buynumber
         * params zongjia
         * params applytype
         */
        $re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        if(!$_POST['exnumber'] || !$_POST['buynumber'] || !$_POST['zongjia']){
            exit(json_encode(array("state" => '-1',"msg" => '参数错误',"data" => '1')));
        }
        $exinfo = M("exchange")->where('exnumber = "'.$_POST['exnumber'].'" and state = 2 and states = 1')->find();
        if(!$exinfo){
            exit(json_encode(array("state" => '-1',"msg" => '下架了')));
        }
        if($exinfo['exprice']*$_POST['buynumber'] != $_POST['zongjia']){
            exit(json_encode(array("state" => '-1',"msg" => '参数错误',"data" => '2')));
        }
        if($exinfo['exnum'] < $_POST['buynumber']){
            exit(json_encode(array("state" => '-1',"msg" => '没有那么多了')));
        }
        $applydata = M('apply')->where('beexchangenumber = "'.$exinfo['exnumber'].'" and state = 0')->select();

        if($applydata){
        	foreach ($applydata as $key => $value) {
        		if(time()-$value['createtime']>=3600*24){
        			M()->startTrans();
        			$state['state']=4;
        			$state['stoptime'] = time();
        			$result = M('apply')->where('beexchangenumber = "'.$exinfo['exnumber'].'" and applynumber = "'.$value['applynumber'].'"')->save($state);
        			$result2 = M('exchange')->where('exnumber = "'.$value['beexchangenumber'].'"')->setInc('exnum',$value['applynumbers']);
        			if($result && $result2){
        				M()->commit();
        			}else{
        				M()->rollback();
        			}
        		}
        	}
        }
        M()->startTrans();
        $tmp['exnum'] = $exinfo['exnum']-$_POST['buynumber'];
        if($tmp['exnum'] <= 0 ){
            $tmp['state'] = 0;
            $tmp['states'] = 0;
        }
        $tmp['alreadynum'] = $exinfo['alreadynum']+$_POST['buynumber'];

        $r = M('exchange')->where('id = "'.$exinfo['id'].'"')->save($tmp);

        $data['createtime'] = time();
        $data['applynumber'] = $re['user_id'].substr(time(),-7).substr($_POST['access_token'],-7);
        $data['user_id'] = $re['user_id'];
        $data['exprice'] = $exinfo['exprice'];
        $data['applyzongjia'] = $exinfo['exprice']*$_POST['buynumber'];
        $data['applynumbers'] = $_POST['buynumber'];
        $data['beexchangenumber'] = $exinfo['exnumber'];
        if($_POST['applytype']=='BOW'){
        	$data['applytype']=1;
        }else if($_POST['applytype']=='算力'){
    		$data['applytype']=2;
    	}
        //$data['applytype'] = $_POST['applytype'];
        $res = M('apply')->add($data);
        if($res && $r){
            M()->commit();
            $value = [
                'state'=>'1',
                'msg'=>'请求成功',
            ];
        }else{
            M()->rollback();
            $value = [
                'state'=>'2',
                'msg'=>'请求失败',
            ];
        }
        exit(json_encode($value));
    }

    //兑换申请列表
    /**
         * method post
         * params access_token
         * params state(0待付款 1已付款  2已发货 3已收货（成功）4订单失效（失败）
    */
    public function exchange_apply()
    {
    	$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        if(isset($_POST['state'])){
        	$where['state'] = array('in',rtrim($_POST['state'],','));
        }
        $where['user_id'] = $re['user_id'];
        $data =  M('apply')->where($where)->field('id,applynumber,createtime,exprice,applynumbers,state,beexchangenumber')->order('createtime desc')->select();
        //echo M()->getLastsql();die;
        foreach ($data as $key => $value) {
        	$data[$key]['createtime'] = date('Y-m-d',$value['createtime']);
        }
        if($data){
        	$value = [
                'state'=>'1',
                'msg'=>'请求成功',
                'data'=>$data
            ];
        }else{
        	$value = [
                'state'=>'2',
                'msg'=>'暂无数据',
            ];
        }
        exit(json_encode($value));
    }

    //关于我们主标题列表
    /**
         * method post
         * params access_token
    */
    public function aboutwe_title()
    {
        $aboutwe_title = M('news')->where("cid = 7")->select();
        if($aboutwe_title){
        	exit(json_encode(array("state" => '1',"msg" => '请求成功',"data"=>$aboutwe_title)));
        }
    }

     public function aaa()
	{
		$url="http://www.xjzhh.com";
		$level=3;
		$size=4;
		Vendor('phpqrcode.phpqrcode');
		$errorCorrectionLevel =intval($level) ;//容错级别
		$matrixPointSize = intval($size);//生成图片大小
		//生成二维码图片
		$object = new \QRcode();
		$object->png($url, "Uploads/qrcode/1.png", $errorCorrectionLevel, $matrixPointSize,2);
	}

    public function qrcode($id,$user_number)
	{
		$url="http://wk.wokerr.com/wakuang/wk/register.html?yaoqing=$user_number";
		$level=3;
		$size=3.5;
		Vendor('phpqrcode.phpqrcode');
		$errorCorrectionLevel =intval($level) ;//容错级别
		$matrixPointSize = intval($size);//生成图片大小
		//生成二维码图片
		$object = new \QRcode();
		$object->png($url, "Uploads/qrcode/qrcode_$id.png", $errorCorrectionLevel, $matrixPointSize,1);
	}

	public function register_img($id,$user_number)
	{
		$big_img = M('ad')->where('ad_name="邀请卡大图" and position = "invite"')->find();
		//file_put_contents("/Uploads/qrcode_$id.png",$path_2);
		$this->qrcode($id,$user_number);
		$path_1 = 'http://'.$_SERVER['SERVER_NAME'].$big_img['ad_img'];
		$path_2 = 'http://'.$_SERVER['SERVER_NAME']."/Uploads/qrcode/qrcode_$id.png";
//echo "<img src='$path_2'></img>";die;
		$image_1 = imagecreatefrompng($path_1);
		$image_2 = imagecreatefrompng($path_2);
		$image_3 = imageCreatetruecolor(imagesx($image_1),imagesy($image_1));
		$color = imagecolorallocate($image_3, 255, 255, 255);
		$a=imagefill($image_3, 0, 0, $color);

		$b=imageColorTransparent($image_3, $color);
		$c=imagecopyresampled($image_3,$image_1,0,0,0,0,imagesx($image_1),imagesy($image_1),imagesx($image_1),imagesy($image_1));
		$d=imagecopymerge($image_3,$image_2, 300,525,0,0,imagesx($image_2),imagesy($image_2), 100);
		//将画布保存到指定的gif文件
		// @unlink("qrcode_$id.png");
		// var_dump($a);
		// var_dump($b);
		// var_dump($c);
		// var_dump($d);
		// var_dump($image_2);
		$register_img = "Uploads/register/register_$id.png";
		imagepng($image_3,$register_img);
		return $register_img;
	}

	public function register()
	{
		var_dump(I('get.'));
		$this->display();
	}

	public function Mypay()
    {
        $re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id,user_password,payword')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        $data['Alipay'] = 2;
        $data['WeChat'] = 2;
        $data['Bank'] = 2;
        $data['e_wallet'] = 2;
        if(M('account')->where('user_id = "'.$re['user_id'].'" and account_number_name=1')->find()){
            $data['Alipay'] = 1;
        }
        if(M('account')->where('user_id = "'.$re['user_id'].'" and account_number_name=2')->find()){
            $data['WeChat'] = 1;
        }
        if(M('bankinfo')->where('user_id = "'.$re['user_id'].'"')->find()){
            $data['Bank'] = 1;
        }
        if(M('e_wallet')->where('user_id = "'.$re['user_id'].'"')->find()){
            $data['e_wallet'] = 1;
        }
        exit(json_encode(array("state" => '1',"msg" => '请求成功',"data"=>$data)));
    }
}