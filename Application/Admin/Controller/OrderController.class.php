<?php  
/*
订单管理
 */
namespace Admin\Controller;
use Think\Controller;
class OrderController extends CommonController{
    //唯一字符串
    function unique_name()
        {
            // return md5(uniqid(mt_rand(), true));
            $uniqid = md5(uniqid(microtime(true),true));
            echo $uniqid;
        }

	public function index(){
		$M = M("order o");
		if($_GET['order_no']){
			$where['o.payno'] = array('LIKE','%'.$_GET['order_no'].'%');
		}
        if($_GET['user_id']){
            $where['o.uid'] = $_GET['user_id'];
        }
        switch ($_GET['time']) {
            case '1':
                $where['createtime']  = array('gt',strtotime(date("Y-m-d",time())));
                break;
            case '2':
                $timestr = time();
                $now_day = date('w',$timestr)-1;
                $where['createtime']  = array('gt',strtotime(date('Y-m-d',$timestr-$now_day*60*60*24)));
                break;
            case '3':
                $where['createtime']  = array('gt',strtotime(date("Y-m-01",time())));
                break;
        }
        $count = $M->where($where)->count();
        //import("ORG.Util.Page");       //载入分页类
        $page = new \Think\Page($count, 12);
        $showPage = $page->show();
        $list= $M->join('pa_personal p on p.user_id = o.uid')->field('o.*,p.user_nickname')->where($where)->limit("$page->firstRow, $page->listRows")->order('createtime desc')->select();
        // echo M()->getLastsql();die;
        // print_r($list);die;
        $this->assign("page", $showPage);
        $this->assign("list",$list);
        $this->display();
	}

    public function export()
    {
        switch ($_POST['time']){
            case '1':
                $where['createtime']  = array('gt',strtotime(date("Y-m-d",time())));
                break;
            case '2':
                $timestr = time();
                $now_day = date('w',$timestr)-1;
                $where['createtime']  = array('gt',strtotime(date('Y-m-d',$timestr-$now_day*60*60*24)));
                break;
            case '3':
                $where['createtime']  = array('gt',strtotime(date("Y-m-01",time())));
                break;
        }
        if($_POST['starttime'] && $_POST['endtime']){
            if($_POST['starttime'] > $_POST['endtime']){
                exit(json_encode(['state'=>-1,'msg'=>'日期选择错误']));
            }
            $where['createtime']  = array('between',"{$_POST['starttime']},{$_POST['endtime']}");
        }
        if($_POST['user_id']){
            $where['o.uid'] = $_POST['user_id'];
        }
        $data= M('order o')->join('pa_personal p on p.user_id = o.uid')->field('o.id,o.payno,o.createtime,o.price,o.zt,p.user_nickname')->where($where)->order('createtime desc')->select();        
        foreach ($data as $key => $value) {
            $data[$key]['createtime'] = date("Y-m-d H:i:s",$value['createtime']);
            switch ($value['zt']) {
                case '0':
                    $data[$key]['zt'] = '待支付';
                    break;
                
                case '1':
                    $data[$key]['zt'] = '已支付';
                    break;
            }
        }
        $key = ['订单ID','订单号','下单时间','订单应付金额','订单状态','收货人'];
        export_Excel($data,$key, '订单');
        die;
        // exportExcel($key,$data, '订单', './', true);
        // if($a){
        //     exit(json_encode(['state'=>1,'msg'=>'导出EXCEL成功']));
        // }else{
        //     exit(json_encode(['state'=>0,'msg'=>'导出EXCEL失败']));
        // }
    }

	//订单假删除
	public function hidden(){
		$id = I('get.id');
		$data['id'] = $id;
		$data['display'] = '0';
		$res = M('Order')->save($data);
		if($res){
			$this->success('删除成功',U('index'));
		}else{
			$this->error('删除失败');
		}
	}

	//清空订单
	public function delete(){
		$id = I('get.id');
		$res = M('Order')->delete($id);
		if($res){
			$this->success('删除成功',U('index'));
		}else{
			$this->error('删除失败');
		}
	}


	//查看信息
	public function see(){
        if(IS_POST){
            $m_member=M('Order');
            $data=$_POST['info'];
            $id=I('post.id');
            $map['id']=$id;
            if($m_member->where($map)->save(['zt'=>$data['zt']])){
                echo json_encode(array("status" => 1, "info" => "修改订单成功",'url'=>U('Order/index')));
                exit;
            }else{
                sql();
                echo json_encode(array("status" => 0, "info" => "修改订单失败"));
                exit;
            }
        }else{
            $id=I('get.id');
            $m_member=M('Order');
            $map['id']=$id;
            $info=$m_member->where($map)->find();
            switch ($info['pay_type']) {
                case '1':
                    $info['pay_type'] = '余额';
                    break;
                case '3':
                    $info['pay_type'] = 'ZEC';
                    break;
                default:
                    $info['pay_type'] = '未支付';
                    break;
            }
            $info['createtime'] = date('Y-m-d H:i:s',$info['createtime']);
            if($info['fk_time']){
                $info['fk_time'] = date('Y-m-d H:i:s',$info['fk_time']);
            }else{
                $info['fk_time'] = '';
            }
            $sh_msg = M('address')->where('id = "'.$info['shmsg_id'].'"')->find();
            $info['sh_name'] = $sh_msg['name'];
            $info['sh_phone'] = $sh_msg['phone'];
            $info['address'] = $sh_msg['address'];
            $info['orderdea'] = M('orderdetails')->field('id,pid,num,title,shoujia')->where('payno = "'.$info['payno'].'"')->select();
            $m = 1;
            for ($i=0; $i < count($info['orderdea']); $i++) { 
                $pro = M('product')->where('id = "'.$info['orderdea'][$i]['pid'].'"')->field('image_id')->find() ?: "";
                $where1['id'] = array('in',$pro['image_id']);
                $img = M('images')->where($where1)->select() ?: array();

                $info['orderdea'][$i]['img_url'] = $img[0]['savepath']? 'http://'.$_SERVER['HTTP_HOST'].$img[0]['savepath'] : "";
                $info['orderdea'][$i]['m'] = $m;
                $m++;
            }
            $this->assign('info',$info);
            $this->display();
        }
	}
}

?>