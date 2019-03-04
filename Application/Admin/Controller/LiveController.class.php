<?php
namespace Admin\Controller;
use Think\Controller;
class LiveController extends CommonController {

    //直播比率
    public function index(){
        if(IS_POST){
            $post = $_POST;
            $post['cny'] = $post['cny'] / 100;
            // dump($post);die;
            $res = M('liveset')->save($post);
            if($res){
                $this->success('修改成功',U('index'));
            }else{
                $this->error('修改失败');
            }
        }else{
            $rate = M('liveset')->find();
            $rate['cny'] =  $rate['cny'] * 100;
            $this->rate = $rate;    
            $this->display('giftRate');
        }
    }

    // 看直播
    public function look(){
        // vendor('Live.Aliyun');  
        // $this -> aliLive = new \Aliyun(); 
        $name = $_GET['no'];
        $pull = $this->getPlayUrl($name);
        $this->pull = $pull;
        $this->display();
    }

    //直播协议
    public function about(){
        if(IS_POST){
          $data['agreement'] = $_POST['content'];
          $data['id'] = 1;
          $res = M('liveset')->save($data);
          if($res){
            $this->success('修改成功',U('about'));
          }else{
            $this->error('修改失败');
          }
        }else{
            $info = M('liveset')->find();
            $this->info = $info['agreement'];
            $this->display();
        } 
      }
}