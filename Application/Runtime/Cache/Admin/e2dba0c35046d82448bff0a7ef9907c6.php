<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>订单管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
    <?php $addCss=""; $addJs=""; $currentNav ='订单管理 > 订单信息'; ?>
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
                    <div class="current">基本信息</div>
                </div>
                <form action="" method="post">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
                        <tr>
                            <th width="120">订单号：</th>
                            <td><input name="" type="text" class="input" size="30" value="<?php echo ($info["payno"]); ?>" disabled/></td>
                        </tr>
                        <tr>
                            <th width="120">订单状态：</th>
                            <td><label><input type="radio" class="input" name="info[zt]" value="0" disabled <?php if($info['zt'] == 0): ?>checked<?php endif; ?>>待付款</label>
                                <!-- <label><input type="radio" class="input" name="zt" value="1" disabled <?php if($info['zt'] == 1): ?>checked<?php endif; ?>>待发货</label> -->
                                <!-- <label><input type="radio" class="input" name="zt" value="3" disabled <?php if($info['zt'] == 3): ?>checked<?php endif; ?>>待评价</label> -->
                                <!-- <label><input type="radio" class="input" name="info[zt]" value="4"  <?php if($info['zt'] == 4): ?>checked<?php endif; ?>>待收货</label> -->
                                <label><input type="radio" class="input" name="info[zt]" value="1" disabled <?php if($info['zt'] == 1): ?>checked<?php endif; ?>>已付款</label>
                                <label><input type="radio" class="input" name="info[zt]" value="2"  <?php if($info['zt'] == 2): ?>checked<?php endif; ?>>已发货</label>
                                <label><input type="radio" class="input" name="info[zt]" value="3"  <?php if($info['zt'] == 3): ?>checked<?php endif; ?>>已完成</label>
                            </td>
                        </tr>
                        <tr>
                            <th width="120">下单时间：</th>
                            <td><input name="" type="text" class="input" size="30" value="<?php echo ($info["createtime"]); ?>" disabled/></td>
                        </tr>
                        <tr>
                            <th width="120">总价：</th>
                            <td><input name="" type="text" class="input" size="30" value="<?php echo ($info["price"]); ?>" disabled/></td>
                        </tr>
                        <tr>
                            <th width="120">支付方式：</th>
                            <td><label><?php echo ($info["pay_type"]); ?></label>
                            </td>
                        </tr>
                        <tr>
                            <th width="120">付款时间：</th>
                            <td><input name="" type="text" class="input" size="30" value="<?php echo ($info["fk_time"]); ?>" disabled/></td>
                        </tr>
                    </table>
                    <input type="hidden" name="id" value="<?php echo ($info["id"]); ?>"/>
                </form>
                <div class="Item hr">
                    <div class="current">订单信息</div>
                </div>
                <table width="50%" border="0" cellspacing="0" cellpadding="0" class="table1">
                    <?php if(is_array($info[orderdea])): $i = 0; $__LIST__ = $info[orderdea];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                            <th width="120">商品<?php echo ($vo["m"]); ?>：</th>
                            <td><?php echo ($vo["title"]); ?></td>
                            <th width="120">售价：</th>
                            <td><?php echo ($vo["shoujia"]); ?></td>
                            <th width="120">数量：</th>
                            <td><?php echo ($vo["num"]); ?></td>
                            <th width="120">图片：</th>
                            <td><img src="<?php echo ($vo["img_url"]); ?>" alt="" width="80" height="50"/></td>
                        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                </table>
                <div class="Item hr">
                    <div class="current">收货人信息</div>
                </div>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
                        <tr>
                            <th width="120">电话：</th>
                            <td><input name="" type="text" class="input" size="30" value="<?php echo ($info["sh_phone"]); ?>" disabled/></td>
                        </tr>
                        <tr>
                            <th width="120">名字：</th>
                            <td><input name="" type="text" class="input" size="30" value="<?php echo ($info["sh_name"]); ?>" disabled/></td>
                        </tr>
                        <tr>
                            <th width="120">地址：</th>
                            <td><input name="" type="text" class="input" size="30" value="<?php echo ($info["address"]); ?>" disabled/></td>
                        </tr>
                    </table>
                <div class="commonBtnArea" >
                    <button class="btn submit">提交</button>
                    <button class="btn" onClick="javascript :history.back(-1);">返回</button>
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
<script type="text/javascript" src="/Public/kindeditor/kindeditor.js"></script><script type="text/javascript" src="/Public/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript">
    $(function(){
        $(".submit").click(function(){
            commonAjaxSubmit();
            return false;
        });
    });
</script>
</body>
</html>