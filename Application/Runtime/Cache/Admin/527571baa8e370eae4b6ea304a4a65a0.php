<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>模型管理-后台管理首页-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='模型管理 > 模型信息'; ?>
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
    <div class="current">模型基本信息</div>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
    <tr>
        <th width="100">模型名称：</th>
        <td><?php echo ($model['name']); ?></td>
    </tr>
    <tr>
        <th width="100">数据表名：</th>
        <td><?php echo ($model['tbl_name']); ?></td>
    </tr>
    <tr>
        <th width="100">是否为内部表：</th>
        <td><?php if($model['is_inner'] == 1): ?>是<?php else: ?>否<?php endif; ?></td>
    </tr>
    <tr>
        <th width="100">字段数：</th>
        <td><?php echo ($model['fields_count']); ?></td>
    </tr>
    <tr>
        <th width="100">记录行数：</th>
        <td><?php echo ($model['rows']); ?></td>
    </tr>
    <tr>
        <th>模型描述：</th>
        <td><?php echo ($model['description']); ?></td>
    </tr>
</table>

<div class="Item hr">
    <div class="current">模型字段信息</div>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab">
    <thead>
        <tr>
            <td>表单域顺序</td>
            <td>字段名称</td>
            <td>字段标签</td>
            <td>字段类型</td>
            <td>是否必填</td>
            <td>是否唯一</td>
            <td>是否索引</td>
            <td>系统字段</td>
            <td>字段操作</td>
        </tr>
    </thead>
    <tbody>
        <?php if(is_array($model['fields'])): $i = 0; $__LIST__ = $model['fields'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$field): $mod = ($i % 2 );++$i;?><tr align="center">
            <td><?php if(0 == $field['show_order']): ?>---<?php else: echo ($field['show_order']); endif; ?></td>
            <td><?php echo ($field['name']); ?></td>
            <td><?php echo ($field['comment']); ?></td>
            <td><?php echo ($field['type']); ?></td>
            <td><?php if($field['is_require'] == 1): ?>是<?php else: ?>否<?php endif; ?></td>
            <td><?php if($field['is_unique'] == 1): ?>是<?php else: ?>否<?php endif; ?></td>
            <td><?php if($field['is_index'] == 1): ?>是<?php else: ?>否<?php endif; ?></td>
            <td><?php if($field['is_system'] == 1): ?>是<?php else: ?>否<?php endif; ?></td>
            <td><?php if($field['is_system'] == 0): ?>[ <a href="<?php echo U('Fields/edit', array('model_id' => $model['id'], 'field_id' => $field['id']));?>">编辑</a> ] [ <a href="<?php echo U('Fields/delete', array('model_id' => $model['id'], 'field_id' => $field['id']));?>" name="<?php echo ($field['name']); ?>" class="del">删除</a> ]<?php else: ?><a href="javascript:void(0);" class="toggle" value="<?php echo U('Fields/toggleListShow', array('field_id' => $field['id']));?>" status="<?php echo ($field['is_list_show']); ?>" name="<?php echo ($field['name']); ?>"><?php if($field['is_list_show'] == 1): ?>不在数据列表中显示<?php else: ?>数据列表中显示<?php endif; ?></a><?php endif; ?></td>
        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
    </tbody>
</table>
<div class="commonBtnArea" >
    <button class="btn submit" onclick="window.location.href='<?php echo U('Fields/add', array('model_id' => $model['id']));?>'">添加字段</button>
</div>

<script type="text/javascript">
$(function(){
    $(".del").click(function(){
        var url = $(this).attr("href");
        popup.confirm('你真的打算删除 <b>'+$(this).attr("name")+'</b> 吗?','温馨提示',function(action){
            if(action == 'ok'){
                $.getJSON(url, function(json) {
                    if (json.status) {
                        popup.success(json.info);
                        setTimeout(function(){
                            popup.close("asyncbox_success");
                            top.window.location.reload();
                        }, 2000);
                    } else {
                        popup.error(json.info);
                        setTimeout(function(){
                            popup.close("asyncbox_error");
                        }, 2000);
                    }
                });
            }
        });
        return false;
    });

    $(".toggle").click(function(){
        var url = $(this).attr("value");
        var name = $(this).attr("name");
        var status = $(this).attr("status") || 0;
        status = status == 0 ? '显示' : '不显示';

        popup.confirm('您确定在数据列表中'+ status + " <b>" + name + "</b> 字段吗？", '温馨提示',function(action){
            if(action == 'ok'){
                $.getJSON(url, function(json){
                    if (json.status) {
                        popup.success(json.info);
                        setTimeout(function(){
                            popup.close("asyncbox_success");
                        },2000);
                    } else {
                        popup.error(json.info);
                        setTimeout(function(){
                            popup.close("asyncbox_error");
                        },2000);
                    }

                    setTimeout(function(){
                        top.window.location.reload();
                    },1000);
                });
            }
        });

        return false;
    });

});
</script>
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
    </body>
</html>