<?php
namespace Admin\Controller;
use Think\Controller;
// 本类设置项目一些常用信息
class ActivityController extends CommonController {

    /**
    +----------------------------------------------------------
    * 活动管理
    +----------------------------------------------------------
    * Mr.Hu
    */
    // public function index() {
    //     // echo 11;die;
    //     $info = M('activity')->select();
    //     for ($i=0; $i < count($info); $i++) { 
    //         $id = explode(',',$info[$i]['activity_match_judeges']);
    //         $where['user_id'] = array('in',$id);
    //         $info[$i]['activity_match_judeges'] = M('personal')->field('user_nickname')->where($where)->select();
    //     }
    //     $this->assign('info',$info);
    //     $this->display();
    // }
    public function index() {
        $M = M("activity");
        $count = $M->count();
        $page = new \Think\Page($count, 8);
        $showPage = $page->show();
        $info=$M->limit("$page->firstRow, $page->listRows")->order('activity_id desc')->select();
        
        $this->assign("page", $showPage);
        $this->assign('info',$info);
        $this->display();
    }
    /**
    * 
    * 活动管理-比赛
    * 
    */
    public function indexMatch() {
        $info = M('activity')->where("activity_type = '比赛'")->select();
        // print_r($info);die;
        for ($i=0; $i < count($info); $i++) { 
            $id = explode(',',$info[$i]['activity_match_judeges']);
            $where['user_id'] = array('in',$id);
            $info[$i]['activity_match_judeges'] = M('personal')->field('user_nickname')->where($where)->select();
        }
        // print_r($info);die;
        $this->assign("info",$info);
        $this->display();
    }
    /**
    * *活动管理其他
    *  
    */
    public function indexOther() {
        $info = M('activity')->where("activity_type = '其他'")->select();
        // print_r($info);die;
        $this->assign("info",$info);
        $this->display();
    }

    /**
    * 添加比赛
    * 
    */
    public function add() {
        if(IS_POST){
            $post = $_POST;
            // dump($post);die;
            $data['activity_title'] = $post['activity_title'];       
            $data['activity_introduce'] = $post['activity_introduce'];       
            $data['activity_poster'] = $post['activity_poster'];       
            $data['status'] = $post['status'];       
            $data['activity_content'] = $post['activity_content'];       
            $data['createtime'] = time();
            $res = M('activity')->add($data);
            // sql();
            if($res){
                $this->success('添加成功',U('index'));
            }else{
                $this->error('添加失败');
            }
        }else{
            $this->display();
        }
    }

    /**
    * 编辑
    * @return [type] [description]
    * 
    */
    public function edit() {
        if(IS_POST){
            $post = $_POST;
            // dump($post);
            unset($post['createtime']);
            $res = M('activity')->save($post);
            // sql();
            if($res){
                $this->success('修改成功',U('index'));
            }else{
                $this->error('修改失败');
            }

        }else{
            $id = I('get.id');
            $infos = M('activity')->where('activity_id = "'.$id.'"')->find();
            // dump($id);die;
            $this->assign('info',$infos);
            $this->edit = 1;
            $this->display('add');
        }
    }
    /**
    * 删除
    * @return [type] [description]
    * 
    */
    public function delete() {
        $get = I('get.');
        $img = M('activity')->where('activity_id = "'.$get['id'].'"')->select();
        $info = M('activity')->where('activity_id = "'.$get['id'].'"')->delete();
        if($info){
            unlink('.'.$img['activity_poster']);
            $this->success('删除成功！',U('Activity/index'));
        }else{
            $this->error('删除失败！');
        }
    }
    /**
    * 查看活动内容
    * @return [type] [description]
    * 
    */
    public function findMessage() {
        $id = I('get.id');
        $infos = M('activity')->where('activity_id = "'.$id.'"')->find();
        $id = explode(',',$infos['activity_match_judeges']); 
        $where['user_id'] = array('in',$id);
        $info = M('personal')->field('user_id,user_nickname')->where($where)->select();

        $this->assign('infos',$infos);
        $this->assign('info',$info);
        $this->display();
    }
    
}

?>