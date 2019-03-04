<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
	//消息
	// public function news(){
		
 //        return rData('1','请求成功',$data);
 //    }
    //搜索
    public function search(){
    	$name = $_POST['name'];
    	$where['name']=array('like','%'.$name.'%');//写查询条件
    	$data = M('task')->where('$where')->select();
        return rData('1','请求成功',$data);
    }
  	//首页 type 1为限时福利	2热门活动 3新手上路 4其他
    public function index(){
    	$activity_type = $_POST['activity_type'];
    	if(!$type){
    		$data = M('task')->where('activity_type',$activity_type)->select();
    	}	
        return rData('1','请求成功',$data);
    }
	//推荐列表 任务全部有时限
    public function recommendList(){
		$data['task_type'] = M('task')->where('is_recommend = 1')->getField('type_name'); 
		$data['task'] = M('task')->where('task_type',$type)->select();
        return rData('1','请求成功',$data);
    }
    //分类-分类列表
	public function typeList(){
		$type = $_POST['type'];
		if(!empty($type)){
			$data['task_type'] = M('task_type')->where('id asc')->getField('type_name'); 
			$data['task'] = M('task')->where('task_type',$type)->select();
		}else{
			$data['task_type'] = M('task_type')->where('id asc')->getField('type_name'); 
			$data['task'] = M('task')->where('task_type = 1')->select();
		}
        return rData('1','请求成功',$data);
	}
	//分类-任务详情
	public function taskDetail(){
		$id = $_POST['task_id'];
		if(!empty($type)){
			$data = M('task')->where('id',$id)->find();
			$data['img'] = M('task_img')->where('task_id',$id)->select();
        return rData('1','请求成功',$data);
	}
}
	//接取任务
	public function task111(){
		$user_id = I('post.user_id','') ? I('post.user_id','') : rData('-1','未收到用户信息');//商品简述
		$task_id = I('post.task_id','') ? I('post.task_id','') : rData('-1','未收到任务信息');//商品简述
		$data['user_id'] = $user_id;
		$data['task_id'] = $task_id;
		$data['add_time'] = strtotime(date('Y-m-d H:i:s'));
		$link = M('task')->where('id',$task_id)->find($data);
		$res = M('task_user')->save($data);
		if($res){
			rData('1','成功接任务',$link);
		}else{
			rData('-1','接任务失败',$res);
		}
        
	}
	
}