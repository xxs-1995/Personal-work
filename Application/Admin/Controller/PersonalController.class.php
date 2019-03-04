<?php
namespace Admin\Controller;
use Think\Controller;
// 本类设置项目一些常用信息
class PersonalController extends CommonController {
    //测试  
   public function test() {
    $user = M('user_level')->select();
    $user['aaaa'] = 555;
    var_dump($user);
    }
  public function index() {
    if($_GET['keyword']){
      $where = "user_number like '%{$_GET['keyword']}%' or usselecter_tel like '%{$_GET['keyword']}%'";
    }
    $M = M("user");
    $count = $M->where($where)->count();
    $page = new \Think\Page($count, 8);
    $showPage = $page->show();
    $info=$M->limit("$page->firstRow, $page->listRows")->where($where)->select();
    foreach ($info as $key => $value) {
      $info[$key]['rem_count'] = M('user')->where('recommend = "'.$value['user_id'].'"')->count();
      if($value['recommend']){
        $user = M('user')->where('user_id = "'.$value['recommend'].'"')->field('user_nickname')->find();
        $info[$key]['recommend'] = $user['user_nickname'];
      }
    }
    $this->assign("page", $showPage);
    $this->assign('info',$info);
    $this->display();
  }
  //认证信息
   public function recommend() {
    if($_GET['keyword']){
      $where = "mobile like '%{$_GET['keyword']}%' or user_tel like '%{$_GET['keyword']}%'";
    }
    $M = M("auth");
    $count = $M->where($where)->count();
    $page = new \Think\Page($count, 8);
    $showPage = $page->show();
    $info=$M->limit("$page->firstRow, $page->listRows")->where($where)->select();
    foreach ($info as $key => $value) {
      $info[$key]['rem_count'] = M('auth')->where('recommend = "'.$value['user_id'].'"')->count();
      if($value['recommend']){
        $user = M('auth')->where('user_id = "'.$value['recommend'].'"')->field('user_nickname')->find();
        $info[$key]['recommend'] = $user['user_nickname'];
      }
    }
    $this->assign("page", $showPage);
    $this->assign('info',$info);
    $this->display();
  }
  public function userLevel(){
    $list = M("user_level")->order('id desc')->select();
    $this->assign('list',$list);
    $this->display();
  }
    public function export()
    {
        switch ($_POST['time']){
            case '1':
                $where['user_registertime']  = array('gt',strtotime(date("Y-m-d",time())));
                break;
            case '2':
                $timestr = time();
                $now_day = date('w',$timestr)-1;
                $where['user_registertime']  = array('gt',strtotime(date('Y-m-d',$timestr-$now_day*60*60*24)));
                break;
            case '3':
                $where['user_registertime']  = array('gt',strtotime(date("Y-m-01",time())));
                break;
        }
        if($_POST['starttime'] && $_POST['endtime']){
            if($_POST['starttime'] > $_POST['endtime']){
                exit(json_encode(['state'=>-1,'msg'=>'日期选择错误']));
            }
            $where['user_registertime']  = array('between',"{$_POST['starttime']},{$_POST['endtime']}");
        }
        $data= M('personal')->where($where)->field('user_id,user_tel,user_nickname,real_name,identity,user_registertime')->select();
        
        foreach ($data as $key => $value) {
            $data[$key]['user_registertime'] = date("Y-m-d H:i:s",$value['user_registertime']);
        }
        $key = ['用户ID','登录账户','用户昵称','真实姓名','身份证号','注册时间'];
        export_Excel($data,$key, '用户');
        die;
        // $a = exportExcel($key,$data, '用户', './', true);
        if($a){
            exit(json_encode(['state'=>1,'msg'=>'导出EXCEL成功']));
        }else{
            exit(json_encode(['state'=>0,'msg'=>'导出EXCEL失败']));
        }
    }
  /**
   * 查看详细信息
   */
  public function select() {
    if(IS_POST){
      $post = $_POST;
      $res = M('personal')->save($post);
      if($res){
        $this->success('修改成功',U('index'));
      }else{
        $this->error('修改失败');
      }
    }else{
      $where['user_id'] = I('get.id');
      $info = M('personal')->where($where)->find();
      
      switch ($info['user_sex']) {
        case '0':
          $info['user_sex'] = '未知';
          break;
        case '1':
          $info['user_sex'] = '男';
          break;
        case '2':
          $info['user_sex'] = '女';
          break;
        default:
          # code...
          break;
      }
      $this->assign('info',$info);

      $bi = M('mybi')->where('user_id = "'.$where['user_id'].'"')->select();
      $this->bi = $bi;
      $this->display();
    }
   
  }
  
  /**
   * 会员等级详情
   */
  public function levelDetail() {
    if(IS_POST){
      $post = $_POST;
      $res = M('user_level')->save($post);
      if($res){
        $this->success('修改成功',U('index'));
      }else{
        $this->error('修改失败');
      }
    }else{
      $where['user_id'] = I('get.id');
      $info = M('personal')->where($where)->find();
      switch ($info['user_sex']) {
        case '0':
          $info['user_sex'] = '未知';
          break;
        case '1':
          $info['user_sex'] = '男';
          break;
        case '2':
          $info['user_sex'] = '女';
          break;
        default:
          # code...
          break;
      }
      $this->assign('info',$info);
      $bi = M('mybi')->where('user_id = "'.$where['user_id'].'"')->select();
      $this->bi = $bi;
      $this->display();
    }
   
  }
  public function computing()
  {
    $where['user_id'] = $_GET['user_id'];

    if($_GET['payno']){
        $where['payno'] = $_GET['payno'];
    }
    if($_GET['starttime'] && $_GET['endtime']){
        if($_GET['starttime'] > $_GET['endtime']){
            $this->error('日期选择错误',U('Personal/computing',['user_id'=>$_GET['user_id']]));
        }
        $where['createtime']  = array('between',"{$_GET['starttime']},{$_GET['endtime']}");
    }
    switch ($_GET['type']) {
        case '1':
            $where['type'] = 'sale';
            break;
        case '2':
            $where['type'] = 'sale2';
            break;
        default:
            break;
    }
    $count = M('computing')->where($where)->count();
    $page = new \Think\Page($count, 10);
    $data = M('computing')->where($where)->limit($page->firstRow, $page->listRows)->select();
    foreach ($data as $key => $value) {
      $data[$key]['personal'] = M('personal')->where("user_id = {$value['user_id']}")->field('user_nickname')->find();
      switch ($value['type']) {
        case 'sale':
            $data[$key]['type'] = '1级销售奖励';
            break;
        case 'sale2':
            $data[$key]['type'] = '2级销售奖励';
            break;
        default:
            break;
      }
    }
    $this->list = $data;
    $this->assign("page", $showPage);
    $this->display();
  }

  public function computing_info()
  {
    $where['user_id'] = $_GET['user_id'];
    $where['id'] = $_GET['id'];
    $data = M('computing')->where($where)->find();
    $data['personal'] = M('personal')->where("user_id = {$data['user_id']}")->field('user_nickname')->find();
    switch ($data['type']) {
        case 'sale':
            $data['type'] = '1级销售奖励';
            break;
        case 'sale2':
            $data['type'] = '2级销售奖励';
            break;
        default:
            break;
      }
    $this->info = $data;
    $this->display();
  }

  /**
   * 编辑
   */
  public function edit() {
    $where['user_id'] = I('get.id');
    $info = M('personal')->where($where)->find();
    $this->assign('info',$info);
    $this->display();
  }

  /**
   * 查看用户订单
   * user:bigqig
   */
  public function orderIndex(){
    $count = M('Order')->where('display = 1')->count();
    $page = new \Think\Page($count, 15);
    $showPage = $page->show();
    // $list = M('Order')->limit($page->firstRow, $page->listRows)->select();
    $list = M('Order o')->join('pa_personal as p on o.uid=p.user_id')->where('display = 1')->limit($page->firstRow, $page->listRows)->order('createtime desc')->field('o.id,o.payno,p.user_nickname,o.price,o.createtime,o.fk,o.zt')->select();
    $this->list = $list;
    $this->assign("page", $showPage);
    $this->display();
  }

  /**
   * 订单假删除
   * user:bigqig
   */
  public function orderHidden(){
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

  /**
   * 清空订单
   * user:bigqig
   */
  public function orderDelete(){
    $id = I('get.id');
    $res = M('Order')->delete($id);
    if($res){
      $this->success('删除成功',U('index'));
    }else{
      $this->error('删除失败');
    }
  }

  public function top_up(){
    if($_GET['user_id']){
          $where['t.user_id'] = $_GET['user_id'];
      }
    $count = M('top_up t')->where($where)->count();
    $page = new \Think\Page($count, 15);
    $showPage = $page->show();
    $list = M('top_up t')->join('pa_personal p on t.user_id=p.user_id')->join('pa_enterprise e on t.enterprise = e.id')->field('t.*,p.user_id,p.user_nickname,e.pay_code')->where($where)->limit($page->firstRow, $page->listRows)->order('t.createtime desc')->select();

    $this->assign("page", $showPage);
    $this->assign("list", $list);
    $this->display();
  }

  public function export_top()
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
            $where['t.user_id'] = $_POST['user_id'];
        }
        $data = M('top_up t')->join('pa_personal p on t.user_id=p.user_id')->join('pa_enterprise e on t.enterprise = e.id')->field('p.user_id,p.user_nickname,t.bow_money,t.zec_money,e.pay_code,t.status,t.createtime')->limit($page->firstRow, $page->listRows)->order('t.createtime desc')->select();
        
        foreach ($data as $key => $value) {
            $data[$key]['createtime'] = date("Y-m-d H:i:s",$value['createtime']);
            switch ($value['status']) {
              case '0':
                $data[$key]['status'] = '待审核';
                break;
              case '1':
                $data[$key]['status'] = '已批准';
                break;
              case '2':
                $data[$key]['status'] = '已拒绝';
                break;
              default:
                break;
            }
        }
        $key = ['用户ID','用户昵称','充值BOW金额','所用ZEC金额','企业账户地址','状态','创建时间'];
        export_Excel($data,$key, '用户充值记录');
        die;
        // $a = exportExcel($key,$data, '用户', './', true);
        if($a){
            exit(json_encode(['state'=>1,'msg'=>'导出EXCEL成功']));
        }else{
            exit(json_encode(['state'=>0,'msg'=>'导出EXCEL失败']));
        }
    }

  public function top_up_detail()
  {
      $id = I('get.id');
      $user_id = I('get.user_id');
      $top_up = M('top_up t')->join('pa_personal p on p.user_id=t.user_id')->join('pa_enterprise e on t.enterprise = e.id')->where("t.id = {$id}")->field('t.*,p.user_tel,p.user_nickname,e.pay_code')->find();
      if($top_up['is_voucher']==1){
        $voucher = M('voucher')->where("apply_number = '{$top_up['number']}' and type=3")->find();
        $top_up['voucher'] = $voucher['voucher_path'];
      }
      $this->assign("info", $top_up);
      $this->display();
  }

  public function top_up_edit()
  {
    $id = I('get.id');
    $user_id = I('get.user_id');
    $status = I('get.status');
    $top_up = M('top_up')->where("id = {$id}")->find();
    $data['id'] = $id;
    $data['status'] = $status;
    $data['save_time'] = time();
    M()->startTrans();
    $re2 = true;
    $re3 = true;
    switch ($status) {
      case '1':
        $re2 = M('personal')->where('user_id = "'.$user_id.'"')->setInc('mineral',$top_up['bow_money']);
        if($re2){
          $re2 = M('personal')->where('user_id = "'.$user_id.'"')->setInc('zmineral',$top_up['bow_money']);
        }else{
          break;
        }
        $com['user_id'] = $user_id;
        $com['suanli'] = $top_up['bow_money'];
        $com['type'] = 'top_up';
        $com['createtime'] = time();
        $com['inout'] = 'in';
        $com['currency'] = C('coin');
        $re3 = M('computing')->add($com);
        break;
      case '2':
        
        break;
      default:
        $this->error('参数错误');
        break;
    }
    $res = M('top_up')->save($data);
    if($res && $re2 && $re3){
      M()->commit();
      // $content = "提现成功，请查收";
      // $request =  A('Home/Rongyun')->System('666666',$user_id,$content);
      $this->success('成功',U('top_up'));
    }else{
      M()->rollback();
      // $content = "提现失败，请检查提交的信息";
      // $request =  A('Home/Rongyun')->System('666666',$user_id,$content);
      $this->error('失败');
    }
  }

  /**
   * 提现申请列表 账户余额中扣除提现金额
   * user:bigqig
   */
  public function withdrawals(){
    if($_GET['user_id']){
          $where['w.user_id'] = $_GET['user_id'];
      }
    $count = M('Withdrawals w')->where($where)->count();
    $page = new \Think\Page($count, 15);
    $showPage = $page->show();
    $list = M('Withdrawals w')->join('pa_personal p on w.user_id=p.user_id')->join('pa_e_wallet e on w.e_wallet_id = e.id')->where($where)->field('w.*,p.user_nickname,e.label,e.pay_code')->limit($page->firstRow, $page->listRows)->order('createtime desc')->select();
    $this->assign("page", $showPage);
    $this->assign("list", $list);
    $this->display();
  }

  public function export_with()
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
            $where['w.user_id'] = $_POST['user_id'];
        }
        $data = M('Withdrawals w')->join('pa_personal p on w.user_id=p.user_id')->join('pa_e_wallet e on w.e_wallet_id = e.id')->field('p.user_id,p.user_nickname,w.should_fee,w.service_fee,w.reality_fee,e.pay_code,w.state,w.createtime')->limit($page->firstRow, $page->listRows)->order('createtime desc')->select();
        
        foreach ($data as $key => $value) {
            $data[$key]['createtime'] = date("Y-m-d H:i:s",$value['createtime']);
            switch ($value['state']) {
              case '0':
                $data[$key]['state'] = '待审核';
                break;
              case '1':
                $data[$key]['state'] = '已批准';
                break;
              case '2':
                $data[$key]['state'] = '已拒绝';
                break;
              default:
                break;
            }
        }
        $key = ['用户ID','用户昵称','提现金额','提现手续费','应到账金额','提现地址','状态','创建时间'];
        export_Excel($data,$key, '用户提现记录');
        die;
        // $a = exportExcel($key,$data, '用户', './', true);
        if($a){
            exit(json_encode(['state'=>1,'msg'=>'导出EXCEL成功']));
        }else{
            exit(json_encode(['state'=>0,'msg'=>'导出EXCEL失败']));
        }
    }

  /**
   * 提现批准
   * user:bigqig
   */
  public function withdrawals_ok(){
    $id = I('get.id');
    $user_id = I('get.user_id');
    $data['back_id'] = $id;
    $data['state'] = '1';
    M()->startTrans();
    $res = M('Withdrawals')->save($data);

    if($res){
      M()->commit();
      // $content = "提现成功，请查收";
      // $request =  A('Home/Rongyun')->System('666666',$user_id,$content);
      $this->success('成功',U('withdrawals'));
    }else{
      M()->rollback();
      // $content = "提现失败，请检查提交的信息";
      // $request =  A('Home/Rongyun')->System('666666',$user_id,$content);
      $this->error('失败');
    }
  }


  /**
   * 提现拒绝
   * user:bigqig
   */
  public function withdrawals_no(){
    $id = I('get.id');
    $data['back_id'] = $id;
    $data['state'] = '2';
    M()->startTrans();
    $res = M('Withdrawals')->save($data);
    $info = M('Withdrawals')->where('back_id = "'.$id.'"')->find();
    $re = M('personal')->where('user_id = "'.$info['user_id'].'"')->setInc('mineral',$info['money']);
    if($res && $re){
      M()->commit();
      $this->success('成功',U('withdrawals'));
    }else{
      M()->rollback();
      $this->error('失败');
    }
  }


  

  /*
    指定分配投资
   */
  public function assign_allot()
  {
      if(IS_POST){
          $post = $_POST['info'];
          $enter = M('enter_invest')->where("id = {$post['id']}")->find();
          M()->startTrans();
          $mybi = M('mybi')->where("user_id = {$post['user_id']} and biid = {$enter['bid']}")->find();
          //var_dump($mybi);
          if(!$mybi)
          {
            $re = M('mybi')->add(['user_id'=>$post['user_id'],'biid'=>$enter['bid'],'zbi'=>$post['num'],'bi'=>$post['num'],'title'=>$enter['title']]);
          }else{
            $re = M('mybi')->where("user_id = {$post['user_id']} and biid = {$enter['bid']}")->setInc('zbi',$post['num']);
            M('mybi')->where("user_id = {$post['user_id']} and biid = {$enter['bid']}")->setInc('bi',$post['num']);
          }

          $data['bid'] = $enter['bid'];
          $res = M('bibi')->where($data)->setDec('num',$post['num']);
          if($res){
            M()->commit();
              $this->success('分配成功',U('enter_invest'));
          }else{
            M()->rollback();
            var_dump($re);
            var_dump($res);
            $this->error('分配失败');
          }
      }else{
          $id = $_GET['id'];
          $list = M('enter_invest e')->join('pa_bibi b on e.bid=b.bid')->where(" id = {$id}")->limit($page->firstRow, $page->listRows)->order('e.createtime desc')->find();
          $this->info = $list;
          $this->display();
      }
  }

  public function batch_allot()
  {
    if(IS_POST){
      $post = $_POST['info'];
      if(!$post['type']){
        $this->error('请选择分配类型');
      }
      $enter = M('enter_invest')->where("id = {$post['id']}")->find();
      $user = M('personal')->field('user_id')->select();
      $count = M('personal')->count();
      M()->startTrans();
      switch ($post['type']) {
        case '1':
          $num = $post['num']/$count;
          $num = round($num,3);
          $flag = true;
          foreach ($user as $key => $value) {
              if(!M('mybi')->where("user_id = {$value['user_id']} and biid = {$enter['bid']}")->find()){
                $re1 = M('mybi')->add(['user_id'=>$value['user_id'],'biid'=>$enter['bid'],'zbi'=>$num,'bi'=>$num,'title'=>$enter['title']]);
                if($re1){
                  $flag = true;
                }else{
                  $flag = false;
                }
              }else{
                $re2 = M('mybi')->where("user_id = {$value['user_id']} and biid = {$enter['bid']}")->setInc('zbi',$num);
                $re3 = M('mybi')->where("user_id = {$value['user_id']} and biid = {$enter['bid']}")->setInc('bi',$num);
                if($re2 && $re3){
                  $flag = true;
                }else{
                  $flag = false;
                }
              }
              if($flag == false){
                break;
              }
          }
          break;
        case '2':

          $money_total=$post['num'];
          $min_money=0.1;
          $money_right=$money_total;
          $arr=[];

          for($i=1;$i<=$count;$i++){
              if($i== $count){
                  $money=$money_right;
              }else{
                  $max=$money_right*1000 - ($count - $i ) * $min_money *1000;
                  $money= rand($min_money*1000,$max) /1000;
                  $money=sprintf("%.3f",$money);
                  }
                  $arr[$i-1]['number']=$money;
                  $arr[$i-1]['user_id'] = $user[$i-1]['user_id'];
                  $arr[$i-1]['createtime'] = time();
                  $arr[$i-1]['receive'] = 0;
                  $arr[$i-1]['title'] = $enter['title'];
                  $arr[$i-1]['bid'] = $enter['bid'];
                  $money_right=$money_right - $money;
                  $money_right=sprintf("%.3f",$money_right);
          }
          $re = M('mining')->addAll($arr);
          if($re){
            $flag = true;
          }else{
            $flag = false;
          }
          break;
      }
      $data['bid'] = $enter['bid'];
      $res = M('bibi')->where($data)->setDec('num',$post['num']);
      if($res && $flag){
        M()->commit();
          $this->success('分配成功',U('enter_invest'));
        }else{
          var_dump($flag);
          echo M()->getLastsql();
          M()->rollback();
          //$this->error('分配失败');
        }
    }else{
      $id = $_GET['id'];
      $list = M('enter_invest e')->join('pa_bibi b on e.bid=b.bid')->where(" id = {$id}")->limit($page->firstRow, $page->listRows)->order('e.createtime desc')->find();
      $this->info = $list;
      $this->display();
    }
  }

  /**
   * 申请入驻
   * user:Mr.Hu
   */
  public function applyteacher(){
    $count = M('applyteacher')->count();
    $page = new \Think\Page($count, 15);
    $showPage = $page->show();
    $list = M('applyteacher')->limit($page->firstRow, $page->listRows)->order('createtime desc')->select();
    // $info = M('forum')->where('forum_type = "ptrz"')->select();
    foreach ($list as $key => $value) {
      $category = M('sub_category')->where('cid = "'.$value['teacher_major'].'"')->field('cid,name')->find();
      $list[$key]['cate_name'] = $category['name'];
      switch ($list[$key]['type']) {
        case '1':
          $list[$key]['type'] = '项目入驻';
          break;
        case '2':
          $list[$key]['type'] = '媒体入驻';
          break;
        case '3':
          $list[$key]['type']  = '资本机构入驻';
          break;
        case '4':
          $list[$key]['type']  = '交易平台入驻';
          break;
        case '5':
          $list[$key]['type']  = '矿场入驻';
          break;
      }
    }
    $this->assign("page", $showPage);
    // $this->assign("info", $info);
    $this->assign("list", $list);
    $this->display();
  }

  //申请详情
  public function applyDetail(){
    $post = I('get.');
    $apply = M('applyteacher')->where('teacher_id = "'.$post['id'].'"')->find();
    $category = M('category')->where('cid = "'.$apply['teacher_major'].'"')->field('cid,name')->find();
    $apply['cate_name'] = $category['name'];
    switch ($apply['type']) {
      case 'item':
        $apply['type'] = '项目入驻';
        break;
      case 'media':
        $apply['type'] = '媒体入驻';
        break;
      case 'capital':
        $apply['type']  = '资本机构入驻';
        break;
    }
    // $user = M('personal')->where('user_id = "'.$post['user_id'].'"')->find();
    $this->apply = $apply;
    // dump($apply);die;
    $this->display();
  }
  /**
   * 申请:同意
   * @return [type] [description]
   */
  public function applyteacher_ok(){
    $id = I('get.id');
    $user_id = I('get.user_id');
    $data['teacher_id'] = $id;
    $data['teacher_examine'] = 1;
    $res = M('applyteacher')->save($data); 
    if($res){
      // 创建直播间
      $data['live_no'] = rand(11111,99999).$user_id;
      $data['user_id'] = $user_id;
      $data['createtime'] = time();
      // $data['live_play'] = 1;
      $r =M('live')->add($data);
      //更新用户内容
      $apply = M('applyteacher')->where('teacher_id = "'.$id.'"')->find();
      $info['user_img'] = $apply['liveLogo'];
      $info['user_background_img'] = $apply['poster'];
      $info['user_nickname'] = $apply['liveName'];
      $info['user_type'] = $apply['type'];
      // echo(123);die;
      $info['user_id'] = $id;
      $info['user_authentication'] = 1;
      M('personal')->save($info);
      $content = "恭喜您认证成功！";
      $aa =  A('Home/Rongyun');
      $aa->System('666666',$user_id,$content);
      $this->success('成功',U('applyteacher'));
    }else{
      $this->error('失败');
    }
  }

  public function asd(){
    $content = "恭喜您申请主播成功！";
    $aa =  A('Home/Rongyun');
    print_r($aa->System('666666','24',$content));
    die;
  }
  /**
   * 申请:拒绝
   * @return [type] [description]
   */
  public function applyteacher_no(){
    $id = I('get.id');
    $user_id = I('get.user_id');
    $data['teacher_id'] = $id;
    $data['teacher_examine'] = 2;
    $info['user_id'] = $id;
    $info['user_applyteacher'] = 3;
    $res = M('applyteacher')->save($data);
    M('personal')->save($info);
    if($res){
      $info['user_id'] = $id;
      $info['user_authentication'] = 0;
      M('personal')->save($info);
      $content = "认证失败，请重新认证";
      $request =  A('Home/Rongyun')->System('666666',$user_id,$content);
      $this->success('成功',U('applyteacher'));
    }else{
      $this->error('失败');
    }
  }

  //申请的讲师上首页推荐
  public function apprec(){
    $id = $_GET['id'];
    $where['recommend'] = 1;
    $where['teacher_id'] = $id;
    $res = M('applyteacher')->save($where);
    if($res){
      $this->success('推荐成功',U('applyteacher'));
    }else{  
      $this->error('推荐失败');
    }
  }

  //申请的讲师上首页推荐取消
  public function qxapprec(){
    $id = $_GET['id'];
    $where['recommend'] = 0;
    $where['teacher_id'] = $id;
    $res = M('applyteacher')->save($where);
    if($res){
      $this->success('取消推荐成功',U('applyteacher'));
    }else{  
      $this->error('取消失败');
    }
  }

  //申请的讲师上首页推荐
  public function apphot(){
    $id = $_GET['id'];
    $where['hot'] = 1;
    $where['teacher_id'] = $id;
    $res = M('applyteacher')->save($where);
    if($res){
      $this->success('热门成功',U('applyteacher'));
    }else{  
      $this->error('热门失败');
    }
  }

  //申请的讲师上首页推荐取消
  public function qxapphot(){
    $id = $_GET['id'];
    $where['hot'] = 0;
    $where['teacher_id'] = $id;
    $res = M('applyteacher')->save($where);
    if($res){
      $this->success('取消热门成功',U('applyteacher'));
    }else{  
      $this->error('取消失败');
    }
  }



  //帮助与反馈
  public function help(){
    if(IS_POST){
      }else{
      $info = M('Help h')->join('pa_personal p on p.user_id = h.user_id')->order('createtime desc')->select();
      $this->info = $info;
      $this->display();
    }
    
  }

  //删除反馈
  public function helpDel(){
    $id = $_GET['id'];
    $res = M('help')->delete($id);
    if($res){
      $this->success('成功',U('help'));
    }else{
      $this->error('失败');
    }
  }

  //关于我们
  public function about(){
    if(IS_POST){
      // dump($_POST);die;
      $data['content'] = $_POST['content'];
      $data['id'] = $_POST['id'];
      $res = M('about')->save($data);
      if($res){
        $this->success('修改成功',U('about'));
      }else{
        $this->error('修改失败');
      }
    }else{
      $info = M('About')->where('id = 1')->find();
      $this->info = $info;
      $this->display();
    } 
  }

  //法律条款
  public function law(){
    if(IS_POST){
      // dump($_POST);die;
      $data['content'] = $_POST['content'];
      $data['id'] = $_POST['id'];
      $res = M('about')->save($data);
      if($res){
        $this->success('修改成功',U('about'));
      }else{
        $this->error('修改失败');
      }
    }else{
      $info = M('About')->where('id = 2')->find();
      $this->info = $info;
      $this->display('about');
    } 
  }

  //充值
  public function recharge(){
    if(IS_POST){
      $post = $_POST;
      $user = M('personal')->where('user_tel = "'.$post['user_tel'].'"')->field('user_id,user_nickname')->find();
      if(!$user){
        $this->error('无此用户');
      }
      M()->startTrans();
      $add1 = M('personal')->where('user_id = "'.$user['user_id'].'"')->setInc('mineral',$post['jine']);
      $add2 = M('personal')->where('user_id = "'.$user['user_id'].'"')->setInc('zmineral',$post['jine']);
      // $payno = rand(00,99).$re['user_id'].time();
      // $payno = substr(md5($payno),0,14);
      // $payno = strtoupper($payno);
      // $data['payno'] = $payno;
      // $data['price'] = $value['gongji'];  //出售的金额
      $data['user_id'] = $user['user_id'];
      // $data['identification'] = date('Ymd',time()).time().$re['user_id'].mt_rand(0000,9999);
      $data['createtime'] = time();
      $data['type'] = 'record';
      $data['currency'] = 'B.O.W';
      $data['inout'] = 'in';
      $data['suanli'] = $post['jine'];
      //添加订单
      $class = M('computing')->add($data);
      // echo M()->getlastsql();die;
      // $orderdetails['payno'] = $payno;
      // $orderdetails['uid'] = $user['user_id'];
      // $orderdetails['num'] = $post['jine'];
      // $orderdetails['title'] = 'BOW充值';
      // $orderdetails['shoujia'] = $car2['price'];
      // $orderdetails['cptype'] = "商品";
      // 添加订单详情
      if($class && $add1 && $add2){
        M()->commit();
        $this->success('充值成功',U('select',array('id'=>$user['user_id'])));
      }else{
        M()->rollback();
        $this->error('充值失败');
      }
    }else{
      $this->display();
    }
  }


  //会员关系图
  public function tree(){
    $user = M('personal')->field('user_id,user_nickname,recommend')->select();
    $array = $this->getTree($user,0,0);
    $str = '<ul class="tree">';
    foreach($array as $value){
      $len = '';
     
      for ($i=0; $i < $value['level']; $i++) { 
        $len .= '------'; 
      }
      if($value['user_id'] % 3 == 0){
        $str .= '<li class = "c1">'.$len.'<span class="list">'.($value['level']+1).'级  </span>'.$value['user_nickname'].'-id:'.$value['user_id'].'<li><br/>';
      }
      $str .= '<li class="c2">'.$len.'<span class="list">'.($value['level']+1).'级  </span>'.$value['user_nickname'].'-id:'.$value['user_id'].'<li><br/>'; 
    }
    $str .= '</ul>';
    
    $this->str = $str;
    $this->display();
    
  }

  function getTree($array, $pid =0, $level = 0){

    //声明静态数组,避免递归调用时,多次声明导致数组覆盖
    static $list = [];
    foreach ($array as $key => $value){
        //第一次遍历,找到父节点为根节点的节点 也就是pid=0的节点
        if ($value['recommend'] == $pid){
            //父节点为根节点的节点,级别为0，也就是第一级
            $value['level'] = $level;
            //把数组放到list中
            $list[] = $value;
            //把这个节点从数组中移除,减少后续递归消耗
            unset($array[$key]);
            //开始递归,查找父ID为该节点ID的节点,级别则为原级别+1
           $this-> getTree($array, $value['user_id'], $level+1);

        }
    }
    return $list;
  }
}

?>