/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 19/07/2019 08:48:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `upass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `goods_num` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`, `goods_id`) USING BTREE,
  INDEX `commodity(id)`(`goods_id`) USING BTREE,
  CONSTRAINT `commodity(id)` FOREIGN KEY (`goods_id`) REFERENCES `commodityinfo` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for commodityinfo
-- ----------------------------
DROP TABLE IF EXISTS `commodityinfo`;
CREATE TABLE `commodityinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `origin_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `current_price` int(11) NOT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  `image` blob NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `UserInfo(id)`(`seller_id`) USING BTREE,
  INDEX `id`(`id`, `commodity_name`) USING BTREE,
  INDEX `name`(`commodity_name`) USING BTREE,
  CONSTRAINT `UserInfo(id)` FOREIGN KEY (`seller_id`) REFERENCES `userinfor` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `commodity_id` int(11) NOT NULL,
  `commodity_number` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `userInfo1（id）`(`seller_id`) USING BTREE,
  INDEX `userInfo2（id）`(`buyer_id`) USING BTREE,
  INDEX `commodityInfo（id）`(`commodity_id`) USING BTREE,
  CONSTRAINT `commodityInfo（id）` FOREIGN KEY (`commodity_id`) REFERENCES `commodityinfo` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `userInfo1（id）` FOREIGN KEY (`seller_id`) REFERENCES `userinfor` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `userInfo2（id）` FOREIGN KEY (`buyer_id`) REFERENCES `userinfor` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for remark
-- ----------------------------
DROP TABLE IF EXISTS `remark`;
CREATE TABLE `remark`  (
  `remark_id` bigint(100) NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `parent_id` bigint(100) NULL DEFAULT NULL,
  `reply_id` bigint(100) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `private` tinyint(1) NOT NULL,
  PRIMARY KEY (`remark_id`) USING BTREE,
  INDEX `commodityInfo`(`commodity_id`) USING BTREE,
  INDEX `userInfo`(`sender_id`) USING BTREE,
  INDEX `self1`(`parent_id`) USING BTREE,
  INDEX `self2`(`reply_id`) USING BTREE,
  CONSTRAINT `commodityInfo` FOREIGN KEY (`commodity_id`) REFERENCES `commodityinfo` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `self1` FOREIGN KEY (`parent_id`) REFERENCES `remark` (`remark_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `self2` FOREIGN KEY (`reply_id`) REFERENCES `remark` (`remark_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `userInfo` FOREIGN KEY (`sender_id`) REFERENCES `userinfor` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `commodity_Id` int(11) NOT NULL,
  PRIMARY KEY (`type_id`, `commodity_Id`) USING BTREE,
  INDEX `commodityInfo(id)`(`commodity_Id`) USING BTREE,
  CONSTRAINT `commodityInfo(id)` FOREIGN KEY (`commodity_Id`) REFERENCES `commodityinfo` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userinfor
-- ----------------------------
DROP TABLE IF EXISTS `userinfor`;
CREATE TABLE `userinfor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phoneNum` int(11) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` blob NULL,
  `state` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
