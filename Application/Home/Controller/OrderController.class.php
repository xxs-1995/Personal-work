<?php
namespace Home\Controller;
use Think\Controller;
class OrderController extends Controller{

    //排行榜
    public function order (){
        $user = M('user')->where('real_income_num desc')->select();
        rData('1','请求成功',$user);
    }
}
?>