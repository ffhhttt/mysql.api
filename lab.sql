/*
 Navicat Premium Data Transfer

 Source Server         : MySQL - @localhost
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : lab

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 21/04/2022 09:05:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base
-- ----------------------------
DROP TABLE IF EXISTS `base`;
CREATE TABLE `base`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `place` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `base_id_uindex`(`id`) USING BTREE,
  UNIQUE INDEX `base_place_uindex`(`place`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chemicals
-- ----------------------------
DROP TABLE IF EXISTS `chemicals`;
CREATE TABLE `chemicals`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `place` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stock` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `chemicals_place_uindex`(`place`) USING BTREE,
  UNIQUE INDEX `chemicals_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for container
-- ----------------------------
DROP TABLE IF EXISTS `container`;
CREATE TABLE `container`  (
  `id` int(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for experimentlog
-- ----------------------------
DROP TABLE IF EXISTS `experimentlog`;
CREATE TABLE `experimentlog`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `experiments_id` int(0) NOT NULL,
  `startTime` timestamp(0) NULL DEFAULT NULL,
  `endTime` timestamp(0) NULL DEFAULT NULL,
  `users_id` int(0) NULL DEFAULT NULL,
  `standby` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `experimentLog_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for experiments
-- ----------------------------
DROP TABLE IF EXISTS `experiments`;
CREATE TABLE `experiments`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `experimentName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createTime` timestamp(0) NULL DEFAULT NULL,
  `updateTime` timestamp(0) NULL DEFAULT NULL,
  `users_id` int(0) NULL DEFAULT NULL,
  `description` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `experiments_tName_uindex`(`experimentName`) USING BTREE,
  INDEX `experiments___fk_uid`(`users_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for experimentstep
-- ----------------------------
DROP TABLE IF EXISTS `experimentstep`;
CREATE TABLE `experimentstep`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `experiments_id` int(0) NOT NULL,
  `step` int(0) NOT NULL,
  `startTime` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `task` int(0) NOT NULL,
  `receiver` int(0) NULL DEFAULT NULL,
  `container_id` int(0) NULL DEFAULT NULL,
  `chemicals_id` int(0) NULL DEFAULT NULL,
  `usages` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tubes_move` int(0) NULL DEFAULT NULL,
  `tubes_platform` int(0) NULL DEFAULT NULL,
  `tubes_reaction` int(0) NULL DEFAULT NULL,
  `start_pos` int(0) NULL DEFAULT NULL,
  `end_pos` int(0) NULL DEFAULT NULL,
  `temperature` int(0) NULL DEFAULT NULL,
  `pressure` int(0) NULL DEFAULT NULL,
  `duration_min` int(0) NULL DEFAULT NULL,
  `speed` int(0) NULL DEFAULT NULL,
  `hplc_count` int(0) NULL DEFAULT NULL,
  `singleTask_start` int(0) NULL DEFAULT NULL,
  `singleTask_end` int(0) NULL DEFAULT NULL,
  `backup_add` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `backup_move` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `backup_sample` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `backup_HPLC` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `backup_react` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sample_pos` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `experiment_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `experiments_id` int(0) NULL DEFAULT NULL,
  `allparameters` json NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orders_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `x` int(0) NOT NULL,
  `y` int(0) NOT NULL,
  `base_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `table_name_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for platformdetail
-- ----------------------------
DROP TABLE IF EXISTS `platformdetail`;
CREATE TABLE `platformdetail`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `base_id` int(0) NOT NULL,
  `basePlace` int(0) NOT NULL,
  `chemicals_id` int(0) NULL DEFAULT NULL,
  `container_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `table_name_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `realName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `schoolId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_uid_uindex`(`id`) USING BTREE,
  UNIQUE INDEX `users_userName_uindex`(`userName`) USING BTREE,
  UNIQUE INDEX `users_schoolId_uindex`(`schoolId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Triggers structure for table experiments
-- ----------------------------
DROP TRIGGER IF EXISTS `start`;
delimiter ;;
CREATE TRIGGER `start` BEFORE INSERT ON `experiments` FOR EACH ROW BEGIN
SET new.createTime=NOW();
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table experimentstep
-- ----------------------------
DROP TRIGGER IF EXISTS `intime`;
delimiter ;;
CREATE TRIGGER `intime` BEFORE INSERT ON `experimentstep` FOR EACH ROW UPDATE experiments set updateTime=NOW() WHERE id=new.experiments_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table experimentstep
-- ----------------------------
DROP TRIGGER IF EXISTS `updateJson`;
delimiter ;;
CREATE TRIGGER `updateJson` BEFORE UPDATE ON `experimentstep` FOR EACH ROW UPDATE orders SET allparameters=JSON_SET(allparameters,'$.experiments_id',new.experiments_id,'$.step',new.step,'$.startTime',new.startTime,'$.task',new.task,'$.receiver',new.receiver,'$.container_id',new.container_id,'$.chemicals_id',new.chemicals_id,'$.usages',new.usages,'$.tubes_move',new.tubes_move,'$.tubes_platform',new.tubes_platform,'$.tubes_reaction',new.tubes_reaction,'$.start_pos',new.start_pos,'$.end_pos',new.end_pos,'$.temperature',new.temperature,'$.pressure',new.pressure,'$.duration_min',new.duration_min,'$.speed',new.speed,'$.hplc_count',new.hplc_count,'$.singleTask_start',new.singleTask_start,'$.singleTask_end',new.singleTask_end,'$.backup_add',new.backup_add,'$.backup_move',new.backup_move,'$.backup_sample',new.backup_sample,'$.backup_HPLC',new.backup_HPLC,'$.backup_react',new.backup_react) WHERE id=new.id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table experimentstep
-- ----------------------------
DROP TRIGGER IF EXISTS `updatetime`;
delimiter ;;
CREATE TRIGGER `updatetime` BEFORE UPDATE ON `experimentstep` FOR EACH ROW UPDATE experiments set updateTime=NOW() WHERE id=new.experiments_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table experimentstep
-- ----------------------------
DROP TRIGGER IF EXISTS `inJson`;
delimiter ;;
CREATE TRIGGER `inJson` BEFORE INSERT ON `experimentstep` FOR EACH ROW BEGIN
INSERT INTO orders(id,experiments_id,allparameters) VALUES(new.id,new.experiments_id,CASE new.task WHEN 1 THEN JSON_OBJECT('experiments_id',new.experiments_id,'step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'container_id',new.container_id,'chemicals_id',new.chemicals_id,'usages',new.usages,'backup_add',new.backup_add) WHEN 2 THEN JSON_OBJECT('experiments_id',new.experiments_id,'step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'container_id',new.container_id,'chemicals_id',new.chemicals_id,'tubes_move',new.tubes_move,'tubes_platform',new.tubes_platform,'tubes_reaction',new.tubes_reaction,'start_pos',new.start_pos,'end_pos',new.end_pos,'backup_move',new.backup_move) WHEN 3 THEN JSON_OBJECT('experiments_id',new.experiments_id,'step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'container_id',new.container_id,'chemicals_id',new.chemicals_id,'temperature',new.temperature,'pressure',new.pressure,'duration_min',new.duration_min,'speed',new.speed,'backup_react',new.backup_react) WHEN 4 THEN JSON_OBJECT('experiments_id',new.experiments_id,'step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'container_id',new.container_id,'chemicals_id',new.chemicals_id,'hplc_count',new.hplc_count,'backup_HPLC',new.backup_HPLC) WHEN 5 THEN JSON_OBJECT('experiments_id',new.experiments_id,'step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'container_id',new.container_id,'chemicals_id',new.chemicals_id,'singleTask_start',new.singleTask_start,'singleTask_end',new.singleTask_end) WHEN 6 THEN JSON_OBJECT('experiments_id',new.experiments_id,'step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'container_id',new.container_id,'chemicals_id',new.chemicals_id,'sample_pos',new.sample_pos,'backup_sample',new.backup_sample) END);
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
