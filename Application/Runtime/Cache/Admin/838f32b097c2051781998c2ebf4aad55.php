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
                <div class="current" style="max-width: 100px; float: left;">会员等级列表</div>
                <div style="width: 100px;float: right;"></div>
            </div>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tab">

                <thead>
                <!-- 0 -->
                <tr><td colspan="7" align="left">
                            <form action="/index.php/conist/Personal/userLevel" method="get">
                                用户id/手机号：<input type="text" name="keyword" value="<?php echo $_GET['keyword']; ?>" size="30" style="margin-right: 20px;">
                                <input type="submit" value="搜索">
                            </form>
                        </td></td></tr>
                <tr align="center">
                    <!-- 1 -->
                    <td width="7%">ID</td>
                    <td width="10%">会员等级名称</td>
                    <!-- 2 -->
               
                    <td width="10%">邀请人的奖金比率</td>
                    <!-- 9 -->
                    <td width="5%">任务分成比率</td>
                    <!-- 10 -->
                    <td width="5%">团队推荐比率</td>
                    <!-- 11 -->
                    <td width="3%">团队任务比率</td>
                    <!-- 12 -->
                    <!-- <td width="7%">培训经历</td> -->
                    <!-- 13 -->
                    <!-- <td width="8%">简介</td> -->
                    <!-- 14 -->
                   <!--  <td width="5%">是否认证</td> -->
                    <!-- 15 -->
                    <td width="10%">操作</td>
                    
                </tr>
                </thead>
                <tbody>
                <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$tree): $mod = ($i % 2 );++$i;?><tr pid="<?php echo ($tree["id"]); ?>" cid="<?php echo ($tree["id"]); ?>">
                        <!-- 0 -->
                        <input type="hidden" name="id" value="<?php echo ($tree["id"]); ?>"/>
                        <!-- 1 -->
                        <td  align="center"><?php echo ($tree["id"]); ?></td>
                        <td  align="center"><?php echo ($tree["level_name"]); ?></td>
                        <!-- 2 -->
                        
                        <!-- 3 -->
                        <td align="center"><?php echo ($tree["invite_ratio"]); ?>/人</td>
                        <td align="center"><?php echo ($tree["task_ratio"]); ?>%</td>
                        <td align="center"><?php echo ($tree["team_invite_ratio"]); ?>/人</td>
                        <td align="center"><?php echo ($tree["team_task_ratio"]); ?>%</td>

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
                       
                        <!-- <td align="center"><?php echo ($tree["user_type"]); ?></td> -->
                        <!-- 9 -->
                        <!-- <td align="center"><?php echo ($tree["user_academic"]); ?></td> -->
                        <!-- 10 -->
                        <!-- <td align="center"><?php echo ($tree["user_artdirection"]); ?></td> -->
                        <!-- 11 -->
                        <!-- <td align="center"><?php echo ($tree["user_achievement"]); ?></td> -->
                        <!-- 12 -->
                       <!--  <td align="center"><?php if($tree['is_auth'] == 0){ ?>
                            <?php echo "未认证";?>
                        <?php }elseif($tree['is_auth'] == 1){ ?>
                            <?php echo "审核中";?>
                        <?php }else{ ?>
                        <?php echo "审核通过";?>
                        <?php } ?></td> -->
                        <!-- 13 -->
                        <!-- <td align="center"><?php echo ($tree["user_introduce"]); ?></td> -->
                        <!-- 14 -->
                      <!--   <td align="center"></td> -->
                        <!-- 15 -->
                        <td align="center" ><!-- <button class="btn" onclick="window.location.href='<?php echo U('Personal/picarr');?>?id=<?php echo ($tree["user_id"]); ?>'">相册</button> -->
                            <!-- <button type="button" class="btn" onclick="window.location.href='<?php echo U('Personal/edit');?>?id=<?php echo ($tree["user_id"]); ?>'">编辑</button> -->
                            <button class="btn" onclick="window.location.href='<?php echo U('Personal/levelDetail');?>?id=<?php echo ($tree["id"]); ?>'">详细信息</button>
                        </td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                <tr><td colspan="8" align="left">
                    <form action="<?php echo U('Personal/export');?>" method="post">
                                日期：
                                <select name="time" class="time">
                                    <option value="-1">全部</option>
                                    <option value="1" <?php if($_GET['time']==1)echo selected; ?>>当天</option>
                                    <option value="2" <?php if($_GET['time']==2)echo selected; ?>>当周</option>
                                    <option value="3" <?php if($_GET['time']==1)echo selected; ?>>当月</option>
                                </select>
                                <input type="date" name="starttime" class="starttime" />
                                <input type="date" name="endtime" class="endtime" />
                                <input type="submit" value="导出EXCEL">
                    </form>
                        </td></td></tr>
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
        var starttime,endtime;
        starttime = endtime =0
            $(".starttime").change(function(){
                 starttime=Date.parse(new Date($(".starttime").val()))/1000;
                 // var endtime=Date.parse(new Date($(".endtime").val()))/1000;
                 $(".starttime").val(starttime)
                  console.log(starttime);
            })
            $(".endtime").change(function(){
                 //var starttime=Date.parse(new Date($(".starttime").val()))/1000;
                  endtime=Date.parse(new Date($(".endtime").val()))/1000;
                  $(".endtime").val(endtime)
                  console.log(endtime);
            })
            // $("#export").click(function(){
            //     var time = $(".time").val();
            //     $.ajax({
            //             url: '<?php echo U("Personal/export");?>',
            //             type: 'POST',
            //             async: "true",
            //             data: {
            //                 time: time,
            //                 starttime:starttime,
            //                 endtime:endtime
            //             },
            //             dataType: 'json',
            //             success: function(data) {
            //                 alert(data.msg)
            //             }
            //     });
            // });


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