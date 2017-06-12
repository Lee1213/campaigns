/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50521
Source Host           : localhost:3306
Source Database       : recommender

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2016-07-05 22:26:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for re_user
-- ----------------------------
DROP TABLE IF EXISTS `re_user`;
CREATE TABLE `tb_content` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` bigint(20) NOT NULL COMMENT '内容类目ID',
  `item` varchar(200) DEFAULT NULL COMMENT '内容标题',
  `sub_title` varchar(100) DEFAULT NULL COMMENT '子标题',
  `title_desc` varchar(500) DEFAULT NULL COMMENT '标题描述',
  `url` varchar(500) DEFAULT NULL COMMENT '链接',
  `pic` varchar(300) DEFAULT NULL COMMENT '图片绝对路径',
  `pic2` varchar(300) DEFAULT NULL COMMENT '图片2',
  `content` text COMMENT '内容',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `category_id` (`category_id`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for re_netflix_item
-- ----------------------------
DROP TABLE IF EXISTS `re_netflix_item`;
CREATE TABLE `re_netflix_item` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `item_id` bigint(30) DEFAULT NULL COMMENT 'Netflix中电影ID',
  `title` varchar(200) DEFAULT NULL COMMENT '电影名称(此处为英文)',
  `year` varchar(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Netflix电影信息';


-- ----------------------------
-- Table structure for re_item
-- ----------------------------
DROP TABLE IF EXISTS `re_item`;
CREATE TABLE `re_item` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `item_id` bigint(30) DEFAULT NULL COMMENT '电影ID',
  `title` varchar(200) DEFAULT NULL COMMENT '电影名称(此处为英文)',
  `ch_title` varchar(200) DEFAULT NULL COMMENT '电影中文名称',
  `en_title` varchar(200) DEFAULT NULL COMMENT '电影英文名称',
  `year` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `genres` varchar(80) DEFAULT NULL COMMENT '电影类别',
  `rating_average` FLOAT(10) DEFAULT NULL COMMENT '平均评分',
  `rating_max` FLOAT(10) DEFAULT NULL COMMENT '最高评分',
  `rating_min` FLOAT(10) DEFAULT NULL COMMENT '最低评分',
  `collect_count` integer(30) DEFAULT NULL COMMENT '评价人数',
  `url` varchar(500) DEFAULT NULL COMMENT '链接',
  `pic1` varchar(300) DEFAULT NULL COMMENT '图片1',
  `pic2` varchar(300) DEFAULT NULL COMMENT '图片2',
  `pic3` varchar(300) DEFAULT NULL COMMENT '图片3',
  PRIMARY KEY (`id`),
  KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='电影信息';


-- ----------------------------
-- Table structure for hit_counter
-- ----------------------------
DROP TABLE IF EXISTS `hit_counter`;
CREATE TABLE `hit_counter` (
  `slot` tinyint unsigned not null primary key,
  `cnt` int unsigned not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='website hit counter';

DROP PROCEDURE if exists insertdata;
delimiter //
CREATE PROCEDURE insertdata()
begin 
declare num int; 
set num=0;
while num < 100 do 
insert into hit_counter(slot, cnt) VALUES (num,0); set num=num+1;
end while;
end //
delimiter ;
call insertdata();


