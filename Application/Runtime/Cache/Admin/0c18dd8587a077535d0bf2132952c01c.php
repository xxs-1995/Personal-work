<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>后台管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='会员管理 > 入驻申请列表'; ?>
        <link rel="stylesheet" type="text/css" href="/Public/Min/?f=/Public/Admin/Css/base.css|/Public/Admin/Css/layout.css|/Public/Js/asyncbox/skins/default.css<?php echo ($addCss); ?>" />
<script type="text/javascript" src="/Public/Min/?f=/Public/Js/jquery-1.9.0.min.js|/Public/Js/jquery.lazyload.js|/Public/Js/functions.js|/Public/Admin/Js/base.js|/Public/Js/jquery.form.js|/Public/Js/asyncbox/asyncbox.js<?php echo ($addJs); ?>"></script>
<link rel="stylesheet" type="text/css" href="/Public/Css/page.css">

        <style>
        .active{
          
            transform: scale(15);
        }
        </style>
        
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
                        <div class="current">申请列表</div>
                    </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab">
                        <thead>
                            <tr>
                                <td>用户id</td>
                                <td>用户名</td>
                                <td>应用方向</td>
                                <td>联系方式</td>
                                <td>微信</td>
                                <td>qq</td>
                                <td>邮箱</td>
                                <td>申请时间</td>
                                <td>申请类型</td>
                                <td>审核状态</td>

                                <td width="150">操作</td>
                            </tr>
                        </thead>
                        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr align="center" id="<?php echo ($vo["teacher_id"]); ?>" class="imgs">
                        <td align="center"><?php echo ($vo["teacher_userid"]); ?></td>  
                            
                                <td align="center"><?php echo ($vo["true_name"]); ?></td>
                                <td><?php echo ($vo["direction"]); ?></td>
                                <td><?php echo ($vo["phone"]); ?></td>
                                <td><?php echo ($vo["wechat"]); ?></td>
                                <td><?php echo ($vo["qq"]); ?></td>
                                <td><?php echo ($vo["email"]); ?></td>
                                <td><?php echo (date("Y-m-d H:i:s",$vo["createtime"])); ?></td>
                                <td><?php echo ($vo["type"]); ?></td>
                                <td>
                                <?php if($vo["teacher_examine"] == 0): ?>待审核<?php elseif($vo["teacher_examine"] == 1): ?>已批准<?php else: ?>已拒绝<?php endif; ?>
                                </td>
                                <!-- <td><img src="<?php echo ($vo["liveLogo"]); ?>" alt="" class="img1" width="70" height="50"/></td> -->
                                <!-- <td><img src="<?php echo ($vo["poster"]); ?>" alt="" class="img1" width="70" height="50"/></td> -->
                                <!-- <td><?php echo ($vo["liveName"]); ?></td> -->
                                <!-- <td><?php echo ($vo["wechat"]); ?></td> -->
                                <!-- <td><?php echo ($vo["phone"]); ?></td> -->
                                
                                <td>
                                    <a href="<?php echo U('Personal/applyDetail/',array('id'=>$vo['teacher_id'],'user_id'=>$vo['teacher_userid']));?>">详情</a>
                                    <?php if($vo['teacher_examine'] == 0): ?>[ <a link="<?php echo U('Personal/applyteacher_ok/',array('id'=>$vo['teacher_id'],'user_id'=>$vo['teacher_userid']));?>" href="javascript:void(0)"  class="ok">批准 </a> ][ <a link="<?php echo U('Personal/applyteacher_no/',array('id'=>$vo['teacher_id'],'user_id'=>$vo['teacher_userid']));?>" href="javascript:void(0)" class="no">拒绝 </a> ]
                                    <?php else: ?>   
                                        <?php if($vo['teacher_examine'] == 1): ?>已通过<?php elseif($vo['teacher_examine'] == 2): ?>已拒绝<?php endif; endif; ?> 
                                </td>
                               
                            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                        <tr><td colspan="12" align="right"><div class="msdn "><?php echo ($page); ?></div></td></tr>
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
                $(".ok").click(function(){
                    var delLink=$(this).attr("link");
                    $this = $(this);
                    popup.confirm('确定批准?','温馨提示',function(action){
                        
                        if(action == 'ok'){
                            delByLink(delLink,$this);
                            window.location.reload();
                            // top.window.location.href=delLink;
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
                            window.location.reload();
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


             // var imgs=$(".img1");
             // console.log(imgs);
             // for(var i=0;i<imgs.length;i++){
             //    imgs[i].click(function(e){
             //        alert(e.target);
             //        e.preventDefault();
             //        this.toggleClass("active");
             //    })

         
        </script>
        <script>
        $(function(){
              $('.img1').click(function(){
                $(this).toggleClass('active');
            })
        })
        </script>
    </body>
</html>