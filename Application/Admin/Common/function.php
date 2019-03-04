<?php
/**
 * Created by PhpStorm.
 * User: cony
 * Date: 14-2-28
 * Time: 下午3:25
 */
include('_pre.php');
include('filter_function.php');
include('fill_function.php');
function access($attr, $path, $data, $volume) {
    return strpos(basename($path), '.') === 0       // if file/folder begins with '.' (dot)
        ? !($attr == 'read' || $attr == 'write')    // set read+write to false, other (locked+hidden) set to true
        :  null;                                    // else elFinder decide it itself
}

function set_nav($module,$guide){
    $map=$guide?array('cid'=>$guide):'';
    switch($module){
        case 'news':
            return U('/news/index',$map);
            break;
        case 'product':
            return(U('/product/index',$map));
            break;
        case 'message':
            return(U('/message/index'));
            break;
        case 'link':
            break;
        case 'page':
            $m_page=M('page');
            $ename=$m_page->where('id='.$guide)->getField('unique_id');
            return(U('/page/index',array('name'=>$ename)));
            break;
        default:
            return(U('/index/index'));
            break;
    }

}

/**
 * 检查是否包含特殊字符
 * @param  string  $subject 需要检查的字符串
 * @return boolean          是否包含
 */
function hasSpecialChar($subject) {
    $pattern = "/^(([^\^\.<>%&',;=?$\"':#@!~\]\[{}\\/`\|])*)$/";

    if (preg_match($pattern, $subject)) {
        return false;
    }

    return true;
}

/**
 * 是否整数
 * @param  mixed   $var
 * @return boolean
 */
function isint($var) {
    return (preg_match('/^\d*$/', $var) == 1);
}

/**
 * 是否浮点型
 * @param  mixed   $var 需要检查的值
 * @return boolean
 */
function isdouble($var) {
    return (preg_match('/^[+-]?(\d*\.\d+([eE]?[+-]?\d+)?|\d+[eE][+-]?\d+)$/', $var));
}

/**
 * 检验是否有效日期
 * @param  string  $date    需要检验的日期
 * @param  array   $formats 有效的日期格式
 * @return boolean
 */
function is_valid_date($date, $formats = array("Y-m-d", "Y/m/d")) {
    $unixtime = strtotime($date);
    if (!$unixtime) {
        return false;
    }

    foreach ($formats as $format) {
        if (date($format, $unixtime) == $date) {
            return true;
        }
    }

    return false;
}

/**
 * 得到指定值在数组中的位置，未找到返回false
 * @param  array  $search 被查找的数组
 * @param  mixed  $target 目标值
 * @return mixed
 */
function array_pos(array $search, $target) {
    $i = 0;
    foreach ($search as $item) {
        if ($item == $target) {
            return $i;
        }

        $i += 1;
    }

    return false;
}

/**
 * 只对字符串进行trim
 * @param  mixed $val 需要trim的值
 * @return mixed
 */
function trim_value($val) {
    if (is_string($val)) {
        return trim($val);
    }

    return $val;
}

/**
  +----------------------------------------------------------
 * 功能：上传文件
  +----------------------------------------------------------
 * @param 上传文件名
  +----------------------------------------------------------
 * @return  上传文件目录
  +----------------------------------------------------------
 */
function upload($param,$param1,$param2){
    $upload = new \Think\Upload();// 实例化上传类
      // $upload->maxSize   =     3145728 ;// 设置附件上传大小
      $upload->maxSize   =     10185623 ;// 设置附件上传大小
      $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
      $upload->rootPath  =     '/Uploads'; // 设置附件上传根目录
      $upload->savePath  =     $param1; // 设置附件上传（子）目录
      $upload->saveName  =     time().'_'.mt_rand();
      // 上传单个文件 
      $info   =   $upload->upload();
      if(!$info) {// 上传错误提示错误信息
        return $upload->getError();
      }else{// 上传成功 获取上传文件信息
        return '/Uploads'.$info[$param2]['savepath'].$info[$param2]['savename'];
      }
}
    