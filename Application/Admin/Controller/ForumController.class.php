<?php
namespace Admin\Controller;
use Think\Controller;
// 本类设置项目一些常用信息
class ForumController extends CommonController {
    public function index(){
        $count = M('forum')->count();
        $page = new \Think\Page($count,15);
        $showPage = $page->show();
        $list = M('forum')->order('forum_time desc')->limit($page->firstRow, $page->listRows)->select();

        $statusArr = array("审核状态", "已发布状态");
        foreach ($list as $key => &$value) {
            switch ($value['forum_usertype']) {
                case 'personal':
                    $name = M('personal')->field('user_nickname')->where('user_id = "'.$value['forum_userid'].'"')->find();
                    $value['name'] = $name['user_nickname'];
                    break;
                case 'admin':
                    $name = M('admin')->where('aid = "'.$value['forum_userid'].'"')->find();
                    $value['name'] = $name['nickname'];
                    break;
            }
            // if($value['forum_usertype'] == 'personal'){
            // }
            $value['forum_status'] = $statusArr[$value['forum_status']];
        }
        $tag = M('tag')->where('tag_pid = 26')->select();
        $this->tag = $tag;
        $this->list = $list;
        $this->assign("page", $showPage);
        $this->display('article_index');
    }
    //文章列表
    public function article_index(){
        $count = M('forum')->count();
        $page = new \Think\Page($count,15);
        $showPage = $page->show();
        $list = M('forum')->order('forum_time desc')->limit($page->firstRow, $page->listRows)->select();

        $statusArr = array("审核状态", "已发布状态");
        foreach ($list as $key => &$value) {
            switch ($value['forum_usertype']) {
                case 'personal':
                    $name = M('personal')->field('user_nickname')->where('user_id = "'.$value['forum_userid'].'"')->find();
                    $value['name'] = $name['user_nickname'];
                    break;
                case 'admin':
                    $name = M('admin')->where('aid = "'.$value['forum_userid'].'"')->find();
                    $value['name'] = $name['nickname'];
                    break;
            }
            // if($value['forum_usertype'] == 'personal'){
            // }
            $value['forum_status'] = $statusArr[$value['forum_status']];
        }
        $tag = M('tag')->where('tag_pid = 26')->select();
        $this->tag = $tag;
        $this->list = $list;
        $this->assign("page", $showPage);
        $this->display();
    }

    //文章添加
    public function article_add(){
        if(IS_POST){
            $post['forum_type'] = 'article';
            $post['forum_userid'] = $_SESSION['my_info']['aid'];
            $post['forum_usertype'] = 'admin';
            $post['forum_time'] = time();
            // $post['forum_category'] = $tag;
            $post['forum_category'] = $_POST['forum_category'];
            $post['forum_title'] = $_POST['forum_title'];
           /* $content = explode("\r\n",trim($_POST['forum_content']));
            foreach ($content as $key => $value) {
                $content[$key] = array('text'=>$content[$key]);
            }
            foreach ($_POST['image_1'] as $key => $value) {
                if($value){
                    array_push($content, array('picture'=> $value));
                }
            }

            $post['forum_content'] = json_encode($content,JSON_UNESCAPED_UNICODE);*/
            // $pic = strstr($post['forum_content'],'<img style="width:100%"');
            // if (!$pic) {
            //     $post['forum_content'] = str_replace('<img', '<img style="width:100%"', $_POST['forum_content']);
            // }
            // $embed = strstr($post['forum_content'],'<embed style="width:100%"');
            // if (!$embed) {
            //     $post['forum_content'] = str_replace('<embed', '<embed style="width:100%"', $_POST['forum_content']);
            // }
            $post['forum_content'] = $_POST['forum_content'];
            $res = M('forum')->add($post);
            // M()->execute("INSERT INTO `pa_forum` (`forum_type`,`forum_userid`,`forum_usertype`,`forum_time`,`forum_category`,`forum_title`,`forum_content`,`forum_lead`) VALUES ('article',1,'admin',1513862080,'','12312 ','$post[forum_content]')");
            // echo M()->getLastsql();die;
            if($res){   
                $this->success('添加成功',U('article_index'));
            }else{
                $this->error('添加失败');
            }
        }else{
            $this->display();
        }
    }
    //文章修改
    public function article_edit(){
        if(IS_POST){
            // dump($_POST);die
            $post = $_POST;
            // $pic = strstr($post['forum_content'],'<img style="width:100%"');
            // if (!$pic) {
            //     $post['forum_content'] = str_replace('<img', '<img style="width:100%"', $post['forum_content']);
            // }
            // $embed = strstr($post['forum_content'],'<embed style="width:100%"');
            // if (!$embed) {
            //     $post['forum_content'] = str_replace('<embed', '<embed style="width:100%"', $post['forum_content']);
            // }
            // $content = $post['forum_content'];
            $images = $post['image_1'];
            unset($post['image_1']);
            // unset($post['forum_content']);
            // $post['forum_time'] = time();
            /*$content = explode("\r\n",trim($_POST['forum_content']));
            foreach ($content as $key => $value) {
                $content[$key] = array('text'=>$content[$key]);
            }
            foreach ($images as $key => $value) {
                if($value){
                    array_push($content, array('picture'=> $value));
                }
            }

            $post['forum_content'] = json_encode($content,JSON_UNESCAPED_UNICODE);*/
            // dump($post);die;
            $res = M('forum')->save($post);
            // echo M()->getLastsql();die;
            if($res){
                $this->success('修改成功',U('article_index'));
            }else{
                $this->error('修改失败');
            }
         }else{
            $content = '';
            $id = $_GET['id'];
            $usertype = $_GET['usertype'];
            $info = M('forum')->where('forum_id = "'.$id.'"')->find();
            // $info['forum_content'] = json_decode($info['forum_content'],true);
            // foreach ($info['forum_content'] as $key => $value) {
            //     foreach ($value as $k => $v) {
            //         if($k == 'text'){
            //             $content .= $v."\r\n";
            //         }
            //         if($k == 'picture'){
            //             $img_info[]['savepath'] = $v;
            //         }
            //     }
            // }
            // $info['forum_content'] = $content;
            $tag = M('tag')->where('tag_pid = 26')->select();
            if(is_array($img_info)){
                $this->img_info = $img_info;
            }

            // dump($info);
            $this->info = $info;
            $this->tag = $tag;
            $this->display();
        }
    }
    //文章删除
    public function article_del(){
        $delid = $_GET['id'];
        $delete = M('forum')->where('forum_id = "'.$delid.'"')->delete();
        if($delete){
            $img = M('picarr')->field('picarr_img_url')->where('picarr_type = "article" and picarr_typeid = "'.$delid.'"')->select();
            foreach ($img as $key => $value) {
                @unlink('.'.$value['picarr_img_url']);
            }
            M('picarr')->where('picarr_type = "article" and picarr_typeid = "'.$delid.'"')->delete();
            $this->success('删除成功',U('article_index'));
        }else{
            $this->error('删除失败');
        }
    }

    //文章推荐
    public function changeAttr(){
        $id=I('get.id');
        $m_news=M("forum");
        $map['forum_id']=$id;
        $is_recommend=$m_news->where($map)->getField('forum_recommend');
        $data['forum_recommend']=abs($is_recommend-1);
        if($m_news->where($map)->save($data)){
            echo json_encode(array("status" => 1, "info" => '<img src="'.__ROOT__.'/Public/Img/action_'.$data['forum_recommend'].'.png" border="0">'));
            exit;
        }
        return false;
    }
    //文章状态
    public function changeStatus(){
        $id=I('get.id');
        $m_news=M("forum");
        $map['forum_id']=$id;
        $status=$m_news->where($map)->getField('forum_status');
        $data['forum_status']=abs($status-1);
        $statusArr = array("待审核", "已发布");
        if($m_news->where($map)->save($data)){
            echo json_encode(array("status" => 1, "info" => $statusArr[$data['forum_status']]));
            //echo '<img src="../Public/Img/action_'.$data['is_recommend'].'.png" border="0">';
            exit;
        }
        return false;
    }


  


    public function upload()
    {
        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize   =     31457280 ;// 设置附件上传大小
        $upload->exts      =     array('xls','jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
        $upload->autoSub  = true;
        $upload->subName  = array('date','Y-m-d');
        $upload->rootPath = "./Uploads/";//文件上传保存的根路径，下面的Upload文件夹放在这里面，./Public/Upload
        $upload->savePath  =      '/institution/'; // 设置附件上传目录，文件上传上来以后放在了这个文件件里面。
        $info   =   $upload->upload();
        if(!$info) // 上传错误提示错误信息
        {
            $this->error($upload->getError());
        }
        else// 上传成功 获取上传文件信息
        {
            foreach($info as $file){        
            return '/Uploads'.$file['savepath'].$file['savename'];    
            }
        }
    }
}

?>