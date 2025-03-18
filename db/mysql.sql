DROP DATABASE IF EXISTS jsptNHaA;

CREATE DATABASE jsptNHaA default character set utf8mb4 collate utf8mb4_general_ci;

USE jsptNHaA;

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`yonghuming` varchar(200) NOT NULL UNIQUE   COMMENT '用户名',
	`mima` varchar(200)    COMMENT '密码',
	`xingming` varchar(200)    COMMENT '姓名',
	`xingbie` varchar(200)    COMMENT '性别',
	`touxiang` varchar(200)    COMMENT '头像',
	`shenfenzheng` varchar(200)    COMMENT '身份证',
	`shouji` varchar(200)    COMMENT '手机',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

DROP TABLE IF EXISTS `shangjia`;

CREATE TABLE `shangjia` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`shangjiazhanghao` varchar(200) NOT NULL UNIQUE   COMMENT '商家账号',
	`mima` varchar(200) NOT NULL   COMMENT '密码',
	`shangjiamingcheng` varchar(200)    COMMENT '商家名称',
	`fuzerenxingming` varchar(200)    COMMENT '负责人姓名',
	`lianxidianhua` varchar(200)    COMMENT '联系电话',
	`xiangxidizhi` varchar(200)    COMMENT '详细地址',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家';

DROP TABLE IF EXISTS `qicaifenlei`;

CREATE TABLE `qicaifenlei` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`qicaileixing` varchar(200) NOT NULL   COMMENT '器材类型',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='器材分类';

DROP TABLE IF EXISTS `qicaixinxi`;

CREATE TABLE `qicaixinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`qicaibianhao` varchar(200) NOT NULL UNIQUE   COMMENT '器材编号',
	`qicaimingcheng` varchar(200)    COMMENT '器材名称',
	`qicaileixing` varchar(200)    COMMENT '器材类型',
	`tupian` varchar(200)    COMMENT '图片',
	`jianjie` longtext    COMMENT '简介',
	`zulinguize` longtext    COMMENT '租赁规则',
	`shuliang` int    COMMENT '数量',
	`meitianjiage` int NOT NULL   COMMENT '每天价格',
	`shangjiazhanghao` varchar(200)    COMMENT '商家账号',
	`shangjiamingcheng` varchar(200)    COMMENT '商家名称',
	`xiangxidizhi` varchar(200)    COMMENT '详细地址',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='器材信息';

DROP TABLE IF EXISTS `qicaizulin`;

CREATE TABLE `qicaizulin` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`dingdanbianhao` varchar(200)  UNIQUE   COMMENT '订单编号',
	`qicaibianhao` varchar(200)    COMMENT '器材编号',
	`qicaimingcheng` varchar(200)    COMMENT '器材名称',
	`qicaileixing` varchar(200)    COMMENT '器材类型',
	`meitianjiage` varchar(200)    COMMENT '每天价格',
	`shuliang` int    COMMENT '数量',
	`zulintianshu` int    COMMENT '租赁天数',
	`zongjine` varchar(200)    COMMENT '总金额',
	`zulinriqi` date    COMMENT '租赁日期',
	`yonghuming` varchar(200)    COMMENT '用户名',
	`xingming` varchar(200)    COMMENT '姓名',
	`sfsh` varchar(200)   default '否' COMMENT '是否审核',
	`shhf` longtext    COMMENT '审核回复',
	`ispay` varchar(200)   default '未支付' COMMENT '是否支付',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='器材租赁';

DROP TABLE IF EXISTS `liaotianxinxi`;

CREATE TABLE `liaotianxinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`shangjiazhanghao` varchar(200) NOT NULL   COMMENT '商家账号',
	`lianxidianhua` varchar(200)    COMMENT '联系电话',
	`liaotianneirong` longtext    COMMENT '聊天内容',
	`fasongriqi` date    COMMENT '发送日期',
	`yonghuming` varchar(200)    COMMENT '用户名',
	`xingming` varchar(200)    COMMENT '姓名',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天信息';

DROP TABLE IF EXISTS `liaotianhuifu`;

CREATE TABLE `liaotianhuifu` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`yonghuming` varchar(200)    COMMENT '用户名',
	`xingming` varchar(200)    COMMENT '姓名',
	`liaotianhuifu` longtext    COMMENT '聊天回复',
	`fasongriqi` date    COMMENT '发送日期',
	`shangjiazhanghao` varchar(200)    COMMENT '商家账号',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='聊天回复';

DROP TABLE IF EXISTS `guihaitixing`;

CREATE TABLE `guihaitixing` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`qicaibianhao` varchar(200)    COMMENT '器材编号',
	`qicaimingcheng` varchar(200)    COMMENT '器材名称',
	`yonghuming` varchar(200)    COMMENT '用户名',
	`xingming` varchar(200)    COMMENT '姓名',
	`tixingneirong` longtext    COMMENT '提醒内容',
	`tixingriqi` date    COMMENT '提醒日期',
	`shangjiazhanghao` varchar(200)    COMMENT '商家账号',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='归还提醒';

DROP TABLE IF EXISTS `zulinfankui`;

CREATE TABLE `zulinfankui` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`mingcheng` varchar(200) NOT NULL   COMMENT '名称',
	`fankuineirong` longtext    COMMENT '反馈内容',
	`fankuiriqi` date    COMMENT '反馈日期',
	`shangjiazhanghao` varchar(200)    COMMENT '商家账号',
	`lianxidianhua` varchar(200)    COMMENT '联系电话',
	`sfsh` varchar(200)   default '否' COMMENT '是否审核',
	`shhf` longtext    COMMENT '审核回复',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租赁反馈';

DROP TABLE IF EXISTS `yajinjiaona`;

CREATE TABLE `yajinjiaona` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`yonghuming` varchar(200)    COMMENT '用户名',
	`xingming` varchar(200)    COMMENT '姓名',
	`yajin` int    COMMENT '押金',
	`beizhu` longtext    COMMENT '备注',
	`sfsh` varchar(200)   default '否' COMMENT '是否审核',
	`shhf` longtext    COMMENT '审核回复',
	`ispay` varchar(200)   default '未支付' COMMENT '是否支付',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='押金缴纳';

DROP TABLE IF EXISTS `kouchuyajin`;

CREATE TABLE `kouchuyajin` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`yonghuming` varchar(200)    COMMENT '用户名',
	`xingming` varchar(200)    COMMENT '姓名',
	`yajin` varchar(200)    COMMENT '押金',
	`liyou` longtext    COMMENT '理由',
	`riqi` date    COMMENT '日期',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扣除押金';

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`title` varchar(200)    COMMENT '帖子标题',
	`content` longtext NOT NULL   COMMENT '帖子内容',
	`parentid` bigint    COMMENT '父节点id',
	`userid` bigint NOT NULL   COMMENT '用户id',
	`username` varchar(200)    COMMENT '用户名',
	`isdone` varchar(200)    COMMENT '是否关闭[关闭/开放]',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛表';

DROP TABLE IF EXISTS `storeup`;

CREATE TABLE `storeup` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`userid` bigint NOT NULL   COMMENT '用户id',
	`refid` bigint    COMMENT '收藏id',
	`tablename` varchar(200)    COMMENT '表名',
	`name` varchar(200) NOT NULL   COMMENT '收藏名称',
	`picture` varchar(200) NOT NULL   COMMENT '收藏图片',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`title` varchar(200) NOT NULL   COMMENT '标题',
	`picture` varchar(200) NOT NULL   COMMENT '图片',
	`content` longtext NOT NULL   COMMENT '内容',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻资讯';

DROP TABLE IF EXISTS `discussqicaixinxi`;

CREATE TABLE `discussqicaixinxi` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP,
	`refid` bigint NOT NULL   COMMENT '关联表id',
	`content` varchar(200) NOT NULL   COMMENT '评论内容',
	`userid` bigint NOT NULL   COMMENT '用户id',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='器材信息评论表';


DROP TABLE IF EXISTS `config`;

CREATE TABLE `config`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL COMMENT '配置参数名称',
	`value` varchar(100) COMMENT '配置参数值',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文件';

insert into config(id,name) values(1,'picture1');
insert into config(id,name) values(2,'picture2');
insert into config(id,name) values(3,'picture3');
insert into config(id,name) values(4,'picture4');
insert into config(id,name) values(5,'picture5');
insert into config(id,name) values(6,'homepage');


DROP TABLE IF EXISTS `users`;

CREATE TABLE `users`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`username` varchar(100) NOT NULL COMMENT '用户名',
	`password` varchar(100) NOT NULL COMMENT '密码',
	`role` varchar(100) default '管理员' COMMENT '角色',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '新增时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

insert into users(id,username, password) values(1,'abo','abo');

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token`(
	`id` bigint NOT NULL AUTO_INCREMENT,
	`userid` bigint NOT NULL COMMENT '用户id',
	`username` varchar(100) NOT NULL COMMENT '用户名',
	`tablename` varchar(100) COMMENT '表名',
	`role` varchar(100) COMMENT '角色',
	`token` varchar(200) NOT NULL COMMENT '密码',
	`addtime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '新增时间',
	`expiratedtime` timestamp COMMENT '过期时间',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token表';

