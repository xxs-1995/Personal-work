<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style>
    .tree li{
        /* border:solid 1px; */
        font-size: 20px;
        height: 20px;
        /* color: red; */
        
    }
    .list{
        color: blueviolet;
    }
    .c1{
        color: blue;
    }
    .c2{
        color: red;
    }
    
</style>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>菜单管理-菜单列表-后台管理首页-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
    <?php $addCss=""; $addJs=""; $currentNav ='菜单管理 > 菜单列表'; ?>
    <link rel="stylesheet" type="text/css" href="/Public/Min/?f=/Public/Admin/Css/base.css|/Public/Admin/Css/layout.css|/Public/Js/asyncbox/skins/default.css<?php echo ($addCss); ?>" />
<script type="text/javascript" src="/Public/Min/?f=/Public/Js/jquery-1.9.0.min.js|/Public/Js/jquery.lazyload.js|/Public/Js/functions.js|/Public/Admin/Js/base.js|/Public/Js/jquery.form.js|/Public/Js/asyncbox/asyncbox.js<?php echo ($addJs); ?>"></script>
<link rel="stylesheet" type="text/css" href="/Public/Css/page.css">

</head>
<body>
<div class="wrap">
    <div id="Top">
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
    <div class="mainBody">
        <div id="Left">
    <div id="control" class=""></div>
    <div class="subMenuList">
        <div class="itemTitle"><?php if(CONTROLLER_NAME == 'Index'): ?>常用操作<?php else: ?>子菜单<?php endif; ?> </div>
        <ul>
            <?php if(is_array($sub_menu)): foreach($sub_menu as $key=>$sv): ?><li><a href="<?php echo ($sv["url"]); ?>"><?php echo ($sv["title"]); ?></a></li><?php endforeach; endif; ?>
        </ul>
    </div>

</div>
        <div id="Right">
            <div class="Item hr">
                <div class="current" style="max-width: 100px; float: left;">用户管理</div>
                <div style="width: 100px;float: right;"></div>
            </div>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tab">
                <?php echo ($str); ?>
              
            </table>
        </div>
    </div>
</div>
<form action="" method="post" id="opForm">
    <input id="cid" type="hidden" name="data[id]" />
    <input id="act" type="hidden" name="act" />
    <input id="pid" type="hidden" name="data[parent_id]" />
    <input id="name" type="hidden" name="data[nav_name]" />
</form>
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
        $(".opCat").click(function(){
            var obj=$(this).parents("tr");
            $("#cid").val(obj.find("input[name='id']").val());
            $("#act").val(obj.find("select[name='act']").val());
            $("#pid").val(obj.find("select[name='parent_id']").val());
            $("#name").val(obj.find("input[name='nav_name']").val());
            if($("#act").val()=="del"){
                popup.confirm('你真的打算删除该分类吗?','温馨提示',function(action){
                    if(action == 'ok'){
                        commonAjaxSubmit("","#opForm");
                    }
                });
                return false;
            }
            commonAjaxSubmit("","#opForm");
        });
        var chn=function(cid,op){
            if(op=="show"){
                $("tr[pid='"+cid+"']").each(function(){
                    $(this).removeAttr("status").show();
                    chn($(this).attr("cid"),"show");
                });
            }else{
                $("tr[pid='"+cid+"']").each(function(){
                    $(this).attr("status",1).hide();
                    chn($(this).attr("cid"),"hide");
                });
            }
        }
        // $(".tree").click(function(){
        //     if($(this).attr("status")!=1){
        //         chn($(this).parent().attr("cid"),"hide");
        //         $(this).attr("status",1);
        //     }else{
        //         chn($(this).parent().attr("cid"),"show");
        //         $(this).removeAttr("status");
        //     }
        // });
    });
</script>
</body>
</html>