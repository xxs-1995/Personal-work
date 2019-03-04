<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>课程管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='会员管理 > 提现列表'; ?>
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
                        <div class="current">提现列表</div>
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab">
                        <thead>
                            <tr>
                                <td>用户id</td>
                                <td>用户昵称</td>
                                <td>提现金额</td>
                                <td>提现手续费</td>
                                <td>到账金额</td>
                                <td>提现地址</td>
                                <td>钱包标签</td>
                                <td>状态</td>
                                <td>创建时间</td>
                                <!-- <td>状态</td> -->
                                <td width="150">操作</td>
                            </tr>
                        </thead>
                        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr align="center" id="<?php echo ($vo["back_id"]); ?>">
                                <td><?php echo ($vo["user_id"]); ?></td>
                                <td align="center"><?php echo ($vo["user_nickname"]); ?></td>
                                <td><?php echo ($vo["should_fee"]); ?></td>
                                <td><?php echo ($vo["service_fee"]); ?></td>
                                <td><?php echo ($vo["reality_fee"]); ?></td>
                                <td><?php echo ($vo["pay_code"]); ?></td>
                                <td><?php echo ($vo["label"]); ?></td>
                                <td><?php if($vo["state"] == 0): ?>待审核<?php elseif($vo["state"] == 1): ?>已批准<?php else: ?>已拒绝<?php endif; ?></td>
                                <td><?php echo (date("Y-m-d H:i:s",$vo["createtime"])); ?></td>
                                <!-- <td><?php echo (date("Y-m-d H:i:s",$vo["starttime"])); ?></td> -->
                                <!-- <td><a href="javascript:void(0);" onclick="changeStatus(<?php echo ($vo["id"]); ?>,this)"><?php echo ($vo["display"]); ?></a></td>
                                <td><a href="javascript:void(0);" onclick="changeAttr(<?php echo ($vo["id"]); ?>,this)"><img src="/Public/Img/action_<?php echo ($vo["is_recommend"]); ?>.png" border="0"></a>
                                    </if></td> -->
                                <td>
                                    <?php if($vo['state'] == 0): ?>[ <a link="<?php echo U('Personal/withdrawals_ok/',array('id'=>$vo['back_id'],'user_id'=>$vo['user_id']));?>" href="javascript:void(0)"  class="ok">批准 </a> ][ <a link="<?php echo U('Personal/withdrawals_no/',array('id'=>$vo['back_id'],'user_id'=>$vo['user_id']));?>" href="javascript:void(0)" class="no">拒绝 </a> ]
                                    <?php else: ?>   
                                        <?php if($vo['state'] == 1): ?>已通过<?php elseif($vo['state'] == 2): ?>已拒绝<?php endif; endif; ?> 
                                </td>
                            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                        <tr><td colspan="8" align="left">
                            <form action="<?php echo U('Personal/export_with');?>" method="post">
                                        日期：
                                        <select name="time" class="time">
                                            <option value="-1">全部</option>
                                            <option value="1" <?php if($_GET['time']==1)echo selected; ?>>当天</option>
                                            <option value="2" <?php if($_GET['time']==2)echo selected; ?>>当周</option>
                                            <option value="3" <?php if($_GET['time']==1)echo selected; ?>>当月</option>
                                        </select>
                                        <input type="hidden" name="user_id" value="<?php echo $_GET['user_id']; ?>"/>
                                        <input type="date" name="starttime" class="starttime" />
                                        <input type="date" name="endtime" class="endtime" />
                                        <input type="submit" value="导出EXCEL">
                            </form>
                        </td></td></tr>

                        <tr><td colspan="6" align="right"><div class="msdn "><?php echo ($page); ?></div></td></tr>
                    </table>
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
                $(".ok").click(function(){
                    var delLink=$(this).attr("link");
                    $this = $(this);
                    popup.confirm('确定批准?','温馨提示',function(action){
                        if(action == 'ok'){
                            delByLink(delLink,$this);
                            window.location.reload()
                            //top.window.location.href=delLink;
                        }
                    });
                    return false;
                });
                $(".no").click(function(){
                    var delLink=$(this).attr("link");
                    $this = $(this);
                    popup.confirm('确定拒绝?','温馨提示',function(action){
                        if(action == 'ok'){
                            delByLink(delLink,$this);
                            window.location.reload()
                            //top.window.location.href=delLink;
                        }
                    });
                    return false;
                });
            });
            function changeAttr(id,v){
                $.get('<?php echo U("News/changeAttr");?>?id='+id,function(data){
                    if(data.status==1){
                        $(v).html(data.info);
                    }
                });
            }
            function changeStatus(id,v){
                $.get('<?php echo U("News/changeStatus");?>?id='+id,function(data){
                    if(data.status==1){
                        $(v).html(data.info);
                    }
                });
            }
        </script>
    </body>
</html>