<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>网站后台-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
    <?php $addCss=""; $addJs=""; $currentNav ='会员列表 > 详细信息'; ?>
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
                    <div class="current">详细信息</div>
                </div>
                <form action="" method="post" enctype="multipart/form-data">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
                        <tr>
                            <th>会员账号:</th>
                            <td><input  type="text" class="input" size="40" value="<?php echo ($info["user_tel"]); ?>" disabled="disabled"/> </td>
                        </tr>
                        <tr>
                            <th>昵称:</th>
                            <td><input  type="text" class="input" size="40" name="user_nickname" value="<?php echo ($info["user_nickname"]); ?>" /> </td>
                        </tr>
                        <tr>
                            <th width="120">年龄：</th>
                            <td><input  type="text" class="input" size="40" name="user_age" value="<?php echo ($info["user_age"]); ?>"/> </td>
                        </tr>
                        <tr>
                            <th width="120">性别：</th>
                            <td><input  type="text" class="input" size="40" value="<?php echo ($info["user_sex"]); ?>" disabled="disabled"/> </td>
                        </tr>
                        <tr>
                            <th width="120">头像：</th>
                            <td><img src="<?php echo ($info["user_img"]); ?>" alt="" width="60" height="60" disabled="disabled"></td>
                        </tr>
                        <tr>
                            <th width="120">所在地区：</th>
                            <td><input  type="text" class="input" size="40" value="<?php echo ($info["user_area"]); ?>" disabled="disabled"/> </td>
                        </tr>
                        
                        <tr>
                            <th width="120">BOWT：</th>
                            <td><input  type="text" class="input" size="40"  value="<?php echo ($info["user_jine"]); ?>" /> </td>
                        </tr>

                        <tr>
                            <th width="120">钻石：</th>
                            <td><input  type="text" class="input" size="40"  value="<?php echo ($info["diamonds"]); ?>" /> </td>
                        </tr>
                       
                        <?php if(is_array($bi)): $i = 0; $__LIST__ = $bi;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                                        <th width="120"><?php echo ($vo["title"]); ?>：</th>
                                        <td><input  type="text" class="input" size="40"  value="<?php echo ($vo["bi"]); ?>" /> </td>
                                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                        <tr>
                            <th width="120">身份：</th>
                            <td><select name="user_type" id="">
                                <option value="1" <?php if($info['user_type'] == 1): ?>selected<?php endif; ?> >普通用户</option>
                                <option value="2" <?php if($info['user_type'] == 2): ?>selected<?php endif; ?>>第一期初创矿主</option>
                                <option value="3" <?php if($info['user_type'] == 3): ?>selected<?php endif; ?>>第二期初创矿主</option>
                            </select></td>
                        </tr>
                       
                        
                        <!-- <tr>
                            <th width="120">简介：</th>
                            <td><input  type="text" class="input" size="40" value="<?php echo ($info["user_introduce"]); ?>" /> </td>
                        </tr> -->
                        
                        <tr>
                            <th width="120">简介：</th>
                            <td>
                            <!-- <input  type="text" class="input" size="40" value="" /> -->
                                <textarea name="user_introduce" id="" cols="50" rows="4" ><?php echo ($info["user_introduce"]); ?></textarea>
                            </td>
                        </tr>

                    </table>
                    <input type="hidden" name="user_id" value="<?php echo ($info["user_id"]); ?>"/>
                    <div class="commonBtnArea" >
                        <button class="btn submit">提交</button>
                    </div>
                </form>
                
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
            $('form').submit();
        });
    });
</script>
</body>
</html>