<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>网站后台-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
    <?php $addCss=""; $addJs=""; $currentNav ='会员列表 > 充值详细信息'; ?>
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
                    <div class="current">充值详细信息</div>
                </div>
                <form action="" method="post" enctype="multipart/form-data">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
                        <tr>
                            <th>充值单号:</th>
                            <td><?php echo ($info['number']); ?></td>
                        </tr>
                        <tr>
                            <th>会员账号:</th>
                            <td><?php echo ($info["user_tel"]); ?></td>
                        </tr>
                        <tr>
                            <th>昵称:</th>
                            <td><?php echo ($info["user_nickname"]); ?></td>
                        </tr>
                        <tr>
                            <th>充值<?php echo (C("coin")); ?>金额:</th>
                            <td><?php echo ($info["bow_money"]); ?></td>
                        </tr>
                        <tr>
                            <th>所用ZEC金额:</th>
                            <td><?php echo ($info["zec_money"]); ?></td>
                        </tr>
                        <tr>
                            <th>企业账户地址:</th>
                            <td><?php echo ($info["pay_code"]); ?></td>
                        </tr>
                        <tr>
                            <th>状态:</th>
                            <td><?php if($info["status"] == 0): ?>待审核<?php elseif($info["status"] == 1): ?>已批准<?php else: ?>已拒绝<?php endif; ?></td>
                        </tr>
                        <tr>
                            <th>支付凭证:</th>
                            <td><?php if($info["is_voucher"] == 0): ?>未上传<?php elseif($info["is_voucher"] == 1): ?><img src="<?php echo ($info["voucher"]); ?>" width="200" height="150"><?php endif; ?></td>
                        </tr>
                    </table>
                    <input type="hidden" name="user_id" value="<?php echo ($info["user_id"]); ?>"/>
                    <!-- <div class="commonBtnArea" >
                        <button class="btn submit">提交</button>
                    </div> -->
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