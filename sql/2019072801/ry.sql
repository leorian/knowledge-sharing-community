/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 28/07/2019 09:45:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bbs_block
-- ----------------------------
DROP TABLE IF EXISTS `bbs_block`;
CREATE TABLE `bbs_block`  (
  `block_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `block_title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版块标题',
  `sequence` int(11) NOT NULL COMMENT '顺序',
  `status` int(11) NOT NULL COMMENT '状态（0正常，1关闭）',
  `del_flag` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除（0否，1是）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新者',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`block_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_block
-- ----------------------------
INSERT INTO `bbs_block` VALUES (1, '编程语言', 1, 0, 0, 'dragon', '2019-07-26 19:25:50', 'admin', '2019-07-27 07:31:13', '');
INSERT INTO `bbs_block` VALUES (2, '运维与安全', 2, 1, 0, 'dragon', '2019-07-26 19:59:23', 'dragon', '2019-07-26 19:59:29', '');
INSERT INTO `bbs_block` VALUES (3, '设计与影音', 3, 0, 0, 'admin', '2019-07-26 20:50:00', 'admin', '2019-07-26 20:50:00', '');
INSERT INTO `bbs_block` VALUES (4, '交流与讨论', 4, 0, 0, 'admin', '2019-07-26 20:52:37', 'admin', '2019-07-26 20:52:37', '');

-- ----------------------------
-- Table structure for bbs_module
-- ----------------------------
DROP TABLE IF EXISTS `bbs_module`;
CREATE TABLE `bbs_module`  (
  `module_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `module_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目标题',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '栏目图标',
  `block_id` bigint(20) NOT NULL COMMENT '版块ID',
  `sequence` int(11) NOT NULL COMMENT '字段顺序',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态（0正常，1关闭）',
  `del_flag` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除（0否，1是）',
  `topic_count` bigint(20) NOT NULL DEFAULT 0 COMMENT '主题数量',
  `good_topic_count` bigint(20) NOT NULL DEFAULT 0 COMMENT '精华主题数量',
  `forum_count` bigint(20) NOT NULL DEFAULT 0 COMMENT '帖子数量',
  `last_update_time` datetime(0) NOT NULL COMMENT '最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`module_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_module
-- ----------------------------
INSERT INTO `bbs_module` VALUES (1, 'JAVA', 'https://www.itjc8.com/data/attachment/common/17/common_43_icon.png', 1, 1, 0, 0, 0, 0, 0, '2019-07-27 08:29:44', 'dragon', '2019-07-27 08:29:56', 'dragon', '2019-07-27 08:30:04', '');
INSERT INTO `bbs_module` VALUES (2, 'PHP', 'https://www.itjc8.com/data/attachment/common/d6/common_39_icon.png', 1, 2, 0, 0, 0, 0, 0, '2019-07-27 11:56:49', 'admin', '2019-07-27 11:56:48', 'admin', '2019-07-27 11:56:48', '');
INSERT INTO `bbs_module` VALUES (3, '网络技术', 'https://www.itjc8.com/data/attachment/common/a6/common_54_icon.png', 1, 3, 0, 0, 0, 0, 0, '2019-07-27 12:11:18', 'admin', '2019-07-27 12:11:17', 'admin', '2019-07-27 12:19:39', '');

-- ----------------------------
-- Table structure for bbs_topic
-- ----------------------------
DROP TABLE IF EXISTS `bbs_topic`;
CREATE TABLE `bbs_topic`  (
  `topic_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `topic_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主题标题',
  `topic_type` int(11) NOT NULL DEFAULT 0 COMMENT '主题类型（0普通，1精华，2置顶）',
  `topic_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主图',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签',
  `public_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公开内容',
  `private_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '私密内容',
  `module_id` bigint(20) NOT NULL COMMENT '栏目ID',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态（0正常，1关闭）',
  `del_flag` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除（0否，1是）',
  `view_count` bigint(20) NOT NULL DEFAULT 0 COMMENT '访问人次',
  `comment_count` bigint(20) NOT NULL DEFAULT 0 COMMENT '评论人次',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`topic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_topic
-- ----------------------------
INSERT INTO `bbs_topic` VALUES (1, 'java从入门到放弃', 2, '', 'java', '第一章，第二章ddd', '百度云地址ddda', 3, 1, 1, 0, 0, 'dragon', '2019-07-27 14:41:59', 'admin', '2019-07-27 18:52:05', '');
INSERT INTO `bbs_topic` VALUES (2, 'php从入门到放弃', 1, '', 'php', '等哈啊', '打发', 1, 0, 1, 0, 0, 'dragon', '2019-07-27 15:02:42', 'dragon', '2019-07-27 15:02:50', '');
INSERT INTO `bbs_topic` VALUES (3, 'python从入门到放弃', 2, 'http://www.zxit8.com/uc_server/avatar.php?uid=23688&size=middle', 'python', 'ddd', 'eee', 1, 0, 0, 0, 0, 'dragon', '2019-07-27 15:03:33', 'admin', '2019-07-28 09:30:37', '');
INSERT INTO `bbs_topic` VALUES (4, '前端从入门到放弃', 1, 'https://www.itjc8.com/data/attachment/forum/201905/29/035924bl48fjgwh6sw8qfj.jpg', '前端', '<p>阿帆</p>', '<p>大gas</p>', 2, 1, 0, 0, 0, 'admin', '2019-07-27 17:53:52', 'admin', '2019-07-28 09:32:15', '');
INSERT INTO `bbs_topic` VALUES (5, '阿发啊', 0, 'https://www.itjc8.com/data/attachment/forum/201803/29/103155qyqzrq5c55tcqqcs.png', '发发', '<p>大富大贵</p>', '<p>发噶</p>', 3, 0, 0, 0, 0, 'admin', '2019-07-27 17:54:22', 'admin', '2019-07-28 09:32:46', '');
INSERT INTO `bbs_topic` VALUES (6, '发发', 0, 'https://www.itjc8.com/data/attachment/forum/201804/02/023236lmbua43wuxrm54ul.png', '发发', '<p>阿斯顿发</p>', '<p>多发发</p>', 1, 0, 0, 0, 0, 'admin', '2019-07-27 17:57:10', 'admin', '2019-07-28 09:32:59', '');
INSERT INTO `bbs_topic` VALUES (7, 'fafda', 0, '', 'fad', '<p>fassgsa</p>', '<p>fdagas</p>', 2, 0, 1, 0, 0, 'admin', '2019-07-27 18:01:46', 'admin', '2019-07-27 18:01:46', '');
INSERT INTO `bbs_topic` VALUES (8, 'java', 0, 'https://www.itjc8.com/data/attachment/forum/201907/24/163417ssv7datqt6hahs7z.jpg', '发发', '<p><img src=\"http://localhost/profile/upload/2019/07/28/32b40ef312e07c478f686cd735450c93.jpg\" data-filename=\"/profile/upload/2019/07/28/32b40ef312e07c478f686cd735450c93.jpg\" style=\"width: 720px;\"><br></p>', '<p><img src=\"http://localhost/profile/upload/2019/07/28/d922ab72a1a973f96426901ed0db34f3.jpg\" data-filename=\"/profile/upload/2019/07/28/d922ab72a1a973f96426901ed0db34f3.jpg\" style=\"width: 708px;\"><br></p>', 1, 0, 0, 0, 0, 'admin', '2019-07-28 09:14:55', 'admin', '2019-07-28 09:33:44', '');
INSERT INTO `bbs_topic` VALUES (9, '阿发啊', 0, 'http://www.zxit8.com/data/attachment/forum/201809/10/095540rsq5jkntfkt5xjzf.png', '发发', '<p>ddda</p>', '<p>dfasfda</p>', 1, 0, 0, 0, 0, 'admin', '2019-07-28 09:28:04', 'admin', '2019-07-28 09:28:14', '');

-- ----------------------------
-- Table structure for bbs_user
-- ----------------------------
DROP TABLE IF EXISTS `bbs_user`;
CREATE TABLE `bbs_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `user_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户图像',
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `sex` int(11) NOT NULL COMMENT '性别（0女，1男）',
  `birthday` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '出生日期',
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'QQ号',
  `user_type` int(11) NOT NULL DEFAULT 0 COMMENT '用户类型（0普通用户，1终身会员）',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态（0正常，1关闭）',
  `del_flag` int(11) NOT NULL DEFAULT 0 COMMENT '是否删除（0否，1是）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `account_unique_index`(`account`) USING BTREE COMMENT '账号不能重复',
  UNIQUE INDEX `email_unique_index`(`email`) USING BTREE COMMENT '邮箱不能重复'
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_user
-- ----------------------------
INSERT INTO `bbs_user` VALUES (1, '谢中贵11', 'https://www.itjc8.com/uc_server/avatar.php?uid=26449&size=middle', 'xiezg11', 'xiezg11', 1, '2019-07-28 09:43:49', '', '1573623031@qq.com', '', 1, 0, 0, 'dragon', '2019-07-27 21:50:11', 'admin', '2019-07-28 09:43:49', '');
INSERT INTO `bbs_user` VALUES (2, '张梦丹', '', 'zmd', 'zmd', 0, '2019-07-27 22:49:10', '', 'zmd@qq.com', '', 0, 0, 0, 'admin', '2019-07-27 22:49:09', 'admin', '2019-07-27 22:49:09', '');
INSERT INTO `bbs_user` VALUES (3, '恐龙', '', 'konglong', 'konglong', 0, '2019-07-27 23:16:34', '', 'konglong@qq.com', '', 1, 1, 1, 'admin', '2019-07-27 22:49:46', 'admin', '2019-07-27 22:49:46', '');
INSERT INTO `bbs_user` VALUES (4, 'fafda', 'https://www.itjc8.com/template/dean_flyi_170116/deancss/logo.png', 'fda', 'da', 0, '2019-07-28 09:44:14', '', 'afda', '', 0, 0, 0, 'admin', '2019-07-28 09:44:14', 'admin', '2019-07-28 09:44:14', '');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-OBN4DQE1564278202498', 1564278325625, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1564278210000, -1, 5, 'PAUSED', 'CRON', 1564278202000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1564278210000, -1, 5, 'PAUSED', 'CRON', 1564278202000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1564278220000, -1, 5, 'PAUSED', 'CRON', 1564278202000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 227 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 17:48:19');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 18:39:39');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 18:46:15');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 18:55:50');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 19:21:53');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '验证码错误', '2019-07-26 19:37:37');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 19:37:42');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 19:52:09');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 19:57:01');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 19:58:16');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 20:08:55');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 20:13:54');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 20:27:47');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 20:46:28');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 20:48:50');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 20:49:47');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 20:52:17');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 20:53:44');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '验证码错误', '2019-07-26 20:54:58');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 20:55:02');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 21:09:03');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 21:10:23');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 21:53:13');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 22:01:35');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-26 22:04:24');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 07:28:04');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 08:02:55');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 08:25:54');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 08:26:46');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 08:31:32');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 08:59:10');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 09:00:07');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 09:03:27');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 09:05:22');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 09:15:08');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 09:18:47');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 11:42:20');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 11:43:16');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 11:51:40');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 11:54:24');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 11:56:30');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 12:10:40');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 12:19:24');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 12:33:14');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 13:11:19');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 13:28:03');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 13:32:10');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '验证码错误', '2019-07-27 13:35:45');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 13:35:50');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '退出成功', '2019-07-27 13:40:46');
INSERT INTO `sys_logininfor` VALUES (150, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '验证码错误', '2019-07-27 13:40:55');
INSERT INTO `sys_logininfor` VALUES (151, 'ry', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '用户不存在/密码错误', '2019-07-27 13:40:59');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '密码输入错误1次', '2019-07-27 13:41:08');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '密码输入错误2次', '2019-07-27 13:41:14');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 13:41:20');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '退出成功', '2019-07-27 13:41:31');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '密码输入错误1次', '2019-07-27 13:42:30');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 13:43:57');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 13:55:35');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 14:16:50');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 14:20:26');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 14:24:37');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 14:26:12');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 14:27:41');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 14:32:20');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 14:49:29');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 14:51:31');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 14:52:25');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 15:00:19');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 15:01:11');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 15:04:30');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 15:05:22');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 15:13:34');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 15:16:44');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 15:27:05');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '验证码错误', '2019-07-27 15:29:01');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 15:29:05');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 15:30:44');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 15:38:44');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '验证码错误', '2019-07-27 15:41:18');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 15:41:21');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 15:52:19');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 16:50:19');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 17:00:26');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 17:07:05');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 17:08:06');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 17:10:24');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 17:17:15');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 17:22:11');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 17:27:59');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 17:29:06');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 17:30:53');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 17:36:58');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 17:52:46');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 18:01:31');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 18:37:18');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 18:51:49');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 18:57:58');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 19:00:12');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '验证码错误', '2019-07-27 19:54:00');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 19:54:05');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 19:59:01');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '验证码错误', '2019-07-27 20:02:22');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 20:02:24');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 21:46:51');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 21:51:29');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 21:52:27');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '验证码错误', '2019-07-27 22:10:55');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 22:10:59');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 22:16:37');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 22:18:48');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 22:21:18');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 22:33:13');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 22:35:23');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 22:45:02');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 22:46:41');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 22:48:50');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 23:01:30');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '1', '验证码错误', '2019-07-27 23:08:26');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 23:08:29');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 23:10:13');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 23:12:14');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-27 23:16:29');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-28 09:13:58');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-28 09:26:29');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-28 09:29:59');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', '0', '登录成功', '2019-07-28 09:43:32');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2021 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成修改', 114, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '生成删除', 114, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '生成代码', 114, 4, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2000, '论坛管理', 0, 4, '#', 'menuItem', 'M', '0', NULL, 'fa fa-address-card', 'admin', '2019-07-26 18:47:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '版块管理', 2000, 1, '/bbs/block', 'menuItem', 'C', '0', 'bbs:block:view', '#', 'admin', '2019-07-26 18:48:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '版块查询', 2001, 1, '#', 'menuItem', 'F', '0', 'bbs:block:list', '#', 'admin', '2019-07-26 19:22:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '版块新增', 2001, 2, '#', 'menuItem', 'F', '0', 'bbs:block:add', '#', 'admin', '2019-07-26 20:10:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '版块编辑', 2001, 3, '#', 'menuItem', 'F', '0', 'bbs:block:edit', '#', 'admin', '2019-07-26 20:10:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '版块删除', 2001, 4, '#', 'menuItem', 'F', '0', 'bbs:block:remove', '#', 'admin', '2019-07-26 20:11:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '栏目管理', 2000, 2, '/bbs/module', 'menuItem', 'C', '0', 'bbs:module:view', '#', 'admin', '2019-07-27 08:03:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '栏目查询', 2006, 1, '#', 'menuItem', 'F', '0', 'bbs:module:list', '#', 'admin', '2019-07-27 08:32:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '栏目新增', 2006, 2, '#', 'menuItem', 'F', '0', 'bbs:module:add', '#', 'admin', '2019-07-27 08:32:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '栏目编辑', 2006, 3, '#', 'menuItem', 'F', '0', 'bbs:module:edit', '#', 'admin', '2019-07-27 08:33:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '栏目删除', 2006, 4, '#', 'menuItem', 'F', '0', 'bbs:module:remove', '#', 'admin', '2019-07-27 08:33:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '主题管理', 2000, 3, '/bbs/topic', 'menuItem', 'C', '0', 'bbs:topic:view', '#', 'admin', '2019-07-27 13:56:19', 'admin', '2019-07-27 13:57:13', '');
INSERT INTO `sys_menu` VALUES (2012, '主题查询', 2011, 1, '#', 'menuItem', 'F', '0', 'bbs:topic:list', '#', 'admin', '2019-07-27 13:57:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '主题新增', 2011, 2, '#', 'menuItem', 'F', '0', 'bbs:topic:add', '#', 'admin', '2019-07-27 13:57:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '主题编辑', 2011, 3, '#', 'menuItem', 'F', '0', 'bbs:topic:edit', '#', 'admin', '2019-07-27 13:58:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '主题删除', 2011, 4, '#', 'menuItem', 'F', '0', 'bbs:topic:remove', '#', 'admin', '2019-07-27 13:58:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '用户管理', 2000, 4, '/bbs/user', 'menuItem', 'C', '0', 'bbs:user:view', '#', 'admin', '2019-07-27 20:03:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '用户查询', 2016, 1, '#', 'menuItem', 'F', '0', 'bbs:user:list', '#', 'admin', '2019-07-27 20:03:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '用户新增', 2016, 2, '#', 'menuItem', 'F', '0', 'bbs:user:add', '#', 'admin', '2019-07-27 20:03:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '用户编辑', 2016, 3, '#', 'menuItem', 'F', '0', 'bbs:user:edit', '#', 'admin', '2019-07-27 20:04:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '用户删除', 2016, 4, '#', 'menuItem', 'F', '0', 'bbs:user:remove', '#', 'admin', '2019-07-27 20:04:27', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 166 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"论坛管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-address-card\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-26 18:47:01');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2000\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"版块管理\" ],\r\n  \"url\" : [ \"/bbs/block\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:block:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-26 18:48:18');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2001\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"版块查询\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:block:list\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-26 19:22:41');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2001\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"版块新增\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:block:add\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-26 20:10:08');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2001\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"版块编辑\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:block:edit\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-26 20:10:52');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2001\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"版块删除\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:block:remove\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-26 20:11:19');
INSERT INTO `sys_oper_log` VALUES (106, '论坛版块', 1, 'com.ruoyi.web.controller.bbs.BbsBlockController.addSave()', 1, 'admin', '研发部门', '/bbs/block/add', '127.0.0.1', '内网IP', '{\r\n  \"blockTitle\" : [ \"设计与影音\" ],\r\n  \"sequence\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'block_title\' in \'class com.ruoyi.bbs.domain.BbsBlock\'', '2019-07-26 20:46:59');
INSERT INTO `sys_oper_log` VALUES (107, '论坛版块', 1, 'com.ruoyi.web.controller.bbs.BbsBlockController.addSave()', 1, 'admin', '研发部门', '/bbs/block/add', '127.0.0.1', '内网IP', '{\r\n  \"blockTitle\" : [ \"设计与影音\" ],\r\n  \"sequence\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'block_title\' in \'field list\'\r\n### The error may involve com.ruoyi.bbs.mapper.BbsBlockMapper.insertBlock-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_notice (          block_title,           sequence,           status,                               create_by,           update_by,          create_time,         update_time         )values(          ?,           ?,           ?,                               ?,           ?,          sysdate(),         sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'block_title\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'block_title\' in \'field list\'', '2019-07-26 20:49:03');
INSERT INTO `sys_oper_log` VALUES (108, '论坛版块', 1, 'com.ruoyi.web.controller.bbs.BbsBlockController.addSave()', 1, 'admin', '研发部门', '/bbs/block/add', '127.0.0.1', '内网IP', '{\r\n  \"blockTitle\" : [ \"设计与影音\" ],\r\n  \"sequence\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-26 20:50:00');
INSERT INTO `sys_oper_log` VALUES (109, '论坛版块', 1, 'com.ruoyi.web.controller.bbs.BbsBlockController.addSave()', 1, 'admin', '研发部门', '/bbs/block/add', '127.0.0.1', '内网IP', '{\r\n  \"blockTitle\" : [ \"交流与讨论\" ],\r\n  \"sequence\" : [ \"4\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-26 20:52:37');
INSERT INTO `sys_oper_log` VALUES (110, '论坛版块', 2, 'com.ruoyi.web.controller.bbs.BbsBlockController.editSave()', 1, 'admin', '研发部门', '/bbs/block/edit', '127.0.0.1', '内网IP', '{\r\n  \"blockId\" : [ \"1\" ],\r\n  \"blockTitle\" : [ \"编程语言1\" ],\r\n  \"sequence\" : [ \"11\" ],\r\n  \"status\" : [ \"1\" ]\r\n}', 0, NULL, '2019-07-26 21:53:29');
INSERT INTO `sys_oper_log` VALUES (111, '论坛版块', 3, 'com.ruoyi.web.controller.bbs.BbsBlockController.remove()', 1, 'admin', '研发部门', '/bbs/block/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1\" ]\r\n}', 0, NULL, '2019-07-26 22:01:44');
INSERT INTO `sys_oper_log` VALUES (112, '论坛版块', 3, 'com.ruoyi.web.controller.bbs.BbsBlockController.remove()', 1, 'admin', '研发部门', '/bbs/block/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"2,3\" ]\r\n}', 0, NULL, '2019-07-26 22:01:51');
INSERT INTO `sys_oper_log` VALUES (113, '论坛版块', 2, 'com.ruoyi.web.controller.bbs.BbsBlockController.editSave()', 1, 'admin', '研发部门', '/bbs/block/edit', '127.0.0.1', '内网IP', '{\r\n  \"blockId\" : [ \"1\" ],\r\n  \"blockTitle\" : [ \"编程语言1\" ],\r\n  \"sequence\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ]\r\n}', 0, NULL, '2019-07-26 22:04:38');
INSERT INTO `sys_oper_log` VALUES (114, '论坛版块', 2, 'com.ruoyi.web.controller.bbs.BbsBlockController.editSave()', 1, 'admin', '研发部门', '/bbs/block/edit', '127.0.0.1', '内网IP', '{\r\n  \"blockId\" : [ \"1\" ],\r\n  \"blockTitle\" : [ \"编程语言\" ],\r\n  \"sequence\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 07:31:13');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2000\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"栏目管理\" ],\r\n  \"url\" : [ \"/bbs/module\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:module:view\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 08:03:50');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2006\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"栏目查询\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:module:list\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 08:32:06');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2006\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"栏目新增\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:module:add\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 08:32:51');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2006\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"栏目编辑\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:module:edit\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 08:33:18');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2006\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"栏目删除\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:module:remove\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 08:33:53');
INSERT INTO `sys_oper_log` VALUES (120, '版块栏目', 1, 'com.ruoyi.web.controller.bbs.BbsModuleController.addSave()', 1, 'admin', '研发部门', '/bbs/module/add', '127.0.0.1', '内网IP', '{\r\n  \"blockId\" : [ \"1\" ],\r\n  \"moduleTitle\" : [ \"PHP\" ],\r\n  \"icon\" : [ \"https://www.itjc8.com/data/attachment/common/d6/common_39_icon.png\" ],\r\n  \"sequence\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'last_update_time\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.bbs.mapper.BbsModuleMapper.insertModule-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bbs_module (          module_title,            icon,            block_id,            sequence,           status,                               create_by,           update_by,          create_time,         update_time         )values(          ?,           ?,            ?,            ?,           ?,                               ?,           ?,          sysdate(),         sysdate()         )\r\n### Cause: java.sql.SQLException: Field \'last_update_time\' doesn\'t have a default value\n; Field \'last_update_time\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'last_update_time\' doesn\'t have a default value', '2019-07-27 11:52:08');
INSERT INTO `sys_oper_log` VALUES (121, '版块栏目', 1, 'com.ruoyi.web.controller.bbs.BbsModuleController.addSave()', 1, 'admin', '研发部门', '/bbs/module/add', '127.0.0.1', '内网IP', '{\r\n  \"blockId\" : [ \"1\" ],\r\n  \"moduleTitle\" : [ \"PHP\" ],\r\n  \"icon\" : [ \"https://www.itjc8.com/data/attachment/common/d6/common_39_icon.png\" ],\r\n  \"sequence\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may involve com.ruoyi.bbs.mapper.BbsModuleMapper.insertModule-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bbs_module (          module_title,            icon,            block_id,            sequence,           status,                               last_update_time,            create_by,           update_by,          create_time,         update_time         )values(          ?,           ?,            ?,            ?,           ?,                               ?           ?,           ?,          sysdate(),         sysdate()         )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2019-07-27 11:54:35');
INSERT INTO `sys_oper_log` VALUES (122, '版块栏目', 1, 'com.ruoyi.web.controller.bbs.BbsModuleController.addSave()', 1, 'admin', '研发部门', '/bbs/module/add', '127.0.0.1', '内网IP', '{\r\n  \"blockId\" : [ \"1\" ],\r\n  \"moduleTitle\" : [ \"PHP\" ],\r\n  \"icon\" : [ \"https://www.itjc8.com/data/attachment/common/d6/common_39_icon.png\" ],\r\n  \"sequence\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 11:56:48');
INSERT INTO `sys_oper_log` VALUES (123, '版块栏目', 1, 'com.ruoyi.web.controller.bbs.BbsModuleController.addSave()', 1, 'admin', '研发部门', '/bbs/module/add', '127.0.0.1', '内网IP', '{\r\n  \"blockId\" : [ \"2\" ],\r\n  \"moduleTitle\" : [ \"网络技术\" ],\r\n  \"icon\" : [ \"https://www.itjc8.com/data/attachment/common/a6/common_54_icon.png\" ],\r\n  \"sequence\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ]\r\n}', 0, NULL, '2019-07-27 12:11:17');
INSERT INTO `sys_oper_log` VALUES (124, '版块栏目', 2, 'com.ruoyi.web.controller.bbs.BbsModuleController.editSave()', 1, 'admin', '研发部门', '/bbs/module/edit', '127.0.0.1', '内网IP', '{\r\n  \"moduleId\" : [ \"3\" ],\r\n  \"blockId\" : [ \"1\" ],\r\n  \"moduleTitle\" : [ \"网络技术\" ],\r\n  \"icon\" : [ \"https://www.itjc8.com/data/attachment/common/a6/common_54_icon.png\" ],\r\n  \"sequence\" : [ \"3\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 12:19:39');
INSERT INTO `sys_oper_log` VALUES (125, '版块栏目', 3, 'com.ruoyi.web.controller.bbs.BbsModuleController.remove()', 1, 'admin', '研发部门', '/bbs/module/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"3\" ]\r\n}', 0, NULL, '2019-07-27 12:33:20');
INSERT INTO `sys_oper_log` VALUES (126, '版块栏目', 3, 'com.ruoyi.web.controller.bbs.BbsModuleController.remove()', 1, 'admin', '研发部门', '/bbs/module/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1\" ]\r\n}', 0, NULL, '2019-07-27 12:33:26');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2000\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"主题\" ],\r\n  \"url\" : [ \"/bbs/topic\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:topic:view\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 13:56:19');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2011\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"主题查询\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:topic:list\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 13:57:00');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\r\n  \"menuId\" : [ \"2011\" ],\r\n  \"parentId\" : [ \"2000\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"主题管理\" ],\r\n  \"url\" : [ \"/bbs/topic\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:topic:view\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 13:57:13');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2011\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"主题新增\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:topic:add\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 13:57:52');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2011\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"主题编辑\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:topic:edit\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 13:58:14');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2011\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"主题删除\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:topic:remove\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 13:58:42');
INSERT INTO `sys_oper_log` VALUES (133, '论坛主题', 1, 'com.ruoyi.web.controller.bbs.BbsTopicController.addSave()', 1, 'admin', '研发部门', '/bbs/topic/add', '127.0.0.1', '内网IP', '{\r\n  \"moduleId\" : [ \"2\" ],\r\n  \"topicTitle\" : [ \"前端从入门到放弃\" ],\r\n  \"moduleTitle\" : [ \"PHP\" ],\r\n  \"tag\" : [ \"前端\" ],\r\n  \"topicType\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ],\r\n  \"publicContent\" : [ \"<p>阿帆</p>\" ],\r\n  \"privateContent\" : [ \"<p>大gas</p>\" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.bbs.mapper.BbsTopicMapper.insertTopic-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bbs_topic (          topic_title,           topic_type,           tag,           public_content,           private_content,           module_id,           status,                               create_by,           update_by,          create_time,         update_time         )values(          ?,           ?,           ?,           ?,           ?,           ?,           ?,                               ?,           ?,          sysdate(),         sysdate()         )\r\n### Cause: java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value\n; Field \'topic_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'topic_id\' doesn\'t have a default value', '2019-07-27 17:53:22');
INSERT INTO `sys_oper_log` VALUES (134, '论坛主题', 1, 'com.ruoyi.web.controller.bbs.BbsTopicController.addSave()', 1, 'admin', '研发部门', '/bbs/topic/add', '127.0.0.1', '内网IP', '{\r\n  \"moduleId\" : [ \"2\" ],\r\n  \"topicTitle\" : [ \"前端从入门到放弃\" ],\r\n  \"moduleTitle\" : [ \"PHP\" ],\r\n  \"tag\" : [ \"前端\" ],\r\n  \"topicType\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ],\r\n  \"publicContent\" : [ \"<p>阿帆</p>\" ],\r\n  \"privateContent\" : [ \"<p>大gas</p>\" ]\r\n}', 0, NULL, '2019-07-27 17:53:52');
INSERT INTO `sys_oper_log` VALUES (135, '论坛主题', 1, 'com.ruoyi.web.controller.bbs.BbsTopicController.addSave()', 1, 'admin', '研发部门', '/bbs/topic/add', '127.0.0.1', '内网IP', '{\r\n  \"moduleId\" : [ \"3\" ],\r\n  \"topicTitle\" : [ \"阿发啊\" ],\r\n  \"moduleTitle\" : [ \"网络技术\" ],\r\n  \"tag\" : [ \"发发\" ],\r\n  \"topicType\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"publicContent\" : [ \"<p>大富大贵</p>\" ],\r\n  \"privateContent\" : [ \"<p>发噶</p>\" ]\r\n}', 0, NULL, '2019-07-27 17:54:22');
INSERT INTO `sys_oper_log` VALUES (136, '论坛主题', 1, 'com.ruoyi.web.controller.bbs.BbsTopicController.addSave()', 1, 'admin', '研发部门', '/bbs/topic/add', '127.0.0.1', '内网IP', '{\r\n  \"moduleId\" : [ \"1\" ],\r\n  \"topicTitle\" : [ \"发发\" ],\r\n  \"moduleTitle\" : [ \"JAVA\" ],\r\n  \"tag\" : [ \"发发\" ],\r\n  \"topicType\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"publicContent\" : [ \"<p>阿斯顿发</p>\" ],\r\n  \"privateContent\" : [ \"<p>多发发</p>\" ]\r\n}', 0, NULL, '2019-07-27 17:57:10');
INSERT INTO `sys_oper_log` VALUES (137, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\r\n  \"deptId\" : [ \"103\" ],\r\n  \"userName\" : [ \"fafda\" ],\r\n  \"deptName\" : [ \"研发部门\" ],\r\n  \"phonenumber\" : [ \"18605569807\" ],\r\n  \"email\" : [ \"1573623031@qq.com\" ],\r\n  \"loginName\" : [ \"xiezg\" ],\r\n  \"password\" : [ \"123456\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"role\" : [ \"2\" ],\r\n  \"remark\" : [ \"\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', 0, NULL, '2019-07-27 17:59:29');
INSERT INTO `sys_oper_log` VALUES (138, '论坛主题', 1, 'com.ruoyi.web.controller.bbs.BbsTopicController.addSave()', 1, 'admin', '研发部门', '/bbs/topic/add', '127.0.0.1', '内网IP', '{\r\n  \"moduleId\" : [ \"2\" ],\r\n  \"topicTitle\" : [ \"fafda\" ],\r\n  \"moduleTitle\" : [ \"PHP\" ],\r\n  \"tag\" : [ \"fad\" ],\r\n  \"topicType\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"publicContent\" : [ \"<p>fassgsa</p>\" ],\r\n  \"privateContent\" : [ \"<p>fdagas</p>\" ]\r\n}', 0, NULL, '2019-07-27 18:01:46');
INSERT INTO `sys_oper_log` VALUES (139, '论坛主题', 2, 'com.ruoyi.web.controller.bbs.BbsTopicController.editSave()', 1, 'admin', '研发部门', '/bbs/topic/edit', '127.0.0.1', '内网IP', '{\r\n  \"topicId\" : [ \"1\" ],\r\n  \"moduleId\" : [ \"3\" ],\r\n  \"topicTitle\" : [ \"java从入门到放弃\" ],\r\n  \"moduleTitle\" : [ \"网络技术\" ],\r\n  \"tag\" : [ \"java\" ],\r\n  \"topicType\" : [ \"2\" ],\r\n  \"status\" : [ \"1\" ],\r\n  \"publicContent\" : [ \"第一章，第二章ddd\" ],\r\n  \"privateContent\" : [ \"百度云地址ddda\" ]\r\n}', 0, NULL, '2019-07-27 18:52:05');
INSERT INTO `sys_oper_log` VALUES (140, '论坛主题', 3, 'com.ruoyi.web.controller.bbs.BbsTopicController.remove()', 1, 'admin', '研发部门', '/bbs/topic/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"7\" ]\r\n}', 0, NULL, '2019-07-27 18:58:03');
INSERT INTO `sys_oper_log` VALUES (141, '论坛主题', 3, 'com.ruoyi.web.controller.bbs.BbsTopicController.remove()', 1, 'admin', '研发部门', '/bbs/topic/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"1,2\" ]\r\n}', 0, NULL, '2019-07-27 18:58:10');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2000\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"用户管理\" ],\r\n  \"url\" : [ \"/bbs/user\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:user:view\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 20:03:02');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2016\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"用户查询\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:user:list\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 20:03:22');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2016\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"用户新增\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:user:add\" ],\r\n  \"orderNum\" : [ \"2\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 20:03:46');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2016\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"用户编辑\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:user:edit\" ],\r\n  \"orderNum\" : [ \"3\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 20:04:06');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\r\n  \"parentId\" : [ \"2016\" ],\r\n  \"menuType\" : [ \"F\" ],\r\n  \"menuName\" : [ \"用户删除\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"target\" : [ \"menuItem\" ],\r\n  \"perms\" : [ \"bbs:user:remove\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 20:04:27');
INSERT INTO `sys_oper_log` VALUES (147, '论坛用户', 1, 'com.ruoyi.web.controller.bbs.BbsUserController.addSave()', 1, 'admin', '研发部门', '/bbs/user/add', '127.0.0.1', '内网IP', '{\r\n  \"userName\" : [ \"张梦丹\" ],\r\n  \"account\" : [ \"zmd\" ],\r\n  \"password\" : [ \"zmd\" ],\r\n  \"email\" : [ \"zmd@qq.com\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"userType\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user_name\' in \'field list\'\r\n### The error may involve com.ruoyi.bbs.mapper.BbsUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bbs_block (          user_name,           account,           password,           email,           sex,           user_type,           status,                               create_by,           update_by,          create_time,         update_time         )values(          ?,           ?,           ?,           ?,           ?,           ?,           ?,                               ?,           ?,          sysdate(),         sysdate()         )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'user_name\' in \'field list\'', '2019-07-27 22:45:24');
INSERT INTO `sys_oper_log` VALUES (148, '论坛用户', 1, 'com.ruoyi.web.controller.bbs.BbsUserController.addSave()', 1, 'admin', '研发部门', '/bbs/user/add', '127.0.0.1', '内网IP', '{\r\n  \"userName\" : [ \"张梦丹\" ],\r\n  \"account\" : [ \"zmd\" ],\r\n  \"password\" : [ \"zmd\" ],\r\n  \"email\" : [ \"zmd@qq.com\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"userType\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'birthday\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.bbs.mapper.BbsUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bbs_user (          user_name,           account,           password,           email,           sex,           user_type,           status,                               create_by,           update_by,          create_time,         update_time         )values(          ?,           ?,           ?,           ?,           ?,           ?,           ?,                               ?,           ?,          sysdate(),         sysdate()         )\r\n### Cause: java.sql.SQLException: Field \'birthday\' doesn\'t have a default value\n; Field \'birthday\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'birthday\' doesn\'t have a default value', '2019-07-27 22:47:00');
INSERT INTO `sys_oper_log` VALUES (149, '论坛用户', 1, 'com.ruoyi.web.controller.bbs.BbsUserController.addSave()', 1, 'admin', '研发部门', '/bbs/user/add', '127.0.0.1', '内网IP', '{\r\n  \"userName\" : [ \"张梦丹\" ],\r\n  \"account\" : [ \"zmd\" ],\r\n  \"password\" : [ \"zmd\" ],\r\n  \"email\" : [ \"zmd@qq.com\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"userType\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 22:49:09');
INSERT INTO `sys_oper_log` VALUES (150, '论坛用户', 1, 'com.ruoyi.web.controller.bbs.BbsUserController.addSave()', 1, 'admin', '研发部门', '/bbs/user/add', '127.0.0.1', '内网IP', '{\r\n  \"userName\" : [ \"恐龙\" ],\r\n  \"account\" : [ \"konglong\" ],\r\n  \"password\" : [ \"konglong\" ],\r\n  \"email\" : [ \"konglong@qq.com\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"userType\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ]\r\n}', 0, NULL, '2019-07-27 22:49:47');
INSERT INTO `sys_oper_log` VALUES (151, '论坛用户', 2, 'com.ruoyi.web.controller.bbs.BbsUserController.editSave()', 1, 'admin', '研发部门', '/bbs/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userName\" : [ \"谢中贵1\" ],\r\n  \"account\" : [ \"xiezg1\" ],\r\n  \"password\" : [ \"xiezg1\" ],\r\n  \"email\" : [ \"1573623031@qq.com\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"userType\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'blockId\' in \'class com.ruoyi.bbs.domain.BbsUser\'', '2019-07-27 23:08:40');
INSERT INTO `sys_oper_log` VALUES (152, '论坛用户', 2, 'com.ruoyi.web.controller.bbs.BbsUserController.editSave()', 1, 'admin', '研发部门', '/bbs/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userName\" : [ \"谢中贵1\" ],\r\n  \"account\" : [ \"xiezg1\" ],\r\n  \"password\" : [ \"xiezg1\" ],\r\n  \"email\" : [ \"1573623031@qq.com\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"userType\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 23:10:26');
INSERT INTO `sys_oper_log` VALUES (153, '论坛用户', 2, 'com.ruoyi.web.controller.bbs.BbsUserController.editSave()', 1, 'admin', '研发部门', '/bbs/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userName\" : [ \"谢中贵1\" ],\r\n  \"account\" : [ \"xiezg1\" ],\r\n  \"password\" : [ \"xiezg1\" ],\r\n  \"email\" : [ \"1573623031@qq.com\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"userType\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 23:10:57');
INSERT INTO `sys_oper_log` VALUES (154, '论坛用户', 2, 'com.ruoyi.web.controller.bbs.BbsUserController.editSave()', 1, 'admin', '研发部门', '/bbs/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"userName\" : [ \"谢中贵11\" ],\r\n  \"account\" : [ \"xiezg11\" ],\r\n  \"password\" : [ \"xiezg11\" ],\r\n  \"email\" : [ \"1573623031@qq.com\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"userType\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-27 23:12:22');
INSERT INTO `sys_oper_log` VALUES (155, '论坛用户', 3, 'com.ruoyi.web.controller.bbs.BbsUserController.remove()', 1, 'admin', '研发部门', '/bbs/user/remove', '127.0.0.1', '内网IP', '{\r\n  \"ids\" : [ \"3\" ]\r\n}', 0, NULL, '2019-07-27 23:16:34');
INSERT INTO `sys_oper_log` VALUES (156, '论坛主题', 1, 'com.ruoyi.web.controller.bbs.BbsTopicController.addSave()', 1, 'admin', '研发部门', '/bbs/topic/add', '127.0.0.1', '内网IP', '{\r\n  \"moduleId\" : [ \"1\" ],\r\n  \"topicTitle\" : [ \"java\" ],\r\n  \"moduleTitle\" : [ \"JAVA\" ],\r\n  \"tag\" : [ \"发发\" ],\r\n  \"topicType\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"publicContent\" : [ \"<p><img src=\\\"http://localhost/profile/upload/2019/07/28/32b40ef312e07c478f686cd735450c93.jpg\\\" data-filename=\\\"/profile/upload/2019/07/28/32b40ef312e07c478f686cd735450c93.jpg\\\" style=\\\"width: 720px;\\\"><br></p>\" ],\r\n  \"privateContent\" : [ \"<p><img src=\\\"http://localhost/profile/upload/2019/07/28/d922ab72a1a973f96426901ed0db34f3.jpg\\\" data-filename=\\\"/profile/upload/2019/07/28/d922ab72a1a973f96426901ed0db34f3.jpg\\\" style=\\\"width: 708px;\\\"><br></p>\" ]\r\n}', 0, NULL, '2019-07-28 09:14:55');
INSERT INTO `sys_oper_log` VALUES (157, '论坛主题', 1, 'com.ruoyi.web.controller.bbs.BbsTopicController.addSave()', 1, 'admin', '研发部门', '/bbs/topic/add', '127.0.0.1', '内网IP', '{\r\n  \"moduleId\" : [ \"1\" ],\r\n  \"topicTitle\" : [ \"阿发啊\" ],\r\n  \"topicImage\" : [ \"http://www.zxit8.com/data/attachment/forum/201809/10/095540rsq5jkntfkt5xjzf.png\" ],\r\n  \"moduleTitle\" : [ \"JAVA\" ],\r\n  \"tag\" : [ \"发发\" ],\r\n  \"topicType\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"publicContent\" : [ \"<p>ddda</p>\" ],\r\n  \"privateContent\" : [ \"<p>dfasfda</p>\" ]\r\n}', 0, NULL, '2019-07-28 09:28:04');
INSERT INTO `sys_oper_log` VALUES (158, '论坛主题', 2, 'com.ruoyi.web.controller.bbs.BbsTopicController.editSave()', 1, 'admin', '研发部门', '/bbs/topic/edit', '127.0.0.1', '内网IP', '{\r\n  \"topicId\" : [ \"9\" ],\r\n  \"moduleId\" : [ \"1\" ],\r\n  \"topicTitle\" : [ \"阿发啊\" ],\r\n  \"topicImage\" : [ \"http://www.zxit8.com/data/attachment/forum/201809/10/095540rsq5jkntfkt5xjzf.png\" ],\r\n  \"moduleTitle\" : [ \"JAVA\" ],\r\n  \"tag\" : [ \"发发\" ],\r\n  \"topicType\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"publicContent\" : [ \"<p>ddda</p>\" ],\r\n  \"privateContent\" : [ \"<p>dfasfda</p>\" ]\r\n}', 0, NULL, '2019-07-28 09:28:14');
INSERT INTO `sys_oper_log` VALUES (159, '论坛主题', 2, 'com.ruoyi.web.controller.bbs.BbsTopicController.editSave()', 1, 'admin', '研发部门', '/bbs/topic/edit', '127.0.0.1', '内网IP', '{\r\n  \"topicId\" : [ \"3\" ],\r\n  \"moduleId\" : [ \"1\" ],\r\n  \"topicTitle\" : [ \"python从入门到放弃\" ],\r\n  \"topicImage\" : [ \"http://www.zxit8.com/uc_server/avatar.php?uid=23688&size=middle\" ],\r\n  \"moduleTitle\" : [ \"JAVA\" ],\r\n  \"tag\" : [ \"python\" ],\r\n  \"topicType\" : [ \"2\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"publicContent\" : [ \"ddd\" ],\r\n  \"privateContent\" : [ \"eee\" ]\r\n}', 0, NULL, '2019-07-28 09:30:37');
INSERT INTO `sys_oper_log` VALUES (160, '论坛主题', 2, 'com.ruoyi.web.controller.bbs.BbsTopicController.editSave()', 1, 'admin', '研发部门', '/bbs/topic/edit', '127.0.0.1', '内网IP', '{\r\n  \"topicId\" : [ \"4\" ],\r\n  \"moduleId\" : [ \"2\" ],\r\n  \"topicTitle\" : [ \"前端从入门到放弃\" ],\r\n  \"topicImage\" : [ \"https://www.itjc8.com/data/attachment/forum/201905/29/035924bl48fjgwh6sw8qfj.jpg\" ],\r\n  \"moduleTitle\" : [ \"PHP\" ],\r\n  \"tag\" : [ \"前端\" ],\r\n  \"topicType\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ],\r\n  \"publicContent\" : [ \"<p>阿帆</p>\" ],\r\n  \"privateContent\" : [ \"<p>大gas</p>\" ]\r\n}', 0, NULL, '2019-07-28 09:32:15');
INSERT INTO `sys_oper_log` VALUES (161, '论坛主题', 2, 'com.ruoyi.web.controller.bbs.BbsTopicController.editSave()', 1, 'admin', '研发部门', '/bbs/topic/edit', '127.0.0.1', '内网IP', '{\r\n  \"topicId\" : [ \"5\" ],\r\n  \"moduleId\" : [ \"3\" ],\r\n  \"topicTitle\" : [ \"阿发啊\" ],\r\n  \"topicImage\" : [ \"https://www.itjc8.com/data/attachment/forum/201803/29/103155qyqzrq5c55tcqqcs.png\" ],\r\n  \"moduleTitle\" : [ \"网络技术\" ],\r\n  \"tag\" : [ \"发发\" ],\r\n  \"topicType\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"publicContent\" : [ \"<p>大富大贵</p>\" ],\r\n  \"privateContent\" : [ \"<p>发噶</p>\" ]\r\n}', 0, NULL, '2019-07-28 09:32:46');
INSERT INTO `sys_oper_log` VALUES (162, '论坛主题', 2, 'com.ruoyi.web.controller.bbs.BbsTopicController.editSave()', 1, 'admin', '研发部门', '/bbs/topic/edit', '127.0.0.1', '内网IP', '{\r\n  \"topicId\" : [ \"6\" ],\r\n  \"moduleId\" : [ \"1\" ],\r\n  \"topicTitle\" : [ \"发发\" ],\r\n  \"topicImage\" : [ \"https://www.itjc8.com/data/attachment/forum/201804/02/023236lmbua43wuxrm54ul.png\" ],\r\n  \"moduleTitle\" : [ \"JAVA\" ],\r\n  \"tag\" : [ \"发发\" ],\r\n  \"topicType\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"publicContent\" : [ \"<p>阿斯顿发</p>\" ],\r\n  \"privateContent\" : [ \"<p>多发发</p>\" ]\r\n}', 0, NULL, '2019-07-28 09:32:59');
INSERT INTO `sys_oper_log` VALUES (163, '论坛主题', 2, 'com.ruoyi.web.controller.bbs.BbsTopicController.editSave()', 1, 'admin', '研发部门', '/bbs/topic/edit', '127.0.0.1', '内网IP', '{\r\n  \"topicId\" : [ \"8\" ],\r\n  \"moduleId\" : [ \"1\" ],\r\n  \"topicTitle\" : [ \"java\" ],\r\n  \"topicImage\" : [ \"https://www.itjc8.com/data/attachment/forum/201907/24/163417ssv7datqt6hahs7z.jpg\" ],\r\n  \"moduleTitle\" : [ \"JAVA\" ],\r\n  \"tag\" : [ \"发发\" ],\r\n  \"topicType\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"publicContent\" : [ \"<p><img src=\\\"http://localhost/profile/upload/2019/07/28/32b40ef312e07c478f686cd735450c93.jpg\\\" data-filename=\\\"/profile/upload/2019/07/28/32b40ef312e07c478f686cd735450c93.jpg\\\" style=\\\"width: 720px;\\\"><br></p>\" ],\r\n  \"privateContent\" : [ \"<p><img src=\\\"http://localhost/profile/upload/2019/07/28/d922ab72a1a973f96426901ed0db34f3.jpg\\\" data-filename=\\\"/profile/upload/2019/07/28/d922ab72a1a973f96426901ed0db34f3.jpg\\\" style=\\\"width: 708px;\\\"><br></p>\" ]\r\n}', 0, NULL, '2019-07-28 09:33:44');
INSERT INTO `sys_oper_log` VALUES (164, '论坛用户', 2, 'com.ruoyi.web.controller.bbs.BbsUserController.editSave()', 1, 'admin', '研发部门', '/bbs/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"userName\" : [ \"谢中贵11\" ],\r\n  \"userImage\" : [ \"https://www.itjc8.com/uc_server/avatar.php?uid=26449&size=middle\" ],\r\n  \"account\" : [ \"xiezg11\" ],\r\n  \"password\" : [ \"xiezg11\" ],\r\n  \"email\" : [ \"1573623031@qq.com\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"userType\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-28 09:43:49');
INSERT INTO `sys_oper_log` VALUES (165, '论坛用户', 1, 'com.ruoyi.web.controller.bbs.BbsUserController.addSave()', 1, 'admin', '研发部门', '/bbs/user/add', '127.0.0.1', '内网IP', '{\r\n  \"userName\" : [ \"fafda\" ],\r\n  \"userImage\" : [ \"https://www.itjc8.com/template/dean_flyi_170116/deancss/logo.png\" ],\r\n  \"account\" : [ \"fda\" ],\r\n  \"password\" : [ \"da\" ],\r\n  \"email\" : [ \"afda\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"userType\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', 0, NULL, '2019-07-28 09:44:14');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2019-07-28 09:43:32', 'admin', '2018-03-16 11:33:00', 'ry', '2019-07-28 09:43:32', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');
INSERT INTO `sys_user` VALUES (3, 103, 'xiezg', 'fafda', '00', '1573623031@qq.com', '18605569807', '0', '', '7e0662739e6fafa5a38f242ed5f591ac', 'eb5af7', '0', '0', '', NULL, 'admin', '2019-07-27 17:59:29', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('2064d54b-cc31-42c4-897a-3e86d4fe66b2', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome', 'Windows 8', 'on_line', '2019-07-28 09:13:53', '2019-07-28 09:43:32', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 2);

SET FOREIGN_KEY_CHECKS = 1;
