<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>后台管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='会员管理 > 主播申请列表'; ?>
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
                    <div class="current">申请详情</div>
                </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1" style="float:left">
                        <tr>
                            <th>会员id：</th>
                            <td><?php echo ($apply["teacher_userid"]); ?></td>
                        </tr>
                        
                        <tr>
                            <th>真实姓名：</th>
                            <td><?php echo ($apply["true_name"]); ?></td>
                        </tr>
                        
                        <tr>
                            <th>开发属性：</th>
                            <td><?php echo ($apply["attribute"]); ?></td>
                        </tr>
                        <tr>
                            <th>应用方向：</th>
                            <td><?php echo ($apply["direction"]); ?></td>
                        </tr>
                        <tr>
                            <th>联系方式：</th>
                            <td><?php echo ($apply["phone"]); ?></td>
                        </tr>
                        <tr>
                            <th>微信：</th>
                            <td><?php echo ($apply["wechat"]); ?></td>
                        </tr>
                        <tr>
                            <th>qq：</th>
                            <td><?php echo ($apply["qq"]); ?></td>
                        </tr>
                        <tr>
                            <th>邮箱：</th>
                            <td><?php echo ($apply["email"]); ?></td>
                        </tr>
                        
                        <tr>
                            <th>团队规模和组成：</th>
                            <td><?php echo ($apply["scale"]); ?></td>
                        </tr>
                        <tr>
                            <th>项目目前进展：</th>
                            <td><?php echo ($apply["progress"]); ?></td>
                        </tr>

                        <tr>
                            <th>项目简介或自我介绍：</th>
                            <td><?php echo ($apply["introduce"]); ?></td>
                        </tr>

                        <tr>
                            <th>商业计划</th>
                            
                            <td><?php if($apply['plan']): ?><a href="<?php echo ($apply["plan"]); ?>">商业计划</a><?php endif; ?></td>
                        </tr>
                       

                    </table>
                    <input type="hidden" name="id" value="<?php echo ($info["id"]); ?>"/>
                    <div class="commonBtnArea" >
                        <button class="btn ">返回</button>
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
        $(".btn").click(function(){
            // commonAjaxSubmit();
            window.history.back(-1);
        });
    });
</script>
</body>
</html>