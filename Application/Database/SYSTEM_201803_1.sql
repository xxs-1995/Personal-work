# -----------------------------------------------------------
# PHP-Amateur database backup files
# Blog: http://www.uc22.net
# Type: 系统自动备份
# Description:当前SQL文件包含了表：pa_about、pa_access、pa_activity、pa_ad、pa_admin、pa_applyteacher、pa_at、pa_auth、pa_book、pa_bought、pa_buybook、pa_buywith、pa_call、pa_category、pa_category_copy、pa_city、pa_collection、pa_column、pa_comment、pa_field、pa_follow、pa_gift、pa_help、pa_images、pa_input、pa_link、pa_live、pa_livepay、pa_liveset、pa_livevideo、pa_major、pa_match、pa_member、pa_message、pa_model、pa_myrecord、pa_nav、pa_news、pa_node、pa_order、pa_page、pa_pay、pa_personal、pa_picarr、pa_problem、pa_product、pa_recordm、pa_report、pa_role、pa_role_user、pa_route、pa_schooltopic、pa_sign、pa_signup、pa_sub_category、pa_subject、pa_tag、pa_teacher_inst、pa_theme、pa_topic、pa_wish、pa_withdrawals、pa_yzm、pa_zan的结构信息，表：pa_about、pa_access、pa_activity、pa_ad、pa_admin、pa_applyteacher、pa_at、pa_auth、pa_book、pa_bought、pa_buybook、pa_buywith、pa_call、pa_category、pa_category_copy、pa_city、pa_collection、pa_column、pa_comment、pa_field、pa_follow、pa_gift、pa_help、pa_images、pa_input、pa_link、pa_live、pa_livepay、pa_liveset、pa_livevideo、pa_major、pa_match、pa_member、pa_message、pa_model、pa_myrecord、pa_nav、pa_news、pa_node、pa_order、pa_page、pa_pay、pa_personal、pa_picarr、pa_problem、pa_product、pa_recordm、pa_report、pa_role、pa_role_user、pa_route、pa_schooltopic、pa_sign、pa_signup、pa_sub_category、pa_subject、pa_tag、pa_teacher_inst、pa_theme、pa_topic、pa_wish、pa_withdrawals、pa_yzm、pa_zan的数据
# Time: 2018-03-01 09:15:05
# -----------------------------------------------------------
# 当前SQL卷标：#1
# -----------------------------------------------------------


# 数据库表：pa_about 结构信息
DROP TABLE IF EXISTS `pa_about`;
CREATE TABLE `pa_about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '关于我们',
  `title` char(50) NOT NULL COMMENT '标题',
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL COMMENT '折扣',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_access 结构信息
DROP TABLE IF EXISTS `pa_access`;
CREATE TABLE `pa_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限分配表' ;

# 数据库表：pa_activity 结构信息
DROP TABLE IF EXISTS `pa_activity`;
CREATE TABLE `pa_activity` (
  `activity_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `activity_poster` varchar(100) NOT NULL COMMENT '活动图片',
  `activity_title` varchar(50) NOT NULL COMMENT '活动标题',
  `activity_introduce` varchar(50) NOT NULL COMMENT '活动介绍',
  `activity_content` text NOT NULL COMMENT '活动内容',
  `createtime` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发布',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_ad 结构信息
DROP TABLE IF EXISTS `pa_ad`;
CREATE TABLE `pa_ad` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ad_name` varchar(60) NOT NULL DEFAULT '',
  `ad_link` varchar(255) NOT NULL DEFAULT '',
  `ad_img` varchar(255) NOT NULL,
  `position` char(10) NOT NULL DEFAULT '0',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_admin 结构信息
DROP TABLE IF EXISTS `pa_admin`;
CREATE TABLE `pa_admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '登录账号',
  `pwd` char(32) DEFAULT NULL COMMENT '登录密码',
  `status` int(11) DEFAULT '1' COMMENT '账号状态',
  `remark` varchar(255) DEFAULT '' COMMENT '备注信息',
  `find_code` char(5) DEFAULT NULL COMMENT '找回账号验证码',
  `time` int(10) DEFAULT NULL COMMENT '开通时间',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='网站后台管理员表' ;

# 数据库表：pa_applyteacher 结构信息
DROP TABLE IF EXISTS `pa_applyteacher`;
CREATE TABLE `pa_applyteacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_userid` int(11) NOT NULL COMMENT '用户id',
  `teacher_truename` char(10) DEFAULT NULL COMMENT '真实姓名',
  `teacher_name` char(10) NOT NULL COMMENT '用户名',
  `teacher_identityID` char(20) NOT NULL COMMENT '身份证号码',
  `teacher_positive_img` varchar(150) NOT NULL COMMENT '身份证正面照片',
  `teacher_side_img` varchar(150) NOT NULL COMMENT '身份证反面照片',
  `teacher_hand_img` varchar(150) NOT NULL COMMENT '手持身份证照片',
  `teacher_examine` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 0审核中1审和通过2未通过',
  `type` char(10) NOT NULL COMMENT '申请类型   teacher讲师   institution机构',
  `teacher_state` char(50) NOT NULL COMMENT '状态',
  `teacher_major` char(20) NOT NULL COMMENT '专业',
  `teacher_identity` char(40) NOT NULL COMMENT '身份',
  `teacher_recommend` int(2) DEFAULT '0' COMMENT '首页推荐 1推荐',
  `createtime` int(11) DEFAULT NULL,
  `liveLogo` varchar(120) DEFAULT NULL COMMENT '直播logo',
  `poster` varchar(120) DEFAULT NULL COMMENT '海报',
  `liveName` char(35) DEFAULT NULL COMMENT '直播间名称',
  `introduce` varchar(70) DEFAULT NULL COMMENT '简介',
  `wechat` char(20) DEFAULT NULL COMMENT '微信号',
  `phone` char(15) DEFAULT NULL COMMENT '手机号',
  `institution` char(30) DEFAULT NULL COMMENT '机构名称',
  PRIMARY KEY (`teacher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='老师' ;

# 数据库表：pa_at 结构信息
DROP TABLE IF EXISTS `pa_at`;
CREATE TABLE `pa_at` (
  `at_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` char(10) NOT NULL COMMENT '用户姓名',
  `user_pic` varchar(150) NOT NULL COMMENT '用户头像',
  `remind_id` int(11) NOT NULL COMMENT ' 提醒的人id',
  `type` varchar(20) NOT NULL COMMENT '类型',
  `typeid` int(11) NOT NULL COMMENT '类型id',
  `attime` int(11) NOT NULL COMMENT '提醒时间',
  PRIMARY KEY (`at_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_auth 结构信息
DROP TABLE IF EXISTS `pa_auth`;
CREATE TABLE `pa_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(5) NOT NULL COMMENT '认证类型 1机构2个人',
  `name` char(150) NOT NULL COMMENT '真实名字',
  `inst_name` char(150) NOT NULL COMMENT '机构名称',
  `logo` char(200) NOT NULL COMMENT '直播间logo',
  `poster` char(200) NOT NULL COMMENT '直播间展示海报',
  `live_name` char(150) NOT NULL COMMENT '直播名称',
  `abstract` text NOT NULL COMMENT '简介',
  `wx` char(100) NOT NULL COMMENT '微信号',
  `tel` int(11) NOT NULL COMMENT '手机号',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='认证表' ;

# 数据库表：pa_book 结构信息
DROP TABLE IF EXISTS `pa_book`;
CREATE TABLE `pa_book` (
  `book_id` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT '书id',
  `book_name` char(255) NOT NULL COMMENT '书名',
  `book_addtime` char(60) NOT NULL COMMENT '添加时间',
  `book_img` char(150) NOT NULL COMMENT '主类 封面 三级类 二维码',
  `level` int(11) NOT NULL COMMENT '等级',
  `pid` int(11) NOT NULL COMMENT '父级id',
  `type` char(40) NOT NULL COMMENT '类别',
  `book_content` text NOT NULL COMMENT '若是主类 则该项是简介  若是三级类该项是内容',
  `code_url` char(150) NOT NULL COMMENT '二维码地址',
  `price` char(50) NOT NULL COMMENT '价格',
  PRIMARY KEY (`book_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='书书书' ;

# 数据库表：pa_bought 结构信息
DROP TABLE IF EXISTS `pa_bought`;
CREATE TABLE `pa_bought` (
  `bought_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL COMMENT '产品id',
  `bought_time` int(11) DEFAULT NULL COMMENT '购买时间',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `bought_type` char(50) DEFAULT NULL COMMENT '产品类型',
  `sum` char(10) NOT NULL COMMENT '数量',
  `action` char(10) NOT NULL COMMENT '操作类型  收入与支出',
  `price` decimal(10,2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`bought_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_buybook 结构信息
DROP TABLE IF EXISTS `pa_buybook`;
CREATE TABLE `pa_buybook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL COMMENT '用户id',
  `book_id` int(11) NOT NULL COMMENT '书籍id',
  `price` decimal(10,2) NOT NULL COMMENT '金额',
  `time` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='购买书表' ;

# 数据库表：pa_buywith 结构信息
DROP TABLE IF EXISTS `pa_buywith`;
CREATE TABLE `pa_buywith` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL COMMENT '用户id',
  `wish` varchar(100) NOT NULL COMMENT '心愿',
  `gm_id` int(11) NOT NULL COMMENT '许愿树id',
  `price` decimal(10,2) NOT NULL COMMENT '金额',
  `school` char(20) NOT NULL COMMENT '学校',
  `time` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='购买许愿表' ;

# 数据库表：pa_call 结构信息
DROP TABLE IF EXISTS `pa_call`;
CREATE TABLE `pa_call` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lunch_name` char(20) NOT NULL,
  `lunch_id` int(11) NOT NULL COMMENT '发起人id',
  `invite_name` char(20) NOT NULL,
  `invite_id` int(11) NOT NULL COMMENT '邀请人id',
  `createtime` int(11) NOT NULL,
  `timeout` int(11) NOT NULL DEFAULT '0' COMMENT '通话时长',
  `connect` tinyint(1) NOT NULL COMMENT '是否连接成功',
  `rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '比率',
  `minut` decimal(7,2) NOT NULL DEFAULT '0.00' COMMENT '没分钟金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_category 结构信息
DROP TABLE IF EXISTS `pa_category`;
CREATE TABLE `pa_category` (
  `cid` int(5) NOT NULL AUTO_INCREMENT,
  `pid` int(5) DEFAULT NULL COMMENT 'parentCategory上级分类',
  `name` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `type` char(2) DEFAULT 'n',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新闻分类表' ;

# 数据库表：pa_category_copy 结构信息
DROP TABLE IF EXISTS `pa_category_copy`;
CREATE TABLE `pa_category_copy` (
  `cid` int(5) NOT NULL AUTO_INCREMENT,
  `pid` int(5) DEFAULT NULL COMMENT 'parentCategory上级分类',
  `name` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `type` char(2) DEFAULT 'n',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新闻分类表' ;

# 数据库表：pa_city 结构信息
DROP TABLE IF EXISTS `pa_city`;
CREATE TABLE `pa_city` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `upid` (`upid`)
) ENGINE=MyISAM AUTO_INCREMENT=45052 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_collection 结构信息
DROP TABLE IF EXISTS `pa_collection`;
CREATE TABLE `pa_collection` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_typeid` int(11) NOT NULL COMMENT '收藏的类型id',
  `collection_title` varchar(100) NOT NULL COMMENT '标题',
  `collection_uid` int(11) NOT NULL COMMENT '用户id',
  `collection_type` char(30) NOT NULL COMMENT '收藏类型',
  `collection_addtime` int(11) NOT NULL COMMENT '添加时间',
  `collection_img` varchar(150) NOT NULL COMMENT '图片',
  `collection_mold` char(30) NOT NULL COMMENT '收藏的准确类型',
  PRIMARY KEY (`collection_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='收藏表' ;

# 数据库表：pa_column 结构信息
DROP TABLE IF EXISTS `pa_column`;
CREATE TABLE `pa_column` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL COMMENT '栏目名',
  `poster` varchar(120) NOT NULL COMMENT '海报',
  `introduce` varchar(100) NOT NULL COMMENT '简介',
  `rate` decimal(4,2) NOT NULL COMMENT '分销比例',
  `belong` varchar(100) NOT NULL COMMENT '适合人群',
  `createtime` int(11) NOT NULL,
  `uid` int(11) NOT NULL COMMENT '所属用户',
  `price` decimal(7,2) DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_comment 结构信息
DROP TABLE IF EXISTS `pa_comment`;
CREATE TABLE `pa_comment` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '评论内容',
  `user_id` int(11) NOT NULL COMMENT '评论者id',
  `user_name` char(30) NOT NULL COMMENT '评论者姓名',
  `user_pic` varchar(150) NOT NULL COMMENT '评论者头像',
  `object` char(20) NOT NULL COMMENT '评论对象 机构 老师 文章 商品',
  `obj_id` int(11) NOT NULL COMMENT '评论对象的id',
  `reply_id` int(11) DEFAULT NULL COMMENT '给谁的评论 ',
  `createtime` int(11) DEFAULT NULL COMMENT '评论创建时间',
  `pid` int(11) DEFAULT NULL COMMENT '当前评论的上级评论id',
  `star` int(11) NOT NULL DEFAULT '0' COMMENT '评分 小星星数量 0 1 2 3 4 5 ',
  PRIMARY KEY (`com_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='评论' ;

# 数据库表：pa_field 结构信息
DROP TABLE IF EXISTS `pa_field`;
CREATE TABLE `pa_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `model_id` int(11) NOT NULL COMMENT '所属模型id',
  `name` varchar(128) NOT NULL COMMENT '字段名称',
  `comment` varchar(32) NOT NULL COMMENT '字段注释',
  `type` varchar(32) NOT NULL COMMENT '字段类型',
  `length` varchar(16) NOT NULL COMMENT '字段长度',
  `value` varchar(128) NOT NULL COMMENT '字段默认值',
  `is_require` tinyint(4) DEFAULT '0' COMMENT '是否必需',
  `is_unique` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否唯一',
  `is_index` tinyint(4) DEFAULT '0' COMMENT '是否添加索引',
  `is_system` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否系统字段',
  `is_list_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT '列表中显示',
  `auto_filter` varchar(32) NOT NULL COMMENT '自动过滤函数',
  `auto_fill` varchar(32) NOT NULL COMMENT '自动完成函数',
  `fill_time` varchar(16) NOT NULL DEFAULT 'both' COMMENT '填充时机',
  `relation_model` int(11) NOT NULL COMMENT '关联的模型',
  `relation_field` varchar(128) NOT NULL COMMENT '关联的字段',
  `relation_value` varchar(128) NOT NULL COMMENT '关联显示的值',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_field_model` (`model_id`),
  CONSTRAINT `pa_field_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `pa_model` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='数据模型字段' ;

# 数据库表：pa_follow 结构信息
DROP TABLE IF EXISTS `pa_follow`;
CREATE TABLE `pa_follow` (
  `follow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `follow_userid` int(11) NOT NULL COMMENT '用户id',
  `follow_followid` int(11) NOT NULL COMMENT '被关注人id',
  `follow_followtime` int(11) NOT NULL COMMENT '关注时间',
  `follow_black` tinyint(3) NOT NULL DEFAULT '0' COMMENT '拉黑0不拉黑1拉黑',
  `follow_type` char(20) NOT NULL COMMENT '关注的类型',
  PRIMARY KEY (`follow_id`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='关注表' ;

# 数据库表：pa_gift 结构信息
DROP TABLE IF EXISTS `pa_gift`;
CREATE TABLE `pa_gift` (
  `give_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '送礼人的id',
  `for_user_id` int(11) DEFAULT NULL COMMENT '收礼人id',
  `gift_image` varchar(100) DEFAULT NULL COMMENT '礼物图',
  `gift_name` char(20) DEFAULT NULL COMMENT '礼物名',
  `gift_id` int(11) DEFAULT NULL COMMENT '礼物id',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `createtime` int(11) DEFAULT NULL COMMENT '时间',
  `receive` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否领取 1领取  0未领取',
  `rate` decimal(5,2) NOT NULL COMMENT '收到礼物钱的倍率',
  PRIMARY KEY (`give_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_help 结构信息
DROP TABLE IF EXISTS `pa_help`;
CREATE TABLE `pa_help` (
  `help_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(150) NOT NULL COMMENT '问题',
  `answer` varchar(150) NOT NULL COMMENT '反馈',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `advice` varchar(150) NOT NULL COMMENT '意见',
  `is_show` int(11) NOT NULL,
  PRIMARY KEY (`help_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='帮助与反馈' ;

# 数据库表：pa_images 结构信息
DROP TABLE IF EXISTS `pa_images`;
CREATE TABLE `pa_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(20) NOT NULL,
  `savename` varchar(100) NOT NULL,
  `savepath` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_input 结构信息
DROP TABLE IF EXISTS `pa_input`;
CREATE TABLE `pa_input` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `field_id` int(11) NOT NULL COMMENT '字段id',
  `is_show` tinyint(4) NOT NULL DEFAULT '0' COMMENT '表单域是否显示',
  `label` varchar(32) NOT NULL COMMENT '表单域标签',
  `remark` varchar(128) NOT NULL COMMENT '表单域域',
  `type` varchar(32) NOT NULL COMMENT '表单域类型',
  `width` int(11) NOT NULL DEFAULT '20' COMMENT '表单域宽度',
  `height` int(11) NOT NULL DEFAULT '8' COMMENT '表单域高度',
  `opt_value` text NOT NULL COMMENT '表单域可选值',
  `value` varchar(128) NOT NULL COMMENT '表单域默认值',
  `editor` varchar(32) NOT NULL COMMENT '编辑器类型',
  `html` text NOT NULL COMMENT '表单域html替换',
  `show_order` int(11) DEFAULT NULL COMMENT '表单域显示顺序',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_field_input` (`field_id`),
  CONSTRAINT `pa_input_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `pa_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='字段表单域信息' ;

# 数据库表：pa_link 结构信息
DROP TABLE IF EXISTS `pa_link`;
CREATE TABLE `pa_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `display` int(1) NOT NULL,
  `link` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `target` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_live 结构信息
DROP TABLE IF EXISTS `pa_live`;
CREATE TABLE `pa_live` (
  `live_id` int(11) NOT NULL AUTO_INCREMENT,
  `live_no` int(11) NOT NULL COMMENT '直播房间号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `live_title` varchar(30) NOT NULL COMMENT '直播标题',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `live_category` char(10) NOT NULL COMMENT '直播类型  专业分类',
  `live_play` int(11) NOT NULL,
  `live_time` int(11) NOT NULL COMMENT '直播时间',
  `stop_time` int(11) NOT NULL COMMENT '下播时间',
  `live_type` char(15) NOT NULL COMMENT '正常直播live   直播课程class',
  `look_price` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '观看收费价格',
  `add_time` int(11) NOT NULL COMMENT '总时长',
  `sort` int(11) NOT NULL COMMENT '主播推荐排序',
  `account` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '账户 未提取的金额',
  PRIMARY KEY (`live_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_livepay 结构信息
DROP TABLE IF EXISTS `pa_livepay`;
CREATE TABLE `pa_livepay` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `live_id` int(11) NOT NULL COMMENT '直播间id',
  `anchor` int(11) NOT NULL COMMENT '主播id',
  `price` decimal(5,2) NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

# 数据库表：pa_liveset 结构信息
DROP TABLE IF EXISTS `pa_liveset`;
CREATE TABLE `pa_liveset` (
  `live_gift_rate` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT '直播礼物倍率',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `live_send_price` decimal(7,2) NOT NULL COMMENT '送礼物提醒的金额',
  `minut` decimal(5,2) DEFAULT NULL,
  `message` decimal(5,2) DEFAULT NULL,
  `agreement` text NOT NULL COMMENT '协议',
  `look_price_rate` decimal(5,2) NOT NULL COMMENT '看直播收费比率',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_livevideo 结构信息
DROP TABLE IF EXISTS `pa_livevideo`;
CREATE TABLE `pa_livevideo` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_title` char(40) NOT NULL COMMENT '录像标题',
  `video_url` varchar(150) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `video_category` char(15) NOT NULL COMMENT '视频标题',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击数',
  `is_show` int(11) NOT NULL COMMENT '上首页  1上 0 不上',
  PRIMARY KEY (`video_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='直播录像' ;

# 数据库表：pa_major 结构信息
DROP TABLE IF EXISTS `pa_major`;
CREATE TABLE `pa_major` (
  `major_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `major_schoolid` int(11) NOT NULL COMMENT '学校id',
  `major_major` varchar(200) NOT NULL COMMENT '专业',
  `major_content` varchar(200) NOT NULL COMMENT '详细专业',
  `major_introduce` text NOT NULL COMMENT '详细专业介绍',
  `major_test` char(255) NOT NULL COMMENT '考点',
  PRIMARY KEY (`major_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='详细专业' ;

# 数据库表：pa_match 结构信息
DROP TABLE IF EXISTS `pa_match`;
CREATE TABLE `pa_match` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `match_id` int(255) NOT NULL COMMENT '比赛id',
  `match_userid` int(255) NOT NULL COMMENT '用户id',
  `match_addtime` varchar(50) NOT NULL,
  `match_img` varchar(100) NOT NULL COMMENT '比赛图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='比赛图片' ;

# 数据库表：pa_member 结构信息
DROP TABLE IF EXISTS `pa_member`;
CREATE TABLE `pa_member` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `weibo_uid` char(15) DEFAULT NULL COMMENT '对应的新浪微博uid',
  `tencent_uid` char(20) DEFAULT NULL COMMENT '腾讯微博UID',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `nickname` char(20) DEFAULT NULL COMMENT '用户昵称',
  `pwd` char(32) DEFAULT NULL COMMENT '密码',
  `reg_date` int(10) DEFAULT NULL,
  `reg_ip` char(15) DEFAULT NULL COMMENT '注册IP地址',
  `verify_status` int(1) DEFAULT '0' COMMENT '电子邮件验证标示 0未验证，1已验证',
  `verify_code` varchar(32) DEFAULT NULL COMMENT '电子邮件验证随机码',
  `verify_time` int(10) DEFAULT NULL COMMENT '邮箱验证时间',
  `verify_exp_time` int(10) DEFAULT NULL COMMENT '验证邮件过期时间',
  `find_fwd_code` char(32) DEFAULT NULL COMMENT '找回密码验证随机码',
  `find_pwd_time` int(10) DEFAULT NULL COMMENT '找回密码申请提交时间',
  `find_pwd_exp_time` int(10) DEFAULT NULL COMMENT '找回密码验证随机码过期时间',
  `avatar` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `birthday` int(10) DEFAULT NULL COMMENT '用户生日',
  `sex` int(1) DEFAULT NULL COMMENT '0女1男',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `province` char(15) DEFAULT NULL COMMENT '省份',
  `city` char(15) DEFAULT NULL COMMENT '城市',
  `intr` varchar(500) DEFAULT NULL COMMENT '个人介绍',
  `mobile` char(12) DEFAULT NULL COMMENT '手机号码',
  `phone` char(12) DEFAULT NULL COMMENT '电话',
  `fax` varchar(30) DEFAULT NULL,
  `qq` int(15) DEFAULT NULL,
  `msn` varchar(100) DEFAULT NULL,
  `login_ip` char(15) DEFAULT NULL COMMENT '登录ip',
  `login_time` int(10) DEFAULT NULL COMMENT '登录时间',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=351 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网站前台会员表' ;

# 数据库表：pa_message 结构信息
DROP TABLE IF EXISTS `pa_message`;
CREATE TABLE `pa_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(32) NOT NULL,
  `moblie` char(15) NOT NULL,
  `display` int(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_model 结构信息
DROP TABLE IF EXISTS `pa_model`;
CREATE TABLE `pa_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(32) NOT NULL COMMENT '模型名称',
  `tbl_name` varchar(32) NOT NULL COMMENT '数据表名称',
  `menu_name` varchar(32) NOT NULL COMMENT '菜单名称',
  `is_inner` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否为内部表',
  `has_pk` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否包含主键',
  `tbl_engine` varchar(16) NOT NULL DEFAULT 'InnoDB' COMMENT '引擎类型',
  `description` text NOT NULL COMMENT '模型描述',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='数据模型信息' ;

# 数据库表：pa_myrecord 结构信息
DROP TABLE IF EXISTS `pa_myrecord`;
CREATE TABLE `pa_myrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `record_url` varchar(150) NOT NULL COMMENT '录制文件地址',
  `createtime` int(11) NOT NULL COMMENT '添加时间',
  `title` char(20) NOT NULL COMMENT '录制的标题',
  `introduce` varchar(200) NOT NULL COMMENT '描述文字',
  `state` int(1) NOT NULL COMMENT '状态 1发布 0保存',
  `poster` varchar(150) NOT NULL COMMENT '封面',
  `bgm` int(11) NOT NULL COMMENT '背景音乐',
  `theme` int(11) NOT NULL COMMENT '主题',
  `record` int(11) NOT NULL COMMENT '稿件id',
  `expert_name` char(30) NOT NULL COMMENT '专家名称',
  `expert_img` char(150) NOT NULL COMMENT '专家头像',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='发布音频' ;

# 数据库表：pa_nav 结构信息
DROP TABLE IF EXISTS `pa_nav`;
CREATE TABLE `pa_nav` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL,
  `nav_name` varchar(255) NOT NULL,
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `guide` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `link` varchar(225) NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn' COMMENT '语言',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `target` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_news 结构信息
DROP TABLE IF EXISTS `pa_news`;
CREATE TABLE `pa_news` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `cid` smallint(3) DEFAULT NULL COMMENT '所在分类',
  `title` varchar(200) DEFAULT NULL COMMENT '新闻标题',
  `keywords` varchar(50) DEFAULT NULL COMMENT '文章关键字',
  `description` mediumtext COMMENT '文章描述',
  `status` tinyint(1) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL COMMENT '文章摘要',
  `published` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  `content` text,
  `click` int(11) NOT NULL DEFAULT '0',
  `aid` smallint(3) DEFAULT NULL COMMENT '发布者UID',
  `is_recommend` int(1) NOT NULL DEFAULT '0',
  `image_id` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='新闻表' ;

# 数据库表：pa_node 结构信息
DROP TABLE IF EXISTS `pa_node`;
CREATE TABLE `pa_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='权限节点表' ;

# 数据库表：pa_order 结构信息
DROP TABLE IF EXISTS `pa_order`;
CREATE TABLE `pa_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` char(30) DEFAULT '' COMMENT '订单号',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_name` varchar(30) DEFAULT NULL,
  `goods_img` varchar(100) DEFAULT NULL,
  `user_name` char(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `state` int(2) DEFAULT NULL COMMENT '订单状态 0待支付 1已支付 2已取消',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `savetime` int(11) DEFAULT NULL COMMENT '更新时间',
  `display` int(2) DEFAULT '1' COMMENT '订单是否显示 1显示 0隐藏',
  `sum` int(2) DEFAULT NULL COMMENT '数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `goods_type` varchar(30) DEFAULT NULL COMMENT '商品类型 充值 提现 视频 消息 礼物',
  `fkmethod` char(10) DEFAULT NULL COMMENT '支付方式',
  `invite_name` char(20) DEFAULT NULL COMMENT '被邀请人姓名',
  `invite_id` int(11) DEFAULT NULL COMMENT '被邀请人id',
  `rate` decimal(5,2) DEFAULT NULL COMMENT '平台抽成比率',
  `add` decimal(10,2) DEFAULT NULL COMMENT '共计',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8 COMMENT='订单表' ;

# 数据库表：pa_page 结构信息
DROP TABLE IF EXISTS `pa_page`;
CREATE TABLE `pa_page` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(30) NOT NULL DEFAULT '',
  `parent_id` smallint(5) NOT NULL DEFAULT '0',
  `page_name` varchar(150) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `display` int(1) NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_pay 结构信息
DROP TABLE IF EXISTS `pa_pay`;
CREATE TABLE `pa_pay` (
  `pay_id` int(11) NOT NULL DEFAULT '0',
  `pay_type` varchar(50) NOT NULL COMMENT '类型  微信  支付宝  wx  alipay',
  `pay_AppKey` varchar(255) NOT NULL COMMENT 'Key',
  `pay_AppRSA` varchar(255) NOT NULL COMMENT '秘钥',
  `pay_AppRSA2` varchar(255) NOT NULL COMMENT '支付宝私钥',
  `pay_AppId` varchar(255) NOT NULL COMMENT 'AppId',
  `pay_url` varchar(255) NOT NULL COMMENT '回调url',
  PRIMARY KEY (`pay_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付方式' ;

# 数据库表：pa_personal 结构信息
DROP TABLE IF EXISTS `pa_personal`;
CREATE TABLE `pa_personal` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `user_created_at` int(11) NOT NULL COMMENT '创建时间',
  `user_updated_at` int(11) NOT NULL COMMENT '更新时间',
  `user_name` char(10) NOT NULL COMMENT '账号',
  `user_age` int(3) NOT NULL COMMENT '年龄',
  `user_sex` enum('1','0') NOT NULL DEFAULT '0' COMMENT '性别0代表女1代表男',
  `user_img` varchar(255) NOT NULL DEFAULT '/Public/Img/default/default.jpg' COMMENT '头像',
  `user_background_img` varchar(255) NOT NULL DEFAULT '/Public/Img/default/bgdefault.jpg' COMMENT '背景图片',
  `user_tel` char(20) NOT NULL COMMENT '手机号',
  `user_area` char(20) NOT NULL COMMENT '所在省份',
  `user_academic` char(20) NOT NULL COMMENT '学位',
  `user_school` char(30) NOT NULL DEFAULT '未填写' COMMENT '目标学院',
  `user_artdirection` char(30) NOT NULL COMMENT '艺考方向',
  `user_achievement` char(10) NOT NULL DEFAULT '未填写' COMMENT '文化成绩',
  `user_experience` tinyint(3) NOT NULL DEFAULT '0' COMMENT '培训经历0代表未参加 1代表已参加',
  `user_attendschool` char(20) NOT NULL DEFAULT 'XX大学' COMMENT '就读学校',
  `user_theschool` char(20) NOT NULL COMMENT '老师所属院校',
  `user_jine` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '用户金额',
  `user_password` char(100) NOT NULL COMMENT '会员密码',
  `user_nickname` char(100) NOT NULL DEFAULT '小蝌蚪' COMMENT '会员昵称',
  `user_introduce` varchar(100) NOT NULL COMMENT '简介(老师)',
  `user_authentication` tinyint(3) NOT NULL COMMENT '认证 0未认证  2审核中 1认证',
  `user_type` char(10) NOT NULL DEFAULT '未填写' COMMENT '会员身份  职位',
  `user_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在线  ',
  `user_login` tinyint(3) NOT NULL COMMENT '是否可以登录0可以 1不可以',
  `user_stoptime` int(11) NOT NULL COMMENT '该账号封停的时间',
  `user_stopreason` varchar(80) NOT NULL COMMENT '封停理由',
  `user_logintime` int(11) NOT NULL COMMENT '登录时间',
  `user_registertime` int(11) NOT NULL COMMENT '用户注册时间',
  `user_email` char(30) NOT NULL COMMENT '邮箱',
  `user_qq_openid` char(100) NOT NULL COMMENT 'qq的openid',
  `user_wx_openid` char(100) NOT NULL COMMENT '微信的openid',
  `user_wb_openid` char(100) NOT NULL COMMENT '微博openid',
  `access_token` varchar(255) NOT NULL COMMENT 'token',
  `user_grade` char(10) NOT NULL DEFAULT '高中' COMMENT '年级',
  `user_major` char(20) NOT NULL COMMENT '专业（老师）',
  `user_direction` varchar(255) NOT NULL COMMENT '教学方向',
  `user_qq_wx_wb` int(1) NOT NULL COMMENT '是否第三方注册0不是 1qq 2 微信 3 微博',
  `user_number` int(11) DEFAULT NULL COMMENT '蝌蚪号',
  `rong_token` char(50) NOT NULL COMMENT '融云token',
  `user_hxpwd` char(100) DEFAULT NULL COMMENT '环信密码',
  `vip` int(11) DEFAULT '0' COMMENT '会员等级',
  `user_birthday` int(11) DEFAULT NULL COMMENT '生日',
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='会员表' ;

# 数据库表：pa_picarr 结构信息
DROP TABLE IF EXISTS `pa_picarr`;
CREATE TABLE `pa_picarr` (
  `picarr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  `picarr_img_url` char(120) NOT NULL COMMENT '图片url',
  `picarr_type` char(20) NOT NULL COMMENT '图片类型 商品 我的相册 帖子',
  `picarr_typeid` int(11) NOT NULL COMMENT '类型id',
  `picarr_sort` tinyint(10) NOT NULL COMMENT '图片排序',
  PRIMARY KEY (`picarr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=341 DEFAULT CHARSET=utf8 COMMENT='图片库(不是单张的图片都会存在这里)' ;

# 数据库表：pa_problem 结构信息
DROP TABLE IF EXISTS `pa_problem`;
CREATE TABLE `pa_problem` (
  `problem_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `problem_userid` int(11) DEFAULT NULL COMMENT '用户id',
  `problem_schoolid` int(11) DEFAULT NULL COMMENT '院校id',
  `problem_content` text COMMENT '内容',
  `problem_img_url` char(100) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`problem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='问题(院校)' ;

# 数据库表：pa_product 结构信息
DROP TABLE IF EXISTS `pa_product`;
CREATE TABLE `pa_product` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `cid` smallint(3) DEFAULT NULL COMMENT '所在分类',
  `title` varchar(200) DEFAULT NULL COMMENT '产品标题',
  `price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `psize` varchar(32) NOT NULL COMMENT '型号',
  `image_id` varchar(255) DEFAULT '' COMMENT '图片',
  `keywords` varchar(50) DEFAULT NULL COMMENT '产品关键字',
  `description` mediumtext COMMENT '产品描述  简介',
  `status` tinyint(1) DEFAULT '0' COMMENT '发布状态0待审核 1发布 2保存未发布',
  `summary` varchar(255) DEFAULT NULL COMMENT '产品摘要',
  `published` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) DEFAULT NULL,
  `content` text COMMENT '内容',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  `aid` smallint(3) DEFAULT NULL COMMENT '发布者UID',
  `click` int(11) NOT NULL DEFAULT '0',
  `is_recommend` int(1) NOT NULL DEFAULT '0',
  `wap_display` int(1) NOT NULL DEFAULT '0',
  `time` varchar(50) DEFAULT NULL COMMENT '课时',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `inst_id` int(11) DEFAULT NULL COMMENT '所属机构id',
  `require` varchar(100) DEFAULT NULL COMMENT '要求',
  `class_time` varchar(255) DEFAULT NULL COMMENT ' 课程时间',
  `teacher_id` int(11) DEFAULT NULL COMMENT '所属老师id',
  `type` varchar(20) DEFAULT NULL COMMENT '产品类型 class课程 gift礼物 book书 school学校 video视频',
  `url` varchar(150) NOT NULL COMMENT '课程视频',
  `classtype` char(10) NOT NULL COMMENT 'video 视频课程  live直播课程',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='产品表' ;

# 数据库表：pa_recordm 结构信息
DROP TABLE IF EXISTS `pa_recordm`;
CREATE TABLE `pa_recordm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(20) NOT NULL COMMENT '标题',
  `background_img` varchar(150) NOT NULL COMMENT '背景图片',
  `background_music` varchar(150) NOT NULL COMMENT '背景音乐',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `poster` varchar(150) DEFAULT NULL COMMENT '背景图片小图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='音频  主题' ;

# 数据库表：pa_report 结构信息
DROP TABLE IF EXISTS `pa_report`;
CREATE TABLE `pa_report` (
  `report_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `report_userid` int(11) DEFAULT NULL COMMENT '用户id',
  `report_beiuserid` int(11) DEFAULT NULL COMMENT '被举报用户id',
  `report_content` text COMMENT '举报内容',
  `report_img_url` char(100) DEFAULT NULL COMMENT '举报图片',
  `report_operation` tinyint(2) DEFAULT '0' COMMENT '判断是否操作0否1是',
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='举报' ;

# 数据库表：pa_role 结构信息
DROP TABLE IF EXISTS `pa_role`;
CREATE TABLE `pa_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='权限角色表' ;

# 数据库表：pa_role_user 结构信息
DROP TABLE IF EXISTS `pa_role_user`;
CREATE TABLE `pa_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色表' ;

# 数据库表：pa_route 结构信息
DROP TABLE IF EXISTS `pa_route`;
CREATE TABLE `pa_route` (
  `route_id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `route_title` char(50) NOT NULL COMMENT '行程标题',
  `route_content` text NOT NULL COMMENT '内容',
  `route_userid` int(11) NOT NULL COMMENT '用户id',
  `route_schoolname` char(20) NOT NULL COMMENT '学校名称',
  `route_schoolid` int(11) NOT NULL COMMENT '学校id',
  `route_time` char(30) NOT NULL COMMENT '行程时间',
  `route_remindtime` char(30) NOT NULL COMMENT '提醒时间',
  `route_major` char(50) NOT NULL COMMENT '专业',
  `route_test` char(50) NOT NULL COMMENT '考点',
  PRIMARY KEY (`route_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='考试行程' ;

# 数据库表：pa_schooltopic 结构信息
DROP TABLE IF EXISTS `pa_schooltopic`;
CREATE TABLE `pa_schooltopic` (
  `sid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL,
  `title` char(30) NOT NULL,
  `content` text NOT NULL,
  `addtime` int(11) NOT NULL,
  `yes` int(255) NOT NULL,
  `no` int(255) NOT NULL,
  `yes_uid` char(255) NOT NULL,
  `no_uid` char(255) NOT NULL,
  `ID` int(11) NOT NULL COMMENT '题号',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上一级id',
  `city_name` char(50) NOT NULL COMMENT '城市名',
  `city_img` char(150) NOT NULL COMMENT '地区图片',
  `sf_city` tinyint(2) NOT NULL COMMENT '是否城市1是0不是',
  `read_sum` int(255) NOT NULL COMMENT '阅读量',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='学校真题表' ;

# 数据库表：pa_sign 结构信息
DROP TABLE IF EXISTS `pa_sign`;
CREATE TABLE `pa_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` char(30) NOT NULL,
  `tel` char(12) NOT NULL,
  `address` char(50) DEFAULT NULL,
  `subject_id` int(11) unsigned NOT NULL COMMENT '课程id',
  `subject_title` char(30) DEFAULT NULL COMMENT '课程名',
  `createtime` int(11) DEFAULT NULL,
  `type` char(10) DEFAULT NULL COMMENT '报名类型   subject课程   column栏目',
  `column_id` int(11) DEFAULT NULL COMMENT '栏目id',
  `column_name` char(30) DEFAULT NULL COMMENT '栏目名',
  `price` decimal(7,2) DEFAULT '0.00' COMMENT '价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 数据库表：pa_signup 结构信息
DROP TABLE IF EXISTS `pa_signup`;
CREATE TABLE `pa_signup` (
  `signup_id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `signup_userid` int(255) NOT NULL COMMENT '用户id',
  `signup_name` char(30) NOT NULL COMMENT '姓名',
  `signup_tel` char(30) NOT NULL COMMENT '手机号',
  `signup_sex` char(20) NOT NULL COMMENT '性别',
  `signup_age` char(20) NOT NULL COMMENT '年龄',
  `signup_teacher` char(20) NOT NULL COMMENT '指导老师',
  `signup_area` varchar(100) NOT NULL COMMENT '通信地址',
  `signup_price` tinyint(3) NOT NULL COMMENT '是否交钱1交钱',
  `signup_matchid` int(255) NOT NULL COMMENT '比赛id',
  PRIMARY KEY (`signup_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='比赛报名表' ;

# 数据库表：pa_sub_category 结构信息
DROP TABLE IF EXISTS `pa_sub_category`;
CREATE TABLE `pa_sub_category` (
  `cid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '课程类别',
  `pid` int(5) DEFAULT NULL COMMENT '类别父类id',
  `createtime` int(11) DEFAULT NULL,
  `type` char(2) DEFAULT 'n',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_subject 结构信息
DROP TABLE IF EXISTS `pa_subject`;
CREATE TABLE `pa_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `start_time` int(11) NOT NULL COMMENT '开课时间',
  `introduce` varchar(100) DEFAULT NULL COMMENT '简介',
  `distribution_rate` decimal(4,2) DEFAULT NULL COMMENT '分销比例',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `column` int(11) DEFAULT NULL COMMENT '栏目',
  `price` decimal(7,2) DEFAULT NULL COMMENT '价格',
  `url` varchar(120) DEFAULT NULL COMMENT '视频地址',
  `poster` varchar(120) DEFAULT NULL COMMENT '封面',
  `title` char(30) DEFAULT NULL COMMENT '课程名',
  `tag` varchar(30) DEFAULT NULL COMMENT '标签',
  `recommend` tinyint(1) DEFAULT '0' COMMENT '推荐',
  `hot` tinyint(1) DEFAULT '0' COMMENT '热门',
  `state` char(10) DEFAULT 'nobegin' COMMENT '课程状态 nobegin未开课  live直播中  video视频 end课程结束',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_tag 结构信息
DROP TABLE IF EXISTS `pa_tag`;
CREATE TABLE `pa_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `unique_id` char(20) NOT NULL,
  `content` text NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_teacher_inst 结构信息
DROP TABLE IF EXISTS `pa_teacher_inst`;
CREATE TABLE `pa_teacher_inst` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(20) DEFAULT NULL COMMENT '老师姓名',
  `head_picture` varchar(150) DEFAULT NULL COMMENT ' 头像',
  `introduce` varchar(100) DEFAULT NULL COMMENT '简介',
  `inst_id` int(11) DEFAULT NULL COMMENT '所属机构',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `imageid` varchar(500) DEFAULT NULL COMMENT '相册id',
  `savetime` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`teacher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='机构老师' ;

# 数据库表：pa_theme 结构信息
DROP TABLE IF EXISTS `pa_theme`;
CREATE TABLE `pa_theme` (
  `the_id` int(11) NOT NULL AUTO_INCREMENT,
  `the_title` char(20) DEFAULT NULL COMMENT '话题名',
  `the_img` varchar(150) DEFAULT NULL COMMENT '话题图片',
  `the_description` varchar(50) DEFAULT NULL COMMENT '话题描述',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `display` int(2) DEFAULT '0' COMMENT '0隐藏 1显示',
  PRIMARY KEY (`the_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='话题表' ;

# 数据库表：pa_topic 结构信息
DROP TABLE IF EXISTS `pa_topic`;
CREATE TABLE `pa_topic` (
  `topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_topicid` int(11) NOT NULL COMMENT '题目id',
  `topic_userid` int(11) NOT NULL COMMENT '用户id',
  `topic_error` tinyint(3) NOT NULL COMMENT '0代表错 1代表对',
  PRIMARY KEY (`topic_id`)
) ENGINE=MyISAM AUTO_INCREMENT=243 DEFAULT CHARSET=utf8 COMMENT='答题表' ;

# 数据库表：pa_wish 结构信息
DROP TABLE IF EXISTS `pa_wish`;
CREATE TABLE `pa_wish` (
  `wish_id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `wish_title` char(20) NOT NULL COMMENT '护法名称',
  `wish_price` decimal(10,2) NOT NULL COMMENT '价格',
  `wish_img` varchar(100) NOT NULL COMMENT '图片url',
  PRIMARY KEY (`wish_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='许愿表' ;

# 数据库表：pa_withdrawals 结构信息
DROP TABLE IF EXISTS `pa_withdrawals`;
CREATE TABLE `pa_withdrawals` (
  `back_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `char` varchar(20) NOT NULL COMMENT '提现用户名',
  `money` decimal(10,2) NOT NULL,
  `createtime` int(11) NOT NULL COMMENT '提现时间',
  `state` int(11) NOT NULL COMMENT '提现状态 0审核 1提现批准 2拒绝',
  `way` char(20) NOT NULL COMMENT '提现方式',
  `account` char(30) NOT NULL COMMENT '提现账户',
  `user_tel` char(15) DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`back_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='提现表' ;

# 数据库表：pa_yzm 结构信息
DROP TABLE IF EXISTS `pa_yzm`;
CREATE TABLE `pa_yzm` (
  `id` int(25) unsigned NOT NULL AUTO_INCREMENT,
  `tel` char(15) DEFAULT NULL,
  `yzm` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COMMENT='验证码' ;

# 数据库表：pa_zan 结构信息
DROP TABLE IF EXISTS `pa_zan`;
CREATE TABLE `pa_zan` (
  `type` char(20) NOT NULL COMMENT '赞的什么东西',
  `type_id` int(11) NOT NULL COMMENT '东西id',
  `user_id` int(11) NOT NULL COMMENT '点赞的人id',
  `user_name` char(20) NOT NULL COMMENT '点赞的人名',
  `zan_time` int(11) NOT NULL COMMENT '赞的时间',
  `user_img` varchar(150) NOT NULL COMMENT '用户头像'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='赞' ;



# 数据库表：pa_about 数据信息
INSERT INTO `pa_about` VALUES ('1','<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
	《关于我们》由音乐人梁翘柏作曲，作词人李焯雄联袂为周笔畅量身打造。<span style="font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;">[1]</span><a name="ref_[1]_1916909"></a>&nbsp;
</div>
<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
	作为周笔畅2015年数字专辑的预热单曲，《关于我们》用质朴的旋律和温情的歌词回顾了笔笔十年前站上这里接受掌声，到现在成就歌手舞台的历程。而笔笔也特意自己为单曲毛笔题词，将这首歌唱给十年来支持她的朋友<span style="font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;">[2]</span><a name="ref_[2]_1916909"></a>&nbsp;&nbsp;，她希望通过这首歌来为十年发声，为青春作证。
</div>
<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
	《关于我们》除了诉说周笔畅十年的情愫，同时也用这首歌曲反思青春，另一种方式解读现在的青春热潮。你可能听过《匆匆那年》听过《致青春》，如果这些歌曲是对青春的一种解读，周笔畅的《关于我们》则是对青春的反思。解读是用片刻回忆的重温，而反思则是深层次对友情、亲情、爱情之间关于信任的总结。《关于我们》是青春三部曲最完美的谢幕。
</div>','','0.00','0.00');
INSERT INTO `pa_about` VALUES ('2','<h1>
	<div class="para-title level-2" style="font-size:22px;font-family:&quot;margin:35px 0px 15px -30px;background:url(&quot;color:#333333;">
		<h2 class="title-text" style="font-size:22px;color:#000000;font-weight:400;">
			基本范畴
		</h2>
<a class="edit-icon j-edit-link"><span class="cmn-icon wiki-lemma-icons wiki-lemma-icons_edit-lemma" style="font-family:baikeFont_layout;line-height:1;vertical-align:text-bottom;color:#AAAAAA;"></span>编辑</a>
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		犯罪、刑事责任和刑罚，是刑法的三个基本范畴。这三者的关系是：犯罪决定刑事责任，刑事责任决定刑罚。换句话说，没有实施犯罪，就不负刑事责任，从而也不受刑罚处罚。下面，就这三个基本范畴，略作一些解说。
	</div>
	<div class="anchor-list" style="color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		<a name="3_1"></a><a name="sub15050_3_1"></a><a name="犯罪的概念、特征和构成要件"></a><a name="3-1"></a>
	</div>
	<div class="para-title level-3" style="margin:20px 0px 12px;font-size:18px;font-family:&quot;color:#333333;background-color:#FFFFFF;">
		<h3 class="title-text" style="font-size:18px;font-weight:400;">
			犯罪的概念、特征和构成要件
		</h3>
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		<div class="lemma-picture text-pic layout-right" style="border:1px solid #E0E0E0;margin:0px 0px 3px;">
			<a class="image-link" href="https://baike.baidu.com/pic/%E5%88%91%E6%B3%95/301706/0/03087bf40ad162d9a53a92f718dfa9ec8b13cd01?fr=lemma&amp;ct=single" target="_blank"><img class="" src="http://h.hiphotos.baidu.com/baike/s%3D220/sign=ac046ebf0a4f78f0840b9df149330a83/03087bf40ad162d9a53a92f718dfa9ec8b13cd01.jpg" alt="犯罪" style="width:220px;height:165px;" /></a><span class="description" style="color:#555555;font-size:12px;font-family:宋体;line-height:15px;">犯罪</span>
		</div>
《中华人民共和国刑法》第十三条规定<span style="font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;">[1]</span><a name="ref_[1]_15050"></a>&nbsp;&nbsp;：“一切危害国家主权、领土完整和安全，分裂国家、颠覆人民民主专政的政权和推翻社会主义制度，破坏社会秩序和经济秩序，侵犯国有财产或者劳动群众集体所有的财产，侵犯公民私人所有的财产，侵犯公民的人身权利、民主权利和其他权利，以及其他危害社会的行为，依照法律应当受刑罚处罚的，都是犯罪，但是情节显著轻微危害不大的，不认为是犯罪。”<span style="font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;">[1]</span><a name="ref_[1]_15050"></a>&nbsp;
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		根据上面所引的刑法第十三条的规定可以看出，犯罪这种行为具有以下三个基本特征：
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		第一，犯罪是危害社会的行为，即具有一定的<a target="_blank" href="https://baike.baidu.com/item/%E7%A4%BE%E4%BC%9A%E5%8D%B1%E5%AE%B3%E6%80%A7">社会危害性</a>。行为具有一定的社会危害性，是犯罪最本质最基本的特征。所谓社会危害性，也就是犯罪行为对我们社会主义社会所具有的危害性。在社会主义社会，由于人民当家作主，国家和人民的利益是完全一致的，所以讲犯罪的社会危害性，也就是指对国家和人民利益的危害性。犯罪的本质就在于它危害了国家和人民的利益，危害了社会主义社会。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		如果某种行为根本不可能给社会带来危害，我们的法律就没有必要把它规定为犯罪，也不会对它进行刑罚处罚。某种行为虽然有一点危害性，但是情节显著轻微危害不大，也不认为是犯罪。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		例如小偷小摸，数额很小，不能当作盗窃罪；与邻居吵架，沉不住气，动手打了对方，但没有打伤，或者伤很轻微，这种行为是错误的，应当批评教育甚至给予必要的处分，但不能当作故意伤害罪。由此可见，没有社会危害性，就没有犯罪；社会危害性没有达到相当的程度，也不构成犯罪。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		第二，犯罪是触犯刑律的行为，即具有<a target="_blank" href="https://baike.baidu.com/item/%E5%88%91%E4%BA%8B%E8%BF%9D%E6%B3%95%E6%80%A7">刑事违法性</a>。违法行为有各种各样的情况，有的是违反民事法律、经济法律、法规，叫民事违法行为、经济违法行为；有的是违反行政法律、法规，叫行政违法行为。犯罪也是违法行为，但不是一般违法行为，而是违反刑法、触犯刑律的行为，是刑事违法行为。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		违法并不都是犯罪，只有违反刑法的才构成犯罪。例如盗窃、诈骗少量财物，属于违反治安管理处罚条例的行为；只有盗窃、诈骗公私财物数额较大的，才构成刑法中的盗窃罪、诈骗罪。一般的假冒注册商标，属于违反商标法的行为；而假冒注册商标情节严重的，则构成刑法中的假冒注册商标罪。一般的干涉婚姻自由，属于违反婚姻法的行为；而暴力干涉婚姻自由，则是刑法所禁止的犯罪行为。如此等等。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		第三，犯罪是应受刑罚处罚的行为，即具有应受惩罚性。任何违法行为，都要承担相应的法律后果。民事违法行为要承担民事责任，如赔偿损失、返还财产、支付违约金等。行政违法行为要受行政处罚如罚款、行政拘留等，以及行政处分如警告、记过、降职、撤职、留用察看、开除公职等。对于违反刑法的犯罪行为来说，则要求承担刑罚处罚的法律后果。因此，应受刑罚处罚也是犯罪的一个基本特征。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		犯罪的以上三个基本特征是紧密结合的。这三个基本特征是任何犯罪都必然具有的。而其他违法行为则不具备这样三个基本特征。对其他违法行为来说，社会危害性虽然也有一些，但没有达到像犯罪这样严重的程度；它们并不触犯刑律；也不应受刑罚处罚。所以，这三个基本特征也就把犯罪与不犯罪、犯罪与其他违法行为区别开来了。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		构成犯罪需要具备法律所规定的一系列主客观要件，这些要件称之为犯罪构成要件，这些要件的有机统一就叫做犯罪构成。比如，依照刑法第二百六十三条的规定<span style="font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;">[1]</span><a name="ref_[1]_15050"></a>&nbsp;&nbsp;，构成抢劫罪必须是：
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		（1）使用了暴力、胁迫或者其他手段；
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		（2）抢了公私财物；
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		（3）行为人是达到刑事责任年龄、具有刑事责任能力的人；
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		（4）主观上有抢劫的故意。这几个要件综合在一起，就是抢劫罪的犯罪构成。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		又比如，刑法第三百九十七条规定的玩忽职守罪，它的构成要件是：
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		（1）行为人是国家机关工作人员；
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		（2）该人员不履行或者不正确履行自己的职责；
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		（3）由此而使公共财产、国家和人民利益遭受重大损失；
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		（4）主观上对造成这种重大损失不是故意的，而是出于过失。这几个要件综合在一起，就是玩忽职守罪的犯罪构成。我国刑法分则规定有十类犯罪，每类犯罪又分为多寡不等的具体罪，现行刑法总共有414种具体罪，每种罪都有它自己的犯罪构成<span style="font-size:12px;line-height:0;vertical-align:baseline;color:#3366CC;">[1]</span><a name="ref_[1]_15050"></a>&nbsp;。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		比如背叛国家罪，间谍罪，放火罪，爆炸罪，信用证诈骗罪，骗购外汇罪，故意杀人罪，强奸罪，抢劫罪，盗窃罪，诈骗罪，贪污罪，受贿罪，聚众斗殴罪，等等等等，它们的具体犯罪构成都是不一样的。但是，概括起来说，任何一种犯罪的成立都必须具备四个方面的构成要件，即犯罪客体、犯罪客观方面、犯罪主体、犯罪主观方面的构成要件。这四个方面用来分析犯罪，所回答的问题就是：侵犯了什么怎样侵犯的谁侵犯的由于什么侵犯的分析犯罪构成，不外乎从这四个方面去分析查明构成要件。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		（一）犯罪主体。是指实施犯罪行为的人。每一种犯罪，都必须有犯罪主体，有的犯罪是一个人实施的，犯罪主体就是一人，有的犯罪是数人实施的，犯罪主体就是数人。根据刑法规定，公司、企业、事业单位、机关、团体实施犯罪的，构成单位犯罪，因此，单位也可以成为犯罪主体。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		（二）犯罪的主观方面。是指犯罪主体对其实施的犯罪行为及其结果所具有的心理状态。犯罪主观方面的心理状态有两种，即故意和过失。比如犯盗窃罪，犯罪人希望将他人财物窃为己有；犯故意伤害罪，犯罪人希望造成他人身体受到损伤的结果。有的犯罪是过失性质的，如失火罪，犯罪人就具有疏忽大意的心理状态。在单位构成犯罪的情况下，该单位对犯罪行为负有责任的人员也同样具有主观心理状态。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		（三）犯罪的客观方面。是指犯罪行为的具体表现。比如犯诈骗罪，犯罪人具有虚构事实、欺骗他人的行为，贩毒罪具有贩卖毒品的行为，等等。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		（四）犯罪客体。是指刑法所保护而被犯罪行为所侵害的社会关系。犯罪客体和犯罪对象是不同的，犯罪对象是犯罪行为所直接针对的对象，如杀人罪、伤害罪，犯罪对象是具体的被害人，而犯罪客体是指刑法所保护的公民人身权利不受非法侵害的这种社会关系。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		形形色色的犯罪构成要件，归纳起来无非就是这四个方面的要件。
	</div>
	<div class="para" style="font-size:14px;color:#333333;font-family:arial, 宋体, sans-serif;background-color:#FFFFFF;">
		刑法规定犯罪构成有着重大的意义：第一，为追究犯罪人的刑事责任提供根据；第二，为划分罪与非罪、此罪与彼罪的界限提供标准；第三，为无罪的人不受非法追究提供法律保障。因此，严格按照刑法规定分析犯罪构成，这是社会主义法治原则所要求的。
	</div>
</h1>
<p>
	<em></em>
</p>','','0.00','0.00');
INSERT INTO `pa_about` VALUES ('3','收到回复v爱上看到就发到 搜索是的搜索','服务介绍','128.00','0.76');


# 数据库表：pa_access 数据信息
INSERT INTO `pa_access` VALUES ('3','88','2','1','');
INSERT INTO `pa_access` VALUES ('3','87','3','83','');
INSERT INTO `pa_access` VALUES ('3','83','2','1','');
INSERT INTO `pa_access` VALUES ('3','84','3','81','');
INSERT INTO `pa_access` VALUES ('3','82','3','81','');
INSERT INTO `pa_access` VALUES ('3','81','2','1','');
INSERT INTO `pa_access` VALUES ('3','80','3','78','');
INSERT INTO `pa_access` VALUES ('3','79','3','78','');
INSERT INTO `pa_access` VALUES ('2','96','3','93','');
INSERT INTO `pa_access` VALUES ('3','78','2','1','');
INSERT INTO `pa_access` VALUES ('3','75','3','60','');
INSERT INTO `pa_access` VALUES ('3','74','3','60','');
INSERT INTO `pa_access` VALUES ('3','73','3','60','');
INSERT INTO `pa_access` VALUES ('3','72','3','60','');
INSERT INTO `pa_access` VALUES ('3','71','3','60','');
INSERT INTO `pa_access` VALUES ('3','70','3','60','');
INSERT INTO `pa_access` VALUES ('3','69','3','60','');
INSERT INTO `pa_access` VALUES ('3','68','3','60','');
INSERT INTO `pa_access` VALUES ('3','67','3','60','');
INSERT INTO `pa_access` VALUES ('3','60','2','1','');
INSERT INTO `pa_access` VALUES ('4','7','3','3','');
INSERT INTO `pa_access` VALUES ('4','3','2','1','');
INSERT INTO `pa_access` VALUES ('4','6','3','2','');
INSERT INTO `pa_access` VALUES ('4','5','3','2','');
INSERT INTO `pa_access` VALUES ('4','2','2','1','');
INSERT INTO `pa_access` VALUES ('4','1','1','0','');
INSERT INTO `pa_access` VALUES ('2','95','3','93','');
INSERT INTO `pa_access` VALUES ('2','94','3','93','');
INSERT INTO `pa_access` VALUES ('2','93','2','1','');
INSERT INTO `pa_access` VALUES ('2','91','3','89','');
INSERT INTO `pa_access` VALUES ('2','89','2','1','');
INSERT INTO `pa_access` VALUES ('2','90','3','88','');
INSERT INTO `pa_access` VALUES ('2','88','2','1','');
INSERT INTO `pa_access` VALUES ('2','92','3','83','');
INSERT INTO `pa_access` VALUES ('2','87','3','83','');
INSERT INTO `pa_access` VALUES ('2','83','2','1','');
INSERT INTO `pa_access` VALUES ('2','84','3','81','');
INSERT INTO `pa_access` VALUES ('2','82','3','81','');
INSERT INTO `pa_access` VALUES ('2','81','2','1','');
INSERT INTO `pa_access` VALUES ('2','80','3','78','');
INSERT INTO `pa_access` VALUES ('2','79','3','78','');
INSERT INTO `pa_access` VALUES ('2','78','2','1','');
INSERT INTO `pa_access` VALUES ('2','75','3','60','');
INSERT INTO `pa_access` VALUES ('2','74','3','60','');
INSERT INTO `pa_access` VALUES ('2','73','3','60','');
INSERT INTO `pa_access` VALUES ('2','72','3','60','');
INSERT INTO `pa_access` VALUES ('2','71','3','60','');
INSERT INTO `pa_access` VALUES ('2','70','3','60','');
INSERT INTO `pa_access` VALUES ('2','69','3','60','');
INSERT INTO `pa_access` VALUES ('2','68','3','60','');
INSERT INTO `pa_access` VALUES ('2','67','3','60','');
INSERT INTO `pa_access` VALUES ('2','60','2','1','');
INSERT INTO `pa_access` VALUES ('2','66','3','46','');
INSERT INTO `pa_access` VALUES ('2','65','3','46','');
INSERT INTO `pa_access` VALUES ('2','64','3','46','');
INSERT INTO `pa_access` VALUES ('2','63','3','46','');
INSERT INTO `pa_access` VALUES ('2','62','3','46','');
INSERT INTO `pa_access` VALUES ('2','61','3','46','');
INSERT INTO `pa_access` VALUES ('2','59','3','46','');
INSERT INTO `pa_access` VALUES ('2','58','3','46','');
INSERT INTO `pa_access` VALUES ('2','57','3','46','');
INSERT INTO `pa_access` VALUES ('2','56','3','46','');
INSERT INTO `pa_access` VALUES ('2','55','3','46','');
INSERT INTO `pa_access` VALUES ('4','7','3','3','');
INSERT INTO `pa_access` VALUES ('4','3','2','1','');
INSERT INTO `pa_access` VALUES ('4','6','3','2','');
INSERT INTO `pa_access` VALUES ('4','5','3','2','');
INSERT INTO `pa_access` VALUES ('4','2','2','1','');
INSERT INTO `pa_access` VALUES ('4','1','1','0','');
INSERT INTO `pa_access` VALUES ('2','54','3','46','');
INSERT INTO `pa_access` VALUES ('2','53','3','46','');
INSERT INTO `pa_access` VALUES ('2','52','3','46','');
INSERT INTO `pa_access` VALUES ('2','51','3','46','');
INSERT INTO `pa_access` VALUES ('2','50','3','46','');
INSERT INTO `pa_access` VALUES ('2','49','3','46','');
INSERT INTO `pa_access` VALUES ('2','48','3','46','');
INSERT INTO `pa_access` VALUES ('2','47','3','46','');
INSERT INTO `pa_access` VALUES ('2','46','2','1','');
INSERT INTO `pa_access` VALUES ('2','44','3','32','');
INSERT INTO `pa_access` VALUES ('2','43','3','32','');
INSERT INTO `pa_access` VALUES ('2','42','3','32','');
INSERT INTO `pa_access` VALUES ('2','41','3','32','');
INSERT INTO `pa_access` VALUES ('2','40','3','32','');
INSERT INTO `pa_access` VALUES ('2','39','3','32','');
INSERT INTO `pa_access` VALUES ('2','38','3','32','');
INSERT INTO `pa_access` VALUES ('2','37','3','32','');
INSERT INTO `pa_access` VALUES ('2','36','3','32','');
INSERT INTO `pa_access` VALUES ('2','35','3','32','');
INSERT INTO `pa_access` VALUES ('2','34','3','32','');
INSERT INTO `pa_access` VALUES ('2','33','3','32','');
INSERT INTO `pa_access` VALUES ('2','32','2','1','');
INSERT INTO `pa_access` VALUES ('2','77','3','26','');
INSERT INTO `pa_access` VALUES ('2','76','3','26','');
INSERT INTO `pa_access` VALUES ('2','31','3','26','');
INSERT INTO `pa_access` VALUES ('2','30','3','26','');
INSERT INTO `pa_access` VALUES ('2','29','3','26','');
INSERT INTO `pa_access` VALUES ('2','28','3','26','');
INSERT INTO `pa_access` VALUES ('3','66','3','46','');
INSERT INTO `pa_access` VALUES ('3','65','3','46','');
INSERT INTO `pa_access` VALUES ('3','64','3','46','');
INSERT INTO `pa_access` VALUES ('3','63','3','46','');
INSERT INTO `pa_access` VALUES ('3','62','3','46','');
INSERT INTO `pa_access` VALUES ('3','61','3','46','');
INSERT INTO `pa_access` VALUES ('3','59','3','46','');
INSERT INTO `pa_access` VALUES ('3','58','3','46','');
INSERT INTO `pa_access` VALUES ('3','57','3','46','');
INSERT INTO `pa_access` VALUES ('3','56','3','46','');
INSERT INTO `pa_access` VALUES ('3','55','3','46','');
INSERT INTO `pa_access` VALUES ('3','54','3','46','');
INSERT INTO `pa_access` VALUES ('3','53','3','46','');
INSERT INTO `pa_access` VALUES ('3','52','3','46','');
INSERT INTO `pa_access` VALUES ('4','7','3','3','');
INSERT INTO `pa_access` VALUES ('4','3','2','1','');
INSERT INTO `pa_access` VALUES ('4','6','3','2','');
INSERT INTO `pa_access` VALUES ('4','5','3','2','');
INSERT INTO `pa_access` VALUES ('4','2','2','1','');
INSERT INTO `pa_access` VALUES ('4','1','1','0','');
INSERT INTO `pa_access` VALUES ('2','27','3','26','');
INSERT INTO `pa_access` VALUES ('2','26','2','1','');
INSERT INTO `pa_access` VALUES ('2','25','3','14','');
INSERT INTO `pa_access` VALUES ('2','24','3','14','');
INSERT INTO `pa_access` VALUES ('2','23','3','14','');
INSERT INTO `pa_access` VALUES ('2','22','3','14','');
INSERT INTO `pa_access` VALUES ('2','21','3','14','');
INSERT INTO `pa_access` VALUES ('2','20','3','14','');
INSERT INTO `pa_access` VALUES ('2','19','3','14','');
INSERT INTO `pa_access` VALUES ('2','18','3','14','');
INSERT INTO `pa_access` VALUES ('2','17','3','14','');
INSERT INTO `pa_access` VALUES ('2','16','3','14','');
INSERT INTO `pa_access` VALUES ('2','15','3','14','');
INSERT INTO `pa_access` VALUES ('2','9','3','14','');
INSERT INTO `pa_access` VALUES ('2','8','3','14','');
INSERT INTO `pa_access` VALUES ('2','14','2','1','');
INSERT INTO `pa_access` VALUES ('2','13','3','4','');
INSERT INTO `pa_access` VALUES ('2','12','3','4','');
INSERT INTO `pa_access` VALUES ('3','51','3','46','');
INSERT INTO `pa_access` VALUES ('3','50','3','46','');
INSERT INTO `pa_access` VALUES ('3','49','3','46','');
INSERT INTO `pa_access` VALUES ('3','48','3','46','');
INSERT INTO `pa_access` VALUES ('3','47','3','46','');
INSERT INTO `pa_access` VALUES ('3','46','2','1','');
INSERT INTO `pa_access` VALUES ('3','44','3','32','');
INSERT INTO `pa_access` VALUES ('3','43','3','32','');
INSERT INTO `pa_access` VALUES ('3','42','3','32','');
INSERT INTO `pa_access` VALUES ('3','41','3','32','');
INSERT INTO `pa_access` VALUES ('3','40','3','32','');
INSERT INTO `pa_access` VALUES ('3','39','3','32','');
INSERT INTO `pa_access` VALUES ('3','38','3','32','');
INSERT INTO `pa_access` VALUES ('3','37','3','32','');
INSERT INTO `pa_access` VALUES ('3','36','3','32','');
INSERT INTO `pa_access` VALUES ('3','35','3','32','');
INSERT INTO `pa_access` VALUES ('3','34','3','32','');
INSERT INTO `pa_access` VALUES ('3','33','3','32','');
INSERT INTO `pa_access` VALUES ('3','32','2','1','');
INSERT INTO `pa_access` VALUES ('3','77','3','26','');
INSERT INTO `pa_access` VALUES ('3','76','3','26','');
INSERT INTO `pa_access` VALUES ('3','31','3','26','');
INSERT INTO `pa_access` VALUES ('3','30','3','26','');
INSERT INTO `pa_access` VALUES ('3','29','3','26','');
INSERT INTO `pa_access` VALUES ('3','28','3','26','');
INSERT INTO `pa_access` VALUES ('3','27','3','26','');
INSERT INTO `pa_access` VALUES ('3','26','2','1','');
INSERT INTO `pa_access` VALUES ('3','14','2','1','');
INSERT INTO `pa_access` VALUES ('3','13','3','4','');
INSERT INTO `pa_access` VALUES ('3','12','3','4','');
INSERT INTO `pa_access` VALUES ('3','11','3','4','');
INSERT INTO `pa_access` VALUES ('3','10','3','4','');
INSERT INTO `pa_access` VALUES ('3','4','2','1','');
INSERT INTO `pa_access` VALUES ('3','7','3','3','');
INSERT INTO `pa_access` VALUES ('3','3','2','1','');
INSERT INTO `pa_access` VALUES ('3','6','3','2','');
INSERT INTO `pa_access` VALUES ('3','5','3','2','');
INSERT INTO `pa_access` VALUES ('3','2','2','1','');
INSERT INTO `pa_access` VALUES ('3','1','1','0','');
INSERT INTO `pa_access` VALUES ('3','90','3','88','');
INSERT INTO `pa_access` VALUES ('2','11','3','4','');
INSERT INTO `pa_access` VALUES ('2','10','3','4','');
INSERT INTO `pa_access` VALUES ('2','4','2','1','');
INSERT INTO `pa_access` VALUES ('2','7','3','3','');
INSERT INTO `pa_access` VALUES ('2','3','2','1','');
INSERT INTO `pa_access` VALUES ('2','6','3','2','');
INSERT INTO `pa_access` VALUES ('2','5','3','2','');
INSERT INTO `pa_access` VALUES ('2','2','2','1','');
INSERT INTO `pa_access` VALUES ('2','1','1','0','');
INSERT INTO `pa_access` VALUES ('2','97','2','1','');
INSERT INTO `pa_access` VALUES ('2','98','3','97','');
INSERT INTO `pa_access` VALUES ('2','99','3','97','');


# 数据库表：pa_activity 数据信息


# 数据库表：pa_ad 数据信息
INSERT INTO `pa_ad` VALUES ('23','首页1','http://www.2345.com/?kconist','531e85f90bcc1.png','index','10','zh-cn');
INSERT INTO `pa_ad` VALUES ('24','首页2','http://www.2345.com/?kconist','531e88216e887.png','index','9','zh-cn');
INSERT INTO `pa_ad` VALUES ('25','首页3','http://www.2345.com/?kconist','531e88325b1c2.png','index','8','zh-cn');


# 数据库表：pa_admin 数据信息
INSERT INTO `pa_admin` VALUES ('1','超级管理员','bigqig@126.com','7d415867e498a46da4b52aab30c471ba','1','我是超级管理员 哈哈~~','','1510558320');
INSERT INTO `pa_admin` VALUES ('2','','1018681524@qq.com','3b26d3ed2a4227afa5bcf9b5d5e558a5','1','','','1510740448');
INSERT INTO `pa_admin` VALUES ('3','','huwenliang0921@163.com','2cefe7cf993271b34bda137991f089be','1','','','1510740328');
INSERT INTO `pa_admin` VALUES ('4','','123@qq.com','3b26d3ed2a4227afa5bcf9b5d5e558a5','1','','','1510905983');
INSERT INTO `pa_admin` VALUES ('5','机构管理','bigqig1@126.com','3b26d3ed2a4227afa5bcf9b5d5e558a5','1','','','1510907164');
INSERT INTO `pa_admin` VALUES ('6','6','123123@126.com','7d415867e498a46da4b52aab30c471ba','0','','','1513315559');
INSERT INTO `pa_admin` VALUES ('7','6','456456@126.com','6a66a3d6a4ceeecd469d230541661122','1','','','1513315657');
INSERT INTO `pa_admin` VALUES ('8','2','3412516879@qq.com','c5f1acd4ef01bc07116901337eeb7186','1','中传编辑组','','1514451814');


# 数据库表：pa_applyteacher 数据信息
INSERT INTO `pa_applyteacher` VALUES ('1','24','张家奇','哈撒','','','','','1','teacher','','91','','0','1553226421','','','张家奇的直播','','zhangjiaqi545484','15231115232','');


# 数据库表：pa_at 数据信息
INSERT INTO `pa_at` VALUES ('1','1','jkfna','/Public/Img/default/default.jpg','24','forum','1','1511404950');
INSERT INTO `pa_at` VALUES ('2','1','jkfna','/Public/Img/default/default.jpg','25','','1','1511404950');


# 数据库表：pa_auth 数据信息


# 数据库表：pa_book 数据信息
INSERT INTO `pa_book` VALUES ('1','南山南','1512978305','/Uploads/image/institution/20171211/20171211074212_30310.jpg','0','0','播音','','','100');
INSERT INTO `pa_book` VALUES ('2','表演书籍','1512991573','/Uploads/image/institution/20171211/20171211112611_92424.png','0','0','表演','','','150');
INSERT INTO `pa_book` VALUES ('32','','1513130236','/Uploads/Book/2017-12-13/5a3088fc2b292.mp4','2','14','','','./Uploads/Book/Erweima/2017-12-13.09.57.16209.png','');
INSERT INTO `pa_book` VALUES ('4','第一章  声音','1513585823','','2','1','','dajiao sdfhdsgdsfgsdfgfsdgsdfg','./Uploads/Book/Erweima/2017-12-18.16.30.232441.png','');
INSERT INTO `pa_book` VALUES ('5','第二章  北海北','1512993780','','1','1','','','','');
INSERT INTO `pa_book` VALUES ('6','第三章  斗罗','1512994390','','1','1','','','','');
INSERT INTO `pa_book` VALUES ('7','第四章 大主宰','1512994542','','1','1','','','','');
INSERT INTO `pa_book` VALUES ('8','hahaha','1512996970','/Uploads/image/institution/20171211/20171211125609_30179.jpg','0','0','摄影','','','20');
INSERT INTO `pa_book` VALUES ('9','1 大家好','1514864220','/Uploads/Book/2018-01-02/5a4afe5c91e67.mp4','2','4','','十大发防守打法是的发生的发生的发生地方撒地方','./Uploads/Book/Erweima/2018-01-02.11.37.006442.png','');
INSERT INTO `pa_book` VALUES ('10','2 大家好','1513061870','http://bos.nj.bpc.baidu.com/tieba-smallvideo/11772_3c435014fb2dd9a5fd56a57cc369f6a0.mp4','2','4','','sdfsdgsdfgsdfgsdfg','./Uploads/Book/Erweima/2017-12-18.16.37.266872.png','');
INSERT INTO `pa_book` VALUES ('11','①  大家很好','1513585960','/Uploads/Book/2017-12-13/5a308b536bc3e.mp4','2','9','','第三方感到十分规定发给申达股份第三个','./Uploads/Book/Erweima/2017-12-13.10.07.156744.png','');
INSERT INTO `pa_book` VALUES ('12','大家好','1513061872','/Uploads/Book/2017-12-18/5a377ec0cf70b.mp4','2','4','','大家好大家好大家好大家好大家好大家好大家好大家好大家好大家好','./Uploads/Book/Erweima/2017-12-18.16.39.283598.png','');
INSERT INTO `pa_book` VALUES ('13','dajiaho','1514861931','/Uploads/Book/2018-01-02/5a4af56b4a3fc.mp4','2','4','','werfserfserfserf','./Uploads/Book/Erweima/2018-01-02.10.58.518511.png','');
INSERT INTO `pa_book` VALUES ('14','12312312312312','1513585961','/Uploads/Book/2017-12-18/5a377d29a0be7.mp4','2','9','','sdfsdfsdfsdfsdfsdf','./Uploads/Book/Erweima/2017-12-18.16.32.413562.png','');
INSERT INTO `pa_book` VALUES ('15','12312312312312','1513131077','/Uploads/Book/2017-12-13/5a308c45724c3.mp4','2','11','','你说的','./Uploads/Book/Erweima/2017-12-13.10.11.173858.png','');
INSERT INTO `pa_book` VALUES ('16','12312312312312','1513067325','/Uploads/Book/2017-12-12/5a2f933ce947b.mp3','2','9','','','','');
INSERT INTO `pa_book` VALUES ('22','12312312312312','1513128723','/Uploads/Book/2017-12-13/5a30831368b58.mp4','2','20','','','/Uploads/Book/Erweima/2017-12-13.09.32.032365.png','');
INSERT INTO `pa_book` VALUES ('23','12312312312312','1513129024','/Uploads/Book/2017-12-13/5a30844051491.mp4','2','10','','','./Uploads/Book/Erweima/2017-12-13.09.37.041856.png','');
INSERT INTO `pa_book` VALUES ('19','第五章   北海北北海北','1513072659','','1','1','','','','');
INSERT INTO `pa_book` VALUES ('20','1  北','1514862581','/Uploads/Book/2018-01-02/5a4af7f54b43c.mp4','2','19','','sdjfgasdfgbasdljgsdfgsdfgsdfgsdf','./Uploads/Book/Erweima/2018-01-02.11.09.411071.png','');
INSERT INTO `pa_book` VALUES ('24','第一章  表演特性','1513129094','','1','2','','','','');
INSERT INTO `pa_book` VALUES ('28','12312312312312','1513129319','/Uploads/Book/2017-12-13/5a3085679a670.mp4','2','26','','','yichong.com/Uploads/Book/Erweima/2017-12-13.09.41.599703.png','');
INSERT INTO `pa_book` VALUES ('26','2   表演的方式','1513586005','/Uploads/Book/2017-12-18/5a377d55d5664.mp4','2','24','','asdfgdgsdfgdfg','./Uploads/Book/Erweima/2017-12-18.16.33.251850.png','');
INSERT INTO `pa_book` VALUES ('27','12312312312312','1513129167','/Uploads/Book/2017-12-13/5a3084cf45231.mp4','2','26','','','/Uploads/Book/Erweima/2017-12-13.09.39.279569.png','');
INSERT INTO `pa_book` VALUES ('29','啊啊啊啊啊啊啊啊啊啊','1513129406','/Uploads/Book/2017-12-13/5a3085be22cb4.mp4','2','28','','','http://yichong.com/Uploads/Book/Erweima/2017-12-13.09.43.262887.png','');
INSERT INTO `pa_book` VALUES ('30','啊啊啊啊','1513129484','','1','8','','','','');
INSERT INTO `pa_book` VALUES ('31','12312312312312','1514863101','/Uploads/Book/2018-01-02/5a4af9fdd197b.mp4','2','30','','nihao jdsfsdagbadfgbsadfgsdfgsdfgsdfg','./Uploads/Book/Erweima/2018-01-02.11.18.213165.png','');
INSERT INTO `pa_book` VALUES ('33','武动乾坤','1513135389','/Uploads/image/institution/20171213/20171213032257_98720.jpg','0','0','表演','《武动乾坤》是连载在起点中文网的一部东方玄幻小说，作者是起点白金作家天蚕土豆。小说讲述了大炎王朝天都郡炎城青阳镇，落魄的林氏子弟林动在山洞间偶然捡到一块神秘的石符而走上的逆袭之路。
2017年7月12日，《2017猫片 胡润原创文学IP价值榜》发布，《武动乾坤》排名第15位。','','300');
INSERT INTO `pa_book` VALUES ('34','第一章   武动','1513135716','','1','33','','','','');
INSERT INTO `pa_book` VALUES ('35','第二章 乾坤','1513135812','','1','33','','','','');
INSERT INTO `pa_book` VALUES ('36','11111111','1513586149','','1','34','','','','');
INSERT INTO `pa_book` VALUES ('38','斗破','1513593199','/Uploads/image/institution/20171218/20171218103318_99104.png','0','0','播音','斗破斗破斗破斗破斗破斗破斗破斗破斗破斗破斗破斗破斗破斗破斗破斗破','','50');
INSERT INTO `pa_book` VALUES ('39','1 他的心里还放不下一个家','1514863021','/Uploads/Book/2018-01-02/5a4af9ad5b361.mp4','2','5','','hasdfjsadfjkasdfsdfsdfsdf','./Uploads/Book/Erweima/2018-01-02.11.17.018001.png','');
INSERT INTO `pa_book` VALUES ('40','1 斗罗大陆  唐三','1514189410','不生成','2','6','','唐三是一个非常厉害的人物 来自于唐门','','');
INSERT INTO `pa_book` VALUES ('41','1 牧尘哈哈哈','1514189452','不生成','2','7','','哈哈哈哈哈  我就不告诉你牧尘是谁，就不告诉你呀...就不告诉你.','','');
INSERT INTO `pa_book` VALUES ('42','1 斗破苍穹','1514189473','','1','38','','','','');
INSERT INTO `pa_book` VALUES ('43','1  北北北','1514869304','www.aipai.com/app/www/templates/aipai_platform/pc/videos/swf/player_New.swf','2','42','','dfjgshlfkjjgblsdfjkgbsldjfkgblsdfkgsdfgsdfgsdfgsdfgsdfgsdfgsdf','./Uploads/Book/Erweima/2018-01-02.13.01.443866.png','');


# 数据库表：pa_bought 数据信息
INSERT INTO `pa_bought` VALUES ('1','40','','35','','1','','11.00');
INSERT INTO `pa_bought` VALUES ('2','41','','25','','1','','10.00');
INSERT INTO `pa_bought` VALUES ('3','40','','25','','1','','11.00');
INSERT INTO `pa_bought` VALUES ('4','41','','35','','1','','10.00');
INSERT INTO `pa_bought` VALUES ('5','38','1513067526','24','','1','支出','12.00');
INSERT INTO `pa_bought` VALUES ('6','38','1513161030','24','','2','支出','12.00');
INSERT INTO `pa_bought` VALUES ('7','','1513165940','40','gift','','收入','170.00');
INSERT INTO `pa_bought` VALUES ('10','41','1513323839','24','product#id','1','支出','50.00');
INSERT INTO `pa_bought` VALUES ('13','38','1513327855','24','product#id','3','支出','36.00');
INSERT INTO `pa_bought` VALUES ('15','38','1513327992','24','product#id','3','支出','36.00');
INSERT INTO `pa_bought` VALUES ('17','38','1513654364','24','book#book_id','1','支出','50.00');
INSERT INTO `pa_bought` VALUES ('18','2','1513654617','24','wish#wish_id','1','支出','5.00');
INSERT INTO `pa_bought` VALUES ('19','2','1513662131','24','wish#wish_id','1','支出','5.00');
INSERT INTO `pa_bought` VALUES ('21','1','1513673306','24','book#book_id','1','支出','100.00');
INSERT INTO `pa_bought` VALUES ('24','1','1513822546','2','book#book_id','1','支出','100.00');
INSERT INTO `pa_bought` VALUES ('25','1','1513822717','2','book#book_id','1','支出','100.00');
INSERT INTO `pa_bought` VALUES ('26','33','1513822849','2','book#book_id','1','支出','300.00');
INSERT INTO `pa_bought` VALUES ('27','1','1513822930','2','book#book_id','1','支出','100.00');
INSERT INTO `pa_bought` VALUES ('28','1','1514014808','2','book#book_id','1','支出','100.00');
INSERT INTO `pa_bought` VALUES ('29','1','1514014896','2','book#book_id','1','支出','100.00');
INSERT INTO `pa_bought` VALUES ('30','3','1514014945','24','about#id','1','支出','98.00');
INSERT INTO `pa_bought` VALUES ('31','2','1514024695','24','book#book_id','1','支出','150.00');
INSERT INTO `pa_bought` VALUES ('32','8','1514025494','24','book#book_id','1','支出','20.00');
INSERT INTO `pa_bought` VALUES ('33','33','1514025859','24','book#book_id','1','支出','300.00');
INSERT INTO `pa_bought` VALUES ('34','1','1514165011','34','book#book_id','1','支出','100.00');
INSERT INTO `pa_bought` VALUES ('35','38','1514276125','2','product#id','1','支出','12.00');
INSERT INTO `pa_bought` VALUES ('36','2','1514283172','66','book#book_id','1','支出','150.00');
INSERT INTO `pa_bought` VALUES ('37','1','1514368231','2','book#book_id','1','支出','100.00');
INSERT INTO `pa_bought` VALUES ('38','2','1514381085','65','book#book_id','1','支出','150.00');
INSERT INTO `pa_bought` VALUES ('39','1','1514381239','65','book#book_id','1','支出','100.00');
INSERT INTO `pa_bought` VALUES ('40','1','1514427772','2','book#book_id','1','支出','100.00');
INSERT INTO `pa_bought` VALUES ('41','4','1514963203','65','wish#wish_id','1','支出','98.00');
INSERT INTO `pa_bought` VALUES ('42','4','1514963209','65','wish#wish_id','1','支出','98.00');
INSERT INTO `pa_bought` VALUES ('43','4','1514963210','65','wish#wish_id','1','支出','98.00');
INSERT INTO `pa_bought` VALUES ('44','4','1514963211','65','wish#wish_id','1','支出','98.00');
INSERT INTO `pa_bought` VALUES ('45','4','1514963211','65','wish#wish_id','1','支出','98.00');
INSERT INTO `pa_bought` VALUES ('46','4','1514963211','65','wish#wish_id','1','支出','98.00');
INSERT INTO `pa_bought` VALUES ('47','4','1514963212','65','wish#wish_id','1','支出','98.00');
INSERT INTO `pa_bought` VALUES ('48','4','1514963213','65','wish#wish_id','1','支出','98.00');
INSERT INTO `pa_bought` VALUES ('49','1','1514963439','65','wish#wish_id','1','支出','10.00');


# 数据库表：pa_buybook 数据信息
INSERT INTO `pa_buybook` VALUES ('4','24','1','100.00','0');
INSERT INTO `pa_buybook` VALUES ('5','24','2','10.00','0');
INSERT INTO `pa_buybook` VALUES ('6','24','8','20.00','0');
INSERT INTO `pa_buybook` VALUES ('7','24','33','5.00','0');
INSERT INTO `pa_buybook` VALUES ('9','24','38','50.00','1513598719');


# 数据库表：pa_buywith 数据信息
INSERT INTO `pa_buywith` VALUES ('1','24','haha ','2','10.00','清华','0');
INSERT INTO `pa_buywith` VALUES ('2','24','呦呦呦','1','0.00','北大','1513236555');
INSERT INTO `pa_buywith` VALUES ('3','24','呦呦呦','1','0.00','北大','1513236887');
INSERT INTO `pa_buywith` VALUES ('4','24','清华北大','2','0.00','清华','1513654617');
INSERT INTO `pa_buywith` VALUES ('5','24','清华北大','2','0.00','清华','1513662131');
INSERT INTO `pa_buywith` VALUES ('6','65','北大我来啦！等着我！','4','0.00','北京大学','1514963203');
INSERT INTO `pa_buywith` VALUES ('7','65','北大我来啦！等着我！','4','0.00','北京大学','1514963209');
INSERT INTO `pa_buywith` VALUES ('8','65','北大我来啦！等着我！','4','0.00','北京大学','1514963210');
INSERT INTO `pa_buywith` VALUES ('9','65','北大我来啦！等着我！','4','0.00','北京大学','1514963211');
INSERT INTO `pa_buywith` VALUES ('10','65','北大我来啦！等着我！','4','0.00','北京大学','1514963211');
INSERT INTO `pa_buywith` VALUES ('11','65','北大我来啦！等着我！','4','0.00','北京大学','1514963211');
INSERT INTO `pa_buywith` VALUES ('12','65','北大我来啦！等着我！','4','0.00','北京大学','1514963212');
INSERT INTO `pa_buywith` VALUES ('13','65','北大我来啦！等着我！','4','0.00','北京大学','1514963213');
INSERT INTO `pa_buywith` VALUES ('14','65','爱你','1','0.00','清华大学','1514963439');


# 数据库表：pa_call 数据信息
INSERT INTO `pa_call` VALUES ('1','','45','','34','1516606017','0','1','0.00','0.00');
INSERT INTO `pa_call` VALUES ('2','','24','','34','1516607688','0','1','0.00','0.00');
INSERT INTO `pa_call` VALUES ('3','','24','','34','1516608699','0','1','0.00','0.00');
INSERT INTO `pa_call` VALUES ('4','','24','','34','1516610062','0','1','0.00','0.00');
INSERT INTO `pa_call` VALUES ('5','','24','','34','1516610091','0','1','0.00','0.00');
INSERT INTO `pa_call` VALUES ('6','','24','','34','1516611521','0','1','0.00','0.00');
INSERT INTO `pa_call` VALUES ('7','','24','','34','1516611536','0','1','0.00','0.00');
INSERT INTO `pa_call` VALUES ('8','','24','','34','1516611700','0','1','0.00','0.00');
INSERT INTO `pa_call` VALUES ('9','','24','','34','1516620836','0','0','0.00','0.00');
INSERT INTO `pa_call` VALUES ('10','','24','','34','1516620875','0','0','0.00','0.00');
INSERT INTO `pa_call` VALUES ('11','','24','','34','1516620924','0','1','0.00','0.00');
INSERT INTO `pa_call` VALUES ('12','','24','','34','1516620982','0','0','0.00','0.00');
INSERT INTO `pa_call` VALUES ('13','','24','','34','1516621133','0','0','0.00','0.00');
INSERT INTO `pa_call` VALUES ('14','','24','','34','1516621148','0','0','0.00','0.00');
INSERT INTO `pa_call` VALUES ('15','','24','','34','1516621302','0','0','0.00','0.00');
INSERT INTO `pa_call` VALUES ('16','','24','','34','1516621330','0','0','0.00','0.00');
INSERT INTO `pa_call` VALUES ('17','','24','','34','1516621607','0','0','0.00','0.00');
INSERT INTO `pa_call` VALUES ('18','','24','','34','1516621861','0','0','0.00','0.00');
INSERT INTO `pa_call` VALUES ('19','','34','','24','1516626205','18','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('20','','34','','24','1516626213','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('21','','34','','24','1516626274','18','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('22','','34','','24','1516669071','10','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('23','','24','','34','1516671484','10','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('24','','24','','41','1516671720','10','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('25','','24','','41','1516672555','10','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('26','','24','','45','1516679538','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('27','','41','','42','1516684698','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('28','','41','','42','1516684736','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('29','','41','','42','1516685114','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('30','','41','','42','1516685167','2','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('31','','41','','42','1516685372','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('32','','42','','41','1516685513','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('33','','42','','41','1516685607','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('34','','42','','41','1516685677','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('35','','42','','41','1516685784','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('36','','42','','41','1516686060','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('37','','42','','41','1516686752','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('38','','41','','42','1516686836','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('39','','42','','41','1516686981','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('40','','42','','41','1516687106','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('41','','42','','41','1516687211','701405','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('42','','42','','41','1516687967','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('43','','42','','41','1516688251','24','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('44','','41','','42','1516688547','25','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('45','','41','','42','1516688838','96','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('46','','41','','42','1516689130','11','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('47','','42','','41','1516689311','15','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('48','','42','','41','1516689480','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('49','','42','','41','1516689546','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('50','','41','','42','1516689642','10','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('51','','42','','41','1516691082','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('52','','42','','41','1516691138','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('53','','42','','41','1516691325','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('54','','41','','42','1516691409','1','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('55','','42','','41','1516691783','11764','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('56','','42','','41','1516691975','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('57','','42','','41','1516692102','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('58','','42','','41','1516692178','11769','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('59','','42','','41','1516692317','11771','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('60','','42','','41','1516692386','11774','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('61','','42','','41','1516692636','11781','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('62','','42','','41','1516693071','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('63','','42','','41','1516693116','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('64','','42','','41','1516693210','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('65','','42','','41','1516693346','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('66','','42','','41','1516693496','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('67','','42','','41','1516693704','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('68','','42','','41','1516693928','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('69','','41','','42','1516694017','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('70','','42','','41','1516694121','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('71','','42','','41','1516694186','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('72','','24','','45','1516699094','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('73','','41','','42','1516701914','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('74','','24','','45','1516707379','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('75','','24','','45','1516708847','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('76','','24','','45','1516710449','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('77','','24','','45','1516710479','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('78','','24','','45','1516711634','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('79','8544564','24','骚货','45','1516765462','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('80','8544564','24','骚货','45','1516765468','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('81','小蝌蚪1','41','小蝌蚪2','42','1516765740','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('82','小蝌蚪1','41','小蝌蚪2','42','1516765753','12189','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('83','小蝌蚪1','41','骚货','45','1516766225','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('84','小蝌蚪1','41','骚货','45','1516769096','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('85','小蝌蚪1','41','骚货','45','1516769285','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('86','小蝌蚪1','41','骚货','45','1516769446','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('87','小蝌蚪1','41','骚货','45','1516770816','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('88','小蝌蚪1','41','骚货','45','1516770980','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('89','小蝌蚪1','41','骚货','45','1516772042','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('90','小蝌蚪1','41','骚货','45','1516772165','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('91','小蝌蚪1','41','骚货','45','1516772172','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('92','小蝌蚪1','41','骚货','45','1516772407','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('93','小蝌蚪1','41','骚货','45','1516772546','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('94','小蝌蚪1','41','骚货','45','1516772558','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('95','小蝌蚪1','41','骚货','45','1516772575','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('96','小蝌蚪1','41','骚货','45','1516772600','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('97','小蝌蚪1','41','骚货','45','1516772606','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('98','小蝌蚪1','41','骚货','45','1516773047','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('99','小蝌蚪1','41','骚货','45','1516773190','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('100','小蝌蚪1','41','骚货','45','1516773394','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('101','小蝌蚪1','41','骚货','45','1516773455','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('102','8544564','24','骚货','45','1516773483','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('103','小蝌蚪1','41','骚货','45','1516773522','5211','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('104','小蝌蚪1','41','骚货','45','1516773740','5215','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('105','小蝌蚪1','41','骚货','45','1516773966','5218','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('106','小蝌蚪1','41','骚货','45','1516774081','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('107','小蝌蚪1','41','骚货','45','1516774423','5226','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('108','小蝌蚪1','41','骚货','45','1516774562','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('109','小蝌蚪1','41','骚货','45','1516774740','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('110','小蝌蚪1','41','骚货','45','1516774786','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('111','小蝌蚪1','41','骚货','45','1516775587','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('112','小蝌蚪1','41','骚货','45','1516776000','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('113','小蝌蚪1','41','骚货','45','1516776020','5252','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('114','小蝌蚪1','41','骚货','45','1516776143','5256','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('115','小蝌蚪1','41','骚货','45','1516776698','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('116','小蝌蚪1','41','骚货','45','1516776953','5272','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('117','小蝌蚪1','41','骚货','45','1516777222','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('118','小蝌蚪1','41','骚货','45','1516777806','5287','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('119','小蝌蚪1','41','骚货','45','1516778171','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('120','小蝌蚪1','41','骚货','45','1516778291','5290','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('121','小蝌蚪1','41','骚货','45','1516779112','5303','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('122','小蝌蚪1','41','骚货','45','1516779163','5305','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('123','小蝌蚪1','41','骚货','45','1516779335','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('124','小蝌蚪1','41','骚货','45','1516779500','5316','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('125','小蝌蚪1','41','骚货','45','1516780317','5324','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('126','小蝌蚪1','41','骚货','45','1516780446','5326','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('127','小蝌蚪1','41','骚货','45','1516780740','5333','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('128','小蝌蚪1','41','骚货','45','1516780932','5334','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('129','小蝌蚪1','41','骚货','45','1516781128','5338','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('130','小蝌蚪1','41','骚货','45','1516781382','5345','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('131','小蝌蚪1','41','骚货','45','1516781684','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('132','小蝌蚪1','41','骚货','45','1516781872','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('133','小蝌蚪1','41','骚货','45','1516783417','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('134','骚货','45','小蝌蚪1','41','1516786596','5428','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('135','骚货','45','小蝌蚪1','41','1516794029','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('136','骚货','45','小蝌蚪1','41','1516794229','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('137','骚货','45','小蝌蚪1','41','1516794258','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('138','骚货','45','小蝌蚪1','41','1516794287','5537','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('139','骚货','45','小蝌蚪1','41','1516794467','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('140','骚货','45','小蝌蚪1','41','1516795365','5555','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('141','骚货','45','小蝌蚪1','41','1516795799','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('142','骚货','45','小蝌蚪1','41','1516796430','5573','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('143','骚货','45','小蝌蚪1','41','1516797222','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('144','小蝌蚪1','41','骚货','45','1516797402','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('145','小蝌蚪1','41','骚货','45','1516797411','18','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('146','小蝌蚪1','41','骚货','45','1516797420','18','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('147','小蝌蚪1','41','骚货','45','1516797437','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('148','骚货','45','小蝌蚪1','41','1516797535','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('149','骚货','45','小蝌蚪1','41','1516797575','1','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('150','骚货','45','小蝌蚪1','41','1516798061','5600','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('151','骚货','45','小蝌蚪1','41','1516798507','5607','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('152','骚货','45','小蝌蚪1','41','1516798527','5608','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('153','骚货','45','小蝌蚪1','41','1516798674','5613','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('154','骚货','45','小蝌蚪1','41','1516798691','3','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('155','骚货','45','小蝌蚪1','41','1516798709','2','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('156','骚货','45','小蝌蚪1','41','1516798889','5614','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('157','骚货','45','骚货','45','1516799274','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('158','骚货','45','小蝌蚪1','41','1516799300','5623','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('159','骚货','45','小二郎儿','39','1516843560','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('160','小蝌蚪2','42','继续继续','45','1516861515','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('161','小蝌蚪2','42','继续继续','45','1516861535','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('162','小蝌蚪2','42','继续继续','45','1516861582','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('163','小蝌蚪2','42','继续继续','45','1516862518','6003','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('164','小蝌蚪2','42','继续继续','45','1516864398','18','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('165','小蝌蚪2','42','继续继续','45','1516864807','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('166','小蝌蚪2','42','继续继续','45','1516865044','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('167','小蝌蚪2','42','继续继续','45','1516865848','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('168','小蝌蚪2','42','继续继续','45','1516865985','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('169','小蝌蚪2','42','继续继续','45','1516866247','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('170','小蝌蚪2','42','继续继续','45','1516866421','1','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('171','小蝌蚪2','42','继续继续','45','1516866918','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('172','小蝌蚪2','42','继续继续','45','1516867173','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('173','小蝌蚪2','42','继续继续','45','1516867395','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('174','继续继续','45','小蝌蚪1','41','1516867459','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('175','继续继续','45','小蝌蚪1','41','1516867531','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('176','哈撒ki1','25','小蝌蚪2','42','1516867588','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('177','继续继续','45','小蝌蚪1','41','1516867960','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('178','哈撒ki1','25','小蝌蚪2','42','1516867999','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('179','哈撒ki1','25','继续继续','45','1516868012','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('180','哈撒ki1','25','继续继续','45','1516868030','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('181','哈撒ki1','25','继续继续','45','1516868034','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('182','小蝌蚪2','42','继续继续','45','1516868039','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('183','哈撒ki1','25','小蝌蚪2','42','1516868045','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('184','哈撒ki1','25','小蝌蚪2','42','1516868057','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('185','小蝌蚪2','42','继续继续','45','1516868064','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('186','继续继续','45','小蝌蚪2','42','1516868083','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('187','小蝌蚪2','42','继续继续','45','1516868215','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('188','小蝌蚪2','42','继续继续','45','1516868287','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('189','小蝌蚪2','42','继续继续','45','1516868783','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('190','小蝌蚪2','42','继续继续','45','1516869102','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('191','小蝌蚪2','42','继续继续','45','1516869399','1','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('192','继续继续','45','小蝌蚪2','42','1516869904','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('193','继续继续','45','小蝌蚪2','42','1516870032','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('194','继续继续','45','小蝌蚪2','42','1516870404','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('195','继续继续','45','小蝌蚪2','42','1516870511','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('196','小蝌蚪2','42','继续继续','45','1516870617','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('197','小蝌蚪2','42','继续继续','45','1516870647','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('198','小蝌蚪2','42','小蝌蚪2','42','1516870820','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('199','小蝌蚪2','42','小蝌蚪2','42','1516870923','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('200','小蝌蚪2','42','小蝌蚪2','42','1516871101','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('201','继续继续','45','小蝌蚪2','42','1516871607','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('202','小蝌蚪2','42','继续继续','45','1516871655','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('203','小蝌蚪2','42','继续继续','45','1516871738','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('204','继续继续','45','小蝌蚪2','42','1516871757','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('205','继续继续','45','小蝌蚪2','42','1516871786','1','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('206','继续继续','45','小蝌蚪2','42','1516872370','0','0','0.20','300.00');
INSERT INTO `pa_call` VALUES ('207','继续继续','45','小蝌蚪2','42','1516872567','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('208','继续继续','45','小蝌蚪2','42','1516872781','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('209','继续继续','45','小蝌蚪2','42','1516872916','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('210','继续继续','45','小蝌蚪2','42','1516873027','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('211','继续继续','45','小蝌蚪2','42','1516873082','0','2','0.20','300.00');
INSERT INTO `pa_call` VALUES ('212','继续继续','45','小蝌蚪2','42','1516873747','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('213','继续继续','45','小蝌蚪2','42','1516874135','0','1','0.20','300.00');
INSERT INTO `pa_call` VALUES ('214','继续继续','45','小蝌蚪2','42','1516886219','1','2','0.20','300.00');


# 数据库表：pa_category 数据信息
INSERT INTO `pa_category` VALUES ('1','0','信托计划','n','zh-cn');
INSERT INTO `pa_category` VALUES ('2','1','行业新闻','n','zh-cn');
INSERT INTO `pa_category` VALUES ('4','1','信托渠道','n','zh-cn');
INSERT INTO `pa_category` VALUES ('5','1','行业研究','n','zh-cn');
INSERT INTO `pa_category` VALUES ('3','1','机构动态','n','zh-cn');
INSERT INTO `pa_category` VALUES ('54','53','666666666','n','zh-cn');
INSERT INTO `pa_category` VALUES ('62','0','礼物','p','zh-cn');
INSERT INTO `pa_category` VALUES ('66','62','111','','zh-cn');
INSERT INTO `pa_category` VALUES ('67','62','www','','zh-cn');
INSERT INTO `pa_category` VALUES ('68','3','饿饿','n','zh-cn');
INSERT INTO `pa_category` VALUES ('69','5','121','n','zh-cn');
INSERT INTO `pa_category` VALUES ('70','69','111传','n','zh-cn');
INSERT INTO `pa_category` VALUES ('71','0','比赛','n','zh-cn');
INSERT INTO `pa_category` VALUES ('72','71','比赛新闻资讯','n','zh-cn');
INSERT INTO `pa_category` VALUES ('88','0','虚拟货币','p','zh-cn');
INSERT INTO `pa_category` VALUES ('89','0','课程类别','p','zh-cn');
INSERT INTO `pa_category` VALUES ('90','89','语数外','p','zh-cn');
INSERT INTO `pa_category` VALUES ('91','89','理综合','p','zh-cn');
INSERT INTO `pa_category` VALUES ('92','89','文综合','p','zh-cn');
INSERT INTO `pa_category` VALUES ('93','89','研究生','p','zh-cn');
INSERT INTO `pa_category` VALUES ('94','89','艺术课','p','zh-cn');
INSERT INTO `pa_category` VALUES ('95','89','推广课','p','zh-cn');


# 数据库表：pa_category_copy 数据信息
INSERT INTO `pa_category_copy` VALUES ('1','0','信托计划','n','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('2','1','行业新闻','n','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('4','1','信托渠道','n','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('5','1','行业研究','n','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('3','1','机构动态','n','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('54','53','666666666','n','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('61','0','图书','p','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('62','0','礼物','p','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('65','0','课程','p','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('66','62','111','','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('67','62','www','','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('68','3','饿饿','n','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('69','5','121','n','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('70','69','111传','n','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('71','0','比赛','n','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('72','71','比赛新闻资讯','n','zh-cn');
INSERT INTO `pa_category_copy` VALUES ('87','0','虫币','p','zh-cn');


# 数据库表：pa_city 数据信息
INSERT INTO `pa_city` VALUES ('1','北京市','1','0');
INSERT INTO `pa_city` VALUES ('2','天津市','1','0');
INSERT INTO `pa_city` VALUES ('3','河北省','1','0');
INSERT INTO `pa_city` VALUES ('4','山西省','1','0');
INSERT INTO `pa_city` VALUES ('5','内蒙古自治区','1','0');
INSERT INTO `pa_city` VALUES ('6','辽宁省','1','0');
INSERT INTO `pa_city` VALUES ('7','吉林省','1','0');
INSERT INTO `pa_city` VALUES ('8','黑龙江省','1','0');
INSERT INTO `pa_city` VALUES ('9','上海市','1','0');
INSERT INTO `pa_city` VALUES ('10','江苏省','1','0');
INSERT INTO `pa_city` VALUES ('11','浙江省','1','0');
INSERT INTO `pa_city` VALUES ('12','安徽省','1','0');
INSERT INTO `pa_city` VALUES ('13','福建省','1','0');
INSERT INTO `pa_city` VALUES ('14','江西省','1','0');
INSERT INTO `pa_city` VALUES ('15','山东省','1','0');
INSERT INTO `pa_city` VALUES ('16','河南省','1','0');
INSERT INTO `pa_city` VALUES ('17','湖北省','1','0');
INSERT INTO `pa_city` VALUES ('18','湖南省','1','0');
INSERT INTO `pa_city` VALUES ('19','广东省','1','0');
INSERT INTO `pa_city` VALUES ('20','广西壮族自治区','1','0');
INSERT INTO `pa_city` VALUES ('21','海南省','1','0');
INSERT INTO `pa_city` VALUES ('22','重庆市','1','0');
INSERT INTO `pa_city` VALUES ('23','四川省','1','0');
INSERT INTO `pa_city` VALUES ('24','贵州省','1','0');
INSERT INTO `pa_city` VALUES ('25','云南省','1','0');
INSERT INTO `pa_city` VALUES ('26','西藏自治区','1','0');
INSERT INTO `pa_city` VALUES ('27','陕西省','1','0');
INSERT INTO `pa_city` VALUES ('28','甘肃省','1','0');
INSERT INTO `pa_city` VALUES ('29','青海省','1','0');
INSERT INTO `pa_city` VALUES ('30','宁夏回族自治区','1','0');
INSERT INTO `pa_city` VALUES ('31','新疆维吾尔自治区','1','0');
INSERT INTO `pa_city` VALUES ('32','台湾省','1','0');
INSERT INTO `pa_city` VALUES ('33','香港特别行政区','1','0');
INSERT INTO `pa_city` VALUES ('34','澳门特别行政区','1','0');
INSERT INTO `pa_city` VALUES ('35','海外','1','0');
INSERT INTO `pa_city` VALUES ('36','其他','1','0');
INSERT INTO `pa_city` VALUES ('37','东城区','2','1');
INSERT INTO `pa_city` VALUES ('38','西城区','2','1');
INSERT INTO `pa_city` VALUES ('39','崇文区','2','1');
INSERT INTO `pa_city` VALUES ('40','宣武区','2','1');
INSERT INTO `pa_city` VALUES ('41','朝阳区','2','1');
INSERT INTO `pa_city` VALUES ('42','丰台区','2','1');
INSERT INTO `pa_city` VALUES ('43','石景山区','2','1');
INSERT INTO `pa_city` VALUES ('44','海淀区','2','1');
INSERT INTO `pa_city` VALUES ('45','门头沟区','2','1');
INSERT INTO `pa_city` VALUES ('46','房山区','2','1');
INSERT INTO `pa_city` VALUES ('47','通州区','2','1');
INSERT INTO `pa_city` VALUES ('48','顺义区','2','1');
INSERT INTO `pa_city` VALUES ('49','昌平区','2','1');
INSERT INTO `pa_city` VALUES ('50','大兴区','2','1');
INSERT INTO `pa_city` VALUES ('51','怀柔区','2','1');
INSERT INTO `pa_city` VALUES ('52','平谷区','2','1');
INSERT INTO `pa_city` VALUES ('53','密云县','2','1');
INSERT INTO `pa_city` VALUES ('54','延庆县','2','1');
INSERT INTO `pa_city` VALUES ('55','和平区','2','2');
INSERT INTO `pa_city` VALUES ('56','河东区','2','2');
INSERT INTO `pa_city` VALUES ('57','河西区','2','2');
INSERT INTO `pa_city` VALUES ('58','南开区','2','2');
INSERT INTO `pa_city` VALUES ('59','河北区','2','2');
INSERT INTO `pa_city` VALUES ('60','红桥区','2','2');
INSERT INTO `pa_city` VALUES ('61','塘沽区','2','2');
INSERT INTO `pa_city` VALUES ('62','汉沽区','2','2');
INSERT INTO `pa_city` VALUES ('63','大港区','2','2');
INSERT INTO `pa_city` VALUES ('64','东丽区','2','2');
INSERT INTO `pa_city` VALUES ('65','西青区','2','2');
INSERT INTO `pa_city` VALUES ('66','津南区','2','2');
INSERT INTO `pa_city` VALUES ('67','北辰区','2','2');
INSERT INTO `pa_city` VALUES ('68','武清区','2','2');
INSERT INTO `pa_city` VALUES ('69','宝坻区','2','2');
INSERT INTO `pa_city` VALUES ('70','宁河县','2','2');
INSERT INTO `pa_city` VALUES ('71','静海县','2','2');
INSERT INTO `pa_city` VALUES ('72','蓟县','2','2');
INSERT INTO `pa_city` VALUES ('73','石家庄市','2','3');
INSERT INTO `pa_city` VALUES ('74','唐山市','2','3');
INSERT INTO `pa_city` VALUES ('75','秦皇岛市','2','3');
INSERT INTO `pa_city` VALUES ('76','邯郸市','2','3');
INSERT INTO `pa_city` VALUES ('77','邢台市','2','3');
INSERT INTO `pa_city` VALUES ('78','保定市','2','3');
INSERT INTO `pa_city` VALUES ('79','张家口市','2','3');
INSERT INTO `pa_city` VALUES ('80','承德市','2','3');
INSERT INTO `pa_city` VALUES ('81','衡水市','2','3');
INSERT INTO `pa_city` VALUES ('82','廊坊市','2','3');
INSERT INTO `pa_city` VALUES ('83','沧州市','2','3');
INSERT INTO `pa_city` VALUES ('84','太原市','2','4');
INSERT INTO `pa_city` VALUES ('85','大同市','2','4');
INSERT INTO `pa_city` VALUES ('86','阳泉市','2','4');
INSERT INTO `pa_city` VALUES ('87','长治市','2','4');
INSERT INTO `pa_city` VALUES ('88','晋城市','2','4');
INSERT INTO `pa_city` VALUES ('89','朔州市','2','4');
INSERT INTO `pa_city` VALUES ('90','晋中市','2','4');
INSERT INTO `pa_city` VALUES ('91','运城市','2','4');
INSERT INTO `pa_city` VALUES ('92','忻州市','2','4');
INSERT INTO `pa_city` VALUES ('93','临汾市','2','4');
INSERT INTO `pa_city` VALUES ('94','吕梁市','2','4');
INSERT INTO `pa_city` VALUES ('95','呼和浩特市','2','5');
INSERT INTO `pa_city` VALUES ('96','包头市','2','5');
INSERT INTO `pa_city` VALUES ('97','乌海市','2','5');
INSERT INTO `pa_city` VALUES ('98','赤峰市','2','5');
INSERT INTO `pa_city` VALUES ('99','通辽市','2','5');
INSERT INTO `pa_city` VALUES ('100','鄂尔多斯市','2','5');
INSERT INTO `pa_city` VALUES ('101','呼伦贝尔市','2','5');
INSERT INTO `pa_city` VALUES ('102','巴彦淖尔市','2','5');
INSERT INTO `pa_city` VALUES ('103','乌兰察布市','2','5');
INSERT INTO `pa_city` VALUES ('104','兴安盟','2','5');
INSERT INTO `pa_city` VALUES ('105','锡林郭勒盟','2','5');
INSERT INTO `pa_city` VALUES ('106','阿拉善盟','2','5');
INSERT INTO `pa_city` VALUES ('107','沈阳市','2','6');
INSERT INTO `pa_city` VALUES ('108','大连市','2','6');
INSERT INTO `pa_city` VALUES ('109','鞍山市','2','6');
INSERT INTO `pa_city` VALUES ('110','抚顺市','2','6');
INSERT INTO `pa_city` VALUES ('111','本溪市','2','6');
INSERT INTO `pa_city` VALUES ('112','丹东市','2','6');
INSERT INTO `pa_city` VALUES ('113','锦州市','2','6');
INSERT INTO `pa_city` VALUES ('114','营口市','2','6');
INSERT INTO `pa_city` VALUES ('115','阜新市','2','6');
INSERT INTO `pa_city` VALUES ('116','辽阳市','2','6');
INSERT INTO `pa_city` VALUES ('117','盘锦市','2','6');
INSERT INTO `pa_city` VALUES ('118','铁岭市','2','6');
INSERT INTO `pa_city` VALUES ('119','朝阳市','2','6');
INSERT INTO `pa_city` VALUES ('120','葫芦岛市','2','6');
INSERT INTO `pa_city` VALUES ('121','长春市','2','7');
INSERT INTO `pa_city` VALUES ('122','吉林市','2','7');
INSERT INTO `pa_city` VALUES ('123','四平市','2','7');
INSERT INTO `pa_city` VALUES ('124','辽源市','2','7');
INSERT INTO `pa_city` VALUES ('125','通化市','2','7');
INSERT INTO `pa_city` VALUES ('126','白山市','2','7');
INSERT INTO `pa_city` VALUES ('127','松原市','2','7');
INSERT INTO `pa_city` VALUES ('128','白城市','2','7');
INSERT INTO `pa_city` VALUES ('129','延边朝鲜族自治州','2','7');
INSERT INTO `pa_city` VALUES ('130','哈尔滨市','2','8');
INSERT INTO `pa_city` VALUES ('131','齐齐哈尔市','2','8');
INSERT INTO `pa_city` VALUES ('132','鸡西市','2','8');
INSERT INTO `pa_city` VALUES ('133','鹤岗市','2','8');
INSERT INTO `pa_city` VALUES ('134','双鸭山市','2','8');
INSERT INTO `pa_city` VALUES ('135','大庆市','2','8');
INSERT INTO `pa_city` VALUES ('136','伊春市','2','8');
INSERT INTO `pa_city` VALUES ('137','佳木斯市','2','8');
INSERT INTO `pa_city` VALUES ('138','七台河市','2','8');
INSERT INTO `pa_city` VALUES ('139','牡丹江市','2','8');
INSERT INTO `pa_city` VALUES ('140','黑河市','2','8');
INSERT INTO `pa_city` VALUES ('141','绥化市','2','8');
INSERT INTO `pa_city` VALUES ('142','大兴安岭地区','2','8');
INSERT INTO `pa_city` VALUES ('143','黄浦区','2','9');
INSERT INTO `pa_city` VALUES ('144','卢湾区','2','9');
INSERT INTO `pa_city` VALUES ('145','徐汇区','2','9');
INSERT INTO `pa_city` VALUES ('146','长宁区','2','9');
INSERT INTO `pa_city` VALUES ('147','静安区','2','9');
INSERT INTO `pa_city` VALUES ('148','普陀区','2','9');
INSERT INTO `pa_city` VALUES ('149','闸北区','2','9');
INSERT INTO `pa_city` VALUES ('150','虹口区','2','9');
INSERT INTO `pa_city` VALUES ('151','杨浦区','2','9');
INSERT INTO `pa_city` VALUES ('152','闵行区','2','9');
INSERT INTO `pa_city` VALUES ('153','宝山区','2','9');
INSERT INTO `pa_city` VALUES ('154','嘉定区','2','9');
INSERT INTO `pa_city` VALUES ('155','浦东新区','2','9');
INSERT INTO `pa_city` VALUES ('156','金山区','2','9');
INSERT INTO `pa_city` VALUES ('157','松江区','2','9');
INSERT INTO `pa_city` VALUES ('158','青浦区','2','9');
INSERT INTO `pa_city` VALUES ('159','南汇区','2','9');
INSERT INTO `pa_city` VALUES ('160','奉贤区','2','9');
INSERT INTO `pa_city` VALUES ('161','崇明县','2','9');
INSERT INTO `pa_city` VALUES ('162','南京市','2','10');
INSERT INTO `pa_city` VALUES ('163','无锡市','2','10');
INSERT INTO `pa_city` VALUES ('164','徐州市','2','10');
INSERT INTO `pa_city` VALUES ('165','常州市','2','10');
INSERT INTO `pa_city` VALUES ('166','苏州市','2','10');
INSERT INTO `pa_city` VALUES ('167','南通市','2','10');
INSERT INTO `pa_city` VALUES ('168','连云港市','2','10');
INSERT INTO `pa_city` VALUES ('169','淮安市','2','10');
INSERT INTO `pa_city` VALUES ('170','盐城市','2','10');
INSERT INTO `pa_city` VALUES ('171','扬州市','2','10');
INSERT INTO `pa_city` VALUES ('172','镇江市','2','10');
INSERT INTO `pa_city` VALUES ('173','泰州市','2','10');
INSERT INTO `pa_city` VALUES ('174','宿迁市','2','10');
INSERT INTO `pa_city` VALUES ('175','杭州市','2','11');
INSERT INTO `pa_city` VALUES ('176','宁波市','2','11');
INSERT INTO `pa_city` VALUES ('177','温州市','2','11');
INSERT INTO `pa_city` VALUES ('178','嘉兴市','2','11');
INSERT INTO `pa_city` VALUES ('179','湖州市','2','11');
INSERT INTO `pa_city` VALUES ('180','绍兴市','2','11');
INSERT INTO `pa_city` VALUES ('181','舟山市','2','11');
INSERT INTO `pa_city` VALUES ('182','衢州市','2','11');
INSERT INTO `pa_city` VALUES ('183','金华市','2','11');
INSERT INTO `pa_city` VALUES ('184','台州市','2','11');
INSERT INTO `pa_city` VALUES ('185','丽水市','2','11');
INSERT INTO `pa_city` VALUES ('186','合肥市','2','12');
INSERT INTO `pa_city` VALUES ('187','芜湖市','2','12');
INSERT INTO `pa_city` VALUES ('188','蚌埠市','2','12');
INSERT INTO `pa_city` VALUES ('189','淮南市','2','12');
INSERT INTO `pa_city` VALUES ('190','马鞍山市','2','12');
INSERT INTO `pa_city` VALUES ('191','淮北市','2','12');
INSERT INTO `pa_city` VALUES ('192','铜陵市','2','12');
INSERT INTO `pa_city` VALUES ('193','安庆市','2','12');
INSERT INTO `pa_city` VALUES ('194','黄山市','2','12');
INSERT INTO `pa_city` VALUES ('195','滁州市','2','12');
INSERT INTO `pa_city` VALUES ('196','阜阳市','2','12');
INSERT INTO `pa_city` VALUES ('197','宿州市','2','12');
INSERT INTO `pa_city` VALUES ('198','巢湖市','2','12');
INSERT INTO `pa_city` VALUES ('199','六安市','2','12');
INSERT INTO `pa_city` VALUES ('200','亳州市','2','12');
INSERT INTO `pa_city` VALUES ('201','池州市','2','12');
INSERT INTO `pa_city` VALUES ('202','宣城市','2','12');
INSERT INTO `pa_city` VALUES ('203','福州市','2','13');
INSERT INTO `pa_city` VALUES ('204','厦门市','2','13');
INSERT INTO `pa_city` VALUES ('205','莆田市','2','13');
INSERT INTO `pa_city` VALUES ('206','三明市','2','13');
INSERT INTO `pa_city` VALUES ('207','泉州市','2','13');
INSERT INTO `pa_city` VALUES ('208','漳州市','2','13');
INSERT INTO `pa_city` VALUES ('209','南平市','2','13');
INSERT INTO `pa_city` VALUES ('210','龙岩市','2','13');
INSERT INTO `pa_city` VALUES ('211','宁德市','2','13');
INSERT INTO `pa_city` VALUES ('212','南昌市','2','14');
INSERT INTO `pa_city` VALUES ('213','景德镇市','2','14');
INSERT INTO `pa_city` VALUES ('214','萍乡市','2','14');
INSERT INTO `pa_city` VALUES ('215','九江市','2','14');
INSERT INTO `pa_city` VALUES ('216','新余市','2','14');
INSERT INTO `pa_city` VALUES ('217','鹰潭市','2','14');
INSERT INTO `pa_city` VALUES ('218','赣州市','2','14');
INSERT INTO `pa_city` VALUES ('219','吉安市','2','14');
INSERT INTO `pa_city` VALUES ('220','宜春市','2','14');
INSERT INTO `pa_city` VALUES ('221','抚州市','2','14');
INSERT INTO `pa_city` VALUES ('222','上饶市','2','14');
INSERT INTO `pa_city` VALUES ('223','济南市','2','15');
INSERT INTO `pa_city` VALUES ('224','青岛市','2','15');
INSERT INTO `pa_city` VALUES ('225','淄博市','2','15');
INSERT INTO `pa_city` VALUES ('226','枣庄市','2','15');
INSERT INTO `pa_city` VALUES ('227','东营市','2','15');
INSERT INTO `pa_city` VALUES ('228','烟台市','2','15');
INSERT INTO `pa_city` VALUES ('229','潍坊市','2','15');
INSERT INTO `pa_city` VALUES ('230','济宁市','2','15');
INSERT INTO `pa_city` VALUES ('231','泰安市','2','15');
INSERT INTO `pa_city` VALUES ('232','威海市','2','15');
INSERT INTO `pa_city` VALUES ('233','日照市','2','15');
INSERT INTO `pa_city` VALUES ('234','莱芜市','2','15');
INSERT INTO `pa_city` VALUES ('235','临沂市','2','15');
INSERT INTO `pa_city` VALUES ('236','德州市','2','15');
INSERT INTO `pa_city` VALUES ('237','聊城市','2','15');
INSERT INTO `pa_city` VALUES ('238','滨州市','2','15');
INSERT INTO `pa_city` VALUES ('239','菏泽市','2','15');
INSERT INTO `pa_city` VALUES ('240','郑州市','2','16');
INSERT INTO `pa_city` VALUES ('241','开封市','2','16');
INSERT INTO `pa_city` VALUES ('242','洛阳市','2','16');
INSERT INTO `pa_city` VALUES ('243','平顶山市','2','16');
INSERT INTO `pa_city` VALUES ('244','安阳市','2','16');
INSERT INTO `pa_city` VALUES ('245','鹤壁市','2','16');
INSERT INTO `pa_city` VALUES ('246','新乡市','2','16');
INSERT INTO `pa_city` VALUES ('247','焦作市','2','16');
INSERT INTO `pa_city` VALUES ('248','濮阳市','2','16');
INSERT INTO `pa_city` VALUES ('249','许昌市','2','16');
INSERT INTO `pa_city` VALUES ('250','漯河市','2','16');
INSERT INTO `pa_city` VALUES ('251','三门峡市','2','16');
INSERT INTO `pa_city` VALUES ('252','南阳市','2','16');
INSERT INTO `pa_city` VALUES ('253','商丘市','2','16');
INSERT INTO `pa_city` VALUES ('254','信阳市','2','16');
INSERT INTO `pa_city` VALUES ('255','周口市','2','16');
INSERT INTO `pa_city` VALUES ('256','驻马店市','2','16');
INSERT INTO `pa_city` VALUES ('257','济源市','2','16');
INSERT INTO `pa_city` VALUES ('258','武汉市','2','17');
INSERT INTO `pa_city` VALUES ('259','黄石市','2','17');
INSERT INTO `pa_city` VALUES ('260','十堰市','2','17');
INSERT INTO `pa_city` VALUES ('261','宜昌市','2','17');
INSERT INTO `pa_city` VALUES ('262','襄樊市','2','17');
INSERT INTO `pa_city` VALUES ('263','鄂州市','2','17');
INSERT INTO `pa_city` VALUES ('264','荆门市','2','17');
INSERT INTO `pa_city` VALUES ('265','孝感市','2','17');
INSERT INTO `pa_city` VALUES ('266','荆州市','2','17');
INSERT INTO `pa_city` VALUES ('267','黄冈市','2','17');
INSERT INTO `pa_city` VALUES ('268','咸宁市','2','17');
INSERT INTO `pa_city` VALUES ('269','随州市','2','17');
INSERT INTO `pa_city` VALUES ('270','恩施土家族苗族自治州','2','17');
INSERT INTO `pa_city` VALUES ('271','仙桃市','2','17');
INSERT INTO `pa_city` VALUES ('272','潜江市','2','17');
INSERT INTO `pa_city` VALUES ('273','天门市','2','17');
INSERT INTO `pa_city` VALUES ('274','神农架林区','2','17');
INSERT INTO `pa_city` VALUES ('275','长沙市','2','18');
INSERT INTO `pa_city` VALUES ('276','株洲市','2','18');
INSERT INTO `pa_city` VALUES ('277','湘潭市','2','18');
INSERT INTO `pa_city` VALUES ('278','衡阳市','2','18');
INSERT INTO `pa_city` VALUES ('279','邵阳市','2','18');
INSERT INTO `pa_city` VALUES ('280','岳阳市','2','18');
INSERT INTO `pa_city` VALUES ('281','常德市','2','18');
INSERT INTO `pa_city` VALUES ('282','张家界市','2','18');
INSERT INTO `pa_city` VALUES ('283','益阳市','2','18');
INSERT INTO `pa_city` VALUES ('284','郴州市','2','18');
INSERT INTO `pa_city` VALUES ('285','永州市','2','18');
INSERT INTO `pa_city` VALUES ('286','怀化市','2','18');
INSERT INTO `pa_city` VALUES ('287','娄底市','2','18');
INSERT INTO `pa_city` VALUES ('288','湘西土家族苗族自治州','2','18');
INSERT INTO `pa_city` VALUES ('289','广州市','2','19');
INSERT INTO `pa_city` VALUES ('290','韶关市','2','19');
INSERT INTO `pa_city` VALUES ('291','深圳市','2','19');
INSERT INTO `pa_city` VALUES ('292','珠海市','2','19');
INSERT INTO `pa_city` VALUES ('293','汕头市','2','19');
INSERT INTO `pa_city` VALUES ('294','佛山市','2','19');
INSERT INTO `pa_city` VALUES ('295','江门市','2','19');
INSERT INTO `pa_city` VALUES ('296','湛江市','2','19');
INSERT INTO `pa_city` VALUES ('297','茂名市','2','19');
INSERT INTO `pa_city` VALUES ('298','肇庆市','2','19');
INSERT INTO `pa_city` VALUES ('299','惠州市','2','19');
INSERT INTO `pa_city` VALUES ('300','梅州市','2','19');
INSERT INTO `pa_city` VALUES ('301','汕尾市','2','19');
INSERT INTO `pa_city` VALUES ('302','河源市','2','19');
INSERT INTO `pa_city` VALUES ('303','阳江市','2','19');
INSERT INTO `pa_city` VALUES ('304','清远市','2','19');
INSERT INTO `pa_city` VALUES ('305','东莞市','2','19');
INSERT INTO `pa_city` VALUES ('306','中山市','2','19');
INSERT INTO `pa_city` VALUES ('307','潮州市','2','19');
INSERT INTO `pa_city` VALUES ('308','揭阳市','2','19');
INSERT INTO `pa_city` VALUES ('309','云浮市','2','19');
INSERT INTO `pa_city` VALUES ('310','南宁市','2','20');
INSERT INTO `pa_city` VALUES ('311','柳州市','2','20');
INSERT INTO `pa_city` VALUES ('312','桂林市','2','20');
INSERT INTO `pa_city` VALUES ('313','梧州市','2','20');
INSERT INTO `pa_city` VALUES ('314','北海市','2','20');
INSERT INTO `pa_city` VALUES ('315','防城港市','2','20');
INSERT INTO `pa_city` VALUES ('316','钦州市','2','20');
INSERT INTO `pa_city` VALUES ('317','贵港市','2','20');
INSERT INTO `pa_city` VALUES ('318','玉林市','2','20');
INSERT INTO `pa_city` VALUES ('319','百色市','2','20');
INSERT INTO `pa_city` VALUES ('320','贺州市','2','20');
INSERT INTO `pa_city` VALUES ('321','河池市','2','20');
INSERT INTO `pa_city` VALUES ('322','来宾市','2','20');
INSERT INTO `pa_city` VALUES ('323','崇左市','2','20');
INSERT INTO `pa_city` VALUES ('324','海口市','2','21');
INSERT INTO `pa_city` VALUES ('325','三亚市','2','21');
INSERT INTO `pa_city` VALUES ('326','五指山市','2','21');
INSERT INTO `pa_city` VALUES ('327','琼海市','2','21');
INSERT INTO `pa_city` VALUES ('328','儋州市','2','21');
INSERT INTO `pa_city` VALUES ('329','文昌市','2','21');
INSERT INTO `pa_city` VALUES ('330','万宁市','2','21');
INSERT INTO `pa_city` VALUES ('331','东方市','2','21');
INSERT INTO `pa_city` VALUES ('332','定安县','2','21');
INSERT INTO `pa_city` VALUES ('333','屯昌县','2','21');
INSERT INTO `pa_city` VALUES ('334','澄迈县','2','21');
INSERT INTO `pa_city` VALUES ('335','临高县','2','21');
INSERT INTO `pa_city` VALUES ('336','白沙黎族自治县','2','21');
INSERT INTO `pa_city` VALUES ('337','昌江黎族自治县','2','21');
INSERT INTO `pa_city` VALUES ('338','乐东黎族自治县','2','21');
INSERT INTO `pa_city` VALUES ('339','陵水黎族自治县','2','21');
INSERT INTO `pa_city` VALUES ('340','保亭黎族苗族自治县','2','21');
INSERT INTO `pa_city` VALUES ('341','琼中黎族苗族自治县','2','21');
INSERT INTO `pa_city` VALUES ('342','西沙群岛','2','21');
INSERT INTO `pa_city` VALUES ('343','南沙群岛','2','21');
INSERT INTO `pa_city` VALUES ('344','中沙群岛的岛礁及其海域','2','21');
INSERT INTO `pa_city` VALUES ('345','万州区','2','22');
INSERT INTO `pa_city` VALUES ('346','涪陵区','2','22');
INSERT INTO `pa_city` VALUES ('347','渝中区','2','22');
INSERT INTO `pa_city` VALUES ('348','大渡口区','2','22');
INSERT INTO `pa_city` VALUES ('349','江北区','2','22');
INSERT INTO `pa_city` VALUES ('350','沙坪坝区','2','22');
INSERT INTO `pa_city` VALUES ('351','九龙坡区','2','22');
INSERT INTO `pa_city` VALUES ('352','南岸区','2','22');
INSERT INTO `pa_city` VALUES ('353','北碚区','2','22');
INSERT INTO `pa_city` VALUES ('354','双桥区','2','22');
INSERT INTO `pa_city` VALUES ('355','万盛区','2','22');
INSERT INTO `pa_city` VALUES ('356','渝北区','2','22');
INSERT INTO `pa_city` VALUES ('357','巴南区','2','22');
INSERT INTO `pa_city` VALUES ('358','黔江区','2','22');
INSERT INTO `pa_city` VALUES ('359','长寿区','2','22');
INSERT INTO `pa_city` VALUES ('360','綦江县','2','22');
INSERT INTO `pa_city` VALUES ('361','潼南县','2','22');
INSERT INTO `pa_city` VALUES ('362','铜梁县','2','22');
INSERT INTO `pa_city` VALUES ('363','大足县','2','22');
INSERT INTO `pa_city` VALUES ('364','荣昌县','2','22');
INSERT INTO `pa_city` VALUES ('365','璧山县','2','22');
INSERT INTO `pa_city` VALUES ('366','梁平县','2','22');
INSERT INTO `pa_city` VALUES ('367','城口县','2','22');
INSERT INTO `pa_city` VALUES ('368','丰都县','2','22');
INSERT INTO `pa_city` VALUES ('369','垫江县','2','22');
INSERT INTO `pa_city` VALUES ('370','武隆县','2','22');
INSERT INTO `pa_city` VALUES ('371','忠县','2','22');
INSERT INTO `pa_city` VALUES ('372','开县','2','22');
INSERT INTO `pa_city` VALUES ('373','云阳县','2','22');
INSERT INTO `pa_city` VALUES ('374','奉节县','2','22');
INSERT INTO `pa_city` VALUES ('375','巫山县','2','22');
INSERT INTO `pa_city` VALUES ('376','巫溪县','2','22');
INSERT INTO `pa_city` VALUES ('377','石柱土家族自治县','2','22');
INSERT INTO `pa_city` VALUES ('378','秀山土家族苗族自治县','2','22');
INSERT INTO `pa_city` VALUES ('379','酉阳土家族苗族自治县','2','22');
INSERT INTO `pa_city` VALUES ('380','彭水苗族土家族自治县','2','22');
INSERT INTO `pa_city` VALUES ('381','江津市','2','22');
INSERT INTO `pa_city` VALUES ('382','合川市','2','22');
INSERT INTO `pa_city` VALUES ('383','永川市','2','22');
INSERT INTO `pa_city` VALUES ('384','南川市','2','22');
INSERT INTO `pa_city` VALUES ('385','成都市','2','23');
INSERT INTO `pa_city` VALUES ('386','自贡市','2','23');
INSERT INTO `pa_city` VALUES ('387','攀枝花市','2','23');
INSERT INTO `pa_city` VALUES ('388','泸州市','2','23');
INSERT INTO `pa_city` VALUES ('389','德阳市','2','23');
INSERT INTO `pa_city` VALUES ('390','绵阳市','2','23');
INSERT INTO `pa_city` VALUES ('391','广元市','2','23');
INSERT INTO `pa_city` VALUES ('392','遂宁市','2','23');
INSERT INTO `pa_city` VALUES ('393','内江市','2','23');
INSERT INTO `pa_city` VALUES ('394','乐山市','2','23');
INSERT INTO `pa_city` VALUES ('395','南充市','2','23');
INSERT INTO `pa_city` VALUES ('396','眉山市','2','23');
INSERT INTO `pa_city` VALUES ('397','宜宾市','2','23');
INSERT INTO `pa_city` VALUES ('398','广安市','2','23');
INSERT INTO `pa_city` VALUES ('399','达州市','2','23');
INSERT INTO `pa_city` VALUES ('400','雅安市','2','23');
INSERT INTO `pa_city` VALUES ('401','巴中市','2','23');
INSERT INTO `pa_city` VALUES ('402','资阳市','2','23');
INSERT INTO `pa_city` VALUES ('403','阿坝藏族羌族自治州','2','23');
INSERT INTO `pa_city` VALUES ('404','甘孜藏族自治州','2','23');
INSERT INTO `pa_city` VALUES ('405','凉山彝族自治州','2','23');
INSERT INTO `pa_city` VALUES ('406','贵阳市','2','24');
INSERT INTO `pa_city` VALUES ('407','六盘水市','2','24');
INSERT INTO `pa_city` VALUES ('408','遵义市','2','24');
INSERT INTO `pa_city` VALUES ('409','安顺市','2','24');
INSERT INTO `pa_city` VALUES ('410','铜仁地区','2','24');
INSERT INTO `pa_city` VALUES ('411','黔西南布依族苗族自治州','2','24');
INSERT INTO `pa_city` VALUES ('412','毕节地区','2','24');
INSERT INTO `pa_city` VALUES ('413','黔东南苗族侗族自治州','2','24');
INSERT INTO `pa_city` VALUES ('414','黔南布依族苗族自治州','2','24');
INSERT INTO `pa_city` VALUES ('415','昆明市','2','25');
INSERT INTO `pa_city` VALUES ('416','曲靖市','2','25');
INSERT INTO `pa_city` VALUES ('417','玉溪市','2','25');
INSERT INTO `pa_city` VALUES ('418','保山市','2','25');
INSERT INTO `pa_city` VALUES ('419','昭通市','2','25');
INSERT INTO `pa_city` VALUES ('420','丽江市','2','25');
INSERT INTO `pa_city` VALUES ('421','思茅市','2','25');
INSERT INTO `pa_city` VALUES ('422','临沧市','2','25');
INSERT INTO `pa_city` VALUES ('423','楚雄彝族自治州','2','25');
INSERT INTO `pa_city` VALUES ('424','红河哈尼族彝族自治州','2','25');
INSERT INTO `pa_city` VALUES ('425','文山壮族苗族自治州','2','25');
INSERT INTO `pa_city` VALUES ('426','西双版纳傣族自治州','2','25');
INSERT INTO `pa_city` VALUES ('427','大理白族自治州','2','25');
INSERT INTO `pa_city` VALUES ('428','德宏傣族景颇族自治州','2','25');
INSERT INTO `pa_city` VALUES ('429','怒江傈僳族自治州','2','25');
INSERT INTO `pa_city` VALUES ('430','迪庆藏族自治州','2','25');
INSERT INTO `pa_city` VALUES ('431','拉萨市','2','26');
INSERT INTO `pa_city` VALUES ('432','昌都地区','2','26');
INSERT INTO `pa_city` VALUES ('433','山南地区','2','26');
INSERT INTO `pa_city` VALUES ('434','日喀则地区','2','26');
INSERT INTO `pa_city` VALUES ('435','那曲地区','2','26');
INSERT INTO `pa_city` VALUES ('436','阿里地区','2','26');
INSERT INTO `pa_city` VALUES ('437','林芝地区','2','26');
INSERT INTO `pa_city` VALUES ('438','西安市','2','27');
INSERT INTO `pa_city` VALUES ('439','铜川市','2','27');
INSERT INTO `pa_city` VALUES ('440','宝鸡市','2','27');
INSERT INTO `pa_city` VALUES ('441','咸阳市','2','27');
INSERT INTO `pa_city` VALUES ('442','渭南市','2','27');
INSERT INTO `pa_city` VALUES ('443','延安市','2','27');
INSERT INTO `pa_city` VALUES ('444','汉中市','2','27');
INSERT INTO `pa_city` VALUES ('445','榆林市','2','27');
INSERT INTO `pa_city` VALUES ('446','安康市','2','27');
INSERT INTO `pa_city` VALUES ('447','商洛市','2','27');
INSERT INTO `pa_city` VALUES ('448','兰州市','2','28');
INSERT INTO `pa_city` VALUES ('449','嘉峪关市','2','28');
INSERT INTO `pa_city` VALUES ('450','金昌市','2','28');
INSERT INTO `pa_city` VALUES ('451','白银市','2','28');
INSERT INTO `pa_city` VALUES ('452','天水市','2','28');
INSERT INTO `pa_city` VALUES ('453','武威市','2','28');
INSERT INTO `pa_city` VALUES ('454','张掖市','2','28');
INSERT INTO `pa_city` VALUES ('455','平凉市','2','28');
INSERT INTO `pa_city` VALUES ('456','酒泉市','2','28');
INSERT INTO `pa_city` VALUES ('457','庆阳市','2','28');
INSERT INTO `pa_city` VALUES ('458','定西市','2','28');
INSERT INTO `pa_city` VALUES ('459','陇南市','2','28');
INSERT INTO `pa_city` VALUES ('460','临夏回族自治州','2','28');
INSERT INTO `pa_city` VALUES ('461','甘南藏族自治州','2','28');
INSERT INTO `pa_city` VALUES ('462','西宁市','2','29');
INSERT INTO `pa_city` VALUES ('463','海东地区','2','29');
INSERT INTO `pa_city` VALUES ('464','海北藏族自治州','2','29');
INSERT INTO `pa_city` VALUES ('465','黄南藏族自治州','2','29');
INSERT INTO `pa_city` VALUES ('466','海南藏族自治州','2','29');
INSERT INTO `pa_city` VALUES ('467','果洛藏族自治州','2','29');
INSERT INTO `pa_city` VALUES ('468','玉树藏族自治州','2','29');
INSERT INTO `pa_city` VALUES ('469','海西蒙古族藏族自治州','2','29');
INSERT INTO `pa_city` VALUES ('470','银川市','2','30');
INSERT INTO `pa_city` VALUES ('471','石嘴山市','2','30');
INSERT INTO `pa_city` VALUES ('472','吴忠市','2','30');
INSERT INTO `pa_city` VALUES ('473','固原市','2','30');
INSERT INTO `pa_city` VALUES ('474','中卫市','2','30');
INSERT INTO `pa_city` VALUES ('475','乌鲁木齐市','2','31');
INSERT INTO `pa_city` VALUES ('476','克拉玛依市','2','31');
INSERT INTO `pa_city` VALUES ('477','吐鲁番地区','2','31');
INSERT INTO `pa_city` VALUES ('478','哈密地区','2','31');
INSERT INTO `pa_city` VALUES ('479','昌吉回族自治州','2','31');
INSERT INTO `pa_city` VALUES ('480','博尔塔拉蒙古自治州','2','31');
INSERT INTO `pa_city` VALUES ('481','巴音郭楞蒙古自治州','2','31');
INSERT INTO `pa_city` VALUES ('482','阿克苏地区','2','31');
INSERT INTO `pa_city` VALUES ('483','克孜勒苏柯尔克孜自治州','2','31');
INSERT INTO `pa_city` VALUES ('484','喀什地区','2','31');
INSERT INTO `pa_city` VALUES ('485','和田地区','2','31');
INSERT INTO `pa_city` VALUES ('486','伊犁哈萨克自治州','2','31');
INSERT INTO `pa_city` VALUES ('487','塔城地区','2','31');
INSERT INTO `pa_city` VALUES ('488','阿勒泰地区','2','31');
INSERT INTO `pa_city` VALUES ('489','石河子市','2','31');
INSERT INTO `pa_city` VALUES ('490','阿拉尔市','2','31');
INSERT INTO `pa_city` VALUES ('491','图木舒克市','2','31');
INSERT INTO `pa_city` VALUES ('492','五家渠市','2','31');
INSERT INTO `pa_city` VALUES ('493','台北市','2','32');
INSERT INTO `pa_city` VALUES ('494','高雄市','2','32');
INSERT INTO `pa_city` VALUES ('495','基隆市','2','32');
INSERT INTO `pa_city` VALUES ('496','台中市','2','32');
INSERT INTO `pa_city` VALUES ('497','台南市','2','32');
INSERT INTO `pa_city` VALUES ('498','新竹市','2','32');
INSERT INTO `pa_city` VALUES ('499','嘉义市','2','32');
INSERT INTO `pa_city` VALUES ('500','台北县','2','32');
INSERT INTO `pa_city` VALUES ('501','宜兰县','2','32');
INSERT INTO `pa_city` VALUES ('502','桃园县','2','32');
INSERT INTO `pa_city` VALUES ('503','新竹县','2','32');
INSERT INTO `pa_city` VALUES ('504','苗栗县','2','32');
INSERT INTO `pa_city` VALUES ('505','台中县','2','32');
INSERT INTO `pa_city` VALUES ('506','彰化县','2','32');
INSERT INTO `pa_city` VALUES ('507','南投县','2','32');
INSERT INTO `pa_city` VALUES ('508','云林县','2','32');
INSERT INTO `pa_city` VALUES ('509','嘉义县','2','32');
INSERT INTO `pa_city` VALUES ('510','台南县','2','32');
INSERT INTO `pa_city` VALUES ('511','高雄县','2','32');
INSERT INTO `pa_city` VALUES ('512','屏东县','2','32');
INSERT INTO `pa_city` VALUES ('513','澎湖县','2','32');
INSERT INTO `pa_city` VALUES ('514','台东县','2','32');
INSERT INTO `pa_city` VALUES ('515','花莲县','2','32');
INSERT INTO `pa_city` VALUES ('516','中西区','2','33');
INSERT INTO `pa_city` VALUES ('517','东区','2','33');
INSERT INTO `pa_city` VALUES ('518','九龙城区','2','33');
INSERT INTO `pa_city` VALUES ('519','观塘区','2','33');
INSERT INTO `pa_city` VALUES ('520','南区','2','33');
INSERT INTO `pa_city` VALUES ('521','深水埗区','2','33');
INSERT INTO `pa_city` VALUES ('522','黄大仙区','2','33');
INSERT INTO `pa_city` VALUES ('523','湾仔区','2','33');
INSERT INTO `pa_city` VALUES ('524','油尖旺区','2','33');
INSERT INTO `pa_city` VALUES ('525','离岛区','2','33');
INSERT INTO `pa_city` VALUES ('526','葵青区','2','33');
INSERT INTO `pa_city` VALUES ('527','北区','2','33');
INSERT INTO `pa_city` VALUES ('528','西贡区','2','33');
INSERT INTO `pa_city` VALUES ('529','沙田区','2','33');
INSERT INTO `pa_city` VALUES ('530','屯门区','2','33');
INSERT INTO `pa_city` VALUES ('531','大埔区','2','33');
INSERT INTO `pa_city` VALUES ('532','荃湾区','2','33');
INSERT INTO `pa_city` VALUES ('533','元朗区','2','33');
INSERT INTO `pa_city` VALUES ('534','澳门特别行政区','2','34');
INSERT INTO `pa_city` VALUES ('535','美国','2','35');
INSERT INTO `pa_city` VALUES ('536','加拿大','2','35');
INSERT INTO `pa_city` VALUES ('537','澳大利亚','2','35');
INSERT INTO `pa_city` VALUES ('538','新西兰','2','35');
INSERT INTO `pa_city` VALUES ('539','英国','2','35');
INSERT INTO `pa_city` VALUES ('540','法国','2','35');
INSERT INTO `pa_city` VALUES ('541','德国','2','35');
INSERT INTO `pa_city` VALUES ('542','捷克','2','35');
INSERT INTO `pa_city` VALUES ('543','荷兰','2','35');
INSERT INTO `pa_city` VALUES ('544','瑞士','2','35');
INSERT INTO `pa_city` VALUES ('545','希腊','2','35');
INSERT INTO `pa_city` VALUES ('546','挪威','2','35');
INSERT INTO `pa_city` VALUES ('547','瑞典','2','35');
INSERT INTO `pa_city` VALUES ('548','丹麦','2','35');
INSERT INTO `pa_city` VALUES ('549','芬兰','2','35');
INSERT INTO `pa_city` VALUES ('550','爱尔兰','2','35');
INSERT INTO `pa_city` VALUES ('551','奥地利','2','35');
INSERT INTO `pa_city` VALUES ('552','意大利','2','35');
INSERT INTO `pa_city` VALUES ('553','乌克兰','2','35');
INSERT INTO `pa_city` VALUES ('554','俄罗斯','2','35');
INSERT INTO `pa_city` VALUES ('555','西班牙','2','35');
INSERT INTO `pa_city` VALUES ('556','韩国','2','35');
INSERT INTO `pa_city` VALUES ('557','新加坡','2','35');
INSERT INTO `pa_city` VALUES ('558','马来西亚','2','35');
INSERT INTO `pa_city` VALUES ('559','印度','2','35');
INSERT INTO `pa_city` VALUES ('560','泰国','2','35');
INSERT INTO `pa_city` VALUES ('561','日本','2','35');
INSERT INTO `pa_city` VALUES ('562','巴西','2','35');
INSERT INTO `pa_city` VALUES ('563','阿根廷','2','35');
INSERT INTO `pa_city` VALUES ('564','南非','2','35');
INSERT INTO `pa_city` VALUES ('565','埃及','2','35');
INSERT INTO `pa_city` VALUES ('566','其他','2','36');


# 数据库表：pa_collection 数据信息
INSERT INTO `pa_collection` VALUES ('3','38','zxcj','25','product#id','0','/Uploads/institution/2017-11-23/5a16484ddc34b.jpg','gift');
INSERT INTO `pa_collection` VALUES ('4','39','阿萨德骑你','25','product#id','0','/Uploads/institution/2017-11-23/5a16484ddc34b.jpg','book');
INSERT INTO `pa_collection` VALUES ('15','1','浙江传媒学院','2','school#school_id','1514431418','','');
INSERT INTO `pa_collection` VALUES ('16','1','浙江传媒学院','2','school#school_id','1514431419','','');
INSERT INTO `pa_collection` VALUES ('7','32','dqwd','34','product#id','1521411111','/Uploads/Article/2017-11-23/1511407906_956133001.jpg','video');
INSERT INTO `pa_collection` VALUES ('14','1','浙江传媒学院','2','school#school_id','1514431104','','');
INSERT INTO `pa_collection` VALUES ('8','32','dasd','34','product#id','1522111111','/Uploads/institution/2017-11-23/5a16484ddc34b.jpg','video');
INSERT INTO `pa_collection` VALUES ('12','17','','24','schooltopic#sid','1513832665','','schooltopic');
INSERT INTO `pa_collection` VALUES ('13','16','','24','schooltopic#sid','1513836727','','schooltopic');
INSERT INTO `pa_collection` VALUES ('17','1','浙江传媒学院','73','school#school_id','1514443752','','');


# 数据库表：pa_column 数据信息
INSERT INTO `pa_column` VALUES ('1','综合课程','','精品课程合集','0.01','所有人','1536541212','24','100.00');


# 数据库表：pa_comment 数据信息
INSERT INTO `pa_comment` VALUES ('1','这是我的评论','1','张家奇','/Public/Img/default/default.jpg','institution','1','','1511841345','','0');
INSERT INTO `pa_comment` VALUES ('2','这是论坛评论','1','胡文亮','/Public/Img/default/default.jpg','forum','1','','1511841345','','0');
INSERT INTO `pa_comment` VALUES ('3','回复论坛评论','1','胡文亮','/Public/Img/default/default.jpg','forum','1','1','1511841345','2','0');
INSERT INTO `pa_comment` VALUES ('4','这是我的评论','24','aca','/Public/Img/default/default.jpg','product','38','','1511841345','','0');
INSERT INTO `pa_comment` VALUES ('5','好好','1','奥术大师多','/Public/Img/default/default.jpg','product','38','1','1511841345','','5');
INSERT INTO `pa_comment` VALUES ('6','sdgdfxgxg','24','asfasfa','/Public/Img/default/default.jpg','product','40','2','1511841345','','3');
INSERT INTO `pa_comment` VALUES ('7','这个帖子很棒','24','小二郎儿','/Public/Img/default/default.jpg','forum','4','','1511922241','','0');
INSERT INTO `pa_comment` VALUES ('8','这个帖子很棒','24','小二郎儿','/Public/Img/default/default.jpg','product','41','','1511922276','','4');
INSERT INTO `pa_comment` VALUES ('10','这个帖子很棒','24','小二郎儿','/Public/Img/default/default.jpg','forum','3','','1511922276','','2');
INSERT INTO `pa_comment` VALUES ('11','这是我的评论','24','小二郎儿','/Public/Img/default/default.jpg','forum','4','','1511922276','','3');
INSERT INTO `pa_comment` VALUES ('12','ssssssaaaaaazzzzzzz','24','','/Public/Img/default/default.jpg','product','38','','1511922276','','5');
INSERT INTO `pa_comment` VALUES ('13','市场价奥错军奥奥奥奥奥奥奥奥奥奥奥奥奥奥','25','','','product','38','','1511922241','','0');
INSERT INTO `pa_comment` VALUES ('14','54444444444','34','','','forum','78','','1511922276','','0');
INSERT INTO `pa_comment` VALUES ('15','评论评论','34','','','forum','78','','1511922276','','2');
INSERT INTO `pa_comment` VALUES ('16','weok this is commount','24','','','forum','78','','1511841345','','3');
INSERT INTO `pa_comment` VALUES ('17','一','24','','','myrecord','7','','1511841345','','0');
INSERT INTO `pa_comment` VALUES ('18','二','24','','','myrecord','7','','1511841345','','0');
INSERT INTO `pa_comment` VALUES ('19','三','24','','','myrecord','7','','1511841345','','0');
INSERT INTO `pa_comment` VALUES ('20','四','24','','','myrecord','8','','1511841345','','0');
INSERT INTO `pa_comment` VALUES ('21','五','24','','','myrecord','8','','1511841345','','0');
INSERT INTO `pa_comment` VALUES ('22','六','24','','','myrecord','8','','1511841345','','0');
INSERT INTO `pa_comment` VALUES ('23','⑦','24','','','myrecord','8','','1511841345','','0');
INSERT INTO `pa_comment` VALUES ('24','⑧','24','','','record','9','','1511841345','','0');
INSERT INTO `pa_comment` VALUES ('25','⑨','24','','','record','9','','1511841345','','0');
INSERT INTO `pa_comment` VALUES ('26','⑩','24','','','record','9','','1511841345','','0');
INSERT INTO `pa_comment` VALUES ('27','评论','24','','','livevideo','1','','1511841345','','2');
INSERT INTO `pa_comment` VALUES ('28','asdfgasdgsdfg','24','','','myrecord','14','','1513683841','','0');
INSERT INTO `pa_comment` VALUES ('29','haohao','25','','','myrecord','14','','1513683841','','0');
INSERT INTO `pa_comment` VALUES ('30','vvv','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513836346','','0');
INSERT INTO `pa_comment` VALUES ('31','vvv','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513836347','','0');
INSERT INTO `pa_comment` VALUES ('32','vvv','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513836348','','0');
INSERT INTO `pa_comment` VALUES ('33','vvv','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513836349','','0');
INSERT INTO `pa_comment` VALUES ('34','cxvv','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513836533','','0');
INSERT INTO `pa_comment` VALUES ('35','088','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513836574','','0');
INSERT INTO `pa_comment` VALUES ('36','088','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513836575','','0');
INSERT INTO `pa_comment` VALUES ('37','088','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513836576','','0');
INSERT INTO `pa_comment` VALUES ('38','123','2','艺虫','/Public/Img/default/default.jpg','article','72','','1513836602','','0');
INSERT INTO `pa_comment` VALUES ('39','123','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513836603','','0');
INSERT INTO `pa_comment` VALUES ('40','123','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513836605','','0');
INSERT INTO `pa_comment` VALUES ('41','123','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513836606','','0');
INSERT INTO `pa_comment` VALUES ('42','123','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513836606','','0');
INSERT INTO `pa_comment` VALUES ('43','111111','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513836870','','0');
INSERT INTO `pa_comment` VALUES ('44','fdb','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513838503','','0');
INSERT INTO `pa_comment` VALUES ('45','1233698745','2','艺虫','/Public/Img/default/default.jpg','forum','78','','1513838525','','0');
INSERT INTO `pa_comment` VALUES ('46','cxx','2','艺虫','/Public/Img/default/default.jpg','forum','76','','1513838780','','0');
INSERT INTO `pa_comment` VALUES ('47','dsgg','2','艺虫','/Public/Img/default/default.jpg','forum','77','','1513838796','','0');
INSERT INTO `pa_comment` VALUES ('48','走开走开','51','艺虫','/Public/Img/default/default.jpg','forum','76','','1514951575','','0');
INSERT INTO `pa_comment` VALUES ('49','好好好','51','艺虫','/Public/Img/default/default.jpg','forum','76','','1514964190','','0');


# 数据库表：pa_field 数据信息
INSERT INTO `pa_field` VALUES ('4','2','id','表主键','INT','','','0','1','1','1','0','','','both','0','','','1510624122','1510624122');
INSERT INTO `pa_field` VALUES ('5','2','created_at','创建时间','INT','','','0','0','1','1','0','','time','insert','0','','','1510624122','1510624122');
INSERT INTO `pa_field` VALUES ('6','2','updated_at','更新时间','INT','','','0','0','1','1','0','','time','both','0','','','1510624122','1510624122');
INSERT INTO `pa_field` VALUES ('7','2','user_name','会员账户','VARCHAR','30','','0','0','0','0','0','','','both','0','','','1510624482','1510628100');
INSERT INTO `pa_field` VALUES ('8','2','user_age','会员年龄','VARCHAR','30','18','0','0','0','0','1','','','both','0','','','1510624790','1510624804');
INSERT INTO `pa_field` VALUES ('9','2','user_sex','会员性别','TINYINT','3','0','0','0','0','0','1','','','both','0','','','1510624955','1510624955');
INSERT INTO `pa_field` VALUES ('10','2','user_img','会员头像','VARCHAR','100','','0','0','0','0','1','','','both','0','','','1510625345','1510625345');
INSERT INTO `pa_field` VALUES ('11','2','user_area','会员所在地区','VARCHAR','60','','0','0','0','0','1','','','both','0','','','1510625554','1510625566');
INSERT INTO `pa_field` VALUES ('12','2','user_academic','会员学位','VARCHAR','20','','0','0','0','0','1','','','both','0','','','1510626074','1510626074');
INSERT INTO `pa_field` VALUES ('13','2','user_school','会员目标学院','VARCHAR','30','','0','0','0','0','1','','','both','0','','','1510626182','1510626182');
INSERT INTO `pa_field` VALUES ('14','2','user_artdirection','会员艺考方向','VARCHAR','30','','0','0','0','0','1','','','both','0','','','1510626426','1510626426');
INSERT INTO `pa_field` VALUES ('15','2','user_achievement','会员文化成绩','VARCHAR','20','','0','0','0','0','1','','','both','0','','','1510626579','1510626579');
INSERT INTO `pa_field` VALUES ('16','2','user_experience','会员经历','TINYINT','5','0','0','0','0','0','1','','','both','0','','','1510626802','1510626802');
INSERT INTO `pa_field` VALUES ('17','2','user_attendschool','会员就读学校','VARCHAR','50','','0','0','0','0','1','','','both','0','','','1510626930','1510626930');
INSERT INTO `pa_field` VALUES ('18','2','user_jine','用户金额','FLOAT','20,2','0.00','0','0','0','0','0','','','both','0','','','1510627848','1510627848');
INSERT INTO `pa_field` VALUES ('19','2','user_password','会员密码','VARCHAR','50','','0','0','0','0','0','','','both','0','','','1510627933','1510627933');
INSERT INTO `pa_field` VALUES ('20','2','user_nickname','会员昵称','VARCHAR','30','','0','0','0','0','1','','','both','0','','','1510628028','1510628028');
INSERT INTO `pa_field` VALUES ('101','15','id','表主键','INT','','','0','1','1','1','1','','','both','0','','','1513252345','1513252345');
INSERT INTO `pa_field` VALUES ('102','15','created_at','创建时间','INT','','','0','0','1','1','1','','time','insert','0','','','1513252345','1513252345');
INSERT INTO `pa_field` VALUES ('103','15','updated_at','更新时间','INT','','','0','0','1','1','1','','time','both','0','','','1513252345','1513252345');
INSERT INTO `pa_field` VALUES ('107','17','id','表主键','INT','','','0','1','1','1','1','','','both','0','','','1519527147','1519527147');
INSERT INTO `pa_field` VALUES ('108','17','created_at','创建时间','INT','','','0','0','1','1','1','','time','insert','0','','','1519527147','1519527147');
INSERT INTO `pa_field` VALUES ('109','17','updated_at','更新时间','INT','','','0','0','1','1','1','','time','both','0','','','1519527147','1519527147');
INSERT INTO `pa_field` VALUES ('110','18','id','表主键','INT','','','0','1','1','1','1','','','both','0','','','1519630823','1519630823');
INSERT INTO `pa_field` VALUES ('111','18','created_at','创建时间','INT','','','0','0','1','1','1','','time','insert','0','','','1519630823','1519630823');
INSERT INTO `pa_field` VALUES ('112','18','updated_at','更新时间','INT','','','0','0','1','1','1','','time','both','0','','','1519630823','1519630823');


# 数据库表：pa_follow 数据信息
INSERT INTO `pa_follow` VALUES ('91','24','25','1517397381','0','');
INSERT INTO `pa_follow` VALUES ('64','51','34','1513856864','0','personal');
INSERT INTO `pa_follow` VALUES ('69','2','34','1514009364','0','personal');
INSERT INTO `pa_follow` VALUES ('36','25','1','1512527061','0','institution');
INSERT INTO `pa_follow` VALUES ('51','24','40','1516845516','1','personal');
INSERT INTO `pa_follow` VALUES ('74','2','34','1514371092','0','personal');
INSERT INTO `pa_follow` VALUES ('60','24','34','1513579086','0','institution');
INSERT INTO `pa_follow` VALUES ('78','56','24','1514526452','0','personal');
INSERT INTO `pa_follow` VALUES ('86','24','1','1516415422','1','');
INSERT INTO `pa_follow` VALUES ('89','45','41','1516789465','0','');
INSERT INTO `pa_follow` VALUES ('90','24','41','1517316878','0','');


# 数据库表：pa_gift 数据信息
INSERT INTO `pa_gift` VALUES ('1','24','25','/Uploads/image/product/20171211/20171211035918_78422.png','大炮','45','2','50.00','','1','0.30');
INSERT INTO `pa_gift` VALUES ('2','25','26','/Uploads/image/product/20171211/20171211035729_23699.png','亲','52','1','8.00','','1','0.00');
INSERT INTO `pa_gift` VALUES ('3','34','34','/Uploads/image/product/20171211/20171211035607_30393.png','猴','55','1','12.00','','1','0.00');
INSERT INTO `pa_gift` VALUES ('4','24','35','/Uploads/image/product/20171211/20171211035404_86799.png','大翅膀','57','2','20.00','1512977237','1','0.00');
INSERT INTO `pa_gift` VALUES ('5','24','36','/Uploads/image/product/20171211/20171211035404_86799.png','大翅膀','57','2','20.00','1512977286','1','0.00');
INSERT INTO `pa_gift` VALUES ('24','24','38','/Uploads/image/product/20171211/20171211035858_68889.png','飞机','47','1','30.00','1514856130','0','0.20');
INSERT INTO `pa_gift` VALUES ('25','24','39','/Uploads/image/product/20171211/20171211035729_23699.png','亲','52','1','8.00','1514856906','0','0.20');
INSERT INTO `pa_gift` VALUES ('26','24','40','/Uploads/image/product/20171211/20171211035759_53838.png','钻石','51','1','15.00','1514856934','0','0.20');
INSERT INTO `pa_gift` VALUES ('27','24','24','/Uploads/image/product/20171211/20171211035607_30393.png','猴','55','1','12.00','1514950809','0','0.20');


# 数据库表：pa_help 数据信息
INSERT INTO `pa_help` VALUES ('1','dasca','12dcxac','11','1532114561','caqq','1');
INSERT INTO `pa_help` VALUES ('2','dsgdf','sdgdf','11','1532114561','sdgfdf','1');
INSERT INTO `pa_help` VALUES ('3','sdfsdfsd','sfdfsdf','11','1532114561','rfwer','1');
INSERT INTO `pa_help` VALUES ('4','asfd','ascf','11','1532114561','asdfa','1');
INSERT INTO `pa_help` VALUES ('5','Qwe','','26','1511831286','请输入您的反馈意见或建议!qweqwe','0');
INSERT INTO `pa_help` VALUES ('6','aaaaa','','25','1511921294',' sssssss','0');
INSERT INTO `pa_help` VALUES ('7','s','','25','1511921435','请输入您的反馈意见
    ','0');
INSERT INTO `pa_help` VALUES ('8','a','','25','1511921460','
    ','0');
INSERT INTO `pa_help` VALUES ('9','sss','','25','1511921483','
    ','0');
INSERT INTO `pa_help` VALUES ('10','ss','','25','1511921865','
    ','0');
INSERT INTO `pa_help` VALUES ('11','sss','','25','1511921939','
    ','0');
INSERT INTO `pa_help` VALUES ('12','s','','25','1511922029','
    ','0');
INSERT INTO `pa_help` VALUES ('13','ss','','25','1511922064','
    ','0');
INSERT INTO `pa_help` VALUES ('14','s','','25','1511922079','
    ','0');
INSERT INTO `pa_help` VALUES ('15','ss','','25','1511922093','
    ','0');
INSERT INTO `pa_help` VALUES ('17','s','','25','1511922893','true','0');
INSERT INTO `pa_help` VALUES ('18','s','','25','1511922923','true','0');
INSERT INTO `pa_help` VALUES ('19','sss','','25','1511922955','true','0');
INSERT INTO `pa_help` VALUES ('20','ss','','25','1511923003','false','0');
INSERT INTO `pa_help` VALUES ('21','fdd','','2','1514981072','fdd','0');
INSERT INTO `pa_help` VALUES ('22','一二三四五','','24','1516699233','五四三二一','0');
INSERT INTO `pa_help` VALUES ('23','一二三四五','','24','1516699296','五四三二一','0');
INSERT INTO `pa_help` VALUES ('24','一二三四五','','24','1516699302','五四三二一','0');
INSERT INTO `pa_help` VALUES ('25','到休息','','45','1516847952','中新小区','0');
INSERT INTO `pa_help` VALUES ('26','ass','','45','1516848582','啊啊啊','0');
INSERT INTO `pa_help` VALUES ('27','刚刚','','45','1516848640','徐填充图册头发','0');
INSERT INTO `pa_help` VALUES ('28','任v棒棒糖','','45','1516848883','！哥儿','0');


# 数据库表：pa_images 数据信息
INSERT INTO `pa_images` VALUES ('40','news','20140310073926_27245.jpg','/newconist/Uploads/image/product/20140310/20140310073926_27245.jpg','1394437811');
INSERT INTO `pa_images` VALUES ('39','product','20140310074050_66596.jpg','/newconist/Uploads/image/product/20140310/20140310074050_66596.jpg','1394437252');
INSERT INTO `pa_images` VALUES ('34','product','20140228021215_98055.jpg','/newconist/Uploads/image/news/20140228/20140228021215_98055.jpg','1394176319');
INSERT INTO `pa_images` VALUES ('75','product','20171129085517_47902.jpg','/Uploads/image/product/20171129/20171129085517_47902.jpg','1511945719');
INSERT INTO `pa_images` VALUES ('33','news','20140228021215_98055.jpg','/newconist/Uploads/image/news/20140228/20140228021215_98055.jpg','1394159259');
INSERT INTO `pa_images` VALUES ('76','product','20171129085558_25218.jpg','/Uploads/image/product/20171129/20171129085558_25218.jpg','1511945759');
INSERT INTO `pa_images` VALUES ('105','product','20140310074050_66596.jpg','/newconist/Uploads/image/product/20140310/20140310074050_66596.jpg','1513309425');
INSERT INTO `pa_images` VALUES ('106','product','20140310074033_57603.jpg','/newconist/Uploads/image/product/20140310/20140310074033_57603.jpg','1513309425');
INSERT INTO `pa_images` VALUES ('107','product','20140310073926_27245.jpg','/newconist/Uploads/image/product/20140310/20140310073926_27245.jpg','1513309425');
INSERT INTO `pa_images` VALUES ('52','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317960');
INSERT INTO `pa_images` VALUES ('53','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317963');
INSERT INTO `pa_images` VALUES ('54','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317965');
INSERT INTO `pa_images` VALUES ('55','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317965');
INSERT INTO `pa_images` VALUES ('56','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317965');
INSERT INTO `pa_images` VALUES ('57','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317966');
INSERT INTO `pa_images` VALUES ('58','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317966');
INSERT INTO `pa_images` VALUES ('59','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317968');
INSERT INTO `pa_images` VALUES ('60','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317969');
INSERT INTO `pa_images` VALUES ('61','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317969');
INSERT INTO `pa_images` VALUES ('62','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317969');
INSERT INTO `pa_images` VALUES ('63','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317970');
INSERT INTO `pa_images` VALUES ('64','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317970');
INSERT INTO `pa_images` VALUES ('65','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317970');
INSERT INTO `pa_images` VALUES ('66','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317971');
INSERT INTO `pa_images` VALUES ('67','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317971');
INSERT INTO `pa_images` VALUES ('68','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317971');
INSERT INTO `pa_images` VALUES ('69','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317971');
INSERT INTO `pa_images` VALUES ('70','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511317971');
INSERT INTO `pa_images` VALUES ('71','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511318010');
INSERT INTO `pa_images` VALUES ('72','product','20171122023232_43365.jpg','/Uploads/image/product/20171122/20171122023232_43365.jpg','1511318010');
INSERT INTO `pa_images` VALUES ('108','product','20171122024348_34903.jpg','/Uploads/image/product/20171122/20171122024348_34903.jpg','1513310612');
INSERT INTO `pa_images` VALUES ('77','news','20171202064340_49992.png','/Uploads/image/news/20171202/20171202064340_49992.png','1512197024');
INSERT INTO `pa_images` VALUES ('101','product','20171211035918_78422.png','/Uploads/image/product/20171211/20171211035918_78422.png','1512964766');
INSERT INTO `pa_images` VALUES ('79','product','20171209114529_43327.jpg','/Uploads/image/product/20171209/20171209114529_43327.jpg','1512819938');
INSERT INTO `pa_images` VALUES ('100','product','20171211035858_68889.png','/Uploads/image/product/20171211/20171211035858_68889.png','1512964745');
INSERT INTO `pa_images` VALUES ('81','product','20171209114529_43327.jpg','/Uploads/image/product/20171209/20171209114529_43327.jpg','1512819957');
INSERT INTO `pa_images` VALUES ('82','product','20171209115035_63959.jpg','/Uploads/image/product/20171209/20171209115035_63959.jpg','1512820237');
INSERT INTO `pa_images` VALUES ('99','product','20171211035833_94166.png','/Uploads/image/product/20171211/20171211035833_94166.png','1512964722');
INSERT INTO `pa_images` VALUES ('97','product','20171211035759_53838.png','/Uploads/image/product/20171211/20171211035759_53838.png','1512964690');
INSERT INTO `pa_images` VALUES ('96','product','20171211035729_23699.png','/Uploads/image/product/20171211/20171211035729_23699.png','1512964665');
INSERT INTO `pa_images` VALUES ('95','product','20171211035705_89565.png','/Uploads/image/product/20171211/20171211035705_89565.png','1512964636');
INSERT INTO `pa_images` VALUES ('94','product','20171211035641_50240.png','/Uploads/image/product/20171211/20171211035641_50240.png','1512964611');
INSERT INTO `pa_images` VALUES ('93','product','20171211035607_30393.png','/Uploads/image/product/20171211/20171211035607_30393.png','1512964585');
INSERT INTO `pa_images` VALUES ('92','product','20171211035516_45908.png','/Uploads/image/product/20171211/20171211035516_45908.png','1512964544');
INSERT INTO `pa_images` VALUES ('91','product','20171211035404_86799.png','/Uploads/image/product/20171211/20171211035404_86799.png','1512964456');
INSERT INTO `pa_images` VALUES ('109','product','20171215041047_39402.jpg','/Uploads/image/product/20171215/20171215041047_39402.jpg','1513311127');
INSERT INTO `pa_images` VALUES ('110','product','20171215041100_57474.jpg','/Uploads/image/product/20171215/20171215041100_57474.jpg','1513311127');


# 数据库表：pa_input 数据信息
INSERT INTO `pa_input` VALUES ('1','7','1','会员账户','账户不能为空','text','20','0','','','all','<input type='text' class='input' size='20' name='personal[user_name]' value='' />','1','1510624482','1510628100');
INSERT INTO `pa_input` VALUES ('2','8','1','会员年龄','请填写会员年龄','text','20','0','','','all','<input type='text' class='input' size='20' name='personal[user_age]' value='' />','2','1510624791','1510624804');
INSERT INTO `pa_input` VALUES ('3','9','1','会员性别','会员性别不能为空','radio','0','0','','','all','男<input type="radio" name="user_sex" value="0">
女<input type="radio" name="user_sex" value="1">
未知<input type="radio" name="user_sex" value="2">','3','1510624955','1510624955');
INSERT INTO `pa_input` VALUES ('4','10','1','会员头像','选择会员头像','file','2','0','','','all','<input type="file" name="user_img">','4','1510625345','1510625345');
INSERT INTO `pa_input` VALUES ('5','11','1','会员所在地区','地区不能为空','text','20','0','','','all','<input type='text' class='input' size='20' name='personal[user_area]' value='' />','5','1510625554','1510625566');
INSERT INTO `pa_input` VALUES ('6','12','1','会员学位','会员学位不能为空','select','0','0','','','all','<select name="user_academic">
    <option value="1">小学</option>
    <option value="2">中学</option>
    <option value="3">大学</option>
    <option value="4">硕士</option>
    <option value="5">博士</option>
</select>','6','1510626074','1510626074');
INSERT INTO `pa_input` VALUES ('7','13','1','会员目标学院','目标学院不能为空','text','20','0','','','all','<input type='text' class='input' size='20' name='personal[user_school]' value='' />','7','1510626182','1510626182');
INSERT INTO `pa_input` VALUES ('8','14','1','会员艺考方向','艺考方向不能为空','text','20','0','','','all','<input type='text' class='input' size='20' name='personal[user_artdirection]' value='' />','8','1510626426','1510626426');
INSERT INTO `pa_input` VALUES ('9','15','1','会员文化成绩','请填写文化成绩','text','20','0','','','all','<input type='text' class='input' size='20' name='personal[user_achievement]' value='' />','9','1510626579','1510626579');
INSERT INTO `pa_input` VALUES ('10','16','1','会员经历','请选择会员经历','select','0','0','','','all','<select name="user_experience">
     <option value="0">未参加</option>
     <option value="1">已参加</option>
</select>','10','1510626802','1510626802');
INSERT INTO `pa_input` VALUES ('11','17','1','会员就读学校','请填写就读学校','text','20','0','','','all','<input type='text' class='input' size='20' name='personal[user_attendschool]' value='' />','11','1510626930','1510626930');
INSERT INTO `pa_input` VALUES ('12','18','1','用户金额','请填写字段金额','text','20','0','','','all','<input type='text' class='input' size='20' name='personal[user_jine]' value='' />','12','1510627848','1510627848');
INSERT INTO `pa_input` VALUES ('13','19','1','会员密码','请填写密码','text','20','0','','','all','<input type='text' class='input' size='20' name='personal[user_password]' value='' />','13','1510627933','1510627933');
INSERT INTO `pa_input` VALUES ('14','20','1','会员昵称','会员昵称不能为空','text','20','0','','','all','<input type='text' class='input' size='20' name='personal[user_nickname]' value='' />','1','1510628028','1510628028');


# 数据库表：pa_link 数据信息


# 数据库表：pa_live 数据信息
INSERT INTO `pa_live` VALUES ('1','9603240','40','这是课程','1512802326','','0','1514872874','1515147840','live','0.00','0','0','0.00');
INSERT INTO `pa_live` VALUES ('2','946352','2','123','1513577862','','1','1515056091','0','live','0.00','0','0','0.00');
INSERT INTO `pa_live` VALUES ('3','5568850','1','初心不改的直播','1513601921','哈哈','0','1517022456','1517035186','','2.00','0','0','12.00');
INSERT INTO `pa_live` VALUES ('4','1542024','24','木木的直播','1513649936','','0','1517396697','1517403165','live','0.00','1517396697','0','941.60');
INSERT INTO `pa_live` VALUES ('5','523034','34','小鱼儿的直播','1513666362','测试','0','1513760836','1517403173','','0.00','1513760836','0','0.00');
INSERT INTO `pa_live` VALUES ('6','9041151','25','哈撒ki1的直播','1513737396','全部','1','1517469183','0','live','0.00','0','0','1450.00');
INSERT INTO `pa_live` VALUES ('8','6295754','26','艺虫的直播','1514180930','播音','0','1514181011','0','','0.00','0','0','0.00');
INSERT INTO `pa_live` VALUES ('9','7461564','38','艺虫的直播','1514274162','ss','0','1514898962','0','live','0.00','0','0','0.00');
INSERT INTO `pa_live` VALUES ('10','7422170','39','艺虫的直播','1514347513','全部','0','1514899242','0','live','0.00','0','0','0.00');
INSERT INTO `pa_live` VALUES ('11','4259673','41','小蝌蚪1的直播','1514435332','播音','1','1517388595','0','live','50.00','0','0','580.80');
INSERT INTO `pa_live` VALUES ('12','2725256','42','小蝌蚪2的直播','1514512761','美术','0','1517452438','1517453492','live','0.00','-1260064260','0','0.00');
INSERT INTO `pa_live` VALUES ('13','9125069','43','艺虫的直播','1514537478','摄影','0','1514873797','0','live','0.00','0','0','0.00');
INSERT INTO `pa_live` VALUES ('14','4407365','44','小鱼儿的直播','1514538517','bad','0','1514538517','0','live','0.00','0','0','0.00');
INSERT INTO `pa_live` VALUES ('17','0','45','','1514538517','','0','1514538517','0','live','0.00','0','0','0.00');


# 数据库表：pa_livepay 数据信息


# 数据库表：pa_liveset 数据信息
INSERT INTO `pa_liveset` VALUES ('0.20','1','100.00','300.00','10.00','<div class="new_tit" style="margin:0px;padding:0px 0px 22px;font-family:微软雅黑;color:#333333;background-color:#FFFFFF;">
	<h3 style="font-size:22px;font-weight:normal;text-align:center;color:#444444;">
	</h3>
	<h2 style="font-size:23px;font-weight:400;vertical-align:baseline;color:#403E3E;text-align:center;font-family:STHeiti, &quot;">
		熊猫直播主播入驻协议
	</h2>
	<p style="vertical-align:baseline;color:gray;font-family:STHeiti, &quot;">
		《熊猫直播主播入驻协议》，是上海熊猫互娱文化有限公司（以下简称“我方”）和主播（以下称“您”或“贵方”）所约定的规范双方权利和义务的具有法律效力的电子协议，下称“本协议”。贵方勾选“我同意”或点击“我已阅读并遵守该协议”按钮，即表示贵方已经仔细阅读、充分理解并完全地毫无保留地接受本协议的所有条款。
	</p>
	<div class="item" style="margin:0px;padding:0px;border:0px;vertical-align:baseline;font-family:STHeiti, &quot;">
		<h5 style="font-size:12px;font-weight:400;vertical-align:baseline;text-align:center;">
			第一条 总则
		</h5>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			1、贵方根据我方注册要求及规则，在我方合法经营的熊猫直播平台（以下简称“平台”）上申请成为我方主播，在我方平台从事网络直播活动，即使用我方平台提供的服务从事包括但不限于在线游戏解说、游戏技巧展示、唱歌跳舞或其他才艺展示、参加比赛及综艺节目等视频内容的直播活动（以下简称“网络直播”），贵方在我方平台进行网络直播期间均应视为协议期内。我方不事先审核前述被上载的、由贵方参与、编辑、制作的视频内容，也不主动对该等视频进行任何编辑、整理、修改、加工。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			2、签署本协议前，贵方已充分了解我方之各项规则及要求，且有条件及有能力、资格履行本协议约定的主播职责及义务。本协议对贵方构成有效的、带有约束力的、可强制执行的法定义务，贵方对本协议下所有条款及定义等内容均已明确知悉，并无疑义。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			3、贵方承诺并声明在我方平台进行网络直播时符合所在地法律的相关规定，不得以履行本协议名义从事其他违反中国及所在地法律规定的行为。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			4、贵方与我方不构成任何法律层面的雇佣、劳动、劳务关系，我方无需向贵方承担任何社会保险金和福利。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			5、未经我方事先书面同意，贵方不得在第三方竞争平台上从事任何与网络直播相关的行为（包括但不限于：视频直播互动、同步推流、发布直播视频或其余类似行为）。前述第三方竞争平台指：与我方及我方关联公司有竞争关系的第三方直播平台，包括但不限于虎牙直播、战旗直播、斗鱼直播、火猫直播、风云直播、YY直播、映客直播、花椒直播、全民直播、龙珠直播、播狗、新浪看游戏、QT、17173、PPTV、TGA、AZUBU、TWITCH等及其相关联的直播网站。
		</p>
		<p class="tit-1 strong" style="font-weight:bold;vertical-align:baseline;">
			6、贵方在我方平台进行网络直播期间产生的所有成果（包括但不限于解说视频、音频，及与本协议事项相关的任何文字、视频、音频等，以下统称“主播成果”）的全部知识产权（包括但不限于著作权、商标权等知识产权以及相关的一切衍生权利）、所有权及相关权益，由我方享有。协议期内及协议期满后，我方可以任何方式使用主播成果并享有相应的收益且无须向贵方支付任何费用，未经我方事先书面同意，贵方不得自行或提供、授权給任何第三方以任何方式使用（包括但不限于在视频平台、直播平台、游戏网站等其他任何平台发布）及获得任何收益。如果主播成果中含有他人知识产权、肖像权、姓名权或其他合法权益的，贵方应保证已经取得相关权利人的合法授权，且有权授权我方永久免费无地域限制的使用，贵方应保证我方对主播成果的使用不会侵犯任何第三方合法权益。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			7、网络直播费用：平台用户可以购买平台的虚拟礼物赠送给其选择的主播，贵方可能会基于平台用户赠送的虚拟礼物而获得虚拟道具收益，虚拟道具收益按照我方平台虚拟道具收益分成规则和计算方式计算。贵方应当缴纳的税金由我方或我方委托或指定的第三方根据国家相关法律法规依法代扣代缴。
		</p>
	</div>
	<div class="item" style="margin:0px;padding:0px;border:0px;vertical-align:baseline;font-family:STHeiti, &quot;">
		<h5 style="font-size:12px;font-weight:400;vertical-align:baseline;text-align:center;">
			第二条 我方权利义务
		</h5>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			1、我方有权制定平台运营制度及对主播的管理规则，有权对贵方进行管理和监督，有权根据运营情况对相应规则做出调整或变更，贵方对此表示理解和同意。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			2、我方有权对贵方进行考察、评判，以确立（取消）对贵方的奖励或处罚，具体考察项目及标准由我方另行制定，无需额外征得贵方同意。如我方希望与贵方就直播事项进行深入合作的，可由双方进行友好协商另行签订正式的主播合作协议。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			3、我方有权对贵方的网络直播提出改进建议和意见，贵方应在收到我方的建议和意见后【3】个工作日内进行相应的整改，否则我方有权相应扣减应支付给贵方的网络直播费用（若有）。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			4、我方对贵方进行的网络直播相关事宜拥有最终决定权。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			5、我方有权使用贵方的名称（包括但不限于贵方真实姓名、笔名、网名、曾用名及任何代表贵方身份的文字符号）、肖像（包括但不限于真人肖像及卡通肖像等）进行我方平台的各类宣传。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			6、我方负责提供平台技术服务支持，同时负责平台网络直播费用（若有）结算。
		</p>
	</div>
	<div class="item" style="margin:0px;padding:0px;border:0px;vertical-align:baseline;font-family:STHeiti, &quot;">
		<h5 style="font-size:12px;font-weight:400;vertical-align:baseline;text-align:center;">
			第三条 贵方权利义务
		</h5>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			1、贵方须年满16周岁且以自己的劳动收入为主要生活来源或年满18周岁（未满18周岁的未成年人应在法定监护人的陪同下审阅本协议，并在接受本协议前取得父母，即法定监护人的同意）。若父母（法定监护人）希望未成年人（尤其是10周岁以下子女）得以进行本协议约定的网络直播的，必须以法定监护人身份加以判断该等网络直播内容是否适合于未成年人），贵方承诺不会因执行本协议损害任何第三方合法利益，贵方接受并履行本协议不违反任何对您有约束力的法律文件，亦不会使我方对任何第三方承担任何责任。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			2、贵方应自行承担费用配备网络直播所需要的网络、支持视频和语音的设备，并保证直播图像清晰、语音质量清晰、稳定。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			3、贵方在网络直播过程中，应保障自己的人身安全及财产安全；如贵方在网络直播过程中，导致贵方或任何第三方遭受任何损害的，贵方应独立承担责任，我方因此遭受损失的，贵方应当一并赔偿。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			4、贵方如在网络直播过程中开展抽奖活动的，应遵守中国法律的规定，并应按照贵方对外公布的抽奖规则进行抽奖及发奖，因抽奖活动产生的任何纠纷，贵方应当自行解决并独立承担全部法律责任，如我方因此遭受任何名誉或经济损失的，贵方应予以赔偿并负责消除给我方造成的不良影响。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			5、贵方承诺直播房间必须用作本协议约定的网络直播或我方根据平台发展需要而增加的其他业务用途，不得用于其他任何非我方允许的活动（包括但不限于不得提供广告、推介等服务，或从事任何违法行为）。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			6、贵方开展本协议项下网络直播事项和/或在本平台上发布的所有信息/资讯/言论/内容等均不得含有任何违反中华人民共和国有关法律、法规及规定的内容，包括但不限于危害国家安全、淫秽色情、虚假、违法、诽谤（包括商业诽谤）、非法恐吓或非法骚扰、侵犯他人知识产权、人身权、商业秘密或，其他合法权益以及有违公序良俗的内容或指向这些内容的链接。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			7、贵方承诺积极维护我方及我方平台形象，贵方不会做出有损于我方及/或我方平台形象或利益的行为，本协议期内及协议终止后，贵方不会通过任何渠道（包括但不限于网站、博客、微博、微信、QQ聊天群、玩家作者聚会等）暗示或发布不利于我方及/或我方平台的言论。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			8、未经我方书面同意，贵方不得在任何场合以任何形式（包括但不限于文字、口播、视频贴片等）提及第三方竞争平台的相关信息，不得引导或为我方平台现有用户、其他主播及我方员工进入其他第三方竞争平台提供任何信息或便利，包括但不限于提供联络上的协助、进行说服工作等。
		</p>
	</div>
	<div class="item" style="margin:0px;padding:0px;border:0px;vertical-align:baseline;font-family:STHeiti, &quot;">
		<h5 style="font-size:12px;font-weight:400;vertical-align:baseline;text-align:center;">
			第四条 保密制度
		</h5>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			1、贵方应严格遵守我方的保密制度，承诺无限期保守我方的商业秘密。因贵方违反约定使用或披露我方商业秘密和信息使我方及/或我方平台遭受任何名誉、声誉或经济上的、直接或间接的损失，贵方应赔偿我方人民币【100000】元违约金，不足以弥补我方损失的，贵方还应赔偿我方损失。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			商业秘密是指由我方提供的、或者贵方在双方合作期间了解到的、或者我方对第三方承担保密义务的，与我方业务有关的，能为我方带来经济利益，具有实用性的、非公知的所有信息，包括（但不限于）：技术信息、经营信息和与我方行政管理有关的信息和文件（含本协议及相关协议内容）、贵方从我方获得的网络直播费用的金额和结算方式、标准、权利归属方式、授权方式、客户名单、其他主播的名单、联系方式、网络直播费用、我方工作人员名单及联系方式等不为公众所知悉的信息。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			2、贵方应严格遵守本协议，未经我方书面授权或同意，对我方的商业秘密不得：
		</p>
		<p class="tit-4" style="vertical-align:baseline;color:gray;">
			（1）以任何方式向第三方或不特定的公众进行传播、泄露； 
		</p>
		<p class="tit-4" style="vertical-align:baseline;color:gray;">
			（2）为非本协议的目的而使用我方的商业秘密。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			3、本协议终止后，贵方应将我方商业秘密悉数返还我方，或在我方监督下，将记载我方商业秘密的全部文件销毁。 
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			4、本条规定在本协议终止后仍然有效。
		</p>
	</div>
	<div class="item" style="margin:0px;padding:0px;border:0px;vertical-align:baseline;font-family:STHeiti, &quot;">
		<h5 style="font-size:12px;font-weight:400;vertical-align:baseline;text-align:center;">
			第五条 协议的变更、解除、终止
		</h5>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			1、本协议内容同时包括本协议、《熊猫直播用户服务协议》以及我方可能不时发布的其他相关协议、规则、声明、政策等内容。上述内容一经正式发布，即成为本协议不可分割的组成部分，贵方同样应当遵守。我方有权在必要时单方变更、终止、中止本协议或上述内容，并在相关页面进行通知，变更后的协议或相关内容一旦在相关的页面上公布即有效代替原来的协议或内容。本协议条款或相关内容变更后，如贵方继续在我方平台进行网络直播，即视为贵方已知悉并接受变更后的协议和相关内容。如贵方不同意我方对本协议或相关内容所作的任何变更，贵方应立即书面通知我方并停止在我方平台进行的任何网络直播。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			2、双方就解除本协议协商一致即可终止协议。
		</p>
		<p class="tit-1 strong" style="font-weight:bold;vertical-align:baseline;">
			3、贵方有下列情形之一，我方可以立即解除本协议，不需要提前通知：
		</p>
		<p class="tit-4 strong" style="font-weight:bold;vertical-align:baseline;">
			（1）我方发现贵方违反对本协议所做的声明与承诺的；
		</p>
		<p class="tit-4 strong" style="font-weight:bold;vertical-align:baseline;">
			（2）因贵方个人行为直接或间接给对我方利益造成重大损害的；
		</p>
		<p class="tit-4 strong" style="font-weight:bold;vertical-align:baseline;">
			（3）违反国家法律法规的；
		</p>
		<p class="tit-4 strong" style="font-weight:bold;vertical-align:baseline;">
			（4）违反本协议规定的其它义务；
		</p>
		<p class="tit-4 strong" style="font-weight:bold;vertical-align:baseline;">
			（5）以消极、不作为等不符合我方要求的方式履行本协议的（即使未构成违约），经我方通知后【10】日内仍未改正的；
		</p>
		<p class="tit-4 strong" style="font-weight:bold;vertical-align:baseline;">
			（6）因异常情形的出现，我方认为贵方不适合进行本协议下网络直播活动，经我方通知后【10】日内异常情形仍未消除的；
		</p>
		<p class="tit-4 strong" style="font-weight:bold;vertical-align:baseline;">
			（7）因我方业务调整，决定停止本协议所涉及的业务。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			4、本协议终止后，不影响本协议约定的主播成果的权利归属，我方仍为本协议所涉主播成果的权利人；如果根据中国法律，上述之约定无法实际履行的，贵方同意并承诺自本协议终止或双方后续合作中止、终止或解除之后，未经我方事先书面同意，贵方不得将主播成果的全部或部分的发布、使用等相关的权利（包括但不限于《中华人民共和国著作权法》第十条第一款第（五）项至第（十七）项规定的著作权权利）自行行使、转让或授权许可于任何第三方。
		</p>
	</div>
	<div class="item" style="margin:0px;padding:0px;border:0px;vertical-align:baseline;font-family:STHeiti, &quot;">
		<h5 class="strong" style="font-size:12px;vertical-align:baseline;text-align:center;">
			第六条 违约责任
		</h5>
		<p class="tit-1 strong" style="font-weight:bold;vertical-align:baseline;">
			1、任何由于贵方声明不实或违反其声明承诺事项导致他方向我方提起诉讼、索赔及/或导致我方声誉受损之后果，贵方将承担我方因此产生的全部直接及间接费用、损失及赔偿，其中包括我方为诉讼支付的有关费用及律师费。
		</p>
		<p class="tit-1 strong" style="font-weight:bold;vertical-align:baseline;">
			2、除本协议另有约定外，贵方违反本协议下任何规定的，我方有权单方面扣除贵方相关网络直播费用，及要求贵方返还我方已支付的全部或部分网络直播费用；不足以弥补我方损失的，贵方还应赔偿我方所有损失。
		</p>
		<p class="tit-1 strong" style="font-weight:bold;vertical-align:baseline;">
			3、若贵方提供的网络直播内容不符合我方的要求，我方有权不予支付相关网络直播费用。
		</p>
	</div>
	<div class="item" style="margin:0px;padding:0px;border:0px;vertical-align:baseline;font-family:STHeiti, &quot;">
		<h5 class="strong" style="font-size:12px;vertical-align:baseline;text-align:center;">
			第七条 免责声明&nbsp;
		</h5>
		<p class="tit-1 strong" style="font-weight:bold;vertical-align:baseline;">
			1、我方不担保网络服务一定能满足贵方的要求，也不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。
		</p>
		<p class="tit-1 strong" style="font-weight:bold;vertical-align:baseline;">
			2、我方不保证为向贵方提供便利而设置的外部链接的真实性、准确性和完整性，同时，对于该等外部链接指向的不由我方实际控制的任何网页上的内容，我方不承担任何责任。
		</p>
		<p class="tit-1 strong" style="font-weight:bold;vertical-align:baseline;">
			3、 对于因电信系统或互联网网络故障、计算机故障或病毒、信息损坏或丢失、计算机系统问题或其它任何不可抗力原因而产生损失，我方不承担任何责任，但将尽力减少因此而给贵方造成的损失和影响。
		</p>
		<p class="tit-1 strong" style="font-weight:bold;vertical-align:baseline;">
			4、 我方不担保我方平台所包含或以其他方式通过熊猫直播网站提供给贵方的全部信息、内容、产品（包括软件）、服务和从熊猫直播网站发出的电子信息、信件没有病毒或其他有害成分。
		</p>
		<p class="tit-1 strong" style="font-weight:bold;vertical-align:baseline;">
			5、除非另有明确书面说明，我方不对熊猫直播网站的运营及其包含在熊猫直播网站上的信息、内容、产品（包括软件）、服务作任何形式的、明示或默示的担保。
		</p>
	</div>
	<div class="item" style="margin:0px;padding:0px;border:0px;vertical-align:baseline;font-family:STHeiti, &quot;">
		<h5 style="font-size:12px;font-weight:400;vertical-align:baseline;text-align:center;">
			第八条 法律适用及争议处理
		</h5>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			1、本协议的成立、生效、履行、解释及纠纷解决，适用中华人民共和国法律（不包括冲突法）。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			2、因履行本协议而产生的任何争议，双方均应本着友好协商的原则加以解决。协商解决未果，任何一方均可以提请本协议签订地有管辖权的人民法院诉讼解决。
		</p>
	</div>
	<div class="item" style="margin:0px;padding:0px;border:0px;vertical-align:baseline;font-family:STHeiti, &quot;">
		<h5 style="font-size:12px;font-weight:400;vertical-align:baseline;text-align:center;">
			第九条 其他
		</h5>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			1、本协议未尽事宜，或与国家、地方有关规定相悖的，按有关规定执行。
		</p>
		<p class="tit-1" style="vertical-align:baseline;color:gray;">
			2、本协议签订地：上海市宝山区。
		</p>
本协议共九条，本行以下无协议正文。
	</div>
	<div class="item" style="margin:0px;padding:0px;border:0px;vertical-align:baseline;font-family:STHeiti, &quot;">
		<p class="strong" style="font-weight:bold;vertical-align:baseline;">
			*特别声明
		</p>
		<p class="strong" style="font-weight:bold;vertical-align:baseline;">
			鉴于我国《合同法》第39条规定：采用格式条款订立合同的，提供格式条款的一方应当遵循公平原则确定当事人之间的权利和义务，并采取合理的方式提请对方注意免除或者限制其责任的条款，按照对方的要求，对该条款予以说明。 我方在此依法做出特别声明如下：
		</p>
		<p class="strong" style="font-weight:bold;vertical-align:baseline;">
			法定的我方采取合理的方式提请贵方注意的义务将通过如下方式实现：在本协议中我方以明确的足以引起贵方注意的加重字体、斜体、下划线、颜色标记等合理方式提醒贵方注意相关条款（需要强调的是，还包括贵方应特别注意任何未明确标记的含有“不承担”、“免责”“不得”等形式用语的条款），该等条款的确认将导致贵方在特定情况下的被动、不便、损失，包括但不限于本合同第一条、第三条、第四条、第五条、第六条、第七条等，请贵方在确认同意本协议之前再次阅读上述条款。双方确认上述条款非属于《合同法》第40条规定的“免除其责任、加重对方责任、排除对方主要权利的”的条款，我方尊重贵方的权利尤其是诉讼的权利，但作为全球运营的公司，我方在尊重贵方诉讼权利的同时建议诉讼管辖地法院为上海宝山区法院，而贵方选择同意合同并进行网络直播即视为双方对此约定达成了一致意见。
		</p>
		<p class="strong" style="font-weight:bold;vertical-align:baseline;">
			法定的我方向贵方说明这些条款的义务将通过如下方式实现：而贵方如有任何需要说明条款的要求，请立即停止网络直播，同时立即致电书面通知我方，若贵方未致电或发送有说明条款要求的邮件至我方而选择同意该协议，则双方在此确认我方已依法履行了根据贵方要求对相关条款进行说明的法定义务，我方已给予贵方充足的时间与充分的选择权来决定是否缔结本协议。
		</p>
		<p class="strong" style="font-weight:bold;vertical-align:baseline;">
			鉴于我方已依法明确了上述条款、履行了格式条款制订方的义务，贵方点击同意或下一步，将被视为且应当被视为贵方已经完全注意并同意了本协议所有条款尤其是提醒贵方注意的条款的合法性及有效性，贵方不应当以我方未对格式条款以合理方式提醒贵方注意或未根据贵方要求尽到说明义务为理由而声称或要求法院或其它任何第三方确认相关条款非法或无效。
		</p>
	</div>
	<p style="vertical-align:baseline;color:gray;font-family:STHeiti, &quot;text-align:right;">
		版本更新日期： 2018年1月10日
	</p>
</div>
<div class="article" style="margin:28px 0px 0px;padding:0px;font-family:微软雅黑;color:#333333;background-color:#FFFFFF;">
	<b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b><b></b> 
</div>','0.00');


# 数据库表：pa_livevideo 数据信息
INSERT INTO `pa_livevideo` VALUES ('1','播音播音播音','http://bos.nj.bpc.baidu.com/tieba-smallvideo/11772_3c435014fb2dd9a5fd56a57cc369f6a0.mp4','40','播音','0','0','1');
INSERT INTO `pa_livevideo` VALUES ('2','迷糊擦擦','http://bos.nj.bpc.baidu.com/tieba-smallvideo/11772_3c435014fb2dd9a5fd56a57cc369f6a0.mp4','40','体育','0','2','1');


# 数据库表：pa_major 数据信息
INSERT INTO `pa_major` VALUES ('1','4','播音','播音1','','北京市');
INSERT INTO `pa_major` VALUES ('2','2','播音','播音1','','天津市');
INSERT INTO `pa_major` VALUES ('3','4','播音','播音2','','杭州市');
INSERT INTO `pa_major` VALUES ('4','2','播音','播音3','','沈阳市');
INSERT INTO `pa_major` VALUES ('5','2','编剧','编剧1','','深圳');
INSERT INTO `pa_major` VALUES ('6','2','编剧','编剧2','','重庆');
INSERT INTO `pa_major` VALUES ('7','2','编剧','编剧3','','四川');
INSERT INTO `pa_major` VALUES ('8','4','美术','美术1','','九寨沟');
INSERT INTO `pa_major` VALUES ('9','4','美术','美术2','','阿里巴巴');
INSERT INTO `pa_major` VALUES ('10','2','美术','美术3','','百度');
INSERT INTO `pa_major` VALUES ('14','13','美术','美术 1','美术专业是非常牛逼的的','北京市,天津市,西藏自治区,陕西省');
INSERT INTO `pa_major` VALUES ('15','13','播音','播音专业1','播音抓很远事非常牛逼的','北京市,天津市,西藏自治区,陕西省');
INSERT INTO `pa_major` VALUES ('12','6','体育','体育体育哈','体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈体育体育哈','北京市,天津市,河北省,山西省,西藏自治区,陕西省,甘肃省');
INSERT INTO `pa_major` VALUES ('13','6','播音','播音播音哈','播音播音哈播音播音哈播音播音哈播音播音哈播音播音哈播音播音哈播音播音哈播音播音哈播音播音哈播音播音哈播音播音哈播音播音哈播音播音哈播音播音哈播音播音哈播音播音哈播音播音哈','北京市,内蒙古自治区,黑龙江省,安徽省,江西省,湖南省,广西壮族自治区,陕西省,青海省,宁夏回族自治区,台湾省,澳门特别行政区');
INSERT INTO `pa_major` VALUES ('19','7','播音','测试播音1','测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1测试播音1','北京市,天津市,河北省,山西省,内蒙古自治区');
INSERT INTO `pa_major` VALUES ('17','13','播音','播音 2','播音 &amp;nbsp;非常 &amp;nbsp;牛逼','北京市,天津市,西藏自治区');
INSERT INTO `pa_major` VALUES ('18','13','编导','编导非常牛','编导非常牛逼','天津市,河北省,山西省');
INSERT INTO `pa_major` VALUES ('20','7','播音','测试播音2','测试播音2测试播音2测试播音2测试播音2测试播音2测试播音2测试播音2测试播音2测试播音2测试播音2测试播音2测试播音2测试播音2测试播音2测试播音2','西藏自治区,陕西省,甘肃省,青海省');
INSERT INTO `pa_major` VALUES ('21','7','播音','测试播音3','测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3测试播音3','辽宁省,吉林省,黑龙江省');
INSERT INTO `pa_major` VALUES ('22','1','播音','浙江传媒学院测试播音专业1','浙江传媒学院测试播音专业1浙江传媒学院测试播音专业1浙江传媒学院测试播音专业1浙江传媒学院测试播音专业1浙江传媒学院测试播音专业1浙江传媒学院测试播音专业1浙江传媒学院测试播音专业1','北京市,天津市,河北省,陕西省');
INSERT INTO `pa_major` VALUES ('23','1','播音','浙江传媒学院测试播音专业2','浙江传媒学院测试播音专业2浙江传媒学院测试播音专业2浙江传媒学院测试播音专业2浙江传媒学院测试播音专业2浙江传媒学院测试播音专业2浙江传媒学院测试播音专业2浙江传媒学院测试播音专业2浙江传媒学院测试播音专业2浙江传媒学院测试播音专业2','辽宁省,吉林省,新疆维吾尔自治区,台湾省');
INSERT INTO `pa_major` VALUES ('24','1','编导','浙江传媒学院测试编导专业1','浙江传媒学院测试编导专业1浙江传媒学院测试编导专业1浙江传媒学院测试编导专业1浙江传媒学院测试编导专业1浙江传媒学院测试编导专业1浙江传媒学院测试编导专业1浙江传媒学院测试编导专业1','北京市,天津市,河北省,山西省');
INSERT INTO `pa_major` VALUES ('25','1','编导','浙江传媒学院测试编导专业2','浙江传媒学院测试编导专业2浙江传媒学院测试编导专业2浙江传媒学院测试编导专业2浙江传媒学院测试编导专业2浙江传媒学院测试编导专业2浙江传媒学院测试编导专业2浙江传媒学院测试编导专业2浙江传媒学院测试编导专业2浙江传媒学院测试编导专业2浙江传媒学院测试编导专业2浙江传媒学院测试编导专业2浙江传媒学院测试编导专业2','上海市,江苏省,浙江省,台湾省,香港特别行政区');
INSERT INTO `pa_major` VALUES ('26','1','表演','浙江传媒学院测试表演专业1','浙江传媒学院测试表演专业1浙江传媒学院测试表演专业1浙江传媒学院测试表演专业1浙江传媒学院测试表演专业1浙江传媒学院测试表演专业1浙江传媒学院测试表演专业1浙江传媒学院测试表演专业1浙江传媒学院测试表演专业1浙江传媒学院测试表演专业1浙江传媒学院测试表演专业1浙江传媒学院测试表演专业1浙江传媒学院测试表演专业1浙江传媒学院测试表演专业1浙江传媒学院测试表演专业1','吉林省,新疆维吾尔自治区');
INSERT INTO `pa_major` VALUES ('27','1','表演','浙江传媒学院测试表演专业2','浙江传媒学院测试表演专业2浙江传媒学院测试表演专业2浙江传媒学院测试表演专业2浙江传媒学院测试表演专业2浙江传媒学院测试表演专业2浙江传媒学院测试表演专业2浙江传媒学院测试表演专业2','上海市,江苏省,浙江省,安徽省');


# 数据库表：pa_match 数据信息
INSERT INTO `pa_match` VALUES ('10','5','65','1514439841','/Uploads/Match/2017-12-28/162705a4484a1a978e.png');
INSERT INTO `pa_match` VALUES ('2','9','24','1512354725','/Uploads/Match/2017-12-04/1512354725_1116850248.jpg');
INSERT INTO `pa_match` VALUES ('11','8','65','1514439920','/Uploads/Match/2017-12-28/15475a4484f001bf8.png');
INSERT INTO `pa_match` VALUES ('5','9','24','1512355735','/Uploads/Match/2017-12-04/1512355735_1869906145.jpg');


# 数据库表：pa_member 数据信息


# 数据库表：pa_message 数据信息


# 数据库表：pa_model 数据信息
INSERT INTO `pa_model` VALUES ('2','会员','pa_personal','会员','0','1','MyISAM','会员表','1510624122','1513735227');
INSERT INTO `pa_model` VALUES ('15','直播','pa_live','直播','0','1','InnoDB','','1513252345','1513252345');
INSERT INTO `pa_model` VALUES ('17','课程管理','pa_subject','课程','0','1','InnoDB','','1519527147','1519527147');
INSERT INTO `pa_model` VALUES ('18','活动','pa_activity','活动','0','1','InnoDB','','1519630823','1519630823');


# 数据库表：pa_myrecord 数据信息
INSERT INTO `pa_myrecord` VALUES ('1','24','/Uploads/record/2017-12-04/167435a24b5a8bc7bc.mp3','1512359909','缝纫机乐队','这是我的作品','1','','5','7','1','','');
INSERT INTO `pa_myrecord` VALUES ('2','24','/Uploads/record/2017-12-04/275265a24b5fdbafc2.mp3','1512355325','缝纫机乐队','','0','','6','7','3','','');
INSERT INTO `pa_myrecord` VALUES ('7','25','/Uploads/record/2017-12-17/299585a35c43ecaca2.mp4','1513473086','缝纫机乐队','','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('18','34','/Uploads/record/2017-12-18/103265a37b43070bad.mp4','1513600048','缝纫机乐队','说点什么...','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('8','24','/Uploads/record/2017-12-13/292025a308f6dbf9b9.mp4','1513131885','缝纫机乐队','','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('11','25','/Uploads/record/2017-12-13/169845a3090dc858f9.mp4','1513132252','缝纫机乐队','','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('12','25','/Uploads/record/2017-12-16/174295a34776c7e8af.mp4','1513387884','缝纫机乐队','','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('16','0','/Uploads/record/2017-12-16/5a34b2708c80b.mp3','1513402992','乐队乐队','啊伤筋动骨发生的骨灰拌饭四大皆空公布考试对方感到十分','1','/Uploads/image/institution/20171216/20171216054254_14619.png','0','0','0','专家3333','/Uploads/record/2017-12-16/1513402992_240226855.png');
INSERT INTO `pa_myrecord` VALUES ('13','25','/Uploads/record/2017-12-16/190205a347d7debbe9.mp4','1513389437','缝纫机乐队','','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('14','0','/Uploads/record/2017-12-16/5a34b2031eb36.mp3','1513402883','标题11','撒娇的方式的两个洒到了告诉对方公司地方规定发给第三方个','1','/Uploads/image/institution/20171216/20171216053930_98395.png','0','0','0','专家示范11','/Uploads/record/2017-12-16/1513402883_171747247.png');
INSERT INTO `pa_myrecord` VALUES ('15','0','/Uploads/record/2017-12-16/5a34b2350d12a.mp3','1513402933','缝纫机乐队','地方噶是的发个涣发大号发给地方过会东方红辅导费','1','/Uploads/image/institution/20171216/20171216054146_41648.png','0','0','0','专家11','/Uploads/record/2017-12-16/1513402933_838720290.png');
INSERT INTO `pa_myrecord` VALUES ('24','34','/Uploads/record/2017-12-18/30305a37b765c9fed.mp4','1513600869','缝纫机乐队','说点什么...','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('25','34','/Uploads/record/2017-12-18/16915a37ba8aea172.mp4','1513601674','缝纫机乐队','说点什么...','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('26','34','/Uploads/record/2017-12-19/5a38843ae2f14.mp3','1513653306','缝纫机乐队','说点什么...','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('27','34','/Uploads/record/2017-12-19/5a38856cdb502.mp3','1513653612','缝纫机乐队','测试','1','','8','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('28','34','/Uploads/record/2017-12-19/5a3886addb502.mp3','1513653933','缝纫机乐队','说点什么...','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('29','34','/Uploads/record/2017-12-19/5a38871e7450f.mp3','1513654046','缝纫机乐队','说点什么...','1','','8','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('30','34','/Uploads/record/2017-12-19/5a3887acc83d5.mp3','1513654188','缝纫机乐队','说点什么...','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('31','34','/Uploads/record/2017-12-19/5a38893f8f04e.mp3','1513654591','缝纫机乐队','说点什么...','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('32','34','/Uploads/record/2017-12-19/5a388958b159f.mp3','1513654616','缝纫机乐队','说点什么...','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('33','24','/Uploads/record/2017-12-19/154075a3890b922c2c.mp4','1513656505','缝纫机乐队缝纫机乐队','','1','','0','0','0','','');
INSERT INTO `pa_myrecord` VALUES ('34','24','/Uploads/record/2017-12-19/288475a3890d79cc4c.mp4','1513656535','缝纫机乐队','','1','','0','0','2','','');
INSERT INTO `pa_myrecord` VALUES ('35','24','/Uploads/record/2017-12-19/223865a38914711362.mp4','1513656647','缝纫机乐队','','1','','0','0','3','','');
INSERT INTO `pa_myrecord` VALUES ('36','24','/Uploads/record/2017-12-19/224845a38915a8ad25.mp4','1513656666','少年中国说','','1','','0','0','3','','');
INSERT INTO `pa_myrecord` VALUES ('37','25','/Uploads/record/2018-01-02/165035a4b4e1257c80.mp4','1514884626','','','1','','0','0','0','','');


# 数据库表：pa_nav 数据信息


# 数据库表：pa_news 数据信息
INSERT INTO `pa_news` VALUES ('13','1','规范化规范化广泛用途用途用途用途规范化飞过海集结','牙痛溶液','有人体育','1','膮','1394437621','1394438741','月try突然','3','1','1','0','zh-cn');
INSERT INTO `pa_news` VALUES ('14','1','如果对符合购房计划将会根据','激光焊接','结核杆菌','0','几个号','1394438751','0','几个号','4','1','1','0','zh-cn');
INSERT INTO `pa_news` VALUES ('15','1','价格具有统一规划集合计划将会','','空军航空','1','','1394438760','0','','3','1','1','0','zh-cn');
INSERT INTO `pa_news` VALUES ('16','1','会见法国恢复的规划法规和反光镜123','gfdg','激光焊接有一天梵蒂冈梵蒂冈梵蒂冈奋斗','0','后果将会根据可更换','1394438775','1510564156','<img src="/newconist/Uploads/image/product/20140303/20140303081406_87297.jpg" alt="" />根据可更换','28','1','1','0','zh-cn');
INSERT INTO `pa_news` VALUES ('19','5','我是文章','','','0','我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容','1512123554','','<span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('20','5','我是文章','','','1','我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容','1512123556','','<span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('21','5','我是文章','','','1','我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容','1512123567','','<span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('22','5','我是文章','','','0','我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容','1512123568','','<span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('23','5','我是文章','','','0','我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容','1512123576','','<span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span>','0','1','1','0','zh-cn');
INSERT INTO `pa_news` VALUES ('24','5','我是文章','','','0','我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容','1512123577','','<span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span>','0','1','1','0','zh-cn');
INSERT INTO `pa_news` VALUES ('25','5','我是文章','','','1','我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容','1512123578','','<span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span>','0','1','1','0','zh-cn');
INSERT INTO `pa_news` VALUES ('26','5','我是文章','','','1','我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容我是内容','1512123620','1512126074','<span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span><span>我是内容</span>','0','1','1','0','zh-cn');
INSERT INTO `pa_news` VALUES ('34','1','我是文章444444444444444444','','','0','我是文章我是文章我是文章我是文章我是文章我是文章我是文章我是文章我是文章我是文章我是文章我是文章我是文章我是文章我是文章我是文章我是文章我是文章我是文章我是文章','1512131659','','我是文章<span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span><span>我是文章</span>','0','1','1','0','zh-cn');
INSERT INTO `pa_news` VALUES ('33','1','我是文章三','饭钱驱动器','大 ','0','我是文章33333333333333333333333333','1512130304','1512131109','我是文章33333333333333333333333333','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('37','72','比赛比赛','','','0','经我与我领导决定，比赛的资讯就是这么弄经我与我领导决定，比赛的资讯就是这么弄','1512197024','','<span>经我与我领导决定，比赛的资讯就是这么弄</span><span>经我与我领导决定，比赛的资讯就是这么弄</span>','0','1','0','77','zh-cn');


# 数据库表：pa_node 数据信息
INSERT INTO `pa_node` VALUES ('1','Admin','后台管理','1','网站后台管理项目','10','0','1');
INSERT INTO `pa_node` VALUES ('2','Index','管理首页','1','','1','1','2');
INSERT INTO `pa_node` VALUES ('3','Member','注册会员管理','1','','3','1','2');
INSERT INTO `pa_node` VALUES ('4','Webinfo','系统管理','1','','4','1','2');
INSERT INTO `pa_node` VALUES ('5','index','默认页','1','','5','2','3');
INSERT INTO `pa_node` VALUES ('6','myInfo','我的个人信息','1','','6','2','3');
INSERT INTO `pa_node` VALUES ('7','index','会员首页','1','','7','3','3');
INSERT INTO `pa_node` VALUES ('8','index','管理员列表','1','','8','14','3');
INSERT INTO `pa_node` VALUES ('9','addAdmin','添加管理员','1','','9','14','3');
INSERT INTO `pa_node` VALUES ('10','index','系统设置首页','1','','10','4','3');
INSERT INTO `pa_node` VALUES ('11','setEmailConfig','设置系统邮件','1','','12','4','3');
INSERT INTO `pa_node` VALUES ('12','testEmailConfig','发送测试邮件','1','','0','4','3');
INSERT INTO `pa_node` VALUES ('13','setSafeConfig','系统安全设置','1','','0','4','3');
INSERT INTO `pa_node` VALUES ('14','Access','权限管理','1','权限管理，为系统后台管理员设置不同的权限','0','1','2');
INSERT INTO `pa_node` VALUES ('15','nodeList','查看节点','1','节点列表信息','0','14','3');
INSERT INTO `pa_node` VALUES ('16','roleList','角色列表查看','1','角色列表查看','0','14','3');
INSERT INTO `pa_node` VALUES ('17','addRole','添加角色','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('18','editRole','编辑角色','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('19','opNodeStatus','便捷开启禁用节点','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('20','opRoleStatus','便捷开启禁用角色','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('21','editNode','编辑节点','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('22','addNode','添加节点','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('23','addAdmin','添加管理员','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('24','editAdmin','编辑管理员信息','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('25','changeRole','权限分配','1','','0','14','3');
INSERT INTO `pa_node` VALUES ('26','News','资讯管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('27','index','新闻列表','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('28','category','新闻分类管理','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('29','add','发布新闻','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('30','edit','编辑新闻','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('31','del','删除信息','0','','0','26','3');
INSERT INTO `pa_node` VALUES ('32','SysData','数据库管理','1','包含数据库备份、还原、打包等','0','1','2');
INSERT INTO `pa_node` VALUES ('33','index','查看数据库表结构信息','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('34','backup','备份数据库','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('35','restore','查看已备份SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('36','restoreData','执行数据库还原操作','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('37','delSqlFiles','删除SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('38','sendSql','邮件发送SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('39','zipSql','打包SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('40','zipList','查看已打包SQL文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('41','unzipSqlfile','解压缩ZIP文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('42','delZipFiles','删除zip压缩文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('43','downFile','下载备份的SQL,ZIP文件','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('44','repair','数据库优化修复','1','','0','32','3');
INSERT INTO `pa_node` VALUES ('46','Siteinfo','网站功能','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('47','index','菜单列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('48','add_nav','添加/编辑菜单','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('49','adindex','轮播列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('50','add_ad','添加/编辑轮播','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('51','page','单页列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('52','add_page','添加/编辑单页','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('53','tag_index','标签列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('54','add_tag','添加/编辑标签','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('55','create_tag','模版标签生成','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('56','file_index','文件管理','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('57','link_index','友情链接列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('58','add_link','添加/编辑友情链接','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('59','message','留言信息列表','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('60','Product','产品管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('61','delpage','删除单页','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('62','delad','删除轮播','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('63','dellink','删除友情链接','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('64','delmessage','删除留言','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('65','deltag','删除标签','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('66','selectCat','文章分类','1','','0','46','3');
INSERT INTO `pa_node` VALUES ('67','index','产品列表','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('68','edit','编辑产品','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('69','add','添加产品','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('70','category','分类列表','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('71','del','删除产品','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('72','changeAttr','快速推荐','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('73','changeStatus','快速审核','0','','0','60','3');
INSERT INTO `pa_node` VALUES ('74','changePhoneStatus','手机推荐','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('75','checkProductTitle','标题检查','1','','0','60','3');
INSERT INTO `pa_node` VALUES ('76','changeAttr','快速推荐','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('77','changeStatus','快速审核','1','','0','26','3');
INSERT INTO `pa_node` VALUES ('78','Models','模型管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('79','index','模型列表','1','','0','78','3');
INSERT INTO `pa_node` VALUES ('80','add','添加模型','1','','0','78','3');
INSERT INTO `pa_node` VALUES ('81','Personal','会员管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('82','index','会员首页','1','','0','81','3');
INSERT INTO `pa_node` VALUES ('83','Forum','论坛管理','1','论坛管理','0','1','2');
INSERT INTO `pa_node` VALUES ('84','orderIndex','订单管理','1','','0','81','3');
INSERT INTO `pa_node` VALUES ('85','forumpic','论坛图片管理','1','论坛图片','0','85','3');
INSERT INTO `pa_node` VALUES ('86','index','论坛管理','1','','0','86','3');
INSERT INTO `pa_node` VALUES ('87','index','论坛管理首页','1','','0','83','3');
INSERT INTO `pa_node` VALUES ('88','Subject','课程管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('89','Tag','标签管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('90','index','课程列表','1','','0','88','3');
INSERT INTO `pa_node` VALUES ('91','index','标签首页','1','','0','89','3');
INSERT INTO `pa_node` VALUES ('92','forumpic','论坛图片','1','','0','83','3');
INSERT INTO `pa_node` VALUES ('93','Activity','活动管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('94','indexMatch','活动管理-比赛','1','','0','93','3');
INSERT INTO `pa_node` VALUES ('95','indexMatchPIC','活动管理-比赛-图片','1','','0','93','3');
INSERT INTO `pa_node` VALUES ('96','edit','编辑活动','1','','0','93','3');
INSERT INTO `pa_node` VALUES ('97','school','院校管理','1','','0','1','2');
INSERT INTO `pa_node` VALUES ('98','index','院校列表','1','','0','97','3');
INSERT INTO `pa_node` VALUES ('99','add','添加院校','1','','0','97','3');


# 数据库表：pa_order 数据信息
INSERT INTO `pa_order` VALUES ('24','','','','','','24','','1516280644','','1','2','10.00','message','','','25','0.20','20.00');
INSERT INTO `pa_order` VALUES ('25','','','','','','24','','1516280657','','1','2','10.00','message','','','25','0.20','20.00');
INSERT INTO `pa_order` VALUES ('26','','','','','','24','','1516328418','','1','2','10.00','message','','','25','0.20','20.00');
INSERT INTO `pa_order` VALUES ('27','','','','','','24','','1516328440','','1','2','10.00','message','','','25','0.20','20.00');
INSERT INTO `pa_order` VALUES ('28','','','','','','24','','1516328445','','1','2','10.00','message','','','25','0.20','20.00');
INSERT INTO `pa_order` VALUES ('29','','','','','','24','','1516328446','','1','2','10.00','message','','','25','0.20','20.00');
INSERT INTO `pa_order` VALUES ('42','','4','','','','24','','1516352117','','1','5','','gift','','','25','0.20','0.00');
INSERT INTO `pa_order` VALUES ('46','','45','大炮','/Uploads/image/product/20171211/20171211035918_78422.png','','24','','1516352284','','1','5','25.00','gift','','','25','0.20','125.00');
INSERT INTO `pa_order` VALUES ('60','','','video','','','24','','1516671194','','1','10','300.00','','账户余额','','34','0.20','3000.00');
INSERT INTO `pa_order` VALUES ('61','','','','','','24','','1516673271','','1','10','300.00','video','账户余额','','34','0.20','3000.00');
INSERT INTO `pa_order` VALUES ('63','','','','','','24','','1516674088','','1','10','300.00','video','账户余额','','41','0.20','3000.00');
INSERT INTO `pa_order` VALUES ('64','','','','','','24','','1516674109','','1','10','300.00','video','账户余额','','41','0.20','3000.00');
INSERT INTO `pa_order` VALUES ('65','','','','','','42','','1516687387','','1','701405','300.00','video','账户余额','','41','0.20','99999999.99');
INSERT INTO `pa_order` VALUES ('66','','','','','','42','','1516688416','','1','24','300.00','video','账户余额','','41','0.20','7200.00');
INSERT INTO `pa_order` VALUES ('67','','','','','','41','','1516688638','','1','25','300.00','video','账户余额','','42','0.20','7500.00');
INSERT INTO `pa_order` VALUES ('68','','','','','','41','','1516688965','','1','96','300.00','video','账户余额','','42','0.20','28800.00');
INSERT INTO `pa_order` VALUES ('69','','','','','','41','','1516689177','','1','11','300.00','video','账户余额','','42','0.20','3300.00');
INSERT INTO `pa_order` VALUES ('70','','','','','','42','','1516689339','','1','15','300.00','video','账户余额','','41','0.20','4500.00');
INSERT INTO `pa_order` VALUES ('71','','','','','','41','','1516689677','','1','10','300.00','video','账户余额','','42','0.20','3000.00');
INSERT INTO `pa_order` VALUES ('72','','','','','','41','','1516691502','','1','1','300.00','video','账户余额','','42','0.20','300.00');
INSERT INTO `pa_order` VALUES ('76','','','','','','41','','1516691753','','1','2','300.00','video','账户余额','','42','0.20','600.00');
INSERT INTO `pa_order` VALUES ('77','','','','','','42','','1516691922','','1','11764','300.00','video','账户余额','','41','0.20','3529200.00');
INSERT INTO `pa_order` VALUES ('83','','','','','','42','','1516692205','','1','11769','300.00','video','账户余额','','41','0.20','3530700.00');
INSERT INTO `pa_order` VALUES ('84','','','','','','42','','1516692361','','1','11771','300.00','video','账户余额','','41','0.20','3531300.00');
INSERT INTO `pa_order` VALUES ('85','','','','','','42','','1516692496','','1','11774','300.00','video','账户余额','','41','0.20','3532200.00');
INSERT INTO `pa_order` VALUES ('86','','','','','','42','','1516693009','','1','11781','300.00','video','账户余额','','41','0.20','3534300.00');
INSERT INTO `pa_order` VALUES ('87','','','','','小蝌蚪1','41','','1516765788','','1','12189','300.00','video','账户余额','小蝌蚪2','42','0.20','3656700.00');
INSERT INTO `pa_order` VALUES ('88','','56','小翅膀','/Uploads/image/product/20171211/20171211035516_45908.png','','41','','1516771366','','1','1','7.00','gift','','','42','0.20','7.00');
INSERT INTO `pa_order` VALUES ('89','','52','亲','/Uploads/image/product/20171211/20171211035729_23699.png','','41','','1516771369','','1','1','8.00','gift','','','42','0.20','8.00');
INSERT INTO `pa_order` VALUES ('90','','51','钻石','/Uploads/image/product/20171211/20171211035759_53838.png','','41','','1516771372','','1','1','15.00','gift','','','42','0.20','15.00');
INSERT INTO `pa_order` VALUES ('91','','57','大翅膀','/Uploads/image/product/20171211/20171211035404_86799.png','','41','','1516771377','','1','1','10.00','gift','','','42','0.20','10.00');
INSERT INTO `pa_order` VALUES ('92','','54','玫瑰','/Uploads/image/product/20171211/20171211035641_50240.png','','41','','1516771587','','1','1','5.00','gift','','','42','0.20','5.00');
INSERT INTO `pa_order` VALUES ('93','','52','亲','/Uploads/image/product/20171211/20171211035729_23699.png','','41','','1516771590','','1','1','8.00','gift','','','42','0.20','8.00');
INSERT INTO `pa_order` VALUES ('94','','57','大翅膀','/Uploads/image/product/20171211/20171211035404_86799.png','','41','','1516771592','','1','1','10.00','gift','','','42','0.20','10.00');
INSERT INTO `pa_order` VALUES ('95','','54','玫瑰','/Uploads/image/product/20171211/20171211035641_50240.png','','41','','1516771611','','1','1','5.00','gift','','','42','0.20','5.00');
INSERT INTO `pa_order` VALUES ('96','','53','荧光棒','/Uploads/image/product/20171211/20171211035705_89565.png','','41','','1516771796','','1','1','3.00','gift','','','42','0.20','3.00');
INSERT INTO `pa_order` VALUES ('97','','','','','小蝌蚪1','41','','1516773590','','1','5211','300.00','video','账户余额','骚货','45','0.20','1563300.00');
INSERT INTO `pa_order` VALUES ('98','','','','','小蝌蚪1','41','','1516773815','','1','5215','300.00','video','账户余额','骚货','45','0.20','1564500.00');
INSERT INTO `pa_order` VALUES ('99','','','','','小蝌蚪1','41','','1516774025','','1','5218','300.00','video','账户余额','骚货','45','0.20','1565400.00');
INSERT INTO `pa_order` VALUES ('100','','','','','小蝌蚪1','41','','1516774489','','1','5226','300.00','video','账户余额','骚货','45','0.20','1567800.00');
INSERT INTO `pa_order` VALUES ('101','','56','小翅膀','/Uploads/image/product/20171211/20171211035516_45908.png','','41','','1516775130','','1','1','7.00','gift','','','42','0.20','7.00');
INSERT INTO `pa_order` VALUES ('102','','56','小翅膀','/Uploads/image/product/20171211/20171211035516_45908.png','','41','','1516775493','','1','1','7.00','gift','','','42','0.20','7.00');
INSERT INTO `pa_order` VALUES ('103','','52','亲','/Uploads/image/product/20171211/20171211035729_23699.png','','41','','1516775516','','1','1','8.00','gift','','','42','0.20','8.00');
INSERT INTO `pa_order` VALUES ('104','','','','','小蝌蚪1','41','','1516776076','','1','5252','300.00','video','账户余额','骚货','45','0.20','1575600.00');
INSERT INTO `pa_order` VALUES ('105','','','','','小蝌蚪1','41','','1516776269','','1','5256','300.00','video','账户余额','骚货','45','0.20','1576800.00');
INSERT INTO `pa_order` VALUES ('106','','','','','小蝌蚪1','41','','1516777221','','1','5272','300.00','video','账户余额','骚货','45','0.20','1581600.00');
INSERT INTO `pa_order` VALUES ('107','','','','','小蝌蚪1','41','','1516778169','','1','5287','300.00','video','账户余额','骚货','45','0.20','1586100.00');
INSERT INTO `pa_order` VALUES ('108','','','','','小蝌蚪1','41','','1516778350','','1','5290','300.00','video','账户余额','骚货','45','0.20','1587000.00');
INSERT INTO `pa_order` VALUES ('109','','','','','小蝌蚪1','41','','1516779118','','1','5303','300.00','video','账户余额','骚货','45','0.20','1590900.00');
INSERT INTO `pa_order` VALUES ('110','','','','','小蝌蚪1','41','','1516779217','','1','5305','300.00','video','账户余额','骚货','45','0.20','1591500.00');
INSERT INTO `pa_order` VALUES ('111','','','','','小蝌蚪1','41','','1516779885','','1','5316','300.00','video','账户余额','骚货','45','0.20','1594800.00');
INSERT INTO `pa_order` VALUES ('112','','','','','小蝌蚪1','41','','1516780389','','1','5324','300.00','video','账户余额','骚货','45','0.20','1597200.00');
INSERT INTO `pa_order` VALUES ('113','','','','','小蝌蚪1','41','','1516780495','','1','5326','300.00','video','账户余额','骚货','45','0.20','1597800.00');
INSERT INTO `pa_order` VALUES ('114','','','','','小蝌蚪1','41','','1516780921','','1','5333','300.00','video','账户余额','骚货','45','0.20','1599900.00');
INSERT INTO `pa_order` VALUES ('115','','','','','小蝌蚪1','41','','1516780953','','1','5334','300.00','video','账户余额','骚货','45','0.20','1600200.00');
INSERT INTO `pa_order` VALUES ('116','','','','','小蝌蚪1','41','','1516781193','','1','5338','300.00','video','账户余额','骚货','45','0.20','1601400.00');
INSERT INTO `pa_order` VALUES ('117','','','','','小蝌蚪1','41','','1516781651','','1','5345','300.00','video','账户余额','骚货','45','0.20','1603500.00');
INSERT INTO `pa_order` VALUES ('118','','47','飞机','/Uploads/image/product/20171211/20171211035858_68889.png','','41','','1516782421','','1','1','30.00','gift','','','42','0.20','30.00');
INSERT INTO `pa_order` VALUES ('119','','','','','骚货','45','','1516786638','','1','5428','300.00','video','账户余额','小蝌蚪1','41','0.20','1628400.00');
INSERT INTO `pa_order` VALUES ('120','','','','','骚货','45','','1516794332','','1','5537','300.00','video','账户余额','小蝌蚪1','41','0.20','1661100.00');
INSERT INTO `pa_order` VALUES ('121','','','','','骚货','45','','1516795423','','1','5555','300.00','video','账户余额','小蝌蚪1','41','0.20','1666500.00');
INSERT INTO `pa_order` VALUES ('122','','','','','骚货','45','','1516796490','','1','5573','300.00','video','账户余额','小蝌蚪1','41','0.20','1671900.00');
INSERT INTO `pa_order` VALUES ('123','','','','','骚货','45','','1516798109','','1','5600','300.00','video','账户余额','小蝌蚪1','41','0.20','1680000.00');
INSERT INTO `pa_order` VALUES ('124','','','','','骚货','45','','1516798524','','1','5607','300.00','video','账户余额','小蝌蚪1','41','0.20','1682100.00');
INSERT INTO `pa_order` VALUES ('125','','','','','骚货','45','','1516798552','','1','5608','300.00','video','账户余额','小蝌蚪1','41','0.20','1682400.00');
INSERT INTO `pa_order` VALUES ('126','','','','','骚货','45','','1516798871','','1','5613','300.00','video','账户余额','小蝌蚪1','41','0.20','1683900.00');
INSERT INTO `pa_order` VALUES ('127','','','','','骚货','45','','1516798939','','1','5614','300.00','video','账户余额','小蝌蚪1','41','0.20','1684200.00');
INSERT INTO `pa_order` VALUES ('128','','','','','骚货','45','','1516799497','','1','5623','300.00','video','账户余额','小蝌蚪1','41','0.20','1686900.00');
INSERT INTO `pa_order` VALUES ('129','','51','钻石','/Uploads/image/product/20171211/20171211035759_53838.png','','42','','1516859879','','1','1','15.00','gift','','','43','0.20','15.00');
INSERT INTO `pa_order` VALUES ('130','','50','跑车','/Uploads/image/product/20171211/20171211035833_94166.png','','42','','1516859881','','1','1','20.00','gift','','','43','0.20','20.00');
INSERT INTO `pa_order` VALUES ('131','','57','大翅膀','/Uploads/image/product/20171211/20171211035404_86799.png','','42','','1516859884','','1','1','10.00','gift','','','43','0.20','10.00');
INSERT INTO `pa_order` VALUES ('132','','47','飞机','/Uploads/image/product/20171211/20171211035858_68889.png','','42','','1516859900','','1','1','30.00','gift','','','43','0.20','30.00');
INSERT INTO `pa_order` VALUES ('133','','52','亲','/Uploads/image/product/20171211/20171211035729_23699.png','','42','','1516859923','','1','1','8.00','gift','','','41','0.20','8.00');
INSERT INTO `pa_order` VALUES ('134','','57','大翅膀','/Uploads/image/product/20171211/20171211035404_86799.png','','42','','1516859925','','1','1','10.00','gift','','','41','0.20','10.00');
INSERT INTO `pa_order` VALUES ('135','','56','小翅膀','/Uploads/image/product/20171211/20171211035516_45908.png','','42','','1516861526','','1','1','7.00','gift','','','45','0.20','7.00');
INSERT INTO `pa_order` VALUES ('136','','','','','小蝌蚪2','42','','1516862554','','1','6003','300.00','video','账户余额','继续继续','45','0.20','1800900.00');
INSERT INTO `pa_order` VALUES ('137','','','','','','34','','1516863841','','1','18','300.00','video','账户余额','','24','0.20','5400.00');
INSERT INTO `pa_order` VALUES ('138','','','','','','34','','1516864227','','1','18','300.00','video','账户余额','','24','0.20','5400.00');
INSERT INTO `pa_order` VALUES ('140','','','','','小蝌蚪1','41','','1516866390','','1','18','300.00','video','账户余额','骚货','45','0.20','5400.00');
INSERT INTO `pa_order` VALUES ('141','','','','','小蝌蚪2','42','','1516866511','','1','1','300.00','video','账户余额','继续继续','45','0.20','300.00');
INSERT INTO `pa_order` VALUES ('142','','','','','小蝌蚪1','41','','1516866636','','1','18','300.00','video','账户余额','骚货','45','0.20','5400.00');
INSERT INTO `pa_order` VALUES ('144','','','','','小蝌蚪2','42','','1516868382','','1','18','300.00','video','账户余额','继续继续','45','0.20','5400.00');
INSERT INTO `pa_order` VALUES ('146','Y15168688345870','51','','','小蝌蚪2','42','','1516868834','','1','1','15.00','','','继续继续','45','','15.00');
INSERT INTO `pa_order` VALUES ('147','Y15168688345870','51','钻石','/Uploads/image/product/20171211/20171211035759_53838.png','小蝌蚪2','42','','1516868834','','1','1','15.00','gift','','继续继续','45','0.20','15.00');
INSERT INTO `pa_order` VALUES ('148','Q15168688377861','57','','','小蝌蚪2','42','','1516868837','','1','1','10.00','','','继续继续','45','','10.00');
INSERT INTO `pa_order` VALUES ('149','Q15168688377861','57','大翅膀','/Uploads/image/product/20171211/20171211035404_86799.png','小蝌蚪2','42','','1516868837','','1','1','10.00','gift','','继续继续','45','0.20','10.00');
INSERT INTO `pa_order` VALUES ('150','R15168688558826','52','','','小蝌蚪2','42','','1516868855','','1','1','8.00','','','继续继续','45','','8.00');
INSERT INTO `pa_order` VALUES ('151','R15168688558826','52','亲','/Uploads/image/product/20171211/20171211035729_23699.png','小蝌蚪2','42','','1516868855','','1','1','8.00','gift','','继续继续','45','0.20','8.00');
INSERT INTO `pa_order` VALUES ('152','R15168688943551','53','','','小蝌蚪2','42','','1516868894','','1','1','3.00','','','继续继续','45','','3.00');
INSERT INTO `pa_order` VALUES ('153','R15168688943551','53','荧光棒','/Uploads/image/product/20171211/20171211035705_89565.png','小蝌蚪2','42','','1516868894','','1','1','3.00','gift','','继续继续','45','0.20','3.00');
INSERT INTO `pa_order` VALUES ('157','','','','','骚货','45','','1516869209','','1','2','300.00','video','账户余额','小蝌蚪1','41','0.20','600.00');
INSERT INTO `pa_order` VALUES ('158','','','','','骚货','45','','1516869337','','1','3','300.00','video','账户余额','小蝌蚪1','41','0.20','900.00');
INSERT INTO `pa_order` VALUES ('159','','','','','骚货','45','','1516869377','','1','1','300.00','video','账户余额','小蝌蚪1','41','0.20','300.00');
INSERT INTO `pa_order` VALUES ('160','','','','','小蝌蚪2','42','','1516869423','','1','1','300.00','video','账户余额','继续继续','45','0.20','300.00');
INSERT INTO `pa_order` VALUES ('161','','','','','继续继续','45','','1516871861','','1','1','300.00','video','账户余额','小蝌蚪2','42','0.20','300.00');
INSERT INTO `pa_order` VALUES ('162','R15168751766709','53','','','小蝌蚪2','42','','1516875176','','1','1','3.00','','','继续继续','45','','3.00');
INSERT INTO `pa_order` VALUES ('163','R15168751766709','53','荧光棒','/Uploads/image/product/20171211/20171211035705_89565.png','小蝌蚪2','42','','1516875176','','1','1','3.00','gift','','继续继续','45','0.20','3.00');
INSERT INTO `pa_order` VALUES ('164','C15168830166652','','message','','小蝌蚪2','42','','1516883016','','1','','10.00','','账户余额','','45','0.20','0.00');
INSERT INTO `pa_order` VALUES ('165','W15168830381450','53','','','小蝌蚪2','42','','1516883038','','1','1','3.00','','','继续继续','45','','3.00');
INSERT INTO `pa_order` VALUES ('166','W15168830381450','53','荧光棒','/Uploads/image/product/20171211/20171211035705_89565.png','小蝌蚪2','42','','1516883038','','1','1','3.00','gift','','继续继续','45','0.20','3.00');
INSERT INTO `pa_order` VALUES ('167','B15168830924925','','message','','小蝌蚪2','42','','1516883092','','1','','10.00','','账户余额','','45','0.20','0.00');
INSERT INTO `pa_order` VALUES ('168','G15168832456582','','message','','8544564','24','','1516883245','','1','','10.00','','账户余额','','42','0.20','0.00');
INSERT INTO `pa_order` VALUES ('169','E15168832664173','','message','','8544564','24','','1516883266','','1','','10.00','','账户余额','','42','0.20','0.00');
INSERT INTO `pa_order` VALUES ('170','C15168832999940','','message','','8544564','24','','1516883299','','1','','10.00','','账户余额','小蝌蚪2','42','0.20','0.00');
INSERT INTO `pa_order` VALUES ('171','A15168833048699','','message','','8544564','24','','1516883304','','1','','10.00','','账户余额','小蝌蚪2','42','0.20','0.00');
INSERT INTO `pa_order` VALUES ('172','C15168833108260','','message','','8544564','24','','1516883310','','1','','10.00','','账户余额','小蝌蚪2','42','0.20','0.00');
INSERT INTO `pa_order` VALUES ('173','C15168833108260','','message','','8544564','24','','1516883310','','1','','10.00','','账户余额','小蝌蚪2','42','0.20','0.00');
INSERT INTO `pa_order` VALUES ('174','Z15168833391291','','message','','8544564','24','','1516883339','','1','','10.00','','账户余额','小蝌蚪2','42','0.20','0.00');
INSERT INTO `pa_order` VALUES ('175','Q1516883454801','','message','','8544564','24','','1516883454','','1','1','10.00','','账户余额','小蝌蚪2','42','0.20','10.00');
INSERT INTO `pa_order` VALUES ('176','D15168834813892','','message','','小蝌蚪2','42','','1516883481','','1','1','10.00','','账户余额','继续继续','45','0.20','10.00');
INSERT INTO `pa_order` VALUES ('177','L15168835707443','','message','','小蝌蚪2','42','','1516883570','','1','1','10.00','','账户余额','继续继续','45','0.20','10.00');
INSERT INTO `pa_order` VALUES ('178','X15168835834185','','message','','小蝌蚪2','42','','1516883583','','1','1','10.00','','账户余额','继续继续','45','0.20','10.00');
INSERT INTO `pa_order` VALUES ('179','E15168836137937','','message','','小蝌蚪2','42','','1516883613','','1','1','10.00','','账户余额','继续继续','45','0.20','10.00');
INSERT INTO `pa_order` VALUES ('180','T1516884165407','','亲密币充值','','8544564','24','0','1516884165','','1','1','0.50','recharge','微信','','','','');
INSERT INTO `pa_order` VALUES ('181','R15168841748646','','亲密币充值','','8544564','24','0','1516884174','','1','1','0.50','recharge','微信','','','','');
INSERT INTO `pa_order` VALUES ('182','R15168843961379','','亲密币充值','','8544564','24','0','1516884396','','1','1','0.50','recharge','微信','','','','');
INSERT INTO `pa_order` VALUES ('183','D15168845347225','','亲密币充值','','哈撒ki1','25','0','1516884534','','1','1','30.00','recharge','微信','','','','');
INSERT INTO `pa_order` VALUES ('184','S15168845966572','','亲密币充值','','哈撒ki1','25','0','1516884596','','1','1','30.00','recharge','微信','','','','');
INSERT INTO `pa_order` VALUES ('185','Q15168847937611','','message','','小蝌蚪2','42','','1516884793','','1','1','10.00','','账户余额','继续继续','45','0.20','10.00');
INSERT INTO `pa_order` VALUES ('186','I15168860127807','','亲密币充值','','小蝌蚪1','41','0','1516886012','','1','1','50.00','recharge','微信','','','','');
INSERT INTO `pa_order` VALUES ('187','','','','','继续继续','45','','1516886253','','1','1','300.00','video','账户余额','小蝌蚪2','42','0.20','300.00');
INSERT INTO `pa_order` VALUES ('188','B15169305773894','','message','','小蝌蚪2','42','','1516930577','','1','1','10.00','','账户余额','继续继续','45','0.20','10.00');
INSERT INTO `pa_order` VALUES ('189','H15169312715450','','message','','小蝌蚪2','42','','1516931271','','1','1','10.00','','账户余额','继续继续','45','0.20','10.00');
INSERT INTO `pa_order` VALUES ('190','G15169319416351','','message','','小蝌蚪2','42','','1516931941','','1','1','10.00','','账户余额','继续继续','45','0.20','10.00');
INSERT INTO `pa_order` VALUES ('191','D15169672325987','51','','','8544564','24','','1516967232','','1','2','15.00','','','小蝌蚪1','41','','30.00');
INSERT INTO `pa_order` VALUES ('192','D15169672325987','51','钻石','/Uploads/image/product/20171211/20171211035759_53838.png','8544564','24','','1516967232','','1','2','15.00','gift','','小蝌蚪1','41','0.20','30.00');
INSERT INTO `pa_order` VALUES ('199','','','','','8544564','24','','1517030154','','1','1','2.00','video','账户余额','艺虫','1','0.00','2.00');
INSERT INTO `pa_order` VALUES ('200','','','直播付费','','8544564','24','','1517030799','','1','1','2.00','video','账户余额','艺虫','1','0.00','2.00');
INSERT INTO `pa_order` VALUES ('201','','','直播付费','','8544564','24','','1517031558','','1','1','2.00','video','账户余额','艺虫','1','0.00','2.00');
INSERT INTO `pa_order` VALUES ('202','','','直播付费','','8544564','24','','1517031614','','1','1','2.00','video','账户余额','艺虫','1','0.00','2.00');
INSERT INTO `pa_order` VALUES ('204','','','直播付费','','8544564','24','','1517031852','','1','1','2.00','video','账户余额','艺虫','1','0.00','2.00');
INSERT INTO `pa_order` VALUES ('205','N15172842591981','51','','','小蝌蚪1','41','','1517284259','','1','2','15.00','','','木木','24','','30.00');
INSERT INTO `pa_order` VALUES ('206','N15172842591981','51','钻石','/Uploads/image/product/20171211/20171211035759_53838.png','小蝌蚪1','41','','1517284259','','1','2','15.00','gift','','木木','24','0.20','30.00');
INSERT INTO `pa_order` VALUES ('207','W15172842778716','51','','','小蝌蚪1','41','','1517284277','','1','2','15.00','','','木木','24','','30.00');
INSERT INTO `pa_order` VALUES ('208','W15172842778716','51','钻石','/Uploads/image/product/20171211/20171211035759_53838.png','小蝌蚪1','41','','1517284277','','1','2','15.00','gift','','木木','24','0.20','30.00');
INSERT INTO `pa_order` VALUES ('209','P15172843219699','51','','','小蝌蚪1','41','','1517284321','','1','2','15.00','','','木木','24','','30.00');
INSERT INTO `pa_order` VALUES ('211','J15172843426395','51','','','小蝌蚪1','41','','1517284342','','1','2','15.00','','','木木','24','','30.00');
INSERT INTO `pa_order` VALUES ('213','W15172845031578','51','','','小蝌蚪1','41','','1517284503','','1','2','15.00','','','木木','24','','30.00');
INSERT INTO `pa_order` VALUES ('214','W15172845031578','51','钻石','/Uploads/image/product/20171211/20171211035759_53838.png','小蝌蚪1','41','','1517284503','','1','2','15.00','gift','','木木','24','0.20','30.00');
INSERT INTO `pa_order` VALUES ('215','L15172845065155','51','','','小蝌蚪1','41','','1517284506','','1','2','15.00','','','木木','24','','30.00');
INSERT INTO `pa_order` VALUES ('216','L15172845065155','51','钻石','/Uploads/image/product/20171211/20171211035759_53838.png','小蝌蚪1','41','','1517284506','','1','2','15.00','gift','','木木','24','0.20','30.00');
INSERT INTO `pa_order` VALUES ('217','I1517315933675','54','','','木木','24','','1517315933','','1','22','5.00','','','小蝌蚪1','41','','110.00');
INSERT INTO `pa_order` VALUES ('218','I1517315933675','54','玫瑰','/Uploads/image/product/20171211/20171211035641_50240.png','木木','24','','1517315933','','1','22','5.00','gift','','小蝌蚪1','41','0.20','110.00');
INSERT INTO `pa_order` VALUES ('219','U15173159488299','52','','','木木','24','','1517315948','','1','22','8.00','','','小蝌蚪1','41','','176.00');
INSERT INTO `pa_order` VALUES ('220','U15173159488299','52','亲','/Uploads/image/product/20171211/20171211035729_23699.png','木木','24','','1517315948','','1','22','8.00','gift','','小蝌蚪1','41','0.20','176.00');
INSERT INTO `pa_order` VALUES ('221','T15173159557870','57','','','木木','24','','1517315955','','1','22','10.00','','','小蝌蚪1','41','','220.00');
INSERT INTO `pa_order` VALUES ('222','T15173159557870','57','大翅膀','/Uploads/image/product/20171211/20171211035404_86799.png','木木','24','','1517315955','','1','22','10.00','gift','','小蝌蚪1','41','0.20','220.00');
INSERT INTO `pa_order` VALUES ('223','N15173159596653','57','','','木木','24','','1517315959','','1','22','10.00','','','小蝌蚪1','41','','220.00');
INSERT INTO `pa_order` VALUES ('224','N15173159596653','57','大翅膀','/Uploads/image/product/20171211/20171211035404_86799.png','木木','24','','1517315959','','1','22','10.00','gift','','小蝌蚪1','41','0.20','220.00');
INSERT INTO `pa_order` VALUES ('225','','','直播付费','','木木','24','','1517388987','','1','1','50.00','video','账户余额','哈撒ki1','25','0.00','50.00');
INSERT INTO `pa_order` VALUES ('226','','','直播付费','','木木','24','','1517389092','','1','1','50.00','video','账户余额','哈撒ki1','25','0.00','50.00');
INSERT INTO `pa_order` VALUES ('227','','','直播付费','','木木','24','','1517389395','','1','1','50.00','video','账户余额','哈撒ki1','25','0.00','50.00');
INSERT INTO `pa_order` VALUES ('228','','','直播付费','','木木','24','','1517389459','','1','1','50.00','video','账户余额','哈撒ki1','25','0.00','50.00');
INSERT INTO `pa_order` VALUES ('229','','','直播付费','','木木','24','','1517389523','','1','1','50.00','video','账户余额','哈撒ki1','25','0.00','50.00');
INSERT INTO `pa_order` VALUES ('230','','','直播付费','','木木','24','','1517389584','','1','1','50.00','video','账户余额','哈撒ki1','25','0.00','50.00');
INSERT INTO `pa_order` VALUES ('231','','','直播付费','','木木','24','','1517390012','','1','1','50.00','video','账户余额','哈撒ki1','25','0.00','50.00');
INSERT INTO `pa_order` VALUES ('232','','','直播付费','','木木','24','','1517390409','','1','1','10.00','video','账户余额','木木','24','0.00','10.00');
INSERT INTO `pa_order` VALUES ('233','','','直播付费','','木木','24','','1517390694','','1','1','10.00','video','账户余额','木木','24','0.00','10.00');
INSERT INTO `pa_order` VALUES ('234','','','直播付费','','木木','24','','1517396957','','1','1','50.00','video','账户余额','哈撒ki1','25','0.00','50.00');
INSERT INTO `pa_order` VALUES ('235','','','直播付费','','木木','24','','1517397214','','1','1','50.00','video','账户余额','哈撒ki1','25','0.00','50.00');
INSERT INTO `pa_order` VALUES ('236','','','直播付费','','木木','24','','1517397318','','1','1','50.00','video','账户余额','哈撒ki1','25','0.00','50.00');
INSERT INTO `pa_order` VALUES ('237','','','直播付费','','木木','24','','1517397395','','1','1','50.00','video','账户余额','哈撒ki1','25','0.00','50.00');
INSERT INTO `pa_order` VALUES ('238','Z15173974873127','54','','','木木','24','','1517397487','','1','1','5.00','','','哈撒ki1','25','','5.00');
INSERT INTO `pa_order` VALUES ('239','Z15173974873127','54','玫瑰','/Uploads/image/product/20171211/20171211035641_50240.png','木木','24','','1517397487','','1','1','5.00','gift','','哈撒ki1','25','0.20','5.00');
INSERT INTO `pa_order` VALUES ('240','K15173975087651','54','','','木木','24','','1517397508','','1','1','5.00','','','哈撒ki1','25','','5.00');
INSERT INTO `pa_order` VALUES ('241','K15173975087651','54','玫瑰','/Uploads/image/product/20171211/20171211035641_50240.png','木木','24','','1517397508','','1','1','5.00','gift','','哈撒ki1','25','0.20','5.00');
INSERT INTO `pa_order` VALUES ('242','R15173977116697','54','','','木木','24','','1517397711','','1','22','5.00','','','哈撒ki1','25','','110.00');
INSERT INTO `pa_order` VALUES ('243','R15173977116697','54','玫瑰','/Uploads/image/product/20171211/20171211035641_50240.png','木木','24','','1517397711','','1','22','5.00','gift','','哈撒ki1','25','0.20','110.00');
INSERT INTO `pa_order` VALUES ('244','B15173977217102','50','','','木木','24','','1517397721','','1','22','20.00','','','哈撒ki1','25','','440.00');
INSERT INTO `pa_order` VALUES ('245','B15173977217102','50','跑车','/Uploads/image/product/20171211/20171211035833_94166.png','木木','24','','1517397721','','1','22','20.00','gift','','哈撒ki1','25','0.20','440.00');
INSERT INTO `pa_order` VALUES ('246','M15173977368638','50','','','木木','24','','1517397736','','1','22','20.00','','','哈撒ki1','25','','440.00');
INSERT INTO `pa_order` VALUES ('247','M15173977368638','50','跑车','/Uploads/image/product/20171211/20171211035833_94166.png','木木','24','','1517397736','','1','22','20.00','gift','','哈撒ki1','25','0.20','440.00');
INSERT INTO `pa_order` VALUES ('248','','','直播付费','','木木','24','','1517397760','','1','1','50.00','video','账户余额','哈撒ki1','25','0.00','50.00');
INSERT INTO `pa_order` VALUES ('249','','','直播付费','','木木','24','','1517397947','','1','1','50.00','video','账户余额','哈撒ki1','25','0.00','50.00');
INSERT INTO `pa_order` VALUES ('251','S15174008128949','55','猴','/Uploads/image/product/20171211/20171211035607_30393.png','木木','24','','1517400812','','1','12','12.00','gift','','木木','24','0.20','144.00');
INSERT INTO `pa_order` VALUES ('257','K15174010175795','55','猴','/Uploads/image/product/20171211/20171211035607_30393.png','木木','24','','1517401017','','1','12','12.00','gift','','木木','24','0.20','144.00');
INSERT INTO `pa_order` VALUES ('259','B15174010388796','55','猴','/Uploads/image/product/20171211/20171211035607_30393.png','木木','24','','1517401038','','1','12','12.00','gift','','木木','24','0.20','144.00');
INSERT INTO `pa_order` VALUES ('261','R15174011408653','55','猴','/Uploads/image/product/20171211/20171211035607_30393.png','木木','24','','1517401140','','1','12','12.00','gift','','木木','24','0.20','144.00');
INSERT INTO `pa_order` VALUES ('262','G15174013682987','55','猴','/Uploads/image/product/20171211/20171211035607_30393.png','木木','24','','1517401368','','1','12','12.00','gift','','木木','24','0.20','144.00');
INSERT INTO `pa_order` VALUES ('263','','','直播付费','','木木','24','','1517401432','','1','1','2.00','video','账户余额','艺虫','1','0.00','2.00');
INSERT INTO `pa_order` VALUES ('264','D15174027471705','55','猴','/Uploads/image/product/20171211/20171211035607_30393.png','木木','24','','1517402747','','1','12','12.00','gift','账户余额','木木','24','0.20','144.00');
INSERT INTO `pa_order` VALUES ('265','H15174028618068','55','猴','/Uploads/image/product/20171211/20171211035607_30393.png','木木','24','','1517402861','','1','12','12.00','gift','账户余额','木木','24','0.20','144.00');
INSERT INTO `pa_order` VALUES ('266','N15174028911971','55','猴','/Uploads/image/product/20171211/20171211035607_30393.png','哈撒ki1','25','','1517402891','','1','12','12.00','gift','账户余额','木木','24','0.20','144.00');


# 数据库表：pa_page 数据信息


# 数据库表：pa_pay 数据信息
INSERT INTO `pa_pay` VALUES ('0','支付宝','','MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArSdZjAK5glT8J3JKliPo431VrOGB2zzFCjIDXvm37txT+xF/zQVISaQ5l8qfjimqmLlAs4p3p7ebl5cKReMK+c+mcrFX8AtClOxHhZ+29kxk7eIyLJ+G/AMYGdeO/liaVUcsMwS8lm1ZpfMReXGwt9TsaoAn9mBhI4OdrDTToZrf9NCDFHRxKVYmQcqg8nNQyDuWHy4dGdOhuD7WwW9','2017120400375638','http://47.92.53.249/index.php/Home/Defraya/obtain_info');


# 数据库表：pa_personal 数据信息
INSERT INTO `pa_personal` VALUES ('1','0','0','','0','0','/Public/Img/default/default.jpg','/Public/Img/default/bgdefault.jpg','15996585288','','','未填写','','未填写','0','XX大学','','2.00','202cb962ac59075b964b07152d234b70','艺虫','','0','用户','0','0','0','','1514872511','1512985614','','','','','3456e56ba49aaec681f1f522eb81d286','高中','','','0','0','IMDBx6lodLa85ZqVsGP9LxvYp1rwjElXUZ4Mhfq3sg3yvLyaoN','','0','1514872511','0');
INSERT INTO `pa_personal` VALUES ('2','0','0','','0','0','/Public/Img/default/default.jpg','/Public/Img/default/bgdefault.jpg','15996585266','','','未填写','','未填写','0','XX大学','','4900.00','202cb962ac59075b964b07152d234b70','艺虫','','0','用户','1','0','0','','1514965623','1512985487','','','','','0e60a67bd55e640fb7ada87292c4e73e','高中','','','0','0','WHBUT1oGbVuu02eDVXyLWRP35fCFiDJoUoIWDKjLGnROu6++DF','123','0','','0');
INSERT INTO `pa_personal` VALUES ('24','0','0','哈撒ki1','99','0','/Uploads/My/2018-01-29/170925a6f15bf416d3.png','/Public/Img/default/bgdefault.jpg','15134041905','中国','托儿所','北京第一幼儿园','播音','666','1','大学','铜仁学院','27690.00','103b70723e4dc645882f46323c2f6d44','木木','asdasdaaaz','1','老板','1','0','0','','1517464246','1511317819','132456@126.com','','','','c1e756782e9c3947d0c8fb65c3796bbb','高中','动画','','0','123456','jtcl+n+QcJj/oswCyMT/UxP35fCFiDJoUoIWDKjLGnQWNKR/+W','','0','1516320754','0');
INSERT INTO `pa_personal` VALUES ('25','0','0','大个','11','1','/Public/Img/default/default.jpg','/Public/Img/default/bgdefault.jpg','13691255667','中国','学前班','北京第二幼儿园','北京第三幼儿园','aasd','0','','','99973555.00','103b70723e4dc645882f46323c2f6d44','哈撒ki1','','2','用户','0','0','0','','1516885367','1511317903','','','','','be510c3754a2f4d681be6b1848769631','高中','动画','','0','0','i1zoQvu+2gBUuj5KD/whWhvYp1rwjElXUZ4Mhfq3sg0j9DVuWS','','0','','0');
INSERT INTO `pa_personal` VALUES ('26','0','0','','0','0','/Public/Img/default/default.jpg','/Public/Img/default/bgdefault.jpg','','','','未填写','','未填写','0','XX大学','','99999999.00','103b70723e4dc645882f46323c2f6d44','小二郎儿','','0','用户','1','0','0','','1516168417','1511528553','','','','','c29b6f3ac23042bccf6a39cb0c7bdda7','高中','体育','','0','0','1bkM7z4ni1iD5EYOd3xeRRP35fCFiDJoUoIWDKjLGnSJdNqDk5','','0','','0');
INSERT INTO `pa_personal` VALUES ('34','0','0','','0','1','/Uploads/My/2017-11-30/170965a1fbc37b9a42.png','/Public/Img/default/bgdefault.jpg','18311187548','内蒙古自治区','','清华大学','美术','600','1','家里蹲大学','','3899.00','','小鱼儿','','0','主播','1','0','0','','1513834738','1511604695','','','o7fm40s1Vx6Tw--eRHXxkhUKHHhs','','eab021f9749f6299dcd43f1405a0f962','七年八班','播音','','2','0','','','0','','0');
INSERT INTO `pa_personal` VALUES ('35','0','0','','0','0','https://q.qlogo.cn/qqapp/101426117/675762BA4945E38CC5422BCF6D0DD694/100','/Public/Img/default/bgdefault.jpg','13888888888','','','未填写','','未填写','0','XX大学','','9999999.00','','ALittleFish','','0','用户','0','0','0','','1513834309','1511838395','','675762BA4945E38CC5422BCF6D0DD694','','','11d09ba385c31621cea023ff7bc7384b','高中','体育','','1','0','','','0','','0');
INSERT INTO `pa_personal` VALUES ('36','0','0','','0','1','/Uploads/My/2017-12-16/75635a35001dc4aaa.png','/Public/Img/default/bgdefault.jpg','18311187547','黑龙江省','','传媒3','美术','999','1','lo','','9999999.00','103b70723e4dc645882f46323c2f6d44','123','','1','用户','1','0','0','','1513421834','1511923918','','','','','511cf3771a84951db0a5e6638c2d6673','九年十班','播音','','0','0','','','0','','0');
INSERT INTO `pa_personal` VALUES ('38','0','0','','0','0','/Public/Img/default/default.jpg','/Public/Img/default/bgdefault.jpg','13691255668','','','未填写','','未填写','0','XX大学','浙江传媒学院','999999.00','12f0285beee8ac7a44f869148d68552c','小二郎儿','','0','用户','1','0','0','','1512538597','1512536210','','','','','771f6c61e54347797b4d8c056d7efffc','高中','','','0','0','','','0','','0');
INSERT INTO `pa_personal` VALUES ('39','0','0','','0','0','/Public/Img/default/default.jpg','/Public/Img/default/bgdefault.jpg','13691255669','','','未填写','','未填写','0','XX大学','','9999999.00','103b70723e4dc645882f46323c2f6d44','小二郎儿','','0','用户','0','0','0','','1513648882','1512537516','','','','','dbeb1f3352ab1c21bfbe75f32b21d25d','高中','','','0','0','','','0','','0');
INSERT INTO `pa_personal` VALUES ('40','0','0','','0','0','/Public/Img/default/default.jpg','/Public/Img/default/bgdefault.jpg','13691255661','','','未填写','','未填写','0','XX大学','','999999.00','74b87337454200d4d33f80c4663dc5e5','小二郎儿','','0','用户','1','0','0','','1512537579','1512537552','','','','','2022bc902d128bfec8d522980301a6ee','高中','','','0','0','','','0','','0');
INSERT INTO `pa_personal` VALUES ('41','0','0','','0','0','/Uploads/My/2018-01-20/218275a6307785c017.png','/Public/Img/default/bgdefault.jpg','15231115232','','','未填写','','未填写','0','XX大学','','158859657.00','e10adc3949ba59abbe56e057f20f883e','小蝌蚪1','tu','0','tu','1','0','0','','1519719546','1516153603','','','','','b67482fffdd842fcc3c37c9e3f460005','高中','','','0','2573242','XP29X4nrUEJZnEfOf2agFhP35fCFiDJoUoIWDKjLGnRylydDs/','','0','','0');
INSERT INTO `pa_personal` VALUES ('42','0','0','','0','0','/Uploads/My/2018-01-31/262525a71b9bd3ea6e.png','/Public/Img/default/bgdefault.jpg','15801096620','','','未填写','','未填写','0','XX大学','','9998193365.00','e10adc3949ba59abbe56e057f20f883e','小蝌蚪2','','0','未填写','1','0','0','','1517455717','1516170853','','','','','43f56c5cc478e049cabe5e98ef1e646d','高中','','','0','1873168','+4dD9dkbZRaTDtEUMmYsaBP35fCFiDJoUoIWDKjLGnQWNKR/+W','','0','','0');
INSERT INTO `pa_personal` VALUES ('43','0','0','','0','','https://q.qlogo.cn/qqapp/101426117/715B36F28DFD24C297179A0A11B911DC/100','/Public/Img/default/bgdefault.jpg','','','','未填写','','未填写','0','XX大学','','999999.00','','折旧','','0','未填写','1','0','0','','0','1516187028','','715B36F28DFD24C297179A0A11B911DC','','','a861450ec19c1c418c5997902976353d','高中','','','1','','','','0','','0');
INSERT INTO `pa_personal` VALUES ('45','0','0','','0','1','/Uploads/My/2018-02-01/18405a72867408cc8.png','/Public/Img/default/bgdefault.jpg','18801149792',' 浙江省绍兴市','','未填写','','未填写','0','XX大学','','8560663.00','24797b24b3c418ef230f826c05d3724a','小猪一号','那些那些','2','模特','1','0','0','','1517466079','1516421173','','','','','6a2a46f378e85322f24f745320e4312d','高中','','','0','4272','eSf9/ttrwKrr3krsP+AulthLuphCWp3LFezqLVHfXDxnoUACiR','','0','2018','0');
INSERT INTO `pa_personal` VALUES ('46','0','0','','0','0','/Public/Img/default/default.jpg','/Public/Img/default/bgdefault.jpg','15010182746','','','未填写','','未填写','0','XX大学','','9999999.00','24797b24b3c418ef230f826c05d3724a','小蝌蚪','','0','未填写','1','0','0','','1516859195','1516424871','','','','','0d2de4556c8f991f129a3366afebe2fe','高中','','','0','885620','ewJER8qFyiWTDtEUMmYsaBP35fCFiDJoUoIWDKjLGnSJdNqDk5','','0','','0');


# 数据库表：pa_picarr 数据信息
INSERT INTO `pa_picarr` VALUES ('311','1514963112','0','/Uploads/Theme/2018-01-03/161615a4c80a8931ac.png','personal','51','0');
INSERT INTO `pa_picarr` VALUES ('2','1511243243','0','/Uploads/photo/2017-11-28/4.png','personal','23','0');
INSERT INTO `pa_picarr` VALUES ('3','1511243287','0','/Uploads/photo/2017-11-28/5.png','personal','23','0');
INSERT INTO `pa_picarr` VALUES ('309','1514361670','0','/Uploads/Theme/2017-12-27/264865a43534695423.png','personal','70','0');
INSERT INTO `pa_picarr` VALUES ('5','1511249581','0','/Uploads/photo/2017-11-28/9.png','personal','11','0');
INSERT INTO `pa_picarr` VALUES ('9','1511328412','0','/Uploads/photo/2017-11-28/3.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('308','1514189305','0','/Uploads/Theme/2017-12-25/76155a40b1f937da3.png','personal','56','0');
INSERT INTO `pa_picarr` VALUES ('307','1514189245','0','/Uploads/Theme/2017-12-25/230025a40b1bd4b050.png','personal','56','0');
INSERT INTO `pa_picarr` VALUES ('306','1514189189','0','/Uploads/Theme/2017-12-25/300715a40b1859f07a.png','personal','56','0');
INSERT INTO `pa_picarr` VALUES ('14','1511335862','0','/Uploads/photo/2017-11-28/16.png','institution','1','0');
INSERT INTO `pa_picarr` VALUES ('15','1511335862','0','/Uploads/photo/2017-11-28/13.png','institution','1','0');
INSERT INTO `pa_picarr` VALUES ('305','1514188500','0','/Uploads/Theme/2017-12-25/92285a40aed48196c.png','personal','56','0');
INSERT INTO `pa_picarr` VALUES ('304','1514188491','0','/Uploads/Theme/2017-12-25/71195a40aecbbad2b.png','personal','56','0');
INSERT INTO `pa_picarr` VALUES ('19','1511335889','0','/Uploads/photo/2017-11-28/6.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('20','1511335889','0','/Uploads/photo/2017-11-28/5.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('303','1514188437','0','/Uploads/Theme/2017-12-25/321885a40ae9531945.png','personal','56','0');
INSERT INTO `pa_picarr` VALUES ('301','1513995245','0','/Uploads/image/product/20171223/20171223021403_84794.png','about','3','0');
INSERT INTO `pa_picarr` VALUES ('300','1513995245','0','/Uploads/image/product/20171223/20171223021400_52418.png','about','3','0');
INSERT INTO `pa_picarr` VALUES ('299','1513995245','0','/Uploads/image/product/20171223/20171223021356_96954.png','about','3','0');
INSERT INTO `pa_picarr` VALUES ('114','1511781770','0','/Uploads/photo/2017-11-28/10.png','institution','2','0');
INSERT INTO `pa_picarr` VALUES ('29','0','0','/Uploads/photo/2017-11-28/3.png','forum','5','0');
INSERT INTO `pa_picarr` VALUES ('31','1511405225','0','/Uploads/photo/2017-11-28/4.png','forum','6','0');
INSERT INTO `pa_picarr` VALUES ('32','1511405225','0','/Uploads/photo/2017-11-28/16.png','forum','6','0');
INSERT INTO `pa_picarr` VALUES ('43','1511406838','0','/Uploads/photo/2017-11-28/6.png','teacher','1','0');
INSERT INTO `pa_picarr` VALUES ('44','1511406838','0','/Uploads/photo/2017-11-28/13.png','teacher','1','0');
INSERT INTO `pa_picarr` VALUES ('45','1511406839','0','/Uploads/photo/2017-11-28/2.png','teacher','1','0');
INSERT INTO `pa_picarr` VALUES ('111','1511419276','0','/Uploads/photo/2017-11-28/6.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('46','1511406839','0','/Uploads/photo/2017-11-28/7.png','teacher','1','0');
INSERT INTO `pa_picarr` VALUES ('47','1511406839','0','/Uploads/photo/2017-11-28/6.png','teacher','1','0');
INSERT INTO `pa_picarr` VALUES ('285','1513857426','0','/Uploads/institution/2017-12-21/5a3ba1922eb31.jpg','institution','1','0');
INSERT INTO `pa_picarr` VALUES ('55','1511407850','0','/Uploads/photo/2017-11-28/5.png','Article','7','0');
INSERT INTO `pa_picarr` VALUES ('56','1511407850','0','/Uploads/photo/2017-11-28/1.png','Article','7','0');
INSERT INTO `pa_picarr` VALUES ('104','1511418907','0','/Uploads/photo/2017-11-28/10.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('105','1511418994','0','/Uploads/photo/2017-11-28/18.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('106','1511419056','0','/Uploads/photo/2017-11-28/7.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('100','1511409741','0','/Uploads/photo/2017-11-28/5.png','product','38','0');
INSERT INTO `pa_picarr` VALUES ('101','1511409742','0','/Uploads/photo/2017-11-28/5.png','product','38','0');
INSERT INTO `pa_picarr` VALUES ('103','1511418866','0','/Uploads/photo/2017-11-28/7.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('107','1511419072','0','/Uploads/photo/2017-11-28/1.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('108','1511419129','0','/Uploads/photo/2017-11-28/18.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('109','1511419204','0','/Uploads/photo/2017-11-28/9.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('110','1511419225','0','/Uploads/photo/2017-11-28/12.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('99','1511409088','0','/Uploads/photo/2017-11-28/10.png','teacher_inst','1','0');
INSERT INTO `pa_picarr` VALUES ('112','1511419298','0','/Uploads/photo/2017-11-28/9.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('113','1511419926','0','/Uploads/photo/2017-11-28/16.png','personal','25','0');
INSERT INTO `pa_picarr` VALUES ('115','1511781771','0','/Uploads/photo/2017-11-28/18.png','institution','2','0');
INSERT INTO `pa_picarr` VALUES ('116','1511781771','0','/Uploads/photo/2017-11-28/10.png','institution','2','0');
INSERT INTO `pa_picarr` VALUES ('147','1511867087','0','/Uploads/photo/2017-11-28/8.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('148','1511867088','0','/Uploads/photo/2017-11-28/12.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('149','1511867089','0','/Uploads/photo/2017-11-28/11.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('150','1511867096','0','/Uploads/photo/2017-11-28/8.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('151','1511867097','0','/Uploads/photo/2017-11-28/10.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('152','1511867097','0','/Uploads/photo/2017-11-28/12.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('153','1511867098','0','/Uploads/photo/2017-11-28/14.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('154','1511867101','0','/Uploads/photo/2017-11-28/17.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('155','1511867102','0','/Uploads/photo/2017-11-28/2.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('156','1511867102','0','/Uploads/photo/2017-11-28/5.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('157','1511867103','0','/Uploads/photo/2017-11-28/10.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('158','1511867104','0','/Uploads/photo/2017-11-28/17.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('159','1511867104','0','/Uploads/photo/2017-11-28/9.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('160','1511867105','0','/Uploads/photo/2017-11-28/14.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('161','1511867105','0','/Uploads/photo/2017-11-28/11.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('162','1511867106','0','/Uploads/photo/2017-11-28/7.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('163','1511867110','0','/Uploads/photo/2017-11-28/8.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('164','1511867110','0','/Uploads/photo/2017-11-28/1.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('165','1511867111','0','/Uploads/photo/2017-11-28/7.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('166','1511867112','0','/Uploads/photo/2017-11-28/4.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('167','1511867112','0','/Uploads/photo/2017-11-28/10.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('168','1511867113','0','/Uploads/My/2018-01-29/72375a6f1681641ec.png','personal','24','0');
INSERT INTO `pa_picarr` VALUES ('169','1511867114','0','/Uploads/My/2018-01-29/104135a6f167333568.png','personal','24','0');
INSERT INTO `pa_picarr` VALUES ('170','1511867115','0','/Uploads/My/2018-01-29/33145a6f166310b04.png','personal','24','0');
INSERT INTO `pa_picarr` VALUES ('171','1511867116','0','/Uploads/My/2018-01-29/130795a6f14a616319.png','personal','24','0');
INSERT INTO `pa_picarr` VALUES ('172','1511867116','0','/Uploads/My/2018-01-29/60535a6f1651354df.png','personal','24','0');
INSERT INTO `pa_picarr` VALUES ('173','1511867122','0','/Uploads/photo/2017-11-28/4.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('174','1511867123','0','/Uploads/photo/2017-11-28/18.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('175','1511867123','0','/Uploads/photo/2017-11-28/18.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('176','1511867124','0','/Uploads/photo/2017-11-28/18.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('177','1511867124','0','/Uploads/photo/2017-11-28/10.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('178','1511867125','0','/Uploads/photo/2017-11-28/13.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('179','1511867126','0','/Uploads/photo/2017-11-28/18.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('180','1511867126','0','/Uploads/photo/2017-11-28/5.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('181','1511867127','0','/Uploads/photo/2017-11-28/9.png','personal','34','0');
INSERT INTO `pa_picarr` VALUES ('182','1511867128','0','/Uploads/photo/2017-11-28/4.png','personal','78','0');
INSERT INTO `pa_picarr` VALUES ('183','1511867129','0','/Uploads/photo/2017-11-28/1.png','personal','78','0');
INSERT INTO `pa_picarr` VALUES ('184','1511867133','0','/Uploads/photo/2017-11-28/6.png','personal','78','0');
INSERT INTO `pa_picarr` VALUES ('185','1511867134','0','/Uploads/photo/2017-11-28/14.png','personal','78','0');
INSERT INTO `pa_picarr` VALUES ('186','1511867135','0','/Uploads/photo/2017-11-28/13.png','forum','78','0');
INSERT INTO `pa_picarr` VALUES ('187','1511867135','0','/Uploads/photo/2017-11-28/14.png','forum','78','0');
INSERT INTO `pa_picarr` VALUES ('188','1511867136','0','/Uploads/photo/2017-11-28/4.png','forum','78','0');
INSERT INTO `pa_picarr` VALUES ('189','1511867137','0','/Uploads/photo/2017-11-28/14.png','forum','78','0');
INSERT INTO `pa_picarr` VALUES ('190','1511867138','0','/Uploads/photo/2017-11-28/7.png','forum','78','0');
INSERT INTO `pa_picarr` VALUES ('191','1511867139','0','/Uploads/photo/2017-11-28/9.png','forum','78','0');
INSERT INTO `pa_picarr` VALUES ('192','1511867140','0','/Uploads/photo/2017-11-28/17.png','forum','77','0');
INSERT INTO `pa_picarr` VALUES ('193','1511867141','0','/Uploads/photo/2017-11-28/4.png','forum','77','0');
INSERT INTO `pa_picarr` VALUES ('194','1511867141','0','/Uploads/photo/2017-11-28/17.png','forum','77','0');
INSERT INTO `pa_picarr` VALUES ('195','1511867142','0','/Uploads/photo/2017-11-28/13.png','forum','77','0');
INSERT INTO `pa_picarr` VALUES ('196','1511867143','0','/Uploads/photo/2017-11-28/5.png','forum','77','0');
INSERT INTO `pa_picarr` VALUES ('197','1511867144','0','/Uploads/photo/2017-11-28/18.png','forum','77','0');
INSERT INTO `pa_picarr` VALUES ('198','1511867145','0','/Uploads/photo/2017-11-28/18.png','forum','77','0');
INSERT INTO `pa_picarr` VALUES ('199','1511867146','0','/Uploads/photo/2017-11-28/7.png','forum','76','0');
INSERT INTO `pa_picarr` VALUES ('200','1511867147','0','/Uploads/photo/2017-11-28/15.png','forum','76','0');
INSERT INTO `pa_picarr` VALUES ('201','1511867147','0','/Uploads/photo/2017-11-28/11.png','forum','3','0');
INSERT INTO `pa_picarr` VALUES ('202','1511867147','0','/Uploads/photo/2017-11-28/17.png','forum','3','0');
INSERT INTO `pa_picarr` VALUES ('203','1511867147','0','/Uploads/photo/2017-11-28/15.png','forum','3','0');
INSERT INTO `pa_picarr` VALUES ('204','1511867147','0','/Uploads/photo/2017-11-28/2.png','forum','3','0');
INSERT INTO `pa_picarr` VALUES ('205','1511867147','0','/Uploads/photo/2017-11-28/16.png','forum','3','0');
INSERT INTO `pa_picarr` VALUES ('206','1511867147','0','/Uploads/photo/2017-11-28/14.png','forum','3','0');
INSERT INTO `pa_picarr` VALUES ('207','1511867147','0','/Uploads/photo/2017-11-28/3.png','forum','3','0');
INSERT INTO `pa_picarr` VALUES ('208','1511867147','0','/Uploads/photo/2017-11-28/9.png','forum','3','0');
INSERT INTO `pa_picarr` VALUES ('209','1511867147','0','/Uploads/photo/2017-11-28/7.png','forum','4','0');
INSERT INTO `pa_picarr` VALUES ('210','1511867147','0','/Uploads/photo/2017-11-28/15.png','forum','4','0');
INSERT INTO `pa_picarr` VALUES ('211','1511867147','0','/Uploads/photo/2017-11-28/14.png','forum','4','0');
INSERT INTO `pa_picarr` VALUES ('212','1511867147','0','/Uploads/photo/2017-11-28/2.png','forum','4','0');
INSERT INTO `pa_picarr` VALUES ('213','1511867147','0','/Uploads/photo/2017-11-28/18.png','forum','4','0');
INSERT INTO `pa_picarr` VALUES ('281','1512131109','0','/Uploads/photo/2017-11-28/7.png','article','33','0');
INSERT INTO `pa_picarr` VALUES ('243','1512126982','0','/Uploads/photo/2017-11-28/6.png','article','32','0');
INSERT INTO `pa_picarr` VALUES ('242','1512123620','0','/Uploads/photo/2017-11-28/9.png','article','26','0');
INSERT INTO `pa_picarr` VALUES ('282','1512196742','0','/Uploads/photo/2017-11-28/16.png','article','35','0');
INSERT INTO `pa_picarr` VALUES ('283','0','0','/Uploads/photo/2017-11-28/13.png','chongwo','0','0');
INSERT INTO `pa_picarr` VALUES ('284','0','0','/Uploads/photo/2017-11-28/8.png','chongwo','0','0');
INSERT INTO `pa_picarr` VALUES ('328','1516366525','0','/Uploads/My/2018-01-25/284155a699ebf844fd.png','personal','42','0');
INSERT INTO `pa_picarr` VALUES ('329','1516366539','0','/Uploads/My/2018-01-25/63265a6992a925580.png','personal','42','0');
INSERT INTO `pa_picarr` VALUES ('330','1516366550','0','/Uploads/My/2018-01-25/164445a699b998f463.png','personal','42','0');
INSERT INTO `pa_picarr` VALUES ('331','1516432250','0','/Uploads/My/2018-01-25/308415a698cf2cc2e0.png','personal','45','0');
INSERT INTO `pa_picarr` VALUES ('332','1516432259','0','/Uploads/My/2018-01-25/105895a698ce26912e.png','personal','45','0');
INSERT INTO `pa_picarr` VALUES ('333','1516432268','0','/Uploads/My/2018-01-25/298725a698cd87fa3f.png','personal','45','0');
INSERT INTO `pa_picarr` VALUES ('334','1516432306','0','/Uploads/My/2018-01-25/28355a698ccdce595.png','personal','45','0');
INSERT INTO `pa_picarr` VALUES ('335','1516439623','0','/Uploads/My/2018-01-20/202345a631292c4650.png','personal','41','0');
INSERT INTO `pa_picarr` VALUES ('336','1516442271','0','/Uploads/My/2018-01-20/288705a63129f6da84.png','personal','41','0');
INSERT INTO `pa_picarr` VALUES ('337','1516442293','0','/Uploads/My/2018-01-20/30195a6312b5748e8.png','personal','41','0');
INSERT INTO `pa_picarr` VALUES ('338','1516866816','0','/Uploads/My/2018-01-25/160465a698d005ec00.png','personal','45','0');
INSERT INTO `pa_picarr` VALUES ('339','1516870465','0','/Uploads/My/2018-01-25/148675a699b4183ca7.png','personal','42','0');
INSERT INTO `pa_picarr` VALUES ('340','1516870494','0','/Uploads/My/2018-01-25/10245a699bb094b90.png','personal','42','0');


# 数据库表：pa_problem 数据信息
INSERT INTO `pa_problem` VALUES ('5','65','1','测试','没有上传的文件！');
INSERT INTO `pa_problem` VALUES ('6','65','1','请输入您的问题!测试','没有上传的文件！');
INSERT INTO `pa_problem` VALUES ('7','65','1','请输入您的问题!测试','/Uploads/School/2017-12-27/71395a4369170e3e7.png');


# 数据库表：pa_product 数据信息
INSERT INTO `pa_product` VALUES ('45','62','大炮','25.00','','101','','','0','','1512819898','1512964766','','zh-cn','1','0','1','0','','','','','','','','','');
INSERT INTO `pa_product` VALUES ('50','62','跑车','20.00','','99','','','0','','1512820601','1512964722','','zh-cn','1','0','1','0','','','','','','','','','');
INSERT INTO `pa_product` VALUES ('47','62','飞机','30.00','','100','','','1','','1512819950','1512964745','','zh-cn','1','0','1','0','','','','','','','','','');
INSERT INTO `pa_product` VALUES ('51','62','钻石','15.00','','97','','','0','','1512820607','1512964690','','zh-cn','1','0','1','0','','','','','','','','','');
INSERT INTO `pa_product` VALUES ('52','62','亲','8.00','','96','','','1','','1512820757','1512964665','','zh-cn','1','0','1','0','','','','','','','','','');
INSERT INTO `pa_product` VALUES ('53','62','荧光棒','3.00','','95','','','0','','1512820774','1512964636','','zh-cn','1','0','1','0','','','','','','','','','');
INSERT INTO `pa_product` VALUES ('54','62','玫瑰','5.00','','94','','','0','','1512820817','1512964611','','zh-cn','1','0','1','0','','','','','','','','','');
INSERT INTO `pa_product` VALUES ('55','62','猴','12.00','','93','','','1','','1512820866','1512964585','','zh-cn','1','0','1','0','','','','','','','','','');
INSERT INTO `pa_product` VALUES ('56','62','小翅膀','7.00','','92','','','1','','1512820942','1512964544','','zh-cn','1','0','1','0','','','','','','','','','');
INSERT INTO `pa_product` VALUES ('57','62','大翅膀','10.00','','91','','','1','','1512820971','1512964456','内容内容','zh-cn','1','0','1','0','','','','','','','','','');


# 数据库表：pa_recordm 数据信息
INSERT INTO `pa_recordm` VALUES ('8','就是这个感觉','','/Uploads/record/2017-12-15/5a33bbbcd2b53.mp3','1513339836','');
INSERT INTO `pa_recordm` VALUES ('5','插上电池','','/Uploads/record/2017-11-30/5a1ff9ca7a767.mp3','1512045002','');
INSERT INTO `pa_recordm` VALUES ('6','擦啊 啊啊','','/Uploads/record/2017-11-30/5a1ff9d397660.mp3','1512045011','');
INSERT INTO `pa_recordm` VALUES ('21','卡通','/Uploads/record/2017-12-16/5a34d93e59a15.png','','1513412926','/Uploads/record/2017-12-16/5a34d93e54fdb.png');
INSERT INTO `pa_recordm` VALUES ('9','老街','','/Uploads/record/2017-12-15/5a33bbd876ecc.mp3','1513339864','');
INSERT INTO `pa_recordm` VALUES ('10','美人鱼','','/Uploads/record/2017-12-15/5a33bd72e69ef.mp3','1513340274','');
INSERT INTO `pa_recordm` VALUES ('20','温暖','/Uploads/record/2017-12-16/5a34d92b7244c.png','','1513412907','/Uploads/record/2017-12-16/5a34d92b6b6ea.png');
INSERT INTO `pa_recordm` VALUES ('19','古风','/Uploads/record/2017-12-16/5a34d91e7542d.png','','1513412894','/Uploads/record/2017-12-16/5a34d91e7060c.png');
INSERT INTO `pa_recordm` VALUES ('18','唯美','/Uploads/record/2017-12-16/5a34d90b23efb.png','','1513412875','/Uploads/record/2017-12-16/5a34d90b1f8aa.png');
INSERT INTO `pa_recordm` VALUES ('22','大气','/Uploads/record/2017-12-16/5a34d952df37c.png','','1513412946','/Uploads/record/2017-12-16/5a34d952d8232.png');
INSERT INTO `pa_recordm` VALUES ('23','深沉','/Uploads/record/2017-12-16/5a34d9646bbd6.png','','1513412964','/Uploads/record/2017-12-16/5a34d96462b4c.png');


# 数据库表：pa_report 数据信息
INSERT INTO `pa_report` VALUES ('1','1','2','他骂我','','1');


# 数据库表：pa_role 数据信息
INSERT INTO `pa_role` VALUES ('1','超级管理员','0','1','系统内置超级管理员组，不受权限分配账号限制','');
INSERT INTO `pa_role` VALUES ('2','管理员','1','1','拥有系统仅此于超级管理员的权限','');
INSERT INTO `pa_role` VALUES ('3','领导','1','1','拥有所有操作的读权限，无增加、删除、修改的权限','');
INSERT INTO `pa_role` VALUES ('4','测试组','1','1','测试','');
INSERT INTO `pa_role` VALUES ('6','机构管理','1','1','入驻的机构','12');


# 数据库表：pa_role_user 数据信息
INSERT INTO `pa_role_user` VALUES ('3','4');
INSERT INTO `pa_role_user` VALUES ('3','4');
INSERT INTO `pa_role_user` VALUES ('3','4');
INSERT INTO `pa_role_user` VALUES ('3','2');
INSERT INTO `pa_role_user` VALUES ('2','3');
INSERT INTO `pa_role_user` VALUES ('6','4');
INSERT INTO `pa_role_user` VALUES ('6','5');
INSERT INTO `pa_role_user` VALUES ('6','6');
INSERT INTO `pa_role_user` VALUES ('6','7');
INSERT INTO `pa_role_user` VALUES ('2','8');


# 数据库表：pa_route 数据信息
INSERT INTO `pa_route` VALUES ('1','','去考试','39','传媒1','0','45465','456456','体育','北京');
INSERT INTO `pa_route` VALUES ('2','','去考试','39','传2','0','45','452','体育','天津');
INSERT INTO `pa_route` VALUES ('3','','几个','56','上海戏剧学院','0','1514206800000','1514206800000','测试播音1','北京市');
INSERT INTO `pa_route` VALUES ('4','','测试','65','四川传媒学院','0','1514783220','1514524020','表演','天津市');
INSERT INTO `pa_route` VALUES ('5','','gggf','56','浙江传媒学院','0','1443708000000','1443708000000','浙江传媒学院测试播音专业1','北京市');
INSERT INTO `pa_route` VALUES ('6','','好久不见美女','74','浙江传媒学院','0','1514822400000','1514822400000','浙江传媒学院测试播音专业1','北京市');
INSERT INTO `pa_route` VALUES ('7','','','24','传2','0','','','','天津');
INSERT INTO `pa_route` VALUES ('8','','今天不上班','65','浙江传媒学院','0','1514797200','1514797200','浙江传媒学院测试播音专业2','新疆维吾尔自治区');
INSERT INTO `pa_route` VALUES ('9','','今天不上班','24','浙江传媒学院','0','1514797200','','浙江传媒学院测试播音专业2','新疆维吾尔自治区');
INSERT INTO `pa_route` VALUES ('10','','今天补上班','55','浙江传媒学院','0','1514797200','1514797200','浙江传媒学院测试播音专业2','新疆维吾尔自治区');
INSERT INTO `pa_route` VALUES ('11','','今天补上班','24','四川传媒学院','0','','','表演','天津市');
INSERT INTO `pa_route` VALUES ('12','','今天补上班','55','四川传媒学院','0','1514797200','','表演','天津市');


# 数据库表：pa_schooltopic 数据信息
INSERT INTO `pa_schooltopic` VALUES ('16','74','第一套真题','','1513753118','0','0','','','0','0','','','0','10');
INSERT INTO `pa_schooltopic` VALUES ('17','0','啊实打实','啊实打实大所大所大所大所大所大','1513753118','0','1','',',24','1','16','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('18','0','实大所','啊实打实大所大所大所大所大所大所多','1513753118','0','0','','','2','16','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('19','74','第二套真题','','1513753191','0','0','','','0','0','','','0','20');
INSERT INTO `pa_schooltopic` VALUES ('20','0','啊实打实','啊实打实大所大所大所大所大所大','1513753191','0','0','','','1','19','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('21','0','实大所','啊实打实大所大所大所大所大所大所多','1513753191','0','0','','','2','19','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('22','74','第三套真题','','1513753994','0','0','','','0','0','','','0','30');
INSERT INTO `pa_schooltopic` VALUES ('23','0','啊实打实','啊实打实大所大所大所大所大所大','1513753994','0','0','','','1','22','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('25','0','','','0','0','0','','','0','0','北京市','','1','0');
INSERT INTO `pa_schooltopic` VALUES ('27','0','','','0','0','0','','','0','0','黑龙江省','/Uploads/image/product/20171221/20171221110741_70336.jpg','1','0');
INSERT INTO `pa_schooltopic` VALUES ('28','13','sdfsdf','','1513855196','0','0','','','0','0','','','0','4');
INSERT INTO `pa_schooltopic` VALUES ('29','0','啊实打实','啊实打实大所大所大所大所大所大','1513855196','0','0','','','1','28','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('30','0','实大所','啊实打实大所大所大所大所大所大所多','1513855196','0','0','','','2','28','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('31','0','asd','','1513855583','0','0','','','0','25','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('32','0','啊实打实','啊实打实大所大所大所大所大所大','1513855583','0','0','','','1','31','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('33','0','实大所','啊实打实大所大所大所大所大所大所多','1513855583','0','0','','','2','31','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('34','0','','','0','0','0','','','0','0','天津市','/Uploads/image/product/20171221/20171221113302_35381.png','1','0');
INSERT INTO `pa_schooltopic` VALUES ('35','0','asd','','1513855996','0','0','','','0','34','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('36','0','啊实打实','啊实打实大所大所大所大所大所大','1513855996','0','0','','','1','35','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('37','0','实大所','啊实打实大所大所大所大所大所大所多','1513855996','0','0','','','2','35','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('38','0','asdasd','','1513856005','0','0','','','0','34','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('39','0','啊实打实','啊实打实大所大所大所大所大所大','1513856005','0','0','','','1','38','','','0','0');
INSERT INTO `pa_schooltopic` VALUES ('40','0','实大所','啊实打实大所大所大所大所大所大所多','1513856005','0','0','','','2','38','','','0','0');


# 数据库表：pa_sign 数据信息


# 数据库表：pa_signup 数据信息
INSERT INTO `pa_signup` VALUES ('1','24','胡文亮','15134041905','男','21','哈哈','辽宁阜新','1','9');
INSERT INTO `pa_signup` VALUES ('4','24','胡文亮','15134041905','男','21','哈哈','辽宁阜新','1','8');
INSERT INTO `pa_signup` VALUES ('11','65','twut','组图t','女','moul','tutut','ljut','1','5');
INSERT INTO `pa_signup` VALUES ('12','65','啦啦啦','ll','男','tj','ne','mof','1','8');


# 数据库表：pa_sub_category 数据信息
INSERT INTO `pa_sub_category` VALUES ('5','语文','0','','n','zh-cn');
INSERT INTO `pa_sub_category` VALUES ('2','数学','','','n','zh-cn');
INSERT INTO `pa_sub_category` VALUES ('3','英语','','','n','zh-cn');
INSERT INTO `pa_sub_category` VALUES ('4','11','5','','n','zh-cn');


# 数据库表：pa_subject 数据信息
INSERT INTO `pa_subject` VALUES ('2','1545454545','1531354343','dasd asd ','0.10','24','1','110.00','1','/Uploads/image/activity/20180227/20180227095522_91120.jpg','AAAA','','1','0','video');
INSERT INTO `pa_subject` VALUES ('4','1547546654','1531354561','《概率论与数理统计》是我校理、工、经管类本科生必修的一门重要的基础课。也是工学、 经济学硕士研究生入学考试的一','0.01','24','','120.00','','/Uploads/image/activity/20180227/20180227095522_91120.jpg','《概率论与数理统计》','数,理,化','0','0','video');
INSERT INTO `pa_subject` VALUES ('5','1547546654','1531345617','“西方文化概论”是一门基础性通识课程，本课宗旨在于通过系统讲授，帮助学生把握西方文化发展演进的基本脉络和精神实质。本课程在内容上分为三个部分，第一部分为希腊罗马文化，第二部分为中世纪基督教文化，第三部','0.01','24','','131.00','3','/Uploads/image/activity/20180227/20180227095522_91120.jpg','西方文化通论','历史,西方','0','0','live');
INSERT INTO `pa_subject` VALUES ('6','1567894561','1554321231','通过本课程的学习，使学员掌握心理学的基础知识和基本理论，科学地认识了解人的心理现象的本质及产生、发展、演变的一般规律，并运用这些知识分析、预测现实生活中的心理现象，培养和提高学员正确分析和解决实际问题','0.01','24','','151.00','4','/Uploads/image/activity/20180227/20180227095522_91120.jpg','心理学1','心理','0','0','nobegin');


# 数据库表：pa_tag 数据信息
INSERT INTO `pa_tag` VALUES ('6','关于我们','aboutus','<h3> <img src="/newconist/Uploads/image/product/20140303/20140303081406_87297.jpg" width="100" height="100" align="left" alt="" /> </h3><p>  在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多个地方官热风斯蒂芬<span>在此处输入内容覆盖多<span></span></span></span></span></span></span></span></span></span></span></p>','zh-cn');


# 数据库表：pa_teacher_inst 数据信息
INSERT INTO `pa_teacher_inst` VALUES ('1','张家奇','/Uploads/image/Institution/20171216/20171216121300_11213.png','我是老师','1','1510993703','','1513426381');
INSERT INTO `pa_teacher_inst` VALUES ('2','胡文亮','/Uploads/image/Institution/20171216/20171216121315_19478.png','我是胡文亮','1','1510994018','','1513426396');
INSERT INTO `pa_teacher_inst` VALUES ('3','奇哥','/Uploads/image/product/20171117/20171117055732_36216.jpg','我是谁啊','2','1510995818','','');
INSERT INTO `pa_teacher_inst` VALUES ('4','nickname','/Uploads/image/Institution/20171216/20171216051554_66109.png','暗示法gas开发顺丰大是大非阿斯顿发生','8','1513401365','','');
INSERT INTO `pa_teacher_inst` VALUES ('5','mmmmm','/Uploads/image/Institution/20171216/20171216051620_62374.png','手机端格拉斯哥大神快来噶是的噶是的大纲','8','1513401386','','');
INSERT INTO `pa_teacher_inst` VALUES ('6','阿什顿发','/Uploads/image/Institution/20171216/20171216051653_64772.png','是否合格即可更换客服还是东方红更多发挥','9','1513401425','','');
INSERT INTO `pa_teacher_inst` VALUES ('7','是的发送','/Uploads/image/Institution/20171216/20171216051723_79919.png','啥打法是否大师傅打是的发生的发生的发','9','1513401448','','');
INSERT INTO `pa_teacher_inst` VALUES ('8','啥地方','/Uploads/image/Institution/20171216/20171216051749_24713.png','时代光华的高度分工涣发大号是地方噶是的','10','1513401475','','');
INSERT INTO `pa_teacher_inst` VALUES ('9','发过火','/Uploads/image/Institution/20171216/20171216051807_83402.png','风格都会花费更多发挥地方规划 发过火发给好','10','1513401495','','');
INSERT INTO `pa_teacher_inst` VALUES ('10','刚回家','/Uploads/image/Institution/20171216/20171216051842_27179.png','单方事故发给是地方噶是的鬼斧神工第三方个','11','1513401531','','');
INSERT INTO `pa_teacher_inst` VALUES ('11','Yui','/Uploads/image/Institution/20171216/20171216051914_68548.png','法国进口法国恢复国家人工湖鸡飞狗叫回复关键','11','1513401561','','');
INSERT INTO `pa_teacher_inst` VALUES ('12','张三','/Uploads/image/Institution/20171231/20171231083156_19961.png','卡顿和思考后打开的哈卡的哈卡的哈萨克间的哈萨克的哈萨克的哈萨克的哈萨克间的哈萨克的就撒欢的卡拉萨开建的卡后打开了几大联赛空间大量空间大利空打击撒了肯德基阿斯利康的就撒了肯德基阿斯利康萨拉建档立卡记得拉','0','1514709140','','');


# 数据库表：pa_theme 数据信息
INSERT INTO `pa_theme` VALUES ('8','#我想说的是大家好11#','/Uploads/Theme/2017-11-23/1511404807_1223299936.jpg','#你们好#我想说的是大家好111','1511404807','1');
INSERT INTO `pa_theme` VALUES ('7','#我想说的是大家好11#','/Uploads/Theme/2017-11-23/1511404713_496285096.jpg','#你们好#我想说的是大家好111','1511404713','1');
INSERT INTO `pa_theme` VALUES ('9','#我想说的是大家好11#','/Uploads/Theme/2017-11-23/1511404854_2056783024.jpg','#你们好#我想说的是大家好111','1511404854','1');
INSERT INTO `pa_theme` VALUES ('28','#132驱蚊器翁#','/Uploads/Theme/2017-11-23/1511404807_1223299936.jpg','#132驱蚊器翁#45614321','1511418987','1');
INSERT INTO `pa_theme` VALUES ('29','#132驱蚊器翁#','/Uploads/Theme/2017-11-23/1511404807_1223299936.jpg','#132驱蚊器翁# 45614321','1511419006','1');
INSERT INTO `pa_theme` VALUES ('30','#132#','/Uploads/Theme/2017-11-23/1511404807_1223299936.jpg','#132驱蚊器翁#  45614321 #web##45641##78945##543#789456','1511421666','1');
INSERT INTO `pa_theme` VALUES ('31','#123#','/Uploads/Theme/2017-11-23/1511404807_1223299936.jpg','#132驱蚊器翁#  45614321','1511421693','1');
INSERT INTO `pa_theme` VALUES ('27','#qweqwe#','/Uploads/Theme/2017-11-23/1511404807_1223299936.jpg','#132驱蚊器翁##qweqwe#','1511418960','1');
INSERT INTO `pa_theme` VALUES ('32','#132驱蚊器翁#','/Uploads/Theme/2017-11-23/1511404807_1223299936.jpg','#132驱蚊器翁#  45614321','1511421772','1');
INSERT INTO `pa_theme` VALUES ('33','#qweqwe12#','/Uploads/Theme/2017-11-23/1511404807_1223299936.jpg','#123##456#','1512092940','1');
INSERT INTO `pa_theme` VALUES ('34','#qweqwe123#','/Uploads/Theme/2017-11-23/1511404807_1223299936.jpg','csdcsd','','1');
INSERT INTO `pa_theme` VALUES ('35','#qweqwe1234#','/Uploads/Theme/2017-11-23/1511404807_1223299936.jpg','csdcsdcsdcsd','','1');
INSERT INTO `pa_theme` VALUES ('36','#qweqwe12345#','/Uploads/Theme/2017-11-23/1511404807_1223299936.jpg','fessdfsd','','1');
INSERT INTO `pa_theme` VALUES ('37','#qweqwe5467#','/Uploads/Theme/2017-12-25/117605a40b3b268c10.png','不v哈哈哈哈~@^_^@~','','1');
INSERT INTO `pa_theme` VALUES ('38','#qweqwe65#','/Uploads/Theme/2017-12-26/29405a420f2403763.png','后天','','0');
INSERT INTO `pa_theme` VALUES ('39','#qweqwe890#','/Uploads/Theme/2017-12-26/126035a420f35cd95c.png','体会','','1');
INSERT INTO `pa_theme` VALUES ('41','','/Uploads/Theme/2017-12-28/305265a44947641c2c.png','12344','1514443894','0');
INSERT INTO `pa_theme` VALUES ('42','','/Uploads/Theme/2017-12-28/306605a4494bbbfa55.png','12355','1514443963','0');
INSERT INTO `pa_theme` VALUES ('43','','/Uploads/Theme/2017-12-29/289065a460f9c953f7.png','tetr','1514540956','0');


# 数据库表：pa_topic 数据信息
INSERT INTO `pa_topic` VALUES ('235','5','2','0');
INSERT INTO `pa_topic` VALUES ('230','11','2','0');
INSERT INTO `pa_topic` VALUES ('236','14','2','1');
INSERT INTO `pa_topic` VALUES ('157','4','34','1');
INSERT INTO `pa_topic` VALUES ('137','22','34','1');
INSERT INTO `pa_topic` VALUES ('162','5','34','1');
INSERT INTO `pa_topic` VALUES ('147','11','34','1');
INSERT INTO `pa_topic` VALUES ('158','6','34','0');
INSERT INTO `pa_topic` VALUES ('164','12','34','0');
INSERT INTO `pa_topic` VALUES ('161','9','34','0');
INSERT INTO `pa_topic` VALUES ('156','10','34','1');
INSERT INTO `pa_topic` VALUES ('159','7','34','0');
INSERT INTO `pa_topic` VALUES ('160','8','34','0');
INSERT INTO `pa_topic` VALUES ('190','5','56','1');
INSERT INTO `pa_topic` VALUES ('186','11','56','0');
INSERT INTO `pa_topic` VALUES ('187','14','56','0');
INSERT INTO `pa_topic` VALUES ('232','16','2','0');
INSERT INTO `pa_topic` VALUES ('233','17','2','0');
INSERT INTO `pa_topic` VALUES ('234','34','2','0');
INSERT INTO `pa_topic` VALUES ('237','15','2','1');
INSERT INTO `pa_topic` VALUES ('238','18','2','1');
INSERT INTO `pa_topic` VALUES ('240','12','65','1');
INSERT INTO `pa_topic` VALUES ('241','4','65','0');
INSERT INTO `pa_topic` VALUES ('242','22','65','0');


# 数据库表：pa_wish 数据信息
INSERT INTO `pa_wish` VALUES ('1','文曲星护法','10.00','/Uploads/image/product/20171201/20171201112422_37962.png');
INSERT INTO `pa_wish` VALUES ('2','天使护法','5.00','/Uploads/image/product/20171201/20171201112648_52665.png');
INSERT INTO `pa_wish` VALUES ('4','鲜花护法','98.00','/Uploads/image/product/20171201/20171201113808_91458.png');


# 数据库表：pa_withdrawals 数据信息
INSERT INTO `pa_withdrawals` VALUES ('1','1','张家奇','9999.00','0','2','银行账户','1110','');
INSERT INTO `pa_withdrawals` VALUES ('6','24','张家奇','1000.00','1513925472','2','银行账户','62296086704951071','');
INSERT INTO `pa_withdrawals` VALUES ('8','25','yjt','10.00','1514192066','0','银行账户','622848 0000012344456','');
INSERT INTO `pa_withdrawals` VALUES ('9','25','yjt','10.00','1514192098','0','银行账户','622848 0000012344456','');
INSERT INTO `pa_withdrawals` VALUES ('10','25','yjt','1.00','1514192188','0','银行账户','622848 0000012344456','');
INSERT INTO `pa_withdrawals` VALUES ('11','25','yjt','1.00','1514192209','0','银行账户','622848 0000012344456','');
INSERT INTO `pa_withdrawals` VALUES ('12','25','yjt','10.00','1514192222','0','银行账户','622848 0000012344456','');
INSERT INTO `pa_withdrawals` VALUES ('13','25','yjt','1.00','1514438218','0','银行账户','622848 0000012344456','');
INSERT INTO `pa_withdrawals` VALUES ('14','25','23424','1.00','1514438894','0','银行账户','12313123','');
INSERT INTO `pa_withdrawals` VALUES ('15','25','234234234','1.00','1514439320','0','银行账户','234234','');
INSERT INTO `pa_withdrawals` VALUES ('16','25','123','0.50','1514446010','0','银行账户','456','');
INSERT INTO `pa_withdrawals` VALUES ('17','25','122','10.00','1514447796','0','银行账户','123','');
INSERT INTO `pa_withdrawals` VALUES ('18','25','hfdd','10.00','1514529685','0','银行账户','123456789','');
INSERT INTO `pa_withdrawals` VALUES ('19','24','张家奇','1000.00','1516762554','0','支付宝','1018681524@qq.com','15134041905');
INSERT INTO `pa_withdrawals` VALUES ('20','41','张家奇','12100.00','1516885215','0','支付宝','1018681524@qq.com','15231115232');
INSERT INTO `pa_withdrawals` VALUES ('21','41','张家奇','121.00','1516885274','1','支付宝','1018681524@qq.com','15231115232');
INSERT INTO `pa_withdrawals` VALUES ('22','41','张家奇','121.00','1516885416','2','支付宝','1018681524@qq.com','15231115232');
INSERT INTO `pa_withdrawals` VALUES ('23','25','dsfdfd','0.43','1516885705','0','支付宝','343','13691255667');
INSERT INTO `pa_withdrawals` VALUES ('24','25','454','0.44','1516885759','0','支付宝','54','13691255667');
INSERT INTO `pa_withdrawals` VALUES ('25','25','454','0.44','1516885760','0','支付宝','54','13691255667');
INSERT INTO `pa_withdrawals` VALUES ('26','25','454','0.44','1516885760','0','支付宝','54','13691255667');
INSERT INTO `pa_withdrawals` VALUES ('27','25','454','0.44','1516885761','0','支付宝','54','13691255667');
INSERT INTO `pa_withdrawals` VALUES ('28','25','454','0.44','1516885762','0','支付宝','54','13691255667');
INSERT INTO `pa_withdrawals` VALUES ('29','41','张家奇','121.00','1516886075','0','支付宝','1018681524@qq.com','15231115232');


# 数据库表：pa_yzm 数据信息
INSERT INTO `pa_yzm` VALUES ('176','18311187547','1216');
INSERT INTO `pa_yzm` VALUES ('172','13120186909','3471');
INSERT INTO `pa_yzm` VALUES ('175','18793616263','1698');
INSERT INTO `pa_yzm` VALUES ('167','15762357777','8443');
INSERT INTO `pa_yzm` VALUES ('173','13120186909','4303');
INSERT INTO `pa_yzm` VALUES ('194','17051103605','6238');
INSERT INTO `pa_yzm` VALUES ('193','17051103605','5463');
INSERT INTO `pa_yzm` VALUES ('192','18511752404','8025');
INSERT INTO `pa_yzm` VALUES ('185','13691255667','3713');
INSERT INTO `pa_yzm` VALUES ('202','18811710388','5963');
INSERT INTO `pa_yzm` VALUES ('210','15996585266','2541');


# 数据库表：pa_zan 数据信息
INSERT INTO `pa_zan` VALUES ('forum','4','24','aa','1511604695','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('teacher','1','24','','1511761785','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('forum','29','25','大个','1512530429','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('forum','30','40','','1512537798','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('forum','8','40','','1512537801','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('record','7','24','','1512537801','');
INSERT INTO `pa_zan` VALUES ('record','8','24','','1512537801','');
INSERT INTO `pa_zan` VALUES ('record','9','24','','1512537801','');
INSERT INTO `pa_zan` VALUES ('forum','3','25','大个','1512375991','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('forum','0','25','大个','1512521551','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('forum','3','69','','1514290012','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('forum','78','69','','1514537770','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('forum','121','1','','1514439801','');
INSERT INTO `pa_zan` VALUES ('forum','78','54','','1514897470','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('forum','30','56','','1514540691','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('forum','78','73','','1514439176','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('forum','8','73','','1514439686','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('forum','76','74','','1514439694','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('forum','3','56','','1514515676','/Public/Img/default/default.jpg');
INSERT INTO `pa_zan` VALUES ('forum','77','2','','1514944315','/Public/Img/default/default.jpg');
