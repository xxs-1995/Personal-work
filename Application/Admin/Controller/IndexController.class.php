<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends CommonController {
//class IndexController extends Controller {
    public function index() {
       // dump(C('Case'));
//        pre($_SESSION['my_info']);
        //服务器信息
        if (function_exists('gd_info')) {
            $gd = gd_info();
            $gd = $gd['GD Version'];
        } else {
            $gd = "不支持";
        }
        $info = array(
            '操作系统' => PHP_OS,
            '主机名IP端口' => $_SERVER['SERVER_NAME'] . ' (' . $_SERVER['SERVER_ADDR'] . ':' . $_SERVER['SERVER_PORT'] . ')',
            '运行环境' => $_SERVER["SERVER_SOFTWARE"],
            'PHP运行方式' => php_sapi_name(),
            '程序目录' => WEB_ROOT,
            'MYSQL版本' => function_exists("mysql_close") ? mysql_get_client_info() : '不支持',
            'GD库版本' => $gd,
//            'MYSQL版本' => mysql_get_server_info(),
            '上传附件限制' => ini_get('upload_max_filesize'),
            '执行时间限制' => ini_get('max_execution_time') . "秒",
            '剩余空间' => round((@disk_free_space(".") / (1024 * 1024)), 2) . 'M',
            '服务器时间' => date("Y年n月j日 H:i:s"),
            '北京时间' => gmdate("Y年n月j日 H:i:s", time() + 8 * 3600),
            '采集函数检测' => ini_get('allow_url_fopen') ? '支持' : '不支持',
            'register_globals' => get_cfg_var("register_globals") == "1" ? "ON" : "OFF",
            'magic_quotes_gpc' => (1 === get_magic_quotes_gpc()) ? 'YES' : 'NO',
            'magic_quotes_runtime' => (1 === get_magic_quotes_runtime()) ? 'YES' : 'NO',
        );
        $this->assign('server_info', $info);
        $this->display();
    }

    public function myInfo() {
        if (IS_POST) {
            $this->checkToken();
            echo json_encode(D("Index")->my_info($_POST));
        } else {
            $this->display();
        }
    }

    public function cache() {
        $caches = array(
            "HomeCache" => array("name" => "网站前台缓存文件", "path" => WEB_CACHE_PATH . "Cache/Home/"),
            "AdminCache" => array("name" => "网站后台缓存文件", "path" => WEB_CACHE_PATH . "Cache/Admin/"),
            "HomeData" => array("name" => "网站前台数据库字段缓存文件", "path" => WEB_CACHE_PATH . "Data/Home/"),
            "AdminData" => array("name" => "网站后台数据库字段缓存文件", "path" => WEB_CACHE_PATH . "Data/Admin/"),
            "HomeLog" => array("name" => "网站日志缓存文件", "path" => WEB_CACHE_PATH . "Logs/"),
            "HomeTemp" => array("name" => "网站临时缓存文件", "path" => WEB_CACHE_PATH . "Temp/"),
            "MinFiles" => array("name" => "JS\CSS压缩缓存文件", "path" => WEB_CACHE_PATH . "MinFiles/")
        );
        if (IS_POST) {
            foreach ($_POST['cache'] as $path) {
                if (isset($caches[$path]))
                    delDirAndFile($caches[$path]['path']);
            }
            echo json_encode(array("status"=>1,"info"=>"缓存文件已清除"));
        } else {
            $this->assign("caches", $caches);
            $this->display();
        }
    }


    public function bannerIndex(){
        $info = M('picarr')->where('picarr_type = "chongwo"')->select();
        $this->info = $info;
        $this->display();
    }

    public function bannerAdd(){
        if($_POST){
            $post['picarr_img_url'] = $_POST['image'];
            $post['created_at'] = time();
            $post['picarr_type'] = 'chongwo';
            $res = M('picarr')->add($post);
            if($res){
                $this->success('添加成功',U('bannerIndex'));
            }else{
                $this->error('添加失败');
            }
        }else{
            $this->display();
        }
        
    }

    public function bannerDel(){
        $get = I('get.');
        $res = M('picarr')->delete($get['id']);
        if($res){
            @unlink('.'.$get['img_url']);
            $this->success('删除成功',U('bannerIndex'));
        }else{
            $this->error('删除失败');
        }
    }

}