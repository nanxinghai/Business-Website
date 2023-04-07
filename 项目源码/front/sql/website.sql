/*
 Navicat Premium Data Transfer

 Source Server         : 120.48.94.210百度云
 Source Server Type    : MySQL
 Source Server Version : 50740
 Source Host           : 120.48.94.210:3306
 Source Schema         : website

 Target Server Type    : MySQL
 Target Server Version : 50740
 File Encoding         : 65001

 Date: 07/04/2023 09:19:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tf_contact
-- ----------------------------
DROP TABLE IF EXISTS `tf_contact`;
CREATE TABLE `tf_contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `qqNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号',
  `phoneNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `emailNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '隐私保护协议文件地址',
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传人id',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上传时间',
  `isDeleted` int(11) NULL DEFAULT 0 COMMENT '0：启用 1：不启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前台联系我们模块' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_contact
-- ----------------------------
INSERT INTO `tf_contact` VALUES (1, '2830224482', '13438835715', '2830224482@qq.com', '黑龙江省鹤岗市工农区新鹤路金广大厦1808', 'http://localhost:9898/privacyProtection.docx', '1', '2023-02-01 09:29:30', 0);

-- ----------------------------
-- Table structure for tf_demand
-- ----------------------------
DROP TABLE IF EXISTS `tf_demand`;
CREATE TABLE `tf_demand`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户地址',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户手机',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户邮箱',
  `demand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户需求描述',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上传时间',
  `isRelation` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已联系 0:未联系 1:已联系',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前台需求表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_demand
-- ----------------------------
INSERT INTO `tf_demand` VALUES (1, '张三', '杭州市上城区采荷街道凯旋路96号', '12345678910', '279738378@gmail.com', '想做一个毕设系统', '2023-04-05 23:27:31', '1');
INSERT INTO `tf_demand` VALUES (3, '李思', '黑龙江省鹤岗市工农区新鹤路金广大厦1808', '13515556726', '2045698851@qq.com', '现在给我开发一个开票系统', '2023-02-02 11:44:40', '0');

-- ----------------------------
-- Table structure for tf_log
-- ----------------------------
DROP TABLE IF EXISTS `tf_log`;
CREATE TABLE `tf_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ip',
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `osName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `browerName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器种类',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作内容',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型;0：数据请求  1：菜单点击',
  `reqTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '请求时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 395 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前台日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_log
-- ----------------------------
INSERT INTO `tf_log` VALUES (4, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-02-06 11:43:18');
INSERT INTO `tf_log` VALUES (5, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-02-06 11:43:18');
INSERT INTO `tf_log` VALUES (6, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-02-06 11:43:18');
INSERT INTO `tf_log` VALUES (7, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '点击菜单 [ 服务范围 ]', '1', '2023-02-06 11:48:11');
INSERT INTO `tf_log` VALUES (8, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-02-06 11:48:11');
INSERT INTO `tf_log` VALUES (9, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-02-06 11:48:11');
INSERT INTO `tf_log` VALUES (10, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '点击菜单 [ 关于我们 ]', '1', '2023-02-06 11:48:24');
INSERT INTO `tf_log` VALUES (11, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-02-06 11:48:25');
INSERT INTO `tf_log` VALUES (12, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-02-06 11:48:25');
INSERT INTO `tf_log` VALUES (13, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-02-06 11:48:26');
INSERT INTO `tf_log` VALUES (14, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:08');
INSERT INTO `tf_log` VALUES (15, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:08');
INSERT INTO `tf_log` VALUES (16, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:08');
INSERT INTO `tf_log` VALUES (17, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-02-27 20:40:08');
INSERT INTO `tf_log` VALUES (18, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-17 15:22:57');
INSERT INTO `tf_log` VALUES (19, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 服务范围 ]', '1', '2023-02-27 20:40:26');
INSERT INTO `tf_log` VALUES (20, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:27');
INSERT INTO `tf_log` VALUES (21, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:27');
INSERT INTO `tf_log` VALUES (22, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:27');
INSERT INTO `tf_log` VALUES (23, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:27');
INSERT INTO `tf_log` VALUES (24, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-02-27 20:40:27');
INSERT INTO `tf_log` VALUES (25, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 关于我们 ]', '1', '2023-02-27 20:40:28');
INSERT INTO `tf_log` VALUES (26, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:29');
INSERT INTO `tf_log` VALUES (27, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:29');
INSERT INTO `tf_log` VALUES (28, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:29');
INSERT INTO `tf_log` VALUES (29, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-02-27 20:40:40');
INSERT INTO `tf_log` VALUES (30, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:41');
INSERT INTO `tf_log` VALUES (31, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:41');
INSERT INTO `tf_log` VALUES (32, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 关于我们 ]', '1', '2023-02-27 20:40:54');
INSERT INTO `tf_log` VALUES (33, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:54');
INSERT INTO `tf_log` VALUES (34, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:54');
INSERT INTO `tf_log` VALUES (35, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:54');
INSERT INTO `tf_log` VALUES (36, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:54:23');
INSERT INTO `tf_log` VALUES (37, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:54:24');
INSERT INTO `tf_log` VALUES (38, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:54:24');
INSERT INTO `tf_log` VALUES (39, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-02-27 20:54:24');
INSERT INTO `tf_log` VALUES (40, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:58:09');
INSERT INTO `tf_log` VALUES (41, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 关于我们 ]', '1', '2023-02-27 20:58:09');
INSERT INTO `tf_log` VALUES (42, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:58:09');
INSERT INTO `tf_log` VALUES (43, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:58:09');
INSERT INTO `tf_log` VALUES (44, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 流程示例 ]', '1', '2023-02-27 20:58:21');
INSERT INTO `tf_log` VALUES (45, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:58:21');
INSERT INTO `tf_log` VALUES (46, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:58:22');
INSERT INTO `tf_log` VALUES (47, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:58:29');
INSERT INTO `tf_log` VALUES (48, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 服务范围 ]', '1', '2023-02-27 20:58:29');
INSERT INTO `tf_log` VALUES (49, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:58:29');
INSERT INTO `tf_log` VALUES (50, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-02-27 20:58:44');
INSERT INTO `tf_log` VALUES (51, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:58:44');
INSERT INTO `tf_log` VALUES (52, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:58:44');
INSERT INTO `tf_log` VALUES (53, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-28 21:25:18');
INSERT INTO `tf_log` VALUES (54, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-28 21:25:19');
INSERT INTO `tf_log` VALUES (55, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-28 21:25:19');
INSERT INTO `tf_log` VALUES (56, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-02-28 21:25:19');
INSERT INTO `tf_log` VALUES (57, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-02-28 21:25:26');
INSERT INTO `tf_log` VALUES (58, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-28 21:25:26');
INSERT INTO `tf_log` VALUES (59, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-28 21:25:26');
INSERT INTO `tf_log` VALUES (60, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-01 23:28:54');
INSERT INTO `tf_log` VALUES (61, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-02 22:32:36');
INSERT INTO `tf_log` VALUES (62, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-03-02 22:32:38');
INSERT INTO `tf_log` VALUES (63, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-02 22:32:38');
INSERT INTO `tf_log` VALUES (64, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-02 22:32:38');
INSERT INTO `tf_log` VALUES (65, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-17 15:23:06');
INSERT INTO `tf_log` VALUES (66, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 关于我们 ]', '1', '2023-03-02 22:33:30');
INSERT INTO `tf_log` VALUES (67, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-02 22:33:31');
INSERT INTO `tf_log` VALUES (68, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-02 22:33:31');
INSERT INTO `tf_log` VALUES (69, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-02 22:33:31');
INSERT INTO `tf_log` VALUES (70, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-17 15:23:07');
INSERT INTO `tf_log` VALUES (71, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-04 01:27:23');
INSERT INTO `tf_log` VALUES (72, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-05 23:06:13');
INSERT INTO `tf_log` VALUES (73, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-05 23:06:14');
INSERT INTO `tf_log` VALUES (74, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:42');
INSERT INTO `tf_log` VALUES (75, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:42');
INSERT INTO `tf_log` VALUES (76, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:43');
INSERT INTO `tf_log` VALUES (77, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-03-06 21:08:43');
INSERT INTO `tf_log` VALUES (78, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-17 15:23:07');
INSERT INTO `tf_log` VALUES (79, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 关于我们 ]', '1', '2023-03-06 21:08:58');
INSERT INTO `tf_log` VALUES (80, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:58');
INSERT INTO `tf_log` VALUES (81, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:58');
INSERT INTO `tf_log` VALUES (82, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:58');
INSERT INTO `tf_log` VALUES (83, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-17 15:23:08');
INSERT INTO `tf_log` VALUES (84, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-03-06 21:09:28');
INSERT INTO `tf_log` VALUES (85, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:09:29');
INSERT INTO `tf_log` VALUES (86, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:09:29');
INSERT INTO `tf_log` VALUES (87, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-17 15:23:08');
INSERT INTO `tf_log` VALUES (88, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 关于我们 ]', '1', '2023-03-06 21:09:48');
INSERT INTO `tf_log` VALUES (89, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:09:48');
INSERT INTO `tf_log` VALUES (90, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:09:48');
INSERT INTO `tf_log` VALUES (91, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:09:48');
INSERT INTO `tf_log` VALUES (92, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-17 15:23:08');
INSERT INTO `tf_log` VALUES (93, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-03-06 21:10:31');
INSERT INTO `tf_log` VALUES (94, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:10:31');
INSERT INTO `tf_log` VALUES (95, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:10:32');
INSERT INTO `tf_log` VALUES (96, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-17 15:23:09');
INSERT INTO `tf_log` VALUES (97, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:11');
INSERT INTO `tf_log` VALUES (98, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:11');
INSERT INTO `tf_log` VALUES (99, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:11');
INSERT INTO `tf_log` VALUES (100, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:12');
INSERT INTO `tf_log` VALUES (101, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:12');
INSERT INTO `tf_log` VALUES (102, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:12');
INSERT INTO `tf_log` VALUES (103, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:12');
INSERT INTO `tf_log` VALUES (104, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:12');
INSERT INTO `tf_log` VALUES (105, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:15');
INSERT INTO `tf_log` VALUES (106, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:15');
INSERT INTO `tf_log` VALUES (107, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:15');
INSERT INTO `tf_log` VALUES (108, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:15');
INSERT INTO `tf_log` VALUES (109, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:15');
INSERT INTO `tf_log` VALUES (110, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:15');
INSERT INTO `tf_log` VALUES (111, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:15');
INSERT INTO `tf_log` VALUES (112, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-06 21:18:15');
INSERT INTO `tf_log` VALUES (113, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:01');
INSERT INTO `tf_log` VALUES (114, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:02');
INSERT INTO `tf_log` VALUES (115, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:02');
INSERT INTO `tf_log` VALUES (116, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:02');
INSERT INTO `tf_log` VALUES (117, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:02');
INSERT INTO `tf_log` VALUES (118, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:02');
INSERT INTO `tf_log` VALUES (119, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:02');
INSERT INTO `tf_log` VALUES (120, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:02');
INSERT INTO `tf_log` VALUES (121, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:05');
INSERT INTO `tf_log` VALUES (122, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:05');
INSERT INTO `tf_log` VALUES (123, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:05');
INSERT INTO `tf_log` VALUES (124, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:05');
INSERT INTO `tf_log` VALUES (125, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:05');
INSERT INTO `tf_log` VALUES (126, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:05');
INSERT INTO `tf_log` VALUES (127, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:06');
INSERT INTO `tf_log` VALUES (128, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 19:36:06');
INSERT INTO `tf_log` VALUES (129, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:10');
INSERT INTO `tf_log` VALUES (130, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:11');
INSERT INTO `tf_log` VALUES (131, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:11');
INSERT INTO `tf_log` VALUES (132, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:11');
INSERT INTO `tf_log` VALUES (133, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:11');
INSERT INTO `tf_log` VALUES (134, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:11');
INSERT INTO `tf_log` VALUES (135, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:11');
INSERT INTO `tf_log` VALUES (136, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:11');
INSERT INTO `tf_log` VALUES (137, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:11');
INSERT INTO `tf_log` VALUES (138, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:11');
INSERT INTO `tf_log` VALUES (139, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:11');
INSERT INTO `tf_log` VALUES (140, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:11');
INSERT INTO `tf_log` VALUES (141, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:12');
INSERT INTO `tf_log` VALUES (142, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:12');
INSERT INTO `tf_log` VALUES (143, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:12');
INSERT INTO `tf_log` VALUES (144, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 20:46:12');
INSERT INTO `tf_log` VALUES (145, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:20');
INSERT INTO `tf_log` VALUES (146, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:20');
INSERT INTO `tf_log` VALUES (147, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:20');
INSERT INTO `tf_log` VALUES (148, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:20');
INSERT INTO `tf_log` VALUES (149, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:20');
INSERT INTO `tf_log` VALUES (150, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:20');
INSERT INTO `tf_log` VALUES (151, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:21');
INSERT INTO `tf_log` VALUES (152, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:21');
INSERT INTO `tf_log` VALUES (153, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:22');
INSERT INTO `tf_log` VALUES (154, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:23');
INSERT INTO `tf_log` VALUES (155, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:23');
INSERT INTO `tf_log` VALUES (156, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:23');
INSERT INTO `tf_log` VALUES (157, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:23');
INSERT INTO `tf_log` VALUES (158, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:23');
INSERT INTO `tf_log` VALUES (159, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:23');
INSERT INTO `tf_log` VALUES (160, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-07 21:17:23');
INSERT INTO `tf_log` VALUES (161, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-16 11:43:38');
INSERT INTO `tf_log` VALUES (162, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-16 11:43:39');
INSERT INTO `tf_log` VALUES (163, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-16 11:43:39');
INSERT INTO `tf_log` VALUES (164, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-03-16 11:43:39');
INSERT INTO `tf_log` VALUES (165, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-17 15:23:14');
INSERT INTO `tf_log` VALUES (166, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-16 11:49:25');
INSERT INTO `tf_log` VALUES (167, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-16 11:49:25');
INSERT INTO `tf_log` VALUES (168, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-03-16 11:49:25');
INSERT INTO `tf_log` VALUES (169, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-17 15:23:14');
INSERT INTO `tf_log` VALUES (170, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:54');
INSERT INTO `tf_log` VALUES (171, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:54');
INSERT INTO `tf_log` VALUES (172, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:54');
INSERT INTO `tf_log` VALUES (173, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:54');
INSERT INTO `tf_log` VALUES (174, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:54');
INSERT INTO `tf_log` VALUES (175, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:54');
INSERT INTO `tf_log` VALUES (176, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:55');
INSERT INTO `tf_log` VALUES (177, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:55');
INSERT INTO `tf_log` VALUES (178, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:55');
INSERT INTO `tf_log` VALUES (179, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:55');
INSERT INTO `tf_log` VALUES (180, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:56');
INSERT INTO `tf_log` VALUES (181, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:56');
INSERT INTO `tf_log` VALUES (182, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:56');
INSERT INTO `tf_log` VALUES (183, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:56');
INSERT INTO `tf_log` VALUES (184, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:56');
INSERT INTO `tf_log` VALUES (185, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-17 00:12:56');
INSERT INTO `tf_log` VALUES (200, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-17 23:45:01');
INSERT INTO `tf_log` VALUES (201, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-17 23:45:06');
INSERT INTO `tf_log` VALUES (202, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-17 23:45:07');
INSERT INTO `tf_log` VALUES (203, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-03-17 23:45:07');
INSERT INTO `tf_log` VALUES (204, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-17 23:45:08');
INSERT INTO `tf_log` VALUES (205, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 17:00:04');
INSERT INTO `tf_log` VALUES (206, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 17:00:04');
INSERT INTO `tf_log` VALUES (207, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 17:00:04');
INSERT INTO `tf_log` VALUES (208, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 17:00:04');
INSERT INTO `tf_log` VALUES (209, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 17:00:05');
INSERT INTO `tf_log` VALUES (210, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 17:00:05');
INSERT INTO `tf_log` VALUES (211, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 17:00:05');
INSERT INTO `tf_log` VALUES (212, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 17:00:05');
INSERT INTO `tf_log` VALUES (213, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 19:32:00');
INSERT INTO `tf_log` VALUES (214, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 19:32:00');
INSERT INTO `tf_log` VALUES (215, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 19:32:01');
INSERT INTO `tf_log` VALUES (216, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 19:32:01');
INSERT INTO `tf_log` VALUES (217, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 19:32:03');
INSERT INTO `tf_log` VALUES (218, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 19:32:03');
INSERT INTO `tf_log` VALUES (219, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 19:32:03');
INSERT INTO `tf_log` VALUES (220, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-19 19:32:03');
INSERT INTO `tf_log` VALUES (221, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:42:06');
INSERT INTO `tf_log` VALUES (222, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:42:07');
INSERT INTO `tf_log` VALUES (223, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-03-20 14:42:07');
INSERT INTO `tf_log` VALUES (224, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:42:07');
INSERT INTO `tf_log` VALUES (225, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:42:08');
INSERT INTO `tf_log` VALUES (226, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:43:20');
INSERT INTO `tf_log` VALUES (227, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:43:20');
INSERT INTO `tf_log` VALUES (228, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '点击菜单 [ 服务范围 ]', '1', '2023-03-20 14:43:21');
INSERT INTO `tf_log` VALUES (229, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:43:21');
INSERT INTO `tf_log` VALUES (230, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:43:36');
INSERT INTO `tf_log` VALUES (231, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:43:36');
INSERT INTO `tf_log` VALUES (232, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '点击菜单 [ 关于我们 ]', '1', '2023-03-20 14:43:36');
INSERT INTO `tf_log` VALUES (233, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:43:36');
INSERT INTO `tf_log` VALUES (234, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:43:36');
INSERT INTO `tf_log` VALUES (235, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:43:48');
INSERT INTO `tf_log` VALUES (236, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-03-20 14:43:48');
INSERT INTO `tf_log` VALUES (237, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:43:49');
INSERT INTO `tf_log` VALUES (238, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:43:49');
INSERT INTO `tf_log` VALUES (239, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '点击菜单 [ 服务范围 ]', '1', '2023-03-20 14:45:30');
INSERT INTO `tf_log` VALUES (240, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:45:30');
INSERT INTO `tf_log` VALUES (241, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:45:30');
INSERT INTO `tf_log` VALUES (242, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:45:31');
INSERT INTO `tf_log` VALUES (243, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '点击菜单 [ 流程示例 ]', '1', '2023-03-20 14:45:31');
INSERT INTO `tf_log` VALUES (244, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:45:31');
INSERT INTO `tf_log` VALUES (245, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:45:31');
INSERT INTO `tf_log` VALUES (246, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '点击菜单 [ 关于我们 ]', '1', '2023-03-20 14:45:31');
INSERT INTO `tf_log` VALUES (247, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:45:31');
INSERT INTO `tf_log` VALUES (248, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:45:31');
INSERT INTO `tf_log` VALUES (249, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:45:31');
INSERT INTO `tf_log` VALUES (250, '127.0.0.1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-20 14:45:32');
INSERT INTO `tf_log` VALUES (251, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-27 22:38:17');
INSERT INTO `tf_log` VALUES (252, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-27 22:38:19');
INSERT INTO `tf_log` VALUES (253, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-27 22:38:19');
INSERT INTO `tf_log` VALUES (254, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-27 22:38:19');
INSERT INTO `tf_log` VALUES (255, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-27 22:38:24');
INSERT INTO `tf_log` VALUES (256, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-27 22:38:24');
INSERT INTO `tf_log` VALUES (257, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-27 22:38:24');
INSERT INTO `tf_log` VALUES (258, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-27 22:38:24');
INSERT INTO `tf_log` VALUES (259, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 21:48:53');
INSERT INTO `tf_log` VALUES (260, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 21:48:54');
INSERT INTO `tf_log` VALUES (261, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 21:48:54');
INSERT INTO `tf_log` VALUES (262, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 21:48:54');
INSERT INTO `tf_log` VALUES (263, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 21:48:56');
INSERT INTO `tf_log` VALUES (264, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 21:48:56');
INSERT INTO `tf_log` VALUES (265, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 21:48:56');
INSERT INTO `tf_log` VALUES (266, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 21:48:56');
INSERT INTO `tf_log` VALUES (267, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 22:43:49');
INSERT INTO `tf_log` VALUES (268, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 22:43:49');
INSERT INTO `tf_log` VALUES (269, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 22:43:50');
INSERT INTO `tf_log` VALUES (270, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 22:43:50');
INSERT INTO `tf_log` VALUES (271, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 22:43:52');
INSERT INTO `tf_log` VALUES (272, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 22:43:53');
INSERT INTO `tf_log` VALUES (273, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 22:43:53');
INSERT INTO `tf_log` VALUES (274, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-28 22:43:53');
INSERT INTO `tf_log` VALUES (275, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 22:56:12');
INSERT INTO `tf_log` VALUES (276, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 22:56:12');
INSERT INTO `tf_log` VALUES (277, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 22:56:12');
INSERT INTO `tf_log` VALUES (278, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 22:56:12');
INSERT INTO `tf_log` VALUES (279, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 22:56:13');
INSERT INTO `tf_log` VALUES (280, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 22:56:13');
INSERT INTO `tf_log` VALUES (281, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 22:56:14');
INSERT INTO `tf_log` VALUES (282, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 22:56:14');
INSERT INTO `tf_log` VALUES (283, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 23:50:59');
INSERT INTO `tf_log` VALUES (284, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 23:50:59');
INSERT INTO `tf_log` VALUES (285, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 23:50:59');
INSERT INTO `tf_log` VALUES (286, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 23:50:59');
INSERT INTO `tf_log` VALUES (287, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 23:51:01');
INSERT INTO `tf_log` VALUES (288, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 23:51:01');
INSERT INTO `tf_log` VALUES (289, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 23:51:02');
INSERT INTO `tf_log` VALUES (290, '127.0.0.1', '本机地址', 'Windows XP', 'Internet Explorer 6-6.0', '数据请求', '0', '2023-03-29 23:51:02');
INSERT INTO `tf_log` VALUES (291, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:23');
INSERT INTO `tf_log` VALUES (292, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:23');
INSERT INTO `tf_log` VALUES (293, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:23');
INSERT INTO `tf_log` VALUES (294, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:23');
INSERT INTO `tf_log` VALUES (295, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:23');
INSERT INTO `tf_log` VALUES (296, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:23');
INSERT INTO `tf_log` VALUES (297, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:23');
INSERT INTO `tf_log` VALUES (298, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:23');
INSERT INTO `tf_log` VALUES (299, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:24');
INSERT INTO `tf_log` VALUES (300, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:24');
INSERT INTO `tf_log` VALUES (301, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:24');
INSERT INTO `tf_log` VALUES (302, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:24');
INSERT INTO `tf_log` VALUES (303, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:24');
INSERT INTO `tf_log` VALUES (304, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:24');
INSERT INTO `tf_log` VALUES (305, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:24');
INSERT INTO `tf_log` VALUES (306, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:02:24');
INSERT INTO `tf_log` VALUES (307, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:03:19');
INSERT INTO `tf_log` VALUES (308, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:03:30');
INSERT INTO `tf_log` VALUES (309, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:03:52');
INSERT INTO `tf_log` VALUES (310, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:53');
INSERT INTO `tf_log` VALUES (311, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:53');
INSERT INTO `tf_log` VALUES (312, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:54');
INSERT INTO `tf_log` VALUES (313, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:54');
INSERT INTO `tf_log` VALUES (314, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:54');
INSERT INTO `tf_log` VALUES (315, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:54');
INSERT INTO `tf_log` VALUES (316, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:54');
INSERT INTO `tf_log` VALUES (317, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:54');
INSERT INTO `tf_log` VALUES (318, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:54');
INSERT INTO `tf_log` VALUES (319, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:55');
INSERT INTO `tf_log` VALUES (320, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:55');
INSERT INTO `tf_log` VALUES (321, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:55');
INSERT INTO `tf_log` VALUES (322, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:55');
INSERT INTO `tf_log` VALUES (323, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:55');
INSERT INTO `tf_log` VALUES (324, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:55');
INSERT INTO `tf_log` VALUES (325, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:55');
INSERT INTO `tf_log` VALUES (326, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:08:58');
INSERT INTO `tf_log` VALUES (327, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-03-31 17:09:08');
INSERT INTO `tf_log` VALUES (328, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 7', 'Chrome 10-102.0.0.0', '数据请求', '0', '2023-04-06 17:56:14');
INSERT INTO `tf_log` VALUES (329, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 21:56:37');
INSERT INTO `tf_log` VALUES (330, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 21:56:39');
INSERT INTO `tf_log` VALUES (331, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 21:56:45');
INSERT INTO `tf_log` VALUES (332, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:01:28');
INSERT INTO `tf_log` VALUES (333, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:09:08');
INSERT INTO `tf_log` VALUES (334, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:10:03');
INSERT INTO `tf_log` VALUES (335, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:10:12');
INSERT INTO `tf_log` VALUES (336, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:10:38');
INSERT INTO `tf_log` VALUES (337, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:12:24');
INSERT INTO `tf_log` VALUES (338, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:12:49');
INSERT INTO `tf_log` VALUES (339, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:14:33');
INSERT INTO `tf_log` VALUES (340, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:16:26');
INSERT INTO `tf_log` VALUES (341, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:19:01');
INSERT INTO `tf_log` VALUES (342, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:19:16');
INSERT INTO `tf_log` VALUES (343, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:20:37');
INSERT INTO `tf_log` VALUES (344, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:22:52');
INSERT INTO `tf_log` VALUES (345, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:24:33');
INSERT INTO `tf_log` VALUES (346, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:24:45');
INSERT INTO `tf_log` VALUES (347, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:24:53');
INSERT INTO `tf_log` VALUES (348, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:25:51');
INSERT INTO `tf_log` VALUES (349, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:27:46');
INSERT INTO `tf_log` VALUES (350, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:27:50');
INSERT INTO `tf_log` VALUES (351, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:29:05');
INSERT INTO `tf_log` VALUES (352, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:29:15');
INSERT INTO `tf_log` VALUES (353, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:31:43');
INSERT INTO `tf_log` VALUES (354, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:33:51');
INSERT INTO `tf_log` VALUES (355, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:34:10');
INSERT INTO `tf_log` VALUES (356, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:39:05');
INSERT INTO `tf_log` VALUES (357, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:39:09');
INSERT INTO `tf_log` VALUES (358, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:39:19');
INSERT INTO `tf_log` VALUES (359, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:40:36');
INSERT INTO `tf_log` VALUES (360, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:48:00');
INSERT INTO `tf_log` VALUES (361, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:48:09');
INSERT INTO `tf_log` VALUES (362, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:49:52');
INSERT INTO `tf_log` VALUES (363, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:52:02');
INSERT INTO `tf_log` VALUES (364, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:53:04');
INSERT INTO `tf_log` VALUES (365, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:54:24');
INSERT INTO `tf_log` VALUES (366, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 22:54:30');
INSERT INTO `tf_log` VALUES (367, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:01:20');
INSERT INTO `tf_log` VALUES (368, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:02:21');
INSERT INTO `tf_log` VALUES (369, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:02:48');
INSERT INTO `tf_log` VALUES (370, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:02:49');
INSERT INTO `tf_log` VALUES (371, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:03:08');
INSERT INTO `tf_log` VALUES (372, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:03:30');
INSERT INTO `tf_log` VALUES (373, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:03:39');
INSERT INTO `tf_log` VALUES (374, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:04:37');
INSERT INTO `tf_log` VALUES (375, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:05:17');
INSERT INTO `tf_log` VALUES (376, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:07:28');
INSERT INTO `tf_log` VALUES (377, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:11:00');
INSERT INTO `tf_log` VALUES (378, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:16:16');
INSERT INTO `tf_log` VALUES (379, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:29:25');
INSERT INTO `tf_log` VALUES (380, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:34:10');
INSERT INTO `tf_log` VALUES (381, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:34:55');
INSERT INTO `tf_log` VALUES (382, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:37:50');
INSERT INTO `tf_log` VALUES (383, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-111.0.0.0', '数据请求', '0', '2023-04-06 23:38:11');
INSERT INTO `tf_log` VALUES (384, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-111.0.0.0', '数据请求', '0', '2023-04-06 23:38:12');
INSERT INTO `tf_log` VALUES (385, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:45:42');
INSERT INTO `tf_log` VALUES (386, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:45:57');
INSERT INTO `tf_log` VALUES (387, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:46:20');
INSERT INTO `tf_log` VALUES (388, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:46:20');
INSERT INTO `tf_log` VALUES (389, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:48:03');
INSERT INTO `tf_log` VALUES (390, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:50:17');
INSERT INTO `tf_log` VALUES (391, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:51:25');
INSERT INTO `tf_log` VALUES (392, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:51:54');
INSERT INTO `tf_log` VALUES (393, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:52:58');
INSERT INTO `tf_log` VALUES (394, '0:0:0:0:0:0:0:1', '本机地址', 'Windows 10', 'Chrome 11-112.0.0.0', '数据请求', '0', '2023-04-06 23:53:31');

-- ----------------------------
-- Table structure for tf_menu
-- ----------------------------
DROP TABLE IF EXISTS `tf_menu`;
CREATE TABLE `tf_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名字',
  `menuCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单代码',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由路径',
  `orderNum` int(11) NULL DEFAULT NULL COMMENT '排序',
  `isShow` int(11) NULL DEFAULT NULL COMMENT '是否展示;0：展示  1：不展示',
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传人id',
  `createTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前台菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_menu
-- ----------------------------
INSERT INTO `tf_menu` VALUES (1, '首页', 'homePage', '/homePage', 1, 0, '1', '2023-02-03 09:17:49');
INSERT INTO `tf_menu` VALUES (2, '服务范围', 'serviceScope', '/serviceScope', 2, 0, '1', '2023-02-03 09:18:01');
INSERT INTO `tf_menu` VALUES (3, '流程示例', 'processExample', '/processExample', 3, 0, '1', '2023-02-03 09:18:14');
INSERT INTO `tf_menu` VALUES (4, '关于我们', 'aboutUs', '/aboutUs', 4, 0, '1', '2023-04-06 11:01:25');

-- ----------------------------
-- Table structure for tf_phone
-- ----------------------------
DROP TABLE IF EXISTS `tf_phone`;
CREATE TABLE `tf_phone`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phoneName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人名称',
  `phoneNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人号码',
  `isShow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否展示;0：展示 1：不展示',
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传人id',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前台热线表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_phone
-- ----------------------------
INSERT INTO `tf_phone` VALUES (1, 'simon', '13438835715', '0', '1', '2022-11-16 10:51:05');
INSERT INTO `tf_phone` VALUES (2, '王先生', '13550291397', '0', '1', '2022-11-16 10:53:14');
INSERT INTO `tf_phone` VALUES (3, '陈先生', '18180639606', '0', '1', '2022-11-16 10:53:38');
INSERT INTO `tf_phone` VALUES (4, '小王', '111111', '1', NULL, NULL);

-- ----------------------------
-- Table structure for tf_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `tf_qrcode`;
CREATE TABLE `tf_qrcode`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `descr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码描述',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二维码图片地址',
  `isShow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否展示;0：展示 1：不展示',
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传人id',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前台公司二维码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_qrcode
-- ----------------------------
INSERT INTO `tf_qrcode` VALUES (1, '公司二维码', 'http://localhost:9898/qrcode.png', '0', '1', '2022-11-16 10:55:44');

-- ----------------------------
-- Table structure for tf_swiper
-- ----------------------------
DROP TABLE IF EXISTS `tf_swiper`;
CREATE TABLE `tf_swiper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderNum` int(11) NOT NULL COMMENT '显示次序',
  `desr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片描述',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
  `isShow` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否展示;0：展示  1：不展示',
  `createBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传人id',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前台轮播图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_swiper
-- ----------------------------
INSERT INTO `tf_swiper` VALUES (1, 1, '第一张', 'http://localhost:9898/hm1.mp4', '0', '1', '2022-11-16 10:41:50');
INSERT INTO `tf_swiper` VALUES (2, 2, '第二张', 'http://localhost:9898/hm2.png', '1', '1', '2022-11-16 10:42:10');

-- ----------------------------
-- Table structure for tf_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tf_sys_role_menu`;
CREATE TABLE `tf_sys_role_menu`  (
  `role_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `menu_id` bigint(200) NOT NULL DEFAULT 0 COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_sys_role_menu
-- ----------------------------
INSERT INTO `tf_sys_role_menu` VALUES (5, 1);
INSERT INTO `tf_sys_role_menu` VALUES (5, 5);
INSERT INTO `tf_sys_role_menu` VALUES (5, 6);
INSERT INTO `tf_sys_role_menu` VALUES (5, 7);
INSERT INTO `tf_sys_role_menu` VALUES (5, 8);
INSERT INTO `tf_sys_role_menu` VALUES (5, 9);
INSERT INTO `tf_sys_role_menu` VALUES (5, 10);
INSERT INTO `tf_sys_role_menu` VALUES (5, 11);
INSERT INTO `tf_sys_role_menu` VALUES (5, 12);
INSERT INTO `tf_sys_role_menu` VALUES (5, 13);
INSERT INTO `tf_sys_role_menu` VALUES (5, 14);
INSERT INTO `tf_sys_role_menu` VALUES (5, 15);
INSERT INTO `tf_sys_role_menu` VALUES (5, 16);
INSERT INTO `tf_sys_role_menu` VALUES (5, 17);
INSERT INTO `tf_sys_role_menu` VALUES (5, 18);
INSERT INTO `tf_sys_role_menu` VALUES (5, 22);
INSERT INTO `tf_sys_role_menu` VALUES (5, 23);
INSERT INTO `tf_sys_role_menu` VALUES (5, 24);
INSERT INTO `tf_sys_role_menu` VALUES (5, 25);
INSERT INTO `tf_sys_role_menu` VALUES (5, 26);
INSERT INTO `tf_sys_role_menu` VALUES (5, 27);
INSERT INTO `tf_sys_role_menu` VALUES (5, 28);
INSERT INTO `tf_sys_role_menu` VALUES (5, 29);
INSERT INTO `tf_sys_role_menu` VALUES (5, 30);
INSERT INTO `tf_sys_role_menu` VALUES (5, 31);
INSERT INTO `tf_sys_role_menu` VALUES (5, 32);
INSERT INTO `tf_sys_role_menu` VALUES (5, 33);
INSERT INTO `tf_sys_role_menu` VALUES (5, 34);
INSERT INTO `tf_sys_role_menu` VALUES (5, 35);
INSERT INTO `tf_sys_role_menu` VALUES (5, 36);
INSERT INTO `tf_sys_role_menu` VALUES (5, 37);
INSERT INTO `tf_sys_role_menu` VALUES (5, 38);
INSERT INTO `tf_sys_role_menu` VALUES (5, 39);
INSERT INTO `tf_sys_role_menu` VALUES (5, 40);
INSERT INTO `tf_sys_role_menu` VALUES (5, 41);
INSERT INTO `tf_sys_role_menu` VALUES (5, 42);
INSERT INTO `tf_sys_role_menu` VALUES (5, 43);
INSERT INTO `tf_sys_role_menu` VALUES (5, 44);
INSERT INTO `tf_sys_role_menu` VALUES (5, 45);
INSERT INTO `tf_sys_role_menu` VALUES (5, 46);
INSERT INTO `tf_sys_role_menu` VALUES (5, 47);
INSERT INTO `tf_sys_role_menu` VALUES (5, 48);
INSERT INTO `tf_sys_role_menu` VALUES (5, 49);
INSERT INTO `tf_sys_role_menu` VALUES (5, 50);
INSERT INTO `tf_sys_role_menu` VALUES (5, 51);
INSERT INTO `tf_sys_role_menu` VALUES (5, 52);
INSERT INTO `tf_sys_role_menu` VALUES (6, 1);
INSERT INTO `tf_sys_role_menu` VALUES (6, 5);
INSERT INTO `tf_sys_role_menu` VALUES (6, 6);
INSERT INTO `tf_sys_role_menu` VALUES (6, 7);
INSERT INTO `tf_sys_role_menu` VALUES (6, 8);
INSERT INTO `tf_sys_role_menu` VALUES (6, 9);
INSERT INTO `tf_sys_role_menu` VALUES (6, 10);
INSERT INTO `tf_sys_role_menu` VALUES (6, 11);
INSERT INTO `tf_sys_role_menu` VALUES (6, 12);
INSERT INTO `tf_sys_role_menu` VALUES (6, 13);
INSERT INTO `tf_sys_role_menu` VALUES (6, 14);
INSERT INTO `tf_sys_role_menu` VALUES (6, 22);
INSERT INTO `tf_sys_role_menu` VALUES (6, 23);

-- ----------------------------
-- Table structure for tf_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tf_sys_user_role`;
CREATE TABLE `tf_sys_user_role`  (
  `user_id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `role_id` bigint(200) NOT NULL DEFAULT 0 COMMENT '角色id',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_sys_user_role
-- ----------------------------
INSERT INTO `tf_sys_user_role` VALUES (1, 5);
INSERT INTO `tf_sys_user_role` VALUES (2, 6);

-- ----------------------------
-- Table structure for tf_sysmenu
-- ----------------------------
DROP TABLE IF EXISTS `tf_sysmenu`;
CREATE TABLE `tf_sysmenu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父级id',
  `type` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型 0：菜单 1：接口',
  `menu_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'NULL' COMMENT '菜单名',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_by` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime(3) NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '是否删除（0未删除 1已删除）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_sysmenu
-- ----------------------------
INSERT INTO `tf_sysmenu` VALUES (1, NULL, '0', '首页', 'home', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:40:00.443', NULL, '2023-03-28 17:38:17.240', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (5, NULL, '0', '前台设置', 'front', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:42:21.316', NULL, '2023-03-01 21:42:21.316', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (6, 5, '0', '菜单开放', 'menu', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:43:40.230', NULL, '2023-03-01 21:43:40.230', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (7, 5, '0', '底部设置', 'foot', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:44:05.319', NULL, '2023-03-01 21:44:05.319', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (8, 5, '0', '联系我们', 'concact', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:44:51.199', NULL, '2023-03-01 21:44:51.199', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (9, NULL, '0', '需求设置', 'demand', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:45:19.987', NULL, '2023-03-28 21:02:14.681', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (10, 9, '0', '需求列表', 'demandList', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:46:59.724', NULL, '2023-03-28 21:02:14.681', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (11, NULL, '0', '个人中心', 'user', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:47:46.855', NULL, '2023-03-04 22:34:49.715', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (12, 11, '0', '个人信息', 'personalInfo', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:48:39.380', NULL, '2023-03-01 21:48:39.380', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (13, 11, '0', '消息列表', 'messageList', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:49:23.968', NULL, '2023-03-01 21:49:23.968', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (14, 11, '0', '登录日志', 'loginLog', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:50:02.628', NULL, '2023-03-01 21:50:02.628', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (15, NULL, '0', '系统设置', 'settings', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:50:43.055', NULL, '2023-03-04 22:35:01.698', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (16, 15, '0', '用户设置', 'userSettings', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:51:14.393', NULL, '2023-03-01 21:51:14.393', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (17, 15, '0', '角色设置', 'roleSettings', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:51:48.094', NULL, '2023-03-01 21:51:48.094', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (18, 15, '0', '权限设置', 'permissionSettings', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:52:35.601', NULL, '2023-03-01 21:52:35.601', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (22, 1, '1', '获取用户日志数据', 'sys/home/getLogData', NULL, '0', '0', 'sys:home:getLogData', '#', NULL, '2023-03-17 16:28:29.146', NULL, '2023-03-28 17:38:18.330', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (23, 1, '1', '获取PV、UV数据接口', 'sys/home/getPUvData', NULL, '0', '0', 'sys:home:getPUvData', '#', NULL, '2023-03-27 21:15:53.073', NULL, '2023-03-28 17:38:18.404', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (24, 16, '1', '查询用户列表', 'sys/userSettings/pageListUser', NULL, '0', '0', 'sys:userSettings:pageListUser', '#', NULL, '2023-03-27 21:31:01.000', NULL, '2023-03-27 21:31:01.000', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (25, 17, '1', '查询角色列表', 'sys/roleSettings/pageListRole', NULL, '0', '0', 'sys:roleSettings:pageListRole', '#', NULL, '2023-03-27 23:00:04.994', NULL, '2023-03-27 23:00:04.994', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (26, 18, '1', '查询权限列表', 'sys/permissionSettings/pageListPer', NULL, '0', '0', 'sys:permissionSettings:pageListPer', '#', NULL, '2023-03-28 11:35:42.255', NULL, '2023-03-28 11:35:42.255', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (27, 18, '1', '停用权限数据', 'sys/permissionSettings/stopStatus', NULL, '0', '0', 'sys:permissionSettings:stopStatus', '#', NULL, '2023-03-28 16:46:47.176', NULL, '2023-03-28 16:46:47.176', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (28, 18, '1', '恢复权限数据', 'sys/permissionSettings/returnStatus', NULL, '0', '0', 'sys:permissionSettings:returnStatus', '#', NULL, '2023-03-28 16:47:15.514', NULL, '2023-03-28 16:47:15.514', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (29, 18, '1', '添加权限列表', 'sys/permissionSettings/addOnePer', NULL, '0', '0', 'sys:permissionSettings:addOnePer', '#', NULL, '2023-03-28 22:20:35.654', NULL, '2023-03-28 22:20:35.654', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (30, 18, '1', '编辑权限列表', 'sys/permissionSettings/editOnePer', NULL, '0', '0', 'sys:permissionSettings:editOnePer', '#', NULL, '2023-03-28 22:56:22.000', NULL, '2023-03-28 22:56:22.000', 0, '');
INSERT INTO `tf_sysmenu` VALUES (31, 17, '1', '禁用角色状态', 'sys/roleSettings/forbbinStatus', NULL, '0', '0', 'sys:roleSettings:forbbinStatus', '#', NULL, '2023-03-29 10:58:29.188', NULL, '2023-03-29 10:58:29.188', 0, '');
INSERT INTO `tf_sysmenu` VALUES (32, 17, '1', '恢复角色状态', 'sys/roleSettings/returnStatus', NULL, '0', '0', 'sys:roleSettings:returnStatus', '#', NULL, '2023-03-29 11:06:54.355', NULL, '2023-03-29 11:06:54.355', 0, '');
INSERT INTO `tf_sysmenu` VALUES (33, 17, '1', '添加角色列表', 'sys/roleSettings/addOneRole', NULL, '0', '0', 'sys:roleSettings:addOneRole', '#', NULL, '2023-03-29 11:54:52.405', NULL, '2023-03-29 11:54:52.405', 0, '');
INSERT INTO `tf_sysmenu` VALUES (34, 17, '1', '查询角色权限', 'sys/roleSettings/queryRolePer', NULL, '0', '0', 'sys:roleSettings:queryRolePer', '#', NULL, '2023-03-29 22:05:12.097', NULL, '2023-03-29 22:05:12.097', 0, '');
INSERT INTO `tf_sysmenu` VALUES (35, 17, '1', '更改角色权限', 'sys/roleSettings/changeRolePer', NULL, '0', '0', 'sys:roleSettings:changeRolePer', '#', NULL, '2023-03-30 15:14:38.076', NULL, '2023-03-30 15:14:38.076', 0, '');
INSERT INTO `tf_sysmenu` VALUES (36, 16, '1', '添加用户列表', 'sys/userSettings/addOneUser', NULL, '0', '0', 'sys:userSettings:addOneUser', '#', NULL, '2023-03-30 17:01:16.445', NULL, '2023-03-30 17:01:16.445', 0, '');
INSERT INTO `tf_sysmenu` VALUES (37, 16, '1', '查询用户角色', 'sys/userSettings/queryUserRole', NULL, '0', '0', 'sys:userSettings:queryUserRole', '#', NULL, '2023-03-31 11:40:54.306', NULL, '2023-03-31 11:40:54.306', 0, '');
INSERT INTO `tf_sysmenu` VALUES (38, 16, '1', '更改用户角色', 'sys/userSettings/changeUserRole', NULL, '0', '0', 'sys:userSettings:changeUserRole', '#', NULL, '2023-03-31 14:53:37.346', NULL, '2023-03-31 14:53:37.346', 0, '');
INSERT INTO `tf_sysmenu` VALUES (39, 12, '1', '查询当前个人信息', 'sys/personal/getPersonInfo', NULL, '0', '0', 'sys:personal:getPersonInfo', '#', NULL, '2023-04-03 11:34:54.065', NULL, '2023-04-03 11:34:54.065', 0, '');
INSERT INTO `tf_sysmenu` VALUES (40, 12, '1', '更新当前个人信息', 'sys/personal/editUser', NULL, '0', '0', 'sys:personal:editUser', '#', 1, '2023-04-04 17:23:03.764', NULL, '2023-04-04 17:23:03.764', 0, '');
INSERT INTO `tf_sysmenu` VALUES (41, 10, '1', '查询需求列表，分页', 'sys/demand/pageList', NULL, '0', '0', 'sys:demand:pageList', '#', 1, '2023-04-05 22:32:13.620', NULL, '2023-04-05 22:32:13.620', 0, '');
INSERT INTO `tf_sysmenu` VALUES (42, 10, '1', '更改需求状态', 'sys/demand/updateIsRelation', NULL, '0', '0', 'sys:demand:updateIsRelation', '#', 1, '2023-04-05 23:23:56.648', NULL, '2023-04-05 23:23:56.648', 0, '');
INSERT INTO `tf_sysmenu` VALUES (43, 6, '1', '查询前台菜单列表，分页', 'sys/menu/pageList', NULL, '0', '0', 'sys:menu:pageList', '#', 1, '2023-04-05 23:44:05.617', NULL, '2023-04-05 23:44:05.617', 0, '');
INSERT INTO `tf_sysmenu` VALUES (44, 6, '1', '编辑前台菜单', 'sys/menu/editMenu', NULL, '0', '0', 'sys:menu:editMenu', '#', 1, '2023-04-05 23:44:41.596', NULL, '2023-04-05 23:44:41.596', 0, '');
INSERT INTO `tf_sysmenu` VALUES (45, 6, '1', '新增前台菜单', 'sys/menu/addOne', NULL, '0', '0', 'sys:menu:addOne', '#', 1, '2023-04-06 10:55:04.638', NULL, '2023-04-06 10:55:04.638', 0, '');
INSERT INTO `tf_sysmenu` VALUES (46, 8, '1', '查询联系我们信息', 'sys/contact/getContact', NULL, '0', '0', 'sys:contact:getContact', '#', 1, '2023-04-06 11:38:30.595', NULL, '2023-04-06 11:38:30.595', 0, '');
INSERT INTO `tf_sysmenu` VALUES (47, 8, '1', '编辑联系我们信息', 'sys/contact/edidContact', NULL, '0', '0', 'sys:contact:edidContact', '#', 1, '2023-04-06 11:39:00.958', NULL, '2023-04-06 11:39:00.958', 0, '');
INSERT INTO `tf_sysmenu` VALUES (48, 7, '1', '查询底部设置号码列表', 'sys/foot/pageList', NULL, '0', '0', 'sys:foot:pageList', '#', 1, '2023-04-06 14:38:07.674', NULL, '2023-04-06 14:38:07.674', 0, '');
INSERT INTO `tf_sysmenu` VALUES (49, 7, '1', '编辑底部设置号码', 'sys/foot/editSysPhone', NULL, '0', '0', 'sys:foot:editSysPhone', '#', 1, '2023-04-06 15:37:11.166', NULL, '2023-04-06 15:37:11.166', 0, '');
INSERT INTO `tf_sysmenu` VALUES (50, 7, '1', '添加底部设置号码', 'sys/foot/addOne', NULL, '0', '0', 'sys:foot:addOne', '#', 1, '2023-04-06 15:37:35.016', NULL, '2023-04-06 15:37:35.016', 0, '');
INSERT INTO `tf_sysmenu` VALUES (51, 7, '1', '获取底部设置号二维码', 'sys/foot/getOne', NULL, '0', '0', 'sys:foot:getOne', '#', 1, '2023-04-06 17:32:02.159', NULL, '2023-04-06 17:32:02.159', 0, '');
INSERT INTO `tf_sysmenu` VALUES (52, 7, '1', '上传底部设置二维码', 'sys/foot/uploadQrcode', NULL, '0', '0', 'sys:foot:uploadQrcode', '#', 1, '2023-04-06 23:02:10.072', NULL, '2023-04-06 23:02:10.072', 0, '');

-- ----------------------------
-- Table structure for tf_sysrole
-- ----------------------------
DROP TABLE IF EXISTS `tf_sysrole`;
CREATE TABLE `tf_sysrole`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色字符串',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '角色状态（0正常 1停用）',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT 'del_flag',
  `create_by` bigint(200) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` bigint(200) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_sysrole
-- ----------------------------
INSERT INTO `tf_sysrole` VALUES (5, '后台管理员', 'sys_admin', '0', 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tf_sysrole` VALUES (6, '客服', 'customer_service', '0', 0, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tf_sysuser
-- ----------------------------
DROP TABLE IF EXISTS `tf_sysuser`;
CREATE TABLE `tf_sysuser`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NULL' COMMENT '用户名',
  `nick_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NULL' COMMENT '昵称',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NULL' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常1停用)',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phonenumber` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户性别（0男，1女，2未知)',
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `user_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '用户类型（0管理员，1普通用户)',
  `create_by` bigint(20) NULL DEFAULT NULL COMMENT '创建人的用户id ',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(11) NULL DEFAULT 0 COMMENT '删除标志（0代表未删除，1代表已删除）',
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_sysuser
-- ----------------------------
INSERT INTO `tf_sysuser` VALUES (1, 'simon', '高启强', '$2a$10$fsTXJ1xnuZPfxyIkLu5uieddfy5352UiUBwS2fc.z00ZfOLl2YQcu', '0', '2830224482@qq.com', '13438835715', '0', 'https://i2.hdslb.com/bfs/archive/c76ae4e159bfa7483cef33c3f4614af0a68cfd5a.jpg', '0', 1, '2023-02-23 00:35:02', NULL, NULL, 0, 'oa9wA02KwJaFukuFRWaX0l-0AmNw');
INSERT INTO `tf_sysuser` VALUES (2, 'test', 'test', '$2a$10$fsTXJ1xnuZPfxyIkLu5uieddfy5352UiUBwS2fc.z00ZfOLl2YQcu', '0', NULL, '13438835714', NULL, NULL, '1', NULL, '2023-02-26 21:07:33', NULL, NULL, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
