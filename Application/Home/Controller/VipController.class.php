<?php
namespace Home\Controller;
use Think\Controller;
class VipController extends Controller {
	public function test(){
		//邀请码(唯一)
			$str="0123456789QWERTYUIOPASDFGHJKLZXCVBNM1234567890qwertyuiopasdfghjklzxcvbnm";
			$tel = '18525425721';
			$str=substr($tel,7,4).substr(str_shuffle($str),5,6);
		//订单号(唯一)
		//时间戳(int)
		strtotime(date('Y-m-d H:i:s'));
		rData('1','原密码错误',$str);
	}
	
	//我的钱包
    public function wallet(){
    	$user_id = $_POST['user_id'];
        $re = M('user')->where('id',$_POST['user_id'])->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        if(empty($re['is_vip'])){
        	$user = M('user')->where('user_id',$_POST['user_id'])->find();
            exit(json_encode(array("state" => '-1',"msg" => '不是会员','data'=>$user)));
        }else{
        	$day = strtotime(date('Y-m-d'));
			$last_day = strtotime(date('Y-m-d',strtotime('+1 day')));
			$month = strtotime(date('Y-m'));
			$last_month = strtotime(date('Y-m',strtotime('+1 month')));
			
        	//预计收入 算接任务的时间
        	$res['expect_day'] = M('bill')-> where("add_time < '$last_day' and add_time >'$day' and state = 0 and state = 2 and user_id = '$user_id'")->sum('amount');
        	$res['expect_month'] = M('bill')-> where("add_time < '$last_month' and add_time >'$month' and state = 0 and state = 2")->sum('amount');
        	$res['expect_num'] = M('bill')-> where("state = 0 and state = 2 and user_id = '$user_id'")->sum('amount');
        	//实际收入 收入 算通过时间
        	$res['actual_day'] = M('bill')->where("state = 1 and user_id = '$user_id' and modify_time > '$day' and modify_time < '$last_day'")->sum('amount');
        	$res['actual_month'] = M('bill')->where("state = 1 and user_id = '$user_id' and modify_time > '$month' and modify_time < '$last_month'")->sum('amount');
        	$res['actual_num'] = M('bill')->where("state = 1 and user_id = '$user_id' ")->sum('amount');
        	//好友数
        	$res['uesr_num'] = M('distribution')->where('superior_id',$user_id)->count();
        	$user = M('user')->where('id',$user_id)->find();
        	$res['user'] = $user;
        	exit(json_encode(array("state" => '-1',"msg" => '请登录','data'=>$res)));
        }
    }
    //充值会员
    public function recharge(){
    	rData('1','充值成功',$data);
    }
    //提现申请
    public function show(){
    	$user_id = I('post.user_id','') ? I('post.user_id','') : rData('-1','未收到用户信息');//商品简述
    	$amount = I('post.amount','') ? I('post.amount','') : rData('-1','未收到提现金额');//商品简述
    	$pay_type = I('post.pay_type','') ? I('post.pay_type','') : rData('-1','未收到支付类型');//支付类别 1为支付宝 2为微信
    	$createtime = strtotime(date('Y-m-d H:i:s'));
    	$applynumber = md5(uniqid(microtime(true),true));
    	$data['user_id'] = $user_id;
    	$data['amount'] = $amount;
    	$data['pay_type'] = $pay_type;
    	$data['createtime'] = $createtime;
    	$data['applynumber'] = $applynumber;
    	$balance = M('user')->where('user_id',$user_id)->field('balance')->select();
    	if($balance > $amount){
	    	$res = M('apply')->add($data);
	    	if(!empty($res)){
	    		rData('1','申请成功',$data);
	    	}else{
	    		rData('-1','申请失败',$data);
	    	}
	    }else{
	    	rData('-2','提现金额超出余额',$data);
	    }
    }
    //我的提现列表-历史账单
    public function show_list()
    {
        $user_id = I('post.user_id','') ? I('post.user_id','') : rData('-1','未收到用户信息');//商品简述
        $type = $_POST['type'];//type: 1为提现中 2为提现失败 3提现成功
        if($type !='0' && $type !='1' && $type !='2' && $type !='3'){
            $res= M('apply')->where('user_id',$user_id)->select();
        }else{
            if ($type == 1){
                    $map['user_id'] = $user_id;
                    $map['state'] = 0;
                }elseif ($type == 2){
                    $map['user_id'] = $user_id;
                    $map['state'] = 2;
                }elseif ($type == 3){
                   	$map['user_id'] = $user_id;
                    $map['state'] = 1;
            }
            $res= M('apply')->where($map)->select();
        }
        if($res){
        	rData('1','成功',$res);
        }else{
        	rData('-1','失败',$res);
        }
        
    }
    //我的入账记录
    public function with_list()
    {
        $user_id = I('post.user_id','') ? I('post.user_id','') : rData('-1','未收到用户信息');//商品简述
        $type = $_POST['type'];//type: 1为提现中 2为提现失败 3提现成功
        if($type !='0' && $type !='1' && $type !='2' && $type !='3'){
            $res= M('apply')->where('user_id',$user_id)->select();
        }else{
            if ($type == 1){
                    $map['user_id'] = $user_id;
                    $map['state'] = 0;
                }elseif ($type == 2){
                    $map['user_id'] = $user_id;
                    $map['state'] = 2;
                }elseif ($type == 3){
                   	$map['user_id'] = $user_id;
                    $map['state'] = 1;
            }
            $res= M('apply')->where($map)->select();;
        }
        if($res){
        	rData('1','成功',$res);
        }else{
        	rData('-1','失败',$res);
        }
    }
   
       
}