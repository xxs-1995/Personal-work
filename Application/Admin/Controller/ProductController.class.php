<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-3
 * Time: 下午2:35
 */
namespace Admin\Controller;
use Think\Controller;
class ProductController extends CommonController {

    public function index() {

        $M = M("Product");
        //过滤
        $s=array('0','1');
        $list = array('0','1');
        $map['status']= array('in',$list);
        // if($title=I('get.title'))$map['title']=array('like',"%{$title}%");
        // if(in_array(I('get.status'),$s))$map['status']=I('get.status');
        // if($cid=I('get.cid'))$map['cid']=$cid;
        // if(in_array(I('get.is_recommend'),$s))$map['is_recommend']=I('get.is_recommend');
        //
        $count = $M->where($map)->count();
        $page = new \Think\Page($count, 20);
        $showPage = $page->show();
        $this->assign("page", $showPage);
        $this->assign("list", D("Product")->listProduct($page->firstRow, $page->listRows,$map));
        $this->assign("catlist", D("Product")->category());
        // print_r($this->list);die;
        $this->display();
    }

    public function category() {
        if (IS_POST) {
            echo json_encode(D("Product")->category());
        } else {
            $this->assign("list", D("Product")->category());
            $this->display();
        }
    }

    public function add() {
        if (IS_POST) {
            $this->checkToken();
            echo json_encode(D("Product")->addProduct());
        } else {
            $this->assign("list", D("Product")->category());
            $this->display();
        }
    }
    
    public function bookadd() {
        if (IS_POST) {
            $file = $_FILES['file_upload'];
            $video = $_FILES['file_video'];
            // print_r($video);die;
            print_r($file);
            die;
        } else {
            
            $this->assign("list", D("Product")->category());
            $this->display();
        }
    }

    public function checkProductTitle() {
        $M = M("Product");
        if(!$_GET['title']){
            echo json_encode(array("status" => 0, "info" => "标题为空"));
        }
        $where = "title='" . I('get.title') . "'";
        if (!empty($_GET['id'])) {
            $where.=" And id !=" . (int) $_GET['id'];
        }
        if(!I('get.title')){
            echo json_encode(array("status" => 0, "info" => "请输入标题"));
        }
        if ($M->where($where)->count() > 0) {
            echo json_encode(array("status" => 0, "info" => "已经存在，请修改标题"));
        } else {
            echo json_encode(array("status" => 1, "info" => "可以使用"));
        }
    }

    public function edit() {
        $M = M("Product");
        if (IS_POST) {
            $this->checkToken();
            echo json_encode(D("Product")->edit());
        } else {
            $info = $M->where("id=" . (int) $_GET['id'])->find();
            if ($info['id'] == '') {
                $this->error("不存在该记录");
            }
                        
            if($info['image_id']){
                $image = M("images");
                $map['id']=array('in',$info['image_id']);
                $img_info = $image->where($map)->order('id asc')->select();
                $this->assign("img_info", $img_info);
            }
            $this->assign("info", $info);
            $this->assign("list", D("Product")->category());
            $this->display("add");
        }
    }

    public function del() {
        if (M("Product")->where("id=" . (int) $_GET['id'])->delete()) {
            echo json_encode(array("status" => 1, "info" =>'删除成功'));
//            echo json_encode(array("status"=>1,"info"=>""));
        } else {
            echo json_encode(array("status" => 0, "info" =>'删除失败，可能是不存在该ID的记录'));
        }
    }
    public function changeAttr(){
        $id=I('get.id');
        $m_news=M("Product");
        $map['id']=$id;
        $is_recommend=$m_news->where($map)->getField('is_recommend');
        $data['is_recommend']=abs($is_recommend-1);
        if($m_news->where($map)->save($data)){
            echo json_encode(array("status" => 1, "info" => '<img src="'.__ROOT__.'/Public/Img/action_'.$data['is_recommend'].'.png" border="0">'));
            //echo '<img src="../Public/Img/action_'.$data['is_recommend'].'.png" border="0">';
            exit;
        }
        return false;
    }

    public function changeStatus(){
        $id=I('get.id');
        $m_news=M("Product");
        $map['id']=$id;
        $status=$m_news->where($map)->getField('status');
        $data['status']=abs($status-1);
        $statusArr = array("待审核", "已发布");
        if($m_news->where($map)->save($data)){
            echo json_encode(array("status" => 1, "info" => $statusArr[$data['status']]));
            //echo '<img src="../Public/Img/action_'.$data['is_recommend'].'.png" border="0">';
            exit;
        }
        return false;
    }
    public function changePhoneStatus(){
        $id=I('get.id');
        $m_news=M("Product");
        $map['id']=$id;
        $status=$m_news->where($map)->getField('wap_display');
        $data['wap_display']=abs($status-1);
        if($m_news->where($map)->save($data)){
            echo json_encode(array("status" => 1, "info" => '<img src="'.__ROOT__.'/Public/Img/iphone-'.$data['wap_display'].'.png" border="0">'));
            //echo '<img src="../Public/Img/action_'.$data['is_recommend'].'.png" border="0">';
            exit;
        }
        return false;
    }

    //商品评论列表
    public function comment_index(){
        $where['obj_id'] = $_GET['id'];
        $where['object'] = ' ';
        $count = M('Comment')->where($where)->count();
        $page = new \Think\Page($count, 20);
        $showPage = $page->show();
        $list = M('Comment')->where($where)->limit($page->firstRow, $page->listRows)->select();
        // dump(M()->getlastsql());die;
        $this->list = $list;
        $this->assign("page", $showPage);
        $this->display();
    }


    //挖矿设置
    public function extension(){
        if(IS_POST){
            $post = $_POST;
            $post['lease_rate'] = $post['lease_rate'] / 100;
            // dump($post);die;
            $res = M('liveset')->save($post);
            if($res){
                $this->success('修改成功',U('extension'));
            }else{
                $this->error('修改失败');
            }
        }else{
            $rate = M('liveset')->find();
            $rate['lease_rate'] =  $rate['lease_rate'] * 100;
            $this->rate = $rate;    
            $this->display();
        } 
    }


    //算力补贴
    public function subsidy(){
        //当天的补贴请款   subsidy_rete算力补贴比率  subsidy_price团队销售金额   subsidy_num下级销售数量
        $condition = M('liveset')->field('subsidy_rete,subsidy_price,subsidy_num,pid')->find();

        //查出当天符合条件的人
        $user = M('personal')->field('user_id,user_nickname,user_tel,recommend')->select();
        foreach($user as $key => $value){
            $child = M('personal')->where('recommend = "'.$value['user_id'].'"')->field('user_id,user_nickname,user_tel')->select();
            if($child){
                //查询销售量
                $union1 = '';
                foreach($child as $v){
                    $union1 .= "select num from pa_orderdetails where uid = {$v[user_id]} and pid in ({$condition['pid']}) union "; 
                }
                $volume = M()->query(substr($union1,0,-6));
                //销量
                $num = 0;
                foreach($volume as $va){
                    $num += $va['num'];
                }
                
                // $list[] = array('up' => $value,'down' => $user);
                //销售矿机的数量
                $user[$key]['qualifications'] = $num; 
            }
        }
        //$a = $this->getteam($user,1);
        //查出矿机团队累积销售
        // foreach ($user as $key => $value) {
            
        //     $team = $this->getteam($user,$value['user_id']);
        //     $union2 = '';
        //     foreach ($team as $k => $v) {
        //         $union2 .= "select `add` from pa_order where user_id = {$v}  union "; 
        //     }
        //     // echo $union2.'-----';
        //     $total = M()->query(substr($union2,0,-6));
        //     $price = 0;
        //     foreach ($total as $ke => $va) {
        //         $price += $va['add']; 
        //     } 
        //     $user[$key]['teamprice'] = $price;
        //     //查找
            
        // }
        //两个条件都符合的取出
        foreach ($user as $key => $value) {
            // && $value['teamprice'] >= $condition['subsidy_price']
            if($value['qualifications'] >= $condition['subsidy_num']){
                //符合条件的人
                $accord[] = $value;
            }else{
                continue;
            }
        }
        $this->accord = $accord;
        $this->display();
    }



    //获取团队的成员  包括当前用户的下级和下级和下级········
    public function getteam($data,$pid){
       //保存
       $arr = array();
       $i=0;
       foreach($data as $k => $v){
            
           if($v['recommend'] == $pid){
            $i++;
               $arr[] = $v;
               $arr[] = $this->getteam($data,$v['user_id']);
           }
       }
       echo $i;
       return $arr;
    }



    // 算力大赛列表
    public function match(){
        $match = M('match')->select();
        // dump($match)
        $this->match = $match;
        $this->display();
    }


    //添加大赛
    public function matchadd(){
        if($_POST){
            $post = $_POST['info']; 
            $res = M('match')->add($post);
            if($res){
                $this->success('添加成功',U('match'));
            }else{
                $this->error('添加失败');
            }
        }else{
            $this->display();
        }
        
    }



    //编辑大赛
    public function matchedit(){
        if(IS_POST){
            $post = $_POST['info'];
            $res = M('match')->save($post);
            if($res){
                $this->success('修改成功',U('match'));
            }else{
                $this->error('修改失败');
            }
        }else{
            $id = $_GET['id'];
            $match = M('match')->where('mid = "'.$id.'"')->find();
            $this->info = $match;
            $this->display();
        }
    }

    //删除大赛
    public function matchdel(){
        $id = $_GET['id'];
        $del = M('match')->where('mid = "'.$id.'"')->delete();
        if($del){
            $this->success('删除成功',U('match'));
        }else{
            $this->error('修改失败');
        }
    }


    // 代理设置
    public function agent(){
        $set = M('liveset')->find();
        if($_GET['type']){
            $where['type'] = $_GET['type'];
        }
        $list = M('agent a')->where($where)->join('pa_personal p on p.user_id = a.user_id')->field('a.*,p.user_nickname')->select(); 
        foreach ($list as $key => $value) {
            switch ($value['type']) {
                case '1':
                    $list[$key]['type'] = '区县代理';
                    break;
                case '2':
                    $list[$key]['type'] = '市级代理';
                    break;
                case '3':
                    $list[$key]['type'] = '省级代理';
                    break;
               
            }
        }
        $this->count = count($list);
        $this->set = $set;
        $this->list = $list;
        $this->type = $_POST['type'];
        $this->display();
        
    }


    //删除代理
    public function delagent(){
        $id = $_GET['id'];
        $del = M('agent')->where('did = "'.$id.'"')->delete();
        if($del){
            $this->success('删除成功',U('agent'));
        }else{
            $this->error('删除失败');
        }
    }


    //添加代理  
    public function agentadd(){
        if($_POST){
            $post = $_POST;
            $user = M('personal')->where('user_tel = "'.$post['info']['tel'].'"')->field('user_id')->find();
            if(!$user){
                $this->error('无此用户');
            }
            if($post['city'] == 0 && $post['county'] == 0 && $post['province'] != 0){
                // 获取省
                $data['address'] = $post['province'];
                $data['type'] = 3;
            }elseif($post['city'] != 0 && $post['county'] == 0){
                //获取市
                $data['address'] = $post['city'];
                $data['type'] = 2;
            }elseif($post['province'] && $post['city'] && $post['county']){
                //获取区县
                $data['address'] = $post['county'];
                $data['type'] = 1;
            }else{
                $this->error('请选择地区');
            }
            $data['createtime'] = time();
            $data['user_id'] = $user['user_id'];
            $same = M('agent')->where('user_id = "'.$user['user_id'].'" and address = "'.$data['address'].'"')->find();
            if($same){
                $this->error('同一地区不能重复申请');
            }
            $address = M('city')->where('id = "'.$data['address'].'"')->field('name')->find();
            $data['address_name'] = $address['name'];
            // print_r($data);
            $res = M('agent')->add($data);
            if($res){
                $this->success('添加成功',U('agent'));
            }else{
                $this->error('添加失败');
            }
        }else{
            $city = M('city')->where('REGION_TYPE = 1')->select();
            $this->province = $city;
            $this->display();
        }

    }

    //获取城市  
    public function getcity(){
        $id = $_POST['id'];
        $city = M('city')->where('PARENT_ID = "'.$id.'"')->select();
        echo json_encode($city);
    }


    //币种列表
    public function biIndex(){
        $price = M('bibi')->select();
        $this->list = $price;
        $this->display();
    }

    //添加币种
    public function createbi(){
        if(IS_POST){
            $post = $_POST['info'];
            
            $bi = M('bibi')->field('sum(rate) rate')->select();
            if(($bi['rate'] + $post['rate']) > 1){
                $this->error('比例之和不能超过1');
            }
            $res = M('bibi')->add($post);

            if($res){
                $this->success('添加成功',U('biIndex'));
            }else{
                $this->errror('添加失败');
            }
        }else{
            $this->display();
        }
    }

    //修改币种
    public function bedit(){
        if(IS_POST){
            $post = $_POST['info'];
            $res = M('bibi')->save($post);
            if($res){
                $this->success('修改成功',U('biIndex'));
            }else{
                $this->errror('修改失败');
            }
        }else{
            $id = $_GET['id'];
            $list = M('bibi')->where('bid = "'.$id.'"')->find();
            $this->info = $list;
            $this->display();
        }
    }


    //删除币种
    public function bdel(){
        $id = $_GET['id'];
        $res = M('bibi')->where('bid = "'.$id.'"')->delete();
        if($res){
            $this->success('删除成功',U('biIndex'));
        }else{
            $this->errror('删除失败');
        }
    }



    //修改交易属性
    public function dealattr(){
        if(IS_POST){
            $post = $_POST;
            // print_r($post);
            $res = M('category')->save($post);
            if($res){
                $this->success('修改成功',U('category'));
            }else{
                $this->errror('修改失败');
            }
        }else{
            $id = $_GET['id'];
            $info = M('category')->where('cid = "'.$id.'"')->find();
            $this->info = $info;
            $this->display();
        }
    }

    public function enterprise()
    {
        $count=M('enterprise')->count();
        $page= new \Think\Page($count,15);
        $show= $page->show();
        $re=M('enterprise')->order('save_time desc')->limit($page->firstRow.','.$page->listRows)->select();
        $this->assign('list',$re);
        $this->assign('page',$show);
        $this->display();
    }

    public function enterprise_add()
    {
        if(IS_POST){
            $id = $_POST['id'];
            $list = M('enterprise')->where("id = {$id}")->find();
            if($_FILES['qr_code']['name']){
                $upload = $this->upload_file('News');
                $_POST['qr_code'] = '/Uploads'.$upload['qr_code']['savepath'].$upload['qr_code']['savename'];
            }else{
                if($id){
                    $_POST['qr_code'] = $list['qr_code'];
                }else{
                    exit(json_encode(array('status'=>'-1','info'=>'请上传二维码图片')));
                }
            }
            $_POST['save_time'] = time();
            if($id){
                unset($_POST['id']);
                $res = M('enterprise')->where("id = {$id}")->save($_POST);
            }else{
                if(!$_POST['pay_code']){
                    if($_FILES['qr_code']['name']){
                        $file = __EMAIL__.$list['qr_code'];
                        @unlink($file);
                    }
                    exit(json_encode(array('status'=>'-1','info'=>'请完善信息')));
                }
                $res = M('enterprise')->add($_POST);
            }
            if($res){
                if($_FILES['qr_code']['name']){
                    $file = __EMAIL__.$list['qr_code'];
                    @unlink($file);
                }
                exit(json_encode(array('status'=>'1','info'=>'编辑成功','url'=>U('Product/enterprise'))));
            }else{
                exit(json_encode(array('status'=>'-1','info'=>'编辑失败')));
            }
        }
        if(IS_GET){
            $id = $_GET['id'];
            if($id){
                $list = M('enterprise')->where("id = {$id}")->find();
                $this->assign('list',$list);
            }
            $type = M('judicial_type')->select();
            $this->assign('type',$type);
            $this->display();
        }
    }
    public function enterprise_del()
    {
        $list = M('enterprise')->where("id = {$_GET['id']}")->find();
        $res = M('enterprise')->delete($_GET['id']);
        if($res){
            $file = __EMAIL__.$list['qr_code'];
            @unlink($file);
            exit(json_encode(array('status'=>'1','info'=>'删除成功','url'=>U('Product/enterprise'))));
        }else{
            exit(json_encode(array('status'=>'-1','info'=>'删除失败')));
        }
    }
}

  