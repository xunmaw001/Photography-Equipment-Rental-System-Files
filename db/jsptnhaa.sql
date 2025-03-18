/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50560
Source Host           : localhost:3306
Source Database       : jsptnhaa

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2020-10-09 18:23:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('2', 'picture2', 'http://localhost:8080/jsptNHaA/upload/1602200354342.png');
INSERT INTO `config` VALUES ('3', 'picture3', 'http://localhost:8080/jsptNHaA/upload/1602201098344.png');
INSERT INTO `config` VALUES ('4', 'picture4', 'http://localhost:8080/jsptNHaA/upload/1602200685726.png');
INSERT INTO `config` VALUES ('5', 'picture5', 'http://localhost:8080/jsptNHaA/upload/1602200866890.png');
INSERT INTO `config` VALUES ('6', 'homepage', 'http://localhost:8080/jsptNHaA/upload/1602200874444.png');

-- ----------------------------
-- Table structure for `discussqicaixinxi`
-- ----------------------------
DROP TABLE IF EXISTS `discussqicaixinxi`;
CREATE TABLE `discussqicaixinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `content` varchar(200) NOT NULL COMMENT '评论内容',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1602201521037 DEFAULT CHARSET=utf8 COMMENT='器材信息评论表';

-- ----------------------------
-- Records of discussqicaixinxi
-- ----------------------------
INSERT INTO `discussqicaixinxi` VALUES ('1602180190905', '2020-10-09 02:03:10', '1602178604776', '1212', '1602178344619');
INSERT INTO `discussqicaixinxi` VALUES ('1602201521036', '2020-10-09 07:58:40', '1602178604776', '看着很好用', '1602201441392');

-- ----------------------------
-- Table structure for `forum`
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `isdone` varchar(200) DEFAULT NULL COMMENT '是否关闭[关闭/开放]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1602201824394 DEFAULT CHARSET=utf8 COMMENT='论坛表';

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES ('1602180219718', '2020-10-09 02:03:38', '哪个牌子的摄像机好用', '大家给些意见\r\n', '0', '1602178344619', '1', '开放');
INSERT INTO `forum` VALUES ('1602201804287', '2020-10-09 08:03:23', '摄像机那种比较好', '大家来告诉我下摄像机哪种好\r\n', '0', '1602201441392', '3', '开放');
INSERT INTO `forum` VALUES ('1602201824393', '2020-10-09 08:03:43', null, '索尼的比较好，拍的很清楚', '1602180219718', '1602201441392', '3', null);

-- ----------------------------
-- Table structure for `guihaitixing`
-- ----------------------------
DROP TABLE IF EXISTS `guihaitixing`;
CREATE TABLE `guihaitixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qicaibianhao` varchar(200) DEFAULT NULL COMMENT '器材编号',
  `qicaimingcheng` varchar(200) DEFAULT NULL COMMENT '器材名称',
  `yonghuming` varchar(200) DEFAULT NULL COMMENT '用户名',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `tixingneirong` longtext COMMENT '提醒内容',
  `tixingriqi` date DEFAULT NULL COMMENT '提醒日期',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商家账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1602202079384 DEFAULT CHARSET=utf8 COMMENT='归还提醒';

-- ----------------------------
-- Records of guihaitixing
-- ----------------------------
INSERT INTO `guihaitixing` VALUES ('1602198987937', '2020-10-09 07:16:27', '01', '索尼64万像素照相机', '1', '李铭', '亲爱的顾客，你租赁的时间还有两天就要快到了，记得按时归还', '2020-10-29', '001');
INSERT INTO `guihaitixing` VALUES ('1602202079383', '2020-10-09 08:07:58', '01', '索尼64万像素照相机', '3', '小敏', '亲爱的用户，你租赁的无线飞机即将到期，记得按时归还', '2020-10-31', '003');

-- ----------------------------
-- Table structure for `kouchuyajin`
-- ----------------------------
DROP TABLE IF EXISTS `kouchuyajin`;
CREATE TABLE `kouchuyajin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `yonghuming` varchar(200) DEFAULT NULL COMMENT '用户名',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `yajin` varchar(200) DEFAULT NULL COMMENT '押金',
  `liyou` longtext COMMENT '理由',
  `riqi` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1602202279568 DEFAULT CHARSET=utf8 COMMENT='扣除押金';

-- ----------------------------
-- Records of kouchuyajin
-- ----------------------------
INSERT INTO `kouchuyajin` VALUES ('1602180781356', '2020-10-09 02:13:00', '1', '李铭', '200', '经常不按时归还', '2020-10-31');
INSERT INTO `kouchuyajin` VALUES ('1602201885045', '2020-10-09 08:04:44', '1', '李铭', '1800', '经常不按时归还', '2020-04-16');
INSERT INTO `kouchuyajin` VALUES ('1602201911967', '2020-10-09 08:05:11', '3', '小敏', '200', '不按时归还', '2020-10-01');
INSERT INTO `kouchuyajin` VALUES ('1602202279567', '2020-10-09 08:11:19', '3', '小敏', '500', '不按时还归还物品', '2020-10-24');

-- ----------------------------
-- Table structure for `liaotianhuifu`
-- ----------------------------
DROP TABLE IF EXISTS `liaotianhuifu`;
CREATE TABLE `liaotianhuifu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `yonghuming` varchar(200) DEFAULT NULL COMMENT '用户名',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `liaotianhuifu` longtext COMMENT '聊天回复',
  `fasongriqi` date DEFAULT NULL COMMENT '发送日期',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商家账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1602202106711 DEFAULT CHARSET=utf8 COMMENT='聊天回复';

-- ----------------------------
-- Records of liaotianhuifu
-- ----------------------------
INSERT INTO `liaotianhuifu` VALUES ('1602180600556', '2020-10-09 02:10:00', '1', '李铭', '都是好的', '2020-10-31', '001');
INSERT INTO `liaotianhuifu` VALUES ('1602202106710', '2020-10-09 08:08:25', '3', '小敏', '是的都是好的，可以放心使用', '2020-10-01', '003');

-- ----------------------------
-- Table structure for `liaotianxinxi`
-- ----------------------------
DROP TABLE IF EXISTS `liaotianxinxi`;
CREATE TABLE `liaotianxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shangjiazhanghao` varchar(200) NOT NULL COMMENT '商家账号',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `liaotianneirong` longtext COMMENT '聊天内容',
  `fasongriqi` date DEFAULT NULL COMMENT '发送日期',
  `yonghuming` varchar(200) DEFAULT NULL COMMENT '用户名',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1602201760701 DEFAULT CHARSET=utf8 COMMENT='聊天信息';

-- ----------------------------
-- Records of liaotianxinxi
-- ----------------------------
INSERT INTO `liaotianxinxi` VALUES ('1602179100924', '2020-10-09 01:45:00', '001', '15214121412', '请问器材都是好的吗', '2020-10-31', '1', '李铭');
INSERT INTO `liaotianxinxi` VALUES ('1602201760700', '2020-10-09 08:02:40', '003', '15214121412', '这些器材都是好的吗', '2020-10-01', '3', '小敏');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(200) NOT NULL COMMENT '标题',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1602202343857 DEFAULT CHARSET=utf8 COMMENT='新闻资讯';

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1602179854570', '2020-10-09 01:57:34', '特朗普得新冠', 'http://localhost:8080/jsptNHaA/upload/1602179828869.jpg', '经过诊断特兰普夫妇都得了新冠\r\n');
INSERT INTO `news` VALUES ('1602179888541', '2020-10-09 01:58:08', '器材租赁公告', 'http://localhost:8080/jsptNHaA/upload/1602179874936.jpg', '要租赁器材必须先交纳押金\r\n');
INSERT INTO `news` VALUES ('1602179946544', '2020-10-09 01:59:05', '租赁须知', 'http://localhost:8080/jsptNHaA/upload/1602179905870.jpg', '租赁前要先交纳押金，租赁后要保管好，而且要按时归还\r\n');
INSERT INTO `news` VALUES ('1602180019326', '2020-10-09 02:00:18', '租赁处罚', 'http://localhost:8080/jsptNHaA/upload/1602179956550.jpg', '如果不按时归还，那么将会扣除您的押金，除此之外，如果经常租赁不还，严重的将会删号，所以希望大家都能够自觉遵守。\r\n');
INSERT INTO `news` VALUES ('1602180289598', '2020-10-09 02:04:48', '11好台风即将来临', 'http://localhost:8080/jsptNHaA/upload/1602180279533.jpg', '11号台风即将来临\r\n');
INSERT INTO `news` VALUES ('1602180347779', '2020-10-09 02:05:46', '新冠病毒研究出了解药', 'http://localhost:8080/jsptNHaA/upload/1602180337049.jpg', '新冠病毒已经研究出了解药\r\n');
INSERT INTO `news` VALUES ('1602201391637', '2020-10-09 07:56:31', '租赁公告', 'http://localhost:8080/jsptNHaA/upload/1602201376619.jpg', '这里可以发布新闻信息 也可以发布一些公告信息\r\n');
INSERT INTO `news` VALUES ('1602202343856', '2020-10-09 08:12:23', '处罚公告', 'http://localhost:8080/jsptNHaA/upload/1602202304639.jpg', '用户3没有按时归还物品，扣押金500，如果还出现严重的行为，有可能删除账号，请大家自觉\r\n');

-- ----------------------------
-- Table structure for `qicaifenlei`
-- ----------------------------
DROP TABLE IF EXISTS `qicaifenlei`;
CREATE TABLE `qicaifenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qicaileixing` varchar(200) NOT NULL COMMENT '器材类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1602201305779 DEFAULT CHARSET=utf8 COMMENT='器材分类';

-- ----------------------------
-- Records of qicaifenlei
-- ----------------------------
INSERT INTO `qicaifenlei` VALUES ('1602178398239', '2020-10-09 01:33:18', '柔光灯');
INSERT INTO `qicaifenlei` VALUES ('1602178402235', '2020-10-09 01:33:22', '照相机');
INSERT INTO `qicaifenlei` VALUES ('1602178408701', '2020-10-09 01:33:28', '摄影灯');
INSERT INTO `qicaifenlei` VALUES ('1602178879961', '2020-10-09 01:41:19', '支架');
INSERT INTO `qicaifenlei` VALUES ('1602201297575', '2020-10-09 07:54:57', '摄像机');
INSERT INTO `qicaifenlei` VALUES ('1602201305778', '2020-10-09 07:55:05', '其他');

-- ----------------------------
-- Table structure for `qicaixinxi`
-- ----------------------------
DROP TABLE IF EXISTS `qicaixinxi`;
CREATE TABLE `qicaixinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qicaibianhao` varchar(200) NOT NULL COMMENT '器材编号',
  `qicaimingcheng` varchar(200) DEFAULT NULL COMMENT '器材名称',
  `qicaileixing` varchar(200) DEFAULT NULL COMMENT '器材类型',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `jianjie` longtext COMMENT '简介',
  `zulinguize` longtext COMMENT '租赁规则',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `meitianjiage` int(11) NOT NULL COMMENT '每天价格',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商家账号',
  `shangjiamingcheng` varchar(200) DEFAULT NULL COMMENT '商家名称',
  `xiangxidizhi` varchar(200) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `qicaibianhao` (`qicaibianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1602202019136 DEFAULT CHARSET=utf8 COMMENT='器材信息';

-- ----------------------------
-- Records of qicaixinxi
-- ----------------------------
INSERT INTO `qicaixinxi` VALUES ('1602178604776', '2020-10-09 01:36:44', '01', '索尼64万像素照相机', '柔光灯', 'http://localhost:8080/jsptNHaA/upload/1602178498282.jpg', '<img src=\"http://localhost:8080/jsptNHaA/upload/1602178560993.jpg\" width=\"100\" height=\"100\" _src=\"http://localhost:8080/jsptNHaA/upload/1602178560993.jpg\">\r\n非常高清的像素，有很好的捕捉物品的能力，无论是动的还是静止的都能很准确的排到高清的图片\r\n', '需要交纳押金才能租赁，按一天的价格收费，使用过程必须要小心，不能有损坏，否则按全价赔偿', '94', '100', '001', '爱丽丝摄影', '北京市环市路');
INSERT INTO `qicaixinxi` VALUES ('1602178698042', '2020-10-09 01:38:17', '02', '摄影灯', '摄影灯', 'http://localhost:8080/jsptNHaA/upload/1602178643497.jpg', '<img src=\"http://localhost:8080/jsptNHaA/upload/1602178668257.jpg\" width=\"100\" height=\"100\" _src=\"http://localhost:8080/jsptNHaA/upload/1602178668257.jpg\">能很好的调整各种灯光的亮度，使得拍照或者摄影都能有很好的效果\r\n', '需要交纳押金才能租赁', '25', '150', '001', '爱丽丝摄影', '北京市环市路');
INSERT INTO `qicaixinxi` VALUES ('1602178790061', '2020-10-09 01:39:49', '03', '摄影机', '柔光灯', 'http://localhost:8080/jsptNHaA/upload/1602178756084.jpg', '<img src=\"http://localhost:8080/jsptNHaA/upload/1602178773682.jpg\" width=\"100\" height=\"100\" _src=\"http://localhost:8080/jsptNHaA/upload/1602178773682.jpg\">\r\n能够很好的调节自己需要的灯光亮度\r\n', '需要交纳押金才能租赁', '150', '50', '001', '爱丽丝摄影', '北京市环市路');
INSERT INTO `qicaixinxi` VALUES ('1602178930900', '2020-10-09 01:42:10', '001', '相机支架', '支架', 'http://localhost:8080/jsptNHaA/upload/1602178905540.jpg', '<img src=\"http://localhost:8080/jsptNHaA/upload/1602178914776.jpg\" width=\"100\" height=\"100\" _src=\"http://localhost:8080/jsptNHaA/upload/1602178914776.jpg\">\r\n能更好的固定，这样使得拍摄能更好的进行\r\n', '需要交纳押金才能租赁', '200', '20', '002', '爱思', '北京市环市路');
INSERT INTO `qicaixinxi` VALUES ('1602179049073', '2020-10-09 01:44:08', '003', '柔光灯', '柔光灯', 'http://localhost:8080/jsptNHaA/upload/1602179025983.jpg', '<img src=\"http://localhost:8080/jsptNHaA/upload/1602179042124.jpg\" width=\"100\" height=\"100\" _src=\"http://localhost:8080/jsptNHaA/upload/1602179042124.jpg\">\r\n能很好的调节灯光\r\n', '需要交纳押金才能租赁', '200', '50', '002', '爱思', '北京市环市路');
INSERT INTO `qicaixinxi` VALUES ('1602202019135', '2020-10-09 08:06:58', '0003', '无线遥控飞机', '其他', 'http://localhost:8080/jsptNHaA/upload/1602201973231.jpg', '<img src=\"http://localhost:8080/jsptNHaA/upload/1602201997287.jpg\" width=\"100\" height=\"100\" _src=\"http://localhost:8080/jsptNHaA/upload/1602201997287.jpg\">\r\n可以进行空中拍摄，能完成一些不能拍摄的场景\r\n', '租赁后要按时归还', '100', '200', '003', '可想摄像', '北京市人民南路');

-- ----------------------------
-- Table structure for `qicaizulin`
-- ----------------------------
DROP TABLE IF EXISTS `qicaizulin`;
CREATE TABLE `qicaizulin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dingdanbianhao` varchar(200) DEFAULT NULL COMMENT '订单编号',
  `qicaibianhao` varchar(200) DEFAULT NULL COMMENT '器材编号',
  `qicaimingcheng` varchar(200) DEFAULT NULL COMMENT '器材名称',
  `qicaileixing` varchar(200) DEFAULT NULL COMMENT '器材类型',
  `meitianjiage` varchar(200) DEFAULT NULL COMMENT '每天价格',
  `shuliang` int(11) DEFAULT NULL COMMENT '数量',
  `zulintianshu` int(11) DEFAULT NULL COMMENT '租赁天数',
  `zongjine` varchar(200) DEFAULT NULL COMMENT '总金额',
  `zulinriqi` date DEFAULT NULL COMMENT '租赁日期',
  `yonghuming` varchar(200) DEFAULT NULL COMMENT '用户名',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dingdanbianhao` (`dingdanbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=1602201540826 DEFAULT CHARSET=utf8 COMMENT='器材租赁';

-- ----------------------------
-- Records of qicaizulin
-- ----------------------------
INSERT INTO `qicaizulin` VALUES ('1602198179696', '2020-10-09 07:02:59', '1602198156', '01', '索尼64万像素照相机', '柔光灯', '100', '2', '2', '400', '2020-10-31', '1', '李铭', '是', '租赁成功', '已支付');
INSERT INTO `qicaizulin` VALUES ('1602201540825', '2020-10-09 07:59:00', '20201097584848715271', '01', '索尼64万像素照相机', '柔光灯', '100', '2', '10', '2000', '2020-10-01', '3', '小敏', '是', '租赁成功', '已支付');

-- ----------------------------
-- Table structure for `shangjia`
-- ----------------------------
DROP TABLE IF EXISTS `shangjia`;
CREATE TABLE `shangjia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shangjiazhanghao` varchar(200) NOT NULL COMMENT '商家账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `shangjiamingcheng` varchar(200) DEFAULT NULL COMMENT '商家名称',
  `fuzerenxingming` varchar(200) DEFAULT NULL COMMENT '负责人姓名',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `xiangxidizhi` varchar(200) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shangjiazhanghao` (`shangjiazhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1602201478475 DEFAULT CHARSET=utf8 COMMENT='商家';

-- ----------------------------
-- Records of shangjia
-- ----------------------------
INSERT INTO `shangjia` VALUES ('1602178376737', '2020-10-09 01:32:56', '001', '001', '爱丽丝摄影', '王小姐', '15214121412', '北京市环市路');
INSERT INTO `shangjia` VALUES ('1602178390912', '2020-10-09 01:33:10', '002', '002', '爱思', '李总', '15214121412', '北京市环市路');
INSERT INTO `shangjia` VALUES ('1602201478474', '2020-10-09 07:57:58', '003', '003', '可想摄像', '王总', '15214121412', '北京市人民南路');

-- ----------------------------
-- Table structure for `storeup`
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1602201511884 DEFAULT CHARSET=utf8 COMMENT='收藏表';

-- ----------------------------
-- Records of storeup
-- ----------------------------
INSERT INTO `storeup` VALUES ('1602201511883', '2020-10-09 07:58:31', '1602201441392', '1602178604776', 'qicaixinxi', '索尼64万像素照相机', 'http://localhost:8080/jsptNHaA/upload/1602178498282.jpg');

-- ----------------------------
-- Table structure for `token`
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='token表';

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('1', '1', 'abo', 'users', '管理员', 'hu6goz2v089elru4ksno1toqukkh9tih', '2020-10-09 01:31:56', '2020-10-09 09:09:34');
INSERT INTO `token` VALUES ('2', '1602178376737', '001', 'shangjia', '商家', '3n3mzqpsyo2ovqh4ukvxzdqo60q5uijw', '2020-10-09 01:34:23', '2020-10-09 08:15:24');
INSERT INTO `token` VALUES ('3', '1602178344619', '1', 'yonghu', '用户', 'lfuxzney3d8pboaa3lgft83b2mbmvpbe', '2020-10-09 01:36:50', '2020-10-09 08:53:19');
INSERT INTO `token` VALUES ('4', '1602178390912', '002', 'shangjia', '商家', 'dlepqv1yc9vz640r5ymfsj6ruaqpeefj', '2020-10-09 01:39:57', '2020-10-09 02:43:31');
INSERT INTO `token` VALUES ('5', '1602178361253', '2', 'yonghu', '用户', 's4jo6feaney655wqxbu1byumgc77f2v8', '2020-10-09 07:17:20', '2020-10-09 08:17:20');
INSERT INTO `token` VALUES ('6', '1602201441392', '3', 'yonghu', '用户', 'zyx193hddnma40n8enk27szkrjdxbsfo', '2020-10-09 07:58:06', '2020-10-09 09:12:48');
INSERT INTO `token` VALUES ('7', '1602201478474', '003', 'shangjia', '商家', 'xiefliunb54o63lbelv52m6o2l554r4m', '2020-10-09 08:05:30', '2020-10-09 09:12:34');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'abo', 'abo', '管理员', '2020-10-09 01:30:57');

-- ----------------------------
-- Table structure for `yajinjiaona`
-- ----------------------------
DROP TABLE IF EXISTS `yajinjiaona`;
CREATE TABLE `yajinjiaona` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `yonghuming` varchar(200) DEFAULT NULL COMMENT '用户名',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `yajin` int(11) DEFAULT NULL COMMENT '押金',
  `beizhu` longtext COMMENT '备注',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1602201863501 DEFAULT CHARSET=utf8 COMMENT='押金缴纳';

-- ----------------------------
-- Records of yajinjiaona
-- ----------------------------
INSERT INTO `yajinjiaona` VALUES ('1602178438736', '2020-10-09 01:33:57', '1', '李铭', '0', '需要交纳押金，才能进行租赁', '是', '交纳押金成功', '已支付');
INSERT INTO `yajinjiaona` VALUES ('1602178443065', '2020-10-09 01:34:02', '2', '王芳', '2000', '需要交纳押金，才能进租赁', '否', null, '未支付');
INSERT INTO `yajinjiaona` VALUES ('1602201863500', '2020-10-09 08:04:22', '3', '小敏', '1300', '要先交纳押金才可以租赁', '否', null, '已支付');

-- ----------------------------
-- Table structure for `yonghu`
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `yonghuming` varchar(200) NOT NULL COMMENT '用户名',
  `mima` varchar(200) DEFAULT NULL COMMENT '密码',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `shenfenzheng` varchar(200) DEFAULT NULL COMMENT '身份证',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuming` (`yonghuming`)
) ENGINE=InnoDB AUTO_INCREMENT=1602201441393 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES ('1602178344619', '2020-10-09 01:32:24', '1', '1', '李铭', '男', 'http://localhost:8080/jsptNHaA/upload/1602178341941.png', '441412141214121', '15214121412');
INSERT INTO `yonghu` VALUES ('1602178361253', '2020-10-09 01:32:41', '2', '2', '王芳', '女', 'http://localhost:8080/jsptNHaA/upload/1602178358017.png', '152458548555545487', '15211412141');
INSERT INTO `yonghu` VALUES ('1602201441392', '2020-10-09 07:57:21', '3', '3', '小敏', '女', 'http://localhost:8080/jsptNHaA/upload/1602201498157.png', '442141214121412141', '15214121412');

-- ----------------------------
-- Table structure for `zulinfankui`
-- ----------------------------
DROP TABLE IF EXISTS `zulinfankui`;
CREATE TABLE `zulinfankui` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mingcheng` varchar(200) NOT NULL COMMENT '名称',
  `fankuineirong` longtext COMMENT '反馈内容',
  `fankuiriqi` date DEFAULT NULL COMMENT '反馈日期',
  `shangjiazhanghao` varchar(200) DEFAULT NULL COMMENT '商家账号',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1602202164637 DEFAULT CHARSET=utf8 COMMENT='租赁反馈';

-- ----------------------------
-- Records of zulinfankui
-- ----------------------------
INSERT INTO `zulinfankui` VALUES ('1602180952084', '2020-10-09 02:15:51', '归还反馈', '1号用户经常不按时归还\r\n', '2020-10-09', '001', '15214121412', '是', '经过核实是真实的，我们将会对他进行扣除押金的处罚');
INSERT INTO `zulinfankui` VALUES ('1602202164636', '2020-10-09 08:09:23', '租赁超期', '<img src=\"http://localhost:8080/jsptNHaA/upload/1602202148862.jpg\" width=\"100\" height=\"100\" _src=\"http://localhost:8080/jsptNHaA/upload/1602202148862.jpg\">租赁无线飞机没有按时归还\r\n', '2020-09-01', '003', '15214121412', '是', '经过审查确实有存在没有归还的行为将对用户进行扣押金500');
