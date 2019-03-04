<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>留言管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
    <?php $addCss=""; $addJs=""; $currentNav ='留言管理 > 留言信息'; ?>
    <link rel="stylesheet" type="text/css" href="/Public/Min/?f=/Public/Admin/Css/base.css|/Public/Admin/Css/layout.css|/Public/Js/asyncbox/skins/default.css<?php echo ($addCss); ?>" />
<script type="text/javascript" src="/Public/Min/?f=/Public/Js/jquery-1.9.0.min.js|/Public/Js/jquery.lazyload.js|/Public/Js/functions.js|/Public/Admin/Js/base.js|/Public/Js/jquery.form.js|/Public/Js/asyncbox/asyncbox.js<?php echo ($addJs); ?>"></script>
<link rel="stylesheet" type="text/css" href="/Public/Css/page.css">

</head>
<body>
<div class="wrap"> <div id="Top">
    <div class="logo"><a target="_blank" href="<?php echo ($site["WEB_ROOT"]); ?>"><img src="/Public/Admin/Img/logo.png" /></a></div>
    <!-- <div class="help"><a href="http://www.uc22.net/bbs" target="_blank">使用帮助</a><span><a href="http://www.uc22.net" target="_blank">关于</a></span></div> -->
    <div class="menu">
        <ul> <?php echo ($menu); ?> </ul>
    </div>
</div>
<div id="Tags">
    <div class="userPhoto"><img src="/Public/Admin/Img/userPhoto.jpg" /> </div>
    <div class="navArea">
        <div class="userInfo"><div><a href="<?php echo U('Webinfo/index');?>" class="sysSet"><span>&nbsp;</span>系统设置</a> <a href="<?php echo U("Public/loginOut");?>" class="loginOut"><span>&nbsp;</span>退出系统</a></div>欢迎您，<?php echo ($my_info["email"]); ?></div>
        <div class="nav"><font id="today"><?php echo date("Y-m-d H:i:s"); ?></font>您的位置：<?php echo ($currentNav); ?></div>
    </div>
</div>
<div class="clear"></div>
    <div class="mainBody"> <div id="Left">
    <div id="control" class=""></div>
    <div class="subMenuList">
        <div class="itemTitle"><?php if(CONTROLLER_NAME == 'Index'): ?>常用操作<?php else: ?>子菜单<?php endif; ?> </div>
        <ul>
            <?php if(is_array($sub_menu)): foreach($sub_menu as $key=>$sv): ?><li><a href="<?php echo ($sv["url"]); ?>"><?php echo ($sv["title"]); ?></a></li><?php endforeach; endif; ?>
        </ul>
    </div>

</div>
        <div id="Right">
            <div class="contentArea">
                <div class="Item hr">
                    <div class="current">留言信息</div>
                </div>
                <form action="" method="post">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
                        <tr>
                            <th width="120">留言人：</th>
                            <td><input name="" type="text" class="input" size="30" value="<?php echo ($info["personal"]["user_nickname"]); ?>" disabled/></td>
                        </tr>
                        <tr>
                            <th width="120">联系电话：</th>
                            <td><input name="" type="text" class="input" size="30" value="<?php echo ($info["personal"]["user_tel"]); ?>" disabled/></td>
                        </tr>
                        <tr>
                            <th width="120">查看状态：</th>
                            <td>
                                <?php if($info["status"] == '0'): ?>未查看
                            <?php elseif($info["status"] == '1'): ?>
                            已查看<?php endif; ?>
                            </td>
                        </tr>
                        <tr>
                            <th width="120">留言时间：</th>
                            <td><input name="" type="text" class="input" size="30" value="<?php echo (date("Y-m-d H:i:s",$info["createtime"])); ?>" disabled/></td>
                        </tr>
                        <tr>
                            <th width="120">留言标题：</th>
                            <td><input name="" type="text" class="input" size="30" value="<?php echo ($info["title"]); ?>" disabled/></td>
                        </tr>
                        <tr>
                            <th width="120">留言内容：</th>
                            <td><textarea disabled><?php echo ($info["text"]); ?></textarea>
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" name="id" value="<?php echo ($info["id"]); ?>"/>
                </form>                
                <div class="commonBtnArea" >
                    <button class="btn" onClick="javascript :history.back(-1);">返回</button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="clear"></div>
<script type="text/javascript">
    $(window).resize(autoSize);
    $(function(){
        autoSize();
        $(".loginOut").click(function(){
            var url=$(this).attr("href");
            popup.confirm('你确定要退出吗？','你确定要退出吗',function(action){
                if(action == 'ok'){ window.location=url; }
            });
            return false;
        });

        var time=self.setInterval(function(){$("#today").html(date("Y-m-d H:i:s"));},1000);


    });

</script>
<script type="text/javascript" src="/Public/kindeditor/kindeditor.js"></script><script type="text/javascript" src="/Public/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript">
    $(function(){
        $(".submit").click(function(){
            commonAjaxSubmit();
            return false;
        });
    });
</script>
</body>
</html>