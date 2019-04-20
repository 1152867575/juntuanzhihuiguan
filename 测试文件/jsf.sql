/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50637
Source Host           : localhost:3306
Source Database       : jsf

Target Server Type    : MYSQL
Target Server Version : 50637
File Encoding         : 65001

Date: 2019-03-16 11:04:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cardprice`
-- ----------------------------
DROP TABLE IF EXISTS `cardprice`;
CREATE TABLE `cardprice` (
  `month` double DEFAULT NULL,
  `season` double DEFAULT NULL,
  `half` double DEFAULT NULL,
  `year` double DEFAULT NULL,
  `twoy` double DEFAULT NULL,
  `threey` double DEFAULT NULL,
  `life` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cardprice
-- ----------------------------
INSERT INTO `cardprice` VALUES ('400', '700', '1200', '2000', '3000', '3500', '10000');

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhuangtai` varchar(50) DEFAULT NULL,
  `classname` varchar(50) DEFAULT NULL,
  `empname` varchar(50) DEFAULT NULL,
  `max` int(10) DEFAULT NULL,
  `number` int(10) DEFAULT NULL,
  `starttime` varchar(50) DEFAULT NULL,
  `endtime` varchar(50) DEFAULT NULL,
  `price` double(20,0) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('3', null, '减肥课', '孙权', '10', '0', '2019-01-02', '2019-02-02', '1212', '22');
INSERT INTO `class` VALUES ('5', null, '减肥课', '关羽', '11', '0', '2019-01-01', '2019-02-02', '1212', null);
INSERT INTO `class` VALUES ('6', '未开课', '减肥课', '曹操', '10', '2', '2019-02-01', '2019-03-01', '1234', '24');
INSERT INTO `class` VALUES ('10', '未开课', '减肥课', '孙尚香', '10', '0', '2019-03-03', '2019-04-03', '1234', '20');
INSERT INTO `class` VALUES ('11', '未开课', '减肥课', '孙尚', '10', '0', '2019-03-03', '2019-04-03', '1234', '32');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('4', '会籍部');
INSERT INTO `department` VALUES ('1', '前台MM');
INSERT INTO `department` VALUES ('5', '团操部');
INSERT INTO `department` VALUES ('2', '泳教部');
INSERT INTO `department` VALUES ('3', '私教部');
INSERT INTO `department` VALUES ('6', '销售部');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `gender` char(1) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `salary_id` int(11) DEFAULT NULL,
  `classnumber` int(11) DEFAULT NULL,
  `xiaoshouyeji` double DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  KEY `job_id` (`job_id`),
  KEY `employee_ibfk` (`salary_id`),
  CONSTRAINT `employee_ibfk` FOREIGN KEY (`salary_id`) REFERENCES `salary` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('20', '孙尚香', '女', '6', null, null, '0', '0', '18', null, null, '');
INSERT INTO `employee` VALUES ('21', '貂蝉', '女', '1', null, null, '0', null, '18', null, null, '');
INSERT INTO `employee` VALUES ('22', '孙权', '男', '5', null, null, '0', '0', '20', null, null, '');
INSERT INTO `employee` VALUES ('24', '曹操', '男', '3', null, null, '1', null, '30', null, null, '');
INSERT INTO `employee` VALUES ('27', '文彬', '男', '1', null, null, '0', null, '20', null, null, '');
INSERT INTO `employee` VALUES ('32', '孙尚', '女', '2', '1', null, '1', null, '21', 'ff54afde-7346-4ee3-836b-26f454ca522f', 'f8f8d11946234e03ab45f74cf327c2bd', 'admin');
INSERT INTO `employee` VALUES ('33', '项羽', '男', '2', '2', null, '0', null, '20', 'a86c5b36-bf50-49dd-86c2-34e02e78e7cf', 'ae7ded3d3bd1a4cd6a966270073b0baa', 'admin1');
INSERT INTO `employee` VALUES ('34', '文彬', '男', '2', '1', null, '0', null, '20', '157e7383-fc58-4f9d-8b19-1f0fb7306446', 'c0fe06720955e31be036267b221005b9', 'admin6');
INSERT INTO `employee` VALUES ('35', '项羽', '男', '5', '2', null, null, null, '20', 'e45bb9da-f14c-4d24-af20-b6938db98c43', '847c4c55d52957c603cad01f4ca37ff3', 'ssss');
INSERT INTO `employee` VALUES ('36', '李媛', '男', '5', '1', null, null, null, '30', 'b9d29a2f-667a-4d92-8840-f18c046254bd', '9ba2bd45f1db0a1056788b7691eb8fef', 'admin');

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '管理员');
INSERT INTO `job` VALUES ('2', '员工');
INSERT INTO `job` VALUES ('3', '火影');
INSERT INTO `job` VALUES ('4', '撒打算');
INSERT INTO `job` VALUES ('5', '小兵带头大哥');

-- ----------------------------
-- Table structure for `job_menu`
-- ----------------------------
DROP TABLE IF EXISTS `job_menu`;
CREATE TABLE `job_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job_menu
-- ----------------------------
INSERT INTO `job_menu` VALUES ('46', '2', '1');
INSERT INTO `job_menu` VALUES ('47', '2', '8');
INSERT INTO `job_menu` VALUES ('48', '2', '9');
INSERT INTO `job_menu` VALUES ('49', '2', '10');
INSERT INTO `job_menu` VALUES ('50', '2', '11');
INSERT INTO `job_menu` VALUES ('51', '2', '12');
INSERT INTO `job_menu` VALUES ('52', '2', '13');
INSERT INTO `job_menu` VALUES ('53', '2', '14');
INSERT INTO `job_menu` VALUES ('54', '2', '15');
INSERT INTO `job_menu` VALUES ('55', '2', '16');
INSERT INTO `job_menu` VALUES ('84', '3', '1');
INSERT INTO `job_menu` VALUES ('85', '3', '8');
INSERT INTO `job_menu` VALUES ('86', '3', '9');
INSERT INTO `job_menu` VALUES ('87', '3', '10');
INSERT INTO `job_menu` VALUES ('88', '3', '11');
INSERT INTO `job_menu` VALUES ('89', '3', '12');
INSERT INTO `job_menu` VALUES ('90', '3', '13');
INSERT INTO `job_menu` VALUES ('91', '3', '14');
INSERT INTO `job_menu` VALUES ('92', '3', '15');
INSERT INTO `job_menu` VALUES ('93', '3', '16');
INSERT INTO `job_menu` VALUES ('94', '3', '2');
INSERT INTO `job_menu` VALUES ('95', '3', '17');
INSERT INTO `job_menu` VALUES ('96', '3', '23');
INSERT INTO `job_menu` VALUES ('97', '3', '24');
INSERT INTO `job_menu` VALUES ('98', '3', '25');
INSERT INTO `job_menu` VALUES ('99', '3', '26');
INSERT INTO `job_menu` VALUES ('100', '3', '27');
INSERT INTO `job_menu` VALUES ('101', '3', '28');
INSERT INTO `job_menu` VALUES ('102', '3', '18');
INSERT INTO `job_menu` VALUES ('103', '3', '19');
INSERT INTO `job_menu` VALUES ('104', '3', '20');
INSERT INTO `job_menu` VALUES ('105', '3', '21');
INSERT INTO `job_menu` VALUES ('106', '3', '22');
INSERT INTO `job_menu` VALUES ('107', '3', '3');
INSERT INTO `job_menu` VALUES ('108', '3', '4');
INSERT INTO `job_menu` VALUES ('109', '3', '5');
INSERT INTO `job_menu` VALUES ('110', '3', '6');
INSERT INTO `job_menu` VALUES ('111', '3', '7');
INSERT INTO `job_menu` VALUES ('316', '1', '1');
INSERT INTO `job_menu` VALUES ('317', '1', '8');
INSERT INTO `job_menu` VALUES ('318', '1', '9');
INSERT INTO `job_menu` VALUES ('319', '1', '10');
INSERT INTO `job_menu` VALUES ('320', '1', '11');
INSERT INTO `job_menu` VALUES ('321', '1', '12');
INSERT INTO `job_menu` VALUES ('322', '1', '13');
INSERT INTO `job_menu` VALUES ('323', '1', '14');
INSERT INTO `job_menu` VALUES ('324', '1', '15');
INSERT INTO `job_menu` VALUES ('325', '1', '16');
INSERT INTO `job_menu` VALUES ('326', '1', '2');
INSERT INTO `job_menu` VALUES ('327', '1', '17');
INSERT INTO `job_menu` VALUES ('328', '1', '18');
INSERT INTO `job_menu` VALUES ('329', '1', '19');
INSERT INTO `job_menu` VALUES ('330', '1', '20');
INSERT INTO `job_menu` VALUES ('331', '1', '21');
INSERT INTO `job_menu` VALUES ('332', '1', '22');
INSERT INTO `job_menu` VALUES ('333', '1', '23');
INSERT INTO `job_menu` VALUES ('334', '1', '24');
INSERT INTO `job_menu` VALUES ('335', '1', '25');
INSERT INTO `job_menu` VALUES ('336', '1', '26');
INSERT INTO `job_menu` VALUES ('337', '1', '27');
INSERT INTO `job_menu` VALUES ('338', '1', '28');
INSERT INTO `job_menu` VALUES ('339', '1', '3');
INSERT INTO `job_menu` VALUES ('340', '1', '4');
INSERT INTO `job_menu` VALUES ('341', '1', '31');
INSERT INTO `job_menu` VALUES ('342', '1', '29');
INSERT INTO `job_menu` VALUES ('343', '1', '30');
INSERT INTO `job_menu` VALUES ('344', '1', '32');
INSERT INTO `job_menu` VALUES ('345', '1', '33');
INSERT INTO `job_menu` VALUES ('346', '1', '5');
INSERT INTO `job_menu` VALUES ('347', '1', '6');
INSERT INTO `job_menu` VALUES ('348', '1', '34');
INSERT INTO `job_menu` VALUES ('349', '1', '35');
INSERT INTO `job_menu` VALUES ('350', '1', '36');
INSERT INTO `job_menu` VALUES ('351', '1', '37');
INSERT INTO `job_menu` VALUES ('352', '1', '7');

-- ----------------------------
-- Table structure for `menus`
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `permission` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', '会员管理', null, null, 'sys:vip:list');
INSERT INTO `menus` VALUES ('2', '员工管理', null, null, 'sys:emp:list');
INSERT INTO `menus` VALUES ('3', '课程管理', null, null, 'sys:class:view');
INSERT INTO `menus` VALUES ('4', '工资设置', null, null, 'sys:salary:view');
INSERT INTO `menus` VALUES ('5', '会员卡设置', null, null, 'sys:card:view');
INSERT INTO `menus` VALUES ('6', '角色及权限设置', null, null, 'sys:power:view');
INSERT INTO `menus` VALUES ('7', '通知管理', null, null, 'sys:message:view');
INSERT INTO `menus` VALUES ('8', '注册', null, '1', 'sys:vip:add');
INSERT INTO `menus` VALUES ('9', '会员查询', null, '1', 'sys:vip:view');
INSERT INTO `menus` VALUES ('10', '会员单个查询', null, '9', 'sys:vip:find');
INSERT INTO `menus` VALUES ('11', '会员续费', null, '9', 'sys:vip:xufei');
INSERT INTO `menus` VALUES ('12', '会员修改', null, '9', 'sys:vip:update');
INSERT INTO `menus` VALUES ('13', '会员删除', null, '9', 'sys:vip:delete');
INSERT INTO `menus` VALUES ('14', '会员转让', null, '9', 'sys:vip:zhuanrang');
INSERT INTO `menus` VALUES ('15', '会员导出', null, '9', 'sys:vip:export');
INSERT INTO `menus` VALUES ('16', '会员批量删除', null, '9', 'sys:vip:deletes');
INSERT INTO `menus` VALUES ('17', '泳教部', null, '2', 'sys:yongjiao:view');
INSERT INTO `menus` VALUES ('18', '私教部', null, '2', 'sys:sijiao:view');
INSERT INTO `menus` VALUES ('19', '前台', null, '2', 'sys:qiantai:view');
INSERT INTO `menus` VALUES ('20', '会籍部', null, '2', 'sys:huiji:view');
INSERT INTO `menus` VALUES ('21', '团操部', null, '2', 'sys:tuancao:view');
INSERT INTO `menus` VALUES ('22', '销售部', null, '2', 'sys:xiaoshou:view');
INSERT INTO `menus` VALUES ('23', '员工修改', null, '2', 'sys:emp:update');
INSERT INTO `menus` VALUES ('24', '员工删除', null, '2', 'sys:emp:delete');
INSERT INTO `menus` VALUES ('25', '员工注册', null, '2', 'sys:emp:add');
INSERT INTO `menus` VALUES ('26', '员工导出', null, '2', 'sys:emp:export');
INSERT INTO `menus` VALUES ('27', '员工批量删除', null, '2', 'sys:emp:deletes');
INSERT INTO `menus` VALUES ('28', '员工查询', null, '2', 'sys:emp:select');
INSERT INTO `menus` VALUES ('29', '工资查询', null, '31', 'sys:salary:find');
INSERT INTO `menus` VALUES ('30', '工资导出', null, '31', 'sys:salary:export');
INSERT INTO `menus` VALUES ('31', '工资结算', null, '4', 'sys:salary:view');
INSERT INTO `menus` VALUES ('32', '工资设置', null, '4', 'sys:gongzi:view');
INSERT INTO `menus` VALUES ('33', '工资规则修改', null, '32', 'sys:gongzi:update');
INSERT INTO `menus` VALUES ('34', '权限设置', null, '6', 'sys:role:view');
INSERT INTO `menus` VALUES ('35', '角色查询', null, '34', 'sys:role:find');
INSERT INTO `menus` VALUES ('36', '角色新建', null, '34', 'sys:role:add');
INSERT INTO `menus` VALUES ('37', '角色修改保存', null, '34', 'sys:role:update');

-- ----------------------------
-- Table structure for `salary`
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `name` varchar(50) NOT NULL,
  `yeji` double DEFAULT NULL,
  `gudinggongzi` double NOT NULL,
  `keshitichen` double DEFAULT NULL,
  `tichen` double DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary` VALUES ('课时教练', '3000', '3000', '0.3', '0.3', '1');
INSERT INTO `salary` VALUES ('销售', '1500', '3000', '0', '0.3', '2');
INSERT INTO `salary` VALUES ('前台', '0', '4500', '0', '0', '3');

-- ----------------------------
-- Table structure for `userlogin`
-- ----------------------------
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin` (
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(100) NOT NULL,
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlogin
-- ----------------------------
INSERT INTO `userlogin` VALUES ('admin', 'admin', '管理员');
INSERT INTO `userlogin` VALUES ('username', '123456', '员工');

-- ----------------------------
-- Table structure for `vip`
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `gender` char(10) DEFAULT NULL,
  `starttime` date DEFAULT NULL,
  `cardtype` varchar(50) DEFAULT NULL,
  `weixin` varchar(100) DEFAULT NULL,
  `openway` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `endtime` varchar(50) DEFAULT NULL,
  `password` int(11) NOT NULL,
  `condition1` varchar(5) DEFAULT NULL,
  `classname` varchar(10) DEFAULT NULL,
  `class_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `class_id` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES ('73', '文彬', '男', '2019-02-03', '年卡', '213123', '现金', '1234', '2020-02-03', '123456', '有效', null, null);
