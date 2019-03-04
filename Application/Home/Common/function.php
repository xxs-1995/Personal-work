<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-3-7
 * Time: 上午10:15
 */
/**
 * 获取默认图片
 * @param $str
 * @return bool|mixed
 */
function get_default_img($str){
    if(!$str)return false;
    $str_arr=explode(',',$str);
    $map['id']=$str_arr[0];
    return M('images')->where($map)->getField('savepath');
}

/**
 * 获取图片集
 * @param $str
 * @return bool|mixed
 */
function get_img_array($str){
    if(!$str)return false;
    $str_arr=@explode(',',$str);
    $map['id']=array('in',$str_arr);
    return M('images')->where($map)->field('savepath')->select();
}

/**
 * 分类面包屑导航
 * @param $cid
 * @param bool $flag
 * @return string
 */
function conist_nav($cid,$flag=false){
    $cat = new \Org\Util\Category('Category', array('cid', 'pid', 'name', 'fullname'));
    $arr=$cat->getPath($cid);
    $str='<a href='.__APP__.'>'.L('T_HOME').'</a>>';
    if(is_array($arr))
    foreach($arr as $v){
        $str.=$v['name'].'>';
    }
    if($flag)$str=substr($str,0,-1);
    return $str;
}


//分页  页数 ，条数
function pagex($page=1,$num=10){
    $page = $page? : 1;
    $first = ($page-1)*$num;
    $last = $num;
    $pages = $first.','.$last;
    return $pages;
}

function time_tran($the_time) {
    $now_time = time();  
    $show_time = $the_time;  
    // print_r($now_time);
    // print_r($show_time);die;
    //echo $now_time;  
    $dur = $now_time - $show_time;  
    if ($dur < 0) {  
        return $the_time;  
    } else {  
        if ($dur < 60) {  
            return $dur . '秒前';  
        } else {  
            if ($dur < 3600) {  
                return floor($dur / 60) . '分钟前';  
            } else {  
                if ($dur < 86400) {  
                    return floor($dur / 3600) . '小时前';  
                } else {  
                    if ($dur < 259200) {//3天内  
                        return floor($dur / 86400) . '天前';  
                    } else {  
                        return date('Y-m-d',$the_time);  
                    }  
                }  
            }  
        }  
    }  
}


//返回数据方法
function returnData($state,$message,$data = ' '){
    $value = array(
            "state" => $state,
            "msg" => $message,
            "data" => $data,
        );
    echo json_encode($value);die;
}

function rData($state,$message,$data = ' '){
    $value = array(
            "state" => $state,
            "msg" => $message,
            "data" => $data,
        );
    echo json_encode($value);die;
}


function hidtel($phone){
        $IsWhat = preg_match('/(0[0-9]{2,3}[\-]?[2-9][0-9]{6,7}[\-]?[0-9]?)/i',$phone); //固定电话
        if($IsWhat == 1){
            return preg_replace('/(0[0-9]{2,3}[\-]?[2-9])[0-9]{3,4}([0-9]{3}[\-]?[0-9]?)/i','$1****$2',$phone);
        }else{
            return  preg_replace('/(1[358]{1}[0-9])[0-9]{4}([0-9]{4})/i','$1****$2',$phone);
        }
    }

function generate_password( $length = 10 ) { 
    // 密码字符集，可任意添加你需要的字符 
    $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'; 
    $password = ''; 
    for ( $i = 0; $i < $length; $i++ ) 
    { 
        // 这里提供两种字符获取方式 
        // 第一种是使用 substr 截取$chars中的任意一位字符； 
        // 第二种是取字符数组 $chars 的任意元素 
        // $password .= substr($chars, mt_rand(0, strlen($chars) – 1), 1); 
        $password .= $chars[ mt_rand(0, strlen($chars) - 1) ]; 
    } 
    return $password; 
}