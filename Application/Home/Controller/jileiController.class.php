<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/2
 * Time: 14:15
 */

namespace Home\Controller;


use Think\Controller;

class jileiController extends Controller
{
    public function __construct()
    {
        if(!IS_POST){
            $value = [
                'state' => '-1',
                'msg'=>'请求方式错误',
                'data'=>'',
            ];
            exit(json_encode($value));
        }
        if($_POST['access_token'] == ''){
            $value = [
                'state' => '-2',
                'msg'=>'参数错误',
                'data'=>'',
            ];
            exit(json_encode($value));
        }

    }
}