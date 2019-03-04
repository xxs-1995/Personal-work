<?php
namespace Admin\Controller;
use Think\Controller;
/**
 * EmptyController
 * 空控制器
 */
class ComputingController extends CommonController {
   
    //
    public function index(){
        //会员数量 insur数量
        $user = M('personal')->field('count(user_id) usercount,sum(user_jine) insur ')->select();
        //全网算力
        $suanli = M('Computing')->field('sum(suanli) suanli,sum(recsuanli) recsuanli')->select();
        $suanli = $suanli[0]['suanli'] + $suanli[0]['recsuanli'] + $user[0]['usercount'] * 100;
        //每日新增算力
        $date = strtotime(date('Y-m-d',time()));
        $newsuanli = M('Computing')->where('create_time >= "'.$date.'"')->field('sum(suanli) suanli,sum(recsuanli) recsuanli')->select();
        $usercount = M('personal')->where('create_time >= "'.$date.'"')->count();
        $newsuanli = $newsuanli[0]['suanli'] + $newsuanli[0]['recsuanli'] + $newsuanli * 100;
        //每日新增会员
        $info = M('personal')->where('create_time >= "'.$date.'"')->count();

        $this->user = $user;
        $this->suanli = $suanli;
        $this->usercount = $usercount;
        $this->newsuanli = $newsuanli;
        $this->info = $info;
        $this->display();
    }
}
