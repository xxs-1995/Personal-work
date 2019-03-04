<?php
namespace Home\Controller;
use Think\Controller;
class LoginController extends Controller {
    /**
     * 注册
     * @return [type] [description]
     */
    public function register() {
        $invitation_code = $_GET['invitation_code'];
        $invitation_code = $_POST['invitation_code'];
        $res_invitation = M('user')->where('invitation_code',$invitation_code)->find();
        // $state = $_POST['state'];
        if(IS_GET){
            if(empty($invitation_code)){
            $value = array(
                "state" => '-1',
                "msg" => '邀请码不能为空',
                "data" => '',
            );
            exit(json_encode($value));
            }else{
                $res_invitation = M('user')->where('invitation_code',$invitation_code)->find();
                if(empty($res_invitation)){
                    $value = array(
                        "state" => '-1',
                        "msg" => '邀请码错误',
                        "data" => '',
                    );
                }else{
                    $value = array( "state" => '1',"msg" => '邀请码正确',"data" => '',);
                }
            }
        }
        if($_POST['tel'] == ''){
            $value = array(
                "state" => '-1',
                "msg" => '电话不能为空！',
                "data" => '',
            );
            exit(json_encode($value));
        }
        if($_POST['password1'] == ''){
            $value = array(
                "state" => '-1',
                "msg" => '密码不能为空！',
                "data" => '',
            );
            exit(json_encode($value));
        }
        if($_POST['password2'] == ''){
            $value = array(
                "state" => '-1',
                "msg" => '确认密码不能为空！',
                "data" => '',
            );
            exit(json_encode($value));
        }
        if($_POST['password1'] != $_POST['password2']){
            $value = array(
                "state" => '-1',
                "msg" => '两次密码不一致',
                "data" => '',
            );
            exit(json_encode($value));
        }
        //判断手机号
        $res_tel = M('user')->where('tel',$_POST['tel'])->find();
        if (!$res_tel) {
            $value = array(
                "state" => '-1',
                "msg" => '手机号已被使用!',
                "data" => $res_tel,
            );
            exit(json_encode($value));
        }
        //生成唯一邀请码
        $my_code = substr(md5(mt_rand(0,9999)),8,16);
        $res_code = M('user')->where('my_code',$my_code)->select();
        if(empty($res_code)){
            $data['my_code'] = $my_code;
        }else{
            $my_code = substr(md5(mt_rand(0,9999)),8,16);
            $data['my_code'] = $my_code;
        }
        $data['tel'] = $_POST['tel'];
        $data['registertime'] = strtotime(date('Y-m-d H:i:s'));
        $data['password'] = md5($_POST['password1']);
        $data['tel'] = $_POST['tel'];

        $str="0123456789QWERTYUIOPASDFGHJKLZXCVBNM1234567890qwertyuiopasdfghjklzxcvbnm";
        $str=substr($data['tel'],7,4).substr(str_shuffle($str),5,6);

        $data['nickname'] = $str;
        $res = M('user')->add($data);
       
        $invitation['user_id'] = $res;
        $invitation['invitation_id'] = $res_invitation['id'];
        $invitation['add_time'] = strtotime(date('Y-m-d H:i:s'));
        $res_user = M('user_invitation')->add($invitation);
  
        if(!empty($res) &&!empty($res_user)){
            $value = array( "state" => '1',"msg" => '注册成功',"data" => $res,);
        }else{
            $value = array( "state" => '-1',"msg" => '注册失败',"data" => $res,);
        }
        exit(json_encode($value));
    }
    /**
     * 分享出去的注册   比较上面不要邀请码 
     * @return [type] [description]
     */
    // public function sregister () {
    // }
    /**
     * 登录
     * Auth:Mr.Hu
     * 2017.11.24
     * @return [type] [description]
     */
    public function login () {
        if(!IS_POST){
            $value = array(
                "state" => '-1',
                "msg" => '请使用post方式',
                "data" => '请使用post方式',
            );
            exit(json_encode($value));
        }
        $password = $_POST['password'];
        $a = md5($password);
        if(!empty($_POST['nickname'])){
            $nickname = $_POST['nickname'];
            $re = M('user')->where('nickname = "'.$nickname.'" and password = "'.$a.'"')->find();
        }else{
            $tel = $_POST['tel'];
            $re = M('user')->where('tel = "'.$tel.'" and password = "'.$a.'"')->find();
        }
        if(!$re){
            $value = array(
                "state" => '-1',
                "msg" => '账号或密码错误',
                "data" => '',
            );
            exit(json_encode($value));
        }else{
            $value = array(
                "state" => '1',
                "msg" => '登录成功！',
                "data" => $re,
            );
        }
        exit(json_encode($value));
    }


   
    //退出登录
    public function logout()
    {
        $re = M('personal')->where('access_token = "'.$_POST['access_token'].'"')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        $data['access_token'] = 'out';
        $res = M('personal')->where("user_id = {$re['user_id']}")->save($data);
        if($res){
            exit(json_encode(array("state" => '1',"msg" => '退出成功')));
        }else{
            exit(json_encode(array("state" => '0',"msg" => '退出失败')));
        }
    }

 //修改密码
    public function editpassword(){
        $tel = $_POST['tel'];
        if(!$_POST['oldpassword'] || !$_POST['newpassword']){
            return rData('-1','参数错误');
        }
        if(md5($_POST['oldpass']) == $re['user_password']){
            $data['user_id'] = $re['user_id'];
            $data['user_password'] = md5($_POST['newpass']);
            if($re['user_password'] == md5($_POST['newpass'])){
                return rData('1','修改成功');
            }
            $res = M('personal')->save($data);
            if($res){
                return rData('1','修改成功');
            }else{
                return rData('0','修改失败');
            }
        }else{
            return rData('0','原密码输入错误');
        }
        break;
        
    }

    function generate_password( $length = 10 ) { 
    // 密码字符集，可任意添加你需要的字符 
    $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'; 
    $password = ''; 
    for ( $i = 0; $i < $length; $i++ ) 
    { 
        // 这里提供两种字符获取方式 
        // 第一种是使用 substr 截取$chars中的任意一位字符； 
        // 第二种是取字符数组 $chars 的任意元素 
        // $password .= substr($chars, mt_rand(0, strlen($chars) – 1), 1); 
        $password .= $chars[ mt_rand(0, strlen($chars) - 1) ]; 
    } 
    return $password; 
    }
    //用户协议
    public function agreement(){
        $res = M('agreement')->where()->getField('agreement');
        rData('1','获取成功',$res);
    }
   
}
