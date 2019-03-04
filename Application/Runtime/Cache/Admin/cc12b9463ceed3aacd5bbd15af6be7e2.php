<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加编辑友情链接-网站设置-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
    <?php $addCss=""; $addJs=""; $currentNav ='网站设置 > 添加编辑友情链接'; ?>
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
                    <div class="current">添加编辑友情链接</div>
                </div>
                <form action="<?php echo U('Siteinfo/add_link');?>" method="post">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">

                        <tr>
                            <th width="120">链接名称：</th>
                            <td><input name="info[title]" type="text" class="input" size="40" value="<?php echo ($info["title"]); ?>" /> </td>
                        </tr>
                        <tr>
                            <th>打开窗口：</th>
                            <td><select name="info[target]" style="min-width: 80px;">
                                <option value="1" <?php if($info['target'] == '1'): ?>selected<?php endif; ?>>当前窗口</option>
                                <option value="2" <?php if($info['target'] == '2'): ?>selected<?php endif; ?>>新窗口</option>
                            </select></td>
                        </tr>
                        <tr>
                            <th>状态：</th>
                            <td><select name="info[display]" style="min-width: 80px;">
                                <option value="1" <?php if($info['display'] == '1'): ?>selected<?php endif; ?>>显示</option>
                                <option value="0" <?php if($info['display'] == '2'): ?>selected<?php endif; ?>>隐藏</option>
                            </select></td>
                        </tr>
                        <tr>
                            <th>显示排序：</th>
                            <td><input class="input" name="info[sort]" type="text" size="20" value="<?php echo ($info["sort"]); ?>" /> </td>
                        </tr>
                        <tr>
                            <th>链接：</th>
                            <td><input class="input" name="info[link]" type="text" size="40" value="<?php echo ($info["link"]); ?>" /> 请加上http://</td>
                        </tr>
                    </table>
                    <input type="hidden" name="id" value="<?php echo ($info["id"]); ?>"/>
                </form>
                <div class="commonBtnArea" >
                    <button class="btn submit">提交</button>
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
<script type="text/javascript">
    $(function(){
        $(".submit").click(function(){
            commonAjaxSubmit();
        });
    });
</script>
</body>
</html>