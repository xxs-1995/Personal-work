<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/2
 * Time: 9:40
 */

namespace Home\Controller;


use Think\Controller;
use Think\Controller\jileController;
class TransactionController extends Controller
{
    /**
     * 发起交易_余额
     * method post post方式
     * params access_token 令牌
     */
    public function launch_exchange()
    {
        $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
        if(!$user){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        $data[]=array('type'=>'BOW','num'=>$user['mineral']);
        $data[]=array('type'=>'suanli','num'=>$user['flowsuanli']);
        if($data){
            exit(json_encode(array("state" => '1',"msg" => '请求成功',"data"=>$data)));
        }
    }

    /**
     * 发起交易_提交
     * method post post方式
     * params access_token 令牌
     * params extype 兑换类型
     * params zongshu 可兑换总数量
     * params exnum 需兑换的数量
     * params exprice 单价 物品单价
     */
    public function launch(){

        //用户表查出用户信息
        $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
        if(!$user){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        if($_POST['exnum'] > $_POST['zongshu']){
            $value = [
                'state' => '-1',
                'msg'=>'参数错误',
            ];
            exit(json_encode($value));
        }

        if(!$_POST['zongshu'] || !$_POST['exnum'] || !$_POST['exprice'] || !$_POST['extype']){
            $value = [
                'state' => '-1',
                'msg'=>'参数错误',
            ];
            exit(json_encode($value));
        }

        M()->startTrans();
        if($_POST['extype']==1){
            //减bow mineral
            $r['mineral'] = $user['mineral']-$_POST['exnum'];
            $res = M('personal')->where('user_id = "'.$user['user_id'].'"')->save($r);
        }else if($_POST['extype']==2){
            //减算力 flowsuanli
            $r['flowsuanli'] = $user['flowsuanli']-$_POST['exnum'];
            $res = M('personal')->where('user_id = "'.$user['user_id'].'"')->save($r);
        }
        if(!$res){
            $value = [
                'state' => '0',
                'msg'=>'操作失败',
            ];
            exit(json_encode($value));
        }

        $data = $_POST;
        unset($data['access_token']);
        unset($data['zongshu']);
        $data['userid'] = $user['user_id'];
        $data['createtime'] = time();
        $data['exnumber'] = substr(time(),-7).substr($_POST['access_token'],-5);
        $data['totalnumber'] = $_POST['exnum'];
        $re = M('exchange')->add($data);
        if($re && $res){
            M()->commit();
            $value = [
                'state' => '1',
                'msg'=>'创建成功',
            ];
            exit(json_encode($value));
        }else{
            M()->rollback();
        }
    }
    /**
     * 我的兑换信息
     *method post
     *params access_token
     * params state
     */
    public function myex(){

        //用户表查出用户信息
        $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
        if(!$user){
            exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
        }
        if(!$_POST['state']){
            exit(json_encode(array("state" => '-1',"msg" => '参数错误')));
        }
        switch ($_POST['state']){
            case '1':
                $data = M('exchange')->where('userid="'.$user['user_id'].'" and states!=0')->order('createtime desc')->select();
                break;
            case '2':
                //未兑换
                $data = M('exchange')->where('userid="'.$user['user_id'].'" and exnum > 0 and state = 2 and states = 1')->order('createtime desc')->select();
                break;
            case '3':
                //已兑换
                $data = M('exchange')->where('userid="'.$user['user_id'].'" and exnum <= 0 and state = 3 and states = 0')->order('createtime desc')->select();
                foreach ($data as $key => $value){
                    if($value['alreadynum']==''){
                        $data[$key]['alreadynum']= '0';
                    }
                }
                break;
        }
        foreach ($data as $key => $value){
            if($value['exnum']>0){
                $data[$key]['type'] = 0;
                //  0 取消兑换
            }elseif($value['exnum'] <= 0){
                $data[$key]['type'] = 1;
                //  1 兑换详情
            }
            $data[$key]['createtime'] = date("Y-m-d",$value['createtime']);
        }

        if($data){
            $value = [
                'state' => '1',
                'msg'=>'请求成功',
                'data'=>$data,
            ];
        }else{
            $value = [
                'state' => '2',
                'msg'=>'请求成功',
                'data'=>'没有数据'
            ];
        }

        exit(json_encode($value));
    }

    /**
     *取消兑换（关闭订单)
     *method  post
     *params exnumber 订单号
     *params access_token
     */
    public function cancel(){
        //用户表查出用户信息
        $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
        if(!$user){
            exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
        }
        if(!$_POST['exnumber']){
            $value = [
                'state' => '-1',
                'msg' => '参数错误',
            ];
        }
        if(M('apply')->where('beexchangenumber = "'.$_POST['exnumber'].'" and state = 0 or state=1')->find()){
          exit(json_encode(array("state" => '-1',"msg" => '该交易下有未完成的订单，不可下架')));
        }
        //开启事务
        M()->startTrans();
            $r = M('exchange')->where('userid = "'.$user['user_id'].'" and exnumber = "'.$_POST['exnumber'].'"')->find();
            if($r['extype']==1){
                //加bow mineral 把剩余的加回
                $ex_data['mineral'] = $user['mineral']+$ex_data['exnum'];
                $res = M('personal')->where('user_id = "'.$user['user_id'].'"')->save($ex_data);
            }else if($r['extype']==2){
                //加算力 flowsuanli 把剩余的加回
                $ex_data['flowsuanli'] = $user['flowsuanli']+$r['exnum'];
                $res = M('personal')->where('user_id = "'.$user['user_id'].'"')->save($ex_data);
            }
            $data['states'] = 0;
            $result =  M('exchange')->where('userid = "'.$user['user_id'].'" and exnumber = "'.$_POST['exnumber'].'"')->save($data);
            if($result){
                $value = [
                    'state' => '1',
                    'msg'=>'下架成功',
                ];
            }
        if($result){
            M()->commit();
            exit(json_encode($value));
        }else{
            //echo M()->getLastsql();
            //var_dump($result);
            M()->rollback();
            exit(json_encode(array("state" => '2',"msg" => '操作失败!')));
        }

    }

    /**
     *宝石兑换交易详情
     *method  post
     *params apply_number 订单号
     *params access_token
     */
    public function exchange_apply_info()
    {
        $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
        if(!$user){
            exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
        }
        if(!$_POST['apply_number']){
            exit(json_encode(array("state" => '-1',"msg" => '参数错误')));
        }
        $applydata = M('apply')->where('user_id = "'.$user['user_id'].'" and applynumber = "'.$_POST['apply_number'].'"')->field('applynumbers,applyzongjia,beexchangenumber,state')->find();
        $exdata = M('exchange')->where('exnumber = "'.$applydata['beexchangenumber'].'"')->field('userid,exnum,extype,exprice')->find();
        $userdata = M('personal')->where('user_id = "'.$exdata['userid'].'"')->field('user_nickname')->find();
        $data = array_merge($exdata,$applydata);
        $data['user_nickname'] = $userdata['user_nickname'];
        unset($data['userid']);
        unset($data['beexchangenumber']);
        if($data['extype']==1){
                $data['extype']='BOW';
            }else if($data['extype']==2){
                $data['extype']='算力';
            }
        $value = [
            'state' => '1',
            'msg'=>'请求成功',
            'data'=> $data,
        ];
        exit(json_encode($value));
    }

    /**
     *宝石兑换卖出详情
     *method  post
     *params apply_number 订单号
     *params access_token
     */
    public function exchange_sale_info()
    {
      $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
      if(!$user){
          exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
      }
      if(!$_POST['apply_number']){
          exit(json_encode(array("state" => '-1',"msg" => '参数错误')));
      }
       $applydata = M('apply')->where('applynumber = "'.$_POST['apply_number'].'"')->field('applynumbers,applyzongjia,beexchangenumber,state')->find();
       $exdata = M('exchange')->where('userid = "'.$user['user_id'].'" and exnumber = "'.$applydata['beexchangenumber'].'"')->field('exnum,extype,exprice')->find();
        $data = array_merge($exdata,$applydata);
        $data['user_nickname'] = $user['user_nickname'];
        unset($data['beexchangenumber']);
        if($data['extype']==1){
                $data['extype']='BOW';
            }else if($data['extype']==2){
                $data['extype']='算力';
            }
        $value = [
            'state' => '1',
            'msg'=>'请求成功',
            'data'=> $data,
        ];
        exit(json_encode($value));
    }


    /**
     *宝石兑换交易申请取消
     *method  post
     *params apply_number 订单号
     *params access_token
     */
    public function exchange_apply_cancel()
    {
        $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
        if(!$user){
            exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
        }
        if(!$_POST['apply_number']){
            exit(json_encode(array("state" => '-1',"msg" => '参数错误')));
        }
        $applydata = M('apply')->where('user_id = "'.$user['user_id'].'" and applynumber = "'.$_POST['apply_number'].'"')->field('applynumbers,beexchangenumber')->find();
        
        if ($applydata) {
            M()->startTrans();

            $state['state']=4;
            $state['stoptime']=time();
            $result = M('apply')->where('user_id = "'.$user['user_id'].'" and applynumber = "'.$_POST['apply_number'].'"')->save($state);
            $exdata = M('exchange')->where('exnumber = "'.$applydata['beexchangenumber'].'"')->field('exnum,alreadynum')->find();
            $data['exnum'] = $exdata['exnum']+$applydata['applynumbers'];
            $data['alreadynum'] = $exdata['alreadynum']-$applydata['applynumbers'];
            $exresult = M('exchange')->where('exnumber = "'.$applydata['beexchangenumber'].'"')->save($data);
            if($exresult){
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
        }else{
          exit(json_encode(array("state" => '-1',"msg" => '无此订单')));
        }
    }

     /**
     * 兑换申请确认收货
     * method post
     * params access_token
     * params apply_number 兑换交易单号
    */
   public function Confirmreceipt()
   {
       $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
        if(!$user){
            exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
        }
        if(!$_POST['apply_number']){
            exit(json_encode(array("state" => '-1',"msg" => '参数错误')));
        }
        $applydata = M('apply')->where('applynumber = "'.$_POST['apply_number'].'"')->field('applynumber')->find();
        if($applydata){
            $savedata['state'] = 3;
            $savedata['completetime'] = time();
            $result = M('apply')->where('applynumber = "'.$_POST['apply_number'].'"')->save($savedata);
            if($result){
                $value = [
                    'state' => '1',
                    'msg'=>'操作成功',
                ];
            }else{
                $value = [
                    'state' => '2',
                    'msg'=>'操作失败',
                ];
            }
        }else{
            $value = [
                'state' => '2',
                'msg'=>'无此订单记录',
            ];
        }
        exit(json_encode($value));
   }
    //上传文件
    public function upload(){
        $upload = new \Think\Upload();// 实例化上传类

        $upload->maxSize  = 99999999 ;// 设置附件上传大小
        $upload->exts     = array('jpg', 'gif', 'png', 'jpeg', 'mp3', 'mp4', 'caf' );// 设置附件上传类型
        $upload->autoSub  = true;
        $upload->subName  = msectime;
        $upload->rootPath = "./Uploads/";//文件上传保存的根路径，下面的Upload文件夹放在这里面，./Public/Upload
        $upload->savePath  =  '/'; // 设置附件上传目录，文件上传上来以后放在了这个文件件里面。
        $info   =   $upload->upload();
//		print_r($info);die;
        if(!$info){ // 上传错误提示错误信息
            $this->error($upload->getError());
        }else{// 上传成功 获取上传文件信息
            //return $info;
            foreach($info as $file){
                return '/Uploads'.$file['savepath'].$file['savename'];
            }
        }
    }
    /**
     * 已经支付 上传支付凭证
     * method post
     * params access_token
     * params apply_number 兑换交易单号
     */
   public function alreadyPaid(){
       $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
       if(!$user){
           exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
       }
       if(!$_POST['apply_number']){
           exit(json_encode(array("state" => '-1',"msg" => '参数错误')));
       }
       if(!$_POST['voucher']){
           exit(json_encode(array("state" => '-1',"msg" => '没有上传图片')));
       }
       // $imgpath = $this->upload();
       // if($imgpath){
       //  $data['voucher_path'] = $imgpath;
       // }
          $base64 = $_POST["voucher"]; // 得到参数
            $img = base64_decode($base64); // 将格式为base64的字符串解码
            $path = uniqid(rand()).".png"; // 产生随机唯一的名字作为文件名
            if(!file_exists('./Uploads/Upload/msectime/'.date('Y-m-d',time()))){ 
                mkdir('./Uploads/Upload/msectime/'.date('Y-m-d',time()));
            };
            file_put_contents('./Uploads/Upload/msectime/'.date('Y-m-d',time()).'/'.$path,$img); // 将图片保存到相应位置
            // fclose('./Uploads/My/'.date('Y-m-d',time()).'/'.$path);
            if(file_exists('./Uploads/Upload/msectime/'.date('Y-m-d',time()).'/'.$path)){
                $data['voucher_path'] = '/Uploads/Upload/msectime/'.date('Y-m-d',time()).'/'.$path;
            }
       $data['user_id'] = $user['user_id'];
       $data['createtime'] = time();
       $data['apply_number'] = $_POST['apply_number'];
       $data['type'] = 1;
       $res = M('voucher')->add($data);
       $params['state'] = 1;
       $r = M('apply')->where('user_id = "'.$user['user_id'].'" and applynumber = "'.$_POST['apply_number'].'"')->save($params);
       if($res && $r){
           exit(json_encode(array("state" => '1',"msg" => '上传成功')));
       }else{
           exit(json_encode(array("state" => '2',"msg" => '上传失败')));
       }
   }
    //卖出
   public function maichu(){
       $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
       if(!$user){
           exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
       }
       $exnumber = M('exchange')->where('userid = "'.$user['user_id'].'"')->field('exnumber')->select();
//        print_r($exnumber);die;
       foreach ($exnumber as $kye => $value){
          $info[] =  M('apply')->where('beexchangenumber = "'.$value['exnumber'].'" and state = 3')->select();

       }

       if($info){
           exit(json_encode(array("state" => '1',"msg" => '请求成功',"data" => $info)));
       }else{
           exit(json_encode(array("state" => '2',"msg" => '请求成功')));
       }
   }

    /*
    *失败/成功 买入
    * method post
    * params access_token
    * params type 1成功 2失败
    */
   public function Buylist(){
       $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
       if(!$user){
           exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
       }
       if($_POST['type']==1){
            $where['state'] = 3;
       }
       if($_POST['type']==2){
            $where['state'] = 4;
       }
       $where['user_id'] = $user['user_id'];
       if(!$_POST['type']){
        $where['_string'] = 'state=3 OR state=4';
        $list = M('apply')->where($where)->order('createtime desc')->select();
      }else{
        $list = M('apply')->where($where)->order('createtime desc')->select();
      }
       
//echo M()->getLastsql();die;
       if($list){
           exit(json_encode(array("state" => '1',"msg" => '请求成功',"data" => $list)));
       }else{
           exit(json_encode(array("state" => '2',"msg" => '暂无数据')));
       }

   }
    /*失败/成功 卖出
    * method post
    * params access_token
    * params type 1成功 2失败
   */
   public function failSell(){
       $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
       if(!$user){
           exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
       }
       

       $exnumber = M('exchange')->where('userid = "'.$user['user_id'].'"')->field('exnumber')->select();
       if(!$_POST['type']){
        foreach ($exnumber as $key => $value){
          $where['beexchangenumber'] = $value['exnumber'];
          $where['_string'] = 'state=3 OR state=4';
          $failsell[] =  M('apply')->where($where)->order('createtime desc')->select();
        }
       }else{
        if($_POST['type'] == 1){
           $where['state'] = 3;
       }
       if($_POST['type'] == 2){
           $where['state'] = 4;
       }
        foreach ($exnumber as $key => $value){
          $where['beexchangenumber'] = $value['exnumber'];
          $failsell[] =  M('apply')->where($where)->order('createtime desc')->select();
        }
       }
       
      
       foreach ($failsell as $key => $value){
           if(!$value){
               unset($failsell[$key]);
           }
       }
       //var_dump($failsell);die;
       foreach ($failsell as $key => $value) {
          foreach ($value as $k => $v) {
            $data[]=$v;
          }
       }
       if($data){
           exit(json_encode(array("state" => '1',"msg" => '请求成功',"data" => $data)));
       }else{
           exit(json_encode(array("state" => '2',"msg" => '暂无数据')));
       }

   }

   /*
    卖出列表
    post
    access_token 
    state 0待付款列表 1确认付款列表
    */
   public function exchange_apply_sale()
   {
        $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
       if(!$user){
           exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
       }
       $exnumber = M('exchange')->where('userid = "'.$user['user_id'].'"')->order('createtime desc')->field('exnumber')->select();
       //var_dump($exnumber);die;
       if(isset($_POST['state'])){
        foreach ($exnumber as $key => $value){
        // $where['state'] = array('in',rtrim($_POST['state'],','));
        // $where['beexchangenumber'] = $value['exnumber'];
          $failsell[] =  M('apply')->where('beexchangenumber = "'.$value['exnumber'].'" and state = "'.$_POST['state'].'"')->order('createtime desc')->select();
        }
       }else{
          foreach ($exnumber as $key => $value){
          // $where['state'] = array('in',rtrim($_POST['state'],','));
          // $where['beexchangenumber'] = $value['exnumber'];
            $failsell[] =  M('apply')->where('beexchangenumber = "'.$value['exnumber'].'"')->order('createtime desc')->select();
          }
       }
       
       //var_dump($failsell);die;
       foreach ($failsell as $key => $value){
           if(!$value){
               unset($failsell[$key]);
           }
       }
       foreach ($failsell as $key => $value) {
        foreach ($value as $k => $v) {
          $data[]=$v;
        }
         
       }
       foreach ($data as $key => $value) {
         $data[$key]['createtime'] = date("Y-m-d",$value['createtime']);
       }
       // var_dump($failsell);die;
       if($data){
           exit(json_encode(array("state" => '1',"msg" => '请求成功',"data" => $data)));
       }else{
           exit(json_encode(array("state" => '2',"msg" => '暂无数据')));
       }

   }

   /*
    卖出确认收款详情
    method post
    access_token
    apply_number
    */
    public function paid_sale_info()
    {
        $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
        if(!$user){
            exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
        }
        if(!$_POST['apply_number']){
            exit(json_encode(array("state" => '-1',"msg" => '参数错误')));
        }
        
        $applydata = M('apply')->where('applynumber = "'.$_POST['apply_number'].'" and state = 1')->field('applynumbers,applyzongjia,beexchangenumber')->find();
        $exdata = M('exchange')->where('exnumber = "'.$applydata['beexchangenumber'].'"')->field('userid,exnum,extype,exprice')->find();
        $userdata = M('personal')->where('user_id = "'.$exdata['userid'].'"')->field('user_nickname')->find();
        $data = array_merge($exdata,$applydata);
        $data['user_nickname'] = $userdata['user_nickname'];
        $voucher = M('voucher')->where('apply_number = "'.$_POST['apply_number'].'"')->field('voucher_path')->find();
        $data['voucher'] = 'http://'. $_SERVER['HTTP_HOST'].$voucher['voucher_path'];
        unset($data['userid']);
        unset($data['beexchangenumber']);
        if($data['extype']==1){
                $data['extype']='BOW';
            }else if($data['extype']==2){
                $data['extype']='算力';
            }
        $value = [
            'state' => '1',
            'msg'=>'请求成功',
            'data'=> $data,
        ];
        exit(json_encode($value));
    }

    /*
      卖出 确认收款
     */
    public function confirm_receipt()
    {
        $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
        if(!$user){
            exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
        }
        $applydata = M('apply')->where('applynumber = "'.$_POST['apply_number'].'"')->field('applynumbers,applyzongjia,applytype,user_id')->find();
        M()->startTrans();
        if($applydata['applytype']==1){
          $re = M('personal')->where('user_id = "'.$applydata['user_id'].'"')->setInc('mineral',$applydata['applynumbers']);
        }
        if($applydata['applytype']==2){
          M('personal')->where('user_id = "'.$applydata['user_id'].'"')->setInc('suanli',$applydata['applynumbers']);
          $re = M('personal')->where('user_id = "'.$applydata['user_id'].'"')->setInc('flowsuanli',$applydata['applynumbers']);
        }
        //echo M()->getLastsql();
        $data['state'] = 2;
        $re2 = M('apply')->where('applynumber = "'.$_POST['apply_number'].'"')->save($data);
        if($re && $re2){
          M()->commit();
          $value = [
            'state' => '1',
            'msg'=>'请求成功',
          ];
        }else{
          // var_dump($re);
          // var_dump($re2);
          M()->rollback();
          $value = [
            'state' => '2',
            'msg'=>'请求失败',
          ];
        }
        exit(json_encode($value));
    }

   /*
    投诉
    * method post
    * params access_token
    * params apply_number 兑换订单号
    * params content 投诉内容
    * params complain_img 投诉截图
    * params title 投诉标题
    */
   public function complain()
   {
       $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
       if(!$user){
           exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
       }
       if(!$_POST['apply_number'] || !$_POST['complain_img'] || !$_POST['title'] || !$_POST['content']){
           exit(json_encode(array("state" => '-1',"msg" => '请上传投诉所需的内容、图片、标题、单号！')));
       }
       if(!M('apply')->where('user_id = "'.$user['user_id'].'" and applynumber = "'.$_POST['apply_number'].'"')->find()){
          exit(json_encode(array("state" => '-1',"msg" => '无此订单号！')));
       }

       $base64 = $_POST["complain_img"]; // 得到参数
            $img = base64_decode($base64); // 将格式为base64的字符串解码
            $path = uniqid(rand()).".png"; // 产生随机唯一的名字作为文件名
            if(!file_exists('./Uploads/complain/'.date('Y-m-d',time()))){ 
                mkdir('./Uploads/complain/'.date('Y-m-d',time()));
            };
            file_put_contents('./Uploads/complain/'.date('Y-m-d',time()).'/'.$path,$img); // 将图片保存到相应位置
            // fclose('./Uploads/My/'.date('Y-m-d',time()).'/'.$path);
            if(file_exists('./Uploads/complain/'.date('Y-m-d',time()).'/'.$path)){
                $data['complain_img'] = '/Uploads/complain/'.date('Y-m-d',time()).'/'.$path;
            }

       $data['complain_number'] = generate_password(8);
       $data['user_id'] = $user['user_id'];
       $data['apply_number'] = $_POST['apply_number'];
       $data['content'] = $_POST['content'];
       $data['createtime'] = time();
       $data['title'] = $_POST['title'];
       if(M('complain')->add($data)){
          exit(json_encode(array("state" => '1',"msg" => '申请成功,请等待处理')));
       }else{
          exit(json_encode(array("state" => '-1',"msg" => '申请失败')));
       }
   }

   /*
    * 买家投诉列表
    * method post
    * params access_token
    */
   public function complain_list()
   {
       $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
       if(!$user){
           exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
       }
       $complain = M('complain')->where('user_id = "'.$user['user_id'].'"')->order('createtime desc')->field('complain_number,apply_number,title,createtime')->select();
       foreach ($complain as $key => $value) {
         $complain[$key]['createtime'] = date("Y-m-d",$value['createtime']);
       }
       if($complain){
        exit(json_encode(array("state" => '1',"msg" => '请求成功',"data"=>$complain)));
       }else{
        exit(json_encode(array("state" => '-1',"msg" => '暂无数据')));
       }
   }

   /*
      买家投诉详情
    * method post
    * params access_token
    * params complain_number
    */
   public function complain_info()
   {
     $user = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
     if(!$user){
         exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
     }
     if(!$_POST['complain_number']){
         exit(json_encode(array("state" => '-1',"msg" => '请上传投诉编号')));
     }
     $complain = M('complain')->where('user_id = "'.$user['user_id'].'" and complain_number = "'.$_POST['complain_number'].'"')->find();
     if(!$complain){
         exit(json_encode(array("state" => '-1',"msg" => '暂无此数据')));
     }
     if($complain['state']==0){
      $complain['state_msg']='待处理';
     }else if($complain['state']==1){
      $complain['state_msg']='申诉成功';
     }else if($complain['state']==2){
      $complain['state_msg']='申诉失败';
     }
     $complain['createtime'] = date("Y-m-d",$complain['createtime']);
     $complain['complain_img'] = 'http://'. $_SERVER['HTTP_HOST'].$complain['complain_img'];
     if($complain){
        exit(json_encode(array("state" => '1',"msg" => '请求成功',"data"=>$complain)));
       }else{
        exit(json_encode(array("state" => '-1',"msg" => '暂无数据')));
       }
   }

   /*
    * 商家详情
    * method post
    * params access_token
    * params exnumber 订单号
    */
   public function merchant()
   {
      $re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
       if(!$re){
           exit(json_encode(array("state" => '-2',"msg" => '请登录后操作！')));
       }
      $user_id = M('exchange')->where('exnumber = "'.$_POST['exnumber'].'"')->find();
      if(!$user_id){
           exit(json_encode(array("state" => '-1',"msg" => '暂无信息')));
      }
      
      $user_id = $user_id['userid'];
      $user = M('personal')->where('user_id = "'.$user_id.'"')->field('user_nickname,user_img,user_registertime')->find();
      $user['user_img'] = 'http://'. $_SERVER['HTTP_HOST'].$user['user_img'];
      $user['user_registertime'] = date("Y-m-d",$user['user_registertime']);
      $exchange = M('exchange')->where('userid = "'.$user_id.'"')->select();
      $succeed_all = 0;
      $fail_all = 0;
      $thirty_all = 0;
      $diff_time = time()-60*60*24*30;
      foreach ($exchange as $key => $value) {
        $succeed_all += M('apply')->where('state=3 and beexchangenumber = "'.$value['exnumber'].'"')->count();
        $fail_all += M('apply')->where('state=4 and beexchangenumber = "'.$value['exnumber'].'"')->count();
        $thirty_all += M('apply')->where('state=3 and beexchangenumber = "'.$value['exnumber'].'" and createtime>'.$diff_time.'')->count();
        $apply[]=M('apply')->where('beexchangenumber = "'.$value['exnumber'].'"')->field('applynumber')->select();
      }
      $finish_prob = number_format($succeed_all/($succeed_all+$fail_all),2)*100;
      $finish_prob.= '%';
      foreach ($apply as $key => $value) {
        foreach ($value as $k => $v) {
          $data[]=$v;
        }
      }
      $succeed_complain=0;
      foreach ($data as $key => $value) {
        $complain += M('complain')->where('apply_number = "'.$value['applynumber'].'"')->count();
        $succeed_complain += M('complain')->where('apply_number = "'.$value['applynumber'].'" and state=2')->count();
      }
      
      $user['succeed_all'] = $succeed_all;
      $user['thirty_all'] = $thirty_all;
      $user['finish_prob'] = $finish_prob;
      $user['complain'] = $complain;
      $user['succeed_complain'] = $succeed_complain;
      $exchange_data = M('exchange')->where('userid = "'.$user_id.'" and state = 2 and states = 1')->field('exnum,extype,exnumber,exprice')->select();
      foreach ($exchange_data as $key => $value) {
        if($value['extype']==1){
          $exchange_data[$key]['extype'] = 'BOW';
        }
        if($value['extype']==2){
          $exchange_data[$key]['extype'] = '算力';
        }
      }
      $user['exchange'] = $exchange_data;
      exit(json_encode(array("state" => '1',"msg" => '请求成功',"data"=>$user)));
   }

   /**
      * 支付宝账号 或微信账号 列表
      * method post
      * params type 1支付宝  2微信
      * params access_token
    */
    public function AccountNumberlist()
    {
        $re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id,user_password,payword')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        if(!$_POST['type']){
            exit(json_encode(array("state" => '-1',"msg" => '参数错误')));
        }
        $account = M('account')->where('account_number_name = "'.$_POST['type'].'" and user_id = "'.$re['user_id'].'"')->select();
        foreach ($account as $key => $value) {
          $account[$key]['createtime'] = date("Y-m-d",$value['createtime']);
        }
        if($account){
            exit(json_encode(array("state" => '1',"msg" => '请求成功',"data"=>$account)));
        }else{
            exit(json_encode(array("state" => '-1',"msg" => '暂无账户信息')));
        }
    }
}