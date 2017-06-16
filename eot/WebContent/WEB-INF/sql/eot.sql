/*
Navicat MySQL Data Transfer

Source Server         : wzj
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : eot

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-06-16 10:16:23
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
INSERT INTO `category` VALUES ('16', '教学质量', '-1');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_no` int(11) NOT NULL auto_increment,
  `grade` varchar(10) NOT NULL,
  `class_index` int(11) NOT NULL,
  `major_no` int(11) NOT NULL,
  PRIMARY KEY  (`class_no`),
  KEY `major_fk` (`major_no`),
  CONSTRAINT `major_fk` FOREIGN KEY (`major_no`) REFERENCES `major` (`major_no`)
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
INSERT INTO `course` VALUES ('7', '软件工程项目管理', '5', '0');
INSERT INTO `course` VALUES ('8', 'C#编程技术', '4', '0');
INSERT INTO `course` VALUES ('9', '安卓基础编程', '4', '0');
INSERT INTO `course` VALUES ('10', '高等数学2', '6', '0');

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
  `score` float default '0',
  KEY `evaluation_no` (`evaluation_no`),
  KEY `evaluation_item_fk` (`item_no`),
  CONSTRAINT `evaluation_fk` FOREIGN KEY (`evaluation_no`) REFERENCES `teacher_class` (`evaluation_no`),
  CONSTRAINT `evaluation_item_fk` FOREIGN KEY (`item_no`) REFERENCES `item` (`item_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation
-- ----------------------------
INSERT INTO `evaluation` VALUES ('1', '1', '8', '65');
INSERT INTO `evaluation` VALUES ('1', '2', '8', '65');
INSERT INTO `evaluation` VALUES ('1', '3', '8', '65');
INSERT INTO `evaluation` VALUES ('1', '4', '8', '65');
INSERT INTO `evaluation` VALUES ('1', '5', '8', '65');
INSERT INTO `evaluation` VALUES ('1', '6', '8', '65');
INSERT INTO `evaluation` VALUES ('1', '7', '8', '65');
INSERT INTO `evaluation` VALUES ('1', '8', '8', '65');
INSERT INTO `evaluation` VALUES ('1', '9', '8', '65');
INSERT INTO `evaluation` VALUES ('1', '10', '8', '65');
INSERT INTO `evaluation` VALUES ('1', '11', '8', '65');
INSERT INTO `evaluation` VALUES ('1', '12', '8', '65');
INSERT INTO `evaluation` VALUES ('1', '13', '8', '65');
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
INSERT INTO `evaluation` VALUES ('4', '1', '9', '73');
INSERT INTO `evaluation` VALUES ('4', '2', '9', '72');
INSERT INTO `evaluation` VALUES ('4', '3', '9', '72');
INSERT INTO `evaluation` VALUES ('4', '4', '9', '72');
INSERT INTO `evaluation` VALUES ('4', '5', '9', '72');
INSERT INTO `evaluation` VALUES ('4', '6', '9', '72');
INSERT INTO `evaluation` VALUES ('4', '7', '9', '72');
INSERT INTO `evaluation` VALUES ('4', '8', '9', '73');
INSERT INTO `evaluation` VALUES ('4', '9', '9', '72');
INSERT INTO `evaluation` VALUES ('4', '10', '9', '72');
INSERT INTO `evaluation` VALUES ('4', '11', '9', '70');
INSERT INTO `evaluation` VALUES ('4', '12', '9', '71');
INSERT INTO `evaluation` VALUES ('4', '13', '9', '71');
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
INSERT INTO `evaluation` VALUES ('10', '14', '1', '8');
INSERT INTO `evaluation` VALUES ('10', '13', '1', '8');
INSERT INTO `evaluation` VALUES ('10', '12', '1', '7');
INSERT INTO `evaluation` VALUES ('10', '11', '1', '7');
INSERT INTO `evaluation` VALUES ('10', '10', '1', '7');
INSERT INTO `evaluation` VALUES ('10', '9', '1', '7');
INSERT INTO `evaluation` VALUES ('10', '8', '1', '7');
INSERT INTO `evaluation` VALUES ('10', '7', '1', '7');
INSERT INTO `evaluation` VALUES ('10', '6', '1', '7');
INSERT INTO `evaluation` VALUES ('10', '5', '1', '7');
INSERT INTO `evaluation` VALUES ('10', '4', '1', '7');
INSERT INTO `evaluation` VALUES ('10', '3', '1', '7');
INSERT INTO `evaluation` VALUES ('10', '2', '1', '8');
INSERT INTO `evaluation` VALUES ('10', '1', '1', '7');
INSERT INTO `evaluation` VALUES ('11', '14', '0', '0');
INSERT INTO `evaluation` VALUES ('11', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('11', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('11', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('11', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('11', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('11', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('11', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('11', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('11', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('11', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('11', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('11', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('11', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('12', '1', '4', '35');
INSERT INTO `evaluation` VALUES ('12', '2', '4', '36');
INSERT INTO `evaluation` VALUES ('12', '3', '4', '35');
INSERT INTO `evaluation` VALUES ('12', '4', '4', '36');
INSERT INTO `evaluation` VALUES ('12', '5', '4', '36');
INSERT INTO `evaluation` VALUES ('12', '6', '4', '35');
INSERT INTO `evaluation` VALUES ('12', '7', '4', '36');
INSERT INTO `evaluation` VALUES ('12', '8', '4', '36');
INSERT INTO `evaluation` VALUES ('12', '9', '4', '36');
INSERT INTO `evaluation` VALUES ('12', '10', '4', '36');
INSERT INTO `evaluation` VALUES ('12', '11', '4', '35');
INSERT INTO `evaluation` VALUES ('12', '12', '4', '34');
INSERT INTO `evaluation` VALUES ('12', '13', '4', '34');
INSERT INTO `evaluation` VALUES ('12', '14', '4', '34');
INSERT INTO `evaluation` VALUES ('13', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('13', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('13', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('13', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('13', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('13', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('13', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('13', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('13', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('13', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('13', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('13', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('13', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('13', '14', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('14', '14', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('15', '14', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('16', '14', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('17', '14', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('18', '14', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('19', '14', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('20', '14', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('21', '14', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('22', '14', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('23', '14', '0', '0');
INSERT INTO `evaluation` VALUES ('24', '1', '3', '22');
INSERT INTO `evaluation` VALUES ('24', '2', '3', '23');
INSERT INTO `evaluation` VALUES ('24', '3', '3', '23');
INSERT INTO `evaluation` VALUES ('24', '4', '3', '22');
INSERT INTO `evaluation` VALUES ('24', '5', '3', '24');
INSERT INTO `evaluation` VALUES ('24', '6', '3', '23');
INSERT INTO `evaluation` VALUES ('24', '7', '3', '23');
INSERT INTO `evaluation` VALUES ('24', '8', '3', '25');
INSERT INTO `evaluation` VALUES ('24', '9', '3', '25');
INSERT INTO `evaluation` VALUES ('24', '10', '3', '26');
INSERT INTO `evaluation` VALUES ('24', '11', '3', '24');
INSERT INTO `evaluation` VALUES ('24', '12', '3', '25');
INSERT INTO `evaluation` VALUES ('24', '13', '3', '26');
INSERT INTO `evaluation` VALUES ('24', '14', '3', '26');
INSERT INTO `evaluation` VALUES ('25', '1', '0', '0');
INSERT INTO `evaluation` VALUES ('25', '2', '0', '0');
INSERT INTO `evaluation` VALUES ('25', '3', '0', '0');
INSERT INTO `evaluation` VALUES ('25', '4', '0', '0');
INSERT INTO `evaluation` VALUES ('25', '5', '0', '0');
INSERT INTO `evaluation` VALUES ('25', '6', '0', '0');
INSERT INTO `evaluation` VALUES ('25', '7', '0', '0');
INSERT INTO `evaluation` VALUES ('25', '8', '0', '0');
INSERT INTO `evaluation` VALUES ('25', '9', '0', '0');
INSERT INTO `evaluation` VALUES ('25', '10', '0', '0');
INSERT INTO `evaluation` VALUES ('25', '11', '0', '0');
INSERT INTO `evaluation` VALUES ('25', '12', '0', '0');
INSERT INTO `evaluation` VALUES ('25', '13', '0', '0');
INSERT INTO `evaluation` VALUES ('25', '14', '0', '0');

-- ----------------------------
-- Table structure for evaluation_status
-- ----------------------------
DROP TABLE IF EXISTS `evaluation_status`;
CREATE TABLE `evaluation_status` (
  `student_no` int(10) NOT NULL,
  `evaluation_no` int(10) NOT NULL,
  KEY `eval_status_student_no` (`student_no`),
  CONSTRAINT `eval_status_student_no` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation_status
-- ----------------------------
INSERT INTO `evaluation_status` VALUES ('13270132', '0');
INSERT INTO `evaluation_status` VALUES ('13270131', '0');
INSERT INTO `evaluation_status` VALUES ('13270131', '12');
INSERT INTO `evaluation_status` VALUES ('13270119', '12');
INSERT INTO `evaluation_status` VALUES ('13270132', '0');
INSERT INTO `evaluation_status` VALUES ('13270119', '24');
INSERT INTO `evaluation_status` VALUES ('13270131', '24');
INSERT INTO `evaluation_status` VALUES ('13270129', '4');
INSERT INTO `evaluation_status` VALUES ('13270129', '10');
INSERT INTO `evaluation_status` VALUES ('13270129', '24');

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
INSERT INTO `evaluation_time` VALUES ('2017', '0', '2017-06-13 13:00', '2017-06-15 01:00');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_no` int(20) NOT NULL auto_increment,
  `category_no` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `is_active` int(10) NOT NULL default '0',
  PRIMARY KEY  (`item_no`),
  KEY `item_fk` (`category_no`),
  CONSTRAINT `item_fk` FOREIGN KEY (`category_no`) REFERENCES `category` (`category_no`)
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
INSERT INTO `item` VALUES ('13', '4', '是否有缺课迟到情况 ', '0');
INSERT INTO `item` VALUES ('14', '4', '是否列举大量实践扩展知识', '0');
INSERT INTO `item` VALUES ('15', '4', 'c 点多去A', '-1');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `major_no` int(20) NOT NULL auto_increment,
  `dept_no` int(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `establish_date` date NOT NULL,
  PRIMARY KEY  (`major_no`),
  KEY `dept_fk` (`dept_no`),
  CONSTRAINT `dept_fk` FOREIGN KEY (`dept_no`) REFERENCES `dept` (`dept_no`)
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
  PRIMARY KEY  (`student_no`),
  CONSTRAINT `stu_fk` FOREIGN KEY (`student_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('13270101', '1', '1', '1', '0');
INSERT INTO `student` VALUES ('13270111', '1', '1', '1', '0');
INSERT INTO `student` VALUES ('13270112', '1', '1', '1', '0');
INSERT INTO `student` VALUES ('13270119', '1', '1', '1', '0');
INSERT INTO `student` VALUES ('13270129', '1', '1', '1', '0');
INSERT INTO `student` VALUES ('13270130', '1', '1', '1', '0');
INSERT INTO `student` VALUES ('13270131', '1', '1', '1', '0');
INSERT INTO `student` VALUES ('13270132', '1', '1', '1', '0');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacher_no` int(20) NOT NULL,
  `dept_no` int(30) NOT NULL,
  `rank` varchar(30) default NULL COMMENT '教师职称',
  PRIMARY KEY  (`teacher_no`),
  CONSTRAINT `te_fk` FOREIGN KEY (`teacher_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('10001', '1', '副教授');
INSERT INTO `teacher` VALUES ('10002', '2', '教师');
INSERT INTO `teacher` VALUES ('10003', '2', '教师');
INSERT INTO `teacher` VALUES ('10004', '2', '教师');
INSERT INTO `teacher` VALUES ('10005', '2', '教师');
INSERT INTO `teacher` VALUES ('10008', '5', '教授');

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
  PRIMARY KEY  (`evaluation_no`),
  KEY `teach_class_teacherNo` (`teacher_no`),
  KEY `teach_class_courseNo` (`course_no`),
  KEY `teach_class_classNo` (`class_no`),
  CONSTRAINT `teach_class_classNo` FOREIGN KEY (`class_no`) REFERENCES `class` (`class_no`),
  CONSTRAINT `teach_class_courseNo` FOREIGN KEY (`course_no`) REFERENCES `course` (`course_no`),
  CONSTRAINT `teach_class_teacherNo` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
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
INSERT INTO `teacher_class` VALUES ('9', '10003', '5', '2017', '0', '4', '0');
INSERT INTO `teacher_class` VALUES ('10', '10003', '7', '2017', '0', '1', '0');
INSERT INTO `teacher_class` VALUES ('11', '10003', '7', '2017', '0', '3', '0');
INSERT INTO `teacher_class` VALUES ('12', '10002', '2', '2017', '0', '1', '0');
INSERT INTO `teacher_class` VALUES ('13', '10002', '2', '2017', '0', '2', '0');
INSERT INTO `teacher_class` VALUES ('14', '10002', '2', '2017', '0', '3', '0');
INSERT INTO `teacher_class` VALUES ('15', '10005', '8', '2017', '0', '5', '0');
INSERT INTO `teacher_class` VALUES ('16', '10005', '8', '2017', '0', '7', '0');
INSERT INTO `teacher_class` VALUES ('17', '10005', '6', '2017', '0', '10', '0');
INSERT INTO `teacher_class` VALUES ('18', '10005', '6', '2017', '0', '12', '0');
INSERT INTO `teacher_class` VALUES ('19', '10005', '6', '2017', '0', '11', '0');
INSERT INTO `teacher_class` VALUES ('20', '10005', '9', '2017', '0', '16', '0');
INSERT INTO `teacher_class` VALUES ('21', '10005', '9', '2017', '0', '14', '0');
INSERT INTO `teacher_class` VALUES ('22', '10005', '9', '2017', '0', '13', '0');
INSERT INTO `teacher_class` VALUES ('23', '10005', '9', '2017', '0', '15', '0');
INSERT INTO `teacher_class` VALUES ('24', '10008', '10', '2017', '0', '1', '0');
INSERT INTO `teacher_class` VALUES ('25', '10008', '10', '2017', '0', '2', '0');

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
  `create_date` date default NULL COMMENT '学生报道时间，老师入职时间',
  `native_place` varchar(20) default NULL,
  `address` varchar(100) default NULL,
  `phone` varchar(20) default NULL,
  `is_active` int(11) unsigned default '0' COMMENT '用户是否被删除，是否可用状态，0可用-1不可用',
  PRIMARY KEY  (`user_no`),
  KEY `role_fk` (`user_role`),
  CONSTRAINT `role_fk` FOREIGN KEY (`user_role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1001', 'admin', '1234', '1', '男', '2017-05-28', null, null, null, '0');
INSERT INTO `user` VALUES ('10001', '张其文', '1234', '2', '男', '2000-07-01', null, null, null, '0');
INSERT INTO `user` VALUES ('10002', '高伟军', '1234', '2', '男', '2000-07-01', null, null, null, '0');
INSERT INTO `user` VALUES ('10003', '张聚礼', '1234', '2', '男', '2000-07-01', null, null, null, '0');
INSERT INTO `user` VALUES ('10004', '柯铭', '1234', '2', '女', '2000-07-01', null, null, null, '0');
INSERT INTO `user` VALUES ('10005', '任旭鹏', '1234', '2', '男', '2000-07-01', null, null, null, '0');
INSERT INTO `user` VALUES ('10008', '田振际', '1234', '2', '男', null, null, null, '12345678232', '0');
INSERT INTO `user` VALUES ('13270101', '王阔', '1234', '3', '男', null, null, null, '18893261423', '0');
INSERT INTO `user` VALUES ('13270111', '张三', '1234', '3', '男', null, null, null, '18893261423', '0');
INSERT INTO `user` VALUES ('13270112', '李四', '1234', '3', '男', null, null, null, '18893261423', '0');
INSERT INTO `user` VALUES ('13270119', '李致拓', '1234', '3', '男', null, null, null, '18893261423', '0');
INSERT INTO `user` VALUES ('13270129', '何兴', '1234', '3', '男', null, null, null, '18893261423', '0');
INSERT INTO `user` VALUES ('13270130', '祁生龙', '1234', '3', '男', null, null, null, '18893261423', '0');
INSERT INTO `user` VALUES ('13270131', '史季青', '1234', '3', '男', null, null, null, '18893261423', '0');
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
