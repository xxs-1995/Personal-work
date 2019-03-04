<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>添加、编辑产品-后台管理-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='参数设置 > 添加货币'; ?>
        <link rel="stylesheet" type="text/css" href="/Public/Min/?f=/Public/Admin/Css/base.css|/Public/Admin/Css/layout.css|/Public/Js/asyncbox/skins/default.css<?php echo ($addCss); ?>" />
<script type="text/javascript" src="/Public/Min/?f=/Public/Js/jquery-1.9.0.min.js|/Public/Js/jquery.lazyload.js|/Public/Js/functions.js|/Public/Admin/Js/base.js|/Public/Js/jquery.form.js|/Public/Js/asyncbox/asyncbox.js<?php echo ($addJs); ?>"></script>
<link rel="stylesheet" type="text/css" href="/Public/Css/page.css">

        <style>
            div.spot {
                float: left;
                margin: 0 20px 0 0;
                width: 220px;
                min-height: 160px;
                border: 2px dashed #ddd;
            }
            .droparea {
                position: relative;
                text-align: center;
            }
            .droparea .instructions {
                opacity: 0.8;
                background-color: #cccccc;
                height: 25px;
                z-index: 10;
                zoom: 1;
                background-position: initial initial;
                background-repeat: initial initial;
                cursor: pointer;
            }
            .droparea div, .droparea input {
                position: absolute;
                top: 0;
                width: 100%;
                height: 100%;
            }
            .droparea input {
                cursor: pointer;
                opacity: 0;
            }
            .droparea div, .droparea input {
                position: absolute;
                top: 0;
                width: 100%;
                height: 100%;
            }
            #uparea1,#uparea2,#uparea3{
                height: 170px;
                cursor: pointer;
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
                        <div class="current">添加编辑货币</div>
                    </div>
                    <form>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
                         
                            <tr>
                                <th width="100">货币名称：</th>
                                <td><input id="title" type="text" class="input" size="60" name="info[title]" value="<?php echo ($info["title"]); ?>"/> </td>
                            </tr>

                           

                            <tr>
                                <th>图片：</th>
                                <td>
                                    <div class="droparea spot" id="image1" style="background-image: url('<?php echo ($info["header"]); ?>');background-size: 220px 160px;" ><div class="instructions" onclick="del_image('1')">删除</div><div id="uparea1"></div><input type="hidden" name="info[header]" id="image_1" value="<?php echo ($info["header"]); ?>" /></div>
                                    <!-- <div class="droparea spot" id="image2" style="background-image: url('<?php echo ($img_info[1]['savepath']); ?>');background-size: 220px 160px;" ><div class="instructions" onclick="del_image('2')">删除</div><div id="uparea2"></div><input type="hidden" name="image_1[]" id="image_2" value="<?php echo ($img_info[1]['savepath']); ?>" /></div>
                                    <div class="droparea spot" id="image3" style="background-image: url('<?php echo ($img_info[2]['savepath']); ?>');background-size: 220px 160px;" ><div class="instructions" onclick="del_image('3')">删除</div><div id="uparea3"></div><input type="hidden" name="image_1[]" id="image_3" value="<?php echo ($img_info[2]['savepath']); ?>" /></div> -->
                                </td>
                            </tr>
                            
                            <tr>
                                <th>总数量：</th>
                                <td><input type="text" class="input" size="20" name="info[num]" value="<?php echo ($info["num"]); ?>"/></td>
                            </tr>
                            <tr>
                                <th>释放倍率：</th>
                                <td><input type="text" class="input" size="20" name="info[rate]" value="<?php echo ($info["rate"]); ?>"/></td>
                            </tr>
                                
                            <tr>
                                <th>与人民币汇率：</th>
                                <td><input type="text" class="input" size="20" name="info[cny]" value="<?php echo ($info["cny"]); ?>"/></td>
                            </tr>
                            <tr>
                                <th>简介：</th>
                                <td><textarea id="content" class="input" style="height: 300px; width: 50%;" name="info[content]"><?php echo ($info["content"]); ?></textarea></td>
                            </tr>
                            <input type="hidden" value="<?php echo ($info['bid']); ?>" name='info[bid]'>
                        </table>
                        <?php if(empty($_GET['do'])){ ?>
                        <?php }else{ $action_url='/index.php/conist/Product/createbi'; } ?>
                    </form>
                    <div class="commonBtnArea" >
                        <button class="btn submit">提交</button>
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
            function del_image(num){
                $('#image'+num).css('background-image','');
                $('#image_'+num).val('');
            }
            $(function(){

                var  content ;
                KindEditor.ready(function(K) {
                    content = K.create('#content',{
                        allowFileManager : true,
                        uploadJson:'/Public/kindeditor/php/upload_json.php?dirname=product'
                    });
                });

                KindEditor.ready(function(K) {
                    K.create();
                    var editor = K.editor({
                        allowFileManager : true,
                        uploadJson:'/Public/kindeditor/php/upload_json.php?dirname=product'
                        //sdl:false
                    });
                    K('#uparea1').click(function() {
                        editor.loadPlugin('image', function() {
                            editor.plugin.imageDialog({
                                imageUrl : K('#image_1').val(),
                                clickFn : function(url, title, width, height, border, align) {
                                    $('#image1').css('background-image','url('+url+')').css('background-size','220px 160px');
                                    K('#image_1').val(url);
                                   // K('#getImgUrl').val(url);
                                    editor.hideDialog();
                                }
                            });
                        });
                    });

                    K('#uparea2').click(function() {
                        editor.loadPlugin('image', function() {
                            editor.plugin.imageDialog({
                                imageUrl : K('#image_2').val(),
                                clickFn : function(url, title, width, height, border, align) {
                                    $('#image2').css('background-image','url('+url+')').css('background-size','220px 160px');
                                    K('#image_2').val(url);
                                    // K('#getImgUrl').val(url);
                                    editor.hideDialog();
                                }
                            });
                        });
                    });

                    K('#uparea3').click(function() {
                        editor.loadPlugin('image', function() {
                            editor.plugin.imageDialog({
                                imageUrl : K('#image_3').val(),
                                clickFn : function(url, title, width, height, border, align) {
                                    $('#image3').css('background-image','url('+url+')').css('background-size','220px 160px');
                                    K('#image_3').val(url);
                                    // K('#getImgUrl').val(url);
                                    editor.hideDialog();
                                }
                            });
                        });
                    });


                });
                $("#checkNewsTitle").click(function(){
                    if($('#title').val()==''){
                        popup.error('标题不能为空！');
                        return false;
                    }
                    $.getJSON("/index.php/conist/Product/checkProductTitle", { title:$("#title").val(),id:"<?php echo ($info["id"]); ?>"}, function(json){
                        $("#checkNewsTitle").css("color",json.status==1?"#0f0":"#f00").html(json.info);
                    });
                });
                $(".submit").click(function(){
                    if($('#title').val()==''){
                        popup.error('标题不能为空！');
                        return false;
                    }
                    content.sync();
                    commonAjaxSubmit("<?php echo ($action_url); ?>");
                    return false;
                });
            });
        </script>
    </body>
</html>
<!-- <form action="<?php echo U('Tag/editZi');?>" method="post" enctype="multipart/form-data">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
                        <input type="hidden" value="<?php echo ($info['tag_id']); ?>" name='tag_id'>
                        <tr>
                            <th>类别：</th>
                            <td><select name="tag_type" style="width: 80px;" disabled="disabled">
                                <option value="" ><?php echo ($fuji['tag_name']); ?></option>
                            </select></td>
                        </tr>
                        <tr>
                            <th width="120">标签名称：</th>
                            <td><input name="tag_name" type="text" class="input" size="40" value="<?php print_r($info['tag_name']);?>" /> </td>
                        </tr>
                        <tr>
                            <th>图标：</th>
                            <td>
                                <div class="droparea spot" id="image1" style="background-image: url('<?php echo ($img_info[0]['savepath']); ?>');background-size: 220px 160px;" ><div class="instructions" onclick="del_image('1')">删除</div><div id="uparea1"></div><input type="hidden" name="img_url" id="image_1" value="<?php echo ($img_info[0]['savepath']); ?>" /></div>
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" name="id" value="<?php echo ($info["id"]); ?>"/> 
                    <input type="hidden" name="fujiid" value="<?php echo ($fuji['tag_id']); ?>"/>
                    <div class="commonBtnArea" >
                        <button class="btn submit">提交</button>
                    </div>
                </form> -->