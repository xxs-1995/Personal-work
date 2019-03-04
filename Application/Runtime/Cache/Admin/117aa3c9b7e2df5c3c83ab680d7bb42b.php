<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
                <div class="current" style="max-width: 100px; float: left;">帮助与反馈</div>
                <div style="width: 100px;float: right;"></div>
            </div>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tab">

                <thead>
                <!-- 0 -->
                <tr align="center">
                    <!-- 1 -->
                    <!-- <td width="7%">账号</td> -->
                    <!-- 2 -->
                    <td width="5%">昵称</td>
                    <!-- 3 -->
                    <!-- <td width="3%">年龄</td> -->
                    <!-- 4 -->
                    <!-- <td width="3%">性别</td> -->
                    <!-- 5 -->
                    <!-- <td width="5%">头像</td> -->
                    <!-- 6 -->
                    <!-- <td width="10%">学校</td> -->
                    <!-- 7 -->
                    <!-- <td width="10%">目标学校</td> -->
                    <!-- 8 -->
                    <td width="10%">ID号</td>
                    <!-- 9 -->
                    <td width="5%">手机号</td>
                    <!-- 10 -->
                    <!-- <td width="5%">艺考方向</td> -->
                    <!-- 11 -->
                    <!-- <td width="3%">文化成绩</td> -->
                    <!-- 12 -->
                    <!-- <td width="7%">培训经历</td> -->
                    <!-- 13 -->
                    <!-- <td width="8%">简介</td> -->
                    <!-- 14 -->
                    <!-- <td width="5%">问题</td> -->
                    <td width="5%">建议</td>
                    <td width="10%">提交时间</td>
                    <!-- 15 -->
                    <td width="5%">操作</td>
                    
                </tr>
                </thead>
                <tbody>
                <?php if(is_array($info)): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$tree): $mod = ($i % 2 );++$i;?><tr pid="<?php echo ($tree["parent_id"]); ?>" cid="<?php echo ($tree["help_id"]); ?>">
                        <!-- 0 -->
                        <input type="hidden" name="id" value="<?php echo ($tree["help_id"]); ?>"/>
                        <!-- 1 -->
                        <!-- <td  align="center"><?php echo ($tree["user_name"]); ?></td> -->
                        <!-- 2 -->
                        <td  class="tree" align="center"><?php echo ($tree["user_nickname"]); ?></td>
                        <!-- 3 -->
                        <!-- <td align="center"><?php echo ($tree["user_age"]); ?></td> -->
                        <!-- 4 -->
                        <!-- <td align="center"><?php if($tree['user_sex'] == 0){ ?>
                            <?php echo "女";?>
                        <?php }else{ ?>
                            <?php echo "男";?>
                        <?php }?></td> -->
                        <!-- 5 -->
                        <!-- <td ><img src="" alt="" width="50" height="50" /><?php echo ($tree["user_img"]); ?></td> -->
                        <!-- 6 -->
                        <!-- <td align="center"><?php echo ($tree["user_attendschool"]); ?></td> -->
                        <!-- 7 -->
                        <!-- <td align="center"><?php echo ($tree["user_school"]); ?></td> -->
                        <!-- 8 -->
                        <td align="center"><?php echo ($tree["user_id"]); ?></td>
                        <td align="center"><?php echo ($tree["user_tel"]); ?></td>
                        <!-- 9 -->
                        <!-- <td align="center"><?php echo ($tree["user_academic"]); ?></td> -->
                        <!-- 10 -->
                        <!-- <td align="center"><?php echo ($tree["user_artdirection"]); ?></td> -->
                        <!-- 11 -->
                        <!-- <td align="center"><?php echo ($tree["user_achievement"]); ?></td> -->
                        <!-- 12 -->
                        <!-- <td align="center"><?php if($tree['user_experience'] == 0){ ?>
                            <?php echo "未参加";?>
                        <?php }else{ ?>
                            <?php echo "已参加";?>
                        <?php }?></td> -->
                        <!-- 13 -->
                        <!-- <td align="center"><?php echo ($tree["question"]); ?></td> -->
                        <!-- 14 -->
                        <td align="center"><?php echo ($tree["advice"]); ?></td>
                        <td align="center"><?php echo (date("Y-m-d H:i:s",$tree["createtime"])); ?></td>

                        <!-- 15 -->
                        <td align="center" ><!-- <button class="btn" onclick="window.location.href='<?php echo U('Personal/picarr');?>?id=<?php echo ($tree["user_id"]); ?>'">相册</button> -->
                            <a link="<?php echo U('helpDel',array('id'=>$tree['help_id']));?>" href="javascript:void(0)" name="此反馈" class="del">删除 </a>
                            <!-- <button class="btn" onclick="window.location.href='<?php echo U('Personal/select');?>?id=<?php echo ($tree["user_id"]); ?>'">详细信息</button> -->
                        </td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                <tr>
                    <td colspan="10" align="right" ><?php echo ($page); ?>
                    </td>
                </tr>
                </tbody>
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
<script type="text/javascript">
    $(function(){
        $(".del").click(function(){
            var delLink=$(this).attr("link");
            $this = $(this);
            popup.confirm('你真的打算删除【<b>'+$(this).attr("name")+'</b>】吗?','温馨提示',function(action){
                if(action == 'ok'){
                    delByLink(delLink,$this);
                }
            });
            return false;
        });
    });
</script>
</body>
</html>