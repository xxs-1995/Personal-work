<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>订单管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='订单管理 > 订单列表'; ?>
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
                        <div class="current">订单列表</div>
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab">
                        <thead>
                        <tr><td colspan="8" align="left">
                            <form action="/index.php/conist/Order/index" method="get">
                                订单号：<input type="text" class="input" name="order_no" value="<?php echo $_GET['order_no']; ?>" size="30" style="margin-right: 20px;">
                                <input type="hidden" name="user_id" value="<?php echo $_GET['user_id']; ?>"/>
                                <input type="submit" class="btn" value="搜索">
                                日期：
                                <select name="time">
                                    <option value="-1">全部</option>
                                    <option value="1" <?php if($_GET['time']==1)echo selected; ?>>当天</option>
                                    <option value="2" <?php if($_GET['time']==2)echo selected; ?>>当周</option>
                                    <option value="3" <?php if($_GET['time']==1)echo selected; ?>>当月</option>
                                </select>
                            </form>
                        </td></td></tr>
                            <tr>
                                <td>订单号</td>
                                <!-- <td>商品名称</td> -->
                                <td>下单时间</td>
                                <td>收货人</td>
                                <!-- <td>总金额</td> -->
                                <td>应付金额</td>
                                <td>订单状态</td>
                                <!-- <td>状态</td> -->
                                <td width="150">操作</td>
                            </tr>
                        </thead>
                        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr align="center" id="<?php echo ($vo["id"]); ?>">
                                <td align="center"><?php echo ($vo["payno"]); ?></td>
                                <!-- <td><?php echo ($vo["title"]); ?></td> -->
                                <td><?php echo (date("Y-m-d H:i:s",$vo["createtime"])); ?></td>
                                
                              
                                <!-- <td><?php echo (date("Y-m-d H:i:s",$vo["starttime"])); ?></td> -->
                                <td><?php echo ($vo["user_nickname"]); ?></td>
                                <!-- <td><?php echo ($vo["price"]); ?></td> -->
                                <td><?php echo ($vo["price"]); ?></td>
                                <!-- <td><a href="javascript:void(0);" onclick="changeStatus(<?php echo ($vo["id"]); ?>,this)"><?php echo ($vo["display"]); ?></a></td>
                                <td><a href="javascript:void(0);" onclick="changeAttr(<?php echo ($vo["id"]); ?>,this)"><img src="/Public/Img/action_<?php echo ($vo["is_recommend"]); ?>.png" border="0"></a>
                                    </if></td> -->
                                <td><?php if($vo["zt"] == 0): ?>待支付<?php elseif($vo["zt"] == 1): ?>已支付<?php elseif($vo["zt"] == 2): ?>已发货<?php else: ?>已完成<?php endif; ?></td>
                                <td>[ <a href="/index.php/conist/Order/see?id=<?php echo ($vo["id"]); ?>">查看 </a> ] [ <a link="<?php echo U('Subject/delete/',array('id'=>$vo['id']));?>" href="javascript:void(0)" name="<?php echo ($vo["title"]); ?>" class="del">删除 </a> ]</td>
                            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                        <tr><td colspan="8" align="left">
                            <form action="<?php echo U('Order/export');?>" method="post">
                                日期：
                                <select name="time" class="time">
                                    <option value="-1">全部</option>
                                    <option value="1" <?php if($_GET['time']==1)echo selected; ?>>当天</option>
                                    <option value="2" <?php if($_GET['time']==2)echo selected; ?>>当周</option>
                                    <option value="3" <?php if($_GET['time']==1)echo selected; ?>>当月</option>
                                </select>
                                <input type="date" name="starttime" class="starttime" />
                                <input type="date" name="endtime" class="endtime" />
                                <input type="hidden" name="user_id" value="<?php echo $_GET['user_id']; ?>"/>
                                <input type="submit" value="导出EXCEL">
                            </form>
                        </td></td></tr>
                        <tr><td colspan="8" align="right"><?php echo ($page); ?></td></tr>
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
                 //转化为时间戳
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
                $(".del").click(function(){
                    var delLink=$(this).attr("link");
                    $this = $(this);
                    popup.confirm('你真的打算删除【<b>'+$(this).attr("name")+'</b>】吗?','温馨提示',function(action){
                        if(action == 'ok'){
                            delByLink(delLink,$this);
                            //top.window.location.href=delLink;
                        }
                    });
                    return false;
                });
                $("#export").click(function(){
                    var time = $(".time").val();
                    var user_id = $("input[name='user_id']").val();
                    $.ajax({
                            url: '<?php echo U("Order/export");?>',
                            type: 'POST',
                            async: "true",
                            data: {
                                time: time,
                                starttime:starttime,
                                endtime:endtime,
                                user_id:user_id
                            },
                            dataType: 'json',
                            success: function(data) {
                                alert(data.msg)
                            }
                    });
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
            console.log($(".startime"));

           
        </script>
    </body>
</html>