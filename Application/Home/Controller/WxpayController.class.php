<?php
//微信支付
namespace Home\Controller;
use Think\Controller;
class WxpayController extends Controller{
    protected  $userid;
    // public function __construct()
    // {
    //     if($_SERVER['PATH_INFO'] != 'Wxpay/notify'){
    //         if(!$_POST){
    //             return returnData('-1','请求错误');
    //         }
    //         if(!$_POST['access_token']){
    //             return returnData('-2','请登录');
    //         }
    //         $re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
    //         if(!$re){
    //              return returnData('-2','请登录');
    //         }
    //         $this->userid = $re['user_id'];    
    //     }
        
    // }  

    /**
     * 析构流函数
     */
    public function  index() {   
        file_put_contents('wx.txt', print_r($_REQUEST,TRUE));
    }    

    //扫码支付
    public function pay(){
        Vendor('Weixinpay.Weixinpay');
        $time=time();
        $order=array(
            'body'=>'test',
            'total_fee'=>1,
            'out_trade_no'=>strval($time),
            'product_id'=>1,
            'trade_type'=>'NATIVE',
            );
        $weixinpay=new \Weixinpay();
        $weixinpay->pay($order);

    }
//

    // 统一下单  APP MWEB NATIVE
    public function mobliePay(){
        Vendor('Weixinpay.Weixinpay');
        if(!$_POST['total_fee'] || !$_POST['trade_type'] ){
            return returnData('-1','参数错误');
        }
        $order = $_POST;
        // return returnData('-1','请求错误',$order);
        $order['body'] = '充值';
        $order['product_id'] = '62';
        $order['out_trade_no'] = chr(rand(65,90)).time().rand(0000,9999);
        //添加到订单
        $data['order_no'] = $order['out_trade_no'];
        $data['user_id'] = $this->userid;
        $data['createtime'] = time();
        $data['display'] = 1;
        $data['sum'] = 1;
        $data['fkmethod'] = '微信';
        $data['state'] = 0;
        $data['goods_type'] = 'recharge';
        $data['price'] = $_POST['total_fee'] / 100;
        M('order')->add($data);
        // echo M()->getlastsql();die;
        unset($order['access_token']);
        $weixinpay=new \Weixinpay();
        $api = $weixinpay->unifiedOrder($order);
        exit(json_encode($api));
    }

    //app支付
    public function test(){        
        Vendor('Weixinpay.Wxwap');
        // $re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->field('user_id')->find();
        // if(!$re){
        //     return returnData('-2','请登录');
        // }
        if(!$_POST['payno'] ){
            return returnData('-1','参数错误');
        }
        $order_Data = M('order')->where("payno = '{$_POST['payno']}'")->field('price')->find();
        $order = array('payno'=>$_POST['payno'],'jine'=>'0.01');
        // $data['payno'] = $order['payno'];
        // $data['uid'] = $POST['uid'];
        // $data['createtime'] = time();
        // $data['display'] = 1;
        // $data['sum'] = 1;
        // $data['fkmethod'] = '微信';
        // $data['state'] = 0;
        // $data['order_type'] = 'shop';
        // $data['price'] = $_POST['total_fee'];
        // M('order')->add($data);
        $Wxwap = new \Wxwap();
        $wx = $Wxwap->wxpay($order,'APP');
        exit(json_encode($wx));
    }
    /**
     * notify_url接收页面
     */
    public function notify(){
        // 导入微信支付sdk
        Vendor('Weixinpay.Weixinpay');
        $wxpay=new \Weixinpay();
        $result=$wxpay->notify();
        if ($result) {
            // 验证成功 修改数据库的订单状态等 $result['out_trade_no']为订单号
            // file_put_contents('wx.txt',print_r($result,true));
            M()->startTrans();
            $data['state'] = 1;
            $res = M('order')->where('order_no = "'.$result['out_trade_no'].'"')->save($data);
            $user = M('order')->where('order_no = "'.$result['out_trade_no'].'"')->find();
            $re = M('personal')->where('user_id = "'.$user['user_id'].'"')->setInc('user_jine',$user['price']);
            if($res && $re){
                M()->commit();
                echo "1";
            }else{
                M()->rollback();
                echo "0";
            }
        }
    }

    //微信支付成功
    public function wx_info () {
        //接受参数,修改状态
        $xml = file_get_contents('php://input');
        $arr = json_decode(json_encode(simplexml_load_string($xml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
         file_put_contents('wx.txt',print_r($arr,true));
        //file_put_contents('3.txt',$arr['total_fee']);
        //用户http_build_query()将数据转成URL键值对形式
        $sign = http_build_query($arr);
        //md5处理
        $sign = md5($sign);
        //转大写
        $sign = strtoupper($sign);
        //验签名。默认支持MD5
        //file_put_contents('6.txt',$sign);
        $panjin = M('order')->where('payno = "'.$arr['out_trade_no'].'"')->find();
        if ('SUCCESS' == $arr['return_code'] && $panjin['id'] != '' && $arr['appid'] == 'wx33715f77a6554167') {

            $data['xianje'] = $arr['total_fee']/100;
            $data['jine'] = $arr['total_fee']/100;
            M('order')->where('payno = "'.$arr['out_trade_no'].'"')->save($data);
            
            $shuliang = M('orderdetails')->where('payno = "'.$arr['out_trade_no'].'"')->select();
            for($i=0;$i<count($shuliang);$i++){
                M('commodity')->where('id = "'.$shuliang[$i]['pid'].'"')->setInc('shuliang',-$shuliang[$i]['num']);
            }
            //校验返回的订单金额是否与商户侧的订单金额一致。修改订单表中的支付状态。
        }
        $return = ['return_code'=>'SUCCESS','return_msg'=>'OK'];
        $xml = '<xml>';
        foreach($return as $k=>$v){
            $xml.='<'.$k.'><![CDATA['.$v.']]></'.$k.'>';
        }
        $xml.='</xml>';
        echo $xml;
        exit();
    }


    
}
?>
