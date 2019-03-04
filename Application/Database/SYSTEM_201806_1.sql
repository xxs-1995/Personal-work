# -----------------------------------------------------------
# PHP-Amateur database backup files
# Blog: http://www.uc22.net
# Type: 系统自动备份
# Description:当前SQL文件包含了表：pa_about、pa_access、pa_ad、pa_admin、pa_agent、pa_applyteacher、pa_at、pa_auth、pa_bibi、pa_book、pa_bought、pa_buybook、pa_buywith、pa_call、pa_car、pa_category、pa_city、pa_collection、pa_column、pa_comment、pa_computing、pa_field、pa_follow、pa_gift、pa_help、pa_images、pa_input、pa_link、pa_livepay、pa_liveset、pa_livevideo、pa_major、pa_match、pa_member、pa_message、pa_mining、pa_model、pa_mybi、pa_myrecord、pa_nav、pa_news、pa_node、pa_order、pa_orderdetails、pa_page、pa_pay、pa_personal、pa_picarr、pa_problem、pa_product、pa_report、pa_role、pa_role_user、pa_route、pa_schooltopic、pa_sign、pa_signup、pa_sub_category、pa_subsidy、pa_tag、pa_teacher_inst、pa_theme、pa_topic、pa_wish、pa_withdrawals、pa_yzm、pa_zan的结构信息，表：pa_about、pa_access、pa_ad、pa_admin、pa_agent、pa_applyteacher、pa_at、pa_auth、pa_bibi、pa_book、pa_bought、pa_buybook、pa_buywith、pa_call、pa_car、pa_category、pa_city、pa_collection、pa_column、pa_comment、pa_computing、pa_field、pa_follow、pa_gift、pa_help、pa_images、pa_input、pa_link、pa_livepay、pa_liveset、pa_livevideo、pa_major、pa_match、pa_member、pa_message、pa_mining、pa_model、pa_mybi、pa_myrecord、pa_nav、pa_news、pa_node、pa_order、pa_orderdetails、pa_page、pa_pay、pa_personal、pa_picarr、pa_problem、pa_product、pa_report、pa_role、pa_role_user、pa_route、pa_schooltopic、pa_sign、pa_signup、pa_sub_category、pa_subsidy、pa_tag、pa_teacher_inst、pa_theme、pa_topic、pa_wish、pa_withdrawals、pa_yzm、pa_zan的数据
# Time: 2018-06-05 11:57:07
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
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ;

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

# 数据库表：pa_agent 结构信息
DROP TABLE IF EXISTS `pa_agent`;
CREATE TABLE `pa_agent` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1区县代理 2市级代理 3省级代理',
  `address` int(11) NOT NULL COMMENT '区域id',
  `address_name` char(15) DEFAULT NULL COMMENT '地区名',
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='代理' ;

# 数据库表：pa_applyteacher 结构信息
DROP TABLE IF EXISTS `pa_applyteacher`;
CREATE TABLE `pa_applyteacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `true_name` char(20) DEFAULT NULL COMMENT '真实姓名',
  `teacher_userid` int(11) NOT NULL COMMENT '用户id',
  `type` char(10) NOT NULL COMMENT '申请类型  item项目入驻 media媒体 capital资本',
  `createtime` int(11) DEFAULT NULL,
  `attribute` char(20) DEFAULT NULL COMMENT '属性',
  `direction` varchar(50) DEFAULT NULL COMMENT '方向',
  `phone` char(12) DEFAULT NULL COMMENT '联系方式',
  `wechat` char(20) DEFAULT NULL COMMENT '微信',
  `qq` char(15) DEFAULT NULL COMMENT 'qq',
  `email` char(30) DEFAULT NULL COMMENT '邮箱',
  `scale` varchar(50) DEFAULT NULL COMMENT '规模',
  `progress` varchar(50) DEFAULT NULL COMMENT '进展',
  `introduce` varchar(100) DEFAULT NULL COMMENT '简介',
  `plan` varchar(100) DEFAULT NULL COMMENT '计划',
  `teacher_examine` tinyint(2) DEFAULT NULL COMMENT '申请状态',
  PRIMARY KEY (`teacher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='老师' ;

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

# 数据库表：pa_bibi 结构信息
DROP TABLE IF EXISTS `pa_bibi`;
CREATE TABLE `pa_bibi` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(20) DEFAULT NULL COMMENT '名称',
  `num` float(20,5) DEFAULT NULL COMMENT '总数量',
  `rate` decimal(5,3) DEFAULT NULL COMMENT '挖到的比例',
  `header` varchar(100) DEFAULT NULL COMMENT '头像',
  `cny` decimal(20,6) DEFAULT NULL COMMENT '与人民币汇率',
  `content` text COMMENT '描述',
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='货币表' ;

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

# 数据库表：pa_car 结构信息
DROP TABLE IF EXISTS `pa_car`;
CREATE TABLE `pa_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '商品id',
  `uid` int(11) DEFAULT NULL COMMENT '会员id',
  `uid_sj` int(11) DEFAULT NULL COMMENT '商品所属商家的id',
  `cplx` int(5) NOT NULL DEFAULT '0' COMMENT '产品类型0为自有1为批发商家',
  `num` int(11) DEFAULT '1' COMMENT '购买数量',
  `jiage` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `createtime` varchar(30) NOT NULL COMMENT '创建时间',
  `img_url` varchar(200) NOT NULL COMMENT '图片',
  `cptype` tinyint(3) NOT NULL COMMENT '产品类型，1商家出租，2商家出售，3个人出租',
  `sid` int(11) NOT NULL COMMENT '商家id',
  `cid` int(11) DEFAULT NULL COMMENT '分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='购物车' ;

# 数据库表：pa_category 结构信息
DROP TABLE IF EXISTS `pa_category`;
CREATE TABLE `pa_category` (
  `cid` int(5) NOT NULL AUTO_INCREMENT,
  `pid` int(5) DEFAULT NULL COMMENT 'parentCategory上级分类',
  `name` varchar(20) DEFAULT NULL COMMENT '分类名称',
  `type` char(2) DEFAULT 'n',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  `paytype` tinyint(4) DEFAULT '1' COMMENT '支付方式 1bow支付   2 50算力+50ITG',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新闻分类表' ;

# 数据库表：pa_city 结构信息
DROP TABLE IF EXISTS `pa_city`;
CREATE TABLE `pa_city` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` bigint(10) DEFAULT NULL,
  `REGION_ID` bigint(10) DEFAULT NULL,
  `REGION_PARENT_ID` bigint(10) DEFAULT NULL,
  `REGION_NAME` varchar(100) DEFAULT NULL,
  `REGION_TYPE` int(11) DEFAULT NULL COMMENT '1省 2市 3区',
  `ZIPCODE` varchar(50) DEFAULT NULL,
  `QUHAO` varchar(50) DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11186 DEFAULT CHARSET=utf8 COMMENT='地区信息表' ;

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
  `tag` varchar(50) DEFAULT NULL COMMENT '标签',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ;

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
  `pid` int(11) DEFAULT '0' COMMENT '当前评论的上级评论id',
  `star` int(11) NOT NULL DEFAULT '0' COMMENT '评分 小星星数量 0 1 2 3 4 5 ',
  PRIMARY KEY (`com_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='评论' ;

# 数据库表：pa_computing 结构信息
DROP TABLE IF EXISTS `pa_computing`;
CREATE TABLE `pa_computing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` char(15) DEFAULT NULL COMMENT '交易类型 dig挖矿 buy支付 recommend推荐 register注册 cultivation市场培育 math算力大赛\r\nsale销售奖励 subsidy算力补贴 agant代理奖励',
  `currency` char(15) DEFAULT NULL COMMENT '币种 BOWT suanli算力 diamond钻石 mineral矿石',
  `inout` char(10) DEFAULT NULL COMMENT '收入或支出  in收入   out支出',
  `suanli` decimal(10,3) DEFAULT NULL COMMENT '价值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1839 DEFAULT CHARSET=utf8 ;

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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='数据模型字段' ;

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
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='关注表' ;

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
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='帮助与反馈' ;

# 数据库表：pa_images 结构信息
DROP TABLE IF EXISTS `pa_images`;
CREATE TABLE `pa_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(20) NOT NULL,
  `savename` varchar(100) NOT NULL,
  `savepath` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 ;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement` text NOT NULL COMMENT '协议',
  `recommend` int(11) NOT NULL DEFAULT '0' COMMENT '推荐新人得算力',
  `recommend2` int(11) DEFAULT '0' COMMENT '我推荐的人推荐别人送算力',
  `register` int(11) DEFAULT '0' COMMENT '注册赠送算力',
  `lease_rate` decimal(5,2) DEFAULT '0.00' COMMENT '推荐新人得租赁提成比率',
  `interval_time` int(11) DEFAULT '0' COMMENT '挖矿间隔时间',
  `number` decimal(20,10) DEFAULT '0.0000000000' COMMENT '一次挖矿的数量',
  `statistics` int(11) DEFAULT '0' COMMENT '挖矿记录统计间隔',
  `subsidy_rete` decimal(5,3) DEFAULT '0.000' COMMENT '算力补贴比率',
  `subsidy_num` tinyint(4) DEFAULT '0' COMMENT '补贴要达到的金额',
  `subsidy_price` decimal(15,2) DEFAULT '0.00' COMMENT '补贴的累积销售',
  `pid` varchar(50) DEFAULT NULL COMMENT '要达到要求产品id  逗号隔开  市场培育奖',
  `countynum` tinyint(4) DEFAULT NULL COMMENT '县级代理人数',
  `countyprice` decimal(10,2) DEFAULT NULL COMMENT '县级代理金额',
  `countyrate` decimal(3,2) DEFAULT NULL COMMENT '县级代理奖励的比率',
  `citynum` tinyint(4) DEFAULT NULL COMMENT '市级代理人数',
  `cityprice` decimal(10,2) DEFAULT NULL COMMENT '市级代理金额',
  `cityrate` decimal(3,2) DEFAULT NULL COMMENT '市级代理奖励的比率',
  `provincenum` tinyint(4) DEFAULT NULL COMMENT '省级代理人数',
  `provinceorice` decimal(10,2) DEFAULT NULL COMMENT '省级代理金额',
  `provincerate` decimal(3,2) DEFAULT NULL COMMENT '省级代理奖励的比率',
  `reward1` decimal(10,2) DEFAULT NULL COMMENT '一级奖励',
  `reward2` decimal(10,2) DEFAULT NULL COMMENT '二级奖励',
  `cultivationrate` decimal(5,3) DEFAULT NULL COMMENT '市场培育奖享受上一级比例',
  `cultivationshifang` decimal(5,3) DEFAULT NULL COMMENT '市场培育奖获得算力的释放',
  `cny` decimal(10,5) DEFAULT '1.00000' COMMENT 'bow与人民币比率',
  `pool` decimal(5,3) DEFAULT '0.000' COMMENT '算力池比例',
  `sny` decimal(10,5) DEFAULT '1.00000' COMMENT '算力与人民币比率',
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
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(30) NOT NULL,
  `num` int(11) DEFAULT NULL COMMENT ' 销售数量',
  `price` decimal(10,2) DEFAULT NULL COMMENT '团队总业绩',
  `residential` char(10) DEFAULT '1/3' COMMENT '考核小区',
  `pool` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ;

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

# 数据库表：pa_mining 结构信息
DROP TABLE IF EXISTS `pa_mining`;
CREATE TABLE `pa_mining` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `number` decimal(15,5) NOT NULL COMMENT '挖矿数量',
  `receive` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否领取',
  `receive_time` int(11) DEFAULT NULL COMMENT '领取时间',
  `insur` decimal(10,2) DEFAULT NULL COMMENT '矿石',
  `title` char(15) DEFAULT NULL COMMENT '矿的名称',
  `bid` int(11) DEFAULT NULL COMMENT '币种id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='数据模型信息' ;

# 数据库表：pa_mybi 结构信息
DROP TABLE IF EXISTS `pa_mybi`;
CREATE TABLE `pa_mybi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `biid` int(11) NOT NULL COMMENT '币种id',
  `zbi` decimal(15,3) DEFAULT '0.000' COMMENT '总币',
  `bi` decimal(15,3) DEFAULT '0.000' COMMENT '可用币',
  `title` char(20) DEFAULT NULL COMMENT '币名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ;

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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='新闻表' ;

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
  `payno` char(30) NOT NULL DEFAULT '' COMMENT '订单号',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `state` int(2) DEFAULT NULL COMMENT '订单状态 0待支付 1已支付 2已取消',
  `type` char(20) NOT NULL COMMENT '商品类型',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `savetime` int(11) DEFAULT NULL COMMENT '更新时间',
  `display` int(2) DEFAULT '1' COMMENT '订单是否显示 1显示 0隐藏',
  `sum` int(2) DEFAULT NULL COMMENT '数量',
  `price` decimal(10,2) NOT NULL COMMENT '单价',
  `Total` decimal(10,2) DEFAULT NULL COMMENT '总计',
  `fkmethod` tinyint(1) NOT NULL COMMENT '付款方式 1微信  2支付宝',
  `shmsg_id` int(11) NOT NULL COMMENT '收货信息id',
  `beizhu` text NOT NULL COMMENT '备注',
  `fk` tinyint(1) NOT NULL COMMENT '是否付款 0未付 1已付',
  `zt` tinyint(1) NOT NULL COMMENT '支付状态 0待付款 1待发货 3待评价 4待收货 5已完成',
  `fk_time` int(11) NOT NULL COMMENT '付款时间',
  `sid` int(11) NOT NULL COMMENT '店铺id',
  `identification` char(30) NOT NULL COMMENT '每一次生成订单的标示',
  `cid` int(11) NOT NULL COMMENT '优惠券id',
  `express` char(50) NOT NULL COMMENT '快递单号',
  `order_type` char(20) DEFAULT NULL COMMENT '订单类型 shop购物 BOWT充值 agent代理',
  `recommend` int(11) DEFAULT NULL COMMENT '推荐人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='订单表' ;

# 数据库表：pa_orderdetails 结构信息
DROP TABLE IF EXISTS `pa_orderdetails`;
CREATE TABLE `pa_orderdetails` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `payno` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `shoujia` decimal(11,2) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `bid` int(11) NOT NULL,
  `cptype` tinyint(1) NOT NULL,
  `recommend` int(11) DEFAULT NULL COMMENT '推荐人',
  `recommend2` int(11) DEFAULT NULL COMMENT '推荐人的推荐人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 ;

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
  `user_img` varchar(255) NOT NULL DEFAULT '/Uploads/default/header.png' COMMENT '头像',
  `user_background_img` varchar(255) NOT NULL DEFAULT '/Public/Img/default/bgdefault.jpg' COMMENT '背景图片',
  `user_tel` char(20) NOT NULL COMMENT '手机号',
  `user_zjine` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `user_jine` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '用户金额',
  `user_password` char(100) NOT NULL COMMENT '会员密码',
  `user_nickname` char(100) NOT NULL DEFAULT '小蝌蚪' COMMENT '会员昵称',
  `user_introduce` varchar(100) NOT NULL COMMENT '简介(老师)',
  `user_type` char(10) NOT NULL DEFAULT '' COMMENT '会员身份  1普通用户  2第一期初创矿主 3第二期初创矿主',
  `user_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在线  ',
  `user_login` tinyint(3) NOT NULL COMMENT '是否可以登录0可以 1不可以',
  `user_stoptime` int(11) NOT NULL DEFAULT '0' COMMENT '该账号封停的时间',
  `user_logintime` int(11) NOT NULL COMMENT '登录时间',
  `user_registertime` int(11) NOT NULL COMMENT '用户注册时间',
  `user_email` char(30) NOT NULL COMMENT '邮箱',
  `user_qq_openid` char(100) NOT NULL COMMENT 'qq的openid',
  `user_wx_openid` char(100) NOT NULL COMMENT '微信的openid',
  `user_wb_openid` char(100) NOT NULL COMMENT '微博openid',
  `access_token` varchar(255) NOT NULL DEFAULT '1' COMMENT 'token',
  `user_qq_wx_wb` int(1) NOT NULL COMMENT '是否第三方注册0不是 1qq 2 微信 3 微博',
  `user_number` char(20) DEFAULT NULL COMMENT '邀请码',
  `rong_token` char(50) NOT NULL COMMENT '融云token',
  `payword` char(30) DEFAULT '' COMMENT '交易密码',
  `user_birthday` int(11) DEFAULT NULL COMMENT '生日',
  `sort` int(11) NOT NULL DEFAULT '0',
  `recommend` int(11) DEFAULT NULL COMMENT '推荐人id',
  `recommend2` int(11) DEFAULT NULL COMMENT '推荐人的上级',
  `suanli` int(11) DEFAULT '0' COMMENT '总算力算力',
  `flowsuanli` int(11) DEFAULT '0' COMMENT '可用算力',
  `waitsuanli` int(11) DEFAULT NULL COMMENT '待领取算力',
  `ip` varchar(20) DEFAULT '0.0.0.0' COMMENT '注册ip',
  `zmineral` int(11) DEFAULT NULL COMMENT '总矿石 bow',
  `mineral` int(11) DEFAULT '0' COMMENT '矿石 bow',
  `zdiamonds` int(11) DEFAULT NULL,
  `diamonds` int(11) DEFAULT '0' COMMENT '钻石',
  `identity` char(20) DEFAULT NULL COMMENT '身份证号',
  `province` int(11) DEFAULT NULL COMMENT '省',
  `city` int(11) DEFAULT NULL COMMENT '市',
  `county` int(11) DEFAULT NULL COMMENT '区县',
  `marketaward` tinyint(1) DEFAULT '0' COMMENT '市场培育奖判定 1可得奖  2不可',
  `dig` tinyint(2) DEFAULT '0' COMMENT '是否挖宝   0未开启   1开启',
  `datakey` varchar(50) DEFAULT NULL COMMENT 'Data Key',
  `personid` char(20) DEFAULT NULL COMMENT '会员号',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='会员表' ;

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
  `price` double(15,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `release` decimal(5,3) DEFAULT NULL,
  `psize` decimal(5,2) NOT NULL COMMENT '型号',
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='产品表' ;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ;

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
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL COMMENT '课程类别',
  `pid` int(5) DEFAULT '0' COMMENT '类别父类id',
  `createtime` int(11) DEFAULT NULL,
  `type` char(2) DEFAULT 'n',
  `lang` varchar(10) NOT NULL DEFAULT 'zh-cn',
  `poster` varchar(120) DEFAULT NULL COMMENT '分类图片',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ;

# 数据库表：pa_subsidy 结构信息
DROP TABLE IF EXISTS `pa_subsidy`;
CREATE TABLE `pa_subsidy` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subsidy` decimal(5,3) DEFAULT '0.000' COMMENT '补贴比率',
  `num` int(11) DEFAULT NULL COMMENT '销售的数量',
  `price` decimal(15,2) DEFAULT NULL COMMENT '累积销售金额',
  `createtime` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='提现表' ;

# 数据库表：pa_yzm 结构信息
DROP TABLE IF EXISTS `pa_yzm`;
CREATE TABLE `pa_yzm` (
  `id` int(25) unsigned NOT NULL AUTO_INCREMENT,
  `tel` char(15) DEFAULT NULL,
  `yzm` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=271 DEFAULT CHARSET=utf8 COMMENT='验证码' ;

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


# 数据库表：pa_ad 数据信息
INSERT INTO `pa_ad` VALUES ('26','banner','http://','/Uploads/picture/5aa6696c5d38b.jpg','banner','0','zh-cn','<div>
	&nbsp;Blockworld&nbsp;是一个由币圈、链圈、矿圈三圈合一组成闭环的加密数字资产生态系统将项目方、代投机构、数字货币交易所、媒体资源、粉丝社区、矿场建设融合在一起，旨在打造一个增强的去中心化全球算力资源平台。<br />
</div>');
INSERT INTO `pa_ad` VALUES ('27','banner','http://','/Uploads/picture/5aa6697c903aa.jpg','banner','0','zh-cn','<span>&nbsp;Blockworld&nbsp;是一个由币圈、链圈、矿圈三圈合一组成闭环的加密数字资产生态系统将项目方、代投机构、数字货币交易所、媒体资源、粉丝社区、矿场建设融合在一起，旨在打造一个增强的去中心化全球算力资源平台。</span>');
INSERT INTO `pa_ad` VALUES ('29','邀请卡大图','http://','/Uploads/picture/5b0e19b9e33ce.png','invite','0','zh-cn','');
INSERT INTO `pa_ad` VALUES ('30','邀请卡二维码','http://','/Uploads/picture/5b0695916d87f.png','invite2','0','zh-cn','');
INSERT INTO `pa_ad` VALUES ('31','blockworld大图','http://','/Uploads/picture/5b0e199e30a0c.png','blockworld','0','zh-cn','');
INSERT INTO `pa_ad` VALUES ('32','商城大图','http://','/Uploads/picture/5b0e19a8dddf8.png','shop','0','zh-cn','');


# 数据库表：pa_admin 数据信息
INSERT INTO `pa_admin` VALUES ('1','超级管理员','bigqig@126.com','7d415867e498a46da4b52aab30c471ba','1','我是超级管理员 哈哈~~','','1510558320');
INSERT INTO `pa_admin` VALUES ('2','','1018681524@qq.com','3b26d3ed2a4227afa5bcf9b5d5e558a5','1','','','1510740448');
INSERT INTO `pa_admin` VALUES ('3','','huwenliang0921@163.com','2cefe7cf993271b34bda137991f089be','1','','','1510740328');
INSERT INTO `pa_admin` VALUES ('4','','123@qq.com','3b26d3ed2a4227afa5bcf9b5d5e558a5','1','','','1510905983');
INSERT INTO `pa_admin` VALUES ('5','机构管理','bigqig1@126.com','3b26d3ed2a4227afa5bcf9b5d5e558a5','1','','','1510907164');
INSERT INTO `pa_admin` VALUES ('6','6','123123@126.com','7d415867e498a46da4b52aab30c471ba','0','','','1513315559');
INSERT INTO `pa_admin` VALUES ('7','6','456456@126.com','6a66a3d6a4ceeecd469d230541661122','1','','','1513315657');
INSERT INTO `pa_admin` VALUES ('8','2','3412516879@qq.com','c5f1acd4ef01bc07116901337eeb7186','1','中传编辑组','','1514451814');


# 数据库表：pa_agent 数据信息
INSERT INTO `pa_agent` VALUES ('1','24','1','1','北京','1531254672');
INSERT INTO `pa_agent` VALUES ('3','47','3','1','北京市','1526107543');


# 数据库表：pa_applyteacher 数据信息
INSERT INTO `pa_applyteacher` VALUES ('1','张家奇','24','media','1523211232','啊啊啊','请崎岖','15231115232','1512335','1018681524','bigqig@126.com','asdghjasvhkcjnadjklcbasdjk','nuioxmas','asdkhjbcuijsdniovnasduiovidopmcviocacas','','1');
INSERT INTO `pa_applyteacher` VALUES ('2','ddd','47','2','','','ddd','ddd','ddd','ddd','ddd','ddd','ddd','ddd','/Uploads/file/2018-05-28/5b0bcba253224.','');


# 数据库表：pa_at 数据信息
INSERT INTO `pa_at` VALUES ('1','1','jkfna','/Public/Img/default/default.jpg','24','forum','1','1511404950');
INSERT INTO `pa_at` VALUES ('2','1','jkfna','/Public/Img/default/default.jpg','25','','1','1511404950');


# 数据库表：pa_auth 数据信息


# 数据库表：pa_bibi 数据信息
INSERT INTO `pa_bibi` VALUES ('3','BOW','16888.76562','0.800','/Uploads/image/product/20180529/20180529140100_56029.jpg','2123.000000','啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿啊啊啊啊啊阿啊啊啊啊');
INSERT INTO `pa_bibi` VALUES ('4','ITG','99999568.00000','0.200','/Uploads/image/product/20180529/20180529035752_30209.jpg','121.000000','啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊');


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


# 数据库表：pa_car 数据信息
INSERT INTO `pa_car` VALUES ('28','4','52','','0','4','10000.00','1527831575','','0','0','14');


# 数据库表：pa_category 数据信息
INSERT INTO `pa_category` VALUES ('1','0','背景介绍','n','zh-cn','');
INSERT INTO `pa_category` VALUES ('2','0','BlockWorld挖矿简介','n','zh-cn','');
INSERT INTO `pa_category` VALUES ('3','0','算力攻略','n','zh-cn','');
INSERT INTO `pa_category` VALUES ('4','0','奖励规则','n','zh-cn','');
INSERT INTO `pa_category` VALUES ('5','0','头条新闻','n','zh-cn','');
INSERT INTO `pa_category` VALUES ('6','0','城市公告','n','zh-cn','');
INSERT INTO `pa_category` VALUES ('7','0','关于我们','n','zh-cn','');
INSERT INTO `pa_category` VALUES ('8','0','BOWT介绍','n','zh-cn','');
INSERT INTO `pa_category` VALUES ('9','0','算力介绍','n','zh-cn','');
INSERT INTO `pa_category` VALUES ('10','0','矿石介绍','n','zh-cn','');
INSERT INTO `pa_category` VALUES ('11','0','钻石介绍','n','zh-cn','');
INSERT INTO `pa_category` VALUES ('12','0','Data-key','n','zh-cn','');
INSERT INTO `pa_category` VALUES ('13','0','算力商城','p','zh-cn','1');
INSERT INTO `pa_category` VALUES ('14','0','云矿机商城','p','zh-cn','');
INSERT INTO `pa_category` VALUES ('15','0','蚂蚁商城','p','zh-cn','');


# 数据库表：pa_city 数据信息
INSERT INTO `pa_city` VALUES ('7459','0','1','0','全部省份','0','0','','');
INSERT INTO `pa_city` VALUES ('7460','7459','110000','1','北京','1','','','');
INSERT INTO `pa_city` VALUES ('7461','7460','110100','110000','北京市','2','','','');
INSERT INTO `pa_city` VALUES ('7462','7461','110101','110100','东城区','3','','','');
INSERT INTO `pa_city` VALUES ('7463','7461','110102','110100','西城区','3','','','');
INSERT INTO `pa_city` VALUES ('7464','7461','110103','110100','崇文区','3','','','');
INSERT INTO `pa_city` VALUES ('7465','7461','110104','110100','宣武区','3','','','');
INSERT INTO `pa_city` VALUES ('7466','7461','110105','110100','朝阳区','3','','','');
INSERT INTO `pa_city` VALUES ('7467','7461','110106','110100','丰台区','3','','','');
INSERT INTO `pa_city` VALUES ('7468','7461','110107','110100','石景山区','3','','','');
INSERT INTO `pa_city` VALUES ('7469','7461','110108','110100','海淀区','3','','','');
INSERT INTO `pa_city` VALUES ('7470','7461','110109','110100','门头沟区','3','','','');
INSERT INTO `pa_city` VALUES ('7471','7461','110111','110100','房山区','3','','','');
INSERT INTO `pa_city` VALUES ('7472','7461','110112','110100','通州区','3','','','');
INSERT INTO `pa_city` VALUES ('7473','7461','110113','110100','顺义区','3','','','');
INSERT INTO `pa_city` VALUES ('7474','7461','110114','110100','昌平区','3','','','');
INSERT INTO `pa_city` VALUES ('7475','7461','110115','110100','大兴区','3','','','');
INSERT INTO `pa_city` VALUES ('7476','7461','110116','110100','怀柔区','3','','','');
INSERT INTO `pa_city` VALUES ('7477','7461','110117','110100','平谷区','3','','','');
INSERT INTO `pa_city` VALUES ('7478','7461','110228','110100','密云县','3','','','');
INSERT INTO `pa_city` VALUES ('7479','7461','110229','110100','延庆县','3','','','');
INSERT INTO `pa_city` VALUES ('7480','7461','110230','110100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7481','7459','120000','1','天津','1','','','');
INSERT INTO `pa_city` VALUES ('7482','7481','120100','120000','天津市','2','','','');
INSERT INTO `pa_city` VALUES ('7483','7482','120101','120100','和平区','3','','','');
INSERT INTO `pa_city` VALUES ('7484','7482','120102','120100','河东区','3','','','');
INSERT INTO `pa_city` VALUES ('7485','7482','120103','120100','河西区','3','','','');
INSERT INTO `pa_city` VALUES ('7486','7482','120104','120100','南开区','3','','','');
INSERT INTO `pa_city` VALUES ('7487','7482','120105','120100','河北区','3','','','');
INSERT INTO `pa_city` VALUES ('7488','7482','120106','120100','红桥区','3','','','');
INSERT INTO `pa_city` VALUES ('7489','7482','120107','120100','塘沽区','3','','','');
INSERT INTO `pa_city` VALUES ('7490','7482','120108','120100','汉沽区','3','','','');
INSERT INTO `pa_city` VALUES ('7491','7482','120109','120100','大港区','3','','','');
INSERT INTO `pa_city` VALUES ('7492','7482','120110','120100','东丽区','3','','','');
INSERT INTO `pa_city` VALUES ('7493','7482','120111','120100','西青区','3','','','');
INSERT INTO `pa_city` VALUES ('7494','7482','120112','120100','津南区','3','','','');
INSERT INTO `pa_city` VALUES ('7495','7482','120113','120100','北辰区','3','','','');
INSERT INTO `pa_city` VALUES ('7496','7482','120114','120100','武清区','3','','','');
INSERT INTO `pa_city` VALUES ('7497','7482','120115','120100','宝坻区','3','','','');
INSERT INTO `pa_city` VALUES ('7498','7482','120116','120100','滨海新区','3','','','');
INSERT INTO `pa_city` VALUES ('7499','7482','120221','120100','宁河县','3','','','');
INSERT INTO `pa_city` VALUES ('7500','7482','120223','120100','静海县','3','','','');
INSERT INTO `pa_city` VALUES ('7501','7482','120225','120100','蓟县','3','','','');
INSERT INTO `pa_city` VALUES ('7502','7482','120226','120100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7503','7459','130000','1','河北省','1','','','');
INSERT INTO `pa_city` VALUES ('7504','7503','130100','130000','石家庄市','2','','','');
INSERT INTO `pa_city` VALUES ('7505','7504','130102','130100','长安区','3','','','');
INSERT INTO `pa_city` VALUES ('7506','7504','130103','130100','桥东区','3','','','');
INSERT INTO `pa_city` VALUES ('7507','7504','130104','130100','桥西区','3','','','');
INSERT INTO `pa_city` VALUES ('7508','7504','130105','130100','新华区','3','','','');
INSERT INTO `pa_city` VALUES ('7509','7504','130107','130100','井陉矿区','3','','','');
INSERT INTO `pa_city` VALUES ('7510','7504','130108','130100','裕华区','3','','','');
INSERT INTO `pa_city` VALUES ('7511','7504','130121','130100','井陉县','3','','','');
INSERT INTO `pa_city` VALUES ('7512','7504','130123','130100','正定县','3','','','');
INSERT INTO `pa_city` VALUES ('7513','7504','130124','130100','栾城县','3','','','');
INSERT INTO `pa_city` VALUES ('7514','7504','130125','130100','行唐县','3','','','');
INSERT INTO `pa_city` VALUES ('7515','7504','130126','130100','灵寿县','3','','','');
INSERT INTO `pa_city` VALUES ('7516','7504','130127','130100','高邑县','3','','','');
INSERT INTO `pa_city` VALUES ('7517','7504','130128','130100','深泽县','3','','','');
INSERT INTO `pa_city` VALUES ('7518','7504','130129','130100','赞皇县','3','','','');
INSERT INTO `pa_city` VALUES ('7519','7504','130130','130100','无极县','3','','','');
INSERT INTO `pa_city` VALUES ('7520','7504','130131','130100','平山县','3','','','');
INSERT INTO `pa_city` VALUES ('7521','7504','130132','130100','元氏县','3','','','');
INSERT INTO `pa_city` VALUES ('7522','7504','130133','130100','赵县','3','','','');
INSERT INTO `pa_city` VALUES ('7523','7504','130181','130100','辛集市','3','','','');
INSERT INTO `pa_city` VALUES ('7524','7504','130182','130100','藁城市','3','','','');
INSERT INTO `pa_city` VALUES ('7525','7504','130183','130100','晋州市','3','','','');
INSERT INTO `pa_city` VALUES ('7526','7504','130184','130100','新乐市','3','','','');
INSERT INTO `pa_city` VALUES ('7527','7504','130185','130100','鹿泉市','3','','','');
INSERT INTO `pa_city` VALUES ('7528','7504','130186','130100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7529','7503','130200','130000','唐山市','2','','','');
INSERT INTO `pa_city` VALUES ('7530','7529','130202','130200','路南区','3','','','');
INSERT INTO `pa_city` VALUES ('7531','7529','130203','130200','路北区','3','','','');
INSERT INTO `pa_city` VALUES ('7532','7529','130204','130200','古冶区','3','','','');
INSERT INTO `pa_city` VALUES ('7533','7529','130205','130200','开平区','3','','','');
INSERT INTO `pa_city` VALUES ('7534','7529','130207','130200','丰南区','3','','','');
INSERT INTO `pa_city` VALUES ('7535','7529','130208','130200','丰润区','3','','','');
INSERT INTO `pa_city` VALUES ('7536','7529','130223','130200','滦县','3','','','');
INSERT INTO `pa_city` VALUES ('7537','7529','130224','130200','滦南县','3','','','');
INSERT INTO `pa_city` VALUES ('7538','7529','130225','130200','乐亭县','3','','','');
INSERT INTO `pa_city` VALUES ('7539','7529','130227','130200','迁西县','3','','','');
INSERT INTO `pa_city` VALUES ('7540','7529','130229','130200','玉田县','3','','','');
INSERT INTO `pa_city` VALUES ('7541','7529','130230','130200','唐海县','3','','','');
INSERT INTO `pa_city` VALUES ('7542','7529','130281','130200','遵化市','3','','','');
INSERT INTO `pa_city` VALUES ('7543','7529','130283','130200','迁安市','3','','','');
INSERT INTO `pa_city` VALUES ('7544','7529','130284','130200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7545','7503','130300','130000','秦皇岛市','2','','','');
INSERT INTO `pa_city` VALUES ('7546','7545','130302','130300','海港区','3','','','');
INSERT INTO `pa_city` VALUES ('7547','7545','130303','130300','山海关区','3','','','');
INSERT INTO `pa_city` VALUES ('7548','7545','130304','130300','北戴河区','3','','','');
INSERT INTO `pa_city` VALUES ('7549','7545','130321','130300','青龙满族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('7550','7545','130322','130300','昌黎县','3','','','');
INSERT INTO `pa_city` VALUES ('7551','7545','130323','130300','抚宁县','3','','','');
INSERT INTO `pa_city` VALUES ('7552','7545','130324','130300','卢龙县','3','','','');
INSERT INTO `pa_city` VALUES ('7553','7545','130398','130300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7554','7545','130399','130300','经济技术开发区','3','','','');
INSERT INTO `pa_city` VALUES ('7555','7503','130400','130000','邯郸市','2','','','');
INSERT INTO `pa_city` VALUES ('7556','7555','130402','130400','邯山区','3','','','');
INSERT INTO `pa_city` VALUES ('7557','7555','130403','130400','丛台区','3','','','');
INSERT INTO `pa_city` VALUES ('7558','7555','130404','130400','复兴区','3','','','');
INSERT INTO `pa_city` VALUES ('7559','7555','130406','130400','峰峰矿区','3','','','');
INSERT INTO `pa_city` VALUES ('7560','7555','130421','130400','邯郸县','3','','','');
INSERT INTO `pa_city` VALUES ('7561','7555','130423','130400','临漳县','3','','','');
INSERT INTO `pa_city` VALUES ('7562','7555','130424','130400','成安县','3','','','');
INSERT INTO `pa_city` VALUES ('7563','7555','130425','130400','大名县','3','','','');
INSERT INTO `pa_city` VALUES ('7564','7555','130426','130400','涉县','3','','','');
INSERT INTO `pa_city` VALUES ('7565','7555','130427','130400','磁县','3','','','');
INSERT INTO `pa_city` VALUES ('7566','7555','130428','130400','肥乡县','3','','','');
INSERT INTO `pa_city` VALUES ('7567','7555','130429','130400','永年县','3','','','');
INSERT INTO `pa_city` VALUES ('7568','7555','130430','130400','邱县','3','','','');
INSERT INTO `pa_city` VALUES ('7569','7555','130431','130400','鸡泽县','3','','','');
INSERT INTO `pa_city` VALUES ('7570','7555','130432','130400','广平县','3','','','');
INSERT INTO `pa_city` VALUES ('7571','7555','130433','130400','馆陶县','3','','','');
INSERT INTO `pa_city` VALUES ('7572','7555','130434','130400','魏县','3','','','');
INSERT INTO `pa_city` VALUES ('7573','7555','130435','130400','曲周县','3','','','');
INSERT INTO `pa_city` VALUES ('7574','7555','130481','130400','武安市','3','','','');
INSERT INTO `pa_city` VALUES ('7575','7555','130482','130400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7576','7503','130500','130000','邢台市','2','','','');
INSERT INTO `pa_city` VALUES ('7577','7576','130502','130500','桥东区','3','','','');
INSERT INTO `pa_city` VALUES ('7578','7576','130503','130500','桥西区','3','','','');
INSERT INTO `pa_city` VALUES ('7579','7576','130521','130500','邢台县','3','','','');
INSERT INTO `pa_city` VALUES ('7580','7576','130522','130500','临城县','3','','','');
INSERT INTO `pa_city` VALUES ('7581','7576','130523','130500','内丘县','3','','','');
INSERT INTO `pa_city` VALUES ('7582','7576','130524','130500','柏乡县','3','','','');
INSERT INTO `pa_city` VALUES ('7583','7576','130525','130500','隆尧县','3','','','');
INSERT INTO `pa_city` VALUES ('7584','7576','130526','130500','任县','3','','','');
INSERT INTO `pa_city` VALUES ('7585','7576','130527','130500','南和县','3','','','');
INSERT INTO `pa_city` VALUES ('7586','7576','130528','130500','宁晋县','3','','','');
INSERT INTO `pa_city` VALUES ('7587','7576','130529','130500','巨鹿县','3','','','');
INSERT INTO `pa_city` VALUES ('7588','7576','130530','130500','新河县','3','','','');
INSERT INTO `pa_city` VALUES ('7589','7576','130531','130500','广宗县','3','','','');
INSERT INTO `pa_city` VALUES ('7590','7576','130532','130500','平乡县','3','','','');
INSERT INTO `pa_city` VALUES ('7591','7576','130533','130500','威县','3','','','');
INSERT INTO `pa_city` VALUES ('7592','7576','130534','130500','清河县','3','','','');
INSERT INTO `pa_city` VALUES ('7593','7576','130535','130500','临西县','3','','','');
INSERT INTO `pa_city` VALUES ('7594','7576','130581','130500','南宫市','3','','','');
INSERT INTO `pa_city` VALUES ('7595','7576','130582','130500','沙河市','3','','','');
INSERT INTO `pa_city` VALUES ('7596','7576','130583','130500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7597','7503','130600','130000','保定市','2','','','');
INSERT INTO `pa_city` VALUES ('7598','7597','130602','130600','新市区','3','','','');
INSERT INTO `pa_city` VALUES ('7599','7597','130603','130600','北市区','3','','','');
INSERT INTO `pa_city` VALUES ('7600','7597','130604','130600','南市区','3','','','');
INSERT INTO `pa_city` VALUES ('7601','7597','130621','130600','满城县','3','','','');
INSERT INTO `pa_city` VALUES ('7602','7597','130622','130600','清苑县','3','','','');
INSERT INTO `pa_city` VALUES ('7603','7597','130623','130600','涞水县','3','','','');
INSERT INTO `pa_city` VALUES ('7604','7597','130624','130600','阜平县','3','','','');
INSERT INTO `pa_city` VALUES ('7605','7597','130625','130600','徐水县','3','','','');
INSERT INTO `pa_city` VALUES ('7606','7597','130626','130600','定兴县','3','','','');
INSERT INTO `pa_city` VALUES ('7607','7597','130627','130600','唐县','3','','','');
INSERT INTO `pa_city` VALUES ('7608','7597','130628','130600','高阳县','3','','','');
INSERT INTO `pa_city` VALUES ('7609','7597','130629','130600','容城县','3','','','');
INSERT INTO `pa_city` VALUES ('7610','7597','130630','130600','涞源县','3','','','');
INSERT INTO `pa_city` VALUES ('7611','7597','130631','130600','望都县','3','','','');
INSERT INTO `pa_city` VALUES ('7612','7597','130632','130600','安新县','3','','','');
INSERT INTO `pa_city` VALUES ('7613','7597','130633','130600','易县','3','','','');
INSERT INTO `pa_city` VALUES ('7614','7597','130634','130600','曲阳县','3','','','');
INSERT INTO `pa_city` VALUES ('7615','7597','130635','130600','蠡县','3','','','');
INSERT INTO `pa_city` VALUES ('7616','7597','130636','130600','顺平县','3','','','');
INSERT INTO `pa_city` VALUES ('7617','7597','130637','130600','博野县','3','','','');
INSERT INTO `pa_city` VALUES ('7618','7597','130638','130600','雄县','3','','','');
INSERT INTO `pa_city` VALUES ('7619','7597','130681','130600','涿州市','3','','','');
INSERT INTO `pa_city` VALUES ('7620','7597','130682','130600','定州市','3','','','');
INSERT INTO `pa_city` VALUES ('7621','7597','130683','130600','安国市','3','','','');
INSERT INTO `pa_city` VALUES ('7622','7597','130684','130600','高碑店市','3','','','');
INSERT INTO `pa_city` VALUES ('7623','7597','130698','130600','高开区','3','','','');
INSERT INTO `pa_city` VALUES ('7624','7597','130699','130600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7625','7503','130700','130000','张家口市','2','','','');
INSERT INTO `pa_city` VALUES ('7626','7625','130702','130700','桥东区','3','','','');
INSERT INTO `pa_city` VALUES ('7627','7625','130703','130700','桥西区','3','','','');
INSERT INTO `pa_city` VALUES ('7628','7625','130705','130700','宣化区','3','','','');
INSERT INTO `pa_city` VALUES ('7629','7625','130706','130700','下花园区','3','','','');
INSERT INTO `pa_city` VALUES ('7630','7625','130721','130700','宣化县','3','','','');
INSERT INTO `pa_city` VALUES ('7631','7625','130722','130700','张北县','3','','','');
INSERT INTO `pa_city` VALUES ('7632','7625','130723','130700','康保县','3','','','');
INSERT INTO `pa_city` VALUES ('7633','7625','130724','130700','沽源县','3','','','');
INSERT INTO `pa_city` VALUES ('7634','7625','130725','130700','尚义县','3','','','');
INSERT INTO `pa_city` VALUES ('7635','7625','130726','130700','蔚县','3','','','');
INSERT INTO `pa_city` VALUES ('7636','7625','130727','130700','阳原县','3','','','');
INSERT INTO `pa_city` VALUES ('7637','7625','130728','130700','怀安县','3','','','');
INSERT INTO `pa_city` VALUES ('7638','7625','130729','130700','万全县','3','','','');
INSERT INTO `pa_city` VALUES ('7639','7625','130730','130700','怀来县','3','','','');
INSERT INTO `pa_city` VALUES ('7640','7625','130731','130700','涿鹿县','3','','','');
INSERT INTO `pa_city` VALUES ('7641','7625','130732','130700','赤城县','3','','','');
INSERT INTO `pa_city` VALUES ('7642','7625','130733','130700','崇礼县','3','','','');
INSERT INTO `pa_city` VALUES ('7643','7625','130734','130700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7644','7503','130800','130000','承德市','2','','','');
INSERT INTO `pa_city` VALUES ('7645','7644','130802','130800','双桥区','3','','','');
INSERT INTO `pa_city` VALUES ('7646','7644','130803','130800','双滦区','3','','','');
INSERT INTO `pa_city` VALUES ('7647','7644','130804','130800','鹰手营子矿区','3','','','');
INSERT INTO `pa_city` VALUES ('7648','7644','130821','130800','承德县','3','','','');
INSERT INTO `pa_city` VALUES ('7649','7644','130822','130800','兴隆县','3','','','');
INSERT INTO `pa_city` VALUES ('7650','7644','130823','130800','平泉县','3','','','');
INSERT INTO `pa_city` VALUES ('7651','7644','130824','130800','滦平县','3','','','');
INSERT INTO `pa_city` VALUES ('7652','7644','130825','130800','隆化县','3','','','');
INSERT INTO `pa_city` VALUES ('7653','7644','130826','130800','丰宁满族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('7654','7644','130827','130800','宽城满族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('7655','7644','130828','130800','围场满族蒙古族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('7656','7644','130829','130800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7657','7503','130900','130000','沧州市','2','','','');
INSERT INTO `pa_city` VALUES ('7658','7657','130902','130900','新华区','3','','','');
INSERT INTO `pa_city` VALUES ('7659','7657','130903','130900','运河区','3','','','');
INSERT INTO `pa_city` VALUES ('7660','7657','130921','130900','沧县','3','','','');
INSERT INTO `pa_city` VALUES ('7661','7657','130922','130900','青县','3','','','');
INSERT INTO `pa_city` VALUES ('7662','7657','130923','130900','东光县','3','','','');
INSERT INTO `pa_city` VALUES ('7663','7657','130924','130900','海兴县','3','','','');
INSERT INTO `pa_city` VALUES ('7664','7657','130925','130900','盐山县','3','','','');
INSERT INTO `pa_city` VALUES ('7665','7657','130926','130900','肃宁县','3','','','');
INSERT INTO `pa_city` VALUES ('7666','7657','130927','130900','南皮县','3','','','');
INSERT INTO `pa_city` VALUES ('7667','7657','130928','130900','吴桥县','3','','','');
INSERT INTO `pa_city` VALUES ('7668','7657','130929','130900','献县','3','','','');
INSERT INTO `pa_city` VALUES ('7669','7657','130930','130900','孟村回族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('7670','7657','130981','130900','泊头市','3','','','');
INSERT INTO `pa_city` VALUES ('7671','7657','130982','130900','任丘市','3','','','');
INSERT INTO `pa_city` VALUES ('7672','7657','130983','130900','黄骅市','3','','','');
INSERT INTO `pa_city` VALUES ('7673','7657','130984','130900','河间市','3','','','');
INSERT INTO `pa_city` VALUES ('7674','7657','130985','130900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7675','7503','131000','130000','廊坊市','2','','','');
INSERT INTO `pa_city` VALUES ('7676','7675','131002','131000','安次区','3','','','');
INSERT INTO `pa_city` VALUES ('7677','7675','131003','131000','广阳区','3','','','');
INSERT INTO `pa_city` VALUES ('7678','7675','131022','131000','固安县','3','','','');
INSERT INTO `pa_city` VALUES ('7679','7675','131023','131000','永清县','3','','','');
INSERT INTO `pa_city` VALUES ('7680','7675','131024','131000','香河县','3','','','');
INSERT INTO `pa_city` VALUES ('7681','7675','131025','131000','大城县','3','','','');
INSERT INTO `pa_city` VALUES ('7682','7675','131026','131000','文安县','3','','','');
INSERT INTO `pa_city` VALUES ('7683','7675','131028','131000','大厂回族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('7684','7675','131051','131000','开发区','3','','','');
INSERT INTO `pa_city` VALUES ('7685','7675','131052','131000','燕郊经济技术开发区','3','','','');
INSERT INTO `pa_city` VALUES ('7686','7675','131081','131000','霸州市','3','','','');
INSERT INTO `pa_city` VALUES ('7687','7675','131082','131000','三河市','3','','','');
INSERT INTO `pa_city` VALUES ('7688','7675','131083','131000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7689','7503','131100','130000','衡水市','2','','','');
INSERT INTO `pa_city` VALUES ('7690','7689','131102','131100','桃城区','3','','','');
INSERT INTO `pa_city` VALUES ('7691','7689','131121','131100','枣强县','3','','','');
INSERT INTO `pa_city` VALUES ('7692','7689','131122','131100','武邑县','3','','','');
INSERT INTO `pa_city` VALUES ('7693','7689','131123','131100','武强县','3','','','');
INSERT INTO `pa_city` VALUES ('7694','7689','131124','131100','饶阳县','3','','','');
INSERT INTO `pa_city` VALUES ('7695','7689','131125','131100','安平县','3','','','');
INSERT INTO `pa_city` VALUES ('7696','7689','131126','131100','故城县','3','','','');
INSERT INTO `pa_city` VALUES ('7697','7689','131127','131100','景县','3','','','');
INSERT INTO `pa_city` VALUES ('7698','7689','131128','131100','阜城县','3','','','');
INSERT INTO `pa_city` VALUES ('7699','7689','131181','131100','冀州市','3','','','');
INSERT INTO `pa_city` VALUES ('7700','7689','131182','131100','深州市','3','','','');
INSERT INTO `pa_city` VALUES ('7701','7689','131183','131100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7702','7459','140000','1','山西省','1','','','');
INSERT INTO `pa_city` VALUES ('7703','7702','140100','140000','太原市','2','','','');
INSERT INTO `pa_city` VALUES ('7704','7703','140105','140100','小店区','3','','','');
INSERT INTO `pa_city` VALUES ('7705','7703','140106','140100','迎泽区','3','','','');
INSERT INTO `pa_city` VALUES ('7706','7703','140107','140100','杏花岭区','3','','','');
INSERT INTO `pa_city` VALUES ('7707','7703','140108','140100','尖草坪区','3','','','');
INSERT INTO `pa_city` VALUES ('7708','7703','140109','140100','万柏林区','3','','','');
INSERT INTO `pa_city` VALUES ('7709','7703','140110','140100','晋源区','3','','','');
INSERT INTO `pa_city` VALUES ('7710','7703','140121','140100','清徐县','3','','','');
INSERT INTO `pa_city` VALUES ('7711','7703','140122','140100','阳曲县','3','','','');
INSERT INTO `pa_city` VALUES ('7712','7703','140123','140100','娄烦县','3','','','');
INSERT INTO `pa_city` VALUES ('7713','7703','140181','140100','古交市','3','','','');
INSERT INTO `pa_city` VALUES ('7714','7703','140182','140100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7715','7702','140200','140000','大同市','2','','','');
INSERT INTO `pa_city` VALUES ('7716','7715','140202','140200','城区','3','','','');
INSERT INTO `pa_city` VALUES ('7717','7715','140203','140200','矿区','3','','','');
INSERT INTO `pa_city` VALUES ('7718','7715','140211','140200','南郊区','3','','','');
INSERT INTO `pa_city` VALUES ('7719','7715','140212','140200','新荣区','3','','','');
INSERT INTO `pa_city` VALUES ('7720','7715','140221','140200','阳高县','3','','','');
INSERT INTO `pa_city` VALUES ('7721','7715','140222','140200','天镇县','3','','','');
INSERT INTO `pa_city` VALUES ('7722','7715','140223','140200','广灵县','3','','','');
INSERT INTO `pa_city` VALUES ('7723','7715','140224','140200','灵丘县','3','','','');
INSERT INTO `pa_city` VALUES ('7724','7715','140225','140200','浑源县','3','','','');
INSERT INTO `pa_city` VALUES ('7725','7715','140226','140200','左云县','3','','','');
INSERT INTO `pa_city` VALUES ('7726','7715','140227','140200','大同县','3','','','');
INSERT INTO `pa_city` VALUES ('7727','7715','140228','140200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7728','7702','140300','140000','阳泉市','2','','','');
INSERT INTO `pa_city` VALUES ('7729','7728','140302','140300','城区','3','','','');
INSERT INTO `pa_city` VALUES ('7730','7728','140303','140300','矿区','3','','','');
INSERT INTO `pa_city` VALUES ('7731','7728','140311','140300','郊区','3','','','');
INSERT INTO `pa_city` VALUES ('7732','7728','140321','140300','平定县','3','','','');
INSERT INTO `pa_city` VALUES ('7733','7728','140322','140300','盂县','3','','','');
INSERT INTO `pa_city` VALUES ('7734','7728','140323','140300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7735','7702','140400','140000','长治市','2','','','');
INSERT INTO `pa_city` VALUES ('7736','7735','140421','140400','长治县','3','','','');
INSERT INTO `pa_city` VALUES ('7737','7735','140423','140400','襄垣县','3','','','');
INSERT INTO `pa_city` VALUES ('7738','7735','140424','140400','屯留县','3','','','');
INSERT INTO `pa_city` VALUES ('7739','7735','140425','140400','平顺县','3','','','');
INSERT INTO `pa_city` VALUES ('7740','7735','140426','140400','黎城县','3','','','');
INSERT INTO `pa_city` VALUES ('7741','7735','140427','140400','壶关县','3','','','');
INSERT INTO `pa_city` VALUES ('7742','7735','140428','140400','长子县','3','','','');
INSERT INTO `pa_city` VALUES ('7743','7735','140429','140400','武乡县','3','','','');
INSERT INTO `pa_city` VALUES ('7744','7735','140430','140400','沁县','3','','','');
INSERT INTO `pa_city` VALUES ('7745','7735','140431','140400','沁源县','3','','','');
INSERT INTO `pa_city` VALUES ('7746','7735','140481','140400','潞城市','3','','','');
INSERT INTO `pa_city` VALUES ('7747','7735','140482','140400','城区','3','','','');
INSERT INTO `pa_city` VALUES ('7748','7735','140483','140400','郊区','3','','','');
INSERT INTO `pa_city` VALUES ('7749','7735','140484','140400','高新区','3','','','');
INSERT INTO `pa_city` VALUES ('7750','7735','140485','140400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7751','7702','140500','140000','晋城市','2','','','');
INSERT INTO `pa_city` VALUES ('7752','7751','140502','140500','城区','3','','','');
INSERT INTO `pa_city` VALUES ('7753','7751','140521','140500','沁水县','3','','','');
INSERT INTO `pa_city` VALUES ('7754','7751','140522','140500','阳城县','3','','','');
INSERT INTO `pa_city` VALUES ('7755','7751','140524','140500','陵川县','3','','','');
INSERT INTO `pa_city` VALUES ('7756','7751','140525','140500','泽州县','3','','','');
INSERT INTO `pa_city` VALUES ('7757','7751','140581','140500','高平市','3','','','');
INSERT INTO `pa_city` VALUES ('7758','7751','140582','140500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7759','7702','140600','140000','朔州市','2','','','');
INSERT INTO `pa_city` VALUES ('7760','7759','140602','140600','朔城区','3','','','');
INSERT INTO `pa_city` VALUES ('7761','7759','140603','140600','平鲁区','3','','','');
INSERT INTO `pa_city` VALUES ('7762','7759','140621','140600','山阴县','3','','','');
INSERT INTO `pa_city` VALUES ('7763','7759','140622','140600','应县','3','','','');
INSERT INTO `pa_city` VALUES ('7764','7759','140623','140600','右玉县','3','','','');
INSERT INTO `pa_city` VALUES ('7765','7759','140624','140600','怀仁县','3','','','');
INSERT INTO `pa_city` VALUES ('7766','7759','140625','140600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7767','7702','140700','140000','晋中市','2','','','');
INSERT INTO `pa_city` VALUES ('7768','7767','140702','140700','榆次区','3','','','');
INSERT INTO `pa_city` VALUES ('7769','7767','140721','140700','榆社县','3','','','');
INSERT INTO `pa_city` VALUES ('7770','7767','140722','140700','左权县','3','','','');
INSERT INTO `pa_city` VALUES ('7771','7767','140723','140700','和顺县','3','','','');
INSERT INTO `pa_city` VALUES ('7772','7767','140724','140700','昔阳县','3','','','');
INSERT INTO `pa_city` VALUES ('7773','7767','140725','140700','寿阳县','3','','','');
INSERT INTO `pa_city` VALUES ('7774','7767','140726','140700','太谷县','3','','','');
INSERT INTO `pa_city` VALUES ('7775','7767','140727','140700','祁县','3','','','');
INSERT INTO `pa_city` VALUES ('7776','7767','140728','140700','平遥县','3','','','');
INSERT INTO `pa_city` VALUES ('7777','7767','140729','140700','灵石县','3','','','');
INSERT INTO `pa_city` VALUES ('7778','7767','140781','140700','介休市','3','','','');
INSERT INTO `pa_city` VALUES ('7779','7767','140782','140700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7780','7702','140800','140000','运城市','2','','','');
INSERT INTO `pa_city` VALUES ('7781','7780','140802','140800','盐湖区','3','','','');
INSERT INTO `pa_city` VALUES ('7782','7780','140821','140800','临猗县','3','','','');
INSERT INTO `pa_city` VALUES ('7783','7780','140822','140800','万荣县','3','','','');
INSERT INTO `pa_city` VALUES ('7784','7780','140823','140800','闻喜县','3','','','');
INSERT INTO `pa_city` VALUES ('7785','7780','140824','140800','稷山县','3','','','');
INSERT INTO `pa_city` VALUES ('7786','7780','140825','140800','新绛县','3','','','');
INSERT INTO `pa_city` VALUES ('7787','7780','140826','140800','绛县','3','','','');
INSERT INTO `pa_city` VALUES ('7788','7780','140827','140800','垣曲县','3','','','');
INSERT INTO `pa_city` VALUES ('7789','7780','140828','140800','夏县','3','','','');
INSERT INTO `pa_city` VALUES ('7790','7780','140829','140800','平陆县','3','','','');
INSERT INTO `pa_city` VALUES ('7791','7780','140830','140800','芮城县','3','','','');
INSERT INTO `pa_city` VALUES ('7792','7780','140881','140800','永济市','3','','','');
INSERT INTO `pa_city` VALUES ('7793','7780','140882','140800','河津市','3','','','');
INSERT INTO `pa_city` VALUES ('7794','7780','140883','140800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7795','7702','140900','140000','忻州市','2','','','');
INSERT INTO `pa_city` VALUES ('7796','7795','140902','140900','忻府区','3','','','');
INSERT INTO `pa_city` VALUES ('7797','7795','140921','140900','定襄县','3','','','');
INSERT INTO `pa_city` VALUES ('7798','7795','140922','140900','五台县','3','','','');
INSERT INTO `pa_city` VALUES ('7799','7795','140923','140900','代县','3','','','');
INSERT INTO `pa_city` VALUES ('7800','7795','140924','140900','繁峙县','3','','','');
INSERT INTO `pa_city` VALUES ('7801','7795','140925','140900','宁武县','3','','','');
INSERT INTO `pa_city` VALUES ('7802','7795','140926','140900','静乐县','3','','','');
INSERT INTO `pa_city` VALUES ('7803','7795','140927','140900','神池县','3','','','');
INSERT INTO `pa_city` VALUES ('7804','7795','140928','140900','五寨县','3','','','');
INSERT INTO `pa_city` VALUES ('7805','7795','140929','140900','岢岚县','3','','','');
INSERT INTO `pa_city` VALUES ('7806','7795','140930','140900','河曲县','3','','','');
INSERT INTO `pa_city` VALUES ('7807','7795','140931','140900','保德县','3','','','');
INSERT INTO `pa_city` VALUES ('7808','7795','140932','140900','偏关县','3','','','');
INSERT INTO `pa_city` VALUES ('7809','7795','140981','140900','原平市','3','','','');
INSERT INTO `pa_city` VALUES ('7810','7795','140982','140900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7811','7702','141000','140000','临汾市','2','','','');
INSERT INTO `pa_city` VALUES ('7812','7811','141002','141000','尧都区','3','','','');
INSERT INTO `pa_city` VALUES ('7813','7811','141021','141000','曲沃县','3','','','');
INSERT INTO `pa_city` VALUES ('7814','7811','141022','141000','翼城县','3','','','');
INSERT INTO `pa_city` VALUES ('7815','7811','141023','141000','襄汾县','3','','','');
INSERT INTO `pa_city` VALUES ('7816','7811','141024','141000','洪洞县','3','','','');
INSERT INTO `pa_city` VALUES ('7817','7811','141025','141000','古县','3','','','');
INSERT INTO `pa_city` VALUES ('7818','7811','141026','141000','安泽县','3','','','');
INSERT INTO `pa_city` VALUES ('7819','7811','141027','141000','浮山县','3','','','');
INSERT INTO `pa_city` VALUES ('7820','7811','141028','141000','吉县','3','','','');
INSERT INTO `pa_city` VALUES ('7821','7811','141029','141000','乡宁县','3','','','');
INSERT INTO `pa_city` VALUES ('7822','7811','141030','141000','大宁县','3','','','');
INSERT INTO `pa_city` VALUES ('7823','7811','141031','141000','隰县','3','','','');
INSERT INTO `pa_city` VALUES ('7824','7811','141032','141000','永和县','3','','','');
INSERT INTO `pa_city` VALUES ('7825','7811','141033','141000','蒲县','3','','','');
INSERT INTO `pa_city` VALUES ('7826','7811','141034','141000','汾西县','3','','','');
INSERT INTO `pa_city` VALUES ('7827','7811','141081','141000','侯马市','3','','','');
INSERT INTO `pa_city` VALUES ('7828','7811','141082','141000','霍州市','3','','','');
INSERT INTO `pa_city` VALUES ('7829','7811','141083','141000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7830','7702','141100','140000','吕梁市','2','','','');
INSERT INTO `pa_city` VALUES ('7831','7830','141102','141100','离石区','3','','','');
INSERT INTO `pa_city` VALUES ('7832','7830','141121','141100','文水县','3','','','');
INSERT INTO `pa_city` VALUES ('7833','7830','141122','141100','交城县','3','','','');
INSERT INTO `pa_city` VALUES ('7834','7830','141123','141100','兴县','3','','','');
INSERT INTO `pa_city` VALUES ('7835','7830','141124','141100','临县','3','','','');
INSERT INTO `pa_city` VALUES ('7836','7830','141125','141100','柳林县','3','','','');
INSERT INTO `pa_city` VALUES ('7837','7830','141126','141100','石楼县','3','','','');
INSERT INTO `pa_city` VALUES ('7838','7830','141127','141100','岚县','3','','','');
INSERT INTO `pa_city` VALUES ('7839','7830','141128','141100','方山县','3','','','');
INSERT INTO `pa_city` VALUES ('7840','7830','141129','141100','中阳县','3','','','');
INSERT INTO `pa_city` VALUES ('7841','7830','141130','141100','交口县','3','','','');
INSERT INTO `pa_city` VALUES ('7842','7830','141181','141100','孝义市','3','','','');
INSERT INTO `pa_city` VALUES ('7843','7830','141182','141100','汾阳市','3','','','');
INSERT INTO `pa_city` VALUES ('7844','7830','141183','141100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7845','7459','150000','1','内蒙古自治区','1','','','');
INSERT INTO `pa_city` VALUES ('7846','7845','150100','150000','呼和浩特市','2','','','');
INSERT INTO `pa_city` VALUES ('7847','7846','150102','150100','新城区','3','','','');
INSERT INTO `pa_city` VALUES ('7848','7846','150103','150100','回民区','3','','','');
INSERT INTO `pa_city` VALUES ('7849','7846','150104','150100','玉泉区','3','','','');
INSERT INTO `pa_city` VALUES ('7850','7846','150105','150100','赛罕区','3','','','');
INSERT INTO `pa_city` VALUES ('7851','7846','150121','150100','土默特左旗','3','','','');
INSERT INTO `pa_city` VALUES ('7852','7846','150122','150100','托克托县','3','','','');
INSERT INTO `pa_city` VALUES ('7853','7846','150123','150100','和林格尔县','3','','','');
INSERT INTO `pa_city` VALUES ('7854','7846','150124','150100','清水河县','3','','','');
INSERT INTO `pa_city` VALUES ('7855','7846','150125','150100','武川县','3','','','');
INSERT INTO `pa_city` VALUES ('7856','7846','150126','150100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7857','7845','150200','150000','包头市','2','','','');
INSERT INTO `pa_city` VALUES ('7858','7857','150202','150200','东河区','3','','','');
INSERT INTO `pa_city` VALUES ('7859','7857','150203','150200','昆都仑区','3','','','');
INSERT INTO `pa_city` VALUES ('7860','7857','150204','150200','青山区','3','','','');
INSERT INTO `pa_city` VALUES ('7861','7857','150205','150200','石拐区','3','','','');
INSERT INTO `pa_city` VALUES ('7862','7857','150206','150200','白云矿区','3','','','');
INSERT INTO `pa_city` VALUES ('7863','7857','150207','150200','九原区','3','','','');
INSERT INTO `pa_city` VALUES ('7864','7857','150221','150200','土默特右旗','3','','','');
INSERT INTO `pa_city` VALUES ('7865','7857','150222','150200','固阳县','3','','','');
INSERT INTO `pa_city` VALUES ('7866','7857','150223','150200','达尔罕茂明安联合旗','3','','','');
INSERT INTO `pa_city` VALUES ('7867','7857','150224','150200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7868','7845','150300','150000','乌海市','2','','','');
INSERT INTO `pa_city` VALUES ('7869','7868','150302','150300','海勃湾区','3','','','');
INSERT INTO `pa_city` VALUES ('7870','7868','150303','150300','海南区','3','','','');
INSERT INTO `pa_city` VALUES ('7871','7868','150304','150300','乌达区','3','','','');
INSERT INTO `pa_city` VALUES ('7872','7868','150305','150300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7873','7845','150400','150000','赤峰市','2','','','');
INSERT INTO `pa_city` VALUES ('7874','7873','150402','150400','红山区','3','','','');
INSERT INTO `pa_city` VALUES ('7875','7873','150403','150400','元宝山区','3','','','');
INSERT INTO `pa_city` VALUES ('7876','7873','150404','150400','松山区','3','','','');
INSERT INTO `pa_city` VALUES ('7877','7873','150421','150400','阿鲁科尔沁旗','3','','','');
INSERT INTO `pa_city` VALUES ('7878','7873','150422','150400','巴林左旗','3','','','');
INSERT INTO `pa_city` VALUES ('7879','7873','150423','150400','巴林右旗','3','','','');
INSERT INTO `pa_city` VALUES ('7880','7873','150424','150400','林西县','3','','','');
INSERT INTO `pa_city` VALUES ('7881','7873','150425','150400','克什克腾旗','3','','','');
INSERT INTO `pa_city` VALUES ('7882','7873','150426','150400','翁牛特旗','3','','','');
INSERT INTO `pa_city` VALUES ('7883','7873','150428','150400','喀喇沁旗','3','','','');
INSERT INTO `pa_city` VALUES ('7884','7873','150429','150400','宁城县','3','','','');
INSERT INTO `pa_city` VALUES ('7885','7873','150430','150400','敖汉旗','3','','','');
INSERT INTO `pa_city` VALUES ('7886','7873','150431','150400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7887','7845','150500','150000','通辽市','2','','','');
INSERT INTO `pa_city` VALUES ('7888','7887','150502','150500','科尔沁区','3','','','');
INSERT INTO `pa_city` VALUES ('7889','7887','150521','150500','科尔沁左翼中旗','3','','','');
INSERT INTO `pa_city` VALUES ('7890','7887','150522','150500','科尔沁左翼后旗','3','','','');
INSERT INTO `pa_city` VALUES ('7891','7887','150523','150500','开鲁县','3','','','');
INSERT INTO `pa_city` VALUES ('7892','7887','150524','150500','库伦旗','3','','','');
INSERT INTO `pa_city` VALUES ('7893','7887','150525','150500','奈曼旗','3','','','');
INSERT INTO `pa_city` VALUES ('7894','7887','150526','150500','扎鲁特旗','3','','','');
INSERT INTO `pa_city` VALUES ('7895','7887','150581','150500','霍林郭勒市','3','','','');
INSERT INTO `pa_city` VALUES ('7896','7887','150582','150500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7897','7845','150600','150000','鄂尔多斯市','2','','','');
INSERT INTO `pa_city` VALUES ('7898','7897','150602','150600','东胜区','3','','','');
INSERT INTO `pa_city` VALUES ('7899','7897','150621','150600','达拉特旗','3','','','');
INSERT INTO `pa_city` VALUES ('7900','7897','150622','150600','准格尔旗','3','','','');
INSERT INTO `pa_city` VALUES ('7901','7897','150623','150600','鄂托克前旗','3','','','');
INSERT INTO `pa_city` VALUES ('7902','7897','150624','150600','鄂托克旗','3','','','');
INSERT INTO `pa_city` VALUES ('7903','7897','150625','150600','杭锦旗','3','','','');
INSERT INTO `pa_city` VALUES ('7904','7897','150626','150600','乌审旗','3','','','');
INSERT INTO `pa_city` VALUES ('7905','7897','150627','150600','伊金霍洛旗','3','','','');
INSERT INTO `pa_city` VALUES ('7906','7897','150628','150600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7907','7845','150700','150000','呼伦贝尔市','2','','','');
INSERT INTO `pa_city` VALUES ('7908','7907','150702','150700','海拉尔区','3','','','');
INSERT INTO `pa_city` VALUES ('7909','7907','150721','150700','阿荣旗','3','','','');
INSERT INTO `pa_city` VALUES ('7910','7907','150722','150700','莫力达瓦达斡尔族自治旗','3','','','');
INSERT INTO `pa_city` VALUES ('7911','7907','150723','150700','鄂伦春自治旗','3','','','');
INSERT INTO `pa_city` VALUES ('7912','7907','150724','150700','鄂温克族自治旗','3','','','');
INSERT INTO `pa_city` VALUES ('7913','7907','150725','150700','陈巴尔虎旗','3','','','');
INSERT INTO `pa_city` VALUES ('7914','7907','150726','150700','新巴尔虎左旗','3','','','');
INSERT INTO `pa_city` VALUES ('7915','7907','150727','150700','新巴尔虎右旗','3','','','');
INSERT INTO `pa_city` VALUES ('7916','7907','150781','150700','满洲里市','3','','','');
INSERT INTO `pa_city` VALUES ('7917','7907','150782','150700','牙克石市','3','','','');
INSERT INTO `pa_city` VALUES ('7918','7907','150783','150700','扎兰屯市','3','','','');
INSERT INTO `pa_city` VALUES ('7919','7907','150784','150700','额尔古纳市','3','','','');
INSERT INTO `pa_city` VALUES ('7920','7907','150785','150700','根河市','3','','','');
INSERT INTO `pa_city` VALUES ('7921','7907','150786','150700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7922','7845','150800','150000','巴彦淖尔市','2','','','');
INSERT INTO `pa_city` VALUES ('7923','7922','150802','150800','临河区','3','','','');
INSERT INTO `pa_city` VALUES ('7924','7922','150821','150800','五原县','3','','','');
INSERT INTO `pa_city` VALUES ('7925','7922','150822','150800','磴口县','3','','','');
INSERT INTO `pa_city` VALUES ('7926','7922','150823','150800','乌拉特前旗','3','','','');
INSERT INTO `pa_city` VALUES ('7927','7922','150824','150800','乌拉特中旗','3','','','');
INSERT INTO `pa_city` VALUES ('7928','7922','150825','150800','乌拉特后旗','3','','','');
INSERT INTO `pa_city` VALUES ('7929','7922','150826','150800','杭锦后旗','3','','','');
INSERT INTO `pa_city` VALUES ('7930','7922','150827','150800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7931','7845','150900','150000','乌兰察布市','2','','','');
INSERT INTO `pa_city` VALUES ('7932','7931','150902','150900','集宁区','3','','','');
INSERT INTO `pa_city` VALUES ('7933','7931','150921','150900','卓资县','3','','','');
INSERT INTO `pa_city` VALUES ('7934','7931','150922','150900','化德县','3','','','');
INSERT INTO `pa_city` VALUES ('7935','7931','150923','150900','商都县','3','','','');
INSERT INTO `pa_city` VALUES ('7936','7931','150924','150900','兴和县','3','','','');
INSERT INTO `pa_city` VALUES ('7937','7931','150925','150900','凉城县','3','','','');
INSERT INTO `pa_city` VALUES ('7938','7931','150926','150900','察哈尔右翼前旗','3','','','');
INSERT INTO `pa_city` VALUES ('7939','7931','150927','150900','察哈尔右翼中旗','3','','','');
INSERT INTO `pa_city` VALUES ('7940','7931','150928','150900','察哈尔右翼后旗','3','','','');
INSERT INTO `pa_city` VALUES ('7941','7931','150929','150900','四子王旗','3','','','');
INSERT INTO `pa_city` VALUES ('7942','7931','150981','150900','丰镇市','3','','','');
INSERT INTO `pa_city` VALUES ('7943','7931','150982','150900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7944','7845','152200','150000','兴安盟','2','','','');
INSERT INTO `pa_city` VALUES ('7945','7944','152201','152200','乌兰浩特市','3','','','');
INSERT INTO `pa_city` VALUES ('7946','7944','152202','152200','阿尔山市','3','','','');
INSERT INTO `pa_city` VALUES ('7947','7944','152221','152200','科尔沁右翼前旗','3','','','');
INSERT INTO `pa_city` VALUES ('7948','7944','152222','152200','科尔沁右翼中旗','3','','','');
INSERT INTO `pa_city` VALUES ('7949','7944','152223','152200','扎赉特旗','3','','','');
INSERT INTO `pa_city` VALUES ('7950','7944','152224','152200','突泉县','3','','','');
INSERT INTO `pa_city` VALUES ('7951','7944','152225','152200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7952','7845','152500','150000','锡林郭勒盟','2','','','');
INSERT INTO `pa_city` VALUES ('7953','7952','152501','152500','二连浩特市','3','','','');
INSERT INTO `pa_city` VALUES ('7954','7952','152502','152500','锡林浩特市','3','','','');
INSERT INTO `pa_city` VALUES ('7955','7952','152522','152500','阿巴嘎旗','3','','','');
INSERT INTO `pa_city` VALUES ('7956','7952','152523','152500','苏尼特左旗','3','','','');
INSERT INTO `pa_city` VALUES ('7957','7952','152524','152500','苏尼特右旗','3','','','');
INSERT INTO `pa_city` VALUES ('7958','7952','152525','152500','东乌珠穆沁旗','3','','','');
INSERT INTO `pa_city` VALUES ('7959','7952','152526','152500','西乌珠穆沁旗','3','','','');
INSERT INTO `pa_city` VALUES ('7960','7952','152527','152500','太仆寺旗','3','','','');
INSERT INTO `pa_city` VALUES ('7961','7952','152528','152500','镶黄旗','3','','','');
INSERT INTO `pa_city` VALUES ('7962','7952','152529','152500','正镶白旗','3','','','');
INSERT INTO `pa_city` VALUES ('7963','7952','152530','152500','正蓝旗','3','','','');
INSERT INTO `pa_city` VALUES ('7964','7952','152531','152500','多伦县','3','','','');
INSERT INTO `pa_city` VALUES ('7965','7952','152532','152500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7966','7845','152900','150000','阿拉善盟','2','','','');
INSERT INTO `pa_city` VALUES ('7967','7966','152921','152900','阿拉善左旗','3','','','');
INSERT INTO `pa_city` VALUES ('7968','7966','152922','152900','阿拉善右旗','3','','','');
INSERT INTO `pa_city` VALUES ('7969','7966','152923','152900','额济纳旗','3','','','');
INSERT INTO `pa_city` VALUES ('7970','7966','152924','152900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7971','7459','210000','1','辽宁省','1','','','');
INSERT INTO `pa_city` VALUES ('7972','7971','210100','210000','沈阳市','2','','','');
INSERT INTO `pa_city` VALUES ('7973','7972','210102','210100','和平区','3','','','');
INSERT INTO `pa_city` VALUES ('7974','7972','210103','210100','沈河区','3','','','');
INSERT INTO `pa_city` VALUES ('7975','7972','210104','210100','大东区','3','','','');
INSERT INTO `pa_city` VALUES ('7976','7972','210105','210100','皇姑区','3','','','');
INSERT INTO `pa_city` VALUES ('7977','7972','210106','210100','铁西区','3','','','');
INSERT INTO `pa_city` VALUES ('7978','7972','210111','210100','苏家屯区','3','','','');
INSERT INTO `pa_city` VALUES ('7979','7972','210112','210100','东陵区','3','','','');
INSERT INTO `pa_city` VALUES ('7980','7972','210113','210100','新城子区','3','','','');
INSERT INTO `pa_city` VALUES ('7981','7972','210114','210100','于洪区','3','','','');
INSERT INTO `pa_city` VALUES ('7982','7972','210122','210100','辽中县','3','','','');
INSERT INTO `pa_city` VALUES ('7983','7972','210123','210100','康平县','3','','','');
INSERT INTO `pa_city` VALUES ('7984','7972','210124','210100','法库县','3','','','');
INSERT INTO `pa_city` VALUES ('7985','7972','210181','210100','新民市','3','','','');
INSERT INTO `pa_city` VALUES ('7986','7972','210182','210100','浑南新区','3','','','');
INSERT INTO `pa_city` VALUES ('7987','7972','210183','210100','张士开发区','3','','','');
INSERT INTO `pa_city` VALUES ('7988','7972','210184','210100','沈北新区','3','','','');
INSERT INTO `pa_city` VALUES ('7989','7972','210185','210100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('7990','7971','210200','210000','大连市','2','','','');
INSERT INTO `pa_city` VALUES ('7991','7990','210202','210200','中山区','3','','','');
INSERT INTO `pa_city` VALUES ('7992','7990','210203','210200','西岗区','3','','','');
INSERT INTO `pa_city` VALUES ('7993','7990','210204','210200','沙河口区','3','','','');
INSERT INTO `pa_city` VALUES ('7994','7990','210211','210200','甘井子区','3','','','');
INSERT INTO `pa_city` VALUES ('7995','7990','210212','210200','旅顺口区','3','','','');
INSERT INTO `pa_city` VALUES ('7996','7990','210213','210200','金州区','3','','','');
INSERT INTO `pa_city` VALUES ('7997','7990','210224','210200','长海县','3','','','');
INSERT INTO `pa_city` VALUES ('7998','7990','210251','210200','开发区','3','','','');
INSERT INTO `pa_city` VALUES ('7999','7990','210281','210200','瓦房店市','3','','','');
INSERT INTO `pa_city` VALUES ('8000','7990','210282','210200','普兰店市','3','','','');
INSERT INTO `pa_city` VALUES ('8001','7990','210283','210200','庄河市','3','','','');
INSERT INTO `pa_city` VALUES ('8002','7990','210297','210200','岭前区','3','','','');
INSERT INTO `pa_city` VALUES ('8003','7990','210298','210200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8004','7971','210300','210000','鞍山市','2','','','');
INSERT INTO `pa_city` VALUES ('8005','8004','210302','210300','铁东区','3','','','');
INSERT INTO `pa_city` VALUES ('8006','8004','210303','210300','铁西区','3','','','');
INSERT INTO `pa_city` VALUES ('8007','8004','210304','210300','立山区','3','','','');
INSERT INTO `pa_city` VALUES ('8008','8004','210311','210300','千山区','3','','','');
INSERT INTO `pa_city` VALUES ('8009','8004','210321','210300','台安县','3','','','');
INSERT INTO `pa_city` VALUES ('8010','8004','210323','210300','岫岩满族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('8011','8004','210351','210300','高新区','3','','','');
INSERT INTO `pa_city` VALUES ('8012','8004','210381','210300','海城市','3','','','');
INSERT INTO `pa_city` VALUES ('8013','8004','210382','210300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8014','7971','210400','210000','抚顺市','2','','','');
INSERT INTO `pa_city` VALUES ('8015','8014','210402','210400','新抚区','3','','','');
INSERT INTO `pa_city` VALUES ('8016','8014','210403','210400','东洲区','3','','','');
INSERT INTO `pa_city` VALUES ('8017','8014','210404','210400','望花区','3','','','');
INSERT INTO `pa_city` VALUES ('8018','8014','210411','210400','顺城区','3','','','');
INSERT INTO `pa_city` VALUES ('8019','8014','210421','210400','抚顺县','3','','','');
INSERT INTO `pa_city` VALUES ('8020','8014','210422','210400','新宾满族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('8021','8014','210423','210400','清原满族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('8022','8014','210424','210400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8023','7971','210500','210000','本溪市','2','','','');
INSERT INTO `pa_city` VALUES ('8024','8023','210502','210500','平山区','3','','','');
INSERT INTO `pa_city` VALUES ('8025','8023','210503','210500','溪湖区','3','','','');
INSERT INTO `pa_city` VALUES ('8026','8023','210504','210500','明山区','3','','','');
INSERT INTO `pa_city` VALUES ('8027','8023','210505','210500','南芬区','3','','','');
INSERT INTO `pa_city` VALUES ('8028','8023','210521','210500','本溪满族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('8029','8023','210522','210500','桓仁满族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('8030','8023','210523','210500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8031','7971','210600','210000','丹东市','2','','','');
INSERT INTO `pa_city` VALUES ('8032','8031','210602','210600','元宝区','3','','','');
INSERT INTO `pa_city` VALUES ('8033','8031','210603','210600','振兴区','3','','','');
INSERT INTO `pa_city` VALUES ('8034','8031','210604','210600','振安区','3','','','');
INSERT INTO `pa_city` VALUES ('8035','8031','210624','210600','宽甸满族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('8036','8031','210681','210600','东港市','3','','','');
INSERT INTO `pa_city` VALUES ('8037','8031','210682','210600','凤城市','3','','','');
INSERT INTO `pa_city` VALUES ('8038','8031','210683','210600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8039','7971','210700','210000','锦州市','2','','','');
INSERT INTO `pa_city` VALUES ('8040','8039','210702','210700','古塔区','3','','','');
INSERT INTO `pa_city` VALUES ('8041','8039','210703','210700','凌河区','3','','','');
INSERT INTO `pa_city` VALUES ('8042','8039','210711','210700','太和区','3','','','');
INSERT INTO `pa_city` VALUES ('8043','8039','210726','210700','黑山县','3','','','');
INSERT INTO `pa_city` VALUES ('8044','8039','210727','210700','义县','3','','','');
INSERT INTO `pa_city` VALUES ('8045','8039','210781','210700','凌海市','3','','','');
INSERT INTO `pa_city` VALUES ('8046','8039','210782','210700','北镇市','3','','','');
INSERT INTO `pa_city` VALUES ('8047','8039','210783','210700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8048','7971','210800','210000','营口市','2','','','');
INSERT INTO `pa_city` VALUES ('8049','8048','210802','210800','站前区','3','','','');
INSERT INTO `pa_city` VALUES ('8050','8048','210803','210800','西市区','3','','','');
INSERT INTO `pa_city` VALUES ('8051','8048','210804','210800','鲅鱼圈区','3','','','');
INSERT INTO `pa_city` VALUES ('8052','8048','210811','210800','老边区','3','','','');
INSERT INTO `pa_city` VALUES ('8053','8048','210881','210800','盖州市','3','','','');
INSERT INTO `pa_city` VALUES ('8054','8048','210882','210800','大石桥市','3','','','');
INSERT INTO `pa_city` VALUES ('8055','8048','210883','210800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8056','7971','210900','210000','阜新市','2','','','');
INSERT INTO `pa_city` VALUES ('8057','8056','210902','210900','海州区','3','','','');
INSERT INTO `pa_city` VALUES ('8058','8056','210903','210900','新邱区','3','','','');
INSERT INTO `pa_city` VALUES ('8059','8056','210904','210900','太平区','3','','','');
INSERT INTO `pa_city` VALUES ('8060','8056','210905','210900','清河门区','3','','','');
INSERT INTO `pa_city` VALUES ('8061','8056','210911','210900','细河区','3','','','');
INSERT INTO `pa_city` VALUES ('8062','8056','210921','210900','阜新蒙古族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('8063','8056','210922','210900','彰武县','3','','','');
INSERT INTO `pa_city` VALUES ('8064','8056','210923','210900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8065','7971','211000','210000','辽阳市','2','','','');
INSERT INTO `pa_city` VALUES ('8066','8065','211002','211000','白塔区','3','','','');
INSERT INTO `pa_city` VALUES ('8067','8065','211003','211000','文圣区','3','','','');
INSERT INTO `pa_city` VALUES ('8068','8065','211004','211000','宏伟区','3','','','');
INSERT INTO `pa_city` VALUES ('8069','8065','211005','211000','弓长岭区','3','','','');
INSERT INTO `pa_city` VALUES ('8070','8065','211011','211000','太子河区','3','','','');
INSERT INTO `pa_city` VALUES ('8071','8065','211021','211000','辽阳县','3','','','');
INSERT INTO `pa_city` VALUES ('8072','8065','211081','211000','灯塔市','3','','','');
INSERT INTO `pa_city` VALUES ('8073','8065','211082','211000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8074','7971','211100','210000','盘锦市','2','','','');
INSERT INTO `pa_city` VALUES ('8075','8074','211102','211100','双台子区','3','','','');
INSERT INTO `pa_city` VALUES ('8076','8074','211103','211100','兴隆台区','3','','','');
INSERT INTO `pa_city` VALUES ('8077','8074','211121','211100','大洼县','3','','','');
INSERT INTO `pa_city` VALUES ('8078','8074','211122','211100','盘山县','3','','','');
INSERT INTO `pa_city` VALUES ('8079','8074','211123','211100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8080','7971','211200','210000','铁岭市','2','','','');
INSERT INTO `pa_city` VALUES ('8081','8080','211202','211200','银州区','3','','','');
INSERT INTO `pa_city` VALUES ('8082','8080','211204','211200','清河区','3','','','');
INSERT INTO `pa_city` VALUES ('8083','8080','211221','211200','铁岭县','3','','','');
INSERT INTO `pa_city` VALUES ('8084','8080','211223','211200','西丰县','3','','','');
INSERT INTO `pa_city` VALUES ('8085','8080','211224','211200','昌图县','3','','','');
INSERT INTO `pa_city` VALUES ('8086','8080','211281','211200','调兵山市','3','','','');
INSERT INTO `pa_city` VALUES ('8087','8080','211282','211200','开原市','3','','','');
INSERT INTO `pa_city` VALUES ('8088','8080','211283','211200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8089','7971','211300','210000','朝阳市','2','','','');
INSERT INTO `pa_city` VALUES ('8090','8089','211302','211300','双塔区','3','','','');
INSERT INTO `pa_city` VALUES ('8091','8089','211303','211300','龙城区','3','','','');
INSERT INTO `pa_city` VALUES ('8092','8089','211321','211300','朝阳县','3','','','');
INSERT INTO `pa_city` VALUES ('8093','8089','211322','211300','建平县','3','','','');
INSERT INTO `pa_city` VALUES ('8094','8089','211324','211300','喀喇沁左翼蒙古族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('8095','8089','211381','211300','北票市','3','','','');
INSERT INTO `pa_city` VALUES ('8096','8089','211382','211300','凌源市','3','','','');
INSERT INTO `pa_city` VALUES ('8097','8089','211383','211300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8098','7971','211400','210000','葫芦岛市','2','','','');
INSERT INTO `pa_city` VALUES ('8099','8098','211402','211400','连山区','3','','','');
INSERT INTO `pa_city` VALUES ('8100','8098','211403','211400','龙港区','3','','','');
INSERT INTO `pa_city` VALUES ('8101','8098','211404','211400','南票区','3','','','');
INSERT INTO `pa_city` VALUES ('8102','8098','211421','211400','绥中县','3','','','');
INSERT INTO `pa_city` VALUES ('8103','8098','211422','211400','建昌县','3','','','');
INSERT INTO `pa_city` VALUES ('8104','8098','211481','211400','兴城市','3','','','');
INSERT INTO `pa_city` VALUES ('8105','8098','211482','211400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8106','7459','220000','1','吉林省','1','','','');
INSERT INTO `pa_city` VALUES ('8107','8106','220100','220000','长春市','2','','','');
INSERT INTO `pa_city` VALUES ('8108','8107','220102','220100','南关区','3','','','');
INSERT INTO `pa_city` VALUES ('8109','8107','220103','220100','宽城区','3','','','');
INSERT INTO `pa_city` VALUES ('8110','8107','220104','220100','朝阳区','3','','','');
INSERT INTO `pa_city` VALUES ('8111','8107','220105','220100','二道区','3','','','');
INSERT INTO `pa_city` VALUES ('8112','8107','220106','220100','绿园区','3','','','');
INSERT INTO `pa_city` VALUES ('8113','8107','220112','220100','双阳区','3','','','');
INSERT INTO `pa_city` VALUES ('8114','8107','220122','220100','农安县','3','','','');
INSERT INTO `pa_city` VALUES ('8115','8107','220181','220100','九台市','3','','','');
INSERT INTO `pa_city` VALUES ('8116','8107','220182','220100','榆树市','3','','','');
INSERT INTO `pa_city` VALUES ('8117','8107','220183','220100','德惠市','3','','','');
INSERT INTO `pa_city` VALUES ('8118','8107','220184','220100','高新技术产业开发区','3','','','');
INSERT INTO `pa_city` VALUES ('8119','8107','220185','220100','汽车产业开发区','3','','','');
INSERT INTO `pa_city` VALUES ('8120','8107','220186','220100','经济技术开发区','3','','','');
INSERT INTO `pa_city` VALUES ('8121','8107','220187','220100','净月旅游开发区','3','','','');
INSERT INTO `pa_city` VALUES ('8122','8107','220188','220100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8123','8106','220200','220000','吉林市','2','','','');
INSERT INTO `pa_city` VALUES ('8124','8123','220202','220200','昌邑区','3','','','');
INSERT INTO `pa_city` VALUES ('8125','8123','220203','220200','龙潭区','3','','','');
INSERT INTO `pa_city` VALUES ('8126','8123','220204','220200','船营区','3','','','');
INSERT INTO `pa_city` VALUES ('8127','8123','220211','220200','丰满区','3','','','');
INSERT INTO `pa_city` VALUES ('8128','8123','220221','220200','永吉县','3','','','');
INSERT INTO `pa_city` VALUES ('8129','8123','220281','220200','蛟河市','3','','','');
INSERT INTO `pa_city` VALUES ('8130','8123','220282','220200','桦甸市','3','','','');
INSERT INTO `pa_city` VALUES ('8131','8123','220283','220200','舒兰市','3','','','');
INSERT INTO `pa_city` VALUES ('8132','8123','220284','220200','磐石市','3','','','');
INSERT INTO `pa_city` VALUES ('8133','8123','220285','220200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8134','8106','220300','220000','四平市','2','','','');
INSERT INTO `pa_city` VALUES ('8135','8134','220302','220300','铁西区','3','','','');
INSERT INTO `pa_city` VALUES ('8136','8134','220303','220300','铁东区','3','','','');
INSERT INTO `pa_city` VALUES ('8137','8134','220322','220300','梨树县','3','','','');
INSERT INTO `pa_city` VALUES ('8138','8134','220323','220300','伊通满族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('8139','8134','220381','220300','公主岭市','3','','','');
INSERT INTO `pa_city` VALUES ('8140','8134','220382','220300','双辽市','3','','','');
INSERT INTO `pa_city` VALUES ('8141','8134','220383','220300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8142','8106','220400','220000','辽源市','2','','','');
INSERT INTO `pa_city` VALUES ('8143','8142','220402','220400','龙山区','3','','','');
INSERT INTO `pa_city` VALUES ('8144','8142','220403','220400','西安区','3','','','');
INSERT INTO `pa_city` VALUES ('8145','8142','220421','220400','东丰县','3','','','');
INSERT INTO `pa_city` VALUES ('8146','8142','220422','220400','东辽县','3','','','');
INSERT INTO `pa_city` VALUES ('8147','8142','220423','220400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8148','8106','220500','220000','通化市','2','','','');
INSERT INTO `pa_city` VALUES ('8149','8148','220502','220500','东昌区','3','','','');
INSERT INTO `pa_city` VALUES ('8150','8148','220503','220500','二道江区','3','','','');
INSERT INTO `pa_city` VALUES ('8151','8148','220521','220500','通化县','3','','','');
INSERT INTO `pa_city` VALUES ('8152','8148','220523','220500','辉南县','3','','','');
INSERT INTO `pa_city` VALUES ('8153','8148','220524','220500','柳河县','3','','','');
INSERT INTO `pa_city` VALUES ('8154','8148','220581','220500','梅河口市','3','','','');
INSERT INTO `pa_city` VALUES ('8155','8148','220582','220500','集安市','3','','','');
INSERT INTO `pa_city` VALUES ('8156','8148','220583','220500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8157','8106','220600','220000','白山市','2','','','');
INSERT INTO `pa_city` VALUES ('8158','8157','220602','220600','八道江区','3','','','');
INSERT INTO `pa_city` VALUES ('8159','8157','220621','220600','抚松县','3','','','');
INSERT INTO `pa_city` VALUES ('8160','8157','220622','220600','靖宇县','3','','','');
INSERT INTO `pa_city` VALUES ('8161','8157','220623','220600','长白朝鲜族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('8162','8157','220625','220600','江源县','3','','','');
INSERT INTO `pa_city` VALUES ('8163','8157','220681','220600','临江市','3','','','');
INSERT INTO `pa_city` VALUES ('8164','8157','220682','220600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8165','8106','220700','220000','松原市','2','','','');
INSERT INTO `pa_city` VALUES ('8166','8165','220702','220700','宁江区','3','','','');
INSERT INTO `pa_city` VALUES ('8167','8165','220721','220700','前郭尔罗斯蒙古族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('8168','8165','220722','220700','长岭县','3','','','');
INSERT INTO `pa_city` VALUES ('8169','8165','220723','220700','乾安县','3','','','');
INSERT INTO `pa_city` VALUES ('8170','8165','220724','220700','扶余县','3','','','');
INSERT INTO `pa_city` VALUES ('8171','8165','220725','220700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8172','8106','220800','220000','白城市','2','','','');
INSERT INTO `pa_city` VALUES ('8173','8172','220802','220800','洮北区','3','','','');
INSERT INTO `pa_city` VALUES ('8174','8172','220821','220800','镇赉县','3','','','');
INSERT INTO `pa_city` VALUES ('8175','8172','220822','220800','通榆县','3','','','');
INSERT INTO `pa_city` VALUES ('8176','8172','220881','220800','洮南市','3','','','');
INSERT INTO `pa_city` VALUES ('8177','8172','220882','220800','大安市','3','','','');
INSERT INTO `pa_city` VALUES ('8178','8172','220883','220800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8179','8106','222400','220000','延边朝鲜族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('8180','8179','222401','222400','延吉市','3','','','');
INSERT INTO `pa_city` VALUES ('8181','8179','222402','222400','图们市','3','','','');
INSERT INTO `pa_city` VALUES ('8182','8179','222403','222400','敦化市','3','','','');
INSERT INTO `pa_city` VALUES ('8183','8179','222404','222400','珲春市','3','','','');
INSERT INTO `pa_city` VALUES ('8184','8179','222405','222400','龙井市','3','','','');
INSERT INTO `pa_city` VALUES ('8185','8179','222406','222400','和龙市','3','','','');
INSERT INTO `pa_city` VALUES ('8186','8179','222424','222400','汪清县','3','','','');
INSERT INTO `pa_city` VALUES ('8187','8179','222426','222400','安图县','3','','','');
INSERT INTO `pa_city` VALUES ('8188','8179','222427','222400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8189','7459','230000','1','黑龙江省','1','','','');
INSERT INTO `pa_city` VALUES ('8190','8189','230100','230000','哈尔滨市','2','','','');
INSERT INTO `pa_city` VALUES ('8191','8190','230102','230100','道里区','3','','','');
INSERT INTO `pa_city` VALUES ('8192','8190','230103','230100','南岗区','3','','','');
INSERT INTO `pa_city` VALUES ('8193','8190','230104','230100','道外区','3','','','');
INSERT INTO `pa_city` VALUES ('8194','8190','230106','230100','香坊区','3','','','');
INSERT INTO `pa_city` VALUES ('8195','8190','230107','230100','动力区','3','','','');
INSERT INTO `pa_city` VALUES ('8196','8190','230108','230100','平房区','3','','','');
INSERT INTO `pa_city` VALUES ('8197','8190','230109','230100','松北区','3','','','');
INSERT INTO `pa_city` VALUES ('8198','8190','230111','230100','呼兰区','3','','','');
INSERT INTO `pa_city` VALUES ('8199','8190','230123','230100','依兰县','3','','','');
INSERT INTO `pa_city` VALUES ('8200','8190','230124','230100','方正县','3','','','');
INSERT INTO `pa_city` VALUES ('8201','8190','230125','230100','宾县','3','','','');
INSERT INTO `pa_city` VALUES ('8202','8190','230126','230100','巴彦县','3','','','');
INSERT INTO `pa_city` VALUES ('8203','8190','230127','230100','木兰县','3','','','');
INSERT INTO `pa_city` VALUES ('8204','8190','230128','230100','通河县','3','','','');
INSERT INTO `pa_city` VALUES ('8205','8190','230129','230100','延寿县','3','','','');
INSERT INTO `pa_city` VALUES ('8206','8190','230181','230100','阿城市','3','','','');
INSERT INTO `pa_city` VALUES ('8207','8190','230182','230100','双城市','3','','','');
INSERT INTO `pa_city` VALUES ('8208','8190','230183','230100','尚志市','3','','','');
INSERT INTO `pa_city` VALUES ('8209','8190','230184','230100','五常市','3','','','');
INSERT INTO `pa_city` VALUES ('8210','8190','230185','230100','阿城市','3','','','');
INSERT INTO `pa_city` VALUES ('8211','8190','230186','230100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8212','8189','230200','230000','齐齐哈尔市','2','','','');
INSERT INTO `pa_city` VALUES ('8213','8212','230202','230200','龙沙区','3','','','');
INSERT INTO `pa_city` VALUES ('8214','8212','230203','230200','建华区','3','','','');
INSERT INTO `pa_city` VALUES ('8215','8212','230204','230200','铁锋区','3','','','');
INSERT INTO `pa_city` VALUES ('8216','8212','230205','230200','昂昂溪区','3','','','');
INSERT INTO `pa_city` VALUES ('8217','8212','230206','230200','富拉尔基区','3','','','');
INSERT INTO `pa_city` VALUES ('8218','8212','230207','230200','碾子山区','3','','','');
INSERT INTO `pa_city` VALUES ('8219','8212','230208','230200','梅里斯达斡尔族区','3','','','');
INSERT INTO `pa_city` VALUES ('8220','8212','230221','230200','龙江县','3','','','');
INSERT INTO `pa_city` VALUES ('8221','8212','230223','230200','依安县','3','','','');
INSERT INTO `pa_city` VALUES ('8222','8212','230224','230200','泰来县','3','','','');
INSERT INTO `pa_city` VALUES ('8223','8212','230225','230200','甘南县','3','','','');
INSERT INTO `pa_city` VALUES ('8224','8212','230227','230200','富裕县','3','','','');
INSERT INTO `pa_city` VALUES ('8225','8212','230229','230200','克山县','3','','','');
INSERT INTO `pa_city` VALUES ('8226','8212','230230','230200','克东县','3','','','');
INSERT INTO `pa_city` VALUES ('8227','8212','230231','230200','拜泉县','3','','','');
INSERT INTO `pa_city` VALUES ('8228','8212','230281','230200','讷河市','3','','','');
INSERT INTO `pa_city` VALUES ('8229','8212','230282','230200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8230','8189','230300','230000','鸡西市','2','','','');
INSERT INTO `pa_city` VALUES ('8231','8230','230302','230300','鸡冠区','3','','','');
INSERT INTO `pa_city` VALUES ('8232','8230','230303','230300','恒山区','3','','','');
INSERT INTO `pa_city` VALUES ('8233','8230','230304','230300','滴道区','3','','','');
INSERT INTO `pa_city` VALUES ('8234','8230','230305','230300','梨树区','3','','','');
INSERT INTO `pa_city` VALUES ('8235','8230','230306','230300','城子河区','3','','','');
INSERT INTO `pa_city` VALUES ('8236','8230','230307','230300','麻山区','3','','','');
INSERT INTO `pa_city` VALUES ('8237','8230','230321','230300','鸡东县','3','','','');
INSERT INTO `pa_city` VALUES ('8238','8230','230381','230300','虎林市','3','','','');
INSERT INTO `pa_city` VALUES ('8239','8230','230382','230300','密山市','3','','','');
INSERT INTO `pa_city` VALUES ('8240','8230','230383','230300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8241','8189','230400','230000','鹤岗市','2','','','');
INSERT INTO `pa_city` VALUES ('8242','8241','230402','230400','向阳区','3','','','');
INSERT INTO `pa_city` VALUES ('8243','8241','230403','230400','工农区','3','','','');
INSERT INTO `pa_city` VALUES ('8244','8241','230404','230400','南山区','3','','','');
INSERT INTO `pa_city` VALUES ('8245','8241','230405','230400','兴安区','3','','','');
INSERT INTO `pa_city` VALUES ('8246','8241','230406','230400','东山区','3','','','');
INSERT INTO `pa_city` VALUES ('8247','8241','230407','230400','兴山区','3','','','');
INSERT INTO `pa_city` VALUES ('8248','8241','230421','230400','萝北县','3','','','');
INSERT INTO `pa_city` VALUES ('8249','8241','230422','230400','绥滨县','3','','','');
INSERT INTO `pa_city` VALUES ('8250','8241','230423','230400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8251','8189','230500','230000','双鸭山市','2','','','');
INSERT INTO `pa_city` VALUES ('8252','8251','230502','230500','尖山区','3','','','');
INSERT INTO `pa_city` VALUES ('8253','8251','230503','230500','岭东区','3','','','');
INSERT INTO `pa_city` VALUES ('8254','8251','230505','230500','四方台区','3','','','');
INSERT INTO `pa_city` VALUES ('8255','8251','230506','230500','宝山区','3','','','');
INSERT INTO `pa_city` VALUES ('8256','8251','230521','230500','集贤县','3','','','');
INSERT INTO `pa_city` VALUES ('8257','8251','230522','230500','友谊县','3','','','');
INSERT INTO `pa_city` VALUES ('8258','8251','230523','230500','宝清县','3','','','');
INSERT INTO `pa_city` VALUES ('8259','8251','230524','230500','饶河县','3','','','');
INSERT INTO `pa_city` VALUES ('8260','8251','230525','230500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8261','8189','230600','230000','大庆市','2','','','');
INSERT INTO `pa_city` VALUES ('8262','8261','230602','230600','萨尔图区','3','','','');
INSERT INTO `pa_city` VALUES ('8263','8261','230603','230600','龙凤区','3','','','');
INSERT INTO `pa_city` VALUES ('8264','8261','230604','230600','让胡路区','3','','','');
INSERT INTO `pa_city` VALUES ('8265','8261','230605','230600','红岗区','3','','','');
INSERT INTO `pa_city` VALUES ('8266','8261','230606','230600','大同区','3','','','');
INSERT INTO `pa_city` VALUES ('8267','8261','230621','230600','肇州县','3','','','');
INSERT INTO `pa_city` VALUES ('8268','8261','230622','230600','肇源县','3','','','');
INSERT INTO `pa_city` VALUES ('8269','8261','230623','230600','林甸县','3','','','');
INSERT INTO `pa_city` VALUES ('8270','8261','230624','230600','杜尔伯特蒙古族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('8271','8261','230625','230600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8272','8189','230700','230000','伊春市','2','','','');
INSERT INTO `pa_city` VALUES ('8273','8272','230702','230700','伊春区','3','','','');
INSERT INTO `pa_city` VALUES ('8274','8272','230703','230700','南岔区','3','','','');
INSERT INTO `pa_city` VALUES ('8275','8272','230704','230700','友好区','3','','','');
INSERT INTO `pa_city` VALUES ('8276','8272','230705','230700','西林区','3','','','');
INSERT INTO `pa_city` VALUES ('8277','8272','230706','230700','翠峦区','3','','','');
INSERT INTO `pa_city` VALUES ('8278','8272','230707','230700','新青区','3','','','');
INSERT INTO `pa_city` VALUES ('8279','8272','230708','230700','美溪区','3','','','');
INSERT INTO `pa_city` VALUES ('8280','8272','230709','230700','金山屯区','3','','','');
INSERT INTO `pa_city` VALUES ('8281','8272','230710','230700','五营区','3','','','');
INSERT INTO `pa_city` VALUES ('8282','8272','230711','230700','乌马河区','3','','','');
INSERT INTO `pa_city` VALUES ('8283','8272','230712','230700','汤旺河区','3','','','');
INSERT INTO `pa_city` VALUES ('8284','8272','230713','230700','带岭区','3','','','');
INSERT INTO `pa_city` VALUES ('8285','8272','230714','230700','乌伊岭区','3','','','');
INSERT INTO `pa_city` VALUES ('8286','8272','230715','230700','红星区','3','','','');
INSERT INTO `pa_city` VALUES ('8287','8272','230716','230700','上甘岭区','3','','','');
INSERT INTO `pa_city` VALUES ('8288','8272','230722','230700','嘉荫县','3','','','');
INSERT INTO `pa_city` VALUES ('8289','8272','230781','230700','铁力市','3','','','');
INSERT INTO `pa_city` VALUES ('8290','8272','230782','230700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8291','8189','230800','230000','佳木斯市','2','','','');
INSERT INTO `pa_city` VALUES ('8292','8291','230802','230800','永红区','3','','','');
INSERT INTO `pa_city` VALUES ('8293','8291','230803','230800','向阳区','3','','','');
INSERT INTO `pa_city` VALUES ('8294','8291','230804','230800','前进区','3','','','');
INSERT INTO `pa_city` VALUES ('8295','8291','230805','230800','东风区','3','','','');
INSERT INTO `pa_city` VALUES ('8296','8291','230811','230800','郊区','3','','','');
INSERT INTO `pa_city` VALUES ('8297','8291','230822','230800','桦南县','3','','','');
INSERT INTO `pa_city` VALUES ('8298','8291','230826','230800','桦川县','3','','','');
INSERT INTO `pa_city` VALUES ('8299','8291','230828','230800','汤原县','3','','','');
INSERT INTO `pa_city` VALUES ('8300','8291','230833','230800','抚远县','3','','','');
INSERT INTO `pa_city` VALUES ('8301','8291','230881','230800','同江市','3','','','');
INSERT INTO `pa_city` VALUES ('8302','8291','230882','230800','富锦市','3','','','');
INSERT INTO `pa_city` VALUES ('8303','8291','230883','230800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8304','8189','230900','230000','七台河市','2','','','');
INSERT INTO `pa_city` VALUES ('8305','8304','230902','230900','新兴区','3','','','');
INSERT INTO `pa_city` VALUES ('8306','8304','230903','230900','桃山区','3','','','');
INSERT INTO `pa_city` VALUES ('8307','8304','230904','230900','茄子河区','3','','','');
INSERT INTO `pa_city` VALUES ('8308','8304','230921','230900','勃利县','3','','','');
INSERT INTO `pa_city` VALUES ('8309','8304','230922','230900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8310','8189','231000','230000','牡丹江市','2','','','');
INSERT INTO `pa_city` VALUES ('8311','8310','231002','231000','东安区','3','','','');
INSERT INTO `pa_city` VALUES ('8312','8310','231003','231000','阳明区','3','','','');
INSERT INTO `pa_city` VALUES ('8313','8310','231004','231000','爱民区','3','','','');
INSERT INTO `pa_city` VALUES ('8314','8310','231005','231000','西安区','3','','','');
INSERT INTO `pa_city` VALUES ('8315','8310','231024','231000','东宁县','3','','','');
INSERT INTO `pa_city` VALUES ('8316','8310','231025','231000','林口县','3','','','');
INSERT INTO `pa_city` VALUES ('8317','8310','231081','231000','绥芬河市','3','','','');
INSERT INTO `pa_city` VALUES ('8318','8310','231083','231000','海林市','3','','','');
INSERT INTO `pa_city` VALUES ('8319','8310','231084','231000','宁安市','3','','','');
INSERT INTO `pa_city` VALUES ('8320','8310','231085','231000','穆棱市','3','','','');
INSERT INTO `pa_city` VALUES ('8321','8310','231086','231000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8322','8189','231100','230000','黑河市','2','','','');
INSERT INTO `pa_city` VALUES ('8323','8322','231102','231100','爱辉区','3','','','');
INSERT INTO `pa_city` VALUES ('8324','8322','231121','231100','嫩江县','3','','','');
INSERT INTO `pa_city` VALUES ('8325','8322','231123','231100','逊克县','3','','','');
INSERT INTO `pa_city` VALUES ('8326','8322','231124','231100','孙吴县','3','','','');
INSERT INTO `pa_city` VALUES ('8327','8322','231181','231100','北安市','3','','','');
INSERT INTO `pa_city` VALUES ('8328','8322','231182','231100','五大连池市','3','','','');
INSERT INTO `pa_city` VALUES ('8329','8322','231183','231100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8330','8189','231200','230000','绥化市','2','','','');
INSERT INTO `pa_city` VALUES ('8331','8330','231202','231200','北林区','3','','','');
INSERT INTO `pa_city` VALUES ('8332','8330','231221','231200','望奎县','3','','','');
INSERT INTO `pa_city` VALUES ('8333','8330','231222','231200','兰西县','3','','','');
INSERT INTO `pa_city` VALUES ('8334','8330','231223','231200','青冈县','3','','','');
INSERT INTO `pa_city` VALUES ('8335','8330','231224','231200','庆安县','3','','','');
INSERT INTO `pa_city` VALUES ('8336','8330','231225','231200','明水县','3','','','');
INSERT INTO `pa_city` VALUES ('8337','8330','231226','231200','绥棱县','3','','','');
INSERT INTO `pa_city` VALUES ('8338','8330','231281','231200','安达市','3','','','');
INSERT INTO `pa_city` VALUES ('8339','8330','231282','231200','肇东市','3','','','');
INSERT INTO `pa_city` VALUES ('8340','8330','231283','231200','海伦市','3','','','');
INSERT INTO `pa_city` VALUES ('8341','8330','231284','231200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8342','8189','232700','230000','大兴安岭地区','2','','','');
INSERT INTO `pa_city` VALUES ('8343','8342','232721','232700','呼玛县','3','','','');
INSERT INTO `pa_city` VALUES ('8344','8342','232722','232700','塔河县','3','','','');
INSERT INTO `pa_city` VALUES ('8345','8342','232723','232700','漠河县','3','','','');
INSERT INTO `pa_city` VALUES ('8346','8342','232724','232700','加格达奇区','3','','','');
INSERT INTO `pa_city` VALUES ('8347','8342','232725','232700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8348','7459','310000','1','上海','1','','','');
INSERT INTO `pa_city` VALUES ('8349','8348','310100','310000','上海市','2','','','');
INSERT INTO `pa_city` VALUES ('8350','8349','310101','310100','黄浦区','3','','','');
INSERT INTO `pa_city` VALUES ('8351','8349','310103','310100','卢湾区','3','','','');
INSERT INTO `pa_city` VALUES ('8352','8349','310104','310100','徐汇区','3','','','');
INSERT INTO `pa_city` VALUES ('8353','8349','310105','310100','长宁区','3','','','');
INSERT INTO `pa_city` VALUES ('8354','8349','310106','310100','静安区','3','','','');
INSERT INTO `pa_city` VALUES ('8355','8349','310107','310100','普陀区','3','','','');
INSERT INTO `pa_city` VALUES ('8356','8349','310108','310100','闸北区','3','','','');
INSERT INTO `pa_city` VALUES ('8357','8349','310109','310100','虹口区','3','','','');
INSERT INTO `pa_city` VALUES ('8358','8349','310110','310100','杨浦区','3','','','');
INSERT INTO `pa_city` VALUES ('8359','8349','310112','310100','闵行区','3','','','');
INSERT INTO `pa_city` VALUES ('8360','8349','310113','310100','宝山区','3','','','');
INSERT INTO `pa_city` VALUES ('8361','8349','310114','310100','嘉定区','3','','','');
INSERT INTO `pa_city` VALUES ('8362','8349','310115','310100','浦东新区','3','','','');
INSERT INTO `pa_city` VALUES ('8363','8349','310116','310100','金山区','3','','','');
INSERT INTO `pa_city` VALUES ('8364','8349','310117','310100','松江区','3','','','');
INSERT INTO `pa_city` VALUES ('8365','8349','310118','310100','青浦区','3','','','');
INSERT INTO `pa_city` VALUES ('8366','8349','310119','310100','南汇区','3','','','');
INSERT INTO `pa_city` VALUES ('8367','8349','310120','310100','奉贤区','3','','','');
INSERT INTO `pa_city` VALUES ('8368','8349','310152','310100','川沙区','3','','','');
INSERT INTO `pa_city` VALUES ('8369','8349','310230','310100','崇明县','3','','','');
INSERT INTO `pa_city` VALUES ('8370','8349','310231','310100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8371','7459','320000','1','江苏省','1','','','');
INSERT INTO `pa_city` VALUES ('8372','8371','320100','320000','南京市','2','','','');
INSERT INTO `pa_city` VALUES ('8373','8372','320102','320100','玄武区','3','','','');
INSERT INTO `pa_city` VALUES ('8374','8372','320103','320100','白下区','3','','','');
INSERT INTO `pa_city` VALUES ('8375','8372','320104','320100','秦淮区','3','','','');
INSERT INTO `pa_city` VALUES ('8376','8372','320105','320100','建邺区','3','','','');
INSERT INTO `pa_city` VALUES ('8377','8372','320106','320100','鼓楼区','3','','','');
INSERT INTO `pa_city` VALUES ('8378','8372','320107','320100','下关区','3','','','');
INSERT INTO `pa_city` VALUES ('8379','8372','320111','320100','浦口区','3','','','');
INSERT INTO `pa_city` VALUES ('8380','8372','320113','320100','栖霞区','3','','','');
INSERT INTO `pa_city` VALUES ('8381','8372','320114','320100','雨花台区','3','','','');
INSERT INTO `pa_city` VALUES ('8382','8372','320115','320100','江宁区','3','','','');
INSERT INTO `pa_city` VALUES ('8383','8372','320116','320100','六合区','3','','','');
INSERT INTO `pa_city` VALUES ('8384','8372','320124','320100','溧水县','3','','','');
INSERT INTO `pa_city` VALUES ('8385','8372','320125','320100','高淳县','3','','','');
INSERT INTO `pa_city` VALUES ('8386','8372','320126','320100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8387','8371','320200','320000','无锡市','2','','','');
INSERT INTO `pa_city` VALUES ('8388','8387','320202','320200','崇安区','3','','','');
INSERT INTO `pa_city` VALUES ('8389','8387','320203','320200','南长区','3','','','');
INSERT INTO `pa_city` VALUES ('8390','8387','320204','320200','北塘区','3','','','');
INSERT INTO `pa_city` VALUES ('8391','8387','320205','320200','锡山区','3','','','');
INSERT INTO `pa_city` VALUES ('8392','8387','320206','320200','惠山区','3','','','');
INSERT INTO `pa_city` VALUES ('8393','8387','320211','320200','滨湖区','3','','','');
INSERT INTO `pa_city` VALUES ('8394','8387','320281','320200','江阴市','3','','','');
INSERT INTO `pa_city` VALUES ('8395','8387','320282','320200','宜兴市','3','','','');
INSERT INTO `pa_city` VALUES ('8396','8387','320296','320200','新区','3','','','');
INSERT INTO `pa_city` VALUES ('8397','8387','320297','320200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8398','8371','320300','320000','徐州市','2','','','');
INSERT INTO `pa_city` VALUES ('8399','8398','320302','320300','鼓楼区','3','','','');
INSERT INTO `pa_city` VALUES ('8400','8398','320303','320300','云龙区','3','','','');
INSERT INTO `pa_city` VALUES ('8401','8398','320304','320300','九里区','3','','','');
INSERT INTO `pa_city` VALUES ('8402','8398','320305','320300','贾汪区','3','','','');
INSERT INTO `pa_city` VALUES ('8403','8398','320311','320300','泉山区','3','','','');
INSERT INTO `pa_city` VALUES ('8404','8398','320321','320300','丰县','3','','','');
INSERT INTO `pa_city` VALUES ('8405','8398','320322','320300','沛县','3','','','');
INSERT INTO `pa_city` VALUES ('8406','8398','320323','320300','铜山县','3','','','');
INSERT INTO `pa_city` VALUES ('8407','8398','320324','320300','睢宁县','3','','','');
INSERT INTO `pa_city` VALUES ('8408','8398','320381','320300','新沂市','3','','','');
INSERT INTO `pa_city` VALUES ('8409','8398','320382','320300','邳州市','3','','','');
INSERT INTO `pa_city` VALUES ('8410','8398','320383','320300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8411','8371','320400','320000','常州市','2','','','');
INSERT INTO `pa_city` VALUES ('8412','8411','320402','320400','天宁区','3','','','');
INSERT INTO `pa_city` VALUES ('8413','8411','320404','320400','钟楼区','3','','','');
INSERT INTO `pa_city` VALUES ('8414','8411','320405','320400','戚墅堰区','3','','','');
INSERT INTO `pa_city` VALUES ('8415','8411','320411','320400','新北区','3','','','');
INSERT INTO `pa_city` VALUES ('8416','8411','320412','320400','武进区','3','','','');
INSERT INTO `pa_city` VALUES ('8417','8411','320481','320400','溧阳市','3','','','');
INSERT INTO `pa_city` VALUES ('8418','8411','320482','320400','金坛市','3','','','');
INSERT INTO `pa_city` VALUES ('8419','8411','320483','320400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8420','8371','320500','320000','苏州市','2','','','');
INSERT INTO `pa_city` VALUES ('8421','8420','320502','320500','沧浪区','3','','','');
INSERT INTO `pa_city` VALUES ('8422','8420','320503','320500','平江区','3','','','');
INSERT INTO `pa_city` VALUES ('8423','8420','320504','320500','金阊区','3','','','');
INSERT INTO `pa_city` VALUES ('8424','8420','320505','320500','虎丘区','3','','','');
INSERT INTO `pa_city` VALUES ('8425','8420','320506','320500','吴中区','3','','','');
INSERT INTO `pa_city` VALUES ('8426','8420','320507','320500','相城区','3','','','');
INSERT INTO `pa_city` VALUES ('8427','8420','320581','320500','常熟市','3','','','');
INSERT INTO `pa_city` VALUES ('8428','8420','320582','320500','张家港市','3','','','');
INSERT INTO `pa_city` VALUES ('8429','8420','320583','320500','昆山市','3','','','');
INSERT INTO `pa_city` VALUES ('8430','8420','320584','320500','吴江市','3','','','');
INSERT INTO `pa_city` VALUES ('8431','8420','320585','320500','太仓市','3','','','');
INSERT INTO `pa_city` VALUES ('8432','8420','320594','320500','新区','3','','','');
INSERT INTO `pa_city` VALUES ('8433','8420','320595','320500','园区','3','','','');
INSERT INTO `pa_city` VALUES ('8434','8420','320596','320500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8435','8371','320600','320000','南通市','2','','','');
INSERT INTO `pa_city` VALUES ('8436','8435','320602','320600','崇川区','3','','','');
INSERT INTO `pa_city` VALUES ('8437','8435','320611','320600','港闸区','3','','','');
INSERT INTO `pa_city` VALUES ('8438','8435','320612','320600','通州区','3','','','');
INSERT INTO `pa_city` VALUES ('8439','8435','320621','320600','海安县','3','','','');
INSERT INTO `pa_city` VALUES ('8440','8435','320623','320600','如东县','3','','','');
INSERT INTO `pa_city` VALUES ('8441','8435','320681','320600','启东市','3','','','');
INSERT INTO `pa_city` VALUES ('8442','8435','320682','320600','如皋市','3','','','');
INSERT INTO `pa_city` VALUES ('8443','8435','320683','320600','通州市','3','','','');
INSERT INTO `pa_city` VALUES ('8444','8435','320684','320600','海门市','3','','','');
INSERT INTO `pa_city` VALUES ('8445','8435','320693','320600','开发区','3','','','');
INSERT INTO `pa_city` VALUES ('8446','8435','320694','320600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8447','8371','320700','320000','连云港市','2','','','');
INSERT INTO `pa_city` VALUES ('8448','8447','320703','320700','连云区','3','','','');
INSERT INTO `pa_city` VALUES ('8449','8447','320705','320700','新浦区','3','','','');
INSERT INTO `pa_city` VALUES ('8450','8447','320706','320700','海州区','3','','','');
INSERT INTO `pa_city` VALUES ('8451','8447','320721','320700','赣榆县','3','','','');
INSERT INTO `pa_city` VALUES ('8452','8447','320722','320700','东海县','3','','','');
INSERT INTO `pa_city` VALUES ('8453','8447','320723','320700','灌云县','3','','','');
INSERT INTO `pa_city` VALUES ('8454','8447','320724','320700','灌南县','3','','','');
INSERT INTO `pa_city` VALUES ('8455','8447','320725','320700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8456','8371','320800','320000','淮安市','2','','','');
INSERT INTO `pa_city` VALUES ('8457','8456','320802','320800','清河区','3','','','');
INSERT INTO `pa_city` VALUES ('8458','8456','320803','320800','楚州区','3','','','');
INSERT INTO `pa_city` VALUES ('8459','8456','320804','320800','淮阴区','3','','','');
INSERT INTO `pa_city` VALUES ('8460','8456','320811','320800','清浦区','3','','','');
INSERT INTO `pa_city` VALUES ('8461','8456','320826','320800','涟水县','3','','','');
INSERT INTO `pa_city` VALUES ('8462','8456','320829','320800','洪泽县','3','','','');
INSERT INTO `pa_city` VALUES ('8463','8456','320830','320800','盱眙县','3','','','');
INSERT INTO `pa_city` VALUES ('8464','8456','320831','320800','金湖县','3','','','');
INSERT INTO `pa_city` VALUES ('8465','8456','320832','320800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8466','8371','320900','320000','盐城市','2','','','');
INSERT INTO `pa_city` VALUES ('8467','8466','320902','320900','亭湖区','3','','','');
INSERT INTO `pa_city` VALUES ('8468','8466','320903','320900','盐都区','3','','','');
INSERT INTO `pa_city` VALUES ('8469','8466','320921','320900','响水县','3','','','');
INSERT INTO `pa_city` VALUES ('8470','8466','320922','320900','滨海县','3','','','');
INSERT INTO `pa_city` VALUES ('8471','8466','320923','320900','阜宁县','3','','','');
INSERT INTO `pa_city` VALUES ('8472','8466','320924','320900','射阳县','3','','','');
INSERT INTO `pa_city` VALUES ('8473','8466','320925','320900','建湖县','3','','','');
INSERT INTO `pa_city` VALUES ('8474','8466','320981','320900','东台市','3','','','');
INSERT INTO `pa_city` VALUES ('8475','8466','320982','320900','大丰市','3','','','');
INSERT INTO `pa_city` VALUES ('8476','8466','320983','320900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8477','8371','321000','320000','扬州市','2','','','');
INSERT INTO `pa_city` VALUES ('8478','8477','321002','321000','广陵区','3','','','');
INSERT INTO `pa_city` VALUES ('8479','8477','321003','321000','邗江区','3','','','');
INSERT INTO `pa_city` VALUES ('8480','8477','321011','321000','维扬区','3','','','');
INSERT INTO `pa_city` VALUES ('8481','8477','321023','321000','宝应县','3','','','');
INSERT INTO `pa_city` VALUES ('8482','8477','321081','321000','仪征市','3','','','');
INSERT INTO `pa_city` VALUES ('8483','8477','321084','321000','高邮市','3','','','');
INSERT INTO `pa_city` VALUES ('8484','8477','321088','321000','江都市','3','','','');
INSERT INTO `pa_city` VALUES ('8485','8477','321092','321000','经济开发区','3','','','');
INSERT INTO `pa_city` VALUES ('8486','8477','321093','321000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8487','8371','321100','320000','镇江市','2','','','');
INSERT INTO `pa_city` VALUES ('8488','8487','321102','321100','京口区','3','','','');
INSERT INTO `pa_city` VALUES ('8489','8487','321111','321100','润州区','3','','','');
INSERT INTO `pa_city` VALUES ('8490','8487','321112','321100','丹徒区','3','','','');
INSERT INTO `pa_city` VALUES ('8491','8487','321181','321100','丹阳市','3','','','');
INSERT INTO `pa_city` VALUES ('8492','8487','321182','321100','扬中市','3','','','');
INSERT INTO `pa_city` VALUES ('8493','8487','321183','321100','句容市','3','','','');
INSERT INTO `pa_city` VALUES ('8494','8487','321184','321100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8495','8371','321200','320000','泰州市','2','','','');
INSERT INTO `pa_city` VALUES ('8496','8495','321202','321200','海陵区','3','','','');
INSERT INTO `pa_city` VALUES ('8497','8495','321203','321200','高港区','3','','','');
INSERT INTO `pa_city` VALUES ('8498','8495','321281','321200','兴化市','3','','','');
INSERT INTO `pa_city` VALUES ('8499','8495','321282','321200','靖江市','3','','','');
INSERT INTO `pa_city` VALUES ('8500','8495','321283','321200','泰兴市','3','','','');
INSERT INTO `pa_city` VALUES ('8501','8495','321284','321200','姜堰市','3','','','');
INSERT INTO `pa_city` VALUES ('8502','8495','321285','321200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8503','8371','321300','320000','宿迁市','2','','','');
INSERT INTO `pa_city` VALUES ('8504','8503','321302','321300','宿城区','3','','','');
INSERT INTO `pa_city` VALUES ('8505','8503','321311','321300','宿豫区','3','','','');
INSERT INTO `pa_city` VALUES ('8506','8503','321322','321300','沭阳县','3','','','');
INSERT INTO `pa_city` VALUES ('8507','8503','321323','321300','泗阳县','3','','','');
INSERT INTO `pa_city` VALUES ('8508','8503','321324','321300','泗洪县','3','','','');
INSERT INTO `pa_city` VALUES ('8509','8503','321325','321300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8510','7459','330000','1','浙江省','1','','','');
INSERT INTO `pa_city` VALUES ('8511','8510','330100','330000','杭州市','2','','','');
INSERT INTO `pa_city` VALUES ('8512','8511','330102','330100','上城区','3','','','');
INSERT INTO `pa_city` VALUES ('8513','8511','330103','330100','下城区','3','','','');
INSERT INTO `pa_city` VALUES ('8514','8511','330104','330100','江干区','3','','','');
INSERT INTO `pa_city` VALUES ('8515','8511','330105','330100','拱墅区','3','','','');
INSERT INTO `pa_city` VALUES ('8516','8511','330106','330100','西湖区','3','','','');
INSERT INTO `pa_city` VALUES ('8517','8511','330108','330100','滨江区','3','','','');
INSERT INTO `pa_city` VALUES ('8518','8511','330109','330100','萧山区','3','','','');
INSERT INTO `pa_city` VALUES ('8519','8511','330110','330100','余杭区','3','','','');
INSERT INTO `pa_city` VALUES ('8520','8511','330122','330100','桐庐县','3','','','');
INSERT INTO `pa_city` VALUES ('8521','8511','330127','330100','淳安县','3','','','');
INSERT INTO `pa_city` VALUES ('8522','8511','330182','330100','建德市','3','','','');
INSERT INTO `pa_city` VALUES ('8523','8511','330183','330100','富阳市','3','','','');
INSERT INTO `pa_city` VALUES ('8524','8511','330185','330100','临安市','3','','','');
INSERT INTO `pa_city` VALUES ('8525','8511','330186','330100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8526','8510','330200','330000','宁波市','2','','','');
INSERT INTO `pa_city` VALUES ('8527','8526','330203','330200','海曙区','3','','','');
INSERT INTO `pa_city` VALUES ('8528','8526','330204','330200','江东区','3','','','');
INSERT INTO `pa_city` VALUES ('8529','8526','330205','330200','江北区','3','','','');
INSERT INTO `pa_city` VALUES ('8530','8526','330206','330200','北仑区','3','','','');
INSERT INTO `pa_city` VALUES ('8531','8526','330211','330200','镇海区','3','','','');
INSERT INTO `pa_city` VALUES ('8532','8526','330212','330200','鄞州区','3','','','');
INSERT INTO `pa_city` VALUES ('8533','8526','330225','330200','象山县','3','','','');
INSERT INTO `pa_city` VALUES ('8534','8526','330226','330200','宁海县','3','','','');
INSERT INTO `pa_city` VALUES ('8535','8526','330281','330200','余姚市','3','','','');
INSERT INTO `pa_city` VALUES ('8536','8526','330282','330200','慈溪市','3','','','');
INSERT INTO `pa_city` VALUES ('8537','8526','330283','330200','奉化市','3','','','');
INSERT INTO `pa_city` VALUES ('8538','8526','330284','330200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8539','8510','330300','330000','温州市','2','','','');
INSERT INTO `pa_city` VALUES ('8540','8539','330302','330300','鹿城区','3','','','');
INSERT INTO `pa_city` VALUES ('8541','8539','330303','330300','龙湾区','3','','','');
INSERT INTO `pa_city` VALUES ('8542','8539','330304','330300','瓯海区','3','','','');
INSERT INTO `pa_city` VALUES ('8543','8539','330322','330300','洞头县','3','','','');
INSERT INTO `pa_city` VALUES ('8544','8539','330324','330300','永嘉县','3','','','');
INSERT INTO `pa_city` VALUES ('8545','8539','330326','330300','平阳县','3','','','');
INSERT INTO `pa_city` VALUES ('8546','8539','330327','330300','苍南县','3','','','');
INSERT INTO `pa_city` VALUES ('8547','8539','330328','330300','文成县','3','','','');
INSERT INTO `pa_city` VALUES ('8548','8539','330329','330300','泰顺县','3','','','');
INSERT INTO `pa_city` VALUES ('8549','8539','330381','330300','瑞安市','3','','','');
INSERT INTO `pa_city` VALUES ('8550','8539','330382','330300','乐清市','3','','','');
INSERT INTO `pa_city` VALUES ('8551','8539','330383','330300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8552','8510','330400','330000','嘉兴市','2','','','');
INSERT INTO `pa_city` VALUES ('8553','8552','330402','330400','南湖区','3','','','');
INSERT INTO `pa_city` VALUES ('8554','8552','330411','330400','秀洲区','3','','','');
INSERT INTO `pa_city` VALUES ('8555','8552','330421','330400','嘉善县','3','','','');
INSERT INTO `pa_city` VALUES ('8556','8552','330424','330400','海盐县','3','','','');
INSERT INTO `pa_city` VALUES ('8557','8552','330481','330400','海宁市','3','','','');
INSERT INTO `pa_city` VALUES ('8558','8552','330482','330400','平湖市','3','','','');
INSERT INTO `pa_city` VALUES ('8559','8552','330483','330400','桐乡市','3','','','');
INSERT INTO `pa_city` VALUES ('8560','8552','330484','330400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8561','8510','330500','330000','湖州市','2','','','');
INSERT INTO `pa_city` VALUES ('8562','8561','330502','330500','吴兴区','3','','','');
INSERT INTO `pa_city` VALUES ('8563','8561','330503','330500','南浔区','3','','','');
INSERT INTO `pa_city` VALUES ('8564','8561','330521','330500','德清县','3','','','');
INSERT INTO `pa_city` VALUES ('8565','8561','330522','330500','长兴县','3','','','');
INSERT INTO `pa_city` VALUES ('8566','8561','330523','330500','安吉县','3','','','');
INSERT INTO `pa_city` VALUES ('8567','8561','330524','330500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8568','8510','330600','330000','绍兴市','2','','','');
INSERT INTO `pa_city` VALUES ('8569','8568','330602','330600','越城区','3','','','');
INSERT INTO `pa_city` VALUES ('8570','8568','330621','330600','绍兴县','3','','','');
INSERT INTO `pa_city` VALUES ('8571','8568','330624','330600','新昌县','3','','','');
INSERT INTO `pa_city` VALUES ('8572','8568','330681','330600','诸暨市','3','','','');
INSERT INTO `pa_city` VALUES ('8573','8568','330682','330600','上虞市','3','','','');
INSERT INTO `pa_city` VALUES ('8574','8568','330683','330600','嵊州市','3','','','');
INSERT INTO `pa_city` VALUES ('8575','8568','330684','330600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8576','8510','330700','330000','金华市','2','','','');
INSERT INTO `pa_city` VALUES ('8577','8576','330702','330700','婺城区','3','','','');
INSERT INTO `pa_city` VALUES ('8578','8576','330703','330700','金东区','3','','','');
INSERT INTO `pa_city` VALUES ('8579','8576','330723','330700','武义县','3','','','');
INSERT INTO `pa_city` VALUES ('8580','8576','330726','330700','浦江县','3','','','');
INSERT INTO `pa_city` VALUES ('8581','8576','330727','330700','磐安县','3','','','');
INSERT INTO `pa_city` VALUES ('8582','8576','330781','330700','兰溪市','3','','','');
INSERT INTO `pa_city` VALUES ('8583','8576','330782','330700','义乌市','3','','','');
INSERT INTO `pa_city` VALUES ('8584','8576','330783','330700','东阳市','3','','','');
INSERT INTO `pa_city` VALUES ('8585','8576','330784','330700','永康市','3','','','');
INSERT INTO `pa_city` VALUES ('8586','8576','330785','330700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8587','8510','330800','330000','衢州市','2','','','');
INSERT INTO `pa_city` VALUES ('8588','8587','330802','330800','柯城区','3','','','');
INSERT INTO `pa_city` VALUES ('8589','8587','330803','330800','衢江区','3','','','');
INSERT INTO `pa_city` VALUES ('8590','8587','330822','330800','常山县','3','','','');
INSERT INTO `pa_city` VALUES ('8591','8587','330824','330800','开化县','3','','','');
INSERT INTO `pa_city` VALUES ('8592','8587','330825','330800','龙游县','3','','','');
INSERT INTO `pa_city` VALUES ('8593','8587','330881','330800','江山市','3','','','');
INSERT INTO `pa_city` VALUES ('8594','8587','330882','330800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8595','8510','330900','330000','舟山市','2','','','');
INSERT INTO `pa_city` VALUES ('8596','8595','330902','330900','定海区','3','','','');
INSERT INTO `pa_city` VALUES ('8597','8595','330903','330900','普陀区','3','','','');
INSERT INTO `pa_city` VALUES ('8598','8595','330921','330900','岱山县','3','','','');
INSERT INTO `pa_city` VALUES ('8599','8595','330922','330900','嵊泗县','3','','','');
INSERT INTO `pa_city` VALUES ('8600','8595','330923','330900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8601','8510','331000','330000','台州市','2','','','');
INSERT INTO `pa_city` VALUES ('8602','8601','331002','331000','椒江区','3','','','');
INSERT INTO `pa_city` VALUES ('8603','8601','331003','331000','黄岩区','3','','','');
INSERT INTO `pa_city` VALUES ('8604','8601','331004','331000','路桥区','3','','','');
INSERT INTO `pa_city` VALUES ('8605','8601','331021','331000','玉环县','3','','','');
INSERT INTO `pa_city` VALUES ('8606','8601','331022','331000','三门县','3','','','');
INSERT INTO `pa_city` VALUES ('8607','8601','331023','331000','天台县','3','','','');
INSERT INTO `pa_city` VALUES ('8608','8601','331024','331000','仙居县','3','','','');
INSERT INTO `pa_city` VALUES ('8609','8601','331081','331000','温岭市','3','','','');
INSERT INTO `pa_city` VALUES ('8610','8601','331082','331000','临海市','3','','','');
INSERT INTO `pa_city` VALUES ('8611','8601','331083','331000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8612','8510','331100','330000','丽水市','2','','','');
INSERT INTO `pa_city` VALUES ('8613','8612','331102','331100','莲都区','3','','','');
INSERT INTO `pa_city` VALUES ('8614','8612','331121','331100','青田县','3','','','');
INSERT INTO `pa_city` VALUES ('8615','8612','331122','331100','缙云县','3','','','');
INSERT INTO `pa_city` VALUES ('8616','8612','331123','331100','遂昌县','3','','','');
INSERT INTO `pa_city` VALUES ('8617','8612','331124','331100','松阳县','3','','','');
INSERT INTO `pa_city` VALUES ('8618','8612','331125','331100','云和县','3','','','');
INSERT INTO `pa_city` VALUES ('8619','8612','331126','331100','庆元县','3','','','');
INSERT INTO `pa_city` VALUES ('8620','8612','331127','331100','景宁畲族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('8621','8612','331181','331100','龙泉市','3','','','');
INSERT INTO `pa_city` VALUES ('8622','8612','331182','331100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8623','7459','340000','1','安徽省','1','','','');
INSERT INTO `pa_city` VALUES ('8624','8623','340100','340000','合肥市','2','','','');
INSERT INTO `pa_city` VALUES ('8625','8624','340102','340100','瑶海区','3','','','');
INSERT INTO `pa_city` VALUES ('8626','8624','340103','340100','庐阳区','3','','','');
INSERT INTO `pa_city` VALUES ('8627','8624','340104','340100','蜀山区','3','','','');
INSERT INTO `pa_city` VALUES ('8628','8624','340111','340100','包河区','3','','','');
INSERT INTO `pa_city` VALUES ('8629','8624','340121','340100','长丰县','3','','','');
INSERT INTO `pa_city` VALUES ('8630','8624','340122','340100','肥东县','3','','','');
INSERT INTO `pa_city` VALUES ('8631','8624','340123','340100','肥西县','3','','','');
INSERT INTO `pa_city` VALUES ('8632','8624','340151','340100','高新区','3','','','');
INSERT INTO `pa_city` VALUES ('8633','8624','340191','340100','中区','3','','','');
INSERT INTO `pa_city` VALUES ('8634','8624','340192','340100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8635','8623','340200','340000','芜湖市','2','','','');
INSERT INTO `pa_city` VALUES ('8636','8635','340202','340200','镜湖区','3','','','');
INSERT INTO `pa_city` VALUES ('8637','8635','340203','340200','弋江区','3','','','');
INSERT INTO `pa_city` VALUES ('8638','8635','340207','340200','鸠江区','3','','','');
INSERT INTO `pa_city` VALUES ('8639','8635','340208','340200','三山区','3','','','');
INSERT INTO `pa_city` VALUES ('8640','8635','340221','340200','芜湖县','3','','','');
INSERT INTO `pa_city` VALUES ('8641','8635','340222','340200','繁昌县','3','','','');
INSERT INTO `pa_city` VALUES ('8642','8635','340223','340200','南陵县','3','','','');
INSERT INTO `pa_city` VALUES ('8643','8635','340224','340200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8644','8623','340300','340000','蚌埠市','2','','','');
INSERT INTO `pa_city` VALUES ('8645','8644','340302','340300','龙子湖区','3','','','');
INSERT INTO `pa_city` VALUES ('8646','8644','340303','340300','蚌山区','3','','','');
INSERT INTO `pa_city` VALUES ('8647','8644','340304','340300','禹会区','3','','','');
INSERT INTO `pa_city` VALUES ('8648','8644','340311','340300','淮上区','3','','','');
INSERT INTO `pa_city` VALUES ('8649','8644','340321','340300','怀远县','3','','','');
INSERT INTO `pa_city` VALUES ('8650','8644','340322','340300','五河县','3','','','');
INSERT INTO `pa_city` VALUES ('8651','8644','340323','340300','固镇县','3','','','');
INSERT INTO `pa_city` VALUES ('8652','8644','340324','340300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8653','8623','340400','340000','淮南市','2','','','');
INSERT INTO `pa_city` VALUES ('8654','8653','340402','340400','大通区','3','','','');
INSERT INTO `pa_city` VALUES ('8655','8653','340403','340400','田家庵区','3','','','');
INSERT INTO `pa_city` VALUES ('8656','8653','340404','340400','谢家集区','3','','','');
INSERT INTO `pa_city` VALUES ('8657','8653','340405','340400','八公山区','3','','','');
INSERT INTO `pa_city` VALUES ('8658','8653','340406','340400','潘集区','3','','','');
INSERT INTO `pa_city` VALUES ('8659','8653','340421','340400','凤台县','3','','','');
INSERT INTO `pa_city` VALUES ('8660','8653','340422','340400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8661','8623','340500','340000','马鞍山市','2','','','');
INSERT INTO `pa_city` VALUES ('8662','8661','340502','340500','金家庄区','3','','','');
INSERT INTO `pa_city` VALUES ('8663','8661','340503','340500','花山区','3','','','');
INSERT INTO `pa_city` VALUES ('8664','8661','340504','340500','雨山区','3','','','');
INSERT INTO `pa_city` VALUES ('8665','8661','340521','340500','当涂县','3','','','');
INSERT INTO `pa_city` VALUES ('8666','8661','340522','340500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8667','8623','340600','340000','淮北市','2','','','');
INSERT INTO `pa_city` VALUES ('8668','8667','340602','340600','杜集区','3','','','');
INSERT INTO `pa_city` VALUES ('8669','8667','340603','340600','相山区','3','','','');
INSERT INTO `pa_city` VALUES ('8670','8667','340604','340600','烈山区','3','','','');
INSERT INTO `pa_city` VALUES ('8671','8667','340621','340600','濉溪县','3','','','');
INSERT INTO `pa_city` VALUES ('8672','8667','340622','340600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8673','8623','340700','340000','铜陵市','2','','','');
INSERT INTO `pa_city` VALUES ('8674','8673','340702','340700','铜官山区','3','','','');
INSERT INTO `pa_city` VALUES ('8675','8673','340703','340700','狮子山区','3','','','');
INSERT INTO `pa_city` VALUES ('8676','8673','340711','340700','郊区','3','','','');
INSERT INTO `pa_city` VALUES ('8677','8673','340721','340700','铜陵县','3','','','');
INSERT INTO `pa_city` VALUES ('8678','8673','340722','340700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8679','8623','340800','340000','安庆市','2','','','');
INSERT INTO `pa_city` VALUES ('8680','8679','340802','340800','迎江区','3','','','');
INSERT INTO `pa_city` VALUES ('8681','8679','340803','340800','大观区','3','','','');
INSERT INTO `pa_city` VALUES ('8682','8679','340811','340800','宜秀区','3','','','');
INSERT INTO `pa_city` VALUES ('8683','8679','340822','340800','怀宁县','3','','','');
INSERT INTO `pa_city` VALUES ('8684','8679','340823','340800','枞阳县','3','','','');
INSERT INTO `pa_city` VALUES ('8685','8679','340824','340800','潜山县','3','','','');
INSERT INTO `pa_city` VALUES ('8686','8679','340825','340800','太湖县','3','','','');
INSERT INTO `pa_city` VALUES ('8687','8679','340826','340800','宿松县','3','','','');
INSERT INTO `pa_city` VALUES ('8688','8679','340827','340800','望江县','3','','','');
INSERT INTO `pa_city` VALUES ('8689','8679','340828','340800','岳西县','3','','','');
INSERT INTO `pa_city` VALUES ('8690','8679','340881','340800','桐城市','3','','','');
INSERT INTO `pa_city` VALUES ('8691','8679','340882','340800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8692','8623','341000','340000','黄山市','2','','','');
INSERT INTO `pa_city` VALUES ('8693','8692','341002','341000','屯溪区','3','','','');
INSERT INTO `pa_city` VALUES ('8694','8692','341003','341000','黄山区','3','','','');
INSERT INTO `pa_city` VALUES ('8695','8692','341004','341000','徽州区','3','','','');
INSERT INTO `pa_city` VALUES ('8696','8692','341021','341000','歙县','3','','','');
INSERT INTO `pa_city` VALUES ('8697','8692','341022','341000','休宁县','3','','','');
INSERT INTO `pa_city` VALUES ('8698','8692','341023','341000','黟县','3','','','');
INSERT INTO `pa_city` VALUES ('8699','8692','341024','341000','祁门县','3','','','');
INSERT INTO `pa_city` VALUES ('8700','8692','341025','341000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8701','8623','341100','340000','滁州市','2','','','');
INSERT INTO `pa_city` VALUES ('8702','8701','341102','341100','琅琊区','3','','','');
INSERT INTO `pa_city` VALUES ('8703','8701','341103','341100','南谯区','3','','','');
INSERT INTO `pa_city` VALUES ('8704','8701','341122','341100','来安县','3','','','');
INSERT INTO `pa_city` VALUES ('8705','8701','341124','341100','全椒县','3','','','');
INSERT INTO `pa_city` VALUES ('8706','8701','341125','341100','定远县','3','','','');
INSERT INTO `pa_city` VALUES ('8707','8701','341126','341100','凤阳县','3','','','');
INSERT INTO `pa_city` VALUES ('8708','8701','341181','341100','天长市','3','','','');
INSERT INTO `pa_city` VALUES ('8709','8701','341182','341100','明光市','3','','','');
INSERT INTO `pa_city` VALUES ('8710','8701','341183','341100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8711','8623','341200','340000','阜阳市','2','','','');
INSERT INTO `pa_city` VALUES ('8712','8711','341202','341200','颍州区','3','','','');
INSERT INTO `pa_city` VALUES ('8713','8711','341203','341200','颍东区','3','','','');
INSERT INTO `pa_city` VALUES ('8714','8711','341204','341200','颍泉区','3','','','');
INSERT INTO `pa_city` VALUES ('8715','8711','341221','341200','临泉县','3','','','');
INSERT INTO `pa_city` VALUES ('8716','8711','341222','341200','太和县','3','','','');
INSERT INTO `pa_city` VALUES ('8717','8711','341225','341200','阜南县','3','','','');
INSERT INTO `pa_city` VALUES ('8718','8711','341226','341200','颍上县','3','','','');
INSERT INTO `pa_city` VALUES ('8719','8711','341282','341200','界首市','3','','','');
INSERT INTO `pa_city` VALUES ('8720','8711','341283','341200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8721','8623','341300','340000','宿州市','2','','','');
INSERT INTO `pa_city` VALUES ('8722','8721','341302','341300','埇桥区','3','','','');
INSERT INTO `pa_city` VALUES ('8723','8721','341321','341300','砀山县','3','','','');
INSERT INTO `pa_city` VALUES ('8724','8721','341322','341300','萧县','3','','','');
INSERT INTO `pa_city` VALUES ('8725','8721','341323','341300','灵璧县','3','','','');
INSERT INTO `pa_city` VALUES ('8726','8721','341324','341300','泗县','3','','','');
INSERT INTO `pa_city` VALUES ('8727','8721','341325','341300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8728','8623','341400','340000','巢湖市','2','','','');
INSERT INTO `pa_city` VALUES ('8729','8728','341402','341400','居巢区','3','','','');
INSERT INTO `pa_city` VALUES ('8730','8728','341421','341400','庐江县','3','','','');
INSERT INTO `pa_city` VALUES ('8731','8728','341422','341400','无为县','3','','','');
INSERT INTO `pa_city` VALUES ('8732','8728','341423','341400','含山县','3','','','');
INSERT INTO `pa_city` VALUES ('8733','8728','341424','341400','和县','3','','','');
INSERT INTO `pa_city` VALUES ('8734','8728','341425','341400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8735','8623','341500','340000','六安市','2','','','');
INSERT INTO `pa_city` VALUES ('8736','8735','341502','341500','金安区','3','','','');
INSERT INTO `pa_city` VALUES ('8737','8735','341503','341500','裕安区','3','','','');
INSERT INTO `pa_city` VALUES ('8738','8735','341521','341500','寿县','3','','','');
INSERT INTO `pa_city` VALUES ('8739','8735','341522','341500','霍邱县','3','','','');
INSERT INTO `pa_city` VALUES ('8740','8735','341523','341500','舒城县','3','','','');
INSERT INTO `pa_city` VALUES ('8741','8735','341524','341500','金寨县','3','','','');
INSERT INTO `pa_city` VALUES ('8742','8735','341525','341500','霍山县','3','','','');
INSERT INTO `pa_city` VALUES ('8743','8735','341526','341500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8744','8623','341600','340000','亳州市','2','','','');
INSERT INTO `pa_city` VALUES ('8745','8744','341602','341600','谯城区','3','','','');
INSERT INTO `pa_city` VALUES ('8746','8744','341621','341600','涡阳县','3','','','');
INSERT INTO `pa_city` VALUES ('8747','8744','341622','341600','蒙城县','3','','','');
INSERT INTO `pa_city` VALUES ('8748','8744','341623','341600','利辛县','3','','','');
INSERT INTO `pa_city` VALUES ('8749','8744','341624','341600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8750','8623','341700','340000','池州市','2','','','');
INSERT INTO `pa_city` VALUES ('8751','8750','341702','341700','贵池区','3','','','');
INSERT INTO `pa_city` VALUES ('8752','8750','341721','341700','东至县','3','','','');
INSERT INTO `pa_city` VALUES ('8753','8750','341722','341700','石台县','3','','','');
INSERT INTO `pa_city` VALUES ('8754','8750','341723','341700','青阳县','3','','','');
INSERT INTO `pa_city` VALUES ('8755','8750','341724','341700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8756','8623','341800','340000','宣城市','2','','','');
INSERT INTO `pa_city` VALUES ('8757','8756','341802','341800','宣州区','3','','','');
INSERT INTO `pa_city` VALUES ('8758','8756','341821','341800','郎溪县','3','','','');
INSERT INTO `pa_city` VALUES ('8759','8756','341822','341800','广德县','3','','','');
INSERT INTO `pa_city` VALUES ('8760','8756','341823','341800','泾县','3','','','');
INSERT INTO `pa_city` VALUES ('8761','8756','341824','341800','绩溪县','3','','','');
INSERT INTO `pa_city` VALUES ('8762','8756','341825','341800','旌德县','3','','','');
INSERT INTO `pa_city` VALUES ('8763','8756','341881','341800','宁国市','3','','','');
INSERT INTO `pa_city` VALUES ('8764','8756','341882','341800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8765','7459','350000','1','福建省','1','','','');
INSERT INTO `pa_city` VALUES ('8766','8765','350100','350000','福州市','2','','','');
INSERT INTO `pa_city` VALUES ('8767','8766','350102','350100','鼓楼区','3','','','');
INSERT INTO `pa_city` VALUES ('8768','8766','350103','350100','台江区','3','','','');
INSERT INTO `pa_city` VALUES ('8769','8766','350104','350100','仓山区','3','','','');
INSERT INTO `pa_city` VALUES ('8770','8766','350105','350100','马尾区','3','','','');
INSERT INTO `pa_city` VALUES ('8771','8766','350111','350100','晋安区','3','','','');
INSERT INTO `pa_city` VALUES ('8772','8766','350121','350100','闽侯县','3','','','');
INSERT INTO `pa_city` VALUES ('8773','8766','350122','350100','连江县','3','','','');
INSERT INTO `pa_city` VALUES ('8774','8766','350123','350100','罗源县','3','','','');
INSERT INTO `pa_city` VALUES ('8775','8766','350124','350100','闽清县','3','','','');
INSERT INTO `pa_city` VALUES ('8776','8766','350125','350100','永泰县','3','','','');
INSERT INTO `pa_city` VALUES ('8777','8766','350128','350100','平潭县','3','','','');
INSERT INTO `pa_city` VALUES ('8778','8766','350181','350100','福清市','3','','','');
INSERT INTO `pa_city` VALUES ('8779','8766','350182','350100','长乐市','3','','','');
INSERT INTO `pa_city` VALUES ('8780','8766','350183','350100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8781','8765','350200','350000','厦门市','2','','','');
INSERT INTO `pa_city` VALUES ('8782','8781','350203','350200','思明区','3','','','');
INSERT INTO `pa_city` VALUES ('8783','8781','350205','350200','海沧区','3','','','');
INSERT INTO `pa_city` VALUES ('8784','8781','350206','350200','湖里区','3','','','');
INSERT INTO `pa_city` VALUES ('8785','8781','350211','350200','集美区','3','','','');
INSERT INTO `pa_city` VALUES ('8786','8781','350212','350200','同安区','3','','','');
INSERT INTO `pa_city` VALUES ('8787','8781','350213','350200','翔安区','3','','','');
INSERT INTO `pa_city` VALUES ('8788','8781','350214','350200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8789','8765','350300','350000','莆田市','2','','','');
INSERT INTO `pa_city` VALUES ('8790','8789','350302','350300','城厢区','3','','','');
INSERT INTO `pa_city` VALUES ('8791','8789','350303','350300','涵江区','3','','','');
INSERT INTO `pa_city` VALUES ('8792','8789','350304','350300','荔城区','3','','','');
INSERT INTO `pa_city` VALUES ('8793','8789','350305','350300','秀屿区','3','','','');
INSERT INTO `pa_city` VALUES ('8794','8789','350322','350300','仙游县','3','','','');
INSERT INTO `pa_city` VALUES ('8795','8789','350323','350300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8796','8765','350400','350000','三明市','2','','','');
INSERT INTO `pa_city` VALUES ('8797','8796','350402','350400','梅列区','3','','','');
INSERT INTO `pa_city` VALUES ('8798','8796','350403','350400','三元区','3','','','');
INSERT INTO `pa_city` VALUES ('8799','8796','350421','350400','明溪县','3','','','');
INSERT INTO `pa_city` VALUES ('8800','8796','350423','350400','清流县','3','','','');
INSERT INTO `pa_city` VALUES ('8801','8796','350424','350400','宁化县','3','','','');
INSERT INTO `pa_city` VALUES ('8802','8796','350425','350400','大田县','3','','','');
INSERT INTO `pa_city` VALUES ('8803','8796','350426','350400','尤溪县','3','','','');
INSERT INTO `pa_city` VALUES ('8804','8796','350427','350400','沙县','3','','','');
INSERT INTO `pa_city` VALUES ('8805','8796','350428','350400','将乐县','3','','','');
INSERT INTO `pa_city` VALUES ('8806','8796','350429','350400','泰宁县','3','','','');
INSERT INTO `pa_city` VALUES ('8807','8796','350430','350400','建宁县','3','','','');
INSERT INTO `pa_city` VALUES ('8808','8796','350481','350400','永安市','3','','','');
INSERT INTO `pa_city` VALUES ('8809','8796','350482','350400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8810','8765','350500','350000','泉州市','2','','','');
INSERT INTO `pa_city` VALUES ('8811','8810','350502','350500','鲤城区','3','','','');
INSERT INTO `pa_city` VALUES ('8812','8810','350503','350500','丰泽区','3','','','');
INSERT INTO `pa_city` VALUES ('8813','8810','350504','350500','洛江区','3','','','');
INSERT INTO `pa_city` VALUES ('8814','8810','350505','350500','泉港区','3','','','');
INSERT INTO `pa_city` VALUES ('8815','8810','350521','350500','惠安县','3','','','');
INSERT INTO `pa_city` VALUES ('8816','8810','350524','350500','安溪县','3','','','');
INSERT INTO `pa_city` VALUES ('8817','8810','350525','350500','永春县','3','','','');
INSERT INTO `pa_city` VALUES ('8818','8810','350526','350500','德化县','3','','','');
INSERT INTO `pa_city` VALUES ('8819','8810','350527','350500','金门县','3','','','');
INSERT INTO `pa_city` VALUES ('8820','8810','350581','350500','石狮市','3','','','');
INSERT INTO `pa_city` VALUES ('8821','8810','350582','350500','晋江市','3','','','');
INSERT INTO `pa_city` VALUES ('8822','8810','350583','350500','南安市','3','','','');
INSERT INTO `pa_city` VALUES ('8823','8810','350584','350500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8824','8765','350600','350000','漳州市','2','','','');
INSERT INTO `pa_city` VALUES ('8825','8824','350602','350600','芗城区','3','','','');
INSERT INTO `pa_city` VALUES ('8826','8824','350603','350600','龙文区','3','','','');
INSERT INTO `pa_city` VALUES ('8827','8824','350622','350600','云霄县','3','','','');
INSERT INTO `pa_city` VALUES ('8828','8824','350623','350600','漳浦县','3','','','');
INSERT INTO `pa_city` VALUES ('8829','8824','350624','350600','诏安县','3','','','');
INSERT INTO `pa_city` VALUES ('8830','8824','350625','350600','长泰县','3','','','');
INSERT INTO `pa_city` VALUES ('8831','8824','350626','350600','东山县','3','','','');
INSERT INTO `pa_city` VALUES ('8832','8824','350627','350600','南靖县','3','','','');
INSERT INTO `pa_city` VALUES ('8833','8824','350628','350600','平和县','3','','','');
INSERT INTO `pa_city` VALUES ('8834','8824','350629','350600','华安县','3','','','');
INSERT INTO `pa_city` VALUES ('8835','8824','350681','350600','龙海市','3','','','');
INSERT INTO `pa_city` VALUES ('8836','8824','350682','350600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8837','8765','350700','350000','南平市','2','','','');
INSERT INTO `pa_city` VALUES ('8838','8837','350702','350700','延平区','3','','','');
INSERT INTO `pa_city` VALUES ('8839','8837','350721','350700','顺昌县','3','','','');
INSERT INTO `pa_city` VALUES ('8840','8837','350722','350700','浦城县','3','','','');
INSERT INTO `pa_city` VALUES ('8841','8837','350723','350700','光泽县','3','','','');
INSERT INTO `pa_city` VALUES ('8842','8837','350724','350700','松溪县','3','','','');
INSERT INTO `pa_city` VALUES ('8843','8837','350725','350700','政和县','3','','','');
INSERT INTO `pa_city` VALUES ('8844','8837','350781','350700','邵武市','3','','','');
INSERT INTO `pa_city` VALUES ('8845','8837','350782','350700','武夷山市','3','','','');
INSERT INTO `pa_city` VALUES ('8846','8837','350783','350700','建瓯市','3','','','');
INSERT INTO `pa_city` VALUES ('8847','8837','350784','350700','建阳市','3','','','');
INSERT INTO `pa_city` VALUES ('8848','8837','350785','350700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8849','8765','350800','350000','龙岩市','2','','','');
INSERT INTO `pa_city` VALUES ('8850','8849','350802','350800','新罗区','3','','','');
INSERT INTO `pa_city` VALUES ('8851','8849','350821','350800','长汀县','3','','','');
INSERT INTO `pa_city` VALUES ('8852','8849','350822','350800','永定县','3','','','');
INSERT INTO `pa_city` VALUES ('8853','8849','350823','350800','上杭县','3','','','');
INSERT INTO `pa_city` VALUES ('8854','8849','350824','350800','武平县','3','','','');
INSERT INTO `pa_city` VALUES ('8855','8849','350825','350800','连城县','3','','','');
INSERT INTO `pa_city` VALUES ('8856','8849','350881','350800','漳平市','3','','','');
INSERT INTO `pa_city` VALUES ('8857','8849','350882','350800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8858','8765','350900','350000','宁德市','2','','','');
INSERT INTO `pa_city` VALUES ('8859','8858','350902','350900','蕉城区','3','','','');
INSERT INTO `pa_city` VALUES ('8860','8858','350921','350900','霞浦县','3','','','');
INSERT INTO `pa_city` VALUES ('8861','8858','350922','350900','古田县','3','','','');
INSERT INTO `pa_city` VALUES ('8862','8858','350923','350900','屏南县','3','','','');
INSERT INTO `pa_city` VALUES ('8863','8858','350924','350900','寿宁县','3','','','');
INSERT INTO `pa_city` VALUES ('8864','8858','350925','350900','周宁县','3','','','');
INSERT INTO `pa_city` VALUES ('8865','8858','350926','350900','柘荣县','3','','','');
INSERT INTO `pa_city` VALUES ('8866','8858','350981','350900','福安市','3','','','');
INSERT INTO `pa_city` VALUES ('8867','8858','350982','350900','福鼎市','3','','','');
INSERT INTO `pa_city` VALUES ('8868','8858','350983','350900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8869','7459','360000','1','江西省','1','','','');
INSERT INTO `pa_city` VALUES ('8870','8869','360100','360000','南昌市','2','','','');
INSERT INTO `pa_city` VALUES ('8871','8870','360102','360100','东湖区','3','','','');
INSERT INTO `pa_city` VALUES ('8872','8870','360103','360100','西湖区','3','','','');
INSERT INTO `pa_city` VALUES ('8873','8870','360104','360100','青云谱区','3','','','');
INSERT INTO `pa_city` VALUES ('8874','8870','360105','360100','湾里区','3','','','');
INSERT INTO `pa_city` VALUES ('8875','8870','360111','360100','青山湖区','3','','','');
INSERT INTO `pa_city` VALUES ('8876','8870','360121','360100','南昌县','3','','','');
INSERT INTO `pa_city` VALUES ('8877','8870','360122','360100','新建县','3','','','');
INSERT INTO `pa_city` VALUES ('8878','8870','360123','360100','安义县','3','','','');
INSERT INTO `pa_city` VALUES ('8879','8870','360124','360100','进贤县','3','','','');
INSERT INTO `pa_city` VALUES ('8880','8870','360125','360100','红谷滩新区','3','','','');
INSERT INTO `pa_city` VALUES ('8881','8870','360126','360100','经济技术开发区','3','','','');
INSERT INTO `pa_city` VALUES ('8882','8870','360127','360100','昌北区','3','','','');
INSERT INTO `pa_city` VALUES ('8883','8870','360128','360100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8884','8869','360200','360000','景德镇市','2','','','');
INSERT INTO `pa_city` VALUES ('8885','8884','360202','360200','昌江区','3','','','');
INSERT INTO `pa_city` VALUES ('8886','8884','360203','360200','珠山区','3','','','');
INSERT INTO `pa_city` VALUES ('8887','8884','360222','360200','浮梁县','3','','','');
INSERT INTO `pa_city` VALUES ('8888','8884','360281','360200','乐平市','3','','','');
INSERT INTO `pa_city` VALUES ('8889','8884','360282','360200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8890','8869','360300','360000','萍乡市','2','','','');
INSERT INTO `pa_city` VALUES ('8891','8890','360302','360300','安源区','3','','','');
INSERT INTO `pa_city` VALUES ('8892','8890','360313','360300','湘东区','3','','','');
INSERT INTO `pa_city` VALUES ('8893','8890','360321','360300','莲花县','3','','','');
INSERT INTO `pa_city` VALUES ('8894','8890','360322','360300','上栗县','3','','','');
INSERT INTO `pa_city` VALUES ('8895','8890','360323','360300','芦溪县','3','','','');
INSERT INTO `pa_city` VALUES ('8896','8890','360324','360300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8897','8869','360400','360000','九江市','2','','','');
INSERT INTO `pa_city` VALUES ('8898','8897','360402','360400','庐山区','3','','','');
INSERT INTO `pa_city` VALUES ('8899','8897','360403','360400','浔阳区','3','','','');
INSERT INTO `pa_city` VALUES ('8900','8897','360421','360400','九江县','3','','','');
INSERT INTO `pa_city` VALUES ('8901','8897','360423','360400','武宁县','3','','','');
INSERT INTO `pa_city` VALUES ('8902','8897','360424','360400','修水县','3','','','');
INSERT INTO `pa_city` VALUES ('8903','8897','360425','360400','永修县','3','','','');
INSERT INTO `pa_city` VALUES ('8904','8897','360426','360400','德安县','3','','','');
INSERT INTO `pa_city` VALUES ('8905','8897','360427','360400','星子县','3','','','');
INSERT INTO `pa_city` VALUES ('8906','8897','360428','360400','都昌县','3','','','');
INSERT INTO `pa_city` VALUES ('8907','8897','360429','360400','湖口县','3','','','');
INSERT INTO `pa_city` VALUES ('8908','8897','360430','360400','彭泽县','3','','','');
INSERT INTO `pa_city` VALUES ('8909','8897','360481','360400','瑞昌市','3','','','');
INSERT INTO `pa_city` VALUES ('8910','8897','360482','360400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8911','8869','360500','360000','新余市','2','','','');
INSERT INTO `pa_city` VALUES ('8912','8911','360502','360500','渝水区','3','','','');
INSERT INTO `pa_city` VALUES ('8913','8911','360521','360500','分宜县','3','','','');
INSERT INTO `pa_city` VALUES ('8914','8911','360522','360500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8915','8869','360600','360000','鹰潭市','2','','','');
INSERT INTO `pa_city` VALUES ('8916','8915','360602','360600','月湖区','3','','','');
INSERT INTO `pa_city` VALUES ('8917','8915','360622','360600','余江县','3','','','');
INSERT INTO `pa_city` VALUES ('8918','8915','360681','360600','贵溪市','3','','','');
INSERT INTO `pa_city` VALUES ('8919','8915','360682','360600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8920','8869','360700','360000','赣州市','2','','','');
INSERT INTO `pa_city` VALUES ('8921','8920','360702','360700','章贡区','3','','','');
INSERT INTO `pa_city` VALUES ('8922','8920','360721','360700','赣县','3','','','');
INSERT INTO `pa_city` VALUES ('8923','8920','360722','360700','信丰县','3','','','');
INSERT INTO `pa_city` VALUES ('8924','8920','360723','360700','大余县','3','','','');
INSERT INTO `pa_city` VALUES ('8925','8920','360724','360700','上犹县','3','','','');
INSERT INTO `pa_city` VALUES ('8926','8920','360725','360700','崇义县','3','','','');
INSERT INTO `pa_city` VALUES ('8927','8920','360726','360700','安远县','3','','','');
INSERT INTO `pa_city` VALUES ('8928','8920','360727','360700','龙南县','3','','','');
INSERT INTO `pa_city` VALUES ('8929','8920','360728','360700','定南县','3','','','');
INSERT INTO `pa_city` VALUES ('8930','8920','360729','360700','全南县','3','','','');
INSERT INTO `pa_city` VALUES ('8931','8920','360730','360700','宁都县','3','','','');
INSERT INTO `pa_city` VALUES ('8932','8920','360731','360700','于都县','3','','','');
INSERT INTO `pa_city` VALUES ('8933','8920','360732','360700','兴国县','3','','','');
INSERT INTO `pa_city` VALUES ('8934','8920','360733','360700','会昌县','3','','','');
INSERT INTO `pa_city` VALUES ('8935','8920','360734','360700','寻乌县','3','','','');
INSERT INTO `pa_city` VALUES ('8936','8920','360735','360700','石城县','3','','','');
INSERT INTO `pa_city` VALUES ('8937','8920','360751','360700','黄金区','3','','','');
INSERT INTO `pa_city` VALUES ('8938','8920','360781','360700','瑞金市','3','','','');
INSERT INTO `pa_city` VALUES ('8939','8920','360782','360700','南康市','3','','','');
INSERT INTO `pa_city` VALUES ('8940','8920','360783','360700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8941','8869','360800','360000','吉安市','2','','','');
INSERT INTO `pa_city` VALUES ('8942','8941','360802','360800','吉州区','3','','','');
INSERT INTO `pa_city` VALUES ('8943','8941','360803','360800','青原区','3','','','');
INSERT INTO `pa_city` VALUES ('8944','8941','360821','360800','吉安县','3','','','');
INSERT INTO `pa_city` VALUES ('8945','8941','360822','360800','吉水县','3','','','');
INSERT INTO `pa_city` VALUES ('8946','8941','360823','360800','峡江县','3','','','');
INSERT INTO `pa_city` VALUES ('8947','8941','360824','360800','新干县','3','','','');
INSERT INTO `pa_city` VALUES ('8948','8941','360825','360800','永丰县','3','','','');
INSERT INTO `pa_city` VALUES ('8949','8941','360826','360800','泰和县','3','','','');
INSERT INTO `pa_city` VALUES ('8950','8941','360827','360800','遂川县','3','','','');
INSERT INTO `pa_city` VALUES ('8951','8941','360828','360800','万安县','3','','','');
INSERT INTO `pa_city` VALUES ('8952','8941','360829','360800','安福县','3','','','');
INSERT INTO `pa_city` VALUES ('8953','8941','360830','360800','永新县','3','','','');
INSERT INTO `pa_city` VALUES ('8954','8941','360881','360800','井冈山市','3','','','');
INSERT INTO `pa_city` VALUES ('8955','8941','360882','360800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8956','8869','360900','360000','宜春市','2','','','');
INSERT INTO `pa_city` VALUES ('8957','8956','360902','360900','袁州区','3','','','');
INSERT INTO `pa_city` VALUES ('8958','8956','360921','360900','奉新县','3','','','');
INSERT INTO `pa_city` VALUES ('8959','8956','360922','360900','万载县','3','','','');
INSERT INTO `pa_city` VALUES ('8960','8956','360923','360900','上高县','3','','','');
INSERT INTO `pa_city` VALUES ('8961','8956','360924','360900','宜丰县','3','','','');
INSERT INTO `pa_city` VALUES ('8962','8956','360925','360900','靖安县','3','','','');
INSERT INTO `pa_city` VALUES ('8963','8956','360926','360900','铜鼓县','3','','','');
INSERT INTO `pa_city` VALUES ('8964','8956','360981','360900','丰城市','3','','','');
INSERT INTO `pa_city` VALUES ('8965','8956','360982','360900','樟树市','3','','','');
INSERT INTO `pa_city` VALUES ('8966','8956','360983','360900','高安市','3','','','');
INSERT INTO `pa_city` VALUES ('8967','8956','360984','360900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8968','8869','361000','360000','抚州市','2','','','');
INSERT INTO `pa_city` VALUES ('8969','8968','361002','361000','临川区','3','','','');
INSERT INTO `pa_city` VALUES ('8970','8968','361021','361000','南城县','3','','','');
INSERT INTO `pa_city` VALUES ('8971','8968','361022','361000','黎川县','3','','','');
INSERT INTO `pa_city` VALUES ('8972','8968','361023','361000','南丰县','3','','','');
INSERT INTO `pa_city` VALUES ('8973','8968','361024','361000','崇仁县','3','','','');
INSERT INTO `pa_city` VALUES ('8974','8968','361025','361000','乐安县','3','','','');
INSERT INTO `pa_city` VALUES ('8975','8968','361026','361000','宜黄县','3','','','');
INSERT INTO `pa_city` VALUES ('8976','8968','361027','361000','金溪县','3','','','');
INSERT INTO `pa_city` VALUES ('8977','8968','361028','361000','资溪县','3','','','');
INSERT INTO `pa_city` VALUES ('8978','8968','361029','361000','东乡县','3','','','');
INSERT INTO `pa_city` VALUES ('8979','8968','361030','361000','广昌县','3','','','');
INSERT INTO `pa_city` VALUES ('8980','8968','361031','361000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8981','8869','361100','360000','上饶市','2','','','');
INSERT INTO `pa_city` VALUES ('8982','8981','361102','361100','信州区','3','','','');
INSERT INTO `pa_city` VALUES ('8983','8981','361121','361100','上饶县','3','','','');
INSERT INTO `pa_city` VALUES ('8984','8981','361122','361100','广丰县','3','','','');
INSERT INTO `pa_city` VALUES ('8985','8981','361123','361100','玉山县','3','','','');
INSERT INTO `pa_city` VALUES ('8986','8981','361124','361100','铅山县','3','','','');
INSERT INTO `pa_city` VALUES ('8987','8981','361125','361100','横峰县','3','','','');
INSERT INTO `pa_city` VALUES ('8988','8981','361126','361100','弋阳县','3','','','');
INSERT INTO `pa_city` VALUES ('8989','8981','361127','361100','余干县','3','','','');
INSERT INTO `pa_city` VALUES ('8990','8981','361128','361100','鄱阳县','3','','','');
INSERT INTO `pa_city` VALUES ('8991','8981','361129','361100','万年县','3','','','');
INSERT INTO `pa_city` VALUES ('8992','8981','361130','361100','婺源县','3','','','');
INSERT INTO `pa_city` VALUES ('8993','8981','361181','361100','德兴市','3','','','');
INSERT INTO `pa_city` VALUES ('8994','8981','361182','361100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('8995','7459','370000','1','山东省','1','','','');
INSERT INTO `pa_city` VALUES ('8996','8995','370100','370000','济南市','2','','','');
INSERT INTO `pa_city` VALUES ('8997','8996','370102','370100','历下区','3','','','');
INSERT INTO `pa_city` VALUES ('8998','8996','370103','370100','市中区','3','','','');
INSERT INTO `pa_city` VALUES ('8999','8996','370104','370100','槐荫区','3','','','');
INSERT INTO `pa_city` VALUES ('9000','8996','370105','370100','天桥区','3','','','');
INSERT INTO `pa_city` VALUES ('9001','8996','370112','370100','历城区','3','','','');
INSERT INTO `pa_city` VALUES ('9002','8996','370113','370100','长清区','3','','','');
INSERT INTO `pa_city` VALUES ('9003','8996','370124','370100','平阴县','3','','','');
INSERT INTO `pa_city` VALUES ('9004','8996','370125','370100','济阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9005','8996','370126','370100','商河县','3','','','');
INSERT INTO `pa_city` VALUES ('9006','8996','370181','370100','章丘市','3','','','');
INSERT INTO `pa_city` VALUES ('9007','8996','370182','370100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9008','8995','370200','370000','青岛市','2','','','');
INSERT INTO `pa_city` VALUES ('9009','9008','370202','370200','市南区','3','','','');
INSERT INTO `pa_city` VALUES ('9010','9008','370203','370200','市北区','3','','','');
INSERT INTO `pa_city` VALUES ('9011','9008','370205','370200','四方区','3','','','');
INSERT INTO `pa_city` VALUES ('9012','9008','370211','370200','黄岛区','3','','','');
INSERT INTO `pa_city` VALUES ('9013','9008','370212','370200','崂山区','3','','','');
INSERT INTO `pa_city` VALUES ('9014','9008','370213','370200','李沧区','3','','','');
INSERT INTO `pa_city` VALUES ('9015','9008','370214','370200','城阳区','3','','','');
INSERT INTO `pa_city` VALUES ('9016','9008','370251','370200','开发区','3','','','');
INSERT INTO `pa_city` VALUES ('9017','9008','370281','370200','胶州市','3','','','');
INSERT INTO `pa_city` VALUES ('9018','9008','370282','370200','即墨市','3','','','');
INSERT INTO `pa_city` VALUES ('9019','9008','370283','370200','平度市','3','','','');
INSERT INTO `pa_city` VALUES ('9020','9008','370284','370200','胶南市','3','','','');
INSERT INTO `pa_city` VALUES ('9021','9008','370285','370200','莱西市','3','','','');
INSERT INTO `pa_city` VALUES ('9022','9008','370286','370200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9023','8995','370300','370000','淄博市','2','','','');
INSERT INTO `pa_city` VALUES ('9024','9023','370302','370300','淄川区','3','','','');
INSERT INTO `pa_city` VALUES ('9025','9023','370303','370300','张店区','3','','','');
INSERT INTO `pa_city` VALUES ('9026','9023','370304','370300','博山区','3','','','');
INSERT INTO `pa_city` VALUES ('9027','9023','370305','370300','临淄区','3','','','');
INSERT INTO `pa_city` VALUES ('9028','9023','370306','370300','周村区','3','','','');
INSERT INTO `pa_city` VALUES ('9029','9023','370321','370300','桓台县','3','','','');
INSERT INTO `pa_city` VALUES ('9030','9023','370322','370300','高青县','3','','','');
INSERT INTO `pa_city` VALUES ('9031','9023','370323','370300','沂源县','3','','','');
INSERT INTO `pa_city` VALUES ('9032','9023','370324','370300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9033','8995','370400','370000','枣庄市','2','','','');
INSERT INTO `pa_city` VALUES ('9034','9033','370402','370400','市中区','3','','','');
INSERT INTO `pa_city` VALUES ('9035','9033','370403','370400','薛城区','3','','','');
INSERT INTO `pa_city` VALUES ('9036','9033','370404','370400','峄城区','3','','','');
INSERT INTO `pa_city` VALUES ('9037','9033','370405','370400','台儿庄区','3','','','');
INSERT INTO `pa_city` VALUES ('9038','9033','370406','370400','山亭区','3','','','');
INSERT INTO `pa_city` VALUES ('9039','9033','370481','370400','滕州市','3','','','');
INSERT INTO `pa_city` VALUES ('9040','9033','370482','370400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9041','8995','370500','370000','东营市','2','','','');
INSERT INTO `pa_city` VALUES ('9042','9041','370502','370500','东营区','3','','','');
INSERT INTO `pa_city` VALUES ('9043','9041','370503','370500','河口区','3','','','');
INSERT INTO `pa_city` VALUES ('9044','9041','370521','370500','垦利县','3','','','');
INSERT INTO `pa_city` VALUES ('9045','9041','370522','370500','利津县','3','','','');
INSERT INTO `pa_city` VALUES ('9046','9041','370523','370500','广饶县','3','','','');
INSERT INTO `pa_city` VALUES ('9047','9041','370589','370500','西城区','3','','','');
INSERT INTO `pa_city` VALUES ('9048','9041','370590','370500','东城区','3','','','');
INSERT INTO `pa_city` VALUES ('9049','9041','370591','370500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9050','8995','370600','370000','烟台市','2','','','');
INSERT INTO `pa_city` VALUES ('9051','9050','370602','370600','芝罘区','3','','','');
INSERT INTO `pa_city` VALUES ('9052','9050','370611','370600','福山区','3','','','');
INSERT INTO `pa_city` VALUES ('9053','9050','370612','370600','牟平区','3','','','');
INSERT INTO `pa_city` VALUES ('9054','9050','370613','370600','莱山区','3','','','');
INSERT INTO `pa_city` VALUES ('9055','9050','370634','370600','长岛县','3','','','');
INSERT INTO `pa_city` VALUES ('9056','9050','370681','370600','龙口市','3','','','');
INSERT INTO `pa_city` VALUES ('9057','9050','370682','370600','莱阳市','3','','','');
INSERT INTO `pa_city` VALUES ('9058','9050','370683','370600','莱州市','3','','','');
INSERT INTO `pa_city` VALUES ('9059','9050','370684','370600','蓬莱市','3','','','');
INSERT INTO `pa_city` VALUES ('9060','9050','370685','370600','招远市','3','','','');
INSERT INTO `pa_city` VALUES ('9061','9050','370686','370600','栖霞市','3','','','');
INSERT INTO `pa_city` VALUES ('9062','9050','370687','370600','海阳市','3','','','');
INSERT INTO `pa_city` VALUES ('9063','9050','370688','370600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9064','8995','370700','370000','潍坊市','2','','','');
INSERT INTO `pa_city` VALUES ('9065','9064','370702','370700','潍城区','3','','','');
INSERT INTO `pa_city` VALUES ('9066','9064','370703','370700','寒亭区','3','','','');
INSERT INTO `pa_city` VALUES ('9067','9064','370704','370700','坊子区','3','','','');
INSERT INTO `pa_city` VALUES ('9068','9064','370705','370700','奎文区','3','','','');
INSERT INTO `pa_city` VALUES ('9069','9064','370724','370700','临朐县','3','','','');
INSERT INTO `pa_city` VALUES ('9070','9064','370725','370700','昌乐县','3','','','');
INSERT INTO `pa_city` VALUES ('9071','9064','370751','370700','开发区','3','','','');
INSERT INTO `pa_city` VALUES ('9072','9064','370781','370700','青州市','3','','','');
INSERT INTO `pa_city` VALUES ('9073','9064','370782','370700','诸城市','3','','','');
INSERT INTO `pa_city` VALUES ('9074','9064','370783','370700','寿光市','3','','','');
INSERT INTO `pa_city` VALUES ('9075','9064','370784','370700','安丘市','3','','','');
INSERT INTO `pa_city` VALUES ('9076','9064','370785','370700','高密市','3','','','');
INSERT INTO `pa_city` VALUES ('9077','9064','370786','370700','昌邑市','3','','','');
INSERT INTO `pa_city` VALUES ('9078','9064','370787','370700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9079','8995','370800','370000','济宁市','2','','','');
INSERT INTO `pa_city` VALUES ('9080','9079','370802','370800','市中区','3','','','');
INSERT INTO `pa_city` VALUES ('9081','9079','370811','370800','任城区','3','','','');
INSERT INTO `pa_city` VALUES ('9082','9079','370826','370800','微山县','3','','','');
INSERT INTO `pa_city` VALUES ('9083','9079','370827','370800','鱼台县','3','','','');
INSERT INTO `pa_city` VALUES ('9084','9079','370828','370800','金乡县','3','','','');
INSERT INTO `pa_city` VALUES ('9085','9079','370829','370800','嘉祥县','3','','','');
INSERT INTO `pa_city` VALUES ('9086','9079','370830','370800','汶上县','3','','','');
INSERT INTO `pa_city` VALUES ('9087','9079','370831','370800','泗水县','3','','','');
INSERT INTO `pa_city` VALUES ('9088','9079','370832','370800','梁山县','3','','','');
INSERT INTO `pa_city` VALUES ('9089','9079','370881','370800','曲阜市','3','','','');
INSERT INTO `pa_city` VALUES ('9090','9079','370882','370800','兖州市','3','','','');
INSERT INTO `pa_city` VALUES ('9091','9079','370883','370800','邹城市','3','','','');
INSERT INTO `pa_city` VALUES ('9092','9079','370884','370800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9093','8995','370900','370000','泰安市','2','','','');
INSERT INTO `pa_city` VALUES ('9094','9093','370902','370900','泰山区','3','','','');
INSERT INTO `pa_city` VALUES ('9095','9093','370903','370900','岱岳区','3','','','');
INSERT INTO `pa_city` VALUES ('9096','9093','370921','370900','宁阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9097','9093','370923','370900','东平县','3','','','');
INSERT INTO `pa_city` VALUES ('9098','9093','370982','370900','新泰市','3','','','');
INSERT INTO `pa_city` VALUES ('9099','9093','370983','370900','肥城市','3','','','');
INSERT INTO `pa_city` VALUES ('9100','9093','370984','370900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9101','8995','371000','370000','威海市','2','','','');
INSERT INTO `pa_city` VALUES ('9102','9101','371002','371000','环翠区','3','','','');
INSERT INTO `pa_city` VALUES ('9103','9101','371081','371000','文登市','3','','','');
INSERT INTO `pa_city` VALUES ('9104','9101','371082','371000','荣成市','3','','','');
INSERT INTO `pa_city` VALUES ('9105','9101','371083','371000','乳山市','3','','','');
INSERT INTO `pa_city` VALUES ('9106','9101','371084','371000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9107','8995','371100','370000','日照市','2','','','');
INSERT INTO `pa_city` VALUES ('9108','9107','371102','371100','东港区','3','','','');
INSERT INTO `pa_city` VALUES ('9109','9107','371103','371100','岚山区','3','','','');
INSERT INTO `pa_city` VALUES ('9110','9107','371121','371100','五莲县','3','','','');
INSERT INTO `pa_city` VALUES ('9111','9107','371122','371100','莒县','3','','','');
INSERT INTO `pa_city` VALUES ('9112','9107','371123','371100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9113','8995','371200','370000','莱芜市','2','','','');
INSERT INTO `pa_city` VALUES ('9114','9113','371202','371200','莱城区','3','','','');
INSERT INTO `pa_city` VALUES ('9115','9113','371203','371200','钢城区','3','','','');
INSERT INTO `pa_city` VALUES ('9116','9113','371204','371200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9117','8995','371300','370000','临沂市','2','','','');
INSERT INTO `pa_city` VALUES ('9118','9117','371302','371300','兰山区','3','','','');
INSERT INTO `pa_city` VALUES ('9119','9117','371311','371300','罗庄区','3','','','');
INSERT INTO `pa_city` VALUES ('9120','9117','371312','371300','河东区','3','','','');
INSERT INTO `pa_city` VALUES ('9121','9117','371321','371300','沂南县','3','','','');
INSERT INTO `pa_city` VALUES ('9122','9117','371322','371300','郯城县','3','','','');
INSERT INTO `pa_city` VALUES ('9123','9117','371323','371300','沂水县','3','','','');
INSERT INTO `pa_city` VALUES ('9124','9117','371324','371300','苍山县','3','','','');
INSERT INTO `pa_city` VALUES ('9125','9117','371325','371300','费县','3','','','');
INSERT INTO `pa_city` VALUES ('9126','9117','371326','371300','平邑县','3','','','');
INSERT INTO `pa_city` VALUES ('9127','9117','371327','371300','莒南县','3','','','');
INSERT INTO `pa_city` VALUES ('9128','9117','371328','371300','蒙阴县','3','','','');
INSERT INTO `pa_city` VALUES ('9129','9117','371329','371300','临沭县','3','','','');
INSERT INTO `pa_city` VALUES ('9130','9117','371330','371300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9131','8995','371400','370000','德州市','2','','','');
INSERT INTO `pa_city` VALUES ('9132','9131','371402','371400','德城区','3','','','');
INSERT INTO `pa_city` VALUES ('9133','9131','371421','371400','陵县','3','','','');
INSERT INTO `pa_city` VALUES ('9134','9131','371422','371400','宁津县','3','','','');
INSERT INTO `pa_city` VALUES ('9135','9131','371423','371400','庆云县','3','','','');
INSERT INTO `pa_city` VALUES ('9136','9131','371424','371400','临邑县','3','','','');
INSERT INTO `pa_city` VALUES ('9137','9131','371425','371400','齐河县','3','','','');
INSERT INTO `pa_city` VALUES ('9138','9131','371426','371400','平原县','3','','','');
INSERT INTO `pa_city` VALUES ('9139','9131','371427','371400','夏津县','3','','','');
INSERT INTO `pa_city` VALUES ('9140','9131','371428','371400','武城县','3','','','');
INSERT INTO `pa_city` VALUES ('9141','9131','371451','371400','开发区','3','','','');
INSERT INTO `pa_city` VALUES ('9142','9131','371481','371400','乐陵市','3','','','');
INSERT INTO `pa_city` VALUES ('9143','9131','371482','371400','禹城市','3','','','');
INSERT INTO `pa_city` VALUES ('9144','9131','371483','371400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9145','8995','371500','370000','聊城市','2','','','');
INSERT INTO `pa_city` VALUES ('9146','9145','371502','371500','东昌府区','3','','','');
INSERT INTO `pa_city` VALUES ('9147','9145','371521','371500','阳谷县','3','','','');
INSERT INTO `pa_city` VALUES ('9148','9145','371522','371500','莘县','3','','','');
INSERT INTO `pa_city` VALUES ('9149','9145','371523','371500','茌平县','3','','','');
INSERT INTO `pa_city` VALUES ('9150','9145','371524','371500','东阿县','3','','','');
INSERT INTO `pa_city` VALUES ('9151','9145','371525','371500','冠县','3','','','');
INSERT INTO `pa_city` VALUES ('9152','9145','371526','371500','高唐县','3','','','');
INSERT INTO `pa_city` VALUES ('9153','9145','371581','371500','临清市','3','','','');
INSERT INTO `pa_city` VALUES ('9154','9145','371582','371500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9155','8995','371600','370000','滨州市','2','','','');
INSERT INTO `pa_city` VALUES ('9156','9155','371602','371600','滨城区','3','','','');
INSERT INTO `pa_city` VALUES ('9157','9155','371621','371600','惠民县','3','','','');
INSERT INTO `pa_city` VALUES ('9158','9155','371622','371600','阳信县','3','','','');
INSERT INTO `pa_city` VALUES ('9159','9155','371623','371600','无棣县','3','','','');
INSERT INTO `pa_city` VALUES ('9160','9155','371624','371600','沾化县','3','','','');
INSERT INTO `pa_city` VALUES ('9161','9155','371625','371600','博兴县','3','','','');
INSERT INTO `pa_city` VALUES ('9162','9155','371626','371600','邹平县','3','','','');
INSERT INTO `pa_city` VALUES ('9163','9155','371627','371600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9164','8995','371700','370000','菏泽市','2','','','');
INSERT INTO `pa_city` VALUES ('9165','9164','371702','371700','牡丹区','3','','','');
INSERT INTO `pa_city` VALUES ('9166','9164','371721','371700','曹县','3','','','');
INSERT INTO `pa_city` VALUES ('9167','9164','371722','371700','单县','3','','','');
INSERT INTO `pa_city` VALUES ('9168','9164','371723','371700','成武县','3','','','');
INSERT INTO `pa_city` VALUES ('9169','9164','371724','371700','巨野县','3','','','');
INSERT INTO `pa_city` VALUES ('9170','9164','371725','371700','郓城县','3','','','');
INSERT INTO `pa_city` VALUES ('9171','9164','371726','371700','鄄城县','3','','','');
INSERT INTO `pa_city` VALUES ('9172','9164','371727','371700','定陶县','3','','','');
INSERT INTO `pa_city` VALUES ('9173','9164','371728','371700','东明县','3','','','');
INSERT INTO `pa_city` VALUES ('9174','9164','371729','371700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9175','7459','410000','1','河南省','1','','','');
INSERT INTO `pa_city` VALUES ('9176','9175','410100','410000','郑州市','2','','','');
INSERT INTO `pa_city` VALUES ('9177','9176','410102','410100','中原区','3','','','');
INSERT INTO `pa_city` VALUES ('9178','9176','410103','410100','二七区','3','','','');
INSERT INTO `pa_city` VALUES ('9179','9176','410104','410100','管城回族区','3','','','');
INSERT INTO `pa_city` VALUES ('9180','9176','410105','410100','金水区','3','','','');
INSERT INTO `pa_city` VALUES ('9181','9176','410106','410100','上街区','3','','','');
INSERT INTO `pa_city` VALUES ('9182','9176','410108','410100','惠济区','3','','','');
INSERT INTO `pa_city` VALUES ('9183','9176','410122','410100','中牟县','3','','','');
INSERT INTO `pa_city` VALUES ('9184','9176','410181','410100','巩义市','3','','','');
INSERT INTO `pa_city` VALUES ('9185','9176','410182','410100','荥阳市','3','','','');
INSERT INTO `pa_city` VALUES ('9186','9176','410183','410100','新密市','3','','','');
INSERT INTO `pa_city` VALUES ('9187','9176','410184','410100','新郑市','3','','','');
INSERT INTO `pa_city` VALUES ('9188','9176','410185','410100','登封市','3','','','');
INSERT INTO `pa_city` VALUES ('9189','9176','410186','410100','郑东新区','3','','','');
INSERT INTO `pa_city` VALUES ('9190','9176','410187','410100','高新区','3','','','');
INSERT INTO `pa_city` VALUES ('9191','9176','410188','410100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9192','9175','410200','410000','开封市','2','','','');
INSERT INTO `pa_city` VALUES ('9193','9192','410202','410200','龙亭区','3','','','');
INSERT INTO `pa_city` VALUES ('9194','9192','410203','410200','顺河回族区','3','','','');
INSERT INTO `pa_city` VALUES ('9195','9192','410204','410200','鼓楼区','3','','','');
INSERT INTO `pa_city` VALUES ('9196','9192','410205','410200','禹王台区','3','','','');
INSERT INTO `pa_city` VALUES ('9197','9192','410211','410200','金明区','3','','','');
INSERT INTO `pa_city` VALUES ('9198','9192','410221','410200','杞县','3','','','');
INSERT INTO `pa_city` VALUES ('9199','9192','410222','410200','通许县','3','','','');
INSERT INTO `pa_city` VALUES ('9200','9192','410223','410200','尉氏县','3','','','');
INSERT INTO `pa_city` VALUES ('9201','9192','410224','410200','开封县','3','','','');
INSERT INTO `pa_city` VALUES ('9202','9192','410225','410200','兰考县','3','','','');
INSERT INTO `pa_city` VALUES ('9203','9192','410226','410200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9204','9175','410300','410000','洛阳市','2','','','');
INSERT INTO `pa_city` VALUES ('9205','9204','410302','410300','老城区','3','','','');
INSERT INTO `pa_city` VALUES ('9206','9204','410303','410300','西工区','3','','','');
INSERT INTO `pa_city` VALUES ('9207','9204','410304','410300','廛河回族区','3','','','');
INSERT INTO `pa_city` VALUES ('9208','9204','410305','410300','涧西区','3','','','');
INSERT INTO `pa_city` VALUES ('9209','9204','410306','410300','吉利区','3','','','');
INSERT INTO `pa_city` VALUES ('9210','9204','410307','410300','洛龙区','3','','','');
INSERT INTO `pa_city` VALUES ('9211','9204','410322','410300','孟津县','3','','','');
INSERT INTO `pa_city` VALUES ('9212','9204','410323','410300','新安县','3','','','');
INSERT INTO `pa_city` VALUES ('9213','9204','410324','410300','栾川县','3','','','');
INSERT INTO `pa_city` VALUES ('9214','9204','410325','410300','嵩县','3','','','');
INSERT INTO `pa_city` VALUES ('9215','9204','410326','410300','汝阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9216','9204','410327','410300','宜阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9217','9204','410328','410300','洛宁县','3','','','');
INSERT INTO `pa_city` VALUES ('9218','9204','410329','410300','伊川县','3','','','');
INSERT INTO `pa_city` VALUES ('9219','9204','410381','410300','偃师市','3','','','');
INSERT INTO `pa_city` VALUES ('9220','9175','410400','410000','平顶山市','2','','','');
INSERT INTO `pa_city` VALUES ('9221','9220','410402','410400','新华区','3','','','');
INSERT INTO `pa_city` VALUES ('9222','9220','410403','410400','卫东区','3','','','');
INSERT INTO `pa_city` VALUES ('9223','9220','410404','410400','石龙区','3','','','');
INSERT INTO `pa_city` VALUES ('9224','9220','410411','410400','湛河区','3','','','');
INSERT INTO `pa_city` VALUES ('9225','9220','410421','410400','宝丰县','3','','','');
INSERT INTO `pa_city` VALUES ('9226','9220','410422','410400','叶县','3','','','');
INSERT INTO `pa_city` VALUES ('9227','9220','410423','410400','鲁山县','3','','','');
INSERT INTO `pa_city` VALUES ('9228','9220','410425','410400','郏县','3','','','');
INSERT INTO `pa_city` VALUES ('9229','9220','410481','410400','舞钢市','3','','','');
INSERT INTO `pa_city` VALUES ('9230','9220','410482','410400','汝州市','3','','','');
INSERT INTO `pa_city` VALUES ('9231','9220','410483','410400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9232','9175','410500','410000','安阳市','2','','','');
INSERT INTO `pa_city` VALUES ('9233','9232','410502','410500','文峰区','3','','','');
INSERT INTO `pa_city` VALUES ('9234','9232','410503','410500','北关区','3','','','');
INSERT INTO `pa_city` VALUES ('9235','9232','410505','410500','殷都区','3','','','');
INSERT INTO `pa_city` VALUES ('9236','9232','410506','410500','龙安区','3','','','');
INSERT INTO `pa_city` VALUES ('9237','9232','410522','410500','安阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9238','9232','410523','410500','汤阴县','3','','','');
INSERT INTO `pa_city` VALUES ('9239','9232','410526','410500','滑县','3','','','');
INSERT INTO `pa_city` VALUES ('9240','9232','410527','410500','内黄县','3','','','');
INSERT INTO `pa_city` VALUES ('9241','9232','410581','410500','林州市','3','','','');
INSERT INTO `pa_city` VALUES ('9242','9232','410582','410500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9243','9175','410600','410000','鹤壁市','2','','','');
INSERT INTO `pa_city` VALUES ('9244','9243','410602','410600','鹤山区','3','','','');
INSERT INTO `pa_city` VALUES ('9245','9243','410603','410600','山城区','3','','','');
INSERT INTO `pa_city` VALUES ('9246','9243','410611','410600','淇滨区','3','','','');
INSERT INTO `pa_city` VALUES ('9247','9243','410621','410600','浚县','3','','','');
INSERT INTO `pa_city` VALUES ('9248','9243','410622','410600','淇县','3','','','');
INSERT INTO `pa_city` VALUES ('9249','9243','410623','410600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9250','9175','410700','410000','新乡市','2','','','');
INSERT INTO `pa_city` VALUES ('9251','9250','410702','410700','红旗区','3','','','');
INSERT INTO `pa_city` VALUES ('9252','9250','410703','410700','卫滨区','3','','','');
INSERT INTO `pa_city` VALUES ('9253','9250','410704','410700','凤泉区','3','','','');
INSERT INTO `pa_city` VALUES ('9254','9250','410711','410700','牧野区','3','','','');
INSERT INTO `pa_city` VALUES ('9255','9250','410721','410700','新乡县','3','','','');
INSERT INTO `pa_city` VALUES ('9256','9250','410724','410700','获嘉县','3','','','');
INSERT INTO `pa_city` VALUES ('9257','9250','410725','410700','原阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9258','9250','410726','410700','延津县','3','','','');
INSERT INTO `pa_city` VALUES ('9259','9250','410727','410700','封丘县','3','','','');
INSERT INTO `pa_city` VALUES ('9260','9250','410728','410700','长垣县','3','','','');
INSERT INTO `pa_city` VALUES ('9261','9250','410781','410700','卫辉市','3','','','');
INSERT INTO `pa_city` VALUES ('9262','9250','410782','410700','辉县市','3','','','');
INSERT INTO `pa_city` VALUES ('9263','9250','410783','410700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9264','9175','410800','410000','焦作市','2','','','');
INSERT INTO `pa_city` VALUES ('9265','9264','410802','410800','解放区','3','','','');
INSERT INTO `pa_city` VALUES ('9266','9264','410803','410800','中站区','3','','','');
INSERT INTO `pa_city` VALUES ('9267','9264','410804','410800','马村区','3','','','');
INSERT INTO `pa_city` VALUES ('9268','9264','410811','410800','山阳区','3','','','');
INSERT INTO `pa_city` VALUES ('9269','9264','410821','410800','修武县','3','','','');
INSERT INTO `pa_city` VALUES ('9270','9264','410822','410800','博爱县','3','','','');
INSERT INTO `pa_city` VALUES ('9271','9264','410823','410800','武陟县','3','','','');
INSERT INTO `pa_city` VALUES ('9272','9264','410825','410800','温县','3','','','');
INSERT INTO `pa_city` VALUES ('9273','9175','410881','410000','济源市','2','','','');
INSERT INTO `pa_city` VALUES ('9274','9264','410882','410800','沁阳市','3','','','');
INSERT INTO `pa_city` VALUES ('9275','9264','410883','410800','孟州市','3','','','');
INSERT INTO `pa_city` VALUES ('9276','9264','410884','410800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9277','9175','410900','410000','濮阳市','2','','','');
INSERT INTO `pa_city` VALUES ('9278','9277','410902','410900','华龙区','3','','','');
INSERT INTO `pa_city` VALUES ('9279','9277','410922','410900','清丰县','3','','','');
INSERT INTO `pa_city` VALUES ('9280','9277','410923','410900','南乐县','3','','','');
INSERT INTO `pa_city` VALUES ('9281','9277','410926','410900','范县','3','','','');
INSERT INTO `pa_city` VALUES ('9282','9277','410927','410900','台前县','3','','','');
INSERT INTO `pa_city` VALUES ('9283','9277','410928','410900','濮阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9284','9277','410929','410900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9285','9175','411000','410000','许昌市','2','','','');
INSERT INTO `pa_city` VALUES ('9286','9285','411002','411000','魏都区','3','','','');
INSERT INTO `pa_city` VALUES ('9287','9285','411023','411000','许昌县','3','','','');
INSERT INTO `pa_city` VALUES ('9288','9285','411024','411000','鄢陵县','3','','','');
INSERT INTO `pa_city` VALUES ('9289','9285','411025','411000','襄城县','3','','','');
INSERT INTO `pa_city` VALUES ('9290','9285','411081','411000','禹州市','3','','','');
INSERT INTO `pa_city` VALUES ('9291','9285','411082','411000','长葛市','3','','','');
INSERT INTO `pa_city` VALUES ('9292','9285','411083','411000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9293','9175','411100','410000','漯河市','2','','','');
INSERT INTO `pa_city` VALUES ('9294','9293','411102','411100','源汇区','3','','','');
INSERT INTO `pa_city` VALUES ('9295','9293','411103','411100','郾城区','3','','','');
INSERT INTO `pa_city` VALUES ('9296','9293','411104','411100','召陵区','3','','','');
INSERT INTO `pa_city` VALUES ('9297','9293','411121','411100','舞阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9298','9293','411122','411100','临颍县','3','','','');
INSERT INTO `pa_city` VALUES ('9299','9293','411123','411100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9300','9175','411200','410000','三门峡市','2','','','');
INSERT INTO `pa_city` VALUES ('9301','9300','411202','411200','湖滨区','3','','','');
INSERT INTO `pa_city` VALUES ('9302','9300','411221','411200','渑池县','3','','','');
INSERT INTO `pa_city` VALUES ('9303','9300','411222','411200','陕县','3','','','');
INSERT INTO `pa_city` VALUES ('9304','9300','411224','411200','卢氏县','3','','','');
INSERT INTO `pa_city` VALUES ('9305','9300','411281','411200','义马市','3','','','');
INSERT INTO `pa_city` VALUES ('9306','9300','411282','411200','灵宝市','3','','','');
INSERT INTO `pa_city` VALUES ('9307','9300','411283','411200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9308','9175','411300','410000','南阳市','2','','','');
INSERT INTO `pa_city` VALUES ('9309','9308','411302','411300','宛城区','3','','','');
INSERT INTO `pa_city` VALUES ('9310','9308','411303','411300','卧龙区','3','','','');
INSERT INTO `pa_city` VALUES ('9311','9308','411321','411300','南召县','3','','','');
INSERT INTO `pa_city` VALUES ('9312','9308','411322','411300','方城县','3','','','');
INSERT INTO `pa_city` VALUES ('9313','9308','411323','411300','西峡县','3','','','');
INSERT INTO `pa_city` VALUES ('9314','9308','411324','411300','镇平县','3','','','');
INSERT INTO `pa_city` VALUES ('9315','9308','411325','411300','内乡县','3','','','');
INSERT INTO `pa_city` VALUES ('9316','9308','411326','411300','淅川县','3','','','');
INSERT INTO `pa_city` VALUES ('9317','9308','411327','411300','社旗县','3','','','');
INSERT INTO `pa_city` VALUES ('9318','9308','411328','411300','唐河县','3','','','');
INSERT INTO `pa_city` VALUES ('9319','9308','411329','411300','新野县','3','','','');
INSERT INTO `pa_city` VALUES ('9320','9308','411330','411300','桐柏县','3','','','');
INSERT INTO `pa_city` VALUES ('9321','9308','411381','411300','邓州市','3','','','');
INSERT INTO `pa_city` VALUES ('9322','9308','411382','411300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9323','9175','411400','410000','商丘市','2','','','');
INSERT INTO `pa_city` VALUES ('9324','9323','411402','411400','梁园区','3','','','');
INSERT INTO `pa_city` VALUES ('9325','9323','411403','411400','睢阳区','3','','','');
INSERT INTO `pa_city` VALUES ('9326','9323','411421','411400','民权县','3','','','');
INSERT INTO `pa_city` VALUES ('9327','9323','411422','411400','睢县','3','','','');
INSERT INTO `pa_city` VALUES ('9328','9323','411423','411400','宁陵县','3','','','');
INSERT INTO `pa_city` VALUES ('9329','9323','411424','411400','柘城县','3','','','');
INSERT INTO `pa_city` VALUES ('9330','9323','411425','411400','虞城县','3','','','');
INSERT INTO `pa_city` VALUES ('9331','9323','411426','411400','夏邑县','3','','','');
INSERT INTO `pa_city` VALUES ('9332','9323','411481','411400','永城市','3','','','');
INSERT INTO `pa_city` VALUES ('9333','9323','411482','411400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9334','9175','411500','410000','信阳市','2','','','');
INSERT INTO `pa_city` VALUES ('9335','9334','411502','411500','浉河区','3','','','');
INSERT INTO `pa_city` VALUES ('9336','9334','411503','411500','平桥区','3','','','');
INSERT INTO `pa_city` VALUES ('9337','9334','411521','411500','罗山县','3','','','');
INSERT INTO `pa_city` VALUES ('9338','9334','411522','411500','光山县','3','','','');
INSERT INTO `pa_city` VALUES ('9339','9334','411523','411500','新县','3','','','');
INSERT INTO `pa_city` VALUES ('9340','9334','411524','411500','商城县','3','','','');
INSERT INTO `pa_city` VALUES ('9341','9334','411525','411500','固始县','3','','','');
INSERT INTO `pa_city` VALUES ('9342','9334','411526','411500','潢川县','3','','','');
INSERT INTO `pa_city` VALUES ('9343','9334','411527','411500','淮滨县','3','','','');
INSERT INTO `pa_city` VALUES ('9344','9334','411528','411500','息县','3','','','');
INSERT INTO `pa_city` VALUES ('9345','9334','411529','411500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9346','9175','411600','410000','周口市','2','','','');
INSERT INTO `pa_city` VALUES ('9347','9346','411602','411600','川汇区','3','','','');
INSERT INTO `pa_city` VALUES ('9348','9346','411621','411600','扶沟县','3','','','');
INSERT INTO `pa_city` VALUES ('9349','9346','411622','411600','西华县','3','','','');
INSERT INTO `pa_city` VALUES ('9350','9346','411623','411600','商水县','3','','','');
INSERT INTO `pa_city` VALUES ('9351','9346','411624','411600','沈丘县','3','','','');
INSERT INTO `pa_city` VALUES ('9352','9346','411625','411600','郸城县','3','','','');
INSERT INTO `pa_city` VALUES ('9353','9346','411626','411600','淮阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9354','9346','411627','411600','太康县','3','','','');
INSERT INTO `pa_city` VALUES ('9355','9346','411628','411600','鹿邑县','3','','','');
INSERT INTO `pa_city` VALUES ('9356','9346','411681','411600','项城市','3','','','');
INSERT INTO `pa_city` VALUES ('9357','9346','411682','411600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9358','9175','411700','410000','驻马店市','2','','','');
INSERT INTO `pa_city` VALUES ('9359','9358','411702','411700','驿城区','3','','','');
INSERT INTO `pa_city` VALUES ('9360','9358','411721','411700','西平县','3','','','');
INSERT INTO `pa_city` VALUES ('9361','9358','411722','411700','上蔡县','3','','','');
INSERT INTO `pa_city` VALUES ('9362','9358','411723','411700','平舆县','3','','','');
INSERT INTO `pa_city` VALUES ('9363','9358','411724','411700','正阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9364','9358','411725','411700','确山县','3','','','');
INSERT INTO `pa_city` VALUES ('9365','9358','411726','411700','泌阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9366','9358','411727','411700','汝南县','3','','','');
INSERT INTO `pa_city` VALUES ('9367','9358','411728','411700','遂平县','3','','','');
INSERT INTO `pa_city` VALUES ('9368','9358','411729','411700','新蔡县','3','','','');
INSERT INTO `pa_city` VALUES ('9369','9358','411730','411700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9370','7459','420000','1','湖北省','1','','','');
INSERT INTO `pa_city` VALUES ('9371','9370','420100','420000','武汉市','2','','','');
INSERT INTO `pa_city` VALUES ('9372','9371','420102','420100','江岸区','3','','','');
INSERT INTO `pa_city` VALUES ('9373','9371','420103','420100','江汉区','3','','','');
INSERT INTO `pa_city` VALUES ('9374','9371','420104','420100','硚口区','3','','','');
INSERT INTO `pa_city` VALUES ('9375','9371','420105','420100','汉阳区','3','','','');
INSERT INTO `pa_city` VALUES ('9376','9371','420106','420100','武昌区','3','','','');
INSERT INTO `pa_city` VALUES ('9377','9371','420107','420100','青山区','3','','','');
INSERT INTO `pa_city` VALUES ('9378','9371','420111','420100','洪山区','3','','','');
INSERT INTO `pa_city` VALUES ('9379','9371','420112','420100','东西湖区','3','','','');
INSERT INTO `pa_city` VALUES ('9380','9371','420113','420100','汉南区','3','','','');
INSERT INTO `pa_city` VALUES ('9381','9371','420114','420100','蔡甸区','3','','','');
INSERT INTO `pa_city` VALUES ('9382','9371','420115','420100','江夏区','3','','','');
INSERT INTO `pa_city` VALUES ('9383','9371','420116','420100','黄陂区','3','','','');
INSERT INTO `pa_city` VALUES ('9384','9371','420117','420100','新洲区','3','','','');
INSERT INTO `pa_city` VALUES ('9385','9371','420118','420100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9386','9370','420200','420000','黄石市','2','','','');
INSERT INTO `pa_city` VALUES ('9387','9386','420202','420200','黄石港区','3','','','');
INSERT INTO `pa_city` VALUES ('9388','9386','420203','420200','西塞山区','3','','','');
INSERT INTO `pa_city` VALUES ('9389','9386','420204','420200','下陆区','3','','','');
INSERT INTO `pa_city` VALUES ('9390','9386','420205','420200','铁山区','3','','','');
INSERT INTO `pa_city` VALUES ('9391','9386','420222','420200','阳新县','3','','','');
INSERT INTO `pa_city` VALUES ('9392','9386','420281','420200','大冶市','3','','','');
INSERT INTO `pa_city` VALUES ('9393','9386','420282','420200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9394','9370','420300','420000','十堰市','2','','','');
INSERT INTO `pa_city` VALUES ('9395','9394','420302','420300','茅箭区','3','','','');
INSERT INTO `pa_city` VALUES ('9396','9394','420303','420300','张湾区','3','','','');
INSERT INTO `pa_city` VALUES ('9397','9394','420321','420300','郧县','3','','','');
INSERT INTO `pa_city` VALUES ('9398','9394','420322','420300','郧西县','3','','','');
INSERT INTO `pa_city` VALUES ('9399','9394','420323','420300','竹山县','3','','','');
INSERT INTO `pa_city` VALUES ('9400','9394','420324','420300','竹溪县','3','','','');
INSERT INTO `pa_city` VALUES ('9401','9394','420325','420300','房县','3','','','');
INSERT INTO `pa_city` VALUES ('9402','9394','420381','420300','丹江口市','3','','','');
INSERT INTO `pa_city` VALUES ('9403','9394','420382','420300','城区','3','','','');
INSERT INTO `pa_city` VALUES ('9404','9394','420383','420300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9405','9370','420500','420000','宜昌市','2','','','');
INSERT INTO `pa_city` VALUES ('9406','9405','420502','420500','西陵区','3','','','');
INSERT INTO `pa_city` VALUES ('9407','9405','420503','420500','伍家岗区','3','','','');
INSERT INTO `pa_city` VALUES ('9408','9405','420504','420500','点军区','3','','','');
INSERT INTO `pa_city` VALUES ('9409','9405','420505','420500','猇亭区','3','','','');
INSERT INTO `pa_city` VALUES ('9410','9405','420506','420500','夷陵区','3','','','');
INSERT INTO `pa_city` VALUES ('9411','9405','420525','420500','远安县','3','','','');
INSERT INTO `pa_city` VALUES ('9412','9405','420526','420500','兴山县','3','','','');
INSERT INTO `pa_city` VALUES ('9413','9405','420527','420500','秭归县','3','','','');
INSERT INTO `pa_city` VALUES ('9414','9405','420528','420500','长阳土家族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9415','9405','420529','420500','五峰土家族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9416','9405','420551','420500','葛洲坝区','3','','','');
INSERT INTO `pa_city` VALUES ('9417','9405','420552','420500','开发区','3','','','');
INSERT INTO `pa_city` VALUES ('9418','9405','420581','420500','宜都市','3','','','');
INSERT INTO `pa_city` VALUES ('9419','9405','420582','420500','当阳市','3','','','');
INSERT INTO `pa_city` VALUES ('9420','9405','420583','420500','枝江市','3','','','');
INSERT INTO `pa_city` VALUES ('9421','9405','420584','420500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9422','9370','420600','420000','襄阳市','2','','','');
INSERT INTO `pa_city` VALUES ('9423','9422','420602','420600','襄城区','3','','','');
INSERT INTO `pa_city` VALUES ('9424','9422','420606','420600','樊城区','3','','','');
INSERT INTO `pa_city` VALUES ('9425','9422','420607','420600','襄州区','3','','','');
INSERT INTO `pa_city` VALUES ('9426','9422','420624','420600','南漳县','3','','','');
INSERT INTO `pa_city` VALUES ('9427','9422','420625','420600','谷城县','3','','','');
INSERT INTO `pa_city` VALUES ('9428','9422','420626','420600','保康县','3','','','');
INSERT INTO `pa_city` VALUES ('9429','9422','420682','420600','老河口市','3','','','');
INSERT INTO `pa_city` VALUES ('9430','9422','420683','420600','枣阳市','3','','','');
INSERT INTO `pa_city` VALUES ('9431','9422','420684','420600','宜城市','3','','','');
INSERT INTO `pa_city` VALUES ('9432','9422','420685','420600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9433','9370','420700','420000','鄂州市','2','','','');
INSERT INTO `pa_city` VALUES ('9434','9433','420702','420700','梁子湖区','3','','','');
INSERT INTO `pa_city` VALUES ('9435','9433','420703','420700','华容区','3','','','');
INSERT INTO `pa_city` VALUES ('9436','9433','420704','420700','鄂城区','3','','','');
INSERT INTO `pa_city` VALUES ('9437','9433','420705','420700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9438','9370','420800','420000','荆门市','2','','','');
INSERT INTO `pa_city` VALUES ('9439','9438','420802','420800','东宝区','3','','','');
INSERT INTO `pa_city` VALUES ('9440','9438','420804','420800','掇刀区','3','','','');
INSERT INTO `pa_city` VALUES ('9441','9438','420821','420800','京山县','3','','','');
INSERT INTO `pa_city` VALUES ('9442','9438','420822','420800','沙洋县','3','','','');
INSERT INTO `pa_city` VALUES ('9443','9438','420881','420800','钟祥市','3','','','');
INSERT INTO `pa_city` VALUES ('9444','9438','420882','420800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9445','9370','420900','420000','孝感市','2','','','');
INSERT INTO `pa_city` VALUES ('9446','9445','420902','420900','孝南区','3','','','');
INSERT INTO `pa_city` VALUES ('9447','9445','420921','420900','孝昌县','3','','','');
INSERT INTO `pa_city` VALUES ('9448','9445','420922','420900','大悟县','3','','','');
INSERT INTO `pa_city` VALUES ('9449','9445','420923','420900','云梦县','3','','','');
INSERT INTO `pa_city` VALUES ('9450','9445','420981','420900','应城市','3','','','');
INSERT INTO `pa_city` VALUES ('9451','9445','420982','420900','安陆市','3','','','');
INSERT INTO `pa_city` VALUES ('9452','9445','420984','420900','汉川市','3','','','');
INSERT INTO `pa_city` VALUES ('9453','9445','420985','420900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9454','9370','421000','420000','荆州市','2','','','');
INSERT INTO `pa_city` VALUES ('9455','9454','421002','421000','沙市区','3','','','');
INSERT INTO `pa_city` VALUES ('9456','9454','421003','421000','荆州区','3','','','');
INSERT INTO `pa_city` VALUES ('9457','9454','421022','421000','公安县','3','','','');
INSERT INTO `pa_city` VALUES ('9458','9454','421023','421000','监利县','3','','','');
INSERT INTO `pa_city` VALUES ('9459','9454','421024','421000','江陵县','3','','','');
INSERT INTO `pa_city` VALUES ('9460','9454','421081','421000','石首市','3','','','');
INSERT INTO `pa_city` VALUES ('9461','9454','421083','421000','洪湖市','3','','','');
INSERT INTO `pa_city` VALUES ('9462','9454','421087','421000','松滋市','3','','','');
INSERT INTO `pa_city` VALUES ('9463','9454','421088','421000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9464','9370','421100','420000','黄冈市','2','','','');
INSERT INTO `pa_city` VALUES ('9465','9464','421102','421100','黄州区','3','','','');
INSERT INTO `pa_city` VALUES ('9466','9464','421121','421100','团风县','3','','','');
INSERT INTO `pa_city` VALUES ('9467','9464','421122','421100','红安县','3','','','');
INSERT INTO `pa_city` VALUES ('9468','9464','421123','421100','罗田县','3','','','');
INSERT INTO `pa_city` VALUES ('9469','9464','421124','421100','英山县','3','','','');
INSERT INTO `pa_city` VALUES ('9470','9464','421125','421100','浠水县','3','','','');
INSERT INTO `pa_city` VALUES ('9471','9464','421126','421100','蕲春县','3','','','');
INSERT INTO `pa_city` VALUES ('9472','9464','421127','421100','黄梅县','3','','','');
INSERT INTO `pa_city` VALUES ('9473','9464','421181','421100','麻城市','3','','','');
INSERT INTO `pa_city` VALUES ('9474','9464','421182','421100','武穴市','3','','','');
INSERT INTO `pa_city` VALUES ('9475','9464','421183','421100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9476','9370','421200','420000','咸宁市','2','','','');
INSERT INTO `pa_city` VALUES ('9477','9476','421202','421200','咸安区','3','','','');
INSERT INTO `pa_city` VALUES ('9478','9476','421221','421200','嘉鱼县','3','','','');
INSERT INTO `pa_city` VALUES ('9479','9476','421222','421200','通城县','3','','','');
INSERT INTO `pa_city` VALUES ('9480','9476','421223','421200','崇阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9481','9476','421224','421200','通山县','3','','','');
INSERT INTO `pa_city` VALUES ('9482','9476','421281','421200','赤壁市','3','','','');
INSERT INTO `pa_city` VALUES ('9483','9476','421282','421200','温泉城区','3','','','');
INSERT INTO `pa_city` VALUES ('9484','9476','421283','421200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9485','9370','421300','420000','随州市','2','','','');
INSERT INTO `pa_city` VALUES ('9486','9485','421302','421300','曾都区','3','','','');
INSERT INTO `pa_city` VALUES ('9487','9485','421321','421300','随县','3','','','');
INSERT INTO `pa_city` VALUES ('9488','9485','421381','421300','广水市','3','','','');
INSERT INTO `pa_city` VALUES ('9489','9485','421382','421300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9490','9370','422800','420000','恩施土家族苗族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('9491','9490','422801','422800','恩施市','3','','','');
INSERT INTO `pa_city` VALUES ('9492','9490','422802','422800','利川市','3','','','');
INSERT INTO `pa_city` VALUES ('9493','9490','422822','422800','建始县','3','','','');
INSERT INTO `pa_city` VALUES ('9494','9490','422823','422800','巴东县','3','','','');
INSERT INTO `pa_city` VALUES ('9495','9490','422825','422800','宣恩县','3','','','');
INSERT INTO `pa_city` VALUES ('9496','9490','422826','422800','咸丰县','3','','','');
INSERT INTO `pa_city` VALUES ('9497','9490','422827','422800','来凤县','3','','','');
INSERT INTO `pa_city` VALUES ('9498','9490','422828','422800','鹤峰县','3','','','');
INSERT INTO `pa_city` VALUES ('9499','9490','422829','422800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9500','9370','429004','420000','仙桃市','2','','','');
INSERT INTO `pa_city` VALUES ('9501','9370','429005','420000','潜江市','2','','','');
INSERT INTO `pa_city` VALUES ('9502','9370','429006','420000','天门市','2','','','');
INSERT INTO `pa_city` VALUES ('9503','9370','429021','420000','神农架林区','2','','','');
INSERT INTO `pa_city` VALUES ('9504','7459','430000','1','湖南省','1','','','');
INSERT INTO `pa_city` VALUES ('9505','9504','430100','430000','长沙市','2','','','');
INSERT INTO `pa_city` VALUES ('9506','9505','430102','430100','芙蓉区','3','','','');
INSERT INTO `pa_city` VALUES ('9507','9505','430103','430100','天心区','3','','','');
INSERT INTO `pa_city` VALUES ('9508','9505','430104','430100','岳麓区','3','','','');
INSERT INTO `pa_city` VALUES ('9509','9505','430105','430100','开福区','3','','','');
INSERT INTO `pa_city` VALUES ('9510','9505','430111','430100','雨花区','3','','','');
INSERT INTO `pa_city` VALUES ('9511','9505','430121','430100','长沙县','3','','','');
INSERT INTO `pa_city` VALUES ('9512','9505','430122','430100','望城县','3','','','');
INSERT INTO `pa_city` VALUES ('9513','9505','430124','430100','宁乡县','3','','','');
INSERT INTO `pa_city` VALUES ('9514','9505','430181','430100','浏阳市','3','','','');
INSERT INTO `pa_city` VALUES ('9515','9505','430182','430100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9516','9504','430200','430000','株洲市','2','','','');
INSERT INTO `pa_city` VALUES ('9517','9516','430202','430200','荷塘区','3','','','');
INSERT INTO `pa_city` VALUES ('9518','9516','430203','430200','芦淞区','3','','','');
INSERT INTO `pa_city` VALUES ('9519','9516','430204','430200','石峰区','3','','','');
INSERT INTO `pa_city` VALUES ('9520','9516','430211','430200','天元区','3','','','');
INSERT INTO `pa_city` VALUES ('9521','9516','430221','430200','株洲县','3','','','');
INSERT INTO `pa_city` VALUES ('9522','9516','430223','430200','攸县','3','','','');
INSERT INTO `pa_city` VALUES ('9523','9516','430224','430200','茶陵县','3','','','');
INSERT INTO `pa_city` VALUES ('9524','9516','430225','430200','炎陵县','3','','','');
INSERT INTO `pa_city` VALUES ('9525','9516','430281','430200','醴陵市','3','','','');
INSERT INTO `pa_city` VALUES ('9526','9516','430282','430200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9527','9504','430300','430000','湘潭市','2','','','');
INSERT INTO `pa_city` VALUES ('9528','9527','430302','430300','雨湖区','3','','','');
INSERT INTO `pa_city` VALUES ('9529','9527','430304','430300','岳塘区','3','','','');
INSERT INTO `pa_city` VALUES ('9530','9527','430321','430300','湘潭县','3','','','');
INSERT INTO `pa_city` VALUES ('9531','9527','430381','430300','湘乡市','3','','','');
INSERT INTO `pa_city` VALUES ('9532','9527','430382','430300','韶山市','3','','','');
INSERT INTO `pa_city` VALUES ('9533','9527','430383','430300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9534','9504','430400','430000','衡阳市','2','','','');
INSERT INTO `pa_city` VALUES ('9535','9534','430405','430400','珠晖区','3','','','');
INSERT INTO `pa_city` VALUES ('9536','9534','430406','430400','雁峰区','3','','','');
INSERT INTO `pa_city` VALUES ('9537','9534','430407','430400','石鼓区','3','','','');
INSERT INTO `pa_city` VALUES ('9538','9534','430408','430400','蒸湘区','3','','','');
INSERT INTO `pa_city` VALUES ('9539','9534','430412','430400','南岳区','3','','','');
INSERT INTO `pa_city` VALUES ('9540','9534','430421','430400','衡阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9541','9534','430422','430400','衡南县','3','','','');
INSERT INTO `pa_city` VALUES ('9542','9534','430423','430400','衡山县','3','','','');
INSERT INTO `pa_city` VALUES ('9543','9534','430424','430400','衡东县','3','','','');
INSERT INTO `pa_city` VALUES ('9544','9534','430426','430400','祁东县','3','','','');
INSERT INTO `pa_city` VALUES ('9545','9534','430481','430400','耒阳市','3','','','');
INSERT INTO `pa_city` VALUES ('9546','9534','430482','430400','常宁市','3','','','');
INSERT INTO `pa_city` VALUES ('9547','9534','430483','430400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9548','9504','430500','430000','邵阳市','2','','','');
INSERT INTO `pa_city` VALUES ('9549','9548','430502','430500','双清区','3','','','');
INSERT INTO `pa_city` VALUES ('9550','9548','430503','430500','大祥区','3','','','');
INSERT INTO `pa_city` VALUES ('9551','9548','430511','430500','北塔区','3','','','');
INSERT INTO `pa_city` VALUES ('9552','9548','430521','430500','邵东县','3','','','');
INSERT INTO `pa_city` VALUES ('9553','9548','430522','430500','新邵县','3','','','');
INSERT INTO `pa_city` VALUES ('9554','9548','430523','430500','邵阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9555','9548','430524','430500','隆回县','3','','','');
INSERT INTO `pa_city` VALUES ('9556','9548','430525','430500','洞口县','3','','','');
INSERT INTO `pa_city` VALUES ('9557','9548','430527','430500','绥宁县','3','','','');
INSERT INTO `pa_city` VALUES ('9558','9548','430528','430500','新宁县','3','','','');
INSERT INTO `pa_city` VALUES ('9559','9548','430529','430500','城步苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9560','9548','430581','430500','武冈市','3','','','');
INSERT INTO `pa_city` VALUES ('9561','9548','430582','430500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9562','9504','430600','430000','岳阳市','2','','','');
INSERT INTO `pa_city` VALUES ('9563','9562','430602','430600','岳阳楼区','3','','','');
INSERT INTO `pa_city` VALUES ('9564','9562','430603','430600','云溪区','3','','','');
INSERT INTO `pa_city` VALUES ('9565','9562','430611','430600','君山区','3','','','');
INSERT INTO `pa_city` VALUES ('9566','9562','430621','430600','岳阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9567','9562','430623','430600','华容县','3','','','');
INSERT INTO `pa_city` VALUES ('9568','9562','430624','430600','湘阴县','3','','','');
INSERT INTO `pa_city` VALUES ('9569','9562','430626','430600','平江县','3','','','');
INSERT INTO `pa_city` VALUES ('9570','9562','430681','430600','汨罗市','3','','','');
INSERT INTO `pa_city` VALUES ('9571','9562','430682','430600','临湘市','3','','','');
INSERT INTO `pa_city` VALUES ('9572','9562','430683','430600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9573','9504','430700','430000','常德市','2','','','');
INSERT INTO `pa_city` VALUES ('9574','9573','430702','430700','武陵区','3','','','');
INSERT INTO `pa_city` VALUES ('9575','9573','430703','430700','鼎城区','3','','','');
INSERT INTO `pa_city` VALUES ('9576','9573','430721','430700','安乡县','3','','','');
INSERT INTO `pa_city` VALUES ('9577','9573','430722','430700','汉寿县','3','','','');
INSERT INTO `pa_city` VALUES ('9578','9573','430723','430700','澧县','3','','','');
INSERT INTO `pa_city` VALUES ('9579','9573','430724','430700','临澧县','3','','','');
INSERT INTO `pa_city` VALUES ('9580','9573','430725','430700','桃源县','3','','','');
INSERT INTO `pa_city` VALUES ('9581','9573','430726','430700','石门县','3','','','');
INSERT INTO `pa_city` VALUES ('9582','9573','430781','430700','津市市','3','','','');
INSERT INTO `pa_city` VALUES ('9583','9573','430782','430700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9584','9504','430800','430000','张家界市','2','','','');
INSERT INTO `pa_city` VALUES ('9585','9584','430802','430800','永定区','3','','','');
INSERT INTO `pa_city` VALUES ('9586','9584','430811','430800','武陵源区','3','','','');
INSERT INTO `pa_city` VALUES ('9587','9584','430821','430800','慈利县','3','','','');
INSERT INTO `pa_city` VALUES ('9588','9584','430822','430800','桑植县','3','','','');
INSERT INTO `pa_city` VALUES ('9589','9584','430823','430800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9590','9504','430900','430000','益阳市','2','','','');
INSERT INTO `pa_city` VALUES ('9591','9590','430902','430900','资阳区','3','','','');
INSERT INTO `pa_city` VALUES ('9592','9590','430903','430900','赫山区','3','','','');
INSERT INTO `pa_city` VALUES ('9593','9590','430921','430900','南县','3','','','');
INSERT INTO `pa_city` VALUES ('9594','9590','430922','430900','桃江县','3','','','');
INSERT INTO `pa_city` VALUES ('9595','9590','430923','430900','安化县','3','','','');
INSERT INTO `pa_city` VALUES ('9596','9590','430981','430900','沅江市','3','','','');
INSERT INTO `pa_city` VALUES ('9597','9590','430982','430900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9598','9504','431000','430000','郴州市','2','','','');
INSERT INTO `pa_city` VALUES ('9599','9598','431002','431000','北湖区','3','','','');
INSERT INTO `pa_city` VALUES ('9600','9598','431003','431000','苏仙区','3','','','');
INSERT INTO `pa_city` VALUES ('9601','9598','431021','431000','桂阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9602','9598','431022','431000','宜章县','3','','','');
INSERT INTO `pa_city` VALUES ('9603','9598','431023','431000','永兴县','3','','','');
INSERT INTO `pa_city` VALUES ('9604','9598','431024','431000','嘉禾县','3','','','');
INSERT INTO `pa_city` VALUES ('9605','9598','431025','431000','临武县','3','','','');
INSERT INTO `pa_city` VALUES ('9606','9598','431026','431000','汝城县','3','','','');
INSERT INTO `pa_city` VALUES ('9607','9598','431027','431000','桂东县','3','','','');
INSERT INTO `pa_city` VALUES ('9608','9598','431028','431000','安仁县','3','','','');
INSERT INTO `pa_city` VALUES ('9609','9598','431081','431000','资兴市','3','','','');
INSERT INTO `pa_city` VALUES ('9610','9598','431082','431000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9611','9504','431100','430000','永州市','2','','','');
INSERT INTO `pa_city` VALUES ('9612','9611','431102','431100','零陵区','3','','','');
INSERT INTO `pa_city` VALUES ('9613','9611','431103','431100','冷水滩区','3','','','');
INSERT INTO `pa_city` VALUES ('9614','9611','431121','431100','祁阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9615','9611','431122','431100','东安县','3','','','');
INSERT INTO `pa_city` VALUES ('9616','9611','431123','431100','双牌县','3','','','');
INSERT INTO `pa_city` VALUES ('9617','9611','431124','431100','道县','3','','','');
INSERT INTO `pa_city` VALUES ('9618','9611','431125','431100','江永县','3','','','');
INSERT INTO `pa_city` VALUES ('9619','9611','431126','431100','宁远县','3','','','');
INSERT INTO `pa_city` VALUES ('9620','9611','431127','431100','蓝山县','3','','','');
INSERT INTO `pa_city` VALUES ('9621','9611','431128','431100','新田县','3','','','');
INSERT INTO `pa_city` VALUES ('9622','9611','431129','431100','江华瑶族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9623','9611','431130','431100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9624','9504','431200','430000','怀化市','2','','','');
INSERT INTO `pa_city` VALUES ('9625','9624','431202','431200','鹤城区','3','','','');
INSERT INTO `pa_city` VALUES ('9626','9624','431221','431200','中方县','3','','','');
INSERT INTO `pa_city` VALUES ('9627','9624','431222','431200','沅陵县','3','','','');
INSERT INTO `pa_city` VALUES ('9628','9624','431223','431200','辰溪县','3','','','');
INSERT INTO `pa_city` VALUES ('9629','9624','431224','431200','溆浦县','3','','','');
INSERT INTO `pa_city` VALUES ('9630','9624','431225','431200','会同县','3','','','');
INSERT INTO `pa_city` VALUES ('9631','9624','431226','431200','麻阳苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9632','9624','431227','431200','新晃侗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9633','9624','431228','431200','芷江侗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9634','9624','431229','431200','靖州苗族侗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9635','9624','431230','431200','通道侗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9636','9624','431281','431200','洪江市','3','','','');
INSERT INTO `pa_city` VALUES ('9637','9624','431282','431200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9638','9504','431300','430000','娄底市','2','','','');
INSERT INTO `pa_city` VALUES ('9639','9638','431302','431300','娄星区','3','','','');
INSERT INTO `pa_city` VALUES ('9640','9638','431321','431300','双峰县','3','','','');
INSERT INTO `pa_city` VALUES ('9641','9638','431322','431300','新化县','3','','','');
INSERT INTO `pa_city` VALUES ('9642','9638','431381','431300','冷水江市','3','','','');
INSERT INTO `pa_city` VALUES ('9643','9638','431382','431300','涟源市','3','','','');
INSERT INTO `pa_city` VALUES ('9644','9638','431383','431300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9645','9504','433100','430000','湘西土家族苗族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('9646','9645','433101','433100','吉首市','3','','','');
INSERT INTO `pa_city` VALUES ('9647','9645','433122','433100','泸溪县','3','','','');
INSERT INTO `pa_city` VALUES ('9648','9645','433123','433100','凤凰县','3','','','');
INSERT INTO `pa_city` VALUES ('9649','9645','433124','433100','花垣县','3','','','');
INSERT INTO `pa_city` VALUES ('9650','9645','433125','433100','保靖县','3','','','');
INSERT INTO `pa_city` VALUES ('9651','9645','433126','433100','古丈县','3','','','');
INSERT INTO `pa_city` VALUES ('9652','9645','433127','433100','永顺县','3','','','');
INSERT INTO `pa_city` VALUES ('9653','9645','433130','433100','龙山县','3','','','');
INSERT INTO `pa_city` VALUES ('9654','9645','433131','433100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9655','7459','440000','1','广东省','1','','','');
INSERT INTO `pa_city` VALUES ('9656','9655','440100','440000','广州市','2','','','');
INSERT INTO `pa_city` VALUES ('9657','9656','440103','440100','荔湾区','3','','','');
INSERT INTO `pa_city` VALUES ('9658','9656','440104','440100','越秀区','3','','','');
INSERT INTO `pa_city` VALUES ('9659','9656','440105','440100','海珠区','3','','','');
INSERT INTO `pa_city` VALUES ('9660','9656','440106','440100','天河区','3','','','');
INSERT INTO `pa_city` VALUES ('9661','9656','440111','440100','白云区','3','','','');
INSERT INTO `pa_city` VALUES ('9662','9656','440112','440100','黄埔区','3','','','');
INSERT INTO `pa_city` VALUES ('9663','9656','440113','440100','番禺区','3','','','');
INSERT INTO `pa_city` VALUES ('9664','9656','440114','440100','花都区','3','','','');
INSERT INTO `pa_city` VALUES ('9665','9656','440115','440100','南沙区','3','','','');
INSERT INTO `pa_city` VALUES ('9666','9656','440116','440100','萝岗区','3','','','');
INSERT INTO `pa_city` VALUES ('9667','9656','440183','440100','增城市','3','','','');
INSERT INTO `pa_city` VALUES ('9668','9656','440184','440100','从化市','3','','','');
INSERT INTO `pa_city` VALUES ('9669','9656','440188','440100','东山区','3','','','');
INSERT INTO `pa_city` VALUES ('9670','9656','440189','440100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9671','9655','440200','440000','韶关市','2','','','');
INSERT INTO `pa_city` VALUES ('9672','9671','440203','440200','武江区','3','','','');
INSERT INTO `pa_city` VALUES ('9673','9671','440204','440200','浈江区','3','','','');
INSERT INTO `pa_city` VALUES ('9674','9671','440205','440200','曲江区','3','','','');
INSERT INTO `pa_city` VALUES ('9675','9671','440222','440200','始兴县','3','','','');
INSERT INTO `pa_city` VALUES ('9676','9671','440224','440200','仁化县','3','','','');
INSERT INTO `pa_city` VALUES ('9677','9671','440229','440200','翁源县','3','','','');
INSERT INTO `pa_city` VALUES ('9678','9671','440232','440200','乳源瑶族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9679','9671','440233','440200','新丰县','3','','','');
INSERT INTO `pa_city` VALUES ('9680','9671','440281','440200','乐昌市','3','','','');
INSERT INTO `pa_city` VALUES ('9681','9671','440282','440200','南雄市','3','','','');
INSERT INTO `pa_city` VALUES ('9682','9671','440283','440200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9683','9655','440300','440000','深圳市','2','','','');
INSERT INTO `pa_city` VALUES ('9684','9683','440303','440300','罗湖区','3','','','');
INSERT INTO `pa_city` VALUES ('9685','9683','440304','440300','福田区','3','','','');
INSERT INTO `pa_city` VALUES ('9686','9683','440305','440300','南山区','3','','','');
INSERT INTO `pa_city` VALUES ('9687','9683','440306','440300','宝安区','3','','','');
INSERT INTO `pa_city` VALUES ('9688','9683','440307','440300','龙岗区','3','','','');
INSERT INTO `pa_city` VALUES ('9689','9683','440308','440300','盐田区','3','','','');
INSERT INTO `pa_city` VALUES ('9690','9683','440309','440300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9691','9655','440400','440000','珠海市','2','','','');
INSERT INTO `pa_city` VALUES ('9692','9691','440402','440400','香洲区','3','','','');
INSERT INTO `pa_city` VALUES ('9693','9691','440403','440400','斗门区','3','','','');
INSERT INTO `pa_city` VALUES ('9694','9691','440404','440400','金湾区','3','','','');
INSERT INTO `pa_city` VALUES ('9695','9691','440486','440400','金唐区','3','','','');
INSERT INTO `pa_city` VALUES ('9696','9691','440487','440400','南湾区','3','','','');
INSERT INTO `pa_city` VALUES ('9697','9691','440488','440400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9698','9655','440500','440000','汕头市','2','','','');
INSERT INTO `pa_city` VALUES ('9699','9698','440507','440500','龙湖区','3','','','');
INSERT INTO `pa_city` VALUES ('9700','9698','440511','440500','金平区','3','','','');
INSERT INTO `pa_city` VALUES ('9701','9698','440512','440500','濠江区','3','','','');
INSERT INTO `pa_city` VALUES ('9702','9698','440513','440500','潮阳区','3','','','');
INSERT INTO `pa_city` VALUES ('9703','9698','440514','440500','潮南区','3','','','');
INSERT INTO `pa_city` VALUES ('9704','9698','440515','440500','澄海区','3','','','');
INSERT INTO `pa_city` VALUES ('9705','9698','440523','440500','南澳县','3','','','');
INSERT INTO `pa_city` VALUES ('9706','9698','440524','440500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9707','9655','440600','440000','佛山市','2','','','');
INSERT INTO `pa_city` VALUES ('9708','9707','440604','440600','禅城区','3','','','');
INSERT INTO `pa_city` VALUES ('9709','9707','440605','440600','南海区','3','','','');
INSERT INTO `pa_city` VALUES ('9710','9707','440606','440600','顺德区','3','','','');
INSERT INTO `pa_city` VALUES ('9711','9707','440607','440600','三水区','3','','','');
INSERT INTO `pa_city` VALUES ('9712','9707','440608','440600','高明区','3','','','');
INSERT INTO `pa_city` VALUES ('9713','9707','440609','440600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9714','9655','440700','440000','江门市','2','','','');
INSERT INTO `pa_city` VALUES ('9715','9714','440703','440700','蓬江区','3','','','');
INSERT INTO `pa_city` VALUES ('9716','9714','440704','440700','江海区','3','','','');
INSERT INTO `pa_city` VALUES ('9717','9714','440705','440700','新会区','3','','','');
INSERT INTO `pa_city` VALUES ('9718','9714','440781','440700','台山市','3','','','');
INSERT INTO `pa_city` VALUES ('9719','9714','440783','440700','开平市','3','','','');
INSERT INTO `pa_city` VALUES ('9720','9714','440784','440700','鹤山市','3','','','');
INSERT INTO `pa_city` VALUES ('9721','9714','440785','440700','恩平市','3','','','');
INSERT INTO `pa_city` VALUES ('9722','9714','440786','440700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9723','9655','440800','440000','湛江市','2','','','');
INSERT INTO `pa_city` VALUES ('9724','9723','440802','440800','赤坎区','3','','','');
INSERT INTO `pa_city` VALUES ('9725','9723','440803','440800','霞山区','3','','','');
INSERT INTO `pa_city` VALUES ('9726','9723','440804','440800','坡头区','3','','','');
INSERT INTO `pa_city` VALUES ('9727','9723','440811','440800','麻章区','3','','','');
INSERT INTO `pa_city` VALUES ('9728','9723','440823','440800','遂溪县','3','','','');
INSERT INTO `pa_city` VALUES ('9729','9723','440825','440800','徐闻县','3','','','');
INSERT INTO `pa_city` VALUES ('9730','9723','440881','440800','廉江市','3','','','');
INSERT INTO `pa_city` VALUES ('9731','9723','440882','440800','雷州市','3','','','');
INSERT INTO `pa_city` VALUES ('9732','9723','440883','440800','吴川市','3','','','');
INSERT INTO `pa_city` VALUES ('9733','9723','440884','440800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9734','9655','440900','440000','茂名市','2','','','');
INSERT INTO `pa_city` VALUES ('9735','9734','440902','440900','茂南区','3','','','');
INSERT INTO `pa_city` VALUES ('9736','9734','440903','440900','茂港区','3','','','');
INSERT INTO `pa_city` VALUES ('9737','9734','440923','440900','电白县','3','','','');
INSERT INTO `pa_city` VALUES ('9738','9734','440981','440900','高州市','3','','','');
INSERT INTO `pa_city` VALUES ('9739','9734','440982','440900','化州市','3','','','');
INSERT INTO `pa_city` VALUES ('9740','9734','440983','440900','信宜市','3','','','');
INSERT INTO `pa_city` VALUES ('9741','9734','440984','440900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9742','9655','441200','440000','肇庆市','2','','','');
INSERT INTO `pa_city` VALUES ('9743','9742','441202','441200','端州区','3','','','');
INSERT INTO `pa_city` VALUES ('9744','9742','441203','441200','鼎湖区','3','','','');
INSERT INTO `pa_city` VALUES ('9745','9742','441223','441200','广宁县','3','','','');
INSERT INTO `pa_city` VALUES ('9746','9742','441224','441200','怀集县','3','','','');
INSERT INTO `pa_city` VALUES ('9747','9742','441225','441200','封开县','3','','','');
INSERT INTO `pa_city` VALUES ('9748','9742','441226','441200','德庆县','3','','','');
INSERT INTO `pa_city` VALUES ('9749','9742','441283','441200','高要市','3','','','');
INSERT INTO `pa_city` VALUES ('9750','9742','441284','441200','四会市','3','','','');
INSERT INTO `pa_city` VALUES ('9751','9742','441285','441200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9752','9655','441300','440000','惠州市','2','','','');
INSERT INTO `pa_city` VALUES ('9753','9752','441302','441300','惠城区','3','','','');
INSERT INTO `pa_city` VALUES ('9754','9752','441303','441300','惠阳区','3','','','');
INSERT INTO `pa_city` VALUES ('9755','9752','441322','441300','博罗县','3','','','');
INSERT INTO `pa_city` VALUES ('9756','9752','441323','441300','惠东县','3','','','');
INSERT INTO `pa_city` VALUES ('9757','9752','441324','441300','龙门县','3','','','');
INSERT INTO `pa_city` VALUES ('9758','9752','441325','441300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9759','9655','441400','440000','梅州市','2','','','');
INSERT INTO `pa_city` VALUES ('9760','9759','441402','441400','梅江区','3','','','');
INSERT INTO `pa_city` VALUES ('9761','9759','441421','441400','梅县','3','','','');
INSERT INTO `pa_city` VALUES ('9762','9759','441422','441400','大埔县','3','','','');
INSERT INTO `pa_city` VALUES ('9763','9759','441423','441400','丰顺县','3','','','');
INSERT INTO `pa_city` VALUES ('9764','9759','441424','441400','五华县','3','','','');
INSERT INTO `pa_city` VALUES ('9765','9759','441426','441400','平远县','3','','','');
INSERT INTO `pa_city` VALUES ('9766','9759','441427','441400','蕉岭县','3','','','');
INSERT INTO `pa_city` VALUES ('9767','9759','441481','441400','兴宁市','3','','','');
INSERT INTO `pa_city` VALUES ('9768','9759','441482','441400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9769','9655','441500','440000','汕尾市','2','','','');
INSERT INTO `pa_city` VALUES ('9770','9769','441502','441500','城区','3','','','');
INSERT INTO `pa_city` VALUES ('9771','9769','441521','441500','海丰县','3','','','');
INSERT INTO `pa_city` VALUES ('9772','9769','441523','441500','陆河县','3','','','');
INSERT INTO `pa_city` VALUES ('9773','9769','441581','441500','陆丰市','3','','','');
INSERT INTO `pa_city` VALUES ('9774','9769','441582','441500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9775','9655','441600','440000','河源市','2','','','');
INSERT INTO `pa_city` VALUES ('9776','9775','441602','441600','源城区','3','','','');
INSERT INTO `pa_city` VALUES ('9777','9775','441621','441600','紫金县','3','','','');
INSERT INTO `pa_city` VALUES ('9778','9775','441622','441600','龙川县','3','','','');
INSERT INTO `pa_city` VALUES ('9779','9775','441623','441600','连平县','3','','','');
INSERT INTO `pa_city` VALUES ('9780','9775','441624','441600','和平县','3','','','');
INSERT INTO `pa_city` VALUES ('9781','9775','441625','441600','东源县','3','','','');
INSERT INTO `pa_city` VALUES ('9782','9775','441626','441600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9783','9655','441700','440000','阳江市','2','','','');
INSERT INTO `pa_city` VALUES ('9784','9783','441702','441700','江城区','3','','','');
INSERT INTO `pa_city` VALUES ('9785','9783','441721','441700','阳西县','3','','','');
INSERT INTO `pa_city` VALUES ('9786','9783','441723','441700','阳东县','3','','','');
INSERT INTO `pa_city` VALUES ('9787','9783','441781','441700','阳春市','3','','','');
INSERT INTO `pa_city` VALUES ('9788','9783','441782','441700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9789','9655','441800','440000','清远市','2','','','');
INSERT INTO `pa_city` VALUES ('9790','9789','441802','441800','清城区','3','','','');
INSERT INTO `pa_city` VALUES ('9791','9789','441821','441800','佛冈县','3','','','');
INSERT INTO `pa_city` VALUES ('9792','9789','441823','441800','阳山县','3','','','');
INSERT INTO `pa_city` VALUES ('9793','9789','441825','441800','连山壮族瑶族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9794','9789','441826','441800','连南瑶族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9795','9789','441827','441800','清新县','3','','','');
INSERT INTO `pa_city` VALUES ('9796','9789','441881','441800','英德市','3','','','');
INSERT INTO `pa_city` VALUES ('9797','9789','441882','441800','连州市','3','','','');
INSERT INTO `pa_city` VALUES ('9798','9789','441883','441800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9799','9655','441900','440000','东莞市','2','','','');
INSERT INTO `pa_city` VALUES ('9800','9655','442000','440000','中山市','2','','','');
INSERT INTO `pa_city` VALUES ('9801','9655','445100','440000','潮州市','2','','','');
INSERT INTO `pa_city` VALUES ('9802','9801','445102','445100','湘桥区','3','','','');
INSERT INTO `pa_city` VALUES ('9803','9801','445121','445100','潮安县','3','','','');
INSERT INTO `pa_city` VALUES ('9804','9801','445122','445100','饶平县','3','','','');
INSERT INTO `pa_city` VALUES ('9805','9801','445185','445100','枫溪区','3','','','');
INSERT INTO `pa_city` VALUES ('9806','9801','445186','445100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9807','9655','445200','440000','揭阳市','2','','','');
INSERT INTO `pa_city` VALUES ('9808','9807','445202','445200','榕城区','3','','','');
INSERT INTO `pa_city` VALUES ('9809','9807','445221','445200','揭东县','3','','','');
INSERT INTO `pa_city` VALUES ('9810','9807','445222','445200','揭西县','3','','','');
INSERT INTO `pa_city` VALUES ('9811','9807','445224','445200','惠来县','3','','','');
INSERT INTO `pa_city` VALUES ('9812','9807','445281','445200','普宁市','3','','','');
INSERT INTO `pa_city` VALUES ('9813','9807','445284','445200','东山区','3','','','');
INSERT INTO `pa_city` VALUES ('9814','9807','445285','445200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9815','9655','445300','440000','云浮市','2','','','');
INSERT INTO `pa_city` VALUES ('9816','9815','445302','445300','云城区','3','','','');
INSERT INTO `pa_city` VALUES ('9817','9815','445321','445300','新兴县','3','','','');
INSERT INTO `pa_city` VALUES ('9818','9815','445322','445300','郁南县','3','','','');
INSERT INTO `pa_city` VALUES ('9819','9815','445323','445300','云安县','3','','','');
INSERT INTO `pa_city` VALUES ('9820','9815','445381','445300','罗定市','3','','','');
INSERT INTO `pa_city` VALUES ('9821','9815','445382','445300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9822','7459','450000','1','广西壮族自治区','1','','','');
INSERT INTO `pa_city` VALUES ('9823','9822','450100','450000','南宁市','2','','','');
INSERT INTO `pa_city` VALUES ('9824','9823','450102','450100','兴宁区','3','','','');
INSERT INTO `pa_city` VALUES ('9825','9823','450103','450100','青秀区','3','','','');
INSERT INTO `pa_city` VALUES ('9826','9823','450105','450100','江南区','3','','','');
INSERT INTO `pa_city` VALUES ('9827','9823','450107','450100','西乡塘区','3','','','');
INSERT INTO `pa_city` VALUES ('9828','9823','450108','450100','良庆区','3','','','');
INSERT INTO `pa_city` VALUES ('9829','9823','450109','450100','邕宁区','3','','','');
INSERT INTO `pa_city` VALUES ('9830','9823','450122','450100','武鸣县','3','','','');
INSERT INTO `pa_city` VALUES ('9831','9823','450123','450100','隆安县','3','','','');
INSERT INTO `pa_city` VALUES ('9832','9823','450124','450100','马山县','3','','','');
INSERT INTO `pa_city` VALUES ('9833','9823','450125','450100','上林县','3','','','');
INSERT INTO `pa_city` VALUES ('9834','9823','450126','450100','宾阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9835','9823','450127','450100','横县','3','','','');
INSERT INTO `pa_city` VALUES ('9836','9823','450128','450100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9837','9822','450200','450000','柳州市','2','','','');
INSERT INTO `pa_city` VALUES ('9838','9837','450202','450200','城中区','3','','','');
INSERT INTO `pa_city` VALUES ('9839','9837','450203','450200','鱼峰区','3','','','');
INSERT INTO `pa_city` VALUES ('9840','9837','450204','450200','柳南区','3','','','');
INSERT INTO `pa_city` VALUES ('9841','9837','450205','450200','柳北区','3','','','');
INSERT INTO `pa_city` VALUES ('9842','9837','450221','450200','柳江县','3','','','');
INSERT INTO `pa_city` VALUES ('9843','9837','450222','450200','柳城县','3','','','');
INSERT INTO `pa_city` VALUES ('9844','9837','450223','450200','鹿寨县','3','','','');
INSERT INTO `pa_city` VALUES ('9845','9837','450224','450200','融安县','3','','','');
INSERT INTO `pa_city` VALUES ('9846','9837','450225','450200','融水苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9847','9837','450226','450200','三江侗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9848','9837','450227','450200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9849','9822','450300','450000','桂林市','2','','','');
INSERT INTO `pa_city` VALUES ('9850','9849','450302','450300','秀峰区','3','','','');
INSERT INTO `pa_city` VALUES ('9851','9849','450303','450300','叠彩区','3','','','');
INSERT INTO `pa_city` VALUES ('9852','9849','450304','450300','象山区','3','','','');
INSERT INTO `pa_city` VALUES ('9853','9849','450305','450300','七星区','3','','','');
INSERT INTO `pa_city` VALUES ('9854','9849','450311','450300','雁山区','3','','','');
INSERT INTO `pa_city` VALUES ('9855','9849','450321','450300','阳朔县','3','','','');
INSERT INTO `pa_city` VALUES ('9856','9849','450322','450300','临桂县','3','','','');
INSERT INTO `pa_city` VALUES ('9857','9849','450323','450300','灵川县','3','','','');
INSERT INTO `pa_city` VALUES ('9858','9849','450324','450300','全州县','3','','','');
INSERT INTO `pa_city` VALUES ('9859','9849','450325','450300','兴安县','3','','','');
INSERT INTO `pa_city` VALUES ('9860','9849','450326','450300','永福县','3','','','');
INSERT INTO `pa_city` VALUES ('9861','9849','450327','450300','灌阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9862','9849','450328','450300','龙胜各族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9863','9849','450329','450300','资源县','3','','','');
INSERT INTO `pa_city` VALUES ('9864','9849','450330','450300','平乐县','3','','','');
INSERT INTO `pa_city` VALUES ('9865','9849','450331','450300','荔浦县','3','','','');
INSERT INTO `pa_city` VALUES ('9866','9849','450332','450300','恭城瑶族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9867','9849','450333','450300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9868','9822','450400','450000','梧州市','2','','','');
INSERT INTO `pa_city` VALUES ('9869','9868','450403','450400','万秀区','3','','','');
INSERT INTO `pa_city` VALUES ('9870','9868','450404','450400','蝶山区','3','','','');
INSERT INTO `pa_city` VALUES ('9871','9868','450405','450400','长洲区','3','','','');
INSERT INTO `pa_city` VALUES ('9872','9868','450421','450400','苍梧县','3','','','');
INSERT INTO `pa_city` VALUES ('9873','9868','450422','450400','藤县','3','','','');
INSERT INTO `pa_city` VALUES ('9874','9868','450423','450400','蒙山县','3','','','');
INSERT INTO `pa_city` VALUES ('9875','9868','450481','450400','岑溪市','3','','','');
INSERT INTO `pa_city` VALUES ('9876','9868','450482','450400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9877','9822','450500','450000','北海市','2','','','');
INSERT INTO `pa_city` VALUES ('9878','9877','450502','450500','海城区','3','','','');
INSERT INTO `pa_city` VALUES ('9879','9877','450503','450500','银海区','3','','','');
INSERT INTO `pa_city` VALUES ('9880','9877','450512','450500','铁山港区','3','','','');
INSERT INTO `pa_city` VALUES ('9881','9877','450521','450500','合浦县','3','','','');
INSERT INTO `pa_city` VALUES ('9882','9877','450522','450500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9883','9822','450600','450000','防城港市','2','','','');
INSERT INTO `pa_city` VALUES ('9884','9883','450602','450600','港口区','3','','','');
INSERT INTO `pa_city` VALUES ('9885','9883','450603','450600','防城区','3','','','');
INSERT INTO `pa_city` VALUES ('9886','9883','450621','450600','上思县','3','','','');
INSERT INTO `pa_city` VALUES ('9887','9883','450681','450600','东兴市','3','','','');
INSERT INTO `pa_city` VALUES ('9888','9883','450682','450600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9889','9822','450700','450000','钦州市','2','','','');
INSERT INTO `pa_city` VALUES ('9890','9889','450702','450700','钦南区','3','','','');
INSERT INTO `pa_city` VALUES ('9891','9889','450703','450700','钦北区','3','','','');
INSERT INTO `pa_city` VALUES ('9892','9889','450721','450700','灵山县','3','','','');
INSERT INTO `pa_city` VALUES ('9893','9889','450722','450700','浦北县','3','','','');
INSERT INTO `pa_city` VALUES ('9894','9889','450723','450700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9895','9822','450800','450000','贵港市','2','','','');
INSERT INTO `pa_city` VALUES ('9896','9895','450802','450800','港北区','3','','','');
INSERT INTO `pa_city` VALUES ('9897','9895','450803','450800','港南区','3','','','');
INSERT INTO `pa_city` VALUES ('9898','9895','450804','450800','覃塘区','3','','','');
INSERT INTO `pa_city` VALUES ('9899','9895','450821','450800','平南县','3','','','');
INSERT INTO `pa_city` VALUES ('9900','9895','450881','450800','桂平市','3','','','');
INSERT INTO `pa_city` VALUES ('9901','9895','450882','450800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9902','9822','450900','450000','玉林市','2','','','');
INSERT INTO `pa_city` VALUES ('9903','9902','450902','450900','玉州区','3','','','');
INSERT INTO `pa_city` VALUES ('9904','9902','450921','450900','容县','3','','','');
INSERT INTO `pa_city` VALUES ('9905','9902','450922','450900','陆川县','3','','','');
INSERT INTO `pa_city` VALUES ('9906','9902','450923','450900','博白县','3','','','');
INSERT INTO `pa_city` VALUES ('9907','9902','450924','450900','兴业县','3','','','');
INSERT INTO `pa_city` VALUES ('9908','9902','450981','450900','北流市','3','','','');
INSERT INTO `pa_city` VALUES ('9909','9902','450982','450900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9910','9822','451000','450000','百色市','2','','','');
INSERT INTO `pa_city` VALUES ('9911','9910','451002','451000','右江区','3','','','');
INSERT INTO `pa_city` VALUES ('9912','9910','451021','451000','田阳县','3','','','');
INSERT INTO `pa_city` VALUES ('9913','9910','451022','451000','田东县','3','','','');
INSERT INTO `pa_city` VALUES ('9914','9910','451023','451000','平果县','3','','','');
INSERT INTO `pa_city` VALUES ('9915','9910','451024','451000','德保县','3','','','');
INSERT INTO `pa_city` VALUES ('9916','9910','451025','451000','靖西县','3','','','');
INSERT INTO `pa_city` VALUES ('9917','9910','451026','451000','那坡县','3','','','');
INSERT INTO `pa_city` VALUES ('9918','9910','451027','451000','凌云县','3','','','');
INSERT INTO `pa_city` VALUES ('9919','9910','451028','451000','乐业县','3','','','');
INSERT INTO `pa_city` VALUES ('9920','9910','451029','451000','田林县','3','','','');
INSERT INTO `pa_city` VALUES ('9921','9910','451030','451000','西林县','3','','','');
INSERT INTO `pa_city` VALUES ('9922','9910','451031','451000','隆林各族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9923','9910','451032','451000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9924','9822','451100','450000','贺州市','2','','','');
INSERT INTO `pa_city` VALUES ('9925','9924','451102','451100','八步区','3','','','');
INSERT INTO `pa_city` VALUES ('9926','9924','451121','451100','昭平县','3','','','');
INSERT INTO `pa_city` VALUES ('9927','9924','451122','451100','钟山县','3','','','');
INSERT INTO `pa_city` VALUES ('9928','9924','451123','451100','富川瑶族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9929','9924','451124','451100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9930','9822','451200','450000','河池市','2','','','');
INSERT INTO `pa_city` VALUES ('9931','9930','451202','451200','金城江区','3','','','');
INSERT INTO `pa_city` VALUES ('9932','9930','451221','451200','南丹县','3','','','');
INSERT INTO `pa_city` VALUES ('9933','9930','451222','451200','天峨县','3','','','');
INSERT INTO `pa_city` VALUES ('9934','9930','451223','451200','凤山县','3','','','');
INSERT INTO `pa_city` VALUES ('9935','9930','451224','451200','东兰县','3','','','');
INSERT INTO `pa_city` VALUES ('9936','9930','451225','451200','罗城仫佬族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9937','9930','451226','451200','环江毛南族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9938','9930','451227','451200','巴马瑶族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9939','9930','451228','451200','都安瑶族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9940','9930','451229','451200','大化瑶族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9941','9930','451281','451200','宜州市','3','','','');
INSERT INTO `pa_city` VALUES ('9942','9930','451282','451200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9943','9822','451300','450000','来宾市','2','','','');
INSERT INTO `pa_city` VALUES ('9944','9943','451302','451300','兴宾区','3','','','');
INSERT INTO `pa_city` VALUES ('9945','9943','451321','451300','忻城县','3','','','');
INSERT INTO `pa_city` VALUES ('9946','9943','451322','451300','象州县','3','','','');
INSERT INTO `pa_city` VALUES ('9947','9943','451323','451300','武宣县','3','','','');
INSERT INTO `pa_city` VALUES ('9948','9943','451324','451300','金秀瑶族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('9949','9943','451381','451300','合山市','3','','','');
INSERT INTO `pa_city` VALUES ('9950','9943','451382','451300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9951','9822','451400','450000','崇左市','2','','','');
INSERT INTO `pa_city` VALUES ('9952','9951','451402','451400','江州区','3','','','');
INSERT INTO `pa_city` VALUES ('9953','9951','451421','451400','扶绥县','3','','','');
INSERT INTO `pa_city` VALUES ('9954','9951','451422','451400','宁明县','3','','','');
INSERT INTO `pa_city` VALUES ('9955','9951','451423','451400','龙州县','3','','','');
INSERT INTO `pa_city` VALUES ('9956','9951','451424','451400','大新县','3','','','');
INSERT INTO `pa_city` VALUES ('9957','9951','451425','451400','天等县','3','','','');
INSERT INTO `pa_city` VALUES ('9958','9951','451481','451400','凭祥市','3','','','');
INSERT INTO `pa_city` VALUES ('9959','9951','451482','451400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9960','7459','460000','1','海南省','1','','','');
INSERT INTO `pa_city` VALUES ('9961','9960','460100','460000','海口市','2','','','');
INSERT INTO `pa_city` VALUES ('9962','9961','460105','460100','秀英区','3','','','');
INSERT INTO `pa_city` VALUES ('9963','9961','460106','460100','龙华区','3','','','');
INSERT INTO `pa_city` VALUES ('9964','9961','460107','460100','琼山区','3','','','');
INSERT INTO `pa_city` VALUES ('9965','9961','460108','460100','美兰区','3','','','');
INSERT INTO `pa_city` VALUES ('9966','9961','460109','460100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9967','9960','460200','460000','三亚市','2','','','');
INSERT INTO `pa_city` VALUES ('9968','9960','469001','460000','五指山市','2','','','');
INSERT INTO `pa_city` VALUES ('9969','9960','469002','460000','琼海市','2','','','');
INSERT INTO `pa_city` VALUES ('9970','9960','469003','460000','儋州市','2','','','');
INSERT INTO `pa_city` VALUES ('9971','9960','469005','460000','文昌市','2','','','');
INSERT INTO `pa_city` VALUES ('9972','9960','469006','460000','万宁市','2','','','');
INSERT INTO `pa_city` VALUES ('9973','9960','469007','460000','东方市','2','','','');
INSERT INTO `pa_city` VALUES ('9974','9960','469025','460000','定安县','2','','','');
INSERT INTO `pa_city` VALUES ('9975','9960','469026','460000','屯昌县','2','','','');
INSERT INTO `pa_city` VALUES ('9976','9960','469027','460000','澄迈县','2','','','');
INSERT INTO `pa_city` VALUES ('9977','9960','469028','460000','临高县','2','','','');
INSERT INTO `pa_city` VALUES ('9978','9960','469030','460000','白沙黎族自治县','2','','','');
INSERT INTO `pa_city` VALUES ('9979','9960','469031','460000','昌江黎族自治县','2','','','');
INSERT INTO `pa_city` VALUES ('9980','9960','469033','460000','乐东黎族自治县','2','','','');
INSERT INTO `pa_city` VALUES ('9981','9960','469034','460000','陵水黎族自治县','2','','','');
INSERT INTO `pa_city` VALUES ('9982','9960','469035','460000','保亭黎族苗族自治县','2','','','');
INSERT INTO `pa_city` VALUES ('9983','9960','469036','460000','琼中黎族苗族自治县','2','','','');
INSERT INTO `pa_city` VALUES ('9984','9960','469037','460000','西沙群岛','2','','','');
INSERT INTO `pa_city` VALUES ('9985','9960','469038','460000','南沙群岛','2','','','');
INSERT INTO `pa_city` VALUES ('9986','9960','469039','460000','中沙群岛的岛礁及其海域','2','','','');
INSERT INTO `pa_city` VALUES ('9987','9204','471004','410300','高新区','3','','','');
INSERT INTO `pa_city` VALUES ('9988','9204','471005','410300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('9989','7459','500000','1','重庆','1','','','');
INSERT INTO `pa_city` VALUES ('9990','9989','500100','500000','重庆市','2','','','');
INSERT INTO `pa_city` VALUES ('9991','9990','500101','500100','万州区','3','','','');
INSERT INTO `pa_city` VALUES ('9992','9990','500102','500100','涪陵区','3','','','');
INSERT INTO `pa_city` VALUES ('9993','9990','500103','500100','渝中区','3','','','');
INSERT INTO `pa_city` VALUES ('9994','9990','500104','500100','大渡口区','3','','','');
INSERT INTO `pa_city` VALUES ('9995','9990','500105','500100','江北区','3','','','');
INSERT INTO `pa_city` VALUES ('9996','9990','500106','500100','沙坪坝区','3','','','');
INSERT INTO `pa_city` VALUES ('9997','9990','500107','500100','九龙坡区','3','','','');
INSERT INTO `pa_city` VALUES ('9998','9990','500108','500100','南岸区','3','','','');
INSERT INTO `pa_city` VALUES ('9999','9990','500109','500100','北碚区','3','','','');
INSERT INTO `pa_city` VALUES ('10000','9990','500110','500100','万盛区','3','','','');
INSERT INTO `pa_city` VALUES ('10001','9990','500111','500100','双桥区','3','','','');
INSERT INTO `pa_city` VALUES ('10002','9990','500112','500100','渝北区','3','','','');
INSERT INTO `pa_city` VALUES ('10003','9990','500113','500100','巴南区','3','','','');
INSERT INTO `pa_city` VALUES ('10004','9990','500114','500100','黔江区','3','','','');
INSERT INTO `pa_city` VALUES ('10005','9990','500115','500100','长寿区','3','','','');
INSERT INTO `pa_city` VALUES ('10006','9990','500222','500100','綦江县','3','','','');
INSERT INTO `pa_city` VALUES ('10007','9990','500223','500100','潼南县','3','','','');
INSERT INTO `pa_city` VALUES ('10008','9990','500224','500100','铜梁县','3','','','');
INSERT INTO `pa_city` VALUES ('10009','9990','500225','500100','大足县','3','','','');
INSERT INTO `pa_city` VALUES ('10010','9990','500226','500100','荣昌县','3','','','');
INSERT INTO `pa_city` VALUES ('10011','9990','500227','500100','璧山县','3','','','');
INSERT INTO `pa_city` VALUES ('10012','9990','500228','500100','梁平县','3','','','');
INSERT INTO `pa_city` VALUES ('10013','9990','500229','500100','城口县','3','','','');
INSERT INTO `pa_city` VALUES ('10014','9990','500230','500100','丰都县','3','','','');
INSERT INTO `pa_city` VALUES ('10015','9990','500231','500100','垫江县','3','','','');
INSERT INTO `pa_city` VALUES ('10016','9990','500232','500100','武隆县','3','','','');
INSERT INTO `pa_city` VALUES ('10017','9990','500233','500100','忠县','3','','','');
INSERT INTO `pa_city` VALUES ('10018','9990','500234','500100','开县','3','','','');
INSERT INTO `pa_city` VALUES ('10019','9990','500235','500100','云阳县','3','','','');
INSERT INTO `pa_city` VALUES ('10020','9990','500236','500100','奉节县','3','','','');
INSERT INTO `pa_city` VALUES ('10021','9990','500237','500100','巫山县','3','','','');
INSERT INTO `pa_city` VALUES ('10022','9990','500238','500100','巫溪县','3','','','');
INSERT INTO `pa_city` VALUES ('10023','9990','500240','500100','石柱土家族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10024','9990','500241','500100','秀山土家族苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10025','9990','500242','500100','酉阳土家族苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10026','9990','500243','500100','彭水苗族土家族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10027','9990','500381','500100','江津区','3','','','');
INSERT INTO `pa_city` VALUES ('10028','9990','500382','500100','合川区','3','','','');
INSERT INTO `pa_city` VALUES ('10029','9990','500383','500100','永川区','3','','','');
INSERT INTO `pa_city` VALUES ('10030','9990','500384','500100','南川区','3','','','');
INSERT INTO `pa_city` VALUES ('10031','9990','500385','500100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10032','7459','510000','1','四川省','1','','','');
INSERT INTO `pa_city` VALUES ('10033','10032','510100','510000','成都市','2','','','');
INSERT INTO `pa_city` VALUES ('10034','10033','510104','510100','锦江区','3','','','');
INSERT INTO `pa_city` VALUES ('10035','10033','510105','510100','青羊区','3','','','');
INSERT INTO `pa_city` VALUES ('10036','10033','510106','510100','金牛区','3','','','');
INSERT INTO `pa_city` VALUES ('10037','10033','510107','510100','武侯区','3','','','');
INSERT INTO `pa_city` VALUES ('10038','10033','510108','510100','成华区','3','','','');
INSERT INTO `pa_city` VALUES ('10039','10033','510112','510100','龙泉驿区','3','','','');
INSERT INTO `pa_city` VALUES ('10040','10033','510113','510100','青白江区','3','','','');
INSERT INTO `pa_city` VALUES ('10041','10033','510114','510100','新都区','3','','','');
INSERT INTO `pa_city` VALUES ('10042','10033','510115','510100','温江区','3','','','');
INSERT INTO `pa_city` VALUES ('10043','10033','510121','510100','金堂县','3','','','');
INSERT INTO `pa_city` VALUES ('10044','10033','510122','510100','双流县','3','','','');
INSERT INTO `pa_city` VALUES ('10045','10033','510124','510100','郫县','3','','','');
INSERT INTO `pa_city` VALUES ('10046','10033','510129','510100','大邑县','3','','','');
INSERT INTO `pa_city` VALUES ('10047','10033','510131','510100','蒲江县','3','','','');
INSERT INTO `pa_city` VALUES ('10048','10033','510132','510100','新津县','3','','','');
INSERT INTO `pa_city` VALUES ('10049','10033','510181','510100','都江堰市','3','','','');
INSERT INTO `pa_city` VALUES ('10050','10033','510182','510100','彭州市','3','','','');
INSERT INTO `pa_city` VALUES ('10051','10033','510183','510100','邛崃市','3','','','');
INSERT INTO `pa_city` VALUES ('10052','10033','510184','510100','崇州市','3','','','');
INSERT INTO `pa_city` VALUES ('10053','10033','510185','510100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10054','10032','510300','510000','自贡市','2','','','');
INSERT INTO `pa_city` VALUES ('10055','10054','510302','510300','自流井区','3','','','');
INSERT INTO `pa_city` VALUES ('10056','10054','510303','510300','贡井区','3','','','');
INSERT INTO `pa_city` VALUES ('10057','10054','510304','510300','大安区','3','','','');
INSERT INTO `pa_city` VALUES ('10058','10054','510311','510300','沿滩区','3','','','');
INSERT INTO `pa_city` VALUES ('10059','10054','510321','510300','荣县','3','','','');
INSERT INTO `pa_city` VALUES ('10060','10054','510322','510300','富顺县','3','','','');
INSERT INTO `pa_city` VALUES ('10061','10054','510323','510300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10062','10032','510400','510000','攀枝花市','2','','','');
INSERT INTO `pa_city` VALUES ('10063','10062','510402','510400','东区','3','','','');
INSERT INTO `pa_city` VALUES ('10064','10062','510403','510400','西区','3','','','');
INSERT INTO `pa_city` VALUES ('10065','10062','510411','510400','仁和区','3','','','');
INSERT INTO `pa_city` VALUES ('10066','10062','510421','510400','米易县','3','','','');
INSERT INTO `pa_city` VALUES ('10067','10062','510422','510400','盐边县','3','','','');
INSERT INTO `pa_city` VALUES ('10068','10062','510423','510400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10069','10032','510500','510000','泸州市','2','','','');
INSERT INTO `pa_city` VALUES ('10070','10069','510502','510500','江阳区','3','','','');
INSERT INTO `pa_city` VALUES ('10071','10069','510503','510500','纳溪区','3','','','');
INSERT INTO `pa_city` VALUES ('10072','10069','510504','510500','龙马潭区','3','','','');
INSERT INTO `pa_city` VALUES ('10073','10069','510521','510500','泸县','3','','','');
INSERT INTO `pa_city` VALUES ('10074','10069','510522','510500','合江县','3','','','');
INSERT INTO `pa_city` VALUES ('10075','10069','510524','510500','叙永县','3','','','');
INSERT INTO `pa_city` VALUES ('10076','10069','510525','510500','古蔺县','3','','','');
INSERT INTO `pa_city` VALUES ('10077','10069','510526','510500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10078','10032','510600','510000','德阳市','2','','','');
INSERT INTO `pa_city` VALUES ('10079','10078','510603','510600','旌阳区','3','','','');
INSERT INTO `pa_city` VALUES ('10080','10078','510623','510600','中江县','3','','','');
INSERT INTO `pa_city` VALUES ('10081','10078','510626','510600','罗江县','3','','','');
INSERT INTO `pa_city` VALUES ('10082','10078','510681','510600','广汉市','3','','','');
INSERT INTO `pa_city` VALUES ('10083','10078','510682','510600','什邡市','3','','','');
INSERT INTO `pa_city` VALUES ('10084','10078','510683','510600','绵竹市','3','','','');
INSERT INTO `pa_city` VALUES ('10085','10078','510684','510600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10086','10032','510700','510000','绵阳市','2','','','');
INSERT INTO `pa_city` VALUES ('10087','10086','510703','510700','涪城区','3','','','');
INSERT INTO `pa_city` VALUES ('10088','10086','510704','510700','游仙区','3','','','');
INSERT INTO `pa_city` VALUES ('10089','10086','510722','510700','三台县','3','','','');
INSERT INTO `pa_city` VALUES ('10090','10086','510723','510700','盐亭县','3','','','');
INSERT INTO `pa_city` VALUES ('10091','10086','510724','510700','安县','3','','','');
INSERT INTO `pa_city` VALUES ('10092','10086','510725','510700','梓潼县','3','','','');
INSERT INTO `pa_city` VALUES ('10093','10086','510726','510700','北川羌族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10094','10086','510727','510700','平武县','3','','','');
INSERT INTO `pa_city` VALUES ('10095','10086','510751','510700','高新区','3','','','');
INSERT INTO `pa_city` VALUES ('10096','10086','510781','510700','江油市','3','','','');
INSERT INTO `pa_city` VALUES ('10097','10086','510782','510700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10098','10032','510800','510000','广元市','2','','','');
INSERT INTO `pa_city` VALUES ('10099','10098','510802','510800','利州区','3','','','');
INSERT INTO `pa_city` VALUES ('10100','10098','510811','510800','元坝区','3','','','');
INSERT INTO `pa_city` VALUES ('10101','10098','510812','510800','朝天区','3','','','');
INSERT INTO `pa_city` VALUES ('10102','10098','510821','510800','旺苍县','3','','','');
INSERT INTO `pa_city` VALUES ('10103','10098','510822','510800','青川县','3','','','');
INSERT INTO `pa_city` VALUES ('10104','10098','510823','510800','剑阁县','3','','','');
INSERT INTO `pa_city` VALUES ('10105','10098','510824','510800','苍溪县','3','','','');
INSERT INTO `pa_city` VALUES ('10106','10098','510825','510800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10107','10032','510900','510000','遂宁市','2','','','');
INSERT INTO `pa_city` VALUES ('10108','10107','510903','510900','船山区','3','','','');
INSERT INTO `pa_city` VALUES ('10109','10107','510904','510900','安居区','3','','','');
INSERT INTO `pa_city` VALUES ('10110','10107','510921','510900','蓬溪县','3','','','');
INSERT INTO `pa_city` VALUES ('10111','10107','510922','510900','射洪县','3','','','');
INSERT INTO `pa_city` VALUES ('10112','10107','510923','510900','大英县','3','','','');
INSERT INTO `pa_city` VALUES ('10113','10107','510924','510900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10114','10032','511000','510000','内江市','2','','','');
INSERT INTO `pa_city` VALUES ('10115','10114','511002','511000','市中区','3','','','');
INSERT INTO `pa_city` VALUES ('10116','10114','511011','511000','东兴区','3','','','');
INSERT INTO `pa_city` VALUES ('10117','10114','511024','511000','威远县','3','','','');
INSERT INTO `pa_city` VALUES ('10118','10114','511025','511000','资中县','3','','','');
INSERT INTO `pa_city` VALUES ('10119','10114','511028','511000','隆昌县','3','','','');
INSERT INTO `pa_city` VALUES ('10120','10114','511029','511000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10121','10032','511100','510000','乐山市','2','','','');
INSERT INTO `pa_city` VALUES ('10122','10121','511102','511100','市中区','3','','','');
INSERT INTO `pa_city` VALUES ('10123','10121','511111','511100','沙湾区','3','','','');
INSERT INTO `pa_city` VALUES ('10124','10121','511112','511100','五通桥区','3','','','');
INSERT INTO `pa_city` VALUES ('10125','10121','511113','511100','金口河区','3','','','');
INSERT INTO `pa_city` VALUES ('10126','10121','511123','511100','犍为县','3','','','');
INSERT INTO `pa_city` VALUES ('10127','10121','511124','511100','井研县','3','','','');
INSERT INTO `pa_city` VALUES ('10128','10121','511126','511100','夹江县','3','','','');
INSERT INTO `pa_city` VALUES ('10129','10121','511129','511100','沐川县','3','','','');
INSERT INTO `pa_city` VALUES ('10130','10121','511132','511100','峨边彝族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10131','10121','511133','511100','马边彝族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10132','10121','511181','511100','峨眉山市','3','','','');
INSERT INTO `pa_city` VALUES ('10133','10121','511182','511100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10134','10032','511300','510000','南充市','2','','','');
INSERT INTO `pa_city` VALUES ('10135','10134','511302','511300','顺庆区','3','','','');
INSERT INTO `pa_city` VALUES ('10136','10134','511303','511300','高坪区','3','','','');
INSERT INTO `pa_city` VALUES ('10137','10134','511304','511300','嘉陵区','3','','','');
INSERT INTO `pa_city` VALUES ('10138','10134','511321','511300','南部县','3','','','');
INSERT INTO `pa_city` VALUES ('10139','10134','511322','511300','营山县','3','','','');
INSERT INTO `pa_city` VALUES ('10140','10134','511323','511300','蓬安县','3','','','');
INSERT INTO `pa_city` VALUES ('10141','10134','511324','511300','仪陇县','3','','','');
INSERT INTO `pa_city` VALUES ('10142','10134','511325','511300','西充县','3','','','');
INSERT INTO `pa_city` VALUES ('10143','10134','511381','511300','阆中市','3','','','');
INSERT INTO `pa_city` VALUES ('10144','10134','511382','511300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10145','10032','511400','510000','眉山市','2','','','');
INSERT INTO `pa_city` VALUES ('10146','10145','511402','511400','东坡区','3','','','');
INSERT INTO `pa_city` VALUES ('10147','10145','511421','511400','仁寿县','3','','','');
INSERT INTO `pa_city` VALUES ('10148','10145','511422','511400','彭山县','3','','','');
INSERT INTO `pa_city` VALUES ('10149','10145','511423','511400','洪雅县','3','','','');
INSERT INTO `pa_city` VALUES ('10150','10145','511424','511400','丹棱县','3','','','');
INSERT INTO `pa_city` VALUES ('10151','10145','511425','511400','青神县','3','','','');
INSERT INTO `pa_city` VALUES ('10152','10145','511426','511400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10153','10032','511500','510000','宜宾市','2','','','');
INSERT INTO `pa_city` VALUES ('10154','10153','511502','511500','翠屏区','3','','','');
INSERT INTO `pa_city` VALUES ('10155','10153','511521','511500','宜宾县','3','','','');
INSERT INTO `pa_city` VALUES ('10156','10153','511522','511500','南溪县','3','','','');
INSERT INTO `pa_city` VALUES ('10157','10153','511523','511500','江安县','3','','','');
INSERT INTO `pa_city` VALUES ('10158','10153','511524','511500','长宁县','3','','','');
INSERT INTO `pa_city` VALUES ('10159','10153','511525','511500','高县','3','','','');
INSERT INTO `pa_city` VALUES ('10160','10153','511526','511500','珙县','3','','','');
INSERT INTO `pa_city` VALUES ('10161','10153','511527','511500','筠连县','3','','','');
INSERT INTO `pa_city` VALUES ('10162','10153','511528','511500','兴文县','3','','','');
INSERT INTO `pa_city` VALUES ('10163','10153','511529','511500','屏山县','3','','','');
INSERT INTO `pa_city` VALUES ('10164','10153','511530','511500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10165','10032','511600','510000','广安市','2','','','');
INSERT INTO `pa_city` VALUES ('10166','10165','511602','511600','广安区','3','','','');
INSERT INTO `pa_city` VALUES ('10167','10165','511621','511600','岳池县','3','','','');
INSERT INTO `pa_city` VALUES ('10168','10165','511622','511600','武胜县','3','','','');
INSERT INTO `pa_city` VALUES ('10169','10165','511623','511600','邻水县','3','','','');
INSERT INTO `pa_city` VALUES ('10170','10165','511681','511600','华蓥市','3','','','');
INSERT INTO `pa_city` VALUES ('10171','10165','511682','511600','市辖区','3','','','');
INSERT INTO `pa_city` VALUES ('10172','10165','511683','511600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10173','10032','511700','510000','达州市','2','','','');
INSERT INTO `pa_city` VALUES ('10174','10173','511702','511700','通川区','3','','','');
INSERT INTO `pa_city` VALUES ('10175','10173','511721','511700','达县','3','','','');
INSERT INTO `pa_city` VALUES ('10176','10173','511722','511700','宣汉县','3','','','');
INSERT INTO `pa_city` VALUES ('10177','10173','511723','511700','开江县','3','','','');
INSERT INTO `pa_city` VALUES ('10178','10173','511724','511700','大竹县','3','','','');
INSERT INTO `pa_city` VALUES ('10179','10173','511725','511700','渠县','3','','','');
INSERT INTO `pa_city` VALUES ('10180','10173','511781','511700','万源市','3','','','');
INSERT INTO `pa_city` VALUES ('10181','10173','511782','511700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10182','10032','511800','510000','雅安市','2','','','');
INSERT INTO `pa_city` VALUES ('10183','10182','511802','511800','雨城区','3','','','');
INSERT INTO `pa_city` VALUES ('10184','10182','511821','511800','名山县','3','','','');
INSERT INTO `pa_city` VALUES ('10185','10182','511822','511800','荥经县','3','','','');
INSERT INTO `pa_city` VALUES ('10186','10182','511823','511800','汉源县','3','','','');
INSERT INTO `pa_city` VALUES ('10187','10182','511824','511800','石棉县','3','','','');
INSERT INTO `pa_city` VALUES ('10188','10182','511825','511800','天全县','3','','','');
INSERT INTO `pa_city` VALUES ('10189','10182','511826','511800','芦山县','3','','','');
INSERT INTO `pa_city` VALUES ('10190','10182','511827','511800','宝兴县','3','','','');
INSERT INTO `pa_city` VALUES ('10191','10182','511828','511800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10192','10032','511900','510000','巴中市','2','','','');
INSERT INTO `pa_city` VALUES ('10193','10192','511902','511900','巴州区','3','','','');
INSERT INTO `pa_city` VALUES ('10194','10192','511921','511900','通江县','3','','','');
INSERT INTO `pa_city` VALUES ('10195','10192','511922','511900','南江县','3','','','');
INSERT INTO `pa_city` VALUES ('10196','10192','511923','511900','平昌县','3','','','');
INSERT INTO `pa_city` VALUES ('10197','10192','511924','511900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10198','10032','512000','510000','资阳市','2','','','');
INSERT INTO `pa_city` VALUES ('10199','10198','512002','512000','雁江区','3','','','');
INSERT INTO `pa_city` VALUES ('10200','10198','512021','512000','安岳县','3','','','');
INSERT INTO `pa_city` VALUES ('10201','10198','512022','512000','乐至县','3','','','');
INSERT INTO `pa_city` VALUES ('10202','10198','512081','512000','简阳市','3','','','');
INSERT INTO `pa_city` VALUES ('10203','10198','512082','512000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10204','10032','513200','510000','阿坝藏族羌族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10205','10204','513221','513200','汶川县','3','','','');
INSERT INTO `pa_city` VALUES ('10206','10204','513222','513200','理县','3','','','');
INSERT INTO `pa_city` VALUES ('10207','10204','513223','513200','茂县','3','','','');
INSERT INTO `pa_city` VALUES ('10208','10204','513224','513200','松潘县','3','','','');
INSERT INTO `pa_city` VALUES ('10209','10204','513225','513200','九寨沟县','3','','','');
INSERT INTO `pa_city` VALUES ('10210','10204','513226','513200','金川县','3','','','');
INSERT INTO `pa_city` VALUES ('10211','10204','513227','513200','小金县','3','','','');
INSERT INTO `pa_city` VALUES ('10212','10204','513228','513200','黑水县','3','','','');
INSERT INTO `pa_city` VALUES ('10213','10204','513229','513200','马尔康县','3','','','');
INSERT INTO `pa_city` VALUES ('10214','10204','513230','513200','壤塘县','3','','','');
INSERT INTO `pa_city` VALUES ('10215','10204','513231','513200','阿坝县','3','','','');
INSERT INTO `pa_city` VALUES ('10216','10204','513232','513200','若尔盖县','3','','','');
INSERT INTO `pa_city` VALUES ('10217','10204','513233','513200','红原县','3','','','');
INSERT INTO `pa_city` VALUES ('10218','10204','513234','513200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10219','10032','513300','510000','甘孜藏族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10220','10219','513321','513300','康定县','3','','','');
INSERT INTO `pa_city` VALUES ('10221','10219','513322','513300','泸定县','3','','','');
INSERT INTO `pa_city` VALUES ('10222','10219','513323','513300','丹巴县','3','','','');
INSERT INTO `pa_city` VALUES ('10223','10219','513324','513300','九龙县','3','','','');
INSERT INTO `pa_city` VALUES ('10224','10219','513325','513300','雅江县','3','','','');
INSERT INTO `pa_city` VALUES ('10225','10219','513326','513300','道孚县','3','','','');
INSERT INTO `pa_city` VALUES ('10226','10219','513327','513300','炉霍县','3','','','');
INSERT INTO `pa_city` VALUES ('10227','10219','513328','513300','甘孜县','3','','','');
INSERT INTO `pa_city` VALUES ('10228','10219','513329','513300','新龙县','3','','','');
INSERT INTO `pa_city` VALUES ('10229','10219','513330','513300','德格县','3','','','');
INSERT INTO `pa_city` VALUES ('10230','10219','513331','513300','白玉县','3','','','');
INSERT INTO `pa_city` VALUES ('10231','10219','513332','513300','石渠县','3','','','');
INSERT INTO `pa_city` VALUES ('10232','10219','513333','513300','色达县','3','','','');
INSERT INTO `pa_city` VALUES ('10233','10219','513334','513300','理塘县','3','','','');
INSERT INTO `pa_city` VALUES ('10234','10219','513335','513300','巴塘县','3','','','');
INSERT INTO `pa_city` VALUES ('10235','10219','513336','513300','乡城县','3','','','');
INSERT INTO `pa_city` VALUES ('10236','10219','513337','513300','稻城县','3','','','');
INSERT INTO `pa_city` VALUES ('10237','10219','513338','513300','得荣县','3','','','');
INSERT INTO `pa_city` VALUES ('10238','10219','513339','513300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10239','10032','513400','510000','凉山彝族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10240','10239','513401','513400','西昌市','3','','','');
INSERT INTO `pa_city` VALUES ('10241','10239','513422','513400','木里藏族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10242','10239','513423','513400','盐源县','3','','','');
INSERT INTO `pa_city` VALUES ('10243','10239','513424','513400','德昌县','3','','','');
INSERT INTO `pa_city` VALUES ('10244','10239','513425','513400','会理县','3','','','');
INSERT INTO `pa_city` VALUES ('10245','10239','513426','513400','会东县','3','','','');
INSERT INTO `pa_city` VALUES ('10246','10239','513427','513400','宁南县','3','','','');
INSERT INTO `pa_city` VALUES ('10247','10239','513428','513400','普格县','3','','','');
INSERT INTO `pa_city` VALUES ('10248','10239','513429','513400','布拖县','3','','','');
INSERT INTO `pa_city` VALUES ('10249','10239','513430','513400','金阳县','3','','','');
INSERT INTO `pa_city` VALUES ('10250','10239','513431','513400','昭觉县','3','','','');
INSERT INTO `pa_city` VALUES ('10251','10239','513432','513400','喜德县','3','','','');
INSERT INTO `pa_city` VALUES ('10252','10239','513433','513400','冕宁县','3','','','');
INSERT INTO `pa_city` VALUES ('10253','10239','513434','513400','越西县','3','','','');
INSERT INTO `pa_city` VALUES ('10254','10239','513435','513400','甘洛县','3','','','');
INSERT INTO `pa_city` VALUES ('10255','10239','513436','513400','美姑县','3','','','');
INSERT INTO `pa_city` VALUES ('10256','10239','513437','513400','雷波县','3','','','');
INSERT INTO `pa_city` VALUES ('10257','10239','513438','513400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10258','7459','520000','1','贵州省','1','','','');
INSERT INTO `pa_city` VALUES ('10259','10258','520100','520000','贵阳市','2','','','');
INSERT INTO `pa_city` VALUES ('10260','10259','520102','520100','南明区','3','','','');
INSERT INTO `pa_city` VALUES ('10261','10259','520103','520100','云岩区','3','','','');
INSERT INTO `pa_city` VALUES ('10262','10259','520111','520100','花溪区','3','','','');
INSERT INTO `pa_city` VALUES ('10263','10259','520112','520100','乌当区','3','','','');
INSERT INTO `pa_city` VALUES ('10264','10259','520113','520100','白云区','3','','','');
INSERT INTO `pa_city` VALUES ('10265','10259','520114','520100','小河区','3','','','');
INSERT INTO `pa_city` VALUES ('10266','10259','520121','520100','开阳县','3','','','');
INSERT INTO `pa_city` VALUES ('10267','10259','520122','520100','息烽县','3','','','');
INSERT INTO `pa_city` VALUES ('10268','10259','520123','520100','修文县','3','','','');
INSERT INTO `pa_city` VALUES ('10269','10259','520151','520100','金阳开发区','3','','','');
INSERT INTO `pa_city` VALUES ('10270','10259','520181','520100','清镇市','3','','','');
INSERT INTO `pa_city` VALUES ('10271','10259','520182','520100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10272','10258','520200','520000','六盘水市','2','','','');
INSERT INTO `pa_city` VALUES ('10273','10272','520201','520200','钟山区','3','','','');
INSERT INTO `pa_city` VALUES ('10274','10272','520203','520200','六枝特区','3','','','');
INSERT INTO `pa_city` VALUES ('10275','10272','520221','520200','水城县','3','','','');
INSERT INTO `pa_city` VALUES ('10276','10272','520222','520200','盘县','3','','','');
INSERT INTO `pa_city` VALUES ('10277','10272','520223','520200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10278','10258','520300','520000','遵义市','2','','','');
INSERT INTO `pa_city` VALUES ('10279','10278','520302','520300','红花岗区','3','','','');
INSERT INTO `pa_city` VALUES ('10280','10278','520303','520300','汇川区','3','','','');
INSERT INTO `pa_city` VALUES ('10281','10278','520321','520300','遵义县','3','','','');
INSERT INTO `pa_city` VALUES ('10282','10278','520322','520300','桐梓县','3','','','');
INSERT INTO `pa_city` VALUES ('10283','10278','520323','520300','绥阳县','3','','','');
INSERT INTO `pa_city` VALUES ('10284','10278','520324','520300','正安县','3','','','');
INSERT INTO `pa_city` VALUES ('10285','10278','520325','520300','道真仡佬族苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10286','10278','520326','520300','务川仡佬族苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10287','10278','520327','520300','凤冈县','3','','','');
INSERT INTO `pa_city` VALUES ('10288','10278','520328','520300','湄潭县','3','','','');
INSERT INTO `pa_city` VALUES ('10289','10278','520329','520300','余庆县','3','','','');
INSERT INTO `pa_city` VALUES ('10290','10278','520330','520300','习水县','3','','','');
INSERT INTO `pa_city` VALUES ('10291','10278','520381','520300','赤水市','3','','','');
INSERT INTO `pa_city` VALUES ('10292','10278','520382','520300','仁怀市','3','','','');
INSERT INTO `pa_city` VALUES ('10293','10278','520383','520300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10294','10258','520400','520000','安顺市','2','','','');
INSERT INTO `pa_city` VALUES ('10295','10294','520402','520400','西秀区','3','','','');
INSERT INTO `pa_city` VALUES ('10296','10294','520421','520400','平坝县','3','','','');
INSERT INTO `pa_city` VALUES ('10297','10294','520422','520400','普定县','3','','','');
INSERT INTO `pa_city` VALUES ('10298','10294','520423','520400','镇宁布依族苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10299','10294','520424','520400','关岭布依族苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10300','10294','520425','520400','紫云苗族布依族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10301','10294','520426','520400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10302','10258','522200','520000','铜仁地区','2','','','');
INSERT INTO `pa_city` VALUES ('10303','10302','522201','522200','铜仁市','3','','','');
INSERT INTO `pa_city` VALUES ('10304','10302','522222','522200','江口县','3','','','');
INSERT INTO `pa_city` VALUES ('10305','10302','522223','522200','玉屏侗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10306','10302','522224','522200','石阡县','3','','','');
INSERT INTO `pa_city` VALUES ('10307','10302','522225','522200','思南县','3','','','');
INSERT INTO `pa_city` VALUES ('10308','10302','522226','522200','印江土家族苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10309','10302','522227','522200','德江县','3','','','');
INSERT INTO `pa_city` VALUES ('10310','10302','522228','522200','沿河土家族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10311','10302','522229','522200','松桃苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10312','10302','522230','522200','万山特区','3','','','');
INSERT INTO `pa_city` VALUES ('10313','10302','522231','522200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10314','10258','522300','520000','黔西南布依族苗族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10315','10314','522301','522300','兴义市','3','','','');
INSERT INTO `pa_city` VALUES ('10316','10314','522322','522300','兴仁县','3','','','');
INSERT INTO `pa_city` VALUES ('10317','10314','522323','522300','普安县','3','','','');
INSERT INTO `pa_city` VALUES ('10318','10314','522324','522300','晴隆县','3','','','');
INSERT INTO `pa_city` VALUES ('10319','10314','522325','522300','贞丰县','3','','','');
INSERT INTO `pa_city` VALUES ('10320','10314','522326','522300','望谟县','3','','','');
INSERT INTO `pa_city` VALUES ('10321','10314','522327','522300','册亨县','3','','','');
INSERT INTO `pa_city` VALUES ('10322','10314','522328','522300','安龙县','3','','','');
INSERT INTO `pa_city` VALUES ('10323','10314','522329','522300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10324','10258','522400','520000','毕节地区','2','','','');
INSERT INTO `pa_city` VALUES ('10325','10324','522401','522400','毕节市','3','','','');
INSERT INTO `pa_city` VALUES ('10326','10324','522422','522400','大方县','3','','','');
INSERT INTO `pa_city` VALUES ('10327','10324','522423','522400','黔西县','3','','','');
INSERT INTO `pa_city` VALUES ('10328','10324','522424','522400','金沙县','3','','','');
INSERT INTO `pa_city` VALUES ('10329','10324','522425','522400','织金县','3','','','');
INSERT INTO `pa_city` VALUES ('10330','10324','522426','522400','纳雍县','3','','','');
INSERT INTO `pa_city` VALUES ('10331','10324','522427','522400','威宁彝族回族苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10332','10324','522428','522400','赫章县','3','','','');
INSERT INTO `pa_city` VALUES ('10333','10324','522429','522400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10334','10258','522600','520000','黔东南苗族侗族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10335','10334','522601','522600','凯里市','3','','','');
INSERT INTO `pa_city` VALUES ('10336','10334','522622','522600','黄平县','3','','','');
INSERT INTO `pa_city` VALUES ('10337','10334','522623','522600','施秉县','3','','','');
INSERT INTO `pa_city` VALUES ('10338','10334','522624','522600','三穗县','3','','','');
INSERT INTO `pa_city` VALUES ('10339','10334','522625','522600','镇远县','3','','','');
INSERT INTO `pa_city` VALUES ('10340','10334','522626','522600','岑巩县','3','','','');
INSERT INTO `pa_city` VALUES ('10341','10334','522627','522600','天柱县','3','','','');
INSERT INTO `pa_city` VALUES ('10342','10334','522628','522600','锦屏县','3','','','');
INSERT INTO `pa_city` VALUES ('10343','10334','522629','522600','剑河县','3','','','');
INSERT INTO `pa_city` VALUES ('10344','10334','522630','522600','台江县','3','','','');
INSERT INTO `pa_city` VALUES ('10345','10334','522631','522600','黎平县','3','','','');
INSERT INTO `pa_city` VALUES ('10346','10334','522632','522600','榕江县','3','','','');
INSERT INTO `pa_city` VALUES ('10347','10334','522633','522600','从江县','3','','','');
INSERT INTO `pa_city` VALUES ('10348','10334','522634','522600','雷山县','3','','','');
INSERT INTO `pa_city` VALUES ('10349','10334','522635','522600','麻江县','3','','','');
INSERT INTO `pa_city` VALUES ('10350','10334','522636','522600','丹寨县','3','','','');
INSERT INTO `pa_city` VALUES ('10351','10334','522637','522600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10352','10258','522700','520000','黔南布依族苗族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10353','10352','522701','522700','都匀市','3','','','');
INSERT INTO `pa_city` VALUES ('10354','10352','522702','522700','福泉市','3','','','');
INSERT INTO `pa_city` VALUES ('10355','10352','522722','522700','荔波县','3','','','');
INSERT INTO `pa_city` VALUES ('10356','10352','522723','522700','贵定县','3','','','');
INSERT INTO `pa_city` VALUES ('10357','10352','522725','522700','瓮安县','3','','','');
INSERT INTO `pa_city` VALUES ('10358','10352','522726','522700','独山县','3','','','');
INSERT INTO `pa_city` VALUES ('10359','10352','522727','522700','平塘县','3','','','');
INSERT INTO `pa_city` VALUES ('10360','10352','522728','522700','罗甸县','3','','','');
INSERT INTO `pa_city` VALUES ('10361','10352','522729','522700','长顺县','3','','','');
INSERT INTO `pa_city` VALUES ('10362','10352','522730','522700','龙里县','3','','','');
INSERT INTO `pa_city` VALUES ('10363','10352','522731','522700','惠水县','3','','','');
INSERT INTO `pa_city` VALUES ('10364','10352','522732','522700','三都水族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10365','10352','522733','522700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10366','7459','530000','1','云南省','1','','','');
INSERT INTO `pa_city` VALUES ('10367','10366','530100','530000','昆明市','2','','','');
INSERT INTO `pa_city` VALUES ('10368','10367','530102','530100','五华区','3','','','');
INSERT INTO `pa_city` VALUES ('10369','10367','530103','530100','盘龙区','3','','','');
INSERT INTO `pa_city` VALUES ('10370','10367','530111','530100','官渡区','3','','','');
INSERT INTO `pa_city` VALUES ('10371','10367','530112','530100','西山区','3','','','');
INSERT INTO `pa_city` VALUES ('10372','10367','530113','530100','东川区','3','','','');
INSERT INTO `pa_city` VALUES ('10373','10367','530121','530100','呈贡县','3','','','');
INSERT INTO `pa_city` VALUES ('10374','10367','530122','530100','晋宁县','3','','','');
INSERT INTO `pa_city` VALUES ('10375','10367','530124','530100','富民县','3','','','');
INSERT INTO `pa_city` VALUES ('10376','10367','530125','530100','宜良县','3','','','');
INSERT INTO `pa_city` VALUES ('10377','10367','530126','530100','石林彝族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10378','10367','530127','530100','嵩明县','3','','','');
INSERT INTO `pa_city` VALUES ('10379','10367','530128','530100','禄劝彝族苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10380','10367','530129','530100','寻甸回族彝族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10381','10367','530181','530100','安宁市','3','','','');
INSERT INTO `pa_city` VALUES ('10382','10367','530182','530100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10383','10366','530300','530000','曲靖市','2','','','');
INSERT INTO `pa_city` VALUES ('10384','10383','530302','530300','麒麟区','3','','','');
INSERT INTO `pa_city` VALUES ('10385','10383','530321','530300','马龙县','3','','','');
INSERT INTO `pa_city` VALUES ('10386','10383','530322','530300','陆良县','3','','','');
INSERT INTO `pa_city` VALUES ('10387','10383','530323','530300','师宗县','3','','','');
INSERT INTO `pa_city` VALUES ('10388','10383','530324','530300','罗平县','3','','','');
INSERT INTO `pa_city` VALUES ('10389','10383','530325','530300','富源县','3','','','');
INSERT INTO `pa_city` VALUES ('10390','10383','530326','530300','会泽县','3','','','');
INSERT INTO `pa_city` VALUES ('10391','10383','530328','530300','沾益县','3','','','');
INSERT INTO `pa_city` VALUES ('10392','10383','530381','530300','宣威市','3','','','');
INSERT INTO `pa_city` VALUES ('10393','10383','530382','530300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10394','10366','530400','530000','玉溪市','2','','','');
INSERT INTO `pa_city` VALUES ('10395','10394','530402','530400','红塔区','3','','','');
INSERT INTO `pa_city` VALUES ('10396','10394','530421','530400','江川县','3','','','');
INSERT INTO `pa_city` VALUES ('10397','10394','530422','530400','澄江县','3','','','');
INSERT INTO `pa_city` VALUES ('10398','10394','530423','530400','通海县','3','','','');
INSERT INTO `pa_city` VALUES ('10399','10394','530424','530400','华宁县','3','','','');
INSERT INTO `pa_city` VALUES ('10400','10394','530425','530400','易门县','3','','','');
INSERT INTO `pa_city` VALUES ('10401','10394','530426','530400','峨山彝族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10402','10394','530427','530400','新平彝族傣族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10403','10394','530428','530400','元江哈尼族彝族傣族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10404','10394','530429','530400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10405','10366','530500','530000','保山市','2','','','');
INSERT INTO `pa_city` VALUES ('10406','10405','530502','530500','隆阳区','3','','','');
INSERT INTO `pa_city` VALUES ('10407','10405','530521','530500','施甸县','3','','','');
INSERT INTO `pa_city` VALUES ('10408','10405','530522','530500','腾冲县','3','','','');
INSERT INTO `pa_city` VALUES ('10409','10405','530523','530500','龙陵县','3','','','');
INSERT INTO `pa_city` VALUES ('10410','10405','530524','530500','昌宁县','3','','','');
INSERT INTO `pa_city` VALUES ('10411','10405','530525','530500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10412','10366','530600','530000','昭通市','2','','','');
INSERT INTO `pa_city` VALUES ('10413','10412','530602','530600','昭阳区','3','','','');
INSERT INTO `pa_city` VALUES ('10414','10412','530621','530600','鲁甸县','3','','','');
INSERT INTO `pa_city` VALUES ('10415','10412','530622','530600','巧家县','3','','','');
INSERT INTO `pa_city` VALUES ('10416','10412','530623','530600','盐津县','3','','','');
INSERT INTO `pa_city` VALUES ('10417','10412','530624','530600','大关县','3','','','');
INSERT INTO `pa_city` VALUES ('10418','10412','530625','530600','永善县','3','','','');
INSERT INTO `pa_city` VALUES ('10419','10412','530626','530600','绥江县','3','','','');
INSERT INTO `pa_city` VALUES ('10420','10412','530627','530600','镇雄县','3','','','');
INSERT INTO `pa_city` VALUES ('10421','10412','530628','530600','彝良县','3','','','');
INSERT INTO `pa_city` VALUES ('10422','10412','530629','530600','威信县','3','','','');
INSERT INTO `pa_city` VALUES ('10423','10412','530630','530600','水富县','3','','','');
INSERT INTO `pa_city` VALUES ('10424','10412','530631','530600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10425','10366','530700','530000','丽江市','2','','','');
INSERT INTO `pa_city` VALUES ('10426','10425','530702','530700','古城区','3','','','');
INSERT INTO `pa_city` VALUES ('10427','10425','530721','530700','玉龙纳西族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10428','10425','530722','530700','永胜县','3','','','');
INSERT INTO `pa_city` VALUES ('10429','10425','530723','530700','华坪县','3','','','');
INSERT INTO `pa_city` VALUES ('10430','10425','530724','530700','宁蒗彝族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10431','10425','530725','530700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10432','10366','530800','530000','普洱市','2','','','');
INSERT INTO `pa_city` VALUES ('10433','10432','530802','530800','思茅区','3','','','');
INSERT INTO `pa_city` VALUES ('10434','10432','530821','530800','宁洱哈尼族彝族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10435','10432','530822','530800','墨江哈尼族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10436','10432','530823','530800','景东彝族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10437','10432','530824','530800','景谷傣族彝族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10438','10432','530825','530800','镇沅彝族哈尼族拉祜族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10439','10432','530826','530800','江城哈尼族彝族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10440','10432','530827','530800','孟连傣族拉祜族佤族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10441','10432','530828','530800','澜沧拉祜族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10442','10432','530829','530800','西盟佤族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10443','10432','530830','530800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10444','10366','530900','530000','临沧市','2','','','');
INSERT INTO `pa_city` VALUES ('10445','10444','530902','530900','临翔区','3','','','');
INSERT INTO `pa_city` VALUES ('10446','10444','530921','530900','凤庆县','3','','','');
INSERT INTO `pa_city` VALUES ('10447','10444','530922','530900','云县','3','','','');
INSERT INTO `pa_city` VALUES ('10448','10444','530923','530900','永德县','3','','','');
INSERT INTO `pa_city` VALUES ('10449','10444','530924','530900','镇康县','3','','','');
INSERT INTO `pa_city` VALUES ('10450','10444','530925','530900','双江拉祜族佤族布朗族傣族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10451','10444','530926','530900','耿马傣族佤族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10452','10444','530927','530900','沧源佤族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10453','10444','530928','530900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10454','10366','532300','530000','楚雄彝族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10455','10454','532301','532300','楚雄市','3','','','');
INSERT INTO `pa_city` VALUES ('10456','10454','532322','532300','双柏县','3','','','');
INSERT INTO `pa_city` VALUES ('10457','10454','532323','532300','牟定县','3','','','');
INSERT INTO `pa_city` VALUES ('10458','10454','532324','532300','南华县','3','','','');
INSERT INTO `pa_city` VALUES ('10459','10454','532325','532300','姚安县','3','','','');
INSERT INTO `pa_city` VALUES ('10460','10454','532326','532300','大姚县','3','','','');
INSERT INTO `pa_city` VALUES ('10461','10454','532327','532300','永仁县','3','','','');
INSERT INTO `pa_city` VALUES ('10462','10454','532328','532300','元谋县','3','','','');
INSERT INTO `pa_city` VALUES ('10463','10454','532329','532300','武定县','3','','','');
INSERT INTO `pa_city` VALUES ('10464','10454','532331','532300','禄丰县','3','','','');
INSERT INTO `pa_city` VALUES ('10465','10454','532332','532300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10466','10366','532500','530000','红河哈尼族彝族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10467','10466','532501','532500','个旧市','3','','','');
INSERT INTO `pa_city` VALUES ('10468','10466','532502','532500','开远市','3','','','');
INSERT INTO `pa_city` VALUES ('10469','10466','532522','532500','蒙自县','3','','','');
INSERT INTO `pa_city` VALUES ('10470','10466','532523','532500','屏边苗族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10471','10466','532524','532500','建水县','3','','','');
INSERT INTO `pa_city` VALUES ('10472','10466','532525','532500','石屏县','3','','','');
INSERT INTO `pa_city` VALUES ('10473','10466','532526','532500','弥勒县','3','','','');
INSERT INTO `pa_city` VALUES ('10474','10466','532527','532500','泸西县','3','','','');
INSERT INTO `pa_city` VALUES ('10475','10466','532528','532500','元阳县','3','','','');
INSERT INTO `pa_city` VALUES ('10476','10466','532529','532500','红河县','3','','','');
INSERT INTO `pa_city` VALUES ('10477','10466','532530','532500','金平苗族瑶族傣族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10478','10466','532531','532500','绿春县','3','','','');
INSERT INTO `pa_city` VALUES ('10479','10466','532532','532500','河口瑶族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10480','10466','532533','532500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10481','10366','532600','530000','文山壮族苗族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10482','10481','532621','532600','文山县','3','','','');
INSERT INTO `pa_city` VALUES ('10483','10481','532622','532600','砚山县','3','','','');
INSERT INTO `pa_city` VALUES ('10484','10481','532623','532600','西畴县','3','','','');
INSERT INTO `pa_city` VALUES ('10485','10481','532624','532600','麻栗坡县','3','','','');
INSERT INTO `pa_city` VALUES ('10486','10481','532625','532600','马关县','3','','','');
INSERT INTO `pa_city` VALUES ('10487','10481','532626','532600','丘北县','3','','','');
INSERT INTO `pa_city` VALUES ('10488','10481','532627','532600','广南县','3','','','');
INSERT INTO `pa_city` VALUES ('10489','10481','532628','532600','富宁县','3','','','');
INSERT INTO `pa_city` VALUES ('10490','10481','532629','532600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10491','10366','532800','530000','西双版纳傣族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10492','10491','532801','532800','景洪市','3','','','');
INSERT INTO `pa_city` VALUES ('10493','10491','532822','532800','勐海县','3','','','');
INSERT INTO `pa_city` VALUES ('10494','10491','532823','532800','勐腊县','3','','','');
INSERT INTO `pa_city` VALUES ('10495','10491','532824','532800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10496','10366','532900','530000','大理白族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10497','10496','532901','532900','大理市','3','','','');
INSERT INTO `pa_city` VALUES ('10498','10496','532922','532900','漾濞彝族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10499','10496','532923','532900','祥云县','3','','','');
INSERT INTO `pa_city` VALUES ('10500','10496','532924','532900','宾川县','3','','','');
INSERT INTO `pa_city` VALUES ('10501','10496','532925','532900','弥渡县','3','','','');
INSERT INTO `pa_city` VALUES ('10502','10496','532926','532900','南涧彝族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10503','10496','532927','532900','巍山彝族回族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10504','10496','532928','532900','永平县','3','','','');
INSERT INTO `pa_city` VALUES ('10505','10496','532929','532900','云龙县','3','','','');
INSERT INTO `pa_city` VALUES ('10506','10496','532930','532900','洱源县','3','','','');
INSERT INTO `pa_city` VALUES ('10507','10496','532931','532900','剑川县','3','','','');
INSERT INTO `pa_city` VALUES ('10508','10496','532932','532900','鹤庆县','3','','','');
INSERT INTO `pa_city` VALUES ('10509','10496','532933','532900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10510','10366','533100','530000','德宏傣族景颇族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10511','10510','533102','533100','瑞丽市','3','','','');
INSERT INTO `pa_city` VALUES ('10512','10510','533103','533100','潞西市','3','','','');
INSERT INTO `pa_city` VALUES ('10513','10510','533122','533100','梁河县','3','','','');
INSERT INTO `pa_city` VALUES ('10514','10510','533123','533100','盈江县','3','','','');
INSERT INTO `pa_city` VALUES ('10515','10510','533124','533100','陇川县','3','','','');
INSERT INTO `pa_city` VALUES ('10516','10510','533125','533100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10517','10366','533300','530000','怒江傈僳族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10518','10517','533321','533300','泸水县','3','','','');
INSERT INTO `pa_city` VALUES ('10519','10517','533323','533300','福贡县','3','','','');
INSERT INTO `pa_city` VALUES ('10520','10517','533324','533300','贡山独龙族怒族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10521','10517','533325','533300','兰坪白族普米族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10522','10517','533326','533300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10523','10366','533400','530000','迪庆藏族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10524','10523','533421','533400','香格里拉县','3','','','');
INSERT INTO `pa_city` VALUES ('10525','10523','533422','533400','德钦县','3','','','');
INSERT INTO `pa_city` VALUES ('10526','10523','533423','533400','维西傈僳族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10527','10523','533424','533400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10528','7459','540000','1','西藏自治区','1','','','');
INSERT INTO `pa_city` VALUES ('10529','10528','540100','540000','拉萨市','2','','','');
INSERT INTO `pa_city` VALUES ('10530','10529','540102','540100','城关区','3','','','');
INSERT INTO `pa_city` VALUES ('10531','10529','540121','540100','林周县','3','','','');
INSERT INTO `pa_city` VALUES ('10532','10529','540122','540100','当雄县','3','','','');
INSERT INTO `pa_city` VALUES ('10533','10529','540123','540100','尼木县','3','','','');
INSERT INTO `pa_city` VALUES ('10534','10529','540124','540100','曲水县','3','','','');
INSERT INTO `pa_city` VALUES ('10535','10529','540125','540100','堆龙德庆县','3','','','');
INSERT INTO `pa_city` VALUES ('10536','10529','540126','540100','达孜县','3','','','');
INSERT INTO `pa_city` VALUES ('10537','10529','540127','540100','墨竹工卡县','3','','','');
INSERT INTO `pa_city` VALUES ('10538','10529','540128','540100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10539','10528','542100','540000','昌都地区','2','','','');
INSERT INTO `pa_city` VALUES ('10540','10539','542121','542100','昌都县','3','','','');
INSERT INTO `pa_city` VALUES ('10541','10539','542122','542100','江达县','3','','','');
INSERT INTO `pa_city` VALUES ('10542','10539','542123','542100','贡觉县','3','','','');
INSERT INTO `pa_city` VALUES ('10543','10539','542124','542100','类乌齐县','3','','','');
INSERT INTO `pa_city` VALUES ('10544','10539','542125','542100','丁青县','3','','','');
INSERT INTO `pa_city` VALUES ('10545','10539','542126','542100','察雅县','3','','','');
INSERT INTO `pa_city` VALUES ('10546','10539','542127','542100','八宿县','3','','','');
INSERT INTO `pa_city` VALUES ('10547','10539','542128','542100','左贡县','3','','','');
INSERT INTO `pa_city` VALUES ('10548','10539','542129','542100','芒康县','3','','','');
INSERT INTO `pa_city` VALUES ('10549','10539','542132','542100','洛隆县','3','','','');
INSERT INTO `pa_city` VALUES ('10550','10539','542133','542100','边坝县','3','','','');
INSERT INTO `pa_city` VALUES ('10551','10539','542134','542100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10552','10528','542200','540000','山南地区','2','','','');
INSERT INTO `pa_city` VALUES ('10553','10552','542221','542200','乃东县','3','','','');
INSERT INTO `pa_city` VALUES ('10554','10552','542222','542200','扎囊县','3','','','');
INSERT INTO `pa_city` VALUES ('10555','10552','542223','542200','贡嘎县','3','','','');
INSERT INTO `pa_city` VALUES ('10556','10552','542224','542200','桑日县','3','','','');
INSERT INTO `pa_city` VALUES ('10557','10552','542225','542200','琼结县','3','','','');
INSERT INTO `pa_city` VALUES ('10558','10552','542226','542200','曲松县','3','','','');
INSERT INTO `pa_city` VALUES ('10559','10552','542227','542200','措美县','3','','','');
INSERT INTO `pa_city` VALUES ('10560','10552','542228','542200','洛扎县','3','','','');
INSERT INTO `pa_city` VALUES ('10561','10552','542229','542200','加查县','3','','','');
INSERT INTO `pa_city` VALUES ('10562','10552','542231','542200','隆子县','3','','','');
INSERT INTO `pa_city` VALUES ('10563','10552','542232','542200','错那县','3','','','');
INSERT INTO `pa_city` VALUES ('10564','10552','542233','542200','浪卡子县','3','','','');
INSERT INTO `pa_city` VALUES ('10565','10552','542234','542200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10566','10528','542300','540000','日喀则地区','2','','','');
INSERT INTO `pa_city` VALUES ('10567','10566','542301','542300','日喀则市','3','','','');
INSERT INTO `pa_city` VALUES ('10568','10566','542322','542300','南木林县','3','','','');
INSERT INTO `pa_city` VALUES ('10569','10566','542323','542300','江孜县','3','','','');
INSERT INTO `pa_city` VALUES ('10570','10566','542324','542300','定日县','3','','','');
INSERT INTO `pa_city` VALUES ('10571','10566','542325','542300','萨迦县','3','','','');
INSERT INTO `pa_city` VALUES ('10572','10566','542326','542300','拉孜县','3','','','');
INSERT INTO `pa_city` VALUES ('10573','10566','542327','542300','昂仁县','3','','','');
INSERT INTO `pa_city` VALUES ('10574','10566','542328','542300','谢通门县','3','','','');
INSERT INTO `pa_city` VALUES ('10575','10566','542329','542300','白朗县','3','','','');
INSERT INTO `pa_city` VALUES ('10576','10566','542330','542300','仁布县','3','','','');
INSERT INTO `pa_city` VALUES ('10577','10566','542331','542300','康马县','3','','','');
INSERT INTO `pa_city` VALUES ('10578','10566','542332','542300','定结县','3','','','');
INSERT INTO `pa_city` VALUES ('10579','10566','542333','542300','仲巴县','3','','','');
INSERT INTO `pa_city` VALUES ('10580','10566','542334','542300','亚东县','3','','','');
INSERT INTO `pa_city` VALUES ('10581','10566','542335','542300','吉隆县','3','','','');
INSERT INTO `pa_city` VALUES ('10582','10566','542336','542300','聂拉木县','3','','','');
INSERT INTO `pa_city` VALUES ('10583','10566','542337','542300','萨嘎县','3','','','');
INSERT INTO `pa_city` VALUES ('10584','10566','542338','542300','岗巴县','3','','','');
INSERT INTO `pa_city` VALUES ('10585','10566','542339','542300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10586','10528','542400','540000','那曲地区','2','','','');
INSERT INTO `pa_city` VALUES ('10587','10586','542421','542400','那曲县','3','','','');
INSERT INTO `pa_city` VALUES ('10588','10586','542422','542400','嘉黎县','3','','','');
INSERT INTO `pa_city` VALUES ('10589','10586','542423','542400','比如县','3','','','');
INSERT INTO `pa_city` VALUES ('10590','10586','542424','542400','聂荣县','3','','','');
INSERT INTO `pa_city` VALUES ('10591','10586','542425','542400','安多县','3','','','');
INSERT INTO `pa_city` VALUES ('10592','10586','542426','542400','申扎县','3','','','');
INSERT INTO `pa_city` VALUES ('10593','10586','542427','542400','索县','3','','','');
INSERT INTO `pa_city` VALUES ('10594','10586','542428','542400','班戈县','3','','','');
INSERT INTO `pa_city` VALUES ('10595','10586','542429','542400','巴青县','3','','','');
INSERT INTO `pa_city` VALUES ('10596','10586','542430','542400','尼玛县','3','','','');
INSERT INTO `pa_city` VALUES ('10597','10586','542431','542400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10598','10528','542500','540000','阿里地区','2','','','');
INSERT INTO `pa_city` VALUES ('10599','10598','542521','542500','普兰县','3','','','');
INSERT INTO `pa_city` VALUES ('10600','10598','542522','542500','札达县','3','','','');
INSERT INTO `pa_city` VALUES ('10601','10598','542523','542500','噶尔县','3','','','');
INSERT INTO `pa_city` VALUES ('10602','10598','542524','542500','日土县','3','','','');
INSERT INTO `pa_city` VALUES ('10603','10598','542525','542500','革吉县','3','','','');
INSERT INTO `pa_city` VALUES ('10604','10598','542526','542500','改则县','3','','','');
INSERT INTO `pa_city` VALUES ('10605','10598','542527','542500','措勤县','3','','','');
INSERT INTO `pa_city` VALUES ('10606','10598','542528','542500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10607','10528','542600','540000','林芝地区','2','','','');
INSERT INTO `pa_city` VALUES ('10608','10607','542621','542600','林芝县','3','','','');
INSERT INTO `pa_city` VALUES ('10609','10607','542622','542600','工布江达县','3','','','');
INSERT INTO `pa_city` VALUES ('10610','10607','542623','542600','米林县','3','','','');
INSERT INTO `pa_city` VALUES ('10611','10607','542624','542600','墨脱县','3','','','');
INSERT INTO `pa_city` VALUES ('10612','10607','542625','542600','波密县','3','','','');
INSERT INTO `pa_city` VALUES ('10613','10607','542626','542600','察隅县','3','','','');
INSERT INTO `pa_city` VALUES ('10614','10607','542627','542600','朗县','3','','','');
INSERT INTO `pa_city` VALUES ('10615','10607','542628','542600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10616','7459','610000','1','陕西省','1','','','');
INSERT INTO `pa_city` VALUES ('10617','10616','610100','610000','西安市','2','','','');
INSERT INTO `pa_city` VALUES ('10618','10617','610102','610100','新城区','3','','','');
INSERT INTO `pa_city` VALUES ('10619','10617','610103','610100','碑林区','3','','','');
INSERT INTO `pa_city` VALUES ('10620','10617','610104','610100','莲湖区','3','','','');
INSERT INTO `pa_city` VALUES ('10621','10617','610111','610100','灞桥区','3','','','');
INSERT INTO `pa_city` VALUES ('10622','10617','610112','610100','未央区','3','','','');
INSERT INTO `pa_city` VALUES ('10623','10617','610113','610100','雁塔区','3','','','');
INSERT INTO `pa_city` VALUES ('10624','10617','610114','610100','阎良区','3','','','');
INSERT INTO `pa_city` VALUES ('10625','10617','610115','610100','临潼区','3','','','');
INSERT INTO `pa_city` VALUES ('10626','10617','610116','610100','长安区','3','','','');
INSERT INTO `pa_city` VALUES ('10627','10617','610122','610100','蓝田县','3','','','');
INSERT INTO `pa_city` VALUES ('10628','10617','610124','610100','周至县','3','','','');
INSERT INTO `pa_city` VALUES ('10629','10617','610125','610100','户县','3','','','');
INSERT INTO `pa_city` VALUES ('10630','10617','610126','610100','高陵县','3','','','');
INSERT INTO `pa_city` VALUES ('10631','10617','610127','610100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10632','10616','610200','610000','铜川市','2','','','');
INSERT INTO `pa_city` VALUES ('10633','10632','610202','610200','王益区','3','','','');
INSERT INTO `pa_city` VALUES ('10634','10632','610203','610200','印台区','3','','','');
INSERT INTO `pa_city` VALUES ('10635','10632','610204','610200','耀州区','3','','','');
INSERT INTO `pa_city` VALUES ('10636','10632','610222','610200','宜君县','3','','','');
INSERT INTO `pa_city` VALUES ('10637','10632','610223','610200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10638','10616','610300','610000','宝鸡市','2','','','');
INSERT INTO `pa_city` VALUES ('10639','10638','610302','610300','渭滨区','3','','','');
INSERT INTO `pa_city` VALUES ('10640','10638','610303','610300','金台区','3','','','');
INSERT INTO `pa_city` VALUES ('10641','10638','610304','610300','陈仓区','3','','','');
INSERT INTO `pa_city` VALUES ('10642','10638','610322','610300','凤翔县','3','','','');
INSERT INTO `pa_city` VALUES ('10643','10638','610323','610300','岐山县','3','','','');
INSERT INTO `pa_city` VALUES ('10644','10638','610324','610300','扶风县','3','','','');
INSERT INTO `pa_city` VALUES ('10645','10638','610326','610300','眉县','3','','','');
INSERT INTO `pa_city` VALUES ('10646','10638','610327','610300','陇县','3','','','');
INSERT INTO `pa_city` VALUES ('10647','10638','610328','610300','千阳县','3','','','');
INSERT INTO `pa_city` VALUES ('10648','10638','610329','610300','麟游县','3','','','');
INSERT INTO `pa_city` VALUES ('10649','10638','610330','610300','凤县','3','','','');
INSERT INTO `pa_city` VALUES ('10650','10638','610331','610300','太白县','3','','','');
INSERT INTO `pa_city` VALUES ('10651','10638','610332','610300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10652','10616','610400','610000','咸阳市','2','','','');
INSERT INTO `pa_city` VALUES ('10653','10652','610402','610400','秦都区','3','','','');
INSERT INTO `pa_city` VALUES ('10654','10652','610403','610400','杨凌区','3','','','');
INSERT INTO `pa_city` VALUES ('10655','10652','610404','610400','渭城区','3','','','');
INSERT INTO `pa_city` VALUES ('10656','10652','610422','610400','三原县','3','','','');
INSERT INTO `pa_city` VALUES ('10657','10652','610423','610400','泾阳县','3','','','');
INSERT INTO `pa_city` VALUES ('10658','10652','610424','610400','乾县','3','','','');
INSERT INTO `pa_city` VALUES ('10659','10652','610425','610400','礼泉县','3','','','');
INSERT INTO `pa_city` VALUES ('10660','10652','610426','610400','永寿县','3','','','');
INSERT INTO `pa_city` VALUES ('10661','10652','610427','610400','彬县','3','','','');
INSERT INTO `pa_city` VALUES ('10662','10652','610428','610400','长武县','3','','','');
INSERT INTO `pa_city` VALUES ('10663','10652','610429','610400','旬邑县','3','','','');
INSERT INTO `pa_city` VALUES ('10664','10652','610430','610400','淳化县','3','','','');
INSERT INTO `pa_city` VALUES ('10665','10652','610431','610400','武功县','3','','','');
INSERT INTO `pa_city` VALUES ('10666','10652','610481','610400','兴平市','3','','','');
INSERT INTO `pa_city` VALUES ('10667','10652','610482','610400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10668','10616','610500','610000','渭南市','2','','','');
INSERT INTO `pa_city` VALUES ('10669','10668','610502','610500','临渭区','3','','','');
INSERT INTO `pa_city` VALUES ('10670','10668','610521','610500','华县','3','','','');
INSERT INTO `pa_city` VALUES ('10671','10668','610522','610500','潼关县','3','','','');
INSERT INTO `pa_city` VALUES ('10672','10668','610523','610500','大荔县','3','','','');
INSERT INTO `pa_city` VALUES ('10673','10668','610524','610500','合阳县','3','','','');
INSERT INTO `pa_city` VALUES ('10674','10668','610525','610500','澄城县','3','','','');
INSERT INTO `pa_city` VALUES ('10675','10668','610526','610500','蒲城县','3','','','');
INSERT INTO `pa_city` VALUES ('10676','10668','610527','610500','白水县','3','','','');
INSERT INTO `pa_city` VALUES ('10677','10668','610528','610500','富平县','3','','','');
INSERT INTO `pa_city` VALUES ('10678','10668','610581','610500','韩城市','3','','','');
INSERT INTO `pa_city` VALUES ('10679','10668','610582','610500','华阴市','3','','','');
INSERT INTO `pa_city` VALUES ('10680','10668','610583','610500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10681','10616','610600','610000','延安市','2','','','');
INSERT INTO `pa_city` VALUES ('10682','10681','610602','610600','宝塔区','3','','','');
INSERT INTO `pa_city` VALUES ('10683','10681','610621','610600','延长县','3','','','');
INSERT INTO `pa_city` VALUES ('10684','10681','610622','610600','延川县','3','','','');
INSERT INTO `pa_city` VALUES ('10685','10681','610623','610600','子长县','3','','','');
INSERT INTO `pa_city` VALUES ('10686','10681','610624','610600','安塞县','3','','','');
INSERT INTO `pa_city` VALUES ('10687','10681','610625','610600','志丹县','3','','','');
INSERT INTO `pa_city` VALUES ('10688','10681','610626','610600','吴起县','3','','','');
INSERT INTO `pa_city` VALUES ('10689','10681','610627','610600','甘泉县','3','','','');
INSERT INTO `pa_city` VALUES ('10690','10681','610628','610600','富县','3','','','');
INSERT INTO `pa_city` VALUES ('10691','10681','610629','610600','洛川县','3','','','');
INSERT INTO `pa_city` VALUES ('10692','10681','610630','610600','宜川县','3','','','');
INSERT INTO `pa_city` VALUES ('10693','10681','610631','610600','黄龙县','3','','','');
INSERT INTO `pa_city` VALUES ('10694','10681','610632','610600','黄陵县','3','','','');
INSERT INTO `pa_city` VALUES ('10695','10681','610633','610600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10696','10616','610700','610000','汉中市','2','','','');
INSERT INTO `pa_city` VALUES ('10697','10696','610702','610700','汉台区','3','','','');
INSERT INTO `pa_city` VALUES ('10698','10696','610721','610700','南郑县','3','','','');
INSERT INTO `pa_city` VALUES ('10699','10696','610722','610700','城固县','3','','','');
INSERT INTO `pa_city` VALUES ('10700','10696','610723','610700','洋县','3','','','');
INSERT INTO `pa_city` VALUES ('10701','10696','610724','610700','西乡县','3','','','');
INSERT INTO `pa_city` VALUES ('10702','10696','610725','610700','勉县','3','','','');
INSERT INTO `pa_city` VALUES ('10703','10696','610726','610700','宁强县','3','','','');
INSERT INTO `pa_city` VALUES ('10704','10696','610727','610700','略阳县','3','','','');
INSERT INTO `pa_city` VALUES ('10705','10696','610728','610700','镇巴县','3','','','');
INSERT INTO `pa_city` VALUES ('10706','10696','610729','610700','留坝县','3','','','');
INSERT INTO `pa_city` VALUES ('10707','10696','610730','610700','佛坪县','3','','','');
INSERT INTO `pa_city` VALUES ('10708','10696','610731','610700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10709','10616','610800','610000','榆林市','2','','','');
INSERT INTO `pa_city` VALUES ('10710','10709','610802','610800','榆阳区','3','','','');
INSERT INTO `pa_city` VALUES ('10711','10709','610821','610800','神木县','3','','','');
INSERT INTO `pa_city` VALUES ('10712','10709','610822','610800','府谷县','3','','','');
INSERT INTO `pa_city` VALUES ('10713','10709','610823','610800','横山县','3','','','');
INSERT INTO `pa_city` VALUES ('10714','10709','610824','610800','靖边县','3','','','');
INSERT INTO `pa_city` VALUES ('10715','10709','610825','610800','定边县','3','','','');
INSERT INTO `pa_city` VALUES ('10716','10709','610826','610800','绥德县','3','','','');
INSERT INTO `pa_city` VALUES ('10717','10709','610827','610800','米脂县','3','','','');
INSERT INTO `pa_city` VALUES ('10718','10709','610828','610800','佳县','3','','','');
INSERT INTO `pa_city` VALUES ('10719','10709','610829','610800','吴堡县','3','','','');
INSERT INTO `pa_city` VALUES ('10720','10709','610830','610800','清涧县','3','','','');
INSERT INTO `pa_city` VALUES ('10721','10709','610831','610800','子洲县','3','','','');
INSERT INTO `pa_city` VALUES ('10722','10709','610832','610800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10723','10616','610900','610000','安康市','2','','','');
INSERT INTO `pa_city` VALUES ('10724','10723','610902','610900','汉滨区','3','','','');
INSERT INTO `pa_city` VALUES ('10725','10723','610921','610900','汉阴县','3','','','');
INSERT INTO `pa_city` VALUES ('10726','10723','610922','610900','石泉县','3','','','');
INSERT INTO `pa_city` VALUES ('10727','10723','610923','610900','宁陕县','3','','','');
INSERT INTO `pa_city` VALUES ('10728','10723','610924','610900','紫阳县','3','','','');
INSERT INTO `pa_city` VALUES ('10729','10723','610925','610900','岚皋县','3','','','');
INSERT INTO `pa_city` VALUES ('10730','10723','610926','610900','平利县','3','','','');
INSERT INTO `pa_city` VALUES ('10731','10723','610927','610900','镇坪县','3','','','');
INSERT INTO `pa_city` VALUES ('10732','10723','610928','610900','旬阳县','3','','','');
INSERT INTO `pa_city` VALUES ('10733','10723','610929','610900','白河县','3','','','');
INSERT INTO `pa_city` VALUES ('10734','10723','610930','610900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10735','10616','611000','610000','商洛市','2','','','');
INSERT INTO `pa_city` VALUES ('10736','10735','611002','611000','商州区','3','','','');
INSERT INTO `pa_city` VALUES ('10737','10735','611021','611000','洛南县','3','','','');
INSERT INTO `pa_city` VALUES ('10738','10735','611022','611000','丹凤县','3','','','');
INSERT INTO `pa_city` VALUES ('10739','10735','611023','611000','商南县','3','','','');
INSERT INTO `pa_city` VALUES ('10740','10735','611024','611000','山阳县','3','','','');
INSERT INTO `pa_city` VALUES ('10741','10735','611025','611000','镇安县','3','','','');
INSERT INTO `pa_city` VALUES ('10742','10735','611026','611000','柞水县','3','','','');
INSERT INTO `pa_city` VALUES ('10743','10735','611027','611000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10744','7459','620000','1','甘肃省','1','','','');
INSERT INTO `pa_city` VALUES ('10745','10744','620100','620000','兰州市','2','','','');
INSERT INTO `pa_city` VALUES ('10746','10745','620102','620100','城关区','3','','','');
INSERT INTO `pa_city` VALUES ('10747','10745','620103','620100','七里河区','3','','','');
INSERT INTO `pa_city` VALUES ('10748','10745','620104','620100','西固区','3','','','');
INSERT INTO `pa_city` VALUES ('10749','10745','620105','620100','安宁区','3','','','');
INSERT INTO `pa_city` VALUES ('10750','10745','620111','620100','红古区','3','','','');
INSERT INTO `pa_city` VALUES ('10751','10745','620121','620100','永登县','3','','','');
INSERT INTO `pa_city` VALUES ('10752','10745','620122','620100','皋兰县','3','','','');
INSERT INTO `pa_city` VALUES ('10753','10745','620123','620100','榆中县','3','','','');
INSERT INTO `pa_city` VALUES ('10754','10745','620124','620100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10755','10744','620200','620000','嘉峪关市','2','','','');
INSERT INTO `pa_city` VALUES ('10756','10744','620300','620000','金昌市','2','','','');
INSERT INTO `pa_city` VALUES ('10757','10756','620302','620300','金川区','3','','','');
INSERT INTO `pa_city` VALUES ('10758','10756','620321','620300','永昌县','3','','','');
INSERT INTO `pa_city` VALUES ('10759','10756','620322','620300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10760','10744','620400','620000','白银市','2','','','');
INSERT INTO `pa_city` VALUES ('10761','10760','620402','620400','白银区','3','','','');
INSERT INTO `pa_city` VALUES ('10762','10760','620403','620400','平川区','3','','','');
INSERT INTO `pa_city` VALUES ('10763','10760','620421','620400','靖远县','3','','','');
INSERT INTO `pa_city` VALUES ('10764','10760','620422','620400','会宁县','3','','','');
INSERT INTO `pa_city` VALUES ('10765','10760','620423','620400','景泰县','3','','','');
INSERT INTO `pa_city` VALUES ('10766','10760','620424','620400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10767','10744','620500','620000','天水市','2','','','');
INSERT INTO `pa_city` VALUES ('10768','10767','620502','620500','秦州区','3','','','');
INSERT INTO `pa_city` VALUES ('10769','10767','620503','620500','麦积区','3','','','');
INSERT INTO `pa_city` VALUES ('10770','10767','620521','620500','清水县','3','','','');
INSERT INTO `pa_city` VALUES ('10771','10767','620522','620500','秦安县','3','','','');
INSERT INTO `pa_city` VALUES ('10772','10767','620523','620500','甘谷县','3','','','');
INSERT INTO `pa_city` VALUES ('10773','10767','620524','620500','武山县','3','','','');
INSERT INTO `pa_city` VALUES ('10774','10767','620525','620500','张家川回族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10775','10767','620526','620500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10776','10744','620600','620000','武威市','2','','','');
INSERT INTO `pa_city` VALUES ('10777','10776','620602','620600','凉州区','3','','','');
INSERT INTO `pa_city` VALUES ('10778','10776','620621','620600','民勤县','3','','','');
INSERT INTO `pa_city` VALUES ('10779','10776','620622','620600','古浪县','3','','','');
INSERT INTO `pa_city` VALUES ('10780','10776','620623','620600','天祝藏族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10781','10776','620624','620600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10782','10744','620700','620000','张掖市','2','','','');
INSERT INTO `pa_city` VALUES ('10783','10782','620702','620700','甘州区','3','','','');
INSERT INTO `pa_city` VALUES ('10784','10782','620721','620700','肃南裕固族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10785','10782','620722','620700','民乐县','3','','','');
INSERT INTO `pa_city` VALUES ('10786','10782','620723','620700','临泽县','3','','','');
INSERT INTO `pa_city` VALUES ('10787','10782','620724','620700','高台县','3','','','');
INSERT INTO `pa_city` VALUES ('10788','10782','620725','620700','山丹县','3','','','');
INSERT INTO `pa_city` VALUES ('10789','10782','620726','620700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10790','10744','620800','620000','平凉市','2','','','');
INSERT INTO `pa_city` VALUES ('10791','10790','620802','620800','崆峒区','3','','','');
INSERT INTO `pa_city` VALUES ('10792','10790','620821','620800','泾川县','3','','','');
INSERT INTO `pa_city` VALUES ('10793','10790','620822','620800','灵台县','3','','','');
INSERT INTO `pa_city` VALUES ('10794','10790','620823','620800','崇信县','3','','','');
INSERT INTO `pa_city` VALUES ('10795','10790','620824','620800','华亭县','3','','','');
INSERT INTO `pa_city` VALUES ('10796','10790','620825','620800','庄浪县','3','','','');
INSERT INTO `pa_city` VALUES ('10797','10790','620826','620800','静宁县','3','','','');
INSERT INTO `pa_city` VALUES ('10798','10790','620827','620800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10799','10744','620900','620000','酒泉市','2','','','');
INSERT INTO `pa_city` VALUES ('10800','10799','620902','620900','肃州区','3','','','');
INSERT INTO `pa_city` VALUES ('10801','10799','620921','620900','金塔县','3','','','');
INSERT INTO `pa_city` VALUES ('10802','10799','620922','620900','安西县','3','','','');
INSERT INTO `pa_city` VALUES ('10803','10799','620923','620900','肃北蒙古族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10804','10799','620924','620900','阿克塞哈萨克族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10805','10799','620981','620900','玉门市','3','','','');
INSERT INTO `pa_city` VALUES ('10806','10799','620982','620900','敦煌市','3','','','');
INSERT INTO `pa_city` VALUES ('10807','10799','620983','620900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10808','10744','621000','620000','庆阳市','2','','','');
INSERT INTO `pa_city` VALUES ('10809','10808','621002','621000','西峰区','3','','','');
INSERT INTO `pa_city` VALUES ('10810','10808','621021','621000','庆城县','3','','','');
INSERT INTO `pa_city` VALUES ('10811','10808','621022','621000','环县','3','','','');
INSERT INTO `pa_city` VALUES ('10812','10808','621023','621000','华池县','3','','','');
INSERT INTO `pa_city` VALUES ('10813','10808','621024','621000','合水县','3','','','');
INSERT INTO `pa_city` VALUES ('10814','10808','621025','621000','正宁县','3','','','');
INSERT INTO `pa_city` VALUES ('10815','10808','621026','621000','宁县','3','','','');
INSERT INTO `pa_city` VALUES ('10816','10808','621027','621000','镇原县','3','','','');
INSERT INTO `pa_city` VALUES ('10817','10808','621028','621000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10818','10744','621100','620000','定西市','2','','','');
INSERT INTO `pa_city` VALUES ('10819','10818','621102','621100','安定区','3','','','');
INSERT INTO `pa_city` VALUES ('10820','10818','621121','621100','通渭县','3','','','');
INSERT INTO `pa_city` VALUES ('10821','10818','621122','621100','陇西县','3','','','');
INSERT INTO `pa_city` VALUES ('10822','10818','621123','621100','渭源县','3','','','');
INSERT INTO `pa_city` VALUES ('10823','10818','621124','621100','临洮县','3','','','');
INSERT INTO `pa_city` VALUES ('10824','10818','621125','621100','漳县','3','','','');
INSERT INTO `pa_city` VALUES ('10825','10818','621126','621100','岷县','3','','','');
INSERT INTO `pa_city` VALUES ('10826','10818','621127','621100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10827','10744','621200','620000','陇南市','2','','','');
INSERT INTO `pa_city` VALUES ('10828','10827','621202','621200','武都区','3','','','');
INSERT INTO `pa_city` VALUES ('10829','10827','621221','621200','成县','3','','','');
INSERT INTO `pa_city` VALUES ('10830','10827','621222','621200','文县','3','','','');
INSERT INTO `pa_city` VALUES ('10831','10827','621223','621200','宕昌县','3','','','');
INSERT INTO `pa_city` VALUES ('10832','10827','621224','621200','康县','3','','','');
INSERT INTO `pa_city` VALUES ('10833','10827','621225','621200','西和县','3','','','');
INSERT INTO `pa_city` VALUES ('10834','10827','621226','621200','礼县','3','','','');
INSERT INTO `pa_city` VALUES ('10835','10827','621227','621200','徽县','3','','','');
INSERT INTO `pa_city` VALUES ('10836','10827','621228','621200','两当县','3','','','');
INSERT INTO `pa_city` VALUES ('10837','10827','621229','621200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10838','10744','622900','620000','临夏回族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10839','10838','622901','622900','临夏市','3','','','');
INSERT INTO `pa_city` VALUES ('10840','10838','622921','622900','临夏县','3','','','');
INSERT INTO `pa_city` VALUES ('10841','10838','622922','622900','康乐县','3','','','');
INSERT INTO `pa_city` VALUES ('10842','10838','622923','622900','永靖县','3','','','');
INSERT INTO `pa_city` VALUES ('10843','10838','622924','622900','广河县','3','','','');
INSERT INTO `pa_city` VALUES ('10844','10838','622925','622900','和政县','3','','','');
INSERT INTO `pa_city` VALUES ('10845','10838','622926','622900','东乡族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10846','10838','622927','622900','积石山保安族东乡族撒拉族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10847','10838','622928','622900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10848','10744','623000','620000','甘南藏族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10849','10848','623001','623000','合作市','3','','','');
INSERT INTO `pa_city` VALUES ('10850','10848','623021','623000','临潭县','3','','','');
INSERT INTO `pa_city` VALUES ('10851','10848','623022','623000','卓尼县','3','','','');
INSERT INTO `pa_city` VALUES ('10852','10848','623023','623000','舟曲县','3','','','');
INSERT INTO `pa_city` VALUES ('10853','10848','623024','623000','迭部县','3','','','');
INSERT INTO `pa_city` VALUES ('10854','10848','623025','623000','玛曲县','3','','','');
INSERT INTO `pa_city` VALUES ('10855','10848','623026','623000','碌曲县','3','','','');
INSERT INTO `pa_city` VALUES ('10856','10848','623027','623000','夏河县','3','','','');
INSERT INTO `pa_city` VALUES ('10857','10848','623028','623000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10858','7459','630000','1','青海省','1','','','');
INSERT INTO `pa_city` VALUES ('10859','10858','630100','630000','西宁市','2','','','');
INSERT INTO `pa_city` VALUES ('10860','10859','630102','630100','城东区','3','','','');
INSERT INTO `pa_city` VALUES ('10861','10859','630103','630100','城中区','3','','','');
INSERT INTO `pa_city` VALUES ('10862','10859','630104','630100','城西区','3','','','');
INSERT INTO `pa_city` VALUES ('10863','10859','630105','630100','城北区','3','','','');
INSERT INTO `pa_city` VALUES ('10864','10859','630121','630100','大通回族土族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10865','10859','630122','630100','湟中县','3','','','');
INSERT INTO `pa_city` VALUES ('10866','10859','630123','630100','湟源县','3','','','');
INSERT INTO `pa_city` VALUES ('10867','10859','630124','630100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10868','10858','632100','630000','海东地区','2','','','');
INSERT INTO `pa_city` VALUES ('10869','10868','632121','632100','平安县','3','','','');
INSERT INTO `pa_city` VALUES ('10870','10868','632122','632100','民和回族土族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10871','10868','632123','632100','乐都县','3','','','');
INSERT INTO `pa_city` VALUES ('10872','10868','632126','632100','互助土族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10873','10868','632127','632100','化隆回族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10874','10868','632128','632100','循化撒拉族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10875','10868','632129','632100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10876','10858','632200','630000','海北藏族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10877','10876','632221','632200','门源回族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10878','10876','632222','632200','祁连县','3','','','');
INSERT INTO `pa_city` VALUES ('10879','10876','632223','632200','海晏县','3','','','');
INSERT INTO `pa_city` VALUES ('10880','10876','632224','632200','刚察县','3','','','');
INSERT INTO `pa_city` VALUES ('10881','10876','632225','632200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10882','10858','632300','630000','黄南藏族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10883','10882','632321','632300','同仁县','3','','','');
INSERT INTO `pa_city` VALUES ('10884','10882','632322','632300','尖扎县','3','','','');
INSERT INTO `pa_city` VALUES ('10885','10882','632323','632300','泽库县','3','','','');
INSERT INTO `pa_city` VALUES ('10886','10882','632324','632300','河南蒙古族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10887','10882','632325','632300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10888','10858','632500','630000','海南藏族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10889','10888','632521','632500','共和县','3','','','');
INSERT INTO `pa_city` VALUES ('10890','10888','632522','632500','同德县','3','','','');
INSERT INTO `pa_city` VALUES ('10891','10888','632523','632500','贵德县','3','','','');
INSERT INTO `pa_city` VALUES ('10892','10888','632524','632500','兴海县','3','','','');
INSERT INTO `pa_city` VALUES ('10893','10888','632525','632500','贵南县','3','','','');
INSERT INTO `pa_city` VALUES ('10894','10888','632526','632500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10895','10858','632600','630000','果洛藏族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10896','10895','632621','632600','玛沁县','3','','','');
INSERT INTO `pa_city` VALUES ('10897','10895','632622','632600','班玛县','3','','','');
INSERT INTO `pa_city` VALUES ('10898','10895','632623','632600','甘德县','3','','','');
INSERT INTO `pa_city` VALUES ('10899','10895','632624','632600','达日县','3','','','');
INSERT INTO `pa_city` VALUES ('10900','10895','632625','632600','久治县','3','','','');
INSERT INTO `pa_city` VALUES ('10901','10895','632626','632600','玛多县','3','','','');
INSERT INTO `pa_city` VALUES ('10902','10895','632627','632600','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10903','10858','632700','630000','玉树藏族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10904','10903','632721','632700','玉树县','3','','','');
INSERT INTO `pa_city` VALUES ('10905','10903','632722','632700','杂多县','3','','','');
INSERT INTO `pa_city` VALUES ('10906','10903','632723','632700','称多县','3','','','');
INSERT INTO `pa_city` VALUES ('10907','10903','632724','632700','治多县','3','','','');
INSERT INTO `pa_city` VALUES ('10908','10903','632725','632700','囊谦县','3','','','');
INSERT INTO `pa_city` VALUES ('10909','10903','632726','632700','曲麻莱县','3','','','');
INSERT INTO `pa_city` VALUES ('10910','10903','632727','632700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10911','10858','632800','630000','海西蒙古族藏族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10912','10911','632801','632800','格尔木市','3','','','');
INSERT INTO `pa_city` VALUES ('10913','10911','632802','632800','德令哈市','3','','','');
INSERT INTO `pa_city` VALUES ('10914','10911','632821','632800','乌兰县','3','','','');
INSERT INTO `pa_city` VALUES ('10915','10911','632822','632800','都兰县','3','','','');
INSERT INTO `pa_city` VALUES ('10916','10911','632823','632800','天峻县','3','','','');
INSERT INTO `pa_city` VALUES ('10917','10911','632824','632800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10918','7459','640000','1','宁夏回族自治区','1','','','');
INSERT INTO `pa_city` VALUES ('10919','10918','640100','640000','银川市','2','','','');
INSERT INTO `pa_city` VALUES ('10920','10919','640104','640100','兴庆区','3','','','');
INSERT INTO `pa_city` VALUES ('10921','10919','640105','640100','西夏区','3','','','');
INSERT INTO `pa_city` VALUES ('10922','10919','640106','640100','金凤区','3','','','');
INSERT INTO `pa_city` VALUES ('10923','10919','640121','640100','永宁县','3','','','');
INSERT INTO `pa_city` VALUES ('10924','10919','640122','640100','贺兰县','3','','','');
INSERT INTO `pa_city` VALUES ('10925','10919','640181','640100','灵武市','3','','','');
INSERT INTO `pa_city` VALUES ('10926','10919','640182','640100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10927','10918','640200','640000','石嘴山市','2','','','');
INSERT INTO `pa_city` VALUES ('10928','10927','640202','640200','大武口区','3','','','');
INSERT INTO `pa_city` VALUES ('10929','10927','640205','640200','惠农区','3','','','');
INSERT INTO `pa_city` VALUES ('10930','10927','640221','640200','平罗县','3','','','');
INSERT INTO `pa_city` VALUES ('10931','10927','640222','640200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10932','10918','640300','640000','吴忠市','2','','','');
INSERT INTO `pa_city` VALUES ('10933','10932','640302','640300','利通区','3','','','');
INSERT INTO `pa_city` VALUES ('10934','10932','640303','640300','红寺堡区','3','','','');
INSERT INTO `pa_city` VALUES ('10935','10932','640323','640300','盐池县','3','','','');
INSERT INTO `pa_city` VALUES ('10936','10932','640324','640300','同心县','3','','','');
INSERT INTO `pa_city` VALUES ('10937','10932','640381','640300','青铜峡市','3','','','');
INSERT INTO `pa_city` VALUES ('10938','10932','640382','640300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10939','10918','640400','640000','固原市','2','','','');
INSERT INTO `pa_city` VALUES ('10940','10939','640402','640400','原州区','3','','','');
INSERT INTO `pa_city` VALUES ('10941','10939','640422','640400','西吉县','3','','','');
INSERT INTO `pa_city` VALUES ('10942','10939','640423','640400','隆德县','3','','','');
INSERT INTO `pa_city` VALUES ('10943','10939','640424','640400','泾源县','3','','','');
INSERT INTO `pa_city` VALUES ('10944','10939','640425','640400','彭阳县','3','','','');
INSERT INTO `pa_city` VALUES ('10945','10939','640426','640400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10946','10918','640500','640000','中卫市','2','','','');
INSERT INTO `pa_city` VALUES ('10947','10946','640502','640500','沙坡头区','3','','','');
INSERT INTO `pa_city` VALUES ('10948','10946','640521','640500','中宁县','3','','','');
INSERT INTO `pa_city` VALUES ('10949','10946','640522','640500','海原县','3','','','');
INSERT INTO `pa_city` VALUES ('10950','10946','640523','640500','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10951','7459','650000','1','新疆维吾尔自治区','1','','','');
INSERT INTO `pa_city` VALUES ('10952','10951','650100','650000','乌鲁木齐市','2','','','');
INSERT INTO `pa_city` VALUES ('10953','10952','650102','650100','天山区','3','','','');
INSERT INTO `pa_city` VALUES ('10954','10952','650103','650100','沙依巴克区','3','','','');
INSERT INTO `pa_city` VALUES ('10955','10952','650104','650100','新市区','3','','','');
INSERT INTO `pa_city` VALUES ('10956','10952','650105','650100','水磨沟区','3','','','');
INSERT INTO `pa_city` VALUES ('10957','10952','650106','650100','头屯河区','3','','','');
INSERT INTO `pa_city` VALUES ('10958','10952','650107','650100','达坂城区','3','','','');
INSERT INTO `pa_city` VALUES ('10959','10952','650108','650100','东山区','3','','','');
INSERT INTO `pa_city` VALUES ('10960','10952','650109','650100','米东区','3','','','');
INSERT INTO `pa_city` VALUES ('10961','10952','650121','650100','乌鲁木齐县','3','','','');
INSERT INTO `pa_city` VALUES ('10962','10952','650122','650100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10963','10951','650200','650000','克拉玛依市','2','','','');
INSERT INTO `pa_city` VALUES ('10964','10963','650202','650200','独山子区','3','','','');
INSERT INTO `pa_city` VALUES ('10965','10963','650203','650200','克拉玛依区','3','','','');
INSERT INTO `pa_city` VALUES ('10966','10963','650204','650200','白碱滩区','3','','','');
INSERT INTO `pa_city` VALUES ('10967','10963','650205','650200','乌尔禾区','3','','','');
INSERT INTO `pa_city` VALUES ('10968','10963','650206','650200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10969','10951','652100','650000','吐鲁番地区','2','','','');
INSERT INTO `pa_city` VALUES ('10970','10969','652101','652100','吐鲁番市','3','','','');
INSERT INTO `pa_city` VALUES ('10971','10969','652122','652100','鄯善县','3','','','');
INSERT INTO `pa_city` VALUES ('10972','10969','652123','652100','托克逊县','3','','','');
INSERT INTO `pa_city` VALUES ('10973','10969','652124','652100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10974','10951','652200','650000','哈密地区','2','','','');
INSERT INTO `pa_city` VALUES ('10975','10974','652201','652200','哈密市','3','','','');
INSERT INTO `pa_city` VALUES ('10976','10974','652222','652200','巴里坤哈萨克自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10977','10974','652223','652200','伊吾县','3','','','');
INSERT INTO `pa_city` VALUES ('10978','10974','652224','652200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10979','10951','652300','650000','昌吉回族自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10980','10979','652301','652300','昌吉市','3','','','');
INSERT INTO `pa_city` VALUES ('10981','10979','652302','652300','阜康市','3','','','');
INSERT INTO `pa_city` VALUES ('10982','10979','652303','652300','米泉市','3','','','');
INSERT INTO `pa_city` VALUES ('10983','10979','652323','652300','呼图壁县','3','','','');
INSERT INTO `pa_city` VALUES ('10984','10979','652324','652300','玛纳斯县','3','','','');
INSERT INTO `pa_city` VALUES ('10985','10979','652325','652300','奇台县','3','','','');
INSERT INTO `pa_city` VALUES ('10986','10979','652327','652300','吉木萨尔县','3','','','');
INSERT INTO `pa_city` VALUES ('10987','10979','652328','652300','木垒哈萨克自治县','3','','','');
INSERT INTO `pa_city` VALUES ('10988','10979','652329','652300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10989','10951','652700','650000','博尔塔拉蒙古自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10990','10989','652701','652700','博乐市','3','','','');
INSERT INTO `pa_city` VALUES ('10991','10989','652722','652700','精河县','3','','','');
INSERT INTO `pa_city` VALUES ('10992','10989','652723','652700','温泉县','3','','','');
INSERT INTO `pa_city` VALUES ('10993','10989','652724','652700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('10994','10951','652800','650000','巴音郭楞蒙古自治州','2','','','');
INSERT INTO `pa_city` VALUES ('10995','10994','652801','652800','库尔勒市','3','','','');
INSERT INTO `pa_city` VALUES ('10996','10994','652822','652800','轮台县','3','','','');
INSERT INTO `pa_city` VALUES ('10997','10994','652823','652800','尉犁县','3','','','');
INSERT INTO `pa_city` VALUES ('10998','10994','652824','652800','若羌县','3','','','');
INSERT INTO `pa_city` VALUES ('10999','10994','652825','652800','且末县','3','','','');
INSERT INTO `pa_city` VALUES ('11000','10994','652826','652800','焉耆回族自治县','3','','','');
INSERT INTO `pa_city` VALUES ('11001','10994','652827','652800','和静县','3','','','');
INSERT INTO `pa_city` VALUES ('11002','10994','652828','652800','和硕县','3','','','');
INSERT INTO `pa_city` VALUES ('11003','10994','652829','652800','博湖县','3','','','');
INSERT INTO `pa_city` VALUES ('11004','10994','652830','652800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11005','10951','652900','650000','阿克苏地区','2','','','');
INSERT INTO `pa_city` VALUES ('11006','11005','652901','652900','阿克苏市','3','','','');
INSERT INTO `pa_city` VALUES ('11007','11005','652922','652900','温宿县','3','','','');
INSERT INTO `pa_city` VALUES ('11008','11005','652923','652900','库车县','3','','','');
INSERT INTO `pa_city` VALUES ('11009','11005','652924','652900','沙雅县','3','','','');
INSERT INTO `pa_city` VALUES ('11010','11005','652925','652900','新和县','3','','','');
INSERT INTO `pa_city` VALUES ('11011','11005','652926','652900','拜城县','3','','','');
INSERT INTO `pa_city` VALUES ('11012','11005','652927','652900','乌什县','3','','','');
INSERT INTO `pa_city` VALUES ('11013','11005','652928','652900','阿瓦提县','3','','','');
INSERT INTO `pa_city` VALUES ('11014','11005','652929','652900','柯坪县','3','','','');
INSERT INTO `pa_city` VALUES ('11015','11005','652930','652900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11016','10951','653000','650000','克孜勒苏柯尔克孜自治州','2','','','');
INSERT INTO `pa_city` VALUES ('11017','11016','653001','653000','阿图什市','3','','','');
INSERT INTO `pa_city` VALUES ('11018','11016','653022','653000','阿克陶县','3','','','');
INSERT INTO `pa_city` VALUES ('11019','11016','653023','653000','阿合奇县','3','','','');
INSERT INTO `pa_city` VALUES ('11020','11016','653024','653000','乌恰县','3','','','');
INSERT INTO `pa_city` VALUES ('11021','11016','653025','653000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11022','10951','653100','650000','喀什地区','2','','','');
INSERT INTO `pa_city` VALUES ('11023','11022','653101','653100','喀什市','3','','','');
INSERT INTO `pa_city` VALUES ('11024','11022','653121','653100','疏附县','3','','','');
INSERT INTO `pa_city` VALUES ('11025','11022','653122','653100','疏勒县','3','','','');
INSERT INTO `pa_city` VALUES ('11026','11022','653123','653100','英吉沙县','3','','','');
INSERT INTO `pa_city` VALUES ('11027','11022','653124','653100','泽普县','3','','','');
INSERT INTO `pa_city` VALUES ('11028','11022','653125','653100','莎车县','3','','','');
INSERT INTO `pa_city` VALUES ('11029','11022','653126','653100','叶城县','3','','','');
INSERT INTO `pa_city` VALUES ('11030','11022','653127','653100','麦盖提县','3','','','');
INSERT INTO `pa_city` VALUES ('11031','11022','653128','653100','岳普湖县','3','','','');
INSERT INTO `pa_city` VALUES ('11032','11022','653129','653100','伽师县','3','','','');
INSERT INTO `pa_city` VALUES ('11033','11022','653130','653100','巴楚县','3','','','');
INSERT INTO `pa_city` VALUES ('11034','11022','653131','653100','塔什库尔干塔吉克自治县','3','','','');
INSERT INTO `pa_city` VALUES ('11035','11022','653132','653100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11036','10951','653200','650000','和田地区','2','','','');
INSERT INTO `pa_city` VALUES ('11037','11036','653201','653200','和田市','3','','','');
INSERT INTO `pa_city` VALUES ('11038','11036','653221','653200','和田县','3','','','');
INSERT INTO `pa_city` VALUES ('11039','11036','653222','653200','墨玉县','3','','','');
INSERT INTO `pa_city` VALUES ('11040','11036','653223','653200','皮山县','3','','','');
INSERT INTO `pa_city` VALUES ('11041','11036','653224','653200','洛浦县','3','','','');
INSERT INTO `pa_city` VALUES ('11042','11036','653225','653200','策勒县','3','','','');
INSERT INTO `pa_city` VALUES ('11043','11036','653226','653200','于田县','3','','','');
INSERT INTO `pa_city` VALUES ('11044','11036','653227','653200','民丰县','3','','','');
INSERT INTO `pa_city` VALUES ('11045','11036','653228','653200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11046','10951','654000','650000','伊犁哈萨克自治州','2','','','');
INSERT INTO `pa_city` VALUES ('11047','11046','654002','654000','伊宁市','3','','','');
INSERT INTO `pa_city` VALUES ('11048','11046','654003','654000','奎屯市','3','','','');
INSERT INTO `pa_city` VALUES ('11049','11046','654021','654000','伊宁县','3','','','');
INSERT INTO `pa_city` VALUES ('11050','11046','654022','654000','察布查尔锡伯自治县','3','','','');
INSERT INTO `pa_city` VALUES ('11051','11046','654023','654000','霍城县','3','','','');
INSERT INTO `pa_city` VALUES ('11052','11046','654024','654000','巩留县','3','','','');
INSERT INTO `pa_city` VALUES ('11053','11046','654025','654000','新源县','3','','','');
INSERT INTO `pa_city` VALUES ('11054','11046','654026','654000','昭苏县','3','','','');
INSERT INTO `pa_city` VALUES ('11055','11046','654027','654000','特克斯县','3','','','');
INSERT INTO `pa_city` VALUES ('11056','11046','654028','654000','尼勒克县','3','','','');
INSERT INTO `pa_city` VALUES ('11057','11046','654029','654000','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11058','10951','654200','650000','塔城地区','2','','','');
INSERT INTO `pa_city` VALUES ('11059','11058','654201','654200','塔城市','3','','','');
INSERT INTO `pa_city` VALUES ('11060','11058','654202','654200','乌苏市','3','','','');
INSERT INTO `pa_city` VALUES ('11061','11058','654221','654200','额敏县','3','','','');
INSERT INTO `pa_city` VALUES ('11062','11058','654223','654200','沙湾县','3','','','');
INSERT INTO `pa_city` VALUES ('11063','11058','654224','654200','托里县','3','','','');
INSERT INTO `pa_city` VALUES ('11064','11058','654225','654200','裕民县','3','','','');
INSERT INTO `pa_city` VALUES ('11065','11058','654226','654200','和布克赛尔蒙古自治县','3','','','');
INSERT INTO `pa_city` VALUES ('11066','11058','654227','654200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11067','10951','654300','650000','阿勒泰地区','2','','','');
INSERT INTO `pa_city` VALUES ('11068','11067','654301','654300','阿勒泰市','3','','','');
INSERT INTO `pa_city` VALUES ('11069','11067','654321','654300','布尔津县','3','','','');
INSERT INTO `pa_city` VALUES ('11070','11067','654322','654300','富蕴县','3','','','');
INSERT INTO `pa_city` VALUES ('11071','11067','654323','654300','福海县','3','','','');
INSERT INTO `pa_city` VALUES ('11072','11067','654324','654300','哈巴河县','3','','','');
INSERT INTO `pa_city` VALUES ('11073','11067','654325','654300','青河县','3','','','');
INSERT INTO `pa_city` VALUES ('11074','11067','654326','654300','吉木乃县','3','','','');
INSERT INTO `pa_city` VALUES ('11075','11067','654327','654300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11076','10951','659001','650000','石河子市','2','','','');
INSERT INTO `pa_city` VALUES ('11077','10951','659002','650000','阿拉尔市','2','','','');
INSERT INTO `pa_city` VALUES ('11078','10951','659003','650000','图木舒克市','2','','','');
INSERT INTO `pa_city` VALUES ('11079','10951','659004','650000','五家渠市','2','','','');
INSERT INTO `pa_city` VALUES ('11080','7459','710000','1','台湾省','1','','','');
INSERT INTO `pa_city` VALUES ('11081','11080','710100','710000','台北市','2','','','');
INSERT INTO `pa_city` VALUES ('11082','11081','710101','710100','中正区','3','','','');
INSERT INTO `pa_city` VALUES ('11083','11081','710102','710100','大同区','3','','','');
INSERT INTO `pa_city` VALUES ('11084','11081','710103','710100','中山区','3','','','');
INSERT INTO `pa_city` VALUES ('11085','11081','710104','710100','松山区','3','','','');
INSERT INTO `pa_city` VALUES ('11086','11081','710105','710100','大安区','3','','','');
INSERT INTO `pa_city` VALUES ('11087','11081','710106','710100','万华区','3','','','');
INSERT INTO `pa_city` VALUES ('11088','11081','710107','710100','信义区','3','','','');
INSERT INTO `pa_city` VALUES ('11089','11081','710108','710100','士林区','3','','','');
INSERT INTO `pa_city` VALUES ('11090','11081','710109','710100','北投区','3','','','');
INSERT INTO `pa_city` VALUES ('11091','11081','710110','710100','内湖区','3','','','');
INSERT INTO `pa_city` VALUES ('11092','11081','710111','710100','南港区','3','','','');
INSERT INTO `pa_city` VALUES ('11093','11081','710112','710100','文山区','3','','','');
INSERT INTO `pa_city` VALUES ('11094','11081','710113','710100','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11095','11080','710200','710000','高雄市','2','','','');
INSERT INTO `pa_city` VALUES ('11096','11095','710201','710200','新兴区','3','','','');
INSERT INTO `pa_city` VALUES ('11097','11095','710202','710200','前金区','3','','','');
INSERT INTO `pa_city` VALUES ('11098','11095','710203','710200','芩雅区','3','','','');
INSERT INTO `pa_city` VALUES ('11099','11095','710204','710200','盐埕区','3','','','');
INSERT INTO `pa_city` VALUES ('11100','11095','710205','710200','鼓山区','3','','','');
INSERT INTO `pa_city` VALUES ('11101','11095','710206','710200','旗津区','3','','','');
INSERT INTO `pa_city` VALUES ('11102','11095','710207','710200','前镇区','3','','','');
INSERT INTO `pa_city` VALUES ('11103','11095','710208','710200','三民区','3','','','');
INSERT INTO `pa_city` VALUES ('11104','11095','710209','710200','左营区','3','','','');
INSERT INTO `pa_city` VALUES ('11105','11095','710210','710200','楠梓区','3','','','');
INSERT INTO `pa_city` VALUES ('11106','11095','710211','710200','小港区','3','','','');
INSERT INTO `pa_city` VALUES ('11107','11095','710212','710200','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11108','11080','710300','710000','台南市','2','','','');
INSERT INTO `pa_city` VALUES ('11109','11108','710301','710300','中西区','3','','','');
INSERT INTO `pa_city` VALUES ('11110','11108','710302','710300','东区','3','','','');
INSERT INTO `pa_city` VALUES ('11111','11108','710303','710300','南区','3','','','');
INSERT INTO `pa_city` VALUES ('11112','11108','710304','710300','北区','3','','','');
INSERT INTO `pa_city` VALUES ('11113','11108','710305','710300','安平区','3','','','');
INSERT INTO `pa_city` VALUES ('11114','11108','710306','710300','安南区','3','','','');
INSERT INTO `pa_city` VALUES ('11115','11108','710307','710300','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11116','11080','710400','710000','台中市','2','','','');
INSERT INTO `pa_city` VALUES ('11117','11116','710401','710400','中区','3','','','');
INSERT INTO `pa_city` VALUES ('11118','11116','710402','710400','东区','3','','','');
INSERT INTO `pa_city` VALUES ('11119','11116','710403','710400','南区','3','','','');
INSERT INTO `pa_city` VALUES ('11120','11116','710404','710400','西区','3','','','');
INSERT INTO `pa_city` VALUES ('11121','11116','710405','710400','北区','3','','','');
INSERT INTO `pa_city` VALUES ('11122','11116','710406','710400','北屯区','3','','','');
INSERT INTO `pa_city` VALUES ('11123','11116','710407','710400','西屯区','3','','','');
INSERT INTO `pa_city` VALUES ('11124','11116','710408','710400','南屯区','3','','','');
INSERT INTO `pa_city` VALUES ('11125','11116','710409','710400','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11126','11080','710500','710000','金门县','2','','','');
INSERT INTO `pa_city` VALUES ('11127','11080','710600','710000','南投县','2','','','');
INSERT INTO `pa_city` VALUES ('11128','11080','710700','710000','基隆市','2','','','');
INSERT INTO `pa_city` VALUES ('11129','11128','710701','710700','仁爱区','3','','','');
INSERT INTO `pa_city` VALUES ('11130','11128','710702','710700','信义区','3','','','');
INSERT INTO `pa_city` VALUES ('11131','11128','710703','710700','中正区','3','','','');
INSERT INTO `pa_city` VALUES ('11132','11128','710704','710700','中山区','3','','','');
INSERT INTO `pa_city` VALUES ('11133','11128','710705','710700','安乐区','3','','','');
INSERT INTO `pa_city` VALUES ('11134','11128','710706','710700','暖暖区','3','','','');
INSERT INTO `pa_city` VALUES ('11135','11128','710707','710700','七堵区','3','','','');
INSERT INTO `pa_city` VALUES ('11136','11128','710708','710700','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11137','11080','710800','710000','新竹市','2','','','');
INSERT INTO `pa_city` VALUES ('11138','11137','710801','710800','东区','3','','','');
INSERT INTO `pa_city` VALUES ('11139','11137','710802','710800','北区','3','','','');
INSERT INTO `pa_city` VALUES ('11140','11137','710803','710800','香山区','3','','','');
INSERT INTO `pa_city` VALUES ('11141','11137','710804','710800','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11142','11080','710900','710000','嘉义市','2','','','');
INSERT INTO `pa_city` VALUES ('11143','11142','710901','710900','东区','3','','','');
INSERT INTO `pa_city` VALUES ('11144','11142','710902','710900','西区','3','','','');
INSERT INTO `pa_city` VALUES ('11145','11142','710903','710900','其它区','3','','','');
INSERT INTO `pa_city` VALUES ('11146','11080','711100','710000','新北市','2','','','');
INSERT INTO `pa_city` VALUES ('11147','11080','711200','710000','宜兰县','2','','','');
INSERT INTO `pa_city` VALUES ('11148','11080','711300','710000','新竹县','2','','','');
INSERT INTO `pa_city` VALUES ('11149','11080','711400','710000','桃园县','2','','','');
INSERT INTO `pa_city` VALUES ('11150','11080','711500','710000','苗栗县','2','','','');
INSERT INTO `pa_city` VALUES ('11151','11080','711600','710000','台中县','2','','','');
INSERT INTO `pa_city` VALUES ('11152','11080','711700','710000','彰化县','2','','','');
INSERT INTO `pa_city` VALUES ('11153','11080','711900','710000','嘉义县','2','','','');
INSERT INTO `pa_city` VALUES ('11154','11080','712100','710000','云林县','2','','','');
INSERT INTO `pa_city` VALUES ('11155','11080','712200','710000','台南县','2','','','');
INSERT INTO `pa_city` VALUES ('11156','11080','712300','710000','高雄县','2','','','');
INSERT INTO `pa_city` VALUES ('11157','11080','712400','710000','屏东县','2','','','');
INSERT INTO `pa_city` VALUES ('11158','11080','712500','710000','台东县','2','','','');
INSERT INTO `pa_city` VALUES ('11159','11080','712600','710000','花莲县','2','','','');
INSERT INTO `pa_city` VALUES ('11160','11080','712700','710000','澎湖县','2','','','');
INSERT INTO `pa_city` VALUES ('11161','7459','810000','1','香港特别行政区','1','','','');
INSERT INTO `pa_city` VALUES ('11162','11161','810100','810000','香港岛','2','','','');
INSERT INTO `pa_city` VALUES ('11163','11162','810101','810100','中西区','3','','','');
INSERT INTO `pa_city` VALUES ('11164','11162','810102','810100','湾仔','3','','','');
INSERT INTO `pa_city` VALUES ('11165','11162','810103','810100','东区','3','','','');
INSERT INTO `pa_city` VALUES ('11166','11162','810104','810100','南区','3','','','');
INSERT INTO `pa_city` VALUES ('11167','11161','810200','810000','九龙','2','','','');
INSERT INTO `pa_city` VALUES ('11168','11167','810201','810200','九龙城区','3','','','');
INSERT INTO `pa_city` VALUES ('11169','11167','810202','810200','油尖旺区','3','','','');
INSERT INTO `pa_city` VALUES ('11170','11167','810203','810200','深水埗区','3','','','');
INSERT INTO `pa_city` VALUES ('11171','11167','810204','810200','黄大仙区','3','','','');
INSERT INTO `pa_city` VALUES ('11172','11167','810205','810200','观塘区','3','','','');
INSERT INTO `pa_city` VALUES ('11173','11161','810300','810000','新界','2','','','');
INSERT INTO `pa_city` VALUES ('11174','11173','810301','810300','北区','3','','','');
INSERT INTO `pa_city` VALUES ('11175','11173','810302','810300','大埔区','3','','','');
INSERT INTO `pa_city` VALUES ('11176','11173','810303','810300','沙田区','3','','','');
INSERT INTO `pa_city` VALUES ('11177','11173','810304','810300','西贡区','3','','','');
INSERT INTO `pa_city` VALUES ('11178','11173','810305','810300','元朗区','3','','','');
INSERT INTO `pa_city` VALUES ('11179','11173','810306','810300','屯门区','3','','','');
INSERT INTO `pa_city` VALUES ('11180','11173','810307','810300','荃湾区','3','','','');
INSERT INTO `pa_city` VALUES ('11181','11173','810308','810300','葵青区','3','','','');
INSERT INTO `pa_city` VALUES ('11182','11173','810309','810300','离岛区','3','','','');
INSERT INTO `pa_city` VALUES ('11183','7459','820000','1','澳门特别行政区','1','','','');
INSERT INTO `pa_city` VALUES ('11184','11183','820100','820000','澳门半岛','2','','','');
INSERT INTO `pa_city` VALUES ('11185','11183','820200','820000','离岛','2','','','');


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
INSERT INTO `pa_column` VALUES ('1','综合课程','','精品课程合集','0.01','所有人','1536541212','24','100.00','现代教育,历史回顾');
INSERT INTO `pa_column` VALUES ('2','逻辑','jonasdbiv 8beqrjknoerviovoipasdvm,xcusdjklsdvjl;zxcvli;','求知求真的逻辑精神是科学精神和人文精神的基石，逻辑推理与批判性思维能力是现代人才必须具备的基本素质。本课程通过指导学生学习和研究普通逻辑学的基础知识和理论，帮助学生较系统地掌握逻辑学的基本原理和方法，','0.01','Everybody','1519893342','24','111.00','');
INSERT INTO `pa_column` VALUES ('3','西方文化通论 

','/Uploads/Iecture/2018-03-01/46075a97bb8a6e4dd.png',' “西方文化概论”是一门基础性通识课程，本课宗旨在于通过系统讲授，帮助学生把握西方文化发展演进的基本脉络和精神实质。本课程在内容上分为三个部分，第一部分为希腊罗马文化，第二部分为中世纪基督教文化，第三','0.01','Everybody','1519893386','24','111.00','');
INSERT INTO `pa_column` VALUES ('8','小鱼儿','/Uploads/Iecture/2018-03-05/5a9d0823486e9.png','小鱼儿与花无缺','20.00','18岁','1520240641','24','20.00','喜剧');
INSERT INTO `pa_column` VALUES ('9','小鱼儿','/Uploads/Iecture/2018-03-05/5a9d080276283.png','小鱼儿与花无缺','20.00','18岁','1520240642','24','20.00','喜剧');
INSERT INTO `pa_column` VALUES ('10','sss','/Uploads/Iecture/2018-03-12/5aa611d0b7fdf.jpg','sss','34.00','ss','1520832976','25','4.00','12');
INSERT INTO `pa_column` VALUES ('7','小玉老师开课啦','/Uploads/Iecture/2018-03-05/5a9cf57d9aa84.png','666666666666','10.00','1岁以下婴儿','1520235901','24','1000.00','6,7');
INSERT INTO `pa_column` VALUES ('6','uuu','/Uploads/Iecture/2018-03-05/5a9c9d07d58c3.jpg','语音','56.00','语音','1520213255','25','56.00','56');


# 数据库表：pa_comment 数据信息
INSERT INTO `pa_comment` VALUES ('1','21213','24','','','','15','','','0','0');
INSERT INTO `pa_comment` VALUES ('2','564ax','24','','','','15','','','1','0');
INSERT INTO `pa_comment` VALUES ('3','6565','24','','','','15','','','0','0');
INSERT INTO `pa_comment` VALUES ('4','aaaa','24','','','','15','','','3','0');
INSERT INTO `pa_comment` VALUES ('5','1231','24','啊啊啊啊','/Uploads/default/header.png','','17','','1520651789','0','0');


# 数据库表：pa_computing 数据信息
INSERT INTO `pa_computing` VALUES ('1','1527316410','47','sign','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('2','1527316488','50','sign','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('3','1527318107','47','dig','mineral','in','1.000');
INSERT INTO `pa_computing` VALUES ('4','1527318107','47','dig','suanli','out','1.000');
INSERT INTO `pa_computing` VALUES ('5','1527318590','50','dig','mineral','in','0.051');
INSERT INTO `pa_computing` VALUES ('6','1527318590','50','dig','suanli','out','0.051');
INSERT INTO `pa_computing` VALUES ('88','1527320825','47','buy','suanli','in','750.000');
INSERT INTO `pa_computing` VALUES ('89','1527320825','2','sale','suanli','in','150.000');
INSERT INTO `pa_computing` VALUES ('90','1527320825','47','buy','suanli','in','12500.000');
INSERT INTO `pa_computing` VALUES ('91','1527320825','2','sale','suanli','in','1500.000');
INSERT INTO `pa_computing` VALUES ('92','1527320825','47','buy','suanli','in','30000.000');
INSERT INTO `pa_computing` VALUES ('93','1527320825','2','sale','suanli','in','3000.000');
INSERT INTO `pa_computing` VALUES ('94','1527320825','47','buy','BOWT','out','5166.667');
INSERT INTO `pa_computing` VALUES ('95','1527321031','50','dig','mineral','in','0.051');
INSERT INTO `pa_computing` VALUES ('96','1527321031','50','dig','suanli','out','0.051');
INSERT INTO `pa_computing` VALUES ('97','1527321167','50','buy','suanli','in','750.000');
INSERT INTO `pa_computing` VALUES ('98','1527321167','50','buy','suanli','in','12500.000');
INSERT INTO `pa_computing` VALUES ('99','1527321167','50','buy','BOWT','out','8666.667');
INSERT INTO `pa_computing` VALUES ('100','1527470153','47','sign','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('101','1527470173','47','dig','mineral','in','0.101');
INSERT INTO `pa_computing` VALUES ('102','1527470173','47','dig','suanli','out','0.101');
INSERT INTO `pa_computing` VALUES ('103','1527471958','47','buy','suanli','in','30000.000');
INSERT INTO `pa_computing` VALUES ('104','1527471958','2','sale','suanli','in','3000.000');
INSERT INTO `pa_computing` VALUES ('105','1527471958','47','buy','suanli','in','175000.000');
INSERT INTO `pa_computing` VALUES ('106','1527471958','2','sale','suanli','in','15000.000');
INSERT INTO `pa_computing` VALUES ('107','1527471958','47','buy','BOWT','out','20000.000');
INSERT INTO `pa_computing` VALUES ('108','1527472219','47','buy','suanli','in','750.000');
INSERT INTO `pa_computing` VALUES ('109','1527472219','2','sale','suanli','in','150.000');
INSERT INTO `pa_computing` VALUES ('110','1527472219','47','buy','suanli','in','4000.000');
INSERT INTO `pa_computing` VALUES ('111','1527472219','2','sale','suanli','in','600.000');
INSERT INTO `pa_computing` VALUES ('112','1527472219','47','buy','suanli','in','12500.000');
INSERT INTO `pa_computing` VALUES ('113','1527472219','2','sale','suanli','in','1500.000');
INSERT INTO `pa_computing` VALUES ('114','1527472219','47','buy','suanli','in','30000.000');
INSERT INTO `pa_computing` VALUES ('115','1527472219','2','sale','in','suanli','5000.000');
INSERT INTO `pa_computing` VALUES ('116','1527472219','47','buy','BOWT','out','9166.667');
INSERT INTO `pa_computing` VALUES ('117','1527472516','47','buy','suanli','in','750.000');
INSERT INTO `pa_computing` VALUES ('118','1527472516','2','sale','suanli','in','150.000');
INSERT INTO `pa_computing` VALUES ('119','1527472516','47','buy','BOWT','out','833.333');
INSERT INTO `pa_computing` VALUES ('120','1527472605','47','buy','suanli','in','750.000');
INSERT INTO `pa_computing` VALUES ('121','1527472605','2','sale','suanli','in','150.000');
INSERT INTO `pa_computing` VALUES ('122','1527472605','47','buy','BOWT','out','500.000');
INSERT INTO `pa_computing` VALUES ('123','1527472710','47','buy','suanli','in','750.000');
INSERT INTO `pa_computing` VALUES ('124','1527472710','2','sale','suanli','in','150.000');
INSERT INTO `pa_computing` VALUES ('125','1527472710','47','buy','BOWT','out','333.333');
INSERT INTO `pa_computing` VALUES ('126','1527478720','47','buy','suanli','in','750.000');
INSERT INTO `pa_computing` VALUES ('127','1527478720','2','sale','suanli','in','150.000');
INSERT INTO `pa_computing` VALUES ('128','1527478720','47','buy','BOWT','out','500.000');
INSERT INTO `pa_computing` VALUES ('129','1527489887','47','dig','mineral','in','0.101');
INSERT INTO `pa_computing` VALUES ('130','1527489887','47','release','suanli','out','0.101');
INSERT INTO `pa_computing` VALUES ('131','1527489904','47','dig','mineral','in','1.000');
INSERT INTO `pa_computing` VALUES ('132','1527489904','47','release','suanli','out','1.000');
INSERT INTO `pa_computing` VALUES ('133','1527489908','47','dig','mineral','in','0.101');
INSERT INTO `pa_computing` VALUES ('134','1527489908','47','release','suanli','out','0.101');
INSERT INTO `pa_computing` VALUES ('135','1527489914','47','dig','mineral','in','0.101');
INSERT INTO `pa_computing` VALUES ('136','1527489914','47','release','suanli','out','0.101');
INSERT INTO `pa_computing` VALUES ('137','1527491728','52','sign','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('138','1527491734','52','dig','mineral','in','1.000');
INSERT INTO `pa_computing` VALUES ('139','1527491734','52','release','suanli','out','1.000');
INSERT INTO `pa_computing` VALUES ('140','1527491741','52','dig','mineral','in','0.057');
INSERT INTO `pa_computing` VALUES ('141','1527491741','52','release','suanli','out','0.057');
INSERT INTO `pa_computing` VALUES ('142','1527491741','52','dig','mineral','in','0.057');
INSERT INTO `pa_computing` VALUES ('143','1527491741','52','release','suanli','out','0.057');
INSERT INTO `pa_computing` VALUES ('144','1527491742','52','dig','mineral','in','0.057');
INSERT INTO `pa_computing` VALUES ('145','1527491742','52','release','suanli','out','0.057');
INSERT INTO `pa_computing` VALUES ('146','1527491743','52','dig','mineral','in','1.000');
INSERT INTO `pa_computing` VALUES ('147','1527491743','52','release','suanli','out','1.000');
INSERT INTO `pa_computing` VALUES ('148','1527491743','52','dig','mineral','in','1.000');
INSERT INTO `pa_computing` VALUES ('149','1527491743','52','release','suanli','out','1.000');
INSERT INTO `pa_computing` VALUES ('150','1527491744','52','dig','mineral','in','1.000');
INSERT INTO `pa_computing` VALUES ('151','1527491744','52','release','suanli','out','1.000');
INSERT INTO `pa_computing` VALUES ('152','1527491745','52','dig','mineral','in','1.000');
INSERT INTO `pa_computing` VALUES ('153','1527491745','52','release','suanli','out','1.000');
INSERT INTO `pa_computing` VALUES ('154','1527491747','52','dig','mineral','in','1.000');
INSERT INTO `pa_computing` VALUES ('155','1527491747','52','release','suanli','out','1.000');
INSERT INTO `pa_computing` VALUES ('174','1527493447','24','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('175','1527493447','47','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('176','1527493447','24','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('177','1527493447','47','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('178','1527493447','51','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('188','1527493513','24','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('189','1527493513','47','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('190','1527493513','24','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('191','1527493513','47','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('192','1527493513','51','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('193','1527493790','47','dig','mineral','in','471.198');
INSERT INTO `pa_computing` VALUES ('194','1527493790','47','release','suanli','out','471.198');
INSERT INTO `pa_computing` VALUES ('195','1527493791','47','dig','mineral','in','470.727');
INSERT INTO `pa_computing` VALUES ('196','1527493791','47','release','suanli','out','470.727');
INSERT INTO `pa_computing` VALUES ('197','1527493791','47','dig','mineral','in','471.670');
INSERT INTO `pa_computing` VALUES ('198','1527493791','47','release','suanli','out','471.670');
INSERT INTO `pa_computing` VALUES ('208','1527498008','24','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('209','1527498008','47','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('210','1527498008','24','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('211','1527498008','47','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('212','1527498008','51','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('222','1527498010','24','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('223','1527498010','47','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('224','1527498010','24','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('225','1527498010','47','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('226','1527498010','51','in','','','0.000');
INSERT INTO `pa_computing` VALUES ('227','1527501195','47','dig','mineral','in','470.256');
INSERT INTO `pa_computing` VALUES ('228','1527501195','47','release','suanli','out','470.256');
INSERT INTO `pa_computing` VALUES ('229','1527501198','47','dig','mineral','in','469.786');
INSERT INTO `pa_computing` VALUES ('230','1527501198','47','release','suanli','out','469.786');
INSERT INTO `pa_computing` VALUES ('231','1527557427','47','sign','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('232','1527557543','47','dig','mineral','in','0.050');
INSERT INTO `pa_computing` VALUES ('233','1527557543','47','release','suanli','out','0.050');
INSERT INTO `pa_computing` VALUES ('234','1527557579','47','dig','mineral','in','0.051');
INSERT INTO `pa_computing` VALUES ('235','1527557579','47','release','suanli','out','0.051');
INSERT INTO `pa_computing` VALUES ('236','1527557579','47','dig','mineral','in','0.100');
INSERT INTO `pa_computing` VALUES ('237','1527557579','47','release','suanli','out','0.100');
INSERT INTO `pa_computing` VALUES ('238','1527557580','47','dig','mineral','in','0.101');
INSERT INTO `pa_computing` VALUES ('239','1527557580','47','release','suanli','out','0.101');
INSERT INTO `pa_computing` VALUES ('240','1527557580','47','dig','mineral','in','0.101');
INSERT INTO `pa_computing` VALUES ('241','1527557580','47','release','suanli','out','0.101');
INSERT INTO `pa_computing` VALUES ('242','1527557581','47','dig','mineral','in','8.108');
INSERT INTO `pa_computing` VALUES ('243','1527557581','47','release','suanli','out','8.108');
INSERT INTO `pa_computing` VALUES ('244','1527557582','47','dig','mineral','in','0.100');
INSERT INTO `pa_computing` VALUES ('245','1527557582','47','release','suanli','out','0.100');
INSERT INTO `pa_computing` VALUES ('246','1527557583','47','dig','mineral','in','8.100');
INSERT INTO `pa_computing` VALUES ('247','1527557583','47','release','suanli','out','8.100');
INSERT INTO `pa_computing` VALUES ('257','1527558160','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('258','1527558160','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('259','1527560285','47','dig','mineral','in','466.976');
INSERT INTO `pa_computing` VALUES ('260','1527560285','47','release','suanli','out','466.976');
INSERT INTO `pa_computing` VALUES ('261','1527560287','47','dig','mineral','in','10.048');
INSERT INTO `pa_computing` VALUES ('262','1527560287','47','release','suanli','out','10.048');
INSERT INTO `pa_computing` VALUES ('263','1527560287','47','dig','mineral','in','1.000');
INSERT INTO `pa_computing` VALUES ('264','1527560287','47','release','suanli','out','1.000');
INSERT INTO `pa_computing` VALUES ('265','1527560288','47','dig','mineral','in','0.101');
INSERT INTO `pa_computing` VALUES ('266','1527560288','47','release','suanli','out','0.101');
INSERT INTO `pa_computing` VALUES ('267','1527560291','47','dig','mineral','in','466.509');
INSERT INTO `pa_computing` VALUES ('268','1527560291','47','release','suanli','out','466.509');
INSERT INTO `pa_computing` VALUES ('269','1527560293','47','dig','mineral','in','467.911');
INSERT INTO `pa_computing` VALUES ('270','1527560293','47','release','suanli','out','467.911');
INSERT INTO `pa_computing` VALUES ('271','1527560293','47','dig','mineral','in','468.379');
INSERT INTO `pa_computing` VALUES ('272','1527560293','47','release','suanli','out','468.379');
INSERT INTO `pa_computing` VALUES ('282','1527560410','1','subsidy','suanli','in','0.000');
INSERT INTO `pa_computing` VALUES ('283','1527560410','2','subsidy','suanli','in','0.000');
INSERT INTO `pa_computing` VALUES ('284','1527560410','24','subsidy','suanli','in','0.000');
INSERT INTO `pa_computing` VALUES ('285','1527560410','25','subsidy','suanli','in','0.000');
INSERT INTO `pa_computing` VALUES ('286','1527560410','47','subsidy','suanli','in','0.000');
INSERT INTO `pa_computing` VALUES ('287','1527560410','50','subsidy','suanli','in','0.000');
INSERT INTO `pa_computing` VALUES ('288','1527560410','51','subsidy','suanli','in','0.000');
INSERT INTO `pa_computing` VALUES ('289','1527560410','52','subsidy','suanli','in','0.000');
INSERT INTO `pa_computing` VALUES ('290','1527560410','53','subsidy','suanli','in','0.000');
INSERT INTO `pa_computing` VALUES ('291','1527562747','52','sign','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('292','1527562760','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('293','1527562760','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('294','1527562760','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('295','1527562760','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('296','1527562761','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('297','1527562761','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('298','1527562763','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('299','1527562763','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('300','1527562763','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('301','1527562763','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('302','1527562764','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('303','1527562764','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('304','1527562764','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('305','1527562764','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('306','1527562765','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('307','1527562765','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('308','1527562768','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('309','1527562768','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('310','1527562768','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('311','1527562768','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('312','1527562769','52','dig','mineral','in','0.057');
INSERT INTO `pa_computing` VALUES ('313','1527562769','52','release','suanli','out','0.057');
INSERT INTO `pa_computing` VALUES ('314','1527562771','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('315','1527562771','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('316','1527562772','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('317','1527562772','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('318','1527563096','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('319','1527563096','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('320','1527563777','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('321','1527563777','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('322','1527563781','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('323','1527563781','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('324','1527563784','52','dig','mineral','in','0.066');
INSERT INTO `pa_computing` VALUES ('325','1527563784','52','release','suanli','out','0.066');
INSERT INTO `pa_computing` VALUES ('326','1527564066','47','dig','mineral','in','468.848');
INSERT INTO `pa_computing` VALUES ('327','1527564066','47','release','suanli','out','468.848');
INSERT INTO `pa_computing` VALUES ('328','1527564067','47','dig','mineral','in','0.100');
INSERT INTO `pa_computing` VALUES ('329','1527564067','47','release','suanli','out','0.100');
INSERT INTO `pa_computing` VALUES ('330','1527564068','47','dig','mineral','in','469.317');
INSERT INTO `pa_computing` VALUES ('331','1527564068','47','release','suanli','out','469.317');
INSERT INTO `pa_computing` VALUES ('332','1527564069','47','dig','mineral','in','465.576');
INSERT INTO `pa_computing` VALUES ('333','1527564069','47','release','suanli','out','465.576');
INSERT INTO `pa_computing` VALUES ('334','1527564071','47','dig','mineral','in','0.000');
INSERT INTO `pa_computing` VALUES ('335','1527564071','47','release','suanli','out','0.000');
INSERT INTO `pa_computing` VALUES ('361','1527565079','47','record','B.O.W','in','100.000');
INSERT INTO `pa_computing` VALUES ('362','1527572305','47','dig','mineral','in','467.443');
INSERT INTO `pa_computing` VALUES ('363','1527572305','47','release','suanli','out','467.443');
INSERT INTO `pa_computing` VALUES ('364','1527572305','47','dig','mineral','in','465.110');
INSERT INTO `pa_computing` VALUES ('365','1527572305','47','release','suanli','out','465.110');
INSERT INTO `pa_computing` VALUES ('366','1527572306','47','dig','mineral','in','466.042');
INSERT INTO `pa_computing` VALUES ('367','1527572306','47','release','suanli','out','466.042');
INSERT INTO `pa_computing` VALUES ('368','1527572310','47','dig','mineral','in','464.645');
INSERT INTO `pa_computing` VALUES ('369','1527572310','47','release','suanli','out','464.645');
INSERT INTO `pa_computing` VALUES ('370','1527572311','47','dig','mineral','in','464.180');
INSERT INTO `pa_computing` VALUES ('371','1527572311','47','release','suanli','out','464.180');
INSERT INTO `pa_computing` VALUES ('435','1527575112','47','dig','mineral','in','46.140');
INSERT INTO `pa_computing` VALUES ('436','1527575112','47','release','suanli','out','46.140');
INSERT INTO `pa_computing` VALUES ('437','1527575112','47','dig','mineral','in','230.932');
INSERT INTO `pa_computing` VALUES ('438','1527575112','47','release','suanli','out','230.932');
INSERT INTO `pa_computing` VALUES ('439','1527575115','47','dig','mineral','in','69.280');
INSERT INTO `pa_computing` VALUES ('440','1527575115','47','release','suanli','out','69.280');
INSERT INTO `pa_computing` VALUES ('441','1527575118','47','dig','mineral','in','46.186');
INSERT INTO `pa_computing` VALUES ('442','1527575118','47','release','suanli','out','46.186');
INSERT INTO `pa_computing` VALUES ('443','1527575119','47','dig','mineral','in','230.701');
INSERT INTO `pa_computing` VALUES ('444','1527575119','47','release','suanli','out','230.701');
INSERT INTO `pa_computing` VALUES ('445','1527575121','47','dig','mineral','in','92.188');
INSERT INTO `pa_computing` VALUES ('446','1527575121','47','release','suanli','out','92.188');
INSERT INTO `pa_computing` VALUES ('447','1527575123','47','dig','mineral','in','46.233');
INSERT INTO `pa_computing` VALUES ('448','1527575123','47','release','suanli','out','46.233');
INSERT INTO `pa_computing` VALUES ('449','1527575124','47','dig','mineral','in','69.141');
INSERT INTO `pa_computing` VALUES ('450','1527575124','47','release','suanli','out','69.141');
INSERT INTO `pa_computing` VALUES ('451','1527575124','47','dig','mineral','in','69.072');
INSERT INTO `pa_computing` VALUES ('452','1527575124','47','release','suanli','out','69.072');
INSERT INTO `pa_computing` VALUES ('453','1527575125','47','dig','mineral','in','230.240');
INSERT INTO `pa_computing` VALUES ('454','1527575125','47','release','suanli','out','230.240');
INSERT INTO `pa_computing` VALUES ('455','1527575126','47','dig','mineral','in','92.280');
INSERT INTO `pa_computing` VALUES ('456','1527575126','47','release','suanli','out','92.280');
INSERT INTO `pa_computing` VALUES ('457','1527575128','47','dig','mineral','in','23.047');
INSERT INTO `pa_computing` VALUES ('458','1527575128','47','release','suanli','out','23.047');
INSERT INTO `pa_computing` VALUES ('459','1527575129','47','dig','mineral','in','23.070');
INSERT INTO `pa_computing` VALUES ('460','1527575129','47','release','suanli','out','23.070');
INSERT INTO `pa_computing` VALUES ('461','1527575130','47','dig','mineral','in','92.465');
INSERT INTO `pa_computing` VALUES ('462','1527575130','47','release','suanli','out','92.465');
INSERT INTO `pa_computing` VALUES ('463','1527575131','47','dig','mineral','in','230.471');
INSERT INTO `pa_computing` VALUES ('464','1527575131','47','release','suanli','out','230.471');
INSERT INTO `pa_computing` VALUES ('465','1527575131','47','dig','mineral','in','46.094');
INSERT INTO `pa_computing` VALUES ('466','1527575131','47','release','suanli','out','46.094');
INSERT INTO `pa_computing` VALUES ('467','1527575132','47','dig','mineral','in','23.024');
INSERT INTO `pa_computing` VALUES ('468','1527575132','47','release','suanli','out','23.024');
INSERT INTO `pa_computing` VALUES ('469','1527575133','47','dig','mineral','in','92.373');
INSERT INTO `pa_computing` VALUES ('470','1527575133','47','release','suanli','out','92.373');
INSERT INTO `pa_computing` VALUES ('471','1527575136','47','dig','mineral','in','23.116');
INSERT INTO `pa_computing` VALUES ('472','1527575136','47','release','suanli','out','23.116');
INSERT INTO `pa_computing` VALUES ('473','1527575136','47','dig','mineral','in','231.163');
INSERT INTO `pa_computing` VALUES ('474','1527575136','47','release','suanli','out','231.163');
INSERT INTO `pa_computing` VALUES ('475','1527575138','47','dig','mineral','in','46.048');
INSERT INTO `pa_computing` VALUES ('476','1527575138','47','release','suanli','out','46.048');
INSERT INTO `pa_computing` VALUES ('477','1527575139','47','dig','mineral','in','69.349');
INSERT INTO `pa_computing` VALUES ('478','1527575139','47','release','suanli','out','69.349');
INSERT INTO `pa_computing` VALUES ('479','1527575143','47','dig','mineral','in','23.093');
INSERT INTO `pa_computing` VALUES ('480','1527575143','47','release','suanli','out','23.093');
INSERT INTO `pa_computing` VALUES ('481','1527575154','47','dig','mineral','in','69.210');
INSERT INTO `pa_computing` VALUES ('482','1527575154','47','release','suanli','out','69.210');
INSERT INTO `pa_computing` VALUES ('483','1527575157','47','dig','mineral','in','92.096');
INSERT INTO `pa_computing` VALUES ('484','1527575157','47','release','suanli','out','92.096');
INSERT INTO `pa_computing` VALUES ('569','1527578049','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('570','1527578049','47','release','suanli','out','0.392');
INSERT INTO `pa_computing` VALUES ('571','1527578049','50','release','suanli','out','22.932');
INSERT INTO `pa_computing` VALUES ('572','1527578049','52','release','suanli','out','11.744');
INSERT INTO `pa_computing` VALUES ('594','1527578166','47','dig','R币','in','22.932');
INSERT INTO `pa_computing` VALUES ('595','1527578167','47','dig','BTC','in','91.728');
INSERT INTO `pa_computing` VALUES ('596','1527578168','47','dig','B.O.W','in','229.321');
INSERT INTO `pa_computing` VALUES ('597','1527578169','47','dig','B.O.W','in','68.796');
INSERT INTO `pa_computing` VALUES ('598','1527578173','47','dig','Litecoin','in','45.864');
INSERT INTO `pa_computing` VALUES ('599','1527581665','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('600','1527581665','47','release','suanli','out','0.392');
INSERT INTO `pa_computing` VALUES ('601','1527581665','50','release','suanli','out','22.909');
INSERT INTO `pa_computing` VALUES ('602','1527581665','52','release','suanli','out','11.732');
INSERT INTO `pa_computing` VALUES ('624','1527583246','47','dig','Litecoin','in','45.818');
INSERT INTO `pa_computing` VALUES ('625','1527583250','47','dig','BTC','in','91.636');
INSERT INTO `pa_computing` VALUES ('626','1527583254','47','dig','B.O.W','in','68.727');
INSERT INTO `pa_computing` VALUES ('627','1527583255','47','dig','R币','in','22.909');
INSERT INTO `pa_computing` VALUES ('628','1527583256','47','dig','B.O.W','in','229.091');
INSERT INTO `pa_computing` VALUES ('629','1527585697','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('630','1527585697','47','release','suanli','out','0.391');
INSERT INTO `pa_computing` VALUES ('631','1527585697','50','release','suanli','out','22.886');
INSERT INTO `pa_computing` VALUES ('632','1527585697','52','release','suanli','out','11.721');
INSERT INTO `pa_computing` VALUES ('654','1527585759','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('655','1527585759','47','release','suanli','out','0.391');
INSERT INTO `pa_computing` VALUES ('656','1527585759','50','release','suanli','out','22.863');
INSERT INTO `pa_computing` VALUES ('657','1527585759','52','release','suanli','out','11.709');
INSERT INTO `pa_computing` VALUES ('658','1527585788','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('659','1527585788','47','release','suanli','out','0.391');
INSERT INTO `pa_computing` VALUES ('660','1527585788','50','release','suanli','out','22.840');
INSERT INTO `pa_computing` VALUES ('661','1527585789','52','release','suanli','out','11.697');
INSERT INTO `pa_computing` VALUES ('662','1527585798','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('663','1527585798','47','release','suanli','out','0.390');
INSERT INTO `pa_computing` VALUES ('664','1527585798','50','release','suanli','out','22.818');
INSERT INTO `pa_computing` VALUES ('665','1527585798','52','release','suanli','out','11.686');
INSERT INTO `pa_computing` VALUES ('666','1527585836','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('667','1527585836','47','release','suanli','out','0.390');
INSERT INTO `pa_computing` VALUES ('668','1527585836','50','release','suanli','out','22.795');
INSERT INTO `pa_computing` VALUES ('669','1527585836','52','release','suanli','out','11.674');
INSERT INTO `pa_computing` VALUES ('670','1527585881','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('671','1527585881','47','release','suanli','out','0.389');
INSERT INTO `pa_computing` VALUES ('672','1527585881','50','release','suanli','out','22.772');
INSERT INTO `pa_computing` VALUES ('673','1527585881','52','release','suanli','out','11.662');
INSERT INTO `pa_computing` VALUES ('674','1527586145','47','dig','R币','in','22.909');
INSERT INTO `pa_computing` VALUES ('675','1527586146','47','dig','Litecoin','in','45.772');
INSERT INTO `pa_computing` VALUES ('676','1527586146','47','dig','B.O.W','in','68.796');
INSERT INTO `pa_computing` VALUES ('677','1527586147','47','dig','BTC','in','91.545');
INSERT INTO `pa_computing` VALUES ('678','1527586147','47','dig','B.O.W','in','68.727');
INSERT INTO `pa_computing` VALUES ('679','1527586148','47','dig','B.O.W','in','229.321');
INSERT INTO `pa_computing` VALUES ('680','1527586148','47','dig','BTC','in','91.728');
INSERT INTO `pa_computing` VALUES ('681','1527586148','47','dig','B.O.W','in','68.590');
INSERT INTO `pa_computing` VALUES ('682','1527586148','47','dig','B.O.W','in','229.091');
INSERT INTO `pa_computing` VALUES ('683','1527586149','47','dig','B.O.W','in','228.176');
INSERT INTO `pa_computing` VALUES ('684','1527586149','47','dig','R币','in','22.840');
INSERT INTO `pa_computing` VALUES ('685','1527586166','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('686','1527586166','47','release','suanli','out','0.389');
INSERT INTO `pa_computing` VALUES ('687','1527586166','50','release','suanli','out','22.749');
INSERT INTO `pa_computing` VALUES ('688','1527586166','52','release','suanli','out','11.651');
INSERT INTO `pa_computing` VALUES ('689','1527586166','1','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('690','1527586166','2','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('691','1527586166','24','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('692','1527586166','25','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('693','1527586166','47','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('694','1527586166','50','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('695','1527586166','51','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('696','1527586166','52','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('697','1527586166','53','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('698','1527586166','54','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('699','1527586166','55','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('700','1527586166','56','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('701','1527586166','57','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('702','1527586166','58','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('703','1527586166','59','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('704','1527586166','60','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('705','1527586166','61','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('706','1527586166','62','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('707','1527586166','63','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('708','1527586166','64','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('709','1527586166','65','subsidy','suanli','in','405.952');
INSERT INTO `pa_computing` VALUES ('710','1527586166','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('711','1527586166','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('712','1527586346','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('713','1527586346','47','release','suanli','out','0.409');
INSERT INTO `pa_computing` VALUES ('714','1527586346','50','release','suanli','out','22.747');
INSERT INTO `pa_computing` VALUES ('715','1527586346','52','release','suanli','out','11.659');
INSERT INTO `pa_computing` VALUES ('716','1527586642','47','dig','BTC','in','91.270');
INSERT INTO `pa_computing` VALUES ('717','1527586642','47','dig','BTC','in','91.636');
INSERT INTO `pa_computing` VALUES ('718','1527586642','47','dig','B.O.W','in','68.521');
INSERT INTO `pa_computing` VALUES ('719','1527586643','47','dig','BTC','in','91.453');
INSERT INTO `pa_computing` VALUES ('720','1527586643','47','dig','B.O.W','in','68.659');
INSERT INTO `pa_computing` VALUES ('721','1527586643','47','dig','BTC','in','91.362');
INSERT INTO `pa_computing` VALUES ('722','1527586643','47','dig','Litecoin','in','45.635');
INSERT INTO `pa_computing` VALUES ('723','1527586643','47','dig','R币','in','22.749');
INSERT INTO `pa_computing` VALUES ('724','1527586643','47','dig','B.O.W','in','228.405');
INSERT INTO `pa_computing` VALUES ('725','1527586643','47','dig','B.O.W','in','228.862');
INSERT INTO `pa_computing` VALUES ('726','1527586644','47','dig','B.O.W','in','228.633');
INSERT INTO `pa_computing` VALUES ('727','1527586644','47','dig','BTC','in','91.179');
INSERT INTO `pa_computing` VALUES ('728','1527586644','47','dig','R币','in','22.818');
INSERT INTO `pa_computing` VALUES ('729','1527586645','47','dig','R币','in','22.795');
INSERT INTO `pa_computing` VALUES ('730','1527586648','47','dig','Litecoin','in','45.818');
INSERT INTO `pa_computing` VALUES ('731','1527586652','47','dig','R币','in','22.747');
INSERT INTO `pa_computing` VALUES ('732','1527586652','47','dig','Litecoin','in','45.864');
INSERT INTO `pa_computing` VALUES ('733','1527586652','47','dig','B.O.W','in','68.384');
INSERT INTO `pa_computing` VALUES ('734','1527586652','47','dig','B.O.W','in','68.316');
INSERT INTO `pa_computing` VALUES ('735','1527586652','47','dig','Litecoin','in','45.590');
INSERT INTO `pa_computing` VALUES ('736','1527586653','47','dig','R币','in','22.932');
INSERT INTO `pa_computing` VALUES ('737','1527586653','47','dig','B.O.W','in','227.493');
INSERT INTO `pa_computing` VALUES ('738','1527586657','47','dig','Litecoin','in','45.494');
INSERT INTO `pa_computing` VALUES ('739','1527586657','47','dig','B.O.W','in','227.720');
INSERT INTO `pa_computing` VALUES ('740','1527586657','47','dig','BTC','in','90.997');
INSERT INTO `pa_computing` VALUES ('741','1527586657','47','dig','Litecoin','in','45.544');
INSERT INTO `pa_computing` VALUES ('742','1527586657','47','dig','Litecoin','in','45.681');
INSERT INTO `pa_computing` VALUES ('743','1527586659','47','dig','R币','in','22.863');
INSERT INTO `pa_computing` VALUES ('744','1527586660','47','dig','BTC','in','91.088');
INSERT INTO `pa_computing` VALUES ('745','1527586660','47','dig','B.O.W','in','68.248');
INSERT INTO `pa_computing` VALUES ('746','1527586660','47','dig','B.O.W','in','227.948');
INSERT INTO `pa_computing` VALUES ('747','1527586663','47','dig','R币','in','22.886');
INSERT INTO `pa_computing` VALUES ('748','1527586665','47','dig','B.O.W','in','227.468');
INSERT INTO `pa_computing` VALUES ('749','1527586666','47','dig','BTC','in','90.987');
INSERT INTO `pa_computing` VALUES ('750','1527587020','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('751','1527587020','47','release','suanli','out','0.409');
INSERT INTO `pa_computing` VALUES ('752','1527587020','50','release','suanli','out','22.724');
INSERT INTO `pa_computing` VALUES ('753','1527587020','52','release','suanli','out','11.648');
INSERT INTO `pa_computing` VALUES ('754','1527587020','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('755','1527587020','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('756','1527587263','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('757','1527587263','47','release','suanli','out','0.408');
INSERT INTO `pa_computing` VALUES ('758','1527587264','50','release','suanli','out','22.701');
INSERT INTO `pa_computing` VALUES ('759','1527587264','52','release','suanli','out','11.636');
INSERT INTO `pa_computing` VALUES ('760','1527587264','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('761','1527587264','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('762','1527587276','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('763','1527587276','47','release','suanli','out','0.408');
INSERT INTO `pa_computing` VALUES ('764','1527587276','50','release','suanli','out','22.679');
INSERT INTO `pa_computing` VALUES ('765','1527587277','52','release','suanli','out','11.624');
INSERT INTO `pa_computing` VALUES ('766','1527587277','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('767','1527587277','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('768','1527587406','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('769','1527587406','47','release','suanli','out','0.407');
INSERT INTO `pa_computing` VALUES ('770','1527587406','50','release','suanli','out','22.656');
INSERT INTO `pa_computing` VALUES ('771','1527587406','52','release','suanli','out','11.613');
INSERT INTO `pa_computing` VALUES ('772','1527587406','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('773','1527587406','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('774','1527587463','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('775','1527587463','47','release','suanli','out','0.407');
INSERT INTO `pa_computing` VALUES ('776','1527587463','50','release','suanli','out','22.633');
INSERT INTO `pa_computing` VALUES ('777','1527587463','52','release','suanli','out','11.601');
INSERT INTO `pa_computing` VALUES ('778','1527587463','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('779','1527587463','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('780','1527587482','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('781','1527587482','47','release','suanli','out','0.407');
INSERT INTO `pa_computing` VALUES ('782','1527587482','50','release','suanli','out','22.611');
INSERT INTO `pa_computing` VALUES ('783','1527587482','52','release','suanli','out','11.589');
INSERT INTO `pa_computing` VALUES ('784','1527587482','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('785','1527587482','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('786','1527587559','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('787','1527587559','47','release','suanli','out','0.406');
INSERT INTO `pa_computing` VALUES ('788','1527587559','50','release','suanli','out','22.588');
INSERT INTO `pa_computing` VALUES ('789','1527587559','52','release','suanli','out','11.578');
INSERT INTO `pa_computing` VALUES ('790','1527587559','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('791','1527587559','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('792','1527587570','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('793','1527587570','47','release','suanli','out','0.406');
INSERT INTO `pa_computing` VALUES ('794','1527587570','50','release','suanli','out','22.565');
INSERT INTO `pa_computing` VALUES ('795','1527587570','52','release','suanli','out','11.566');
INSERT INTO `pa_computing` VALUES ('796','1527587571','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('797','1527587571','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('798','1527587630','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('799','1527587630','47','release','suanli','out','0.405');
INSERT INTO `pa_computing` VALUES ('800','1527587630','50','release','suanli','out','22.543');
INSERT INTO `pa_computing` VALUES ('801','1527587630','52','release','suanli','out','11.555');
INSERT INTO `pa_computing` VALUES ('802','1527587631','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('803','1527587631','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('804','1527587670','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('805','1527587670','47','release','suanli','out','0.405');
INSERT INTO `pa_computing` VALUES ('806','1527587670','50','release','suanli','out','22.520');
INSERT INTO `pa_computing` VALUES ('807','1527587670','52','release','suanli','out','11.543');
INSERT INTO `pa_computing` VALUES ('808','1527587671','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('809','1527587671','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('810','1527587682','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('811','1527587682','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('812','1527587684','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('813','1527587684','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('814','1527587684','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('815','1527587684','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('816','1527587685','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('817','1527587685','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('818','1527587685','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('819','1527587685','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('820','1527587685','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('821','1527587685','47','release','suanli','out','0.405');
INSERT INTO `pa_computing` VALUES ('822','1527587685','50','release','suanli','out','22.498');
INSERT INTO `pa_computing` VALUES ('823','1527587685','52','release','suanli','out','11.532');
INSERT INTO `pa_computing` VALUES ('824','1527587686','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('825','1527587686','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('826','1527587689','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('827','1527587692','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('828','1527587693','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('829','1527587693','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('830','1527587693','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('831','1527587697','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('832','1527587697','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('833','1527587697','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('834','1527587698','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('835','1527587698','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('836','1527587698','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('837','1527587699','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('838','1527587699','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('839','1527587701','52','dig','','in','0.067');
INSERT INTO `pa_computing` VALUES ('840','1527587702','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('841','1527587702','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('842','1527587704','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('843','1527587704','47','release','suanli','out','0.404');
INSERT INTO `pa_computing` VALUES ('844','1527587704','50','release','suanli','out','22.475');
INSERT INTO `pa_computing` VALUES ('845','1527587704','52','release','suanli','out','11.520');
INSERT INTO `pa_computing` VALUES ('846','1527587704','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('847','1527587704','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('848','1527587705','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('849','1527587707','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('850','1527587707','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('851','1527587712','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('852','1527587712','47','release','suanli','out','0.404');
INSERT INTO `pa_computing` VALUES ('853','1527587712','50','release','suanli','out','22.453');
INSERT INTO `pa_computing` VALUES ('854','1527587712','52','release','suanli','out','11.509');
INSERT INTO `pa_computing` VALUES ('855','1527587712','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('856','1527587712','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('857','1527587715','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('858','1527587723','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('859','1527587729','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('860','1527587731','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('861','1527587745','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('862','1527587754','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('863','1527587857','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('864','1527587857','47','release','suanli','out','0.403');
INSERT INTO `pa_computing` VALUES ('865','1527587857','50','release','suanli','out','22.430');
INSERT INTO `pa_computing` VALUES ('866','1527587857','52','release','suanli','out','11.497');
INSERT INTO `pa_computing` VALUES ('867','1527587857','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('868','1527587857','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('869','1527587865','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('870','1527587865','47','release','suanli','out','0.403');
INSERT INTO `pa_computing` VALUES ('871','1527587865','50','release','suanli','out','22.408');
INSERT INTO `pa_computing` VALUES ('872','1527587865','52','release','suanli','out','11.486');
INSERT INTO `pa_computing` VALUES ('873','1527587865','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('874','1527587865','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('875','1527587885','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('876','1527587885','47','release','suanli','out','0.403');
INSERT INTO `pa_computing` VALUES ('877','1527587885','50','release','suanli','out','22.386');
INSERT INTO `pa_computing` VALUES ('878','1527587885','52','release','suanli','out','11.474');
INSERT INTO `pa_computing` VALUES ('879','1527587886','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('880','1527587886','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('881','1527588285','52','buy','suanli','in','750.000');
INSERT INTO `pa_computing` VALUES ('882','1527588285','25','sale','suanli','in','150.000');
INSERT INTO `pa_computing` VALUES ('883','1527588285','52','buy','suanli','in','30000.000');
INSERT INTO `pa_computing` VALUES ('884','1527588285','25','sale','suanli','in','3000.000');
INSERT INTO `pa_computing` VALUES ('885','1527588285','52','buy','BOW','out','3500.000');
INSERT INTO `pa_computing` VALUES ('886','1527589207','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('887','1527589207','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('888','1527589207','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('889','1527589207','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('890','1527589207','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('891','1527589212','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('892','1527589214','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('893','1527589215','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('894','1527589216','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('895','1527589216','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('896','1527589216','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('897','1527589217','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('898','1527589217','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('899','1527589217','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('900','1527589217','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('901','1527589218','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('902','1527589218','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('903','1527589218','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('904','1527589219','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('905','1527589219','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('906','1527589220','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('907','1527589220','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('908','1527589220','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('909','1527589220','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('910','1527589221','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('911','1527589221','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('912','1527589222','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('913','1527589222','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('914','1527589222','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('915','1527589223','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('916','1527589224','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('917','1527589224','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('918','1527589224','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('919','1527589225','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('920','1527589225','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('921','1527589225','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('922','1527589228','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('923','1527589229','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('924','1527589229','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('925','1527589229','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('926','1527589229','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('927','1527589229','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('928','1527589230','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('929','1527589230','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('930','1527589230','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('931','1527589231','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('932','1527589231','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('933','1527589232','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('934','1527589233','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('935','1527589233','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('936','1527589233','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('937','1527589234','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('938','1527589234','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('939','1527589235','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('940','1527589235','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('941','1527589235','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('942','1527589236','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('943','1527589237','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('944','1527589238','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('945','1527589239','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('946','1527589239','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('947','1527589240','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('948','1527589240','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('949','1527589241','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('950','1527589241','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('951','1527589242','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('952','1527589243','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('953','1527589245','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('954','1527589246','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('955','1527589246','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('956','1527589246','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('957','1527589248','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('958','1527589250','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('959','1527589251','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('960','1527589252','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('961','1527589258','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('962','1527589260','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('963','1527589260','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('964','1527589261','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('965','1527589261','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('966','1527589261','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('967','1527589262','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('968','1527589263','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('969','1527589263','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('970','1527589264','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('971','1527589266','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('972','1527589266','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('973','1527589267','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('974','1527589268','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('975','1527589269','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('976','1527589271','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('977','1527589274','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('978','1527589281','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('979','1527589281','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('980','1527589282','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('981','1527589283','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('982','1527589283','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('983','1527589284','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('984','1527589286','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('985','1527589287','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('986','1527589287','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('987','1527589289','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('988','1527589291','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('989','1527589291','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('990','1527589294','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('991','1527589294','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('992','1527589297','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('993','1527589302','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('994','1527589306','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('995','1527589313','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('996','1527589313','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('997','1527589314','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('998','1527589314','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('999','1527589314','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('1000','1527589315','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('1001','1527589315','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('1002','1527589315','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('1003','1527589315','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('1004','1527589316','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('1005','1527589316','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('1006','1527589316','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('1007','1527589316','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('1008','1527594980','47','dig','B.O.W','in','68.240');
INSERT INTO `pa_computing` VALUES ('1009','1527594981','47','dig','B.O.W','in','68.453');
INSERT INTO `pa_computing` VALUES ('1010','1527594982','47','dig','R币','in','22.679');
INSERT INTO `pa_computing` VALUES ('1011','1527594982','47','dig','R币','in','22.772');
INSERT INTO `pa_computing` VALUES ('1012','1527594982','47','dig','Litecoin','in','45.499');
INSERT INTO `pa_computing` VALUES ('1013','1527594983','47','dig','R币','in','22.701');
INSERT INTO `pa_computing` VALUES ('1014','1527594983','47','dig','BTC','in','90.352');
INSERT INTO `pa_computing` VALUES ('1015','1527594984','47','dig','BTC','in','90.081');
INSERT INTO `pa_computing` VALUES ('1016','1527594985','47','dig','Litecoin','in','45.357');
INSERT INTO `pa_computing` VALUES ('1017','1527594986','47','dig','B.O.W','in','226.333');
INSERT INTO `pa_computing` VALUES ('1018','1527594986','47','dig','B.O.W','in','67.968');
INSERT INTO `pa_computing` VALUES ('1019','1527594987','47','dig','BTC','in','90.715');
INSERT INTO `pa_computing` VALUES ('1020','1527594987','47','dig','Litecoin','in','45.727');
INSERT INTO `pa_computing` VALUES ('1021','1527594987','47','dig','BTC','in','90.896');
INSERT INTO `pa_computing` VALUES ('1022','1527594988','47','dig','B.O.W','in','67.426');
INSERT INTO `pa_computing` VALUES ('1023','1527594988','47','dig','B.O.W','in','227.241');
INSERT INTO `pa_computing` VALUES ('1024','1527594988','47','dig','Litecoin','in','45.448');
INSERT INTO `pa_computing` VALUES ('1025','1527594988','47','dig','B.O.W','in','225.655');
INSERT INTO `pa_computing` VALUES ('1026','1527594989','47','dig','BTC','in','90.533');
INSERT INTO `pa_computing` VALUES ('1027','1527594989','47','dig','B.O.W','in','67.629');
INSERT INTO `pa_computing` VALUES ('1028','1527594990','47','dig','Litecoin','in','45.267');
INSERT INTO `pa_computing` VALUES ('1029','1527594991','47','dig','B.O.W','in','225.429');
INSERT INTO `pa_computing` VALUES ('1030','1527594991','47','dig','B.O.W','in','68.104');
INSERT INTO `pa_computing` VALUES ('1031','1527594993','47','dig','B.O.W','in','67.900');
INSERT INTO `pa_computing` VALUES ('1032','1527594994','47','dig','R币','in','22.611');
INSERT INTO `pa_computing` VALUES ('1033','1527594994','47','dig','BTC','in','89.991');
INSERT INTO `pa_computing` VALUES ('1034','1527594995','47','dig','B.O.W','in','68.036');
INSERT INTO `pa_computing` VALUES ('1035','1527594995','47','dig','R币','in','22.656');
INSERT INTO `pa_computing` VALUES ('1036','1527594995','47','dig','Litecoin','in','44.861');
INSERT INTO `pa_computing` VALUES ('1037','1527594995','47','dig','B.O.W','in','68.172');
INSERT INTO `pa_computing` VALUES ('1038','1527595001','47','dig','R币','in','22.565');
INSERT INTO `pa_computing` VALUES ('1039','1527595001','47','dig','BTC','in','90.443');
INSERT INTO `pa_computing` VALUES ('1040','1527595001','47','dig','Litecoin','in','45.221');
INSERT INTO `pa_computing` VALUES ('1041','1527595001','47','dig','R币','in','22.453');
INSERT INTO `pa_computing` VALUES ('1042','1527595002','47','dig','BTC','in','89.901');
INSERT INTO `pa_computing` VALUES ('1043','1527595002','47','dig','Litecoin','in','45.131');
INSERT INTO `pa_computing` VALUES ('1044','1527595002','47','dig','R币','in','22.543');
INSERT INTO `pa_computing` VALUES ('1045','1527595002','47','dig','B.O.W','in','67.561');
INSERT INTO `pa_computing` VALUES ('1046','1527595003','47','dig','Litecoin','in','45.403');
INSERT INTO `pa_computing` VALUES ('1047','1527595003','47','dig','Litecoin','in','45.312');
INSERT INTO `pa_computing` VALUES ('1048','1527595004','47','dig','B.O.W','in','226.560');
INSERT INTO `pa_computing` VALUES ('1049','1527595006','47','dig','B.O.W','in','224.754');
INSERT INTO `pa_computing` VALUES ('1050','1527595007','47','dig','B.O.W','in','67.696');
INSERT INTO `pa_computing` VALUES ('1051','1527595007','47','dig','B.O.W','in','226.787');
INSERT INTO `pa_computing` VALUES ('1052','1527595009','47','dig','B.O.W','in','227.014');
INSERT INTO `pa_computing` VALUES ('1053','1527595011','47','dig','BTC','in','90.805');
INSERT INTO `pa_computing` VALUES ('1054','1527595012','47','dig','B.O.W','in','67.764');
INSERT INTO `pa_computing` VALUES ('1055','1527595013','47','dig','B.O.W','in','67.224');
INSERT INTO `pa_computing` VALUES ('1056','1527595014','47','dig','R币','in','22.520');
INSERT INTO `pa_computing` VALUES ('1057','1527595015','47','dig','B.O.W','in','224.080');
INSERT INTO `pa_computing` VALUES ('1058','1527595016','47','dig','Litecoin','in','45.176');
INSERT INTO `pa_computing` VALUES ('1059','1527595016','47','dig','Litecoin','in','44.996');
INSERT INTO `pa_computing` VALUES ('1060','1527595017','47','dig','R币','in','22.588');
INSERT INTO `pa_computing` VALUES ('1061','1527595017','47','dig','BTC','in','89.811');
INSERT INTO `pa_computing` VALUES ('1062','1527595017','47','dig','B.O.W','in','224.979');
INSERT INTO `pa_computing` VALUES ('1063','1527595018','47','dig','B.O.W','in','226.107');
INSERT INTO `pa_computing` VALUES ('1064','1527595019','47','dig','B.O.W','in','67.291');
INSERT INTO `pa_computing` VALUES ('1065','1527595019','47','dig','BTC','in','89.722');
INSERT INTO `pa_computing` VALUES ('1066','1527595021','47','dig','B.O.W','in','67.157');
INSERT INTO `pa_computing` VALUES ('1067','1527595023','47','dig','B.O.W','in','224.529');
INSERT INTO `pa_computing` VALUES ('1068','1527595024','47','dig','Litecoin','in','44.816');
INSERT INTO `pa_computing` VALUES ('1069','1527595029','47','dig','R币','in','22.475');
INSERT INTO `pa_computing` VALUES ('1070','1527595030','47','dig','B.O.W','in','67.832');
INSERT INTO `pa_computing` VALUES ('1071','1527595031','47','dig','B.O.W','in','224.304');
INSERT INTO `pa_computing` VALUES ('1072','1527595031','47','dig','Litecoin','in','45.041');
INSERT INTO `pa_computing` VALUES ('1073','1527595032','47','dig','BTC','in','89.542');
INSERT INTO `pa_computing` VALUES ('1074','1527595032','47','dig','B.O.W','in','225.881');
INSERT INTO `pa_computing` VALUES ('1075','1527595033','47','dig','B.O.W','in','67.359');
INSERT INTO `pa_computing` VALUES ('1076','1527595033','47','dig','R币','in','22.386');
INSERT INTO `pa_computing` VALUES ('1077','1527595034','47','dig','Litecoin','in','44.951');
INSERT INTO `pa_computing` VALUES ('1078','1527595045','47','dig','BTC','in','90.262');
INSERT INTO `pa_computing` VALUES ('1079','1527595046','47','dig','B.O.W','in','67.494');
INSERT INTO `pa_computing` VALUES ('1080','1527595049','47','dig','B.O.W','in','225.204');
INSERT INTO `pa_computing` VALUES ('1081','1527595049','47','dig','R币','in','22.724');
INSERT INTO `pa_computing` VALUES ('1082','1527595052','47','dig','Litecoin','in','45.086');
INSERT INTO `pa_computing` VALUES ('1083','1527595052','47','dig','BTC','in','90.624');
INSERT INTO `pa_computing` VALUES ('1084','1527595052','47','dig','Litecoin','in','44.771');
INSERT INTO `pa_computing` VALUES ('1085','1527595053','47','dig','R币','in','22.633');
INSERT INTO `pa_computing` VALUES ('1086','1527595053','47','dig','R币','in','22.498');
INSERT INTO `pa_computing` VALUES ('1087','1527595058','47','dig','BTC','in','89.632');
INSERT INTO `pa_computing` VALUES ('1088','1527595060','47','dig','R币','in','22.408');
INSERT INTO `pa_computing` VALUES ('1089','1527595061','47','dig','B.O.W','in','223.856');
INSERT INTO `pa_computing` VALUES ('1090','1527595061','47','dig','BTC','in','90.172');
INSERT INTO `pa_computing` VALUES ('1091','1527595062','47','dig','R币','in','22.430');
INSERT INTO `pa_computing` VALUES ('1092','1527596662','52','buy','suanli','in','750.000');
INSERT INTO `pa_computing` VALUES ('1093','1527596662','25','sale','suanli','in','150.000');
INSERT INTO `pa_computing` VALUES ('1094','1527596662','52','buy','BOW','out','166.667');
INSERT INTO `pa_computing` VALUES ('1095','1527598976','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('1096','1527598977','47','release','suanli','out','0.402');
INSERT INTO `pa_computing` VALUES ('1097','1527598977','50','release','suanli','out','22.363');
INSERT INTO `pa_computing` VALUES ('1098','1527598977','52','release','suanli','out','11.463');
INSERT INTO `pa_computing` VALUES ('1099','1527598977','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('1100','1527598977','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('1101','1527599030','1','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('1102','1527599030','2','release','suanli','out','-19.978');
INSERT INTO `pa_computing` VALUES ('1103','1527599030','24','release','suanli','out','0.025');
INSERT INTO `pa_computing` VALUES ('1104','1527599030','25','release','suanli','out','0.402');
INSERT INTO `pa_computing` VALUES ('1105','1527599030','47','release','suanli','out','0.025');
INSERT INTO `pa_computing` VALUES ('1106','1527599030','50','release','suanli','out','22.341');
INSERT INTO `pa_computing` VALUES ('1107','1527599030','51','release','suanli','out','11.451');
INSERT INTO `pa_computing` VALUES ('1108','1527599030','52','release','suanli','out','0.023');
INSERT INTO `pa_computing` VALUES ('1109','1527599030','53','release','suanli','out','1.597');
INSERT INTO `pa_computing` VALUES ('1110','1527599030','54','release','suanli','out','0.023');
INSERT INTO `pa_computing` VALUES ('1111','1527599030','55','release','suanli','out','0.070');
INSERT INTO `pa_computing` VALUES ('1112','1527599031','56','release','suanli','out','0.070');
INSERT INTO `pa_computing` VALUES ('1113','1527599031','57','release','suanli','out','0.070');
INSERT INTO `pa_computing` VALUES ('1114','1527599031','58','release','suanli','out','0.070');
INSERT INTO `pa_computing` VALUES ('1115','1527599031','59','release','suanli','out','0.070');
INSERT INTO `pa_computing` VALUES ('1116','1527599031','60','release','suanli','out','0.070');
INSERT INTO `pa_computing` VALUES ('1117','1527599031','61','release','suanli','out','0.070');
INSERT INTO `pa_computing` VALUES ('1118','1527599031','62','release','suanli','out','0.070');
INSERT INTO `pa_computing` VALUES ('1119','1527599031','63','release','suanli','out','0.070');
INSERT INTO `pa_computing` VALUES ('1120','1527599031','64','release','suanli','out','0.070');
INSERT INTO `pa_computing` VALUES ('1121','1527599031','65','release','suanli','out','0.070');
INSERT INTO `pa_computing` VALUES ('1122','1527599031','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('1123','1527599031','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('1124','1527599690','52','dig','BTC','in','6.395');
INSERT INTO `pa_computing` VALUES ('1125','1527599692','52','dig','Litecoin','in','3.197');
INSERT INTO `pa_computing` VALUES ('1126','1527599892','52','dig','BOW','in','4.796');
INSERT INTO `pa_computing` VALUES ('1127','1527599893','52','dig','B.O.W','in','15.987');
INSERT INTO `pa_computing` VALUES ('1128','1527599894','52','dig','R币','in','1.599');
INSERT INTO `pa_computing` VALUES ('1129','1527599894','52','dig','B.O.W','in','15.971');
INSERT INTO `pa_computing` VALUES ('1130','1527599895','52','dig','BTC','in','6.388');
INSERT INTO `pa_computing` VALUES ('1131','1527599896','52','dig','R币','in','1.597');
INSERT INTO `pa_computing` VALUES ('1132','1527599896','52','dig','Litecoin','in','3.194');
INSERT INTO `pa_computing` VALUES ('1133','1527599897','52','dig','BOW','in','4.791');
INSERT INTO `pa_computing` VALUES ('1134','1527608315','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('1135','1527608316','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1136','1527608316','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1137','1527608317','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1138','1527608318','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1139','1527608318','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1140','1527608319','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1141','1527608319','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1142','1527608319','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1143','1527608320','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('1144','1527608320','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1145','1527608320','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1146','1527608320','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1147','1527608321','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1148','1527608322','52','dig','','in','0.067');
INSERT INTO `pa_computing` VALUES ('1149','1527608322','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('1150','1527608323','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('1151','1527608323','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1152','1527608323','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1153','1527608323','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1154','1527608323','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('1155','1527608324','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1156','1527608325','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('1157','1527608332','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('1158','1527608333','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1159','1527608333','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1160','1527608334','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('1161','1527608334','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1162','1527608334','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1163','1527608334','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1164','1527608335','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1165','1527608335','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('1166','1527608336','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1167','1527608336','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1168','1527608336','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('1169','1527608336','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1170','1527608337','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1171','1527608337','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1172','1527608338','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('1173','1527608338','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('1174','1527608338','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('1175','1527608355','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('1176','1527608355','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('1177','1527608356','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('1178','1527608356','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('1179','1527608357','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('1180','1527608357','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('1181','1527608357','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1182','1527608357','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1183','1527608358','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1184','1527608358','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1185','1527608359','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('1186','1527608359','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('1187','1527608359','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1188','1527608359','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1189','1527608359','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('1190','1527608359','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('1191','1527608360','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('1192','1527608360','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('1193','1527608360','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1194','1527608360','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('1195','1527608360','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('1196','1527608361','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1197','1527608361','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('1198','1527608361','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('1199','1527608362','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('1200','1527608362','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('1201','1527608362','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('1202','1527608362','52','dig','','in','0.057');
INSERT INTO `pa_computing` VALUES ('1203','1527608362','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('1204','1527608363','52','dig','','in','0.057');
INSERT INTO `pa_computing` VALUES ('1205','1527608363','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('1206','1527608363','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('1207','1527608363','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('1208','1527608364','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('1209','1527608364','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1210','1527608364','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('1211','1527608364','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1212','1527608364','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('1213','1527608365','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('1214','1527608365','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('1215','1527608365','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('1216','1527608365','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1217','1527608365','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1218','1527608366','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('1219','1527608366','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1220','1527608366','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('1221','1527608366','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('1222','1527608367','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('1223','1527608367','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1224','1527608367','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('1225','1527608367','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('1226','1527608368','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('1227','1527608368','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1228','1527608369','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1229','1527608369','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('1230','1527608369','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('1231','1527608370','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('1232','1527608370','52','dig','B.O.W','in','0.034');
INSERT INTO `pa_computing` VALUES ('1233','1527608370','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1234','1527608371','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1235','1527608371','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('1236','1527608371','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('1237','1527608371','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('1238','1527608371','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('1239','1527608372','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('1240','1527608372','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('1241','1527608372','52','dig','B.O.W','in','0.010');
INSERT INTO `pa_computing` VALUES ('1242','1527608373','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1243','1527608373','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1244','1527608374','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('1245','1527608374','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('1246','1527608374','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('1247','1527608375','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('1248','1527608375','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('1249','1527608376','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('1250','1527608376','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('1251','1527608376','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1252','1527608377','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('1253','1527608377','52','dig','Litecoin','in','0.007');
INSERT INTO `pa_computing` VALUES ('1254','1527608377','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('1255','1527608377','52','dig','BTC','in','0.095');
INSERT INTO `pa_computing` VALUES ('1256','1527608385','52','dig','Litecoin','in','0.047');
INSERT INTO `pa_computing` VALUES ('1257','1527608385','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('1258','1527608385','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('1259','1527608386','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('1260','1527608386','52','dig','BTC','in','0.013');
INSERT INTO `pa_computing` VALUES ('1261','1527608386','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('1262','1527608387','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('1263','1527608387','52','dig','B.O.W','in','0.071');
INSERT INTO `pa_computing` VALUES ('1264','1527608396','52','dig','B.O.W','in','0.237');
INSERT INTO `pa_computing` VALUES ('1265','1527608396','52','dig','R币','in','0.003');
INSERT INTO `pa_computing` VALUES ('1266','1527608397','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('1267','1527608397','52','dig','R币','in','0.024');
INSERT INTO `pa_computing` VALUES ('1268','1527643721','52','sign','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1269','1527647744','52','dig','BOW','in','4.791');
INSERT INTO `pa_computing` VALUES ('1270','1527647775','52','dig','BTC','in','6.388');
INSERT INTO `pa_computing` VALUES ('1271','1527649441','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1272','1527649445','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1273','1527650277','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1274','1527650279','52','dig','','in','0.057');
INSERT INTO `pa_computing` VALUES ('1275','1527650280','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1276','1527650280','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1277','1527650283','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1278','1527650284','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1279','1527650284','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1280','1527650285','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1281','1527650285','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1282','1527650285','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1283','1527650285','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1284','1527650285','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1285','1527650285','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1286','1527650285','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1287','1527650295','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1288','1527650548','52','dig','','in','0.057');
INSERT INTO `pa_computing` VALUES ('1289','1527650736','52','dig','','in','0.057');
INSERT INTO `pa_computing` VALUES ('1290','1527650859','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1291','1527650940','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1292','1527650980','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1293','1527651118','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1294','1527652413','52','dig','','in','0.057');
INSERT INTO `pa_computing` VALUES ('1295','1527652417','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1296','1527652419','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1297','1527652420','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1298','1527652424','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1299','1527652425','52','dig','','in','1.000');
INSERT INTO `pa_computing` VALUES ('1300','1527652425','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1301','1527652426','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1302','1527652427','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1303','1527652557','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1304','1527652567','52','dig','','in','0.066');
INSERT INTO `pa_computing` VALUES ('1305','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1306','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1307','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1308','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1309','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1310','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1311','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1312','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1313','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1314','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1315','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1316','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1317','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1318','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1319','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1320','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1321','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1322','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1323','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1324','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1325','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1326','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1327','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1328','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1329','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1330','1527658825','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1331','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1332','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1333','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1334','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1335','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1336','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1337','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1338','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1339','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1340','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1341','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1342','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1343','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1344','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1345','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1346','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1347','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1348','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1349','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1350','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1351','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1352','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1353','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1354','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1355','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1356','1527658850','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1357','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1358','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1359','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1360','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1361','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1362','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1363','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1364','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1365','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1366','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1367','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1368','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1369','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1370','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1371','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1372','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1373','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1374','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1375','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1376','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1377','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1378','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1379','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1380','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1381','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1382','1527658881','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1383','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1384','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1385','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1386','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1387','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1388','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1389','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1390','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1391','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1392','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1393','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1394','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1395','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1396','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1397','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1398','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1399','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1400','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1401','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1402','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1403','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1404','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1405','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1406','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1407','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1408','1527658906','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1409','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1410','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1411','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1412','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1413','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1414','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1415','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1416','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1417','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1418','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1419','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1420','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1421','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1422','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1423','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1424','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1425','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1426','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1427','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1428','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1429','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1430','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1431','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1432','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1433','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1434','1527658910','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1435','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1436','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1437','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1438','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1439','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1440','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1441','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1442','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1443','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1444','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1445','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1446','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1447','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1448','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1449','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1450','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1451','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1452','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1453','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1454','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1455','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1456','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1457','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1458','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1459','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1460','1527659061','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1461','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1462','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1463','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1464','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1465','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1466','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1467','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1468','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1469','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1470','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1471','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1472','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1473','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1474','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1475','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1476','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1477','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1478','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1479','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1480','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1481','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1482','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1483','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1484','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1485','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1486','1527659072','47','','','in','');
INSERT INTO `pa_computing` VALUES ('1487','1527659648','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('1488','1527659648','47','release','suanli','out','1.605');
INSERT INTO `pa_computing` VALUES ('1489','1527659648','50','release','suanli','out','89.274');
INSERT INTO `pa_computing` VALUES ('1490','1527659649','52','release','suanli','out','45.759');
INSERT INTO `pa_computing` VALUES ('1491','1527659649','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('1492','1527659649','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('1493','1527659708','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('1494','1527659708','47','release','suanli','out','1.604');
INSERT INTO `pa_computing` VALUES ('1495','1527659709','50','release','suanli','out','89.185');
INSERT INTO `pa_computing` VALUES ('1496','1527659709','52','release','suanli','out','45.713');
INSERT INTO `pa_computing` VALUES ('1497','1527659709','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('1498','1527659709','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('1499','1527660260','24','release','suanli','out','');
INSERT INTO `pa_computing` VALUES ('1500','1527660260','47','release','suanli','out','1.602');
INSERT INTO `pa_computing` VALUES ('1501','1527660260','50','release','suanli','out','89.095');
INSERT INTO `pa_computing` VALUES ('1502','1527660260','52','release','suanli','out','45.667');
INSERT INTO `pa_computing` VALUES ('1503','1527660261','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('1504','1527660261','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('1595','1527660757','47','','BOW','in','357.095');
INSERT INTO `pa_computing` VALUES ('1596','1527660757','47','','BOW','in','89.274');
INSERT INTO `pa_computing` VALUES ('1597','1527660757','47','','BOW','in','356.738');
INSERT INTO `pa_computing` VALUES ('1598','1527660757','47','','BOW','in','89.185');
INSERT INTO `pa_computing` VALUES ('1599','1527660757','47','','BOW','in','356.382');
INSERT INTO `pa_computing` VALUES ('1600','1527660757','47','','ITG','in','89.095');
INSERT INTO `pa_computing` VALUES ('1601','1527661026','52','dig','ITG','in','6.369');
INSERT INTO `pa_computing` VALUES ('1602','1527661094','24','release','suanli','out','8.002');
INSERT INTO `pa_computing` VALUES ('1603','1527661094','47','release','suanli','out','445.032');
INSERT INTO `pa_computing` VALUES ('1604','1527661094','50','release','suanli','out','228.108');
INSERT INTO `pa_computing` VALUES ('1605','1527661094','52','release','suanli','out','31.814');
INSERT INTO `pa_computing` VALUES ('1606','1527661094','24','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('1607','1527661094','47','in','suanli','','0.000');
INSERT INTO `pa_computing` VALUES ('1608','1527661115','52','dig','ITG','in','6.363');
INSERT INTO `pa_computing` VALUES ('1609','1527661114','24','release','suanli','out','7.994');
INSERT INTO `pa_computing` VALUES ('1610','1527661115','47','release','suanli','out','444.587');
INSERT INTO `pa_computing` VALUES ('1611','1527661115','50','release','suanli','out','227.880');
INSERT INTO `pa_computing` VALUES ('1612','1527661115','52','release','suanli','out','31.782');
INSERT INTO `pa_computing` VALUES ('1613','1527661128','52','','BOW','in','25.528');
INSERT INTO `pa_computing` VALUES ('1614','1527661128','52','','BOW','in','6.382');
INSERT INTO `pa_computing` VALUES ('1615','1527661128','52','','BOW','in','25.502');
INSERT INTO `pa_computing` VALUES ('1616','1527661128','52','','BOW','in','6.376');
INSERT INTO `pa_computing` VALUES ('1617','1527661128','52','','BOW','in','25.477');
INSERT INTO `pa_computing` VALUES ('1618','1527661128','52','','BOW','in','25.451');
INSERT INTO `pa_computing` VALUES ('1619','1527661128','52','','BOW','in','25.426');
INSERT INTO `pa_computing` VALUES ('1620','1527661128','52','','ITG','in','6.356');
INSERT INTO `pa_computing` VALUES ('1621','1527661419','52','dig','BOW','in','6.376');
INSERT INTO `pa_computing` VALUES ('1650','1527661650','47','','BOW','in','357.095');
INSERT INTO `pa_computing` VALUES ('1651','1527661650','47','','BOW','in','89.274');
INSERT INTO `pa_computing` VALUES ('1652','1527661650','47','','BOW','in','356.738');
INSERT INTO `pa_computing` VALUES ('1653','1527661650','47','','BOW','in','89.185');
INSERT INTO `pa_computing` VALUES ('1654','1527661650','47','','BOW','in','356.382');
INSERT INTO `pa_computing` VALUES ('1655','1527661650','47','','ITG','in','89.095');
INSERT INTO `pa_computing` VALUES ('1656','1527661650','47','','BOW','in','356.026');
INSERT INTO `pa_computing` VALUES ('1657','1527661650','47','','ITG','in','89.006');
INSERT INTO `pa_computing` VALUES ('1658','1527661650','47','','BOW','in','355.670');
INSERT INTO `pa_computing` VALUES ('1659','1527661650','47','','ITG','in','88.917');
INSERT INTO `pa_computing` VALUES ('1660','1527661671','52','dig','ITG','in','6.363');
INSERT INTO `pa_computing` VALUES ('1661','1527661676','52','dig','BOW','in','25.426');
INSERT INTO `pa_computing` VALUES ('1662','1527661685','52','','BOW','in','25.528');
INSERT INTO `pa_computing` VALUES ('1663','1527661685','52','','BOW','in','6.382');
INSERT INTO `pa_computing` VALUES ('1664','1527661685','52','','BOW','in','25.502');
INSERT INTO `pa_computing` VALUES ('1665','1527661685','52','','BOW','in','6.376');
INSERT INTO `pa_computing` VALUES ('1666','1527661685','52','','BOW','in','25.477');
INSERT INTO `pa_computing` VALUES ('1667','1527661685','52','','ITG','in','6.369');
INSERT INTO `pa_computing` VALUES ('1668','1527661685','52','','BOW','in','25.451');
INSERT INTO `pa_computing` VALUES ('1669','1527661685','52','','ITG','in','6.356');
INSERT INTO `pa_computing` VALUES ('1670','1527661987','52','dig','ITG','in','6.356');
INSERT INTO `pa_computing` VALUES ('1671','1527662009','52','dig','ITG','in','6.363');
INSERT INTO `pa_computing` VALUES ('1672','1527662033','52','dig','BOW','in','25.477');
INSERT INTO `pa_computing` VALUES ('1673','1527662051','52','','BOW','in','25.528');
INSERT INTO `pa_computing` VALUES ('1674','1527662051','52','','BOW','in','6.382');
INSERT INTO `pa_computing` VALUES ('1675','1527662051','52','','BOW','in','25.502');
INSERT INTO `pa_computing` VALUES ('1676','1527662051','52','','BOW','in','6.376');
INSERT INTO `pa_computing` VALUES ('1677','1527662051','52','','ITG','in','6.369');
INSERT INTO `pa_computing` VALUES ('1678','1527662051','52','','BOW','in','25.451');
INSERT INTO `pa_computing` VALUES ('1679','1527662051','52','','BOW','in','25.426');
INSERT INTO `pa_computing` VALUES ('1680','1527662189','52','dig','BOW','in','25.426');
INSERT INTO `pa_computing` VALUES ('1681','1527662192','52','dig','BOW','in','6.382');
INSERT INTO `pa_computing` VALUES ('1682','1527662205','52','dig','BOW','in','25.502');
INSERT INTO `pa_computing` VALUES ('1683','1527662223','52','','BOW','in','25.528');
INSERT INTO `pa_computing` VALUES ('1684','1527662223','52','','BOW','in','6.376');
INSERT INTO `pa_computing` VALUES ('1685','1527662223','52','','BOW','in','25.477');
INSERT INTO `pa_computing` VALUES ('1686','1527662223','52','','ITG','in','6.369');
INSERT INTO `pa_computing` VALUES ('1687','1527662223','52','','BOW','in','25.451');
INSERT INTO `pa_computing` VALUES ('1688','1527662223','52','','ITG','in','6.363');
INSERT INTO `pa_computing` VALUES ('1689','1527662223','52','','ITG','in','6.356');
INSERT INTO `pa_computing` VALUES ('1690','1527662466','52','dig','BOW','in','25.451');
INSERT INTO `pa_computing` VALUES ('1691','1527662480','52','dig','ITG','in','6.369');
INSERT INTO `pa_computing` VALUES ('1692','1527662743','52','','BOW','in','25.528');
INSERT INTO `pa_computing` VALUES ('1693','1527662743','52','','BOW','in','6.382');
INSERT INTO `pa_computing` VALUES ('1694','1527662743','52','','BOW','in','6.376');
INSERT INTO `pa_computing` VALUES ('1695','1527662743','52','','ITG','in','6.363');
INSERT INTO `pa_computing` VALUES ('1696','1527662743','52','','BOW','in','25.426');
INSERT INTO `pa_computing` VALUES ('1697','1527662743','52','','ITG','in','6.356');
INSERT INTO `pa_computing` VALUES ('1698','1527663946','52','','BOW','in','25.528');
INSERT INTO `pa_computing` VALUES ('1699','1527663946','52','','BOW','in','6.382');
INSERT INTO `pa_computing` VALUES ('1700','1527663946','52','','BOW','in','25.502');
INSERT INTO `pa_computing` VALUES ('1701','1527663946','52','','BOW','in','6.376');
INSERT INTO `pa_computing` VALUES ('1702','1527663946','52','','BOW','in','25.477');
INSERT INTO `pa_computing` VALUES ('1703','1527663946','52','','ITG','in','6.369');
INSERT INTO `pa_computing` VALUES ('1704','1527663946','52','','BOW','in','25.451');
INSERT INTO `pa_computing` VALUES ('1705','1527663946','52','','ITG','in','6.363');
INSERT INTO `pa_computing` VALUES ('1706','1527663946','52','','BOW','in','25.426');
INSERT INTO `pa_computing` VALUES ('1707','1527663946','52','','ITG','in','6.356');
INSERT INTO `pa_computing` VALUES ('1708','1527663996','47','','BOW','in','357.095');
INSERT INTO `pa_computing` VALUES ('1709','1527663996','47','','BOW','in','89.274');
INSERT INTO `pa_computing` VALUES ('1710','1527663996','47','','BOW','in','356.738');
INSERT INTO `pa_computing` VALUES ('1711','1527663996','47','','BOW','in','89.185');
INSERT INTO `pa_computing` VALUES ('1712','1527663996','47','','BOW','in','356.382');
INSERT INTO `pa_computing` VALUES ('1713','1527663996','47','','ITG','in','89.095');
INSERT INTO `pa_computing` VALUES ('1714','1527663996','47','','BOW','in','356.026');
INSERT INTO `pa_computing` VALUES ('1715','1527663996','47','','ITG','in','89.006');
INSERT INTO `pa_computing` VALUES ('1716','1527663996','47','','BOW','in','355.670');
INSERT INTO `pa_computing` VALUES ('1717','1527663996','47','','ITG','in','88.917');
INSERT INTO `pa_computing` VALUES ('1718','1527664064','47','','BOW','in','357.095');
INSERT INTO `pa_computing` VALUES ('1719','1527664064','47','','BOW','in','89.274');
INSERT INTO `pa_computing` VALUES ('1720','1527664064','47','','BOW','in','356.738');
INSERT INTO `pa_computing` VALUES ('1721','1527664064','47','','BOW','in','89.185');
INSERT INTO `pa_computing` VALUES ('1722','1527664064','47','','BOW','in','356.382');
INSERT INTO `pa_computing` VALUES ('1723','1527664064','47','','ITG','in','89.095');
INSERT INTO `pa_computing` VALUES ('1724','1527664064','47','','BOW','in','356.026');
INSERT INTO `pa_computing` VALUES ('1725','1527664064','47','','ITG','in','89.006');
INSERT INTO `pa_computing` VALUES ('1726','1527664064','47','','BOW','in','355.670');
INSERT INTO `pa_computing` VALUES ('1727','1527664064','47','','ITG','in','88.917');
INSERT INTO `pa_computing` VALUES ('1728','1527672726','52','buy','suanli','in','30000.000');
INSERT INTO `pa_computing` VALUES ('1729','1527672726','25','sale','suanli','in','3000.000');
INSERT INTO `pa_computing` VALUES ('1730','1527672726','52','buy','BOW','out','6666.667');
INSERT INTO `pa_computing` VALUES ('1731','1527673136','52','','BOW','in','25.528');
INSERT INTO `pa_computing` VALUES ('1732','1527673136','52','','BOW','in','6.382');
INSERT INTO `pa_computing` VALUES ('1733','1527673136','52','','BOW','in','25.502');
INSERT INTO `pa_computing` VALUES ('1734','1527673136','52','','BOW','in','6.376');
INSERT INTO `pa_computing` VALUES ('1735','1527673136','52','','BOW','in','25.477');
INSERT INTO `pa_computing` VALUES ('1736','1527673136','52','','ITG','in','6.369');
INSERT INTO `pa_computing` VALUES ('1737','1527673136','52','','BOW','in','25.451');
INSERT INTO `pa_computing` VALUES ('1738','1527673136','52','','ITG','in','6.363');
INSERT INTO `pa_computing` VALUES ('1739','1527673136','52','','BOW','in','25.426');
INSERT INTO `pa_computing` VALUES ('1740','1527673136','52','','ITG','in','6.356');
INSERT INTO `pa_computing` VALUES ('1741','1527674679','47','sign','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1742','1527729768','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1743','1527730329','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1744','1527730435','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1745','1527730768','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1746','1527730864','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1747','1527738938','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1748','1527739005','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1749','1527739196','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1750','1527739422','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1751','1527739680','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1752','1527740041','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1753','1527742364','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1754','1527742785','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1755','1527743868','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1756','1527744954','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1757','1527745148','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1758','1527745202','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1759','1527745249','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1760','1527745560','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1761','1527745572','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1762','1527745665','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1763','1527745906','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1764','1527746012','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1765','1527746191','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1766','1527746994','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1767','1527747191','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1768','1527751642','66','注册奖励','suanli','in','50.000');
INSERT INTO `pa_computing` VALUES ('1769','1527751663','66','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1770','1527752566','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1771','1527752970','66','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1772','1527754586','67','注册奖励','suanli','in','50.000');
INSERT INTO `pa_computing` VALUES ('1773','1527754627','67','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1774','1527756526','67','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1775','1527756591','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1776','1527756806','67','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1777','1527756965','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1778','1527757047','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1779','1527757175','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1780','1527757196','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1781','1527757297','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1782','1527757756','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1783','1527758978','67','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1784','1527762746','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1785','1527763109','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1786','1527763413','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1787','1527767397','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1788','1527768000','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1789','1527776143','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1790','1527779519','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1791','1527819061','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1792','1527819158','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1793','1527819528','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1794','1527822465','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1795','1527822607','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1796','1527822882','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1797','1527823109','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1798','1527823133','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1799','1527823202','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1800','1527823303','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1801','1527823470','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1802','1527823724','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1803','1527823818','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1804','1527824238','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1805','1527824246','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1806','1527824247','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1807','1527824269','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1808','1527824967','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1809','1527824994','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1810','1527824994','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1811','1527825062','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1812','1527825093','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1813','1527825094','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1814','1527825174','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1815','1527825200','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1816','1527825201','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1817','1527825309','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1818','1527825440','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1819','1527825808','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1820','1527831199','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1821','1527831296','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1822','1527831408','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1823','1527831545','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1824','1527831981','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1825','1527832431','52','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1826','1527832663','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1827','1527840828','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1828','1527840933','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1829','1527841066','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1830','1527841374','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1831','1527841447','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1832','1527841928','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1833','1527841964','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1834','1527843988','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1835','1527851987','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1836','1527905490','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1837','1527922382','47','签到','suanli','in','1.000');
INSERT INTO `pa_computing` VALUES ('1838','1528081283','47','签到','suanli','in','1.000');


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
INSERT INTO `pa_field` VALUES ('116','20','id','表主键','INT','','','0','1','1','1','1','','','both','0','','','1521180703','1521180703');
INSERT INTO `pa_field` VALUES ('117','20','created_at','创建时间','INT','','','0','0','1','1','1','','time','insert','0','','','1521180703','1521180703');
INSERT INTO `pa_field` VALUES ('118','20','updated_at','更新时间','INT','','','0','0','1','1','1','','time','both','0','','','1521180703','1521180703');


# 数据库表：pa_follow 数据信息
INSERT INTO `pa_follow` VALUES ('106','25','1','1520930656','0','');
INSERT INTO `pa_follow` VALUES ('64','51','34','1513856864','0','personal');
INSERT INTO `pa_follow` VALUES ('69','2','34','1514009364','0','personal');
INSERT INTO `pa_follow` VALUES ('105','25','2','1520930655','0','');
INSERT INTO `pa_follow` VALUES ('92','48','24','1517316878','0','');
INSERT INTO `pa_follow` VALUES ('74','2','34','1514371092','0','personal');
INSERT INTO `pa_follow` VALUES ('107','24','24','1520990125','0','');
INSERT INTO `pa_follow` VALUES ('103','25','24','1520930205','0','');
INSERT INTO `pa_follow` VALUES ('89','45','41','1516789465','0','');
INSERT INTO `pa_follow` VALUES ('108','24','9','1520990506','0','');
INSERT INTO `pa_follow` VALUES ('109','24','8','1520990511','0','');
INSERT INTO `pa_follow` VALUES ('110','24','7','1520990738','0','');
INSERT INTO `pa_follow` VALUES ('111','24','2','1521006850','0','');


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
INSERT INTO `pa_help` VALUES ('31','','','24','1519892186','false','0');
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
INSERT INTO `pa_help` VALUES ('32','','','24','1519892200','false','0');
INSERT INTO `pa_help` VALUES ('33','','','24','1519892260','鼎折覆餗','0');
INSERT INTO `pa_help` VALUES ('34','','','24','1519892326','的收费方式的但是','0');
INSERT INTO `pa_help` VALUES ('35','','','24','1519892337','三大队','0');
INSERT INTO `pa_help` VALUES ('36','','','24','1519892355','搜搜是查询','0');
INSERT INTO `pa_help` VALUES ('37','','','48','1520301278','天上飞来一块馅饼','0');
INSERT INTO `pa_help` VALUES ('38','','','48','1520301370','天上掉下来一块馅饼','0');
INSERT INTO `pa_help` VALUES ('39','','','25','1521022155','sdssd','0');
INSERT INTO `pa_help` VALUES ('40','','','25','1521022202','fdfdf','0');
INSERT INTO `pa_help` VALUES ('41','','','25','1521022228','tyhty','0');


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
INSERT INTO `pa_images` VALUES ('112','product','20180517112829_17404.jpg','/Uploads/image/product/20180517/20180517112829_17404.jpg','1526528786');
INSERT INTO `pa_images` VALUES ('121','product','20180517160136_88280.jpg','/Uploads/image/product/20180517/20180517160136_88280.jpg','1526970859');
INSERT INTO `pa_images` VALUES ('133','product','20180526081130_88917.jpg','/Uploads/image/product/20180526/20180526081130_88917.jpg','1527603640');
INSERT INTO `pa_images` VALUES ('122','product','20180517160136_88280.jpg','/Uploads/image/product/20180517/20180517160136_88280.jpg','1526970862');
INSERT INTO `pa_images` VALUES ('129','product','20180526081044_13518.jpg','/Uploads/image/product/20180526/20180526081044_13518.jpg','1527603607');
INSERT INTO `pa_images` VALUES ('130','product','20180526081057_32252.jpg','/Uploads/image/product/20180526/20180526081057_32252.jpg','1527603618');
INSERT INTO `pa_images` VALUES ('131','product','20180526081110_53525.jpg','/Uploads/image/product/20180526/20180526081110_53525.jpg','1527603627');
INSERT INTO `pa_images` VALUES ('132','product','20180526081119_87047.jpg','/Uploads/image/product/20180526/20180526081119_87047.jpg','1527603634');


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


# 数据库表：pa_livepay 数据信息


# 数据库表：pa_liveset 数据信息
INSERT INTO `pa_liveset` VALUES ('1','','10','5','50','0.00','1','0.2134000000','1','0.250','6','600000.00','4,5','20','200000.00','0.02','40','500000.00','0.02','60','1500000.00','0.02','0.30','0.50','0.050','0.050','3.00000','20.000','');


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
INSERT INTO `pa_match` VALUES ('1','达人赛','10','6000000.00','1/3','0.15');
INSERT INTO `pa_match` VALUES ('2','精英赛','20','30000000.00','1/3','0.25');
INSERT INTO `pa_match` VALUES ('3','大师赛','29','90000000.00','1/3','0.35');


# 数据库表：pa_member 数据信息


# 数据库表：pa_message 数据信息


# 数据库表：pa_mining 数据信息
INSERT INTO `pa_mining` VALUES ('1','24','1527659648','6.42080','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('2','24','1527659648','1.60520','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('3','47','1527659648','357.09520','1','1527664064','','BOW','3');
INSERT INTO `pa_mining` VALUES ('4','47','1527659648','89.27380','1','1527664064','','BOW','3');
INSERT INTO `pa_mining` VALUES ('5','50','1527659649','183.03520','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('6','50','1527659649','45.75880','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('7','52','1527659649','25.52800','1','1527673136','','BOW','3');
INSERT INTO `pa_mining` VALUES ('8','52','1527659649','6.38200','1','1527673136','','BOW','3');
INSERT INTO `pa_mining` VALUES ('9','24','1527659708','6.41440','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('10','24','1527659708','1.60360','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('11','47','1527659709','356.73840','1','1527664064','','BOW','3');
INSERT INTO `pa_mining` VALUES ('12','47','1527659709','89.18460','1','1527664064','','BOW','3');
INSERT INTO `pa_mining` VALUES ('13','50','1527659709','182.85200','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('14','50','1527659709','45.71300','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('15','52','1527659709','25.50240','1','1527673136','','BOW','3');
INSERT INTO `pa_mining` VALUES ('16','52','1527659709','6.37560','1','1527673136','','BOW','3');
INSERT INTO `pa_mining` VALUES ('17','24','1527660260','6.40800','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('18','24','1527660260','1.60200','0','','','ITG','4');
INSERT INTO `pa_mining` VALUES ('19','47','1527660260','356.38160','1','1527664064','','BOW','3');
INSERT INTO `pa_mining` VALUES ('20','47','1527660260','89.09540','1','1527664064','','ITG','4');
INSERT INTO `pa_mining` VALUES ('21','50','1527660260','182.66880','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('22','50','1527660260','45.66720','0','','','ITG','4');
INSERT INTO `pa_mining` VALUES ('23','52','1527660260','25.47680','1','1527673136','','BOW','3');
INSERT INTO `pa_mining` VALUES ('24','52','1527660260','6.36920','1','1527673136','','ITG','4');
INSERT INTO `pa_mining` VALUES ('25','24','1527661094','6.40160','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('26','24','1527661094','1.60040','0','','','ITG','4');
INSERT INTO `pa_mining` VALUES ('27','47','1527661094','356.02560','1','1527664064','','BOW','3');
INSERT INTO `pa_mining` VALUES ('28','47','1527661094','89.00640','1','1527664064','','ITG','4');
INSERT INTO `pa_mining` VALUES ('29','50','1527661094','182.48640','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('30','50','1527661094','45.62160','0','','','ITG','4');
INSERT INTO `pa_mining` VALUES ('31','52','1527661094','25.45120','1','1527673136','','BOW','3');
INSERT INTO `pa_mining` VALUES ('32','52','1527661094','6.36280','1','1527673136','','ITG','4');
INSERT INTO `pa_mining` VALUES ('33','24','1527661115','6.39520','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('34','24','1527661115','1.59880','0','','','ITG','4');
INSERT INTO `pa_mining` VALUES ('35','47','1527661115','355.66960','1','1527664064','','BOW','3');
INSERT INTO `pa_mining` VALUES ('36','47','1527661115','88.91740','1','1527664064','','ITG','4');
INSERT INTO `pa_mining` VALUES ('37','50','1527661115','182.30400','0','','','BOW','3');
INSERT INTO `pa_mining` VALUES ('38','50','1527661115','45.57600','0','','','ITG','4');
INSERT INTO `pa_mining` VALUES ('39','52','1527661115','25.42560','1','1527673136','','BOW','3');
INSERT INTO `pa_mining` VALUES ('40','52','1527661115','6.35640','1','1527673136','','ITG','4');


# 数据库表：pa_model 数据信息
INSERT INTO `pa_model` VALUES ('2','会员中心','pa_personal','会员中心','0','1','MyISAM','会员表','1510624122','1521100623');
INSERT INTO `pa_model` VALUES ('20','交易记录','pa_order','交易记录','0','1','InnoDB','','1521180702','1521180702');


# 数据库表：pa_mybi 数据信息
INSERT INTO `pa_mybi` VALUES ('29','52','4','101.802','101.802','ITG');
INSERT INTO `pa_mybi` VALUES ('30','52','3','25.528','25.528','BOW');
INSERT INTO `pa_mybi` VALUES ('31','47','4','534.036','534.036','ITG');


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
INSERT INTO `pa_news` VALUES ('1','1','背景介绍','','','','背景介绍','1526550777','','背景介绍','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('27','5','头条新闻2','','','','头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2','1527504401','','头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2头条新闻2','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('22','2','Project Introduction','','','','BlockWorld以全球视野整合前沿研发资源，致力于以科技改变世界，用创新成就未来，公司立足中国，投资区块链基础算力设施，包括矿场建设、矿场运营、算力累积、算力出租等业务。BlockWorld负责在世界各地建设和运营算力，提供算力租赁、托管、出借、交易等算力相关的全系列服务,用户通过BlockWorld获得算力和算力对应的收益。愿景目标是成为全球专业矿场运营团队。在矿场建设、矿场运营、算力投资、&hellip;','1527231283','','<p class="MsoNormal" style="text-indent:28.0000pt;">
	BlockWorld<span>以全球视野整合前沿研发资源，致力于以科技改变世界，用创新成就未来，公司立足中国，</span><span>投资区块链基础算力设施，包括矿场建设、矿场运营、算力累积、算力出租等业务。</span>BlockWorld<span>负责在世界各地建设和运营算力，</span><span>提供算力租赁、托管、出借、交易等算力相关的全系列服务</span>,<span>用户通过</span>BlockWorld<span>获得算力和算力对应的收益。愿景目标是成为全球专业矿场运营团队。在矿场建设、矿场运营、算力投资、算力出租、设备采购等方面做到专业、可靠。</span>
</p>
<p class="MsoNormal" style="text-indent:28.0000pt;">
	BlockWorld<span>项目会设计一个代币</span><span>BlockWorld Token(BOWT)</span><span>。</span><span>BlockWorld Token(BOWT)</span><span>是</span><span>ERC-20</span><span>代币，代表了项目运营的收益。不论项目在用何种机器挖的任何币种，或是项目从其他业务获得的收益，都会用</span><span>BlockWorld Token(BOWT)</span><span>的形式发放。</span>
</p>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('4','4','奖励规则','','','','奖励规则','1526550822','1527606405','<p class="p1" style="text-align:center;">
	<br />
</p>
<p class="MsoNormal" style="text-align:left;text-indent:28pt;">
	<span style="font-size:9px;">A</span><span style="font-size:9px;">、免费注册即可获得</span><span style="font-size:9px;">50</span><span style="font-size:9px;">个算力</span><span style="font-size:9px;">;</span> 
</p>
<p class="MsoNormal" style="text-align:left;text-indent:28pt;">
	<span style="font-size:9px;">B</span><span style="font-size:9px;">、每邀请一个好友赠完成注册，且好友完成信息认证，即可获得</span><span style="font-size:9px;">10</span><span style="font-size:9px;">个算力的奖励；</span> 
</p>
<p class="MsoNormal" style="text-align:left;text-indent:28pt;">
	<span style="font-size:9px;">C</span><span style="font-size:9px;">、你邀请的好友，邀请一个好友完成注册并完成信息认证，你将获得</span><span style="font-size:9px;">5</span><span style="font-size:9px;">个算力的奖励；</span> 
</p>
<p class="MsoNormal" style="text-align:left;text-indent:28pt;">
	<span style="font-size:9px;">D</span><span style="font-size:9px;">、每天签到可赠送</span><span style="font-size:9px;">1</span><span style="font-size:9px;">个算力，算力释放后成为矿石。</span> 
</p>
<p>
	<br />
</p>
<p class="p1" style="text-align:center;">
	<span style="font-size:10px;"></span>
</p>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('6','6','城市公告','','','','城市公告','1526550853','','城市公告','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('7','5','第二届世界智能大会开幕 智能发展的“中国智慧”','','','','　“迎接智能产业新趋势，聚力智能时代新发展。”由国家发展和改革委员会、科学技术部、工业和信息化部、国家互联网信息办公室、中国科学院、中国工程院、中国科学技术协会和天津市人民政府共同主办的第二届世界智能大会5月16日开幕，千余位智能科技领军人物、知名企业家及两院院士、专家学者齐聚津门，共享全球智能盛宴。　　国家发改委副主任林念修表示，长期以来，让机器更加智能、最大限度地解放人类劳动，一直是推动全球技&hellip;','1526550923','','<p style="font-size:16px;color:#434343;font-family:&quot;background-color:#FFFFFF;">
	　“迎接智能产业新趋势，聚力智能时代新发展。”由国家发展和改革委员会、科学技术部、工业和信息化部、国家互联网信息办公室、中国科学院、中国工程院、中国科学技术协会和天津市人民政府共同主办的第二届世界智能大会5月16日开幕，千余位智能科技领军人物、知名企业家及两院院士、专家学者齐聚津门，共享全球智能盛宴。
</p>
<p style="font-size:16px;color:#434343;font-family:&quot;background-color:#FFFFFF;">
	　　国家发改委副主任林念修表示，长期以来，让机器更加智能、最大限度地解放人类劳动，一直是推动全球技术进步和产业创新的不竭动力，自1956年科学家首次提出人工智能以来，经过60多年的探索发展，人工智能已经成为当今世界最有潜力、最具活力、最富想象力的科技产业领域。
</p>
<p style="font-size:16px;color:#434343;font-family:&quot;background-color:#FFFFFF;">
	　　联合国教科文组织信息与传播知识社会局主任英德拉吉特·班纳吉表示，人工智能是把不同的技术、不同的工具、不同的信息整合起来，产生新的过程、机制，进而提高生产力，创造更美好的生活，提高工作效率和生活效率。
</p>
<p style="font-size:16px;color:#434343;font-family:&quot;background-color:#FFFFFF;">
	　　南京理工大学北方研究院通过研发平台整合“哈军工”系统校友和技术资源，在智能机器人相关人才和技术聚集的基础上再创新，研发了数款具有国内领先水平的特种服务智能机器人产品。5月16日上午，记者在梅江会展中心第二展区看到国内第一台智能巡逻机器人，这款正在巡逻的机器人，像明星一样受到了观众的热捧。该研究院在本届世界智能大会上还展示了全国首块多功能智能水表、全球首款无人驾驶媒体式洗地机器人、全球领先的讲解机器人和智能垃圾桶等最新成果。
</p>
<p style="font-size:16px;color:#434343;font-family:&quot;background-color:#FFFFFF;">
	　　南京理工大学北方研究院负责人戚龙江告诉记者，智能巡逻机器人在国内首次成功实现了激光SLAM技术与履带底盘机器人的结合，以全球领先的激光SLAM技术为核心，通过室内实时定位与建图，集成多重避障方式，可实现玻璃等透明障碍物的识别以及日间、夜间的正常工作，保障运行安全。该款机器人具有指定区域内高清图传、数传等功能，可实现在楼梯、涉水、颠簸等多种复杂情况下正常工作，可应用于需要巡逻、巡检的场所，包括涉密单位、高档社区、监狱等的场景巡逻任务，以及需要代替人工远程执行高危任务的场景。
</p>
<p style="font-size:16px;color:#434343;font-family:&quot;background-color:#FFFFFF;">
	　　如今，为服务国家重大需求，培养更多适应和引领时代发展的未来人才，南开大学、天津大学等天津高校近日陆续成立人工智能类学院。南开大学人工智能学院日前正式揭牌，该学院将重点聚焦人工智能方法与智能机器人等系统的紧密结合，用人工智能方法提升机器人智能化水平，以机器人系统的具体需求来推动人工智能方法的发展。依托天津大学成立的天津市人工智能学院，将围绕《新一代人工智能发展规划》和天津市人工智能产业布局，建立人工智能专业方向人才培养体系，支撑未来10年的人工智能基础理论和共性关键技术的研究。
</p>
<p style="font-size:16px;color:#434343;font-family:&quot;background-color:#FFFFFF;">
	　　“汽车正在经历从燃油汽车到数字化电动汽车，并将朝着智能化无人驾驶汽车的方向急速行驶。人工智能为产品插上了腾飞的翅膀。”中国工程院院长周济为观众做了“新一代智能制造技术”的主题演讲。
</p>
<p style="font-size:16px;color:#434343;font-family:&quot;background-color:#FFFFFF;">
	　　周济认为，智能制造是一个大概念，一个不断演进的大系统，是新一代信息技术同制造技术的深度融合，贯穿于产品制造服务全生命周期的各个环节。他认为，到2035年，各种产品和装备将要从数字一代发展成为智能一代，一方面将涌现出一大批先进的智能产品，比如智能终端、智能家电、智能服务机器人、智能玩具等，为人民的生活更好地服务。另一方面，将着重推动重点领域重大装备的智能升级，特别是智能制造装备。大国重器将装备大工业大脑，更加先进，更加智能，新一代智能制造系统出现，将使生产线、车间工厂发生革命性的大变革，智能产品、智能车间、智能工厂成为智能生产的主要载体。（经济日报·中国经济网记者 武自然）
</p>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('8','5',' 炎帝文化拉近海峡两岸民众距离','','','','　央视网消息（新闻联播）：中共中央总书记、国家主席、中央军委主席习近平16日上午视察军事科学院，代表党中央和中央军委，对军事科学院第八次党代表大会的召开表示热烈的祝贺，向军事科学院全体同志致以诚挚的问候。他强调，军事科学是指导军事实践、引领军事变革的重要力量。要深入贯彻新时代党的强军思想，坚持政治建军、改革强军、科技兴军、依法治军，坚持面向战场、面向部队、面向未来，坚持理技融合、研用结合、军民融合&hellip;','1526551413','1527064052','<p style="font-size:16px;font-family:Arial, 宋体;color:#333333;background-color:#FFFFFF;">
	<span style="color:#2B2B2B;font-family:&quot;font-size:16px;background-color:#FFFFFF;">在海峡两岸同胞神农炎帝民间拜祖典礼前夕，陈致聿和他的“神轿会”(台湾庙堂龙天宫的分支机构)同仁从距离炎帝陵2100多公里的台湾苗栗赶来，为大陆民众带来台湾苗栗传统技艺――辇轿，为的是让更多民众了解台湾当地的祭典风俗。</span>
</p>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('15','8','bowt介绍','','','','bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍','1527073745','','bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍bowt介绍','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('16','9','算力介绍','','','','算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍','1527073765','','算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍算力介绍','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('17','10','矿石介绍','','','','矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍','1527073780','','矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍矿石介绍','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('9','7','关于我们','','','','关于我们','1526551641','','关于我们','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('11','5','RNG!全华班,我们是冠军!','','','','2018《英雄联盟》季中冠军赛在法国巴黎天顶体育馆进行，在比赛开始之前，网上也有许多人认为RNG夺冠概念极低，毕竟KZ所在赛区是碾压式的存在。但是我们用实力证明了自己，我们是冠军，曾经失败没有关系，今天我们狠狠的打了不看好我们能夺冠人的脸。RNG你们就是我们心中的英雄，还记得比赛结束RNG获得冠军的时候， 全场一起大喊uzi!uzi!uzi!时，真的作为一个一直随着LOL成长的我，感动不言而喻。','1527063833','','<span style="color:#474747;font-family:微软雅黑, 宋体;font-size:16px;">2018《英雄联盟》季中冠军赛在法国巴黎天顶体育馆进行，在比赛开始之前，网上也有许多人认为RNG夺冠概念极低，毕竟KZ所在赛区是碾压式的存在。但是我们用实力证明了自己，我们是冠军，曾经失败没有关系，今天我们狠狠的打了不看好我们能夺冠人的脸。RNG你们就是我们心中的英雄，还记得比赛结束RNG获得冠军的时候， 全场一起大喊uzi!uzi!uzi!时，真的作为一个一直随着LOL成长的我，感动不言而喻。</span>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('21','3','参与布洛克城的建设','','','','啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊','1527227989','','<span><span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊啊</span><span>啊啊</span></span><span>啊</span></span><span></span>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('19','3','每日登录、及时收取宝藏','','','','啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊','1527227731','1527227738','<span>啊啊啊啊啊啊啊啊啊啊啊啊啊啊</span><span>啊啊啊啊啊啊啊啊啊啊啊啊啊啊</span><span>啊啊啊啊啊啊啊啊啊啊啊啊啊啊</span><span>啊啊啊啊啊啊啊啊啊啊啊啊啊啊</span><span>啊啊啊啊啊啊啊啊啊啊啊啊啊啊</span>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('20','3','邀请好友','','','','啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿','1527227910','','<span>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿</span><span>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿</span><span>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿</span><span>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿</span><span>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿</span>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('18','11','钻石介绍','','','','钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍','1527073798','','钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍钻石介绍','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('23','2','About HashRate Investment','','','','数据显示，相比二级市场交易和一级市场项目投资，挖矿的收益会更直观稳健，风险会更小。而当数字资产概念普遍化、规模扩大化之后，稳健的投资方法将会是多数人的选择。投资算力是你可以选择的稳健性数字货币投资方式。本项目不仅会投资算力基础设施，同时会投资算力，为投资者提供稳健的数字货币投资选择。','1527231295','','<p class="MsoNormal" style="text-indent:28.0000pt;">
	数据显示，相比二级市场交易和一级市场项目投资，挖矿的收益会更直观稳健，风险会更小。而当数字资产概念普遍化、规模扩大化之后，稳健的投资方法将会是多数人的选择。
</p>
<p class="MsoNormal" style="text-indent:28.0000pt;">
	投资算力是你可以选择的稳健性数字货币投资方式。
</p>
<p class="MsoNormal" style="text-indent:28.0000pt;">
	本项目不仅会投资算力基础设施，同时会投资算力，为投资者提供稳健的数字货币投资选择。<b></b>
</p>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('24','2','Source of Income','','','','云挖矿云矿机是唯一一个提供低进入成本低，风险低，费用低的挖矿方式，有别于传统的需要采购高配置的硬件并进行专业的维护的挖矿模型。一部分的算力也可以用于云挖矿算力出租。这部分意味着投资的瞬间回本，但是收益是不及自主挖矿。项目适当考虑这部分的市场是为了更好的风险控制。挖 &nbsp;矿我们主要的收入来源于矿机挖矿。我们会同时采购蚂蚁矿机和显卡矿机，CPU挖矿 &gt; GPU挖矿 &gt; FPGA挖矿&hellip;','1527231319','','<p class="MsoNormal">
	<b>云挖矿</b><b></b>
</p>
<p class="MsoNormal" style="text-indent:28.0000pt;">
	<span>云矿机是唯一一个提供低进入成本低，风险低，费用低的挖矿方式，有别于传统的需要采购高配置的硬件并进行专业的维护的挖矿模型。</span>一部分的算力也可以用于云挖矿算力出租。这部分意味着投资的瞬间回本，但是收益是不及自主挖矿。项目适当考虑这部分的市场是为了更好的风险控制。
</p>
<p class="MsoNormal">
	<b><span>挖</span> &nbsp;<span>矿</span></b><b></b>
</p>
<p class="MsoNormal" style="text-indent:28.0000pt;">
	我们主要的收入来源于矿机挖矿。我们会同时采购蚂蚁矿机和显卡矿机，CPU挖矿 &gt; GPU挖矿 &gt; FPGA挖矿 &gt; ASIC挖矿 &gt; 大规模集群挖矿，<span>蚂蚁</span>S9矿机，神马M3矿机，阿瓦隆期货矿机等等，项目会在收益高的项目之间做自动切换。
</p>
<p class="MsoNormal">
	<b><span>托</span> &nbsp;<span>管</span></b>
</p>
<p class="p" style="text-indent:28.0000pt;">
	如果有额外的矿场的位置，我们将会做一些托管业务，托管属于附加服务，提供托管服务的一方不对矿机在矿池的运行算力及在矿池的收益作出承诺，因考虑矿场管理安全因素，不对用户开放远程控制权限。托管业务的收入主要是电费的差价和托管费用，这部分的需求也是非常旺盛的。
</p>
<p class="p">
	<b><span>其</span> &nbsp;<span>他</span></b><b></b>
</p>
<p class="MsoNormal" style="text-indent:28.0000pt;">
	我们会根据市场需求引进其他品类高收益矿机，为投资者提供稳健的投资收益选择。
</p>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('25','2','Financing Targe','','','','融资额度：10000枚ETH，软顶5000ETH，硬顶1万ETH。第一期初创矿主：2000枚ETH，1ETH=5000BOWT，每月20%释放；第二期初创矿主：8000枚ETH，1ETH=2500BOWT，每月20%释放。','1527231333','','<p class="MsoNormal">
	<span>融资额度：</span>10000<span>枚</span><span>ETH</span><span>，软顶</span><span>5000ETH</span><span>，硬顶</span><span>1</span><span>万</span><span>ETH</span><span>。</span>
</p>
<p class="MsoNormal" style="text-indent:28.0000pt;">
	<span>第一期初创矿主：</span>2000<span>枚</span><span>ETH</span><span>，</span><span>1ETH=5000BOWT</span><span>，每月</span><span>20%</span><span>释放；</span>
</p>
<p class="MsoNormal" style="text-indent:28.0000pt;">
	<span>第二期初创矿主：</span>8000<span>枚</span><span>ETH</span><span>，</span><span>1ETH=2500BOWT</span><span>，每月</span><span>20%</span><span>释放。</span>
</p>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('26','2','APP promotion','','','','A、免费注册即可获得50个算力;B、每邀请一个好友赠完成注册，且好友完成信息认证，即可获得10个算力的奖励；C、你邀请的好友，邀请一个好友完成注册并完成信息认证，你将获得5个算力的奖励；D、每天签到可赠送1个算力，算力释放后成为矿石。','1527231357','','<p class="MsoNormal" style="text-indent:28.0000pt;">
	A<span>、免费注册即可获得</span><span>50</span><span>个算力</span><span>;</span>
</p>
<p class="MsoNormal" style="text-indent:28.0000pt;">
	B<span>、每邀请一个好友赠完成注册，且好友完成信息认证，即可获得</span><span>10</span><span>个算力的奖励；</span>
</p>
<p class="MsoNormal" style="text-indent:28.0000pt;">
	C<span>、你邀请的好友，邀请一个好友完成注册并完成信息认证，你将获得</span><span>5</span><span>个算力的奖励；</span>
</p>
<p class="MsoNormal">
	D<span>、每天签到可赠送</span><span>1</span><span>个算力，算力释放后成为矿石。</span>
</p>','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('28','6','城市公告2','','','','城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2','1527504417','','城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2城市公告2','0','1','0','0','zh-cn');
INSERT INTO `pa_news` VALUES ('29','12','Data-key','','','','ajkcbauicnmqa&nbsp;kjansucmqasoxmoASNDUIBNX&nbsp;&nbsp;&nbsp;&nbsp;','1527562543','','<p>
	ajkcbauicnmqa
</p>
<p>
	&nbsp;kjansucmqasoxm
</p>
<p>
	oASNDUIBNX&nbsp;&nbsp;&nbsp;&nbsp;
</p>','0','1','0','0','zh-cn');


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
INSERT INTO `pa_order` VALUES ('1','01137324DE0F8B','0','3','','','1526096606','','1','','1600.00','','0','8','','0','3','0','4','20180512152609660632099','0','','','');
INSERT INTO `pa_order` VALUES ('2','6DAFC963DB35E6','0','3','','','1526096606','','1','','8999.00','','0','8','','0','4','0','5','20180512152609660632099','0','','','');
INSERT INTO `pa_order` VALUES ('3','431EDE5C90479C','0','3','','','1526097740','','1','','6954.00','','0','8','','0','1','0','4','20180512152609774033240','7','','','');
INSERT INTO `pa_order` VALUES ('4','FBD6B8EB81780E','0','3','','','1526364875','','1','','8999.00','','0','8','','0','1','0','5','20180515152636487532019','0','','','');
INSERT INTO `pa_order` VALUES ('6','FDA53E5A9CE7B2','0','3','','','1526364901','','1','','1600.00','','0','8','','0','4','0','6','20180515152636490131043','0','','','');
INSERT INTO `pa_order` VALUES ('7','96A601D07C4093','0','3','','','1526364911','','1','','4999.00','','0','8','','0','5','0','4','20180515152636491132463','0','','','');
INSERT INTO `pa_order` VALUES ('9','98A36A8A3C0752','0','3','','','1526368619','','1','','6000.00','','0','8','','0','5','0','6','20180515152636861939046','0','3434344324324','','');
INSERT INTO `pa_order` VALUES ('10','16E11CDD42982F','0','3','','','1526373308','','1','','6000.00','','0','8','','0','1','0','6','2018051515263733083269','0','','','');
INSERT INTO `pa_order` VALUES ('11','908367804B0E1B','0','3','','','1526375087','','1','','6000.00','','0','8','','0','1','0','6','20180515152637508736096','0','','','');
INSERT INTO `pa_order` VALUES ('12','BFEA569139D488','0','3','','','1526383960','','1','','8999.00','','0','8','','0','0','0','5','20180515152638396038808','0','','','');
INSERT INTO `pa_order` VALUES ('42','63904D73F5A136','0','24','','','1526703969','','1','','0.00','','0','0','','0','0','0','0','201805191526703969244635','0','','','');
INSERT INTO `pa_order` VALUES ('43','B065844E487BE9','0','24','','','1526703969','','1','','130000.00','','0','0','','0','0','0','0','201805191526703969244635','0','','','');
INSERT INTO `pa_order` VALUES ('44','101C0B98A2E660','0','24','','','1526704385','','1','','8500.00','','0','0','','0','0','0','0','201805191526704385241271','0','','','');
INSERT INTO `pa_order` VALUES ('45','B61DA840661CE7','0','50','','','1526710912','','1','','50000.00','','0','0','','0','0','0','0','201805191526710912502805','0','','','');
INSERT INTO `pa_order` VALUES ('46','C0629EAC2578F1','0','50','','','1526712302','','1','','10000.00','','0','0','','0','0','0','0','201805191526712302507260','0','','','');
INSERT INTO `pa_order` VALUES ('47','B42DBA5CAB2593','0','50','','','1526712328','','1','','250000.00','','0','0','','0','0','0','0','201805191526712328506674','0','','','');
INSERT INTO `pa_order` VALUES ('48','6C51671AD3BADF','0','50','','','1526712470','','1','','100000.00','','0','0','','0','0','0','0','201805191526712470505350','0','','','');
INSERT INTO `pa_order` VALUES ('49','5488C724AE19CD','0','50','','','1526713163','','1','','25000.00','','0','0','','0','0','0','0','201805191526713163508059','0','','','');
INSERT INTO `pa_order` VALUES ('50','38DFEF867327E6','0','50','','','1526715102','','1','','70000.00','','0','0','','0','0','0','0','201805191526715102508517','0','','','');
INSERT INTO `pa_order` VALUES ('51','F25EF4F819FBD8','0','50','','','1526715398','','1','','110000.00','','0','0','','0','0','0','0','201805191526715398505858','0','','','1');
INSERT INTO `pa_order` VALUES ('52','A5F6974B2944F7','0','50','','','1526716566','','1','','60000.00','','0','0','','0','0','0','0','201805191526716566509552','0','','','1');
INSERT INTO `pa_order` VALUES ('53','822ACD56106317','0','50','','','1526716678','','1','','60000.00','','0','0','','0','0','0','0','201805191526716678508573','0','','','1');
INSERT INTO `pa_order` VALUES ('54','A401A051174379','0','50','','','1526716771','','1','','15000.00','','0','0','','0','0','0','0','201805191526716771509563','0','','','1');
INSERT INTO `pa_order` VALUES ('55','6B43D88E1F7BB3','0','50','','','1526716842','','1','','60000.00','','0','0','','0','0','0','0','201805191526716842506001','0','','','1');
INSERT INTO `pa_order` VALUES ('56','3FF3DD79B42D08','0','50','','','1527312872','','1','','101500.00','','0','0','','0','0','0','0','201805261527312872505484','0','','','1');
INSERT INTO `pa_order` VALUES ('57','710F64CC0CCD1C','0','47','','','1527313675','','1','','500.00','','0','0','','1','1','1527314336','0','201805261527313675474674','0','','','');
INSERT INTO `pa_order` VALUES ('58','0270559558E1C3','0','50','','','1527314326','','1','','50000.00','','0','0','','1','1','1527314336','0','201805261527314326505535','0','','','');
INSERT INTO `pa_order` VALUES ('59','3F04811B098110','0','47','','','1527316458','','1','','60000.00','','0','0','','1','1','1527471958','0','201805261527316458471751','0','','','');
INSERT INTO `pa_order` VALUES ('60','C366A10D751CB1','0','47','','','1527316582','','1','','27500.00','','0','0','','1','1','1527472219','0','201805261527316582474384','0','','','');
INSERT INTO `pa_order` VALUES ('61','9EBD1F86B208F9','0','50','','','1527318906','','1','','15500.00','','0','0','','0','0','1527320825','0','201805261527318906506444','0','','','');
INSERT INTO `pa_order` VALUES ('62','2774F87D7F543E','0','50','','','1527321129','','1','','26000.00','','0','0','','1','1','1527321167','0','201805261527321129508928','0','','','');
INSERT INTO `pa_order` VALUES ('63','B4D4D07FA71D16','0','47','','','1527472505','','1','','2500.00','','0','0','','1','1','1527472516','0','201805281527472505478793','0','','','');
INSERT INTO `pa_order` VALUES ('64','E225E34E31525A','0','47','','','1527472537','','1','','1500.00','','0','0','','1','1','1527472605','0','201805281527472537475744','0','','','');
INSERT INTO `pa_order` VALUES ('65','35D0A858D83D14','0','47','','','1527472705','','1','','1000.00','','0','0','','1','1','1527472710','0','201805281527472705475410','0','','','');
INSERT INTO `pa_order` VALUES ('66','57FCF35DB01031','0','47','','','1527472743','','1','','1500.00','','0','0','','1','1','1527478720','0','201805281527472743474946','0','','','');
INSERT INTO `pa_order` VALUES ('67','8DF756352951F9','0','47','','','1527478980','','1','','1500.00','','0','0','','0','0','0','0','201805281527478980474017','0','','','');
INSERT INTO `pa_order` VALUES ('68','E3A1E8E18DFC9F','0','47','','','1527578446','','1','','150500.00','','0','0','','0','0','0','0','20180529152757844647943','0','','','');
INSERT INTO `pa_order` VALUES ('69','97530DF282A9C6','0','52','','','1527588270','','1','','10500.00','','0','0','','1','1','1527588285','0','201805291527588270523874','0','','','');
INSERT INTO `pa_order` VALUES ('70','EA8DBD71299C2A','0','52','','','1527588350','','1','','60000.00','','0','0','','0','0','0','0','201805291527588350525011','0','','','');
INSERT INTO `pa_order` VALUES ('71','857326A5C47502','0','52','','','1527596650','','1','','500.00','','0','0','','1','1','1527596662','0','20180529152759665052277','0','','','');
INSERT INTO `pa_order` VALUES ('72','546367AF8D7A50','0','52','','','1527597186','','1','','20000.00','','0','0','','1','1','1527672726','0','20180529152759718652170','0','','','');
INSERT INTO `pa_order` VALUES ('73','4DBA5B0E196103','0','47','','','1527675541','','1','','15000.00','','0','0','','0','0','0','0','201805301527675541471128','0','','','');
INSERT INTO `pa_order` VALUES ('74','9B44463D9B95BC','0','47','','','1527675541','','1','','500.00','','0','0','','0','0','0','0','201805301527675541471128','0','','','');
INSERT INTO `pa_order` VALUES ('75','9A887A664B56A5','0','47','','','1527675879','','1','','500.00','','0','0','','0','0','0','0','201805301527675879478980','13','','','');
INSERT INTO `pa_order` VALUES ('76','18611BDF02D76F','0','47','','','1527675879','','1','','2000.00','','0','0','','0','0','0','0','201805301527675879478980','15','','','');
INSERT INTO `pa_order` VALUES ('77','72C039000F8DBD','0','66','','','1527751815','','1','','50000.00','','0','0','','0','0','0','0','201805311527751815666756','13','','','');
INSERT INTO `pa_order` VALUES ('78','4624615E99ED79','0','67','','','1527755542','','1','','50000.00','','0','0','','0','0','0','0','201805311527755542671947','13','','','');


# 数据库表：pa_orderdetails 数据信息
INSERT INTO `pa_orderdetails` VALUES ('18','AA926CE4AE45BD','BT-1云矿机','24','1','1','500.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('19','F704C01E8B0C38','BT-2云矿机','24','2','1','2000.00','','0','0','1','2');
INSERT INTO `pa_orderdetails` VALUES ('21','13647E52C8CB74','BOWT充值','47','0','100','0.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('22','46B5E1850FA973','BOWT充值','47','0','100','0.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('23','53EF482D070D0C','BOWT充值','47','0','100','0.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('24','3F461B5EB3E324','BOWT充值','47','0','11','0.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('25','45755ACB58E86A','BOWT充值','47','0','11','0.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('26','DA6220A7049D88','BOWT充值','47','0','1','0.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('27','FF0E75EAE5B614','BOWT充值','47','0','1','0.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('28','E8425463D0BFD7','BOWT充值','47','0','1','0.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('29','F8D6A5051C0506','BOWT充值','47','0','1','0.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('30','B065844E487BE9','BT-5云矿机','24','5','2','50000.00','','0','0','1','');
INSERT INTO `pa_orderdetails` VALUES ('31','B065844E487BE9','BT-4云矿机','24','4','3','10000.00','','0','0','1','');
INSERT INTO `pa_orderdetails` VALUES ('32','101C0B98A2E660','BT-1云矿机','24','1','1','500.00','','0','0','1','');
INSERT INTO `pa_orderdetails` VALUES ('33','101C0B98A2E660','BT-2云矿机','24','2','4','2000.00','','0','0','1','');
INSERT INTO `pa_orderdetails` VALUES ('34','B61DA840661CE7','BT-4云矿机','50','4','5','10000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('35','C0629EAC2578F1','BT-3云矿机','50','3','2','5000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('36','B42DBA5CAB2593','BT-5云矿机','50','5','5','50000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('37','6C51671AD3BADF','BT-5云矿机','50','5','2','50000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('38','5488C724AE19CD','BT-4云矿机','50','4','2','10000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('39','5488C724AE19CD','BT-2云矿机','50','2','2','2000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('40','5488C724AE19CD','BT-1云矿机','50','1','2','500.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('41','38DFEF867327E6','BT-5云矿机','50','5','1','50000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('42','38DFEF867327E6','BT-4云矿机','50','4','2','10000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('43','F25EF4F819FBD8','BT-5云矿机','50','5','2','50000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('44','F25EF4F819FBD8','BT-4云矿机','50','4','1','10000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('45','A5F6974B2944F7','BT-5云矿机','50','5','1','50000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('46','A5F6974B2944F7','BT-4云矿机','50','4','1','10000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('47','822ACD56106317','BT-5云矿机','50','5','1','50000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('48','822ACD56106317','BT-4云矿机','50','4','1','10000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('49','A401A051174379','BT-3云矿机','50','3','1','5000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('50','A401A051174379','BT-4云矿机','50','4','1','10000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('51','6B43D88E1F7BB3','BT-5云矿机','50','5','1','50000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('52','6B43D88E1F7BB3','BT-4云矿机','50','4','1','10000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('53','3FF3DD79B42D08','BT-5云矿机','50','5','2','50000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('54','3FF3DD79B42D08','BT-1云矿机','50','1','3','500.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('55','710F64CC0CCD1C','BT-1云矿机','47','1','6','500.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('56','710F64CC0CCD1C','BT-3云矿机','47','3','4','5000.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('57','710F64CC0CCD1C','BT-4云矿机','47','4','1','10000.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('58','710F64CC0CCD1C','BT-5云矿机','47','5','1','50000.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('59','710F64CC0CCD1C','BT-2云矿机','47','2','1','2000.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('60','0270559558E1C3','BT-5云矿机','50','5','1','50000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('61','3F04811B098110','BT-5云矿机','47','5','1','50000.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('62','3F04811B098110','BT-4云矿机','47','4','1','10000.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('63','C366A10D751CB1','BT-1云矿机','47','1','1','500.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('64','C366A10D751CB1','BT-3云矿机','47','3','1','5000.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('65','C366A10D751CB1','BT-4云矿机','47','4','2','10000.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('66','C366A10D751CB1','BT-2云矿机','47','2','1','2000.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('67','9EBD1F86B208F9','BT-1云矿机','50','1','1','500.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('68','9EBD1F86B208F9','BT-4云矿机','50','4','1','10000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('69','9EBD1F86B208F9','BT-3云矿机','50','3','1','5000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('70','2774F87D7F543E','BT-1云矿机','50','1','2','500.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('71','2774F87D7F543E','BT-3云矿机','50','3','5','5000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('72','B4D4D07FA71D16','BT-1云矿机','47','1','5','500.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('73','E225E34E31525A','BT-1云矿机','47','1','3','500.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('74','35D0A858D83D14','BT-1云矿机','47','1','2','500.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('75','57FCF35DB01031','BT-1云矿机','47','1','3','500.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('76','8DF756352951F9','BT-1云矿机','47','1','3','500.00','','0','0','2','');
INSERT INTO `pa_orderdetails` VALUES ('77','E3A1E8E18DFC9F','BT-1云矿机','47','1','1','500.00','','0','0','2','1');
INSERT INTO `pa_orderdetails` VALUES ('78','E3A1E8E18DFC9F','BT-5云矿机','47','5','3','50000.00','','0','0','2','1');
INSERT INTO `pa_orderdetails` VALUES ('79','97530DF282A9C6','BT-4云矿机','52','4','1','10000.00','','0','0','25','');
INSERT INTO `pa_orderdetails` VALUES ('80','97530DF282A9C6','BT-1云矿机','52','1','1','500.00','','0','0','25','');
INSERT INTO `pa_orderdetails` VALUES ('81','EA8DBD71299C2A','BT-5云矿机','52','5','1','50000.00','','0','0','25','');
INSERT INTO `pa_orderdetails` VALUES ('82','EA8DBD71299C2A','BT-4云矿机','52','4','1','10000.00','','0','0','25','');
INSERT INTO `pa_orderdetails` VALUES ('83','857326A5C47502','BT-1云矿机','52','1','1','500.00','','0','0','25','');
INSERT INTO `pa_orderdetails` VALUES ('84','546367AF8D7A50','BT-4云矿机','52','4','2','10000.00','','0','0','25','');
INSERT INTO `pa_orderdetails` VALUES ('85','4DBA5B0E196103','BT-3云矿机','47','3','3','5000.00','','0','0','2','1');
INSERT INTO `pa_orderdetails` VALUES ('86','9B44463D9B95BC','BT-1云矿机','47','1','1','500.00','','0','0','2','1');
INSERT INTO `pa_orderdetails` VALUES ('87','9A887A664B56A5','BT-1云矿机','47','1','1','500.00','','0','0','2','1');
INSERT INTO `pa_orderdetails` VALUES ('88','18611BDF02D76F','BT-2云矿机','47','2','1','2000.00','','0','0','2','1');
INSERT INTO `pa_orderdetails` VALUES ('89','72C039000F8DBD','BT-5云矿机','66','5','1','50000.00','','0','0','','');
INSERT INTO `pa_orderdetails` VALUES ('90','4624615E99ED79','BT-5云矿机','67','5','1','50000.00','','0','0','','');


# 数据库表：pa_page 数据信息


# 数据库表：pa_pay 数据信息
INSERT INTO `pa_pay` VALUES ('0','支付宝','','MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDI6d306Q8fIfCOaTXyiUeJHkrIvYISRcc73s3vF1ZT7XN8RNPwJxo8pWaJMmvyTn9N4HQ632qJBVHf8sxHi/fEsraprwCtzvzQETrNRwVxLO5jVmRGi60j8Ue1efIlzPXV9je9mkjzOmdssymZkh2QhUrCmZYI/FCEa3/cNMW0QIDAQAB','MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArSdZjAK5glT8J3JKliPo431VrOGB2zzFCjIDXvm37txT+xF/zQVISaQ5l8qfjimqmLlAs4p3p7ebl5cKReMK+c+mcrFX8AtClOxHhZ+29kxk7eIyLJ+G/AMYGdeO/liaVUcsMwS8lm1ZpfMReXGwt9TsaoAn9mBhI4OdrDTToZrf9NCDFHRxKVYmQcqg8nNQyDuWHy4dGdOhuD7WwW9','2017120400375638','http://47.92.53.249/index.php/Home/Defraya/obtain_info');


# 数据库表：pa_personal 数据信息
INSERT INTO `pa_personal` VALUES ('1','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','1','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','asdasd','','2','0','0','0','1527592769','1512985614','','','','','5c5ad1add259adae8b8e5bf1314a3848','0','TYTFMOJBTU','IMDBx6lodLa85ZqVsGP9LxvYp1rwjElXUZ4Mhfq3sg3yvLyaoN','0','1514872511','0','','','-2431661','1015','','192.168.1.1','0','2000000','0','0','','','','','0','0','','76266152759');
INSERT INTO `pa_personal` VALUES ('2','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','2','0.00','4900.00','c4ca4238a0b923820dcc509a6f75849b','saqcxzc','','1','1','0','0','1514965623','1512985487','','','','','0e60a67bd55e640fb7ada87292c4e73e','0','WO6L8K4X0G','WHBUT1oGbVuu02eDVXyLWRP35fCFiDJoUoIWDKjLGnROu6++DF','0','','0','1','','505','406','','','0','2000000','0','0','','','','','0','0','','12142152759');
INSERT INTO `pa_personal` VALUES ('24','0','0','哈撒ki1','99','0','/Uploads/Iecture/2018-03-14/5aa8cdb17c7ff.jpg','/Public/Img/default/bgdefault.jpg','3','0.00','7690.00','c4ca4238a0b923820dcc509a6f75849b','sada','asdasdaaaz','1','1','0','0','1521027843','1511317819','132456@126.com','','','','f2a463b1bab23217398497b84e2aee15','0','ZTTT3ATZR4','HIHDFuqcAwFBOr6TRn2CqMCCjH4o6JjLdHR8Js6hTz8S7IBVEz','0','1516320754','0','1','','7986','8422','','','0','2000000','0','0','','','','','0','1','','35545152759');
INSERT INTO `pa_personal` VALUES ('25','0','0','大个','11','1','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','4','0.00','99973555.00','c4ca4238a0b923820dcc509a6f75849b','哈撒ki1','','1','0','0','0','1521012702','1511317903','','','','','ad23270f28221d5cada558a45a46b939','0','1A4MI4LRRT','tdcgaVDNs6diGqJeB+jqvsCCjH4o6JjLdHR8Js6hTz8S7IBVEz','0','','0','1','','505','406','','','0','2000000','0','0','','','','','0','0','e408a18682580ce988be6aeb149595b97205a47c','20134152759');
INSERT INTO `pa_personal` VALUES ('47','0','0','','0','0','/Uploads/My/2018-05-28/222105b0ba4e32332b.png','/Public/Img/default/bgdefault.jpg','5','999999.00','968665.67','c4ca4238a0b923820dcc509a6f75849b','张家奇','','1','0','0','0','1527832657','1519872474','','','','','b2798d73b47516142f19401cfb45b58e','0','JBD6JD50GC','','123','','0','2','1','444168','472003','','','100','2013542','0','0','','','','','0','1','bc2932f59739041eb8d6617ba5c65c2dd2548e48','32046152759');
INSERT INTO `pa_personal` VALUES ('50','0','0','','0','0','/Uploads/My/2018-05-16/313935afbeda6a9253.png','/Public/Img/default/bgdefault.jpg','6','99999.00','69498.99','c4ca4238a0b923820dcc509a6f75849b','木木','','1','0','0','0','1527316920','1526454216','','','','','a5f3f7516956f8ae995ad5c1b9b11e54','0','YHQC25CWSH','','0','','0','1','','227652','242022','','192.168.2.137','0','2000000','0','0','','','','','0','1','ce32259d38e7336b764de21bf46582ad885d88f3','57790152759');
INSERT INTO `pa_personal` VALUES ('51','0','0','','0','0','/Uploads/My/2018-05-16/123175afbedd658832.png','/Public/Img/default/bgdefault.jpg','4','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','185****2404','','1','0','0','0','1526455406','1526455177','','','','','36553334122d90914fd1d1b083162865','0','EYB954U9YJ','','0','','0','24','24','456','456','','::1','0','2000000','0','0','130404199608111217','','','','0','0','','44324152759');
INSERT INTO `pa_personal` VALUES ('52','0','0','','0','0','/Uploads/My/2018-05-31/34835b0f4ed98bab5.png','/Public/Img/default/bgdefault.jpg','8','99999.00','96499.00','c4ca4238a0b923820dcc509a6f75849b','张佳琦','','1','0','0','0','1527588795','1526459507','','','','','dc9141625ef91bbfc5f1a8b610caa522','0','1WDGQEG942','','1','','0','25','','61814','62038','','192.168.2.114','139','1994831','0','0','','','','','0','1','a6ab006ce62ed16654decfb84ebf4061d4c6595a','37570152759');
INSERT INTO `pa_personal` VALUES ('53','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','9','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','157****8819','','2','0','0','0','1526536017','1526536005','','','','','2f5d826ed159312412e0ccccfe9b615c','0','E0K5NBSGHV','','0','','0','47','2','458','458','','192.168.2.176','0','2000000','0','0','','','','','0','0','','70619152759');
INSERT INTO `pa_personal` VALUES ('54','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','10','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','小蝌蚪1','','3','0','0','0','0','0','','','','','1','0','E0WYLJKP94','','0','','0','52','25','1403','406','','0.0.0.0','0','2000000','0','0','','','','','0','0','','37872152759');
INSERT INTO `pa_personal` VALUES ('55','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','11','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','小蝌蚪2','','1','0','0','0','0','0','','','','','1','0','9OPLRUUB5C','','0','','0','1','','1403','406','','0.0.0.0','0','2000000','0','0','','','','','0','0','','16363152759');
INSERT INTO `pa_personal` VALUES ('56','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','12','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','小蝌蚪3','','1','0','0','0','0','0','','','','','1','0','CDM5NA1JRF','','0','','0','2','1','1403','406','','0.0.0.0','0','2000000','0','0','','','','','0','0','','10532152759');
INSERT INTO `pa_personal` VALUES ('57','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','13','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','小蝌蚪4','','1','0','0','0','0','0','','','','','1','0','Y6B5Y0W9TS','','0','','0','24','1','1403','406','','0.0.0.0','0','2000000','0','0','','','','','0','0','','31673152759');
INSERT INTO `pa_personal` VALUES ('58','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','14','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','小蝌蚪5','','3','0','0','0','0','0','','','','','1','0','A241KGAARV','','0','','0','25','25','1403','406','','0.0.0.0','0','2000000','0','0','','','','','0','0','','28325152759');
INSERT INTO `pa_personal` VALUES ('59','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','15','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','小蝌蚪6','','1','0','0','0','0','0','','','','','1','0','Z5ENFZGFJW','','0','','0','47','2','1403','406','','0.0.0.0','0','2000000','0','0','','','','','0','0','','38852152759');
INSERT INTO `pa_personal` VALUES ('60','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','16','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','小蝌蚪7','','1','0','0','0','0','0','','','','','1','0','8OY3M02MX3','','0','','0','54','52','1403','406','','0.0.0.0','0','2000000','0','0','','','','','0','0','','82460152759');
INSERT INTO `pa_personal` VALUES ('61','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','17','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','小蝌蚪8','','1','0','0','0','0','0','','','','','1','0','2D25HRB4Z0','','0','','0','55','1','1403','406','','0.0.0.0','0','2000000','0','0','','','','','0','0','','69894152759');
INSERT INTO `pa_personal` VALUES ('62','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','18','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','小蝌蚪9','','1','0','0','0','0','0','','','','','1','0','0XZJSN9RRT','','0','','0','60','54','1403','406','','0.0.0.0','0','2000000','0','0','','','','','0','0','','60086152759');
INSERT INTO `pa_personal` VALUES ('63','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','19','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','小蝌蚪10','','1','0','0','0','0','0','','','','','1','0','H6P8T1WJWW','','0','','0','61','55','1403','406','','0.0.0.0','0','2000000','0','0','','','','','0','0','','63978152759');
INSERT INTO `pa_personal` VALUES ('64','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','20','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','小蝌蚪11','','1','0','0','0','0','0','','','','','1','0','99PMIS2MKH','','0','','0','62','60','1403','406','','0.0.0.0','0','2000000','0','0','','','','','0','0','','81790152759');
INSERT INTO `pa_personal` VALUES ('65','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','21','0.00','0.00','c4ca4238a0b923820dcc509a6f75849b','小蝌蚪12','','1','0','0','0','0','0','','','','','1','0','XK79J46WUE','','0','','0','63','61','1403','406','','0.0.0.0','0','2000000','0','0','','','','','0','0','','24971152759');
INSERT INTO `pa_personal` VALUES ('66','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','15527044921','0.00','0.00','32e1b88d83c23828f861781658b708c0','155****4921','','','0','0','0','1527751658','1527751642','','','','','7afd1de3d577e6852fd0193117e5b546','0','YJXT7G39HO','','a123123','','0','','','52','52','','59.172.195.154','','0','','0','','','','','0','1','','49339152775');
INSERT INTO `pa_personal` VALUES ('67','0','0','','0','0','/Uploads/default/header.png','/Public/Img/default/bgdefault.jpg','13971031666','0.00','0.00','b6e18504a44044f785d7807329ac2184','139****1666','','','0','0','0','1527754622','1527754586','','','','','45c4193b46bdfc43b1bf06ea97d35705','0','OHO19TSSTP','','a123123','','0','','','54','54','','113.90.37.56','','0','','0','','','','','0','1','','63401152775');


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
INSERT INTO `pa_product` VALUES ('1','13','BT-1云矿机','500.00','0.001','1.50','133','','','0','','1521082539','1527603640','<p>
	1dascaasd
</p>
<p>
	12
</p>
<p>
	121
</p>','zh-cn','1','0','0','0','','','','','','','','','');
INSERT INTO `pa_product` VALUES ('2','15','BT-2云矿机','2000.00','0.001','2.00','132','','','0','','1521083469','1527603634','','zh-cn','1','0','0','0','','','','','','','','','');
INSERT INTO `pa_product` VALUES ('3','14','BT-3云矿机','5000.00','0.001','2.50','131','','','0','','1521083486','1527603627','','zh-cn','1','0','0','0','','','','','','','','','');
INSERT INTO `pa_product` VALUES ('4','14','BT-4云矿机','10000.00','0.001','3.00','130','','','0','','1521083499','1527603618','','zh-cn','1','0','0','0','','','','','','','','','');
INSERT INTO `pa_product` VALUES ('5','13','BT-5云矿机','50000.00','0.001','3.50','129','','','0','','1521083526','1527603607','112121撒多层次傻','zh-cn','1','0','0','0','','','','','','','','','');


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
INSERT INTO `pa_sign` VALUES ('1','24','张家奇','15231115232','','27','','1532532545','subject','','','100.00');
INSERT INTO `pa_sign` VALUES ('2','24','张家奇','15231115232','','0','','1561234567','column','2','','400.00');
INSERT INTO `pa_sign` VALUES ('3','48','','','','10','','1561234567','subject','','','0.00');
INSERT INTO `pa_sign` VALUES ('4','48','','','','0','','1561234567','column','2','','500.00');
INSERT INTO `pa_sign` VALUES ('5','24','张家奇','15231115232','北京市朝阳区立水桥地铁站附近','15','trtt','1520589817','subject','','','67.00');
INSERT INTO `pa_sign` VALUES ('6','24','张家奇','15231115232','北京市朝阳区立水桥地铁站附近','0','','1520590182','column','2','','111.00');
INSERT INTO `pa_sign` VALUES ('8','24','张家奇','15231115232','北京市朝阳区立水桥地铁站附近','17','rt','1520596483','subject','','','67.00');
INSERT INTO `pa_sign` VALUES ('9','24','张家奇','15231115232','北京','18','676','1520676868','subject','','','67.00');
INSERT INTO `pa_sign` VALUES ('10','24','张家奇','15231115232','北京','0','','1520680890','column','3','西方文化通论 

','111.00');
INSERT INTO `pa_sign` VALUES ('11','25','yuy','13691255667','','25','df','1520924159','subject','','','66.00');
INSERT INTO `pa_sign` VALUES ('12','25','sd','13691255667','','0','','1520924273','column','1','综合课程','100.00');
INSERT INTO `pa_sign` VALUES ('13','25','kjkk','jk','','24','rft','1520925027','subject','','','565.00');


# 数据库表：pa_signup 数据信息
INSERT INTO `pa_signup` VALUES ('1','24','胡文亮','15134041905','男','21','哈哈','辽宁阜新','1','9');
INSERT INTO `pa_signup` VALUES ('4','24','胡文亮','15134041905','男','21','哈哈','辽宁阜新','1','8');
INSERT INTO `pa_signup` VALUES ('11','65','twut','组图t','女','moul','tutut','ljut','1','5');
INSERT INTO `pa_signup` VALUES ('12','65','啦啦啦','ll','男','tj','ne','mof','1','8');


# 数据库表：pa_sub_category 数据信息
INSERT INTO `pa_sub_category` VALUES ('5','语数外','0','','n','zh-cn','/Uploads/image/activity/20180307/20180307164920_95446.png');
INSERT INTO `pa_sub_category` VALUES ('2','文综合','0','','n','zh-cn','/Uploads/image/activity/20180307/20180307164937_78659.png');
INSERT INTO `pa_sub_category` VALUES ('3','理综合','0','','n','zh-cn','/Uploads/image/activity/20180307/20180307164958_37539.png');
INSERT INTO `pa_sub_category` VALUES ('4','研究生','0','','n','zh-cn','/Uploads/image/activity/20180307/20180307164947_47619.png');
INSERT INTO `pa_sub_category` VALUES ('7','艺术课','0','1519867485','n','zh-cn','/Uploads/image/activity/20180307/20180307165009_24523.png');
INSERT INTO `pa_sub_category` VALUES ('8','推广课','0','1520326100','n','zh-cn','/Uploads/image/activity/20180307/20180307165021_36864.png');
INSERT INTO `pa_sub_category` VALUES ('13','语文','5','1520411569','n','zh-cn','');
INSERT INTO `pa_sub_category` VALUES ('14','数学','5','1520411578','n','zh-cn','');
INSERT INTO `pa_sub_category` VALUES ('15','外语','5','1520411590','n','zh-cn','');


# 数据库表：pa_subsidy 数据信息


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
INSERT INTO `pa_withdrawals` VALUES ('30','24','100','1.00','1519897494','0','支付宝','100','15134041905');


# 数据库表：pa_yzm 数据信息
INSERT INTO `pa_yzm` VALUES ('176','18311187547','1216');
INSERT INTO `pa_yzm` VALUES ('172','13120186909','3471');
INSERT INTO `pa_yzm` VALUES ('175','18793616263','1698');
INSERT INTO `pa_yzm` VALUES ('167','15762357777','8443');
INSERT INTO `pa_yzm` VALUES ('173','13120186909','4303');
INSERT INTO `pa_yzm` VALUES ('194','17051103605','6238');
INSERT INTO `pa_yzm` VALUES ('193','17051103605','5463');
INSERT INTO `pa_yzm` VALUES ('244','15231115232','7277');
INSERT INTO `pa_yzm` VALUES ('202','18811710388','5963');
INSERT INTO `pa_yzm` VALUES ('210','15996585266','2541');
INSERT INTO `pa_yzm` VALUES ('243','13636565959','3503');
INSERT INTO `pa_yzm` VALUES ('242','13691255667','4651');
INSERT INTO `pa_yzm` VALUES ('241','13691255667','1157');
INSERT INTO `pa_yzm` VALUES ('240','13691255667','9368');
INSERT INTO `pa_yzm` VALUES ('238','15231115232','2276');
INSERT INTO `pa_yzm` VALUES ('237','13691255667','6348');
INSERT INTO `pa_yzm` VALUES ('245','15231115232','9854');
INSERT INTO `pa_yzm` VALUES ('246','13691255667','2830');


# 数据库表：pa_zan 数据信息
INSERT INTO `pa_zan` VALUES ('','9','24','','1521014480','');
INSERT INTO `pa_zan` VALUES ('','9','25','','1521013122','');
