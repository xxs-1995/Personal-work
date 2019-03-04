<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html style="height: 100%;">
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>

    <link rel="stylesheet" href="/Public/Admin/Css/ionic.css"/>

    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
    <!--<link rel="stylesheet" href="../css/bootstrap.min.css"/>-->

    <title></title>

    <style>
        ul{
            margin-left: 0px;
        }
        *{
            margin: 0px;
            padding: 0px;
            list-style: none;
        }
        p{
            margin: 0px;
        }
        body{
            background-color: #eee;
            min-width: 100%;
            height: 100%;
        }
        

        .zixun-p1{
            font-size: 1.2rem;
            font-weight: bold;
            /* margin-top: 50px; */
            /* padding-left: 5%; */
            padding-right: 5%;
            line-height: 2rem;
        }
        .zixun-ul1{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            padding-left: 5%;
            padding-right: 5%;
            margin-top: 10px;
        }
        .all {
            height: 100%;
            overflow: hidden;
            background-color: white;
            overflow-y: auto;
            padding-top: 5%;
            /* padding-left: 5%; */
           /* padding-right: 10%;*/
        }
        .nei{
            /*text-indent: 2rem;*/
            padding-left: 5%;
            padding-right: 5%;
        }
        .wu li{
            list-style: none;
            float: left;
            width: 14%;
            margin-left: 5%;
        }
        .wu{
            height: auto;
            overflow: hidden;
            margin-bottom: 100px;
        }
        .wu li img{
           display: inline-block;
            width: 100%;
        }
        .footer2{
            border-top: 1px solid #eee;
            height: auto;
            overflow: hidden;
            position: fixed;
            left: 0px;
            bottom: 0px;
            width: 100%;
            padding-top: 7px;
            background-color: white;
            z-index: 100;
        }
        .footer2 li{
           list-style: none;
    float: left;
    width: 17%;
    margin-left: 5%;
    text-align: center;
        }
        .footer2 li img{
           display: inline-block;
    width: 44%;
        }
#geren{
    color: white;
    font-size: 1.5rem;
}

img { -ms-interpolation-mode: bicubic; }

img { width: 100%; }


    </style>
</head>
<body>
<!-- <div class="bar " style="background:#fe6900;position:static;height: 50px">
    <button class="icon ion-chevron-left" style="background-color: #fe6900;border:0;color: white" onclick="history.go(-1)"></button>
    <div class="h1 title" id="geren"><?php echo ($school); ?></div>

</div> -->
<div class="all">
        <p class="zixun-p1" align="center" style="width: 100%; "><?php echo ($data["title"]); ?></p>
    <div class="nei">
        <?php echo ($data["content"]); ?>
   
<!-- <div style="margin-top: 20px;background-color: white;width: 100%;height: auto;margin-bottom: 77px">
    <ul class="ul3" style="height: 60px">
        <li style="color: black;padding-left: 5%">评论 <span><?php echo ($comment_count); ?></span>
            <p style="color: orangered;font-size: 30px;margin-top: -18px">____</p>

        </li>
    </ul>
    </div> -->
    
<!-- <ul class="footer2" style="width: 100%">
    <li><img src="/Public/Admin/Img/dianzan.png" alt=""/>
        <p><span id="zan" <?php if($iszan == '0'): ?>style="display: block;"<?php else: ?>style="display: none;"<?php endif; ?>>点赞</span><span id="qx" <?php if($iszan == '1'): ?>style="display: block;"<?php else: ?>style="display: none;"<?php endif; ?>>已赞</span><span class="count" style="display: inline-block;
    margin-left: 2px;"><?php echo ($zan); ?></span></p>
    </li>
  <li class="pl"><img src="/Public/Admin/Img/pinglun.png" alt=""/> <p>评论</p></li>
   <li class = "shoucang"><img src="/Public/Admin/Img/shoucang.png" alt=""/> <p class = "sc">收藏</p></li>
   <li><img src="/Public/Admin/Img/zhuangfa.png" alt=""/> <p>分享</p></li>
</ul> -->

<!-- <ul class= "pingl" style="    height: auto;
    overflow: hidden;
    width: 100%;
    position: fixed;
    bottom: 77px;
    left: 0px;
    z-index: 1000;
    background-color: #fff;display:none;">
    <li style="width: 70%;float: left;"><input type="text" class="content" placeholder="请输入评论内容" style="border: 1px solid #8c8c8c;background-color: transparent;width: 96%;width: 100%;
    "></li>
    <li style="width: 30%;float: left;    padding-top: 7px;
    text-align: center" class="send">发送</li>
</ul> -->
</body>


</html>