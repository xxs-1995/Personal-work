<?php
// 本类由系统自动生成，仅供测试用途
   /**
     * 会员信息
     * @少上造
     * 2018年11月5日
     */
namespace Home\Controller;
use Think\Controller;
class MyController extends Controller {
    //个人中心
    public function userInfo () {
        $re = M('user')->where('user_id',$_POST['user_id'])->field('id,head_pic,tel,nickname')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        return rData('1','请求成功',$re);
    }
    //会员详情页
    public function getUserInfo () {
        //获取用户信息
        if(IS_GET){ 
            $user_id = I('user_id','');
            $user = M('user')->where('user_id',$user_id)->find(); 
            rData('-1','成功',$user); 
        }
        //修改
        if(IS_POST){
            //用户资料
            $user_id = I('user_id','');
            $img = I('post.head_pic');
            if(!empty($user_id)){
                $img_url = M('users')->where('user_id',$user_id)->field('head_pic')->find();
                if($img == $img_url['head_pic']){
                    $data['head_pic'] =  $img;
                }else{
                    $img = $this->base64_upload($img);
                    $data['head_pic'] =  $img;
                }
                $res = M('user')->where('user_id',$user_id)->save($data);
            }else{
                rData('1','没有用户ID',$user_id);
            }
            if(!empty($res)){
                rData('1','修改成功');
            }else{
                rData('-1','修改成功');                    
            }
        }
    }
    //实名认证 状态 0 未认证 1 审核中 2 审核通过
    public function userAuth()
    {
        //获取手机号
        if(IS_GET){ 
            $user_id = I('user_id','');
            $mobile = M('user')->where('user_id',$user_id)->getField('mobile');
            $res = M('user')->where('user_id',$user_id)->field('is_auth,is_vip')->find();
            if($res['is_vip'] == 1){
                if($res['is_auth'] == 0){
                    rData('1','请求成功',$mobile);
                }elseif($res == 1){
                    rData('2','认证审核中，请耐心等待');
                }else{
                    rData('3','已认证，无法再次认证');
                } 
            }else{
                rData('-1','请先成为会员');
            }
        }
        //认证
        if(IS_POST){
            //用户资料
            $user_id = I('user_id','');
            //店铺资料
            $data['addtime'] = date("Y-m-d h:i:sa");//住址;//时间
            Db::startTrans();
            try{
                if(!empty($user_id)){
                    $map['is_auth'] = 1;
                    $res = M('auth')->add($data);
                    $state = M('user')->where('user_id',$user_id)->save($map);
                    // 提交事务  
                }
                Db::commit();
                if(!empty($res) && !empty($state)){
                    rData('1','申请成功');
                }
            } catch (\Exception $e) {
                var_dump($res);
                var_dump($state);
                Db::rollback();
                rData('-1','发布失败');
            }
            
        }
     
    } 
    /*我的任务列表
    ** 状态 全部 无 进行中 1 待审核 2 未通过 3 未完成(放弃) 0
    */
     public function taskList(){
        $user_id = $_POST['user_id'];
        $task_state = $_POST['state'];
        if($task_state !='0' && $task_state !='1' && $task_state !='2' && $task_state !='3'){
            $map['user_id'] = $user_id;
            $map['task_state'] = $task_state;
            $res= M('task_user')->order('add_time desc')->where($map)->select();
            $task = array_count_values($res);
            foreach ($task as $key => $value) {
                $task_list = M('task')->order('add_time desc')->where('task_id',$value['task_id'])->find();
            }
        }else{
            if ($type == 1){
                    $order = 'g.on_time';
                }elseif ($type == 2){
                    $order = 'g.shop_price';
                }elseif ($type == 3){
                    $order = 'is_hot';
            }
            $goods_List = M('goods')
                ->alias('g')
                ->join('user_shop gs','gs.id = g.shop_id')
                ->where("g.is_state = 2 and examine = 1 and g.is_on_sale = 1 and g.market_id ='$market'")//and market_id = '$market'
                ->field('g.goods_id,g.goods_name,gs.shop_name,g.shop_price,original_img,label_id,g.on_time,g.spec,g.unit_id')
                ->order($goods_id.' desc')
                ->select();
        }
     }
    //上传任务凭证
    public function taskVoucher(){
        $user_id = I('post.user_id','') ? I('post.user_id','') : rData('-1','未收到用户信息');//商品简述
        $task_id = I('post.task_id','') ? I('post.task_id','') : rData('-1','未收到任务ID');//商品简述
        $user_id = I('post.user_id','') ? I('post.user_id','') : rData('-1','未收到备注');//商品简述
        $voucher_img = I('post.voucher_img','') ? I('post.voucher_img','') : rData('-1','未收到图片');//商品简述
        //图片处理
        $img_url = explode(',',rtrim($voucher_img,','));
        foreach ($img_url as $key => $value){
            $img = $this->base64_upload($value);
            $PostImgData[] = ['img'=>$img];
        }
        $img = array_column($PostImgData, 'img');
        $img = implode(",", $img);
        $data['voucher_img'] = $img;
        $data['user_id'] = $_POST['user_id'];
        $data['task_id'] = $_POST['task_id'];
        $data['user_id'] = $_POST['user_id'];
        $data['task_id'] = $_POST['task_id'];
        $re = $postadd = Db::name('circle_post')->add($data);

    }
    //放弃任务选项
    public function giveUpList()
    {
        $res = M('give_up')->field('reason')->select();
        rData('1','请求成功',$re['reason']);
    }
    //放弃任务
    public function giveUpTask()
    {
        $user_id = $_POST['user_id'];
        $task_id = $_POST['task_id'];
        $reason = $_POST['reason'];
        if($user_id !='' && $task_id !='' && $reason !=''){
            $map['user_id'] = $user_id;
            $map['task_id'] = $task_id;
            $map['reason'] = $reason;
            $map['task_state'] = 1;
            $data['task_state'] = 0;
            $data['last_time'] = strtotime(date('Y-m-d H:i:s'));
            $res = M('task_user')->where($map)->save($data);
            if($res){
                rData('1','放弃成功',$res);
            }else{
                rData('0','放弃失败',$res);
            }
        }
    }
     //我的邀请好友
    public function friend(){
        $user_id = $_POST['user_id'];
        $res = M('user')->where('invitation_id',$user_id)->field('user_id')->select();
        $count = M('user')->where('invitation_id',$user_id)->field('user_id')->count();
        foreach ($res as $key => $value) {
            $user = M('user')->where('id',$value['user_id'])->field('nickname,tel,head_pic,registertime')->find();
            $level = M('user_level')->where('id',$user['level'])->field('level_name')->find();
            $user['level'] = $level['level_name'];
            $data[$key][] = $user;
        }
        return rData('1','请求成功',$data);
    }
    //我的VIP好友 数量 
    public function vipFriend(){
        $user_id = $_POST['user_id'];
        $res = M('user')->where('invitation_id',$user_id)->field('user_id')->select();
        $count = M('user')->where('invitation_id',$user_id)->field('user_id')->count();
        foreach ($res as $key => $value) {
            $user = M('user')->where('id',$value['user_id'])->field('nickname,tel,wx_number,level,head_pic,')->find();
            $level = M('user_level')->where('id',$user['level'])->field('level_name')->find();
            $user['level'] = $level['level_name'];
            if($user['is_vip'] == 1){
                $data[$key][] = $user;
            }
        }
        $data['count'] = $count;
        rData('1','请求成功',$data);
    }
    //邀请码
    public function invitation()
    {
        $user_id = $_POST['user_id'];
        $res = M('user_invitation')->where('id',$user_id)->select();
        return rData('1','请求成功',$re['my_code']);
    }
    //常见问题
    public function problem()
    {
        $data = M('problem')->select();
        return rData('1','请求成功',$data);
    }
    //修改密码
    public function editPassword()
    {
        $user_id = $_POST['user_id'];
        $oldpassword = $_POST['oldpassword'];
        $password1 = $_POST['password1'];
        $password2 = $_POST['password2'];
        $res = M('user')->where('user_id',$user_id)->find();
        if($res[password] == md5($oldpassword)){
            if($res['password'] == $oldpassword){
                if($password1 == $password2){
                    $map['password'] = $password1;
                    $state = M('user')->where('user_id',$user_id)->save($map);
                    if($state){
                        rData('1','修改成功',$data);
                    }else{
                        rData('-1','修改失败',$data);
                    }
                    rData('1','请求成功',$data);
                }else{
                    rData('1','请求成功',$data);
                }
            }
        }else{
            rData('1','原密码错误',$res);
        }
    }

   
    //图片上传方法
    public function base64_upload($base64)
    {
        //$base64 = $_POST["voucher"]; // 得到参数
        $img = base64_decode($base64); // 将格式为base64的字符串解码
        $path = uniqid(rand()).".png"; // 产生随机唯一的名字作为文件名
        if(!file_exists('./public/Uploads/My/'.date('Y-m-d',time()))){ 
            mkdir('./public/Uploads/My/'.date('Y-m-d',time()));
        };
        file_put_contents('./public/Uploads/My/'.date('Y-m-d',time()).'/'.$path,$img); // 将图片保存到相应位置
        // fclose('./Uploads/My/'.date('Y-m-d',time()).'/'.$path);
        if(file_exists('./public/Uploads/My/'.date('Y-m-d',time()).'/'.$path)){
            $result = '/public/Uploads/My/'.date('Y-m-d',time()).'/'.$path;
        }
        return $result;
    }
    //客服 返回微信和QQ
    public function kefu()
    {
        $type = $_POST['type'];
        $data =  M('kefu')->where('type',$type)->select();
        return rData('-1','请求成功',$data);
      
    }
    //关于我们
    public function about()
    {
        $id = $_POST['id'];
        $data = M('about')->where('id',$id)->find();
        if($data){
            exit(json_encode(array("state" => '1',"msg" => '成功','data'=>$data)));
        }else{
            exit(json_encode(array("state" => '1',"msg" => '成功','data'=>$data)));
        }
    }

    //我的反馈
    public function feedback()
    {
        $re = M('user')->where('id = "'.$_POST['user_id'].'"')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        $where['user_id'] = $re['user_id'];
        $data = M('help')->where($where)->select();
        if(!empty ($data)){
            return rData('1','请求成功',$data);
        }else{
            return rData('-1','请求成功');
        }
        exit(json_encode(array("state" => '1',"msg" => '成功','data'=>$data)));
    }
    //意见反馈
    public function feedback_add()
    {
        $re = M('uesr')->where('id = "'.$_POST['user_id'].'"')->find();
        if(!$re){
            exit(json_encode(array("state" => '-2',"msg" => '请登录')));
        }
        $data = $_POST;
        $data['createtime'] = date("Y-m-d h:i:sa");
        $data['user_id'] = $re['user_id'];
        $res = M('help')->add($data);
        if($res){
            exit(json_encode(array("state" => '1',"msg" => '反馈成功')));
        }else{
            exit(json_encode(array("state" => '-1',"msg" => '反馈失败')));
        }
    }
    //意见反馈详情
    public function feedback_detail()
    {
        $data = M('help')->where("help_id = {$_POST['help_id']}")->find();
        if(!$data){
            exit(json_encode(array("state" => '-1',"msg" => '无此记录')));
        }else{
            
            exit(json_encode(array("state" => '1',"msg" => '成功','data'=>$data)));
        }
    }
}