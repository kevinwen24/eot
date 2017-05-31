/*
Navicat MySQL Data Transfer

Source Server         : wzj
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : eot

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-05-31 13:35:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_no` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `is_active` int(10) NOT NULL default '0' COMMENT '-1不可用',
  PRIMARY KEY  (`category_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '教学方法', '0');
INSERT INTO `category` VALUES ('2', '教学内容', '0');
INSERT INTO `category` VALUES ('3', '教学效果', '0');
INSERT INTO `category` VALUES ('4', '教学态度', '0');
INSERT INTO `category` VALUES ('16', '沙发a', '-1');
INSERT INTO `category` VALUES ('17', 'rz  ', '-1');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_no` int(11) NOT NULL auto_increment,
  `grade` varchar(10) NOT NULL,
  `class_index` int(11) NOT NULL,
  `major_no` int(11) NOT NULL,
  PRIMARY KEY  (`class_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '2013', '1', '1');
INSERT INTO `class` VALUES ('2', '2013', '2', '1');
INSERT INTO `class` VALUES ('3', '2013', '3', '1');
INSERT INTO `class` VALUES ('4', '2013', '1', '2');
INSERT INTO `class` VALUES ('5', '2013', '2', '2');
INSERT INTO `class` VALUES ('6', '2013', '3', '2');
INSERT INTO `class` VALUES ('7', '2013', '4', '2');
INSERT INTO `class` VALUES ('8', '2013', '5', '2');
INSERT INTO `class` VALUES ('9', '2013', '6', '2');
INSERT INTO `class` VALUES ('10', '2013', '1', '3');
INSERT INTO `class` VALUES ('11', '2013', '2', '3');
INSERT INTO `class` VALUES ('12', '2013', '3', '3');
INSERT INTO `class` VALUES ('13', '2013', '1', '4');
INSERT INTO `class` VALUES ('14', '2013', '2', '4');
INSERT INTO `class` VALUES ('15', '2013', '3', '4');
INSERT INTO `class` VALUES ('16', '2013', '4', '4');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_no` int(11) NOT NULL auto_increment,
  `course_name` varchar(200) NOT NULL,
  `course_score` float NOT NULL,
  `is_active` int(11) NOT NULL default '0',
  PRIMARY KEY  (`course_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '软件工程导论', '4', '0');
INSERT INTO `course` VALUES ('2', 'java程序设计', '3', '0');
INSERT INTO `course` VALUES ('3', 'C++程序设计', '4', '0');
INSERT INTO `course` VALUES ('4', '计算机基础', '5', '0');
INSERT INTO `course` VALUES ('5', 'web程序设计', '5', '0');
INSERT INTO `course` VALUES ('6', 'oracle数据库理论', '5', '0');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `dept_no` int(20) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `establish_date` date NOT NULL,
  PRIMARY KEY  (`dept_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '软件学院', '2011-07-01');
INSERT INTO `dept` VALUES ('2', '计算机与通信学院', '1929-07-01');
INSERT INTO `dept` VALUES ('3', '材料学院', '1919-07-01');
INSERT INTO `dept` VALUES ('4', '生命科学与工程学院', '1919-07-01');
INSERT INTO `dept` VALUES ('5', '理学院', '1929-07-01');
INSERT INTO `dept` VALUES ('6', '土木工程学院', '1919-07-01');
INSERT INTO `dept` VALUES ('7', '设计艺术学院', '1919-07-01');
INSERT INTO `dept` VALUES ('8', '机电工程学院', '1929-07-01');
INSERT INTO `dept` VALUES ('9', '石油化工学院', '1919-07-01');
INSERT INTO `dept` VALUES ('10', '法学院', '1919-07-01');

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation` (
  `evaluation_no` int(10) NOT NULL,
  `item_no` int(10) NOT NULL,
  `student_num` int(11) default '0' COMMENT '0',
  `score` float default '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation
-- ----------------------------
INSERT INTO `evaluation` VALUES ('1', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('1', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('1', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('1', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('1', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('1', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('1', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('1', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('1', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('1', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('1', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('1', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('1', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('2', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('2', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('2', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('2', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('2', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('2', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('2', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('2', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('2', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('2', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('2', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('2', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('2', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('3', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('3', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('3', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('3', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('3', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('3', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('3', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('3', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('3', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('3', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('3', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('3', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('3', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('4', '1', '8', '750');
INSERT INTO `evaluation` VALUES ('4', '2', '8', '750');
INSERT INTO `evaluation` VALUES ('4', '3', '8', '700');
INSERT INTO `evaluation` VALUES ('4', '4', '8', '740');
INSERT INTO `evaluation` VALUES ('4', '5', '8', '740');
INSERT INTO `evaluation` VALUES ('4', '6', '8', '740');
INSERT INTO `evaluation` VALUES ('4', '7', '3', '265');
INSERT INTO `evaluation` VALUES ('4', '8', '8', '690');
INSERT INTO `evaluation` VALUES ('4', '9', '8', '690');
INSERT INTO `evaluation` VALUES ('4', '10', '8', '690');
INSERT INTO `evaluation` VALUES ('4', '11', '8', '690');
INSERT INTO `evaluation` VALUES ('4', '12', '8', '680');
INSERT INTO `evaluation` VALUES ('4', '13', '8', '680');
INSERT INTO `evaluation` VALUES ('5', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('5', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('5', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('5', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('5', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('5', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('5', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('5', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('5', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('5', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('5', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('5', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('5', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('6', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('6', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('6', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('6', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('6', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('6', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('6', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('6', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('6', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('6', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('6', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('6', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('6', '13', '0', '0');

-- ----------------------------
-- Table structure for evaluation_status
-- ----------------------------
DROP TABLE IF EXISTS `evaluation_status`;
CREATE TABLE `evaluation_status` (
  `student_no` int(10) NOT NULL,
  `evaluation_no` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation_status
-- ----------------------------
INSERT INTO `evaluation_status` VALUES ('13270132', '0');
INSERT INTO `evaluation_status` VALUES ('13270132', '0');
INSERT INTO `evaluation_status` VALUES ('13270132', '0');

-- ----------------------------
-- Table structure for evaluation_time
-- ----------------------------
DROP TABLE IF EXISTS `evaluation_time`;
CREATE TABLE `evaluation_time` (
  `year` varchar(20) NOT NULL,
  `term` int(11) NOT NULL,
  `start_date` varchar(100) default NULL,
  `end_date` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation_time
-- ----------------------------
INSERT INTO `evaluation_time` VALUES ('2017', '0', '2017-05-30 13:00', '2017-05-31 14:00');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_no` int(20) NOT NULL auto_increment,
  `category_no` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_active` int(10) NOT NULL default '0',
  PRIMARY KEY  (`item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', '1', '教学方法多样灵活，激发学生兴趣', '0');
INSERT INTO `item` VALUES ('2', '1', '鼓励学生思考，互动性好', '0');
INSERT INTO `item` VALUES ('3', '1', '鼓励学生创新', '0');
INSERT INTO `item` VALUES ('4', '2', '教学内容是否熟悉', '0');
INSERT INTO `item` VALUES ('5', '2', '是否突出重点', '0');
INSERT INTO `item` VALUES ('6', '2', '理论结合实际阐述', '0');
INSERT INTO `item` VALUES ('7', '2', '是否介绍本学科的前沿动态', '0');
INSERT INTO `item` VALUES ('8', '3', '通过本学期的学习，你是否熟悉运用所学内容', '0');
INSERT INTO `item` VALUES ('9', '3', '上课是否精彩，不感到乏味', '0');
INSERT INTO `item` VALUES ('10', '3', '上课节奏是否跟上', '0');
INSERT INTO `item` VALUES ('11', '3', '老师所讲知识，是否听懂', '0');
INSERT INTO `item` VALUES ('12', '4', '老师是否充分备课，熟悉课程内容', '0');
INSERT INTO `item` VALUES ('13', '4', '是否有缺课迟到情况', '0');
INSERT INTO `item` VALUES ('14', '4', '是否列举大量实践扩展知识', '0');
INSERT INTO `item` VALUES ('15', '4', 'c 点多', '0');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `major_no` int(20) NOT NULL auto_increment,
  `dept_no` int(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `establish_date` date NOT NULL,
  PRIMARY KEY  (`major_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '1', '软件工程', '2011-07-01');
INSERT INTO `major` VALUES ('2', '2', '计算机科学与技术', '1999-07-01');
INSERT INTO `major` VALUES ('3', '2', '物联网', '1999-07-01');
INSERT INTO `major` VALUES ('4', '2', '通信工程', '1999-07-01');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '管理员');
INSERT INTO `role` VALUES ('2', 'teacher', '老师');
INSERT INTO `role` VALUES ('3', 'student', '学生');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_no` int(20) NOT NULL,
  `dept_no` int(20) NOT NULL,
  `major_no` int(20) NOT NULL,
  `class_no` int(20) NOT NULL,
  `is_active` int(11) NOT NULL default '0',
  PRIMARY KEY  (`student_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('13270132', '1', '1', '1', '0');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_no` int(20) NOT NULL,
  `dept_no` int(30) NOT NULL,
  `rank` varchar(30) default NULL COMMENT '教师职称',
  PRIMARY KEY  (`teacher_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('10001', '1', '系主任');
INSERT INTO `teacher` VALUES ('10002', '2', '教师');
INSERT INTO `teacher` VALUES ('10003', '2', '教师');
INSERT INTO `teacher` VALUES ('10004', '2', '教师');

-- ----------------------------
-- Table structure for teacher_class
-- ----------------------------
DROP TABLE IF EXISTS `teacher_class`;
CREATE TABLE `teacher_class` (
  `evaluation_no` int(10) NOT NULL auto_increment,
  `teacher_no` int(11) NOT NULL,
  `course_no` int(11) NOT NULL,
  `year` varchar(10) NOT NULL,
  `term` int(5) NOT NULL,
  `class_no` int(11) NOT NULL,
  `is_active` int(11) default '0',
  PRIMARY KEY  (`evaluation_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher_class
-- ----------------------------
INSERT INTO `teacher_class` VALUES ('1', '10004', '1', '2013', '0', '1', '0');
INSERT INTO `teacher_class` VALUES ('2', '10004', '1', '2013', '0', '2', '0');
INSERT INTO `teacher_class` VALUES ('3', '10004', '1', '2013', '0', '3', '0');
INSERT INTO `teacher_class` VALUES ('4', '10002', '5', '2017', '0', '1', '0');
INSERT INTO `teacher_class` VALUES ('5', '10002', '5', '2017', '0', '2', '0');
INSERT INTO `teacher_class` VALUES ('6', '10002', '5', '2017', '0', '3', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_no` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `user_role` int(5) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `create_date` date NOT NULL COMMENT '学生报道时间，老师入职时间',
  `native_place` varchar(20) default NULL,
  `address` varchar(100) default NULL,
  `phone` varchar(20) default NULL,
  `is_active` int(11) unsigned default '0' COMMENT '用户是否被删除，是否可用状态，0可用-1不可用',
  PRIMARY KEY  (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1001', 'admin', '1234', '1', '男', '2017-05-28', null, null, null, '0');
INSERT INTO `user` VALUES ('10001', '张其文', '1234', '2', '男', '2000-07-01', null, null, null, '0');
INSERT INTO `user` VALUES ('10002', '高伟军', '1234', '2', '男', '2000-07-01', null, null, null, '0');
INSERT INTO `user` VALUES ('10003', '张聚礼', '1234', '2', '男', '2000-07-01', null, null, null, '0');
INSERT INTO `user` VALUES ('10004', '柯明', '1234', '2', '女', '2000-07-01', null, null, null, '0');
INSERT INTO `user` VALUES ('13270132', '文震杰', '1234', '3', '男', '2013-07-01', null, null, null, '0');

-- ----------------------------
-- Procedure structure for createEvaluation
-- ----------------------------
DROP PROCEDURE IF EXISTS `createEvaluation`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createEvaluation`()
begin
  declare i int;
  set i=1;
  while i<14 do
     INSERT INTO evaluation(evaluation.evaluation_no, evaluation.item_no)
				VALUES(6, i);
      set i=i+1;
  end while;
  end
;;
DELIMITER ;
