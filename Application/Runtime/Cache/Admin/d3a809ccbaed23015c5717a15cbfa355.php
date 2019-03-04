<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>参数设置-<?php echo ($site["SITE_INFO"]["name"]); ?></title>
        <?php $addCss=""; $addJs=""; $currentNav ='参数设置 > 推广参数'; ?>
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
                        <div class="current">参数设置</div>
                    </div>
                    <form method="post">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table1">
                        <input type="hidden" name="id" value="<?php echo ($rate["id"]); ?>" />
                            <tr>
                                <th width="100">推荐新人送算力：</th>
                                <td><input id="name" type="text" class="input" size="5" name="recommend" value="<?php echo ($rate["recommend"]); ?>"/></td>
                                <th width="100">二级推荐送算力：</th>
                                <td><input id="name" type="text" class="input" size="5" name="recommend2" value="<?php echo ($rate["recommend2"]); ?>"/></td>
                                <th width="100">注册送算力：</th>
                                <td><input id="name" type="text" class="input" size="5" name="register" value="<?php echo ($rate["register"]); ?>"/></td>
                                
                            </tr>
                            <tr>
                                <th width="100">推广算力转化<?php echo (C("coin")); ?>比例：</th>
                                <td><input id="name" type="text" class="input" size="5" name="convert" value="<?php echo ($rate["convert"]); ?>"/>%</td>
                                <th width="100">区块算力转化<?php echo (C("coin")); ?>比例：</th>
                                <td><input id="name" type="text" class="input" size="5" name="convert2" value="<?php echo ($rate["convert2"]); ?>"/>%</td>
                                <th width="100">达到奖励的产品id：</th>
                                <td><input id="name" type="text" class="input" size="5" name="pid" value="<?php echo ($rate["pid"]); ?>"/></td>
                            </tr>
                            <tr>
                                <th width="100">销售矿机一级奖励：</th>
                                <td><input id="name" type="text" class="input" size="5" name="reward1" value="<?php echo ($rate["reward1"]); ?>"/>%</td>
                                <th width="100">销售矿机二级奖励：</th>
                                <td><input id="name" type="text" class="input" size="5" name="reward2" value="<?php echo ($rate["reward2"]); ?>"/>%</td>
                                <th width="100">默认验证码：</th>
                                <td><input id="name" type="text" class="input" size="5" name="default_yzm" value="<?php echo ($rate["default_yzm"]); ?>"/></td>
                            </tr>                           
                            <!-- <tr>
                                <th width="100">算力补贴占算例池的比重：</th>
                                <td><input id="name" type="text" class="input" size="5" name="subsidy_rete" value="<?php echo ($rate["subsidy_rete"]); ?>"/></td>
                                <th width="100">算力补贴销售数量：</th>
                                <td><input id="name" type="text" class="input" size="5" name="subsidy_num" value="<?php echo ($rate["subsidy_num"]); ?>"/></td>
                                <th width="100">算力补贴销售累计：</th>
                                <td><input id="name" type="text" class="input" size="10" name="subsidy_price" value="<?php echo ($rate["subsidy_price"]); ?>"/></td>
                            </tr> -->

                            <!-- <tr>
                                <th width="100">达到奖励的产品id：</th>
                                <td><input id="name" type="text" class="input" size="5" name="pid" value="<?php echo ($rate["pid"]); ?>"/></td>
                                <th width="100">BOWT等同人民币的价值：</th>
                                <td><input id="name" type="text" class="input" size="5" name="cny" value="<?php echo ($rate["cny"]); ?>"/></td>
                                <th width="100">算力池占总金额的比例：</th>
                                <td><input id="name" type="text" class="input" size="5" name="pool" value="<?php echo ($rate["pool"]); ?>"/>%</td>
                              
                            </tr> -->

                           <!--  <tr>
                                <th width="100">县级代理人数</th>
                                <td><input id="name" type="text" class="input" size="10" name="countynum" value="<?php echo ($rate["countynum"]); ?>"/></td>
                                <th width="100">县级代理金额</th>
                                <td><input id="name" type="text" class="input" size="10" name="countyprice" value="<?php echo ($rate["countyprice"]); ?>"/></td>
                                <th width="100">县级代理奖励的比率</th>
                                <td><input id="name" type="text" class="input" size="10" name="countyrate" value="<?php echo ($rate["countyrate"]); ?>"/></td>
                            </tr>
                            <tr>
                                <th width="100">市级代理人数</th>
                                <td><input id="name" type="text" class="input" size="10" name="citynum" value="<?php echo ($rate["citynum"]); ?>"/></td>
                                <th width="100">市级代理金额</th>
                                <td><input id="name" type="text" class="input" size="10" name="cityprice" value="<?php echo ($rate["cityprice"]); ?>"/></td>
                                <th width="100">市级代理奖励的比率</th>
                                <td><input id="name" type="text" class="input" size="10" name="cityrate" value="<?php echo ($rate["cityrate"]); ?>"/></td>
                            </tr>
                            <tr>
                                <th width="100">省级代理人数</th>
                                <td><input id="name" type="text" class="input" size="10" name="provincenum" value="<?php echo ($rate["provincenum"]); ?>"/></td>
                                <th width="100">省级代理金额</th>
                                <td><input id="name" type="text" class="input" size="10" name="provinceorice" value="<?php echo ($rate["provinceorice"]); ?>"/></td>
                                <th width="100">省级代理奖励的比率</th>
                                <td><input id="name" type="text" class="input" size="10" name="provincerate" value="<?php echo ($rate["provincerate"]); ?>"/></td>
                            </tr> -->
                             <tr>
                                <th width="100">(提现)手续费比例：</th>
                                <td><input id="name" type="text" class="input" size="5" name="service_fee" value="<?php echo ($rate["service_fee"]); ?>"/>%</td>
                                <th width="100">(挖矿)管理费比例：</th>
                                <td><input id="name" type="text" class="input" size="5" name="manage_fee" value="<?php echo ($rate["manage_fee"]); ?>"/>%</td>
                                <th width="100">ZEC换算CNY比例：</th>
                                <td><input id="name" type="text" class="input" size="5" name="zec_ratio" value="<?php echo ($rate["zec_ratio"]); ?>"/></td>
                            </tr>
                            <tr>
                                <th width="100">ZEC换算USD比例：</th>
                                <td><input id="name" type="text" class="input" size="5" name="zec_usd_rate" value="<?php echo ($rate["zec_usd_rate"]); ?>"/></td>
                            </tr>
                        </table>
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
                        uploadJson:'/Public/kindeditor/php/upload_json.php?dirname=Institution'
                    });
                });

                KindEditor.ready(function(K) {
                    K.create();
                    var editor = K.editor({
                        allowFileManager : true,
                        uploadJson:'/Public/kindeditor/php/upload_json.php?dirname=Institution'
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

                });
              
                $(".submit").click(function(){
                    if($('#name').val()==''){
                        popup.error('姓名不能为空！');
                        return false;
                    }
                    $('form').submit();
                    return false;
                });
            });
        </script>
    </body>
</html>