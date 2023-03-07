/*
 Navicat Premium Data Transfer

 Source Server         : 120.48.94.210百度云主机
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : 120.48.94.210:3306
 Source Schema         : website

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 07/03/2023 22:23:25
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前台需求表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_demand
-- ----------------------------
INSERT INTO `tf_demand` VALUES (1, '张三', '杭州市上城区采荷街道凯旋路96号', '12345678910', '279738378@gmail.com', '想做一个毕设系统', '2022-11-16 11:13:52');
INSERT INTO `tf_demand` VALUES (3, '李思', '黑龙江省鹤岗市工农区新鹤路金广大厦1808', '13515556726', '2045698851@qq.com', '现在给我开发一个开票系统', '2023-02-02 11:44:40');

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
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前台日志表' ROW_FORMAT = Dynamic;

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
INSERT INTO `tf_log` VALUES (18, '0:0:0:0:0:0:0:1', '', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-02-27 20:40:09');
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
INSERT INTO `tf_log` VALUES (65, '0:0:0:0:0:0:0:1', '', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-02 22:32:42');
INSERT INTO `tf_log` VALUES (66, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 关于我们 ]', '1', '2023-03-02 22:33:30');
INSERT INTO `tf_log` VALUES (67, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-02 22:33:31');
INSERT INTO `tf_log` VALUES (68, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-02 22:33:31');
INSERT INTO `tf_log` VALUES (69, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-02 22:33:31');
INSERT INTO `tf_log` VALUES (70, '0:0:0:0:0:0:0:1', '', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-02 22:33:31');
INSERT INTO `tf_log` VALUES (71, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-04 01:27:23');
INSERT INTO `tf_log` VALUES (72, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-05 23:06:13');
INSERT INTO `tf_log` VALUES (73, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-05 23:06:14');
INSERT INTO `tf_log` VALUES (74, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:42');
INSERT INTO `tf_log` VALUES (75, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:42');
INSERT INTO `tf_log` VALUES (76, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:43');
INSERT INTO `tf_log` VALUES (77, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-03-06 21:08:43');
INSERT INTO `tf_log` VALUES (78, '0:0:0:0:0:0:0:1', '', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:45');
INSERT INTO `tf_log` VALUES (79, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 关于我们 ]', '1', '2023-03-06 21:08:58');
INSERT INTO `tf_log` VALUES (80, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:58');
INSERT INTO `tf_log` VALUES (81, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:58');
INSERT INTO `tf_log` VALUES (82, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:58');
INSERT INTO `tf_log` VALUES (83, '0:0:0:0:0:0:0:1', '', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:08:59');
INSERT INTO `tf_log` VALUES (84, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-03-06 21:09:28');
INSERT INTO `tf_log` VALUES (85, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:09:29');
INSERT INTO `tf_log` VALUES (86, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:09:29');
INSERT INTO `tf_log` VALUES (87, '0:0:0:0:0:0:0:1', '', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:09:29');
INSERT INTO `tf_log` VALUES (88, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 关于我们 ]', '1', '2023-03-06 21:09:48');
INSERT INTO `tf_log` VALUES (89, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:09:48');
INSERT INTO `tf_log` VALUES (90, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:09:48');
INSERT INTO `tf_log` VALUES (91, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:09:48');
INSERT INTO `tf_log` VALUES (92, '0:0:0:0:0:0:0:1', '', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:09:49');
INSERT INTO `tf_log` VALUES (93, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '点击菜单 [ 首页 ]', '1', '2023-03-06 21:10:31');
INSERT INTO `tf_log` VALUES (94, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:10:31');
INSERT INTO `tf_log` VALUES (95, '127.0.0.1', '本机地址', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:10:32');
INSERT INTO `tf_log` VALUES (96, '0:0:0:0:0:0:0:1', '', 'Windows 10', 'Chrome 11-110.0.0.0', '数据请求', '0', '2023-03-06 21:10:32');
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
INSERT INTO `tf_menu` VALUES (4, '关于我们', 'aboutUs', '/aboutUs', 4, 0, '1', '2023-02-03 11:58:22');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前台热线表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_phone
-- ----------------------------
INSERT INTO `tf_phone` VALUES (1, 'simon', '13438835715', '0', '1', '2022-11-16 10:51:05');
INSERT INTO `tf_phone` VALUES (2, '王先生', '13550291397', '0', '1', '2022-11-16 10:53:14');
INSERT INTO `tf_phone` VALUES (3, '陈先生', '18180639606', '0', '1', '2022-11-16 10:53:38');

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
INSERT INTO `tf_swiper` VALUES (2, 2, '第二张', 'http://localhost:9898/hm2.png', '0', '1', '2022-11-16 10:42:10');

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
INSERT INTO `tf_sys_role_menu` VALUES (5, 19);
INSERT INTO `tf_sys_role_menu` VALUES (6, 1);
INSERT INTO `tf_sys_role_menu` VALUES (6, 5);
INSERT INTO `tf_sys_role_menu` VALUES (6, 6);
INSERT INTO `tf_sys_role_menu` VALUES (6, 7);
INSERT INTO `tf_sys_role_menu` VALUES (6, 8);
INSERT INTO `tf_sys_role_menu` VALUES (6, 9);
INSERT INTO `tf_sys_role_menu` VALUES (6, 10);

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
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tf_sysmenu
-- ----------------------------
INSERT INTO `tf_sysmenu` VALUES (1, NULL, '0', '首页', 'home', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:40:00.443', NULL, '2023-03-01 21:41:15.526', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (5, NULL, '0', '前台设置', 'front', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:42:21.316', NULL, '2023-03-01 21:42:21.316', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (6, 5, '0', '菜单开放', 'menu', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:43:40.230', NULL, '2023-03-01 21:43:40.230', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (7, 5, '0', '底部设置', 'foot', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:44:05.319', NULL, '2023-03-01 21:44:05.319', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (8, 5, '0', '联系我们', 'concact', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:44:51.199', NULL, '2023-03-01 21:44:51.199', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (9, NULL, '0', '需求设置', 'demand', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:45:19.987', NULL, '2023-03-01 21:45:19.987', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (10, 9, '0', '需求列表', 'demandList', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:46:59.724', NULL, '2023-03-01 21:46:59.724', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (11, NULL, '0', '个人中心', 'user', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:47:46.855', NULL, '2023-03-04 22:34:49.715', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (12, 11, '0', '个人信息', 'personalInfo', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:48:39.380', NULL, '2023-03-01 21:48:39.380', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (13, 11, '0', '消息列表', 'messageList', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:49:23.968', NULL, '2023-03-01 21:49:23.968', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (14, 11, '0', '登录日志', 'loginLog', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:50:02.628', NULL, '2023-03-01 21:50:02.628', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (15, NULL, '0', '系统设置', 'settings', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:50:43.055', NULL, '2023-03-04 22:35:01.698', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (16, 15, '0', '用户设置', 'userSettings', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:51:14.393', NULL, '2023-03-01 21:51:14.393', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (17, 15, '0', '角色设置', 'roleSettings', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:51:48.094', NULL, '2023-03-01 21:51:48.094', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (18, 15, '0', '权限设置', 'permissionSettings', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:52:35.601', NULL, '2023-03-01 21:52:35.601', 0, NULL);
INSERT INTO `tf_sysmenu` VALUES (19, 15, '0', '资源设置', 'resourceSettings', NULL, '0', '0', NULL, '#', NULL, '2023-03-01 21:53:12.654', NULL, '2023-03-01 21:53:12.654', 0, NULL);

-- ----------------------------
-- Table structure for tf_sysrole
-- ----------------------------
DROP TABLE IF EXISTS `tf_sysrole`;
CREATE TABLE `tf_sysrole`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色权限字符串',
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
INSERT INTO `tf_sysuser` VALUES (1, 'simon', '高启强', '$2a$10$fsTXJ1xnuZPfxyIkLu5uieddfy5352UiUBwS2fc.z00ZfOLl2YQcu', '0', '2830224482@qq.com', '13438835715', '0', 'https://i2.hdslb.com/bfs/archive/c76ae4e159bfa7483cef33c3f4614af0a68cfd5a.jpg', '0', NULL, '2023-02-23 00:35:02', NULL, NULL, 0, 'oa9wA02KwJaFukuFRWaX0l-0AmNw');
INSERT INTO `tf_sysuser` VALUES (2, 'test', 'test', '$2a$10$fsTXJ1xnuZPfxyIkLu5uieddfy5352UiUBwS2fc.z00ZfOLl2YQcu', '0', NULL, '13438835714', NULL, NULL, '1', NULL, '2023-02-26 21:07:33', NULL, NULL, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
