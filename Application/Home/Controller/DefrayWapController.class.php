<?php
namespace Home\Controller;
use Think\Controller;
// 本类由系统自动生成，仅供测试用途
class DefrayWapController extends Controller {
 	public function alipay(){
 		$re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
	    if(!$re){
	        exit(json_encode(array("state" => '-2',"msg" => '请登录',"data" => '')));
	    }
		if ($_POST['WIDtotal_amount']){
			Vendor('alipaywap.aop.AopClient');
			Vendor('alipaywap.aop.request.AlipayTradeWapPayRequest');
		    //商户订单号，商户网站订单系统中唯一订单号，必填
		    $out_trade_no = time().chr(rand(65,90)).rand(0000,9999);
		    $config = C('ALIPAY');
		    //订单名称，必填
		    $subject = "充值";
		    //付款金额，必填
		    $total_amount = $_POST['WIDtotal_amount'];
		    //商品描述，可空
		    $body = "";
		    $list['order_no'] = $out_trade_no;
		    $list['user_id'] = $re['user_id'];
		    $list['state'] = 0;
		    $list['goods_type'] = "recharge";
		    $list['fkmethod'] = "支付宝";
		    $list['createtime'] = time();
		    $list['sum'] = 1;
		    $list['price'] = $total_amount;
		    M('order')->add($list);
		    $aop = new \AopClient ();
			$aop->gatewayUrl = 'https://openapi.alipay.com/gateway.do';
			$aop->appId = '2018032302434399';
			$aop->rsaPrivateKey = 'MIIEogIBAAKCAQEA699fIzv5ZrGy42WUnYRdg8b4+1ecJTt244UGsOlPUpUNw7SrMLViycRFqi1c0LA1v7oDL+kvIJ8WGGVEulelU/WYcjW7QsV9WcteWz3soOt6rRCHdbpverhfLwFIxkdTLzYb8XJTyB84rJG9WgCHrHXW+2uGpDXiy9Gmckk22S8q9tTlFu3ww3YPhjQWeDrgspOr6v8uw/Hfl2Tbg8mJ86QDOSVUp1JUvAWvI9blIptzTB1UT5y6cRvuBsjtdyqQw4PXE/sIEYkVQ0fXKcgZBRwU/XH7hQrtyBuMkAda898gWONYpOaLpXWNHtcXyzBnoCu8RT8uP9UvwWKGxCWPqQIDAQABAoIBAHOzDwTGf3DbS4d1pW+apRBlwm3vrJ0qzQePkhenagx1JtpPvgVXhAy6pP1z4OpQ9RyFzthqhn526qyuyAarxWIov02Og7ueCf3I3xDckDzjJTrNN9UMzXAiDjaNZ7gy9l/bJ9vIm8Y3YmJr3rjON77l0r1jIhlcgVI/FWlL9oaTRky0XsoVVzth15l/5YZyh630fjdoH5cv6Ko0iiAbN53mj+NWp23eKzRI7zfdWKROqcyNJbLHrvpvyr4sjZ1do5a2a/87WfnbmoAiW0DXq3y9FiCVkWcKiKNEQSE/ZBqukPsF0tUl0JekdgFR0OirjaOYTbaHy6kCZlf1ZyytxvECgYEA/XA1YpIvQJJfSlr34NQUduHY+/G3D2pDpaiJJPSGXu/hgcMXfkJb3PFLiBeE2kX9A8S8N4/mnw2154sLnhlUuiaKm0hAncLcnMpQInPr+Kpaa9LlikH3APjGv8FyfJykQnAnAnHQwCqeCNRlAIWXnom6GXdCQCR3hWoqgArE2OUCgYEA7kG11dgY0NHxAf+r3UrU+G+xkWMWxe9A48aiJqGx6NZ2YpRuIAEKfs/g3d2smzmzax2JuUdFAy+93kzbQxqAqXc8HuImgEbXT5kwUJOoWHo5LUYi5ThwcEmaONGafOZX2TCpsALelB1Rrauj/u6JfD1QVJruNEg3IrR04bOYw3UCgYBEM0HqeLRGiB0kgT5bPjcTlssxYWaFu27g0W22iCbwvVTN+pYD4A+gcT6GLO4PXu4raXHM8eh5vNLKsFw7+00VmvGJv/PDgICloLvXyaIilJUoluQ2RHIXzNqPF5ubdPuu9UdKHR6z18QXVDCp50lZ3G48FB+76xROzrcJJdy7EQKBgGQq6ijSpnQ8n4fIltf9mxYr10qZjzx+PxjELO3y8xpB+Bmv77Cy31e7S/3bMbM9CgqRq5JivUf+rWOlilVm8grNX1BYofkyT1levSpTOeag1CMNpqQaG2OJ/jW/IaU7LlnYlK60NiGtReavD86hONor6Pb5AAapCc0kczNkz2f1AoGAfem778XYOtgnnbBJMHlnl2k94pwXNe19QcV09mYOUk6hqDWrs0146YXUsqJx1jcsBTcFnwSY6Zz94/B+rrRE7FdoSKXcVEH8ltVt3ORZ3x/c/yqFzeR3u9CLbUhgjqBKZ6n6833nHypMsYVqZOIMrAEwcRQ2KwRWrICTljCd9g0=';
			$aop->alipayrsaPublicKey = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA699fIzv5ZrGy42WUnYRdg8b4+1ecJTt244UGsOlPUpUNw7SrMLViycRFqi1c0LA1v7oDL+kvIJ8WGGVEulelU/WYcjW7QsV9WcteWz3soOt6rRCHdbpverhfLwFIxkdTLzYb8XJTyB84rJG9WgCHrHXW+2uGpDXiy9Gmckk22S8q9tTlFu3ww3YPhjQWeDrgspOr6v8uw/Hfl2Tbg8mJ86QDOSVUp1JUvAWvI9blIptzTB1UT5y6cRvuBsjtdyqQw4PXE/sIEYkVQ0fXKcgZBRwU/XH7hQrtyBuMkAda898gWONYpOaLpXWNHtcXyzBnoCu8RT8uP9UvwWKGxCWPqQIDAQAB';
			$aop->apiVersion = '1.0';
			$aop->postCharset='UTF-8';
			$aop->format='json';
			$aop->signType='RSA2';
			$request = new \AlipayTradeWapPayRequest (); 
			$request->setBizContent("{" .
									"    \"body\":\"".$body."\"," .
									"    \"subject\":\"".$subject."\"," .
									"    \"out_trade_no\":\"".$out_trade_no."\"," .
									"    \"timeout_express\":\"90m\"," .
									"    \"total_amount\":".$total_amount."," .
									"    \"product_code\":\"QUICK_WAP_WAY\"" .
									"  }");
			$request->setNotifyUrl("http://app.cmepa.com/index.php/Home/DefrayWap/alipay_yb_info"); //异步
			$request->setReturnUrl("http://app.cmepa.com/index.php/Home/DefrayWap/alipay_tb_info");	//同步
			$result = $aop->pageExecute ($request); 
			echo $result;
		}else{
			exit(json_encode(array("state" => '-1',"msg" => '参数错误',"data" => '')));
		}
	}

public function app_zf(){
	// exit(json_encode(['s'=>$_POST['payno']]));
	// print_r($_POST['payno']);die;

        Vendor('alipaywap.aop.AopClient');
        Vendor('alipaywap.aop.request.AlipayTradeAppPayRequest');

        $aop = new \AopClient();
//echo 123;
        $aop->gatewayUrl = "https://openapi.alipay.com/gateway.do";
        $aop->appId = "2018041802577312";
        $aop->rsaPrivateKey = 'MIIEpAIBAAKCAQEAxBL4Q7Wu46d6sICluoQUdvRumM5J/nRWcCGcQ7ND2aIEF6AMkzslm6XVmQf58PAjWfcrugUbkiJXVJ7/6fxi78eGDd+For9a4HCATlBYj5cVk8p0FfsPcpfEVk+Irq5hgbAo7cd6YsL9MMW9EbQDfB7blfqiSi2xTvBuSfPmSyH3D9SDR7rCOW51ozMxB+eEIyYTkWKwIIi8/dsDrEjr//CDIpEGVPgW7akOQvCTnmU7pF3P5LpzS4Ng9xAbZ5+QI1H59JwlN7Q3RmmCFBR1shsiGdCJo7gFBVtYsVnl1Upm0+xyDJQjOpknABBmrfIImK+36y2gMY7IdnIhZXAhYwIDAQABAoIBAQCWtZYKRW4mIidV36yDTt6ECKGx5m5NnZKLIeqAxxvR/oxytFy2FnJzzuX9eHoPTiV+E1SS6TYl/yttKcG/UnWhpJVPuI15aOgrN44HpA5OYGz/alAMTSu0gx8w0HVY/0SHcKYlDnztyL7gbD1FjD5Ze0aBY2K27aQp7vh283gCKsLPHx+XwL5SNcsRlujs1kx993mYdsm7Ho4F4+xwh+yE6GwsVu46YFRYdFk4sJSXX+rLOdKpS/JciGILRlFHiX1IBYWM3o9sZAYnAnhUeGYDPtCseTUiiTR/vYk+ok3OmkABCubj2So8sIhuR3QRuCcgm38bgiGjiPyTntT3sXuRAoGBAOMcj7v+z+I3nbOnz4pmebX3DVwXP4DVjT730n9+GJwTlr6LwyNF6gvtDNSbEnW/bKY7YaOxSX1ZMrKUP0lckKnQD77+O7S9+GVHhi2A6Ywz0exsYxLaM9p3g3zzK+Wdw0pUGd+Hzv7bIvN1qK0ok9lwRrtXevYmRAC4KXVa35aHAoGBAN0DvBHDEP/tYqJ/RFVE7jhs0iaE0V0fawvW15sJcbETkZKjslwqg9wu4h/f5xMl8YdrLWW5LPxeJBbC9w315y9V5bMecUosPxCe7UD2uu7hzBdxeI4NxppVKJX3YoQPMmQ65WLduZM2NmBEpoF7JE5l5iMX4l47k/XVdfMVs7lFAoGAfRjnZ1MlKOMfn6zomcB2fC+4ESjRFuMKaUvSi91mKtpzZ0PO2egR0j3hml5MncUyUKJW1va5ly0ByvHzpjIxkQgFFFwvgRA++XKbSwc+HbcRg5v0OpcshsLcD4BWhqUOxCttEP5am3ETYG1H2xGF1viMTXcTSPCs9oR6eaTzkZMCgYA5L2cw/VTfs09LFjzbBzvQE7AIUWNOgfuTk6IztizZkWOgGoTivgliJitR7f/+/1lQHZYgdNpD7iPOU+HSleacY9BMGTtc4rfqmARxQ6W4e2nwQubbcosJkbEvpFO0Ma5rKqYBf7ctdOB65ihi5jbNpiX2vI5QrX+qIvIi1GGtNQKBgQCZlM5Ffse5dkKDU3SpiV/5irXDc6ZbrZi3PM3yvz51081Yxklq7mlKtrT4mN1bYyvN5/wMuoEyXgR9Px2c76MzkF8H5L4kcDrIEa9J+peWa3VQJMrUr6NTpwQymYhBd44rYi8Xk0o9Iuo7jPfBRU1Erkfe4WTGMB11IppRc7iW5g==';
        $aop->format = "json";
        $aop->charset = "UTF-8";
        $aop->signType = "RSA2";
        $aop->alipayrsaPublicKey = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxBL4Q7Wu46d6sICluoQUdvRumM5J/nRWcCGcQ7ND2aIEF6AMkzslm6XVmQf58PAjWfcrugUbkiJXVJ7/6fxi78eGDd+For9a4HCATlBYj5cVk8p0FfsPcpfEVk+Irq5hgbAo7cd6YsL9MMW9EbQDfB7blfqiSi2xTvBuSfPmSyH3D9SDR7rCOW51ozMxB+eEIyYTkWKwIIi8/dsDrEjr//CDIpEGVPgW7akOQvCTnmU7pF3P5LpzS4Ng9xAbZ5+QI1H59JwlN7Q3RmmCFBR1shsiGdCJo7gFBVtYsVnl1Upm0+xyDJQjOpknABBmrfIImK+36y2gMY7IdnIhZXAhYwIDAQAB
';
//实例化具体API对应的request类,类名称和接口名称对应,当前调用接口名称：alipay.trade.app.pay
        $request = new \AlipayTradeAppPayRequest();
//SDK已经封装掉了公共参数，这里只需要传入业务参数
        $order_Data = M('order')->where('payno',$_GET['payno'])->find();
        // $order_Goods_Data = M('orderdetails')->where('payno',$order_Data['payno'])->field('title')->select();
        // $body = '';
        // foreach ($order_Goods_Data as $key => $value) {
        // 	$body .=$value['title'].',';
        // }
        // exit(json_encode(array('sdk'=>$order_Goods_Data)));
        $bizcontent = [
        		"body" => '矿机',
        		"subject" => '挖矿支付',
        		"timeout_express" => '30m',
        		"total_amount" => '0.01',
        		"product_code" => 'QUICK_MSECURITY_PAY',
        		"out_trade_no" => $_GET['payno']

        ];
// exit(json_encode(array('sdk'=>$_POST['payno'])));

        $request->setNotifyUrl("http://www.yishanjinyu.com//index.php/Home/DefrayWap/app_zf_yb");
        $request->setBizContent($bizcontent);
        //这里和普通的接口调用不同，使用的是sdkExecute
        $result = $aop->sdkExecute($request);
        $r = substr($result,35);
        // $a = 'alipay_sdk=1&'.$r;
        // exit(json_encode($result['biz_content']));
        // $result['body'] = $result['biz_content']['body'];
        // $result['subject'] = $result['biz_content']['subject'];
        // $result['timeout_express'] = $result['biz_content']['timeout_express'];
        // $result['total_amount'] = $result['biz_content']['total_amount'];
        // $result['product_code'] = $result['biz_content']['product_code'];

		exit(json_encode(array('sdk'=>$r)));
    }
    public function app_zf_yb(){

        Vendor('alipaywap.aop.AopClient');
        $aop = new \AopClient();

        $aop->alipayrsaPublicKey = '请填写支付宝公钥，一行字符串';

        $flag = $aop->rsaCheckV1($_POST, NULL, "RSA2");  //验证签名

        if($flag){

            //校验通知数据的正确性

            $out_trade_no = $_POST['out_trade_no'];    //商户订单号

    $trade_no = $_POST['trade_no'];    //支付宝交易号

    $trade_status = $_POST['trade_status'];    //交易状态trade_status

    $total_amount = $_POST['total_amount'];    //订单的实际金额

    $app_id = $_POST['app_id'];

    if($app_id!=$this->config['app_id']) exit('fail');    //验证app_id是否为该商户本身

    //只有交易通知状态为TRADE_SUCCESS或TRADE_FINISHED时，支付宝才会认定为买家付款成功。

    if($trade_status != 'TRADE_FINISHED' && $trade_status != 'TRADE_SUCCESS')

        exit('fail');

    //校验订单的正确性

    if(!empty($out_trade_no)){

        //1、商户需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号；

        //2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额）；

        //3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）。

        //上述1、2、3有任何一个验证不通过，则表明本次通知是异常通知，务必忽略。在上述验证通过后商户必须根据支付宝不同类型的业务通知，正确的进行不同的业务处理，并且过滤重复的通知结果数据。

        //校验成功后在response中返回success，校验失败返回failure

    }

    exit('fail');

}

        echo"fail"; //验证签名失败

    }

	//回调接口  同步
	public function alipay_tb_info () {
		// file_put_contents('alipay_get.txt',print_r($_GET,true));
		Vendor('alipaywap.service.AlipayTradeService');
		$config = C('ALIPAY');
		$arr=$_GET;
		$alipaySevice = new \AlipayTradeService($config); 
		$result = $alipaySevice->check($arr);
		if($result) {
			//验证成功
		    //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表
			//商户订单号
			// $out_trade_no = htmlspecialchars($_GET['out_trade_no']);
			//支付宝交易号
			// $trade_no = htmlspecialchars($_GET['trade_no']);
			// $data['state'] = 1;
			// $data['price'] = $_GET['total_amount'];
			// M('order')->where('order_no = "'.$_GET['out_trade_no'].'"')->save($data);
			// $gai = M('order')->where('order_no = "'.$_GET['out_trade_no'].'"')->find();
			// M('personal')->where('user_id = "'.$gai['user_id'].'"')->setInc('user_jine',$data['price']);
			// echo "验证成功<br />外部订单号：".$out_trade_no;
			echo '<script>location.href="/Web/fukuan.html"</script>';
		}
		else {
		    //验证失败
		    echo "验证失败";
		}
	}


	//回调接口  异步通知
	public function alipay_yb_info () {
		Vendor('alipaywap.service.AlipayTradeService');
		//查找支付宝相关信息
		$config = C('ALIPAY');
		$arr=$_POST;
		$alipaySevice = new \AlipayTradeService($config); 
		$alipaySevice->writeLog(var_export($_POST,true));
		$result = $alipaySevice->check($arr);

		if($result) {
			//验证成功
			//商户订单号
			$out_trade_no = $_POST['out_trade_no'];
			//支付宝交易号
			$trade_no = $_POST['trade_no'];
			//交易状态
			$trade_status = $_POST['trade_status'];
		    if($_POST['trade_status'] == 'TRADE_FINISHED' || $_POST['trade_status'] == 'TRADE_SUCCESS') {
		    	echo "success";
				$data['state'] = 1;
				$data['price'] = $_POST['total_amount'];
				M('order')->where('order_no = "'.$_POST['out_trade_no'].'"')->save($data);
				$gai = M('order')->where('order_no = "'.$_POST['out_trade_no'].'"')->find();
				M('personal')->where('user_id = "'.$gai['user_id'].'"')->setInc('user_jine',$data['price']);
				echo '<script>location.href="/Web/fukuan.html"</script>';
				exit();
		    }
		}else {
		    //验证失败
		    echo "fail";	//请不要修改或删除
		}
	}
}