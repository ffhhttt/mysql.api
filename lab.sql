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

 Date: 07/05/2022 16:07:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base
-- ----------------------------
DROP TABLE IF EXISTS `base`;
CREATE TABLE `base`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '基座名称',
  `place` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '基座位置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `base_id_uindex`(`id`) USING BTREE,
  UNIQUE INDEX `base_place_uindex`(`place`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '基座在仓库的位置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base
-- ----------------------------
INSERT INTO `base` VALUES (1, '试管托盘', '00-0000-0000-0000');
INSERT INTO `base` VALUES (2, '原料托盘', '00-0000-0000-0001');

-- ----------------------------
-- Table structure for chemicals
-- ----------------------------
DROP TABLE IF EXISTS `chemicals`;
CREATE TABLE `chemicals`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '化学药品名称\r\n',
  `place` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '化学药品位置',
  `stock` int(0) NULL DEFAULT NULL COMMENT '药品量默认单位为ml/mg',
  `type` int(0) NULL DEFAULT NULL COMMENT '0为液体，单位是ml；1为固体，单位是mg',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `chemicals_place_uindex`(`place`) USING BTREE,
  UNIQUE INDEX `chemicals_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '化学药品在仓库的位置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chemicals
-- ----------------------------
INSERT INTO `chemicals` VALUES (1, '盐酸', '00-0000-0000-0000', 100, 0);
INSERT INTO `chemicals` VALUES (2, '盐酸', '00-0000-0000-0001', 10, 0);
INSERT INTO `chemicals` VALUES (3, '硫酸', '00-0000-0000-0002', 10, 0);
INSERT INTO `chemicals` VALUES (4, '盐酸', '11-0000-0000-0001', 50, 0);
INSERT INTO `chemicals` VALUES (5, '四氧化三铁', '01-0000-0000-0000', 50, 1);
INSERT INTO `chemicals` VALUES (9, '盐酸', '11-0100-0000-0000', 50, 0);
INSERT INTO `chemicals` VALUES (11, '盐酸', '11-0000-0000-0003', 50, 0);
INSERT INTO `chemicals` VALUES (13, '盐酸', '11-0100-0000-1000', 50, 0);
INSERT INTO `chemicals` VALUES (14, '盐酸', '11-0110-0000-1000', 50, 0);
INSERT INTO `chemicals` VALUES (16, 'HCl', '01-0011-0011-0011', 10, 0);
INSERT INTO `chemicals` VALUES (17, 'CaO', '00-0000-0010-0010', 20, 1);

-- ----------------------------
-- Table structure for container
-- ----------------------------
DROP TABLE IF EXISTS `container`;
CREATE TABLE `container`  (
  `id` int(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '反应容器名称',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '反应容器位置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '反应容器在仓库的位置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of container
-- ----------------------------
INSERT INTO `container` VALUES (1, 'tube', '1111111');
INSERT INTO `container` VALUES (2, 'tube', '1111110');

-- ----------------------------
-- Table structure for experimentlog
-- ----------------------------
DROP TABLE IF EXISTS `experimentlog`;
CREATE TABLE `experimentlog`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `experiments_id` int(0) NOT NULL COMMENT '实验方案ID',
  `startTime` timestamp(0) NULL DEFAULT NULL COMMENT '实验开始时间',
  `endTime` timestamp(0) NULL DEFAULT NULL COMMENT '实验结束时间',
  `users_id` int(0) NULL DEFAULT NULL COMMENT '用户ID',
  `standby` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `experimentLog_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '实验日志，记录实际进行的实验' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of experimentlog
-- ----------------------------
INSERT INTO `experimentlog` VALUES (1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `experimentlog` VALUES (2, 12, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for experiments
-- ----------------------------
DROP TABLE IF EXISTS `experiments`;
CREATE TABLE `experiments`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `experimentName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '实验方案名称',
  `createTime` timestamp(0) NULL DEFAULT NULL COMMENT '方案创建时间，触发器更改、不用写',
  `updateTime` timestamp(0) NULL DEFAULT NULL COMMENT '方案更新时间，触发器更改、不用写',
  `users_id` int(0) NULL DEFAULT NULL COMMENT '用户ID',
  `description` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '实验描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `experiments_tName_uindex`(`experimentName`) USING BTREE,
  INDEX `experiments___fk_uid`(`users_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '实验方案' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of experiments
-- ----------------------------
INSERT INTO `experiments` VALUES (1, 'a', '2022-04-10 15:41:31', '2022-04-27 16:18:49', 1, NULL);
INSERT INTO `experiments` VALUES (3, 'experiment_a', '2022-04-12 14:33:55', '2022-04-27 16:20:05', 2, NULL);
INSERT INTO `experiments` VALUES (4, 'experiment_b', '2022-04-12 19:33:30', '2022-04-20 13:02:45', 1, NULL);
INSERT INTO `experiments` VALUES (6, 's', NULL, '2022-04-20 23:07:00', NULL, NULL);
INSERT INTO `experiments` VALUES (11, 'experiment_h', '2022-04-13 15:04:10', '2022-04-15 16:51:29', NULL, NULL);
INSERT INTO `experiments` VALUES (12, 'experiment_x', '2022-04-13 15:19:17', '2022-04-13 15:22:25', NULL, NULL);
INSERT INTO `experiments` VALUES (16, 'sss', '2022-04-15 04:23:56', NULL, NULL, NULL);
INSERT INTO `experiments` VALUES (18, 'sa', '2022-04-15 07:30:34', '2022-04-15 07:30:34', NULL, NULL);
INSERT INTO `experiments` VALUES (58, 'fgh', '2022-04-15 09:43:49', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for experimentstep
-- ----------------------------
DROP TABLE IF EXISTS `experimentstep`;
CREATE TABLE `experimentstep`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `experiments_id` int(0) NOT NULL COMMENT '实验方案ID',
  `step` int(0) NOT NULL COMMENT '步骤数',
  `startTime` int(0) NULL DEFAULT NULL COMMENT '此步骤在第step步中的开始时间',
  `receiver` int(0) NOT NULL COMMENT '接受者',
  `task` int(0) NOT NULL COMMENT '任务',
  `base_id` int(0) NULL DEFAULT NULL COMMENT '基座ID',
  `container_id` int(0) NULL DEFAULT NULL COMMENT '实验容器ID',
  `chemicals_id` int(0) NULL DEFAULT NULL COMMENT '化学药品ID',
  `x` int(0) NULL DEFAULT NULL COMMENT '基座在实验台   第几行/区域号',
  `y` int(0) NULL DEFAULT NULL COMMENT '基座在实验台第几列（暂时未启用）',
  `z` int(0) NULL DEFAULT NULL COMMENT '试管/药剂 在基座的第几个孔',
  `usages` int(0) NULL DEFAULT NULL COMMENT '药品用量',
  `add_speed` int(0) NULL DEFAULT NULL COMMENT '直接加入/缓慢加入',
  `start_pos` int(0) NULL DEFAULT NULL COMMENT 'movetask：试管区域号',
  `end_pos` int(0) NULL DEFAULT NULL COMMENT 'movetask：反应区区域号',
  `tubes_move` int(0) NULL DEFAULT NULL COMMENT 'movetask：试管数量',
  `tubes_platform` int(0) NULL DEFAULT NULL COMMENT 'movetask：试管区试管总数量',
  `tubes_reaction` int(0) NULL DEFAULT NULL COMMENT 'movetask：反应区试管总数量',
  `duration_min` int(0) NULL DEFAULT NULL COMMENT '反应持续时间',
  `temperature` int(0) NULL DEFAULT NULL COMMENT '反应温度',
  `react_speed` int(0) NULL DEFAULT NULL COMMENT '搅拌速度',
  `pressure` int(0) NULL DEFAULT NULL COMMENT '反应压强',
  `light` int(0) NULL DEFAULT NULL COMMENT '反应光强',
  `backup_react` int(0) NULL DEFAULT NULL COMMENT '备用反应条件',
  `singleTask_start` int(0) NULL DEFAULT NULL COMMENT 'singletask（将药剂从暂存区13移到实验台的9）的起始位置',
  `singleTask_end` int(0) NULL DEFAULT NULL COMMENT 'singletask的终止位置',
  `sample_pos_1` int(0) NULL DEFAULT NULL COMMENT '采样：进样瓶区域',
  `sample_pos_2` int(0) NULL DEFAULT NULL COMMENT '采样：进样瓶第几个孔',
  `intervals` int(0) NULL DEFAULT NULL COMMENT '采样：取样间隔',
  `sample_volume` int(0) NULL DEFAULT NULL COMMENT '采样：取样量',
  `hplc_count` int(0) NULL DEFAULT NULL COMMENT '进行HPLC的试管数目',
  `hplc_volume` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'HPLC取样量',
  `hplc_involume` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'HPLC进样量',
  `wavelength` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '检测波长',
  `proportion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流动相比例',
  `flowrate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '流速',
  `hplc_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '色谱时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `experiment_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '实验方案的详细步骤' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of experimentstep
-- ----------------------------
INSERT INTO `experimentstep` VALUES (1, 3, 1, 0, 1, 9, 1, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (2, 3, 1, 0, 1, 9, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (3, 3, 1, 0, 1, 10, 2, NULL, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (4, 3, 1, 0, 1, 10, 2, NULL, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (5, 3, 1, 0, 1, 11, 1, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (6, 3, 1, 0, 1, 11, 1, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (7, 3, 2, 0, 2, 1, NULL, 1, 1, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (8, 3, 2, 600, 2, 1, NULL, 1, 2, NULL, NULL, NULL, 80, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (9, 3, 2, 0, 2, 1, NULL, 2, 1, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (10, 3, 2, 600, 2, 1, NULL, 2, 1, NULL, NULL, NULL, 70, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (11, 3, 3, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, 2, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (12, 3, 4, 0, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1200, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (13, 3, 5, 0, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, 5, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (14, 3, 6, 0, 3, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 1, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (15, 3, 6, 0, 3, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 2, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (16, 3, 7, 0, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '5ml', '1ml', '1', '1', '1', '10min');
INSERT INTO `experimentstep` VALUES (17, 3, 8, 0, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (18, 3, 8, 0, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `experimentstep` VALUES (19, 3, 9, 0, 6, 1, NULL, 1, 1, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `experiments_id` int(0) NULL DEFAULT NULL COMMENT '实验方案ID',
  `allparameters` json NULL COMMENT '步骤数据整合',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orders_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '实验方案详细步骤的整合，整个表触发器更改、不用写' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 3, '{\"step\": 1, \"task\": 9, \"dst_pos\": 5, \"src_pos\": \"00-0000-0000-0000\", \"receiver\": 1, \"startTime\": 0}');
INSERT INTO `orders` VALUES (2, 3, '{\"step\": 1, \"task\": 9, \"dst_pos\": 1, \"src_pos\": \"00-0000-0000-0001\", \"receiver\": 1, \"startTime\": 0}');
INSERT INTO `orders` VALUES (3, 3, '{\"step\": 1, \"task\": 10, \"dst_pos\": \"[1,0]\", \"src_pos\": \"00-0000-0000-0000\", \"receiver\": 1, \"startTime\": 0}');
INSERT INTO `orders` VALUES (4, 3, '{\"step\": 1, \"task\": 10, \"dst_pos\": \"[1,1]\", \"src_pos\": \"00-0000-0000-0001\", \"receiver\": 1, \"startTime\": 0}');
INSERT INTO `orders` VALUES (5, 3, '{\"step\": 1, \"task\": 11, \"dst_pos\": \"[5,0]\", \"src_pos\": \"1111111\", \"receiver\": 1, \"startTime\": 0}');
INSERT INTO `orders` VALUES (6, 3, '{\"step\": 1, \"task\": 11, \"dst_pos\": \"[5,1]\", \"src_pos\": \"1111110\", \"receiver\": 1, \"startTime\": 0}');
INSERT INTO `orders` VALUES (7, 3, '{\"step\": 2, \"task\": 1, \"speed\": null, \"dst_pos\": \"[5,0]\", \"scr_pos\": \"[1,0]\", \"receiver\": 2, \"startTime\": 0, \"volume_all\": 50}');
INSERT INTO `orders` VALUES (8, 3, '{\"step\": 2, \"task\": 1, \"speed\": 60, \"dst_pos\": \"[5,0]\", \"scr_pos\": \"[1,1]\", \"receiver\": 2, \"startTime\": 600, \"volume_all\": 80}');
INSERT INTO `orders` VALUES (9, 3, '{\"step\": 2, \"task\": 1, \"speed\": null, \"dst_pos\": \"[5,1]\", \"scr_pos\": \"[1,0]\", \"receiver\": 2, \"startTime\": 0, \"volume_all\": 50}');
INSERT INTO `orders` VALUES (10, 3, '{\"step\": 2, \"task\": 1, \"speed\": 60, \"dst_pos\": \"[5,1]\", \"scr_pos\": \"[1,0]\", \"receiver\": 2, \"startTime\": 600, \"volume_all\": 70}');
INSERT INTO `orders` VALUES (11, 3, '{\"step\": 3, \"task\": 1, \"moveTask\": \"[5,1,2,2,0]\", \"receiver\": 1, \"startTime\": 0}');
INSERT INTO `orders` VALUES (12, 3, '{\"step\": 4, \"task\": 1, \"duration\": 1200, \"receiver\": 4, \"startTime\": 0, \"temperature\": 100}');
INSERT INTO `orders` VALUES (13, 3, '{\"step\": 5, \"task\": 5, \"moveTask\": \"[5,1,5,0,2]\", \"receiver\": 1, \"startTime\": 0}');
INSERT INTO `orders` VALUES (14, 3, '{\"step\": 6, \"task\": 1, \"volume\": 5, \"dst_pos\": \"[5,0]\", \"interval\": 10, \"receiver\": 3, \"startTime\": 0, \"clean_demo_pos\": \"[11,1]\"}');
INSERT INTO `orders` VALUES (15, 3, '{\"step\": 6, \"task\": 1, \"volume\": 5, \"dst_pos\": \"[5,1]\", \"interval\": 10, \"receiver\": 3, \"startTime\": 0, \"clean_demo_pos\": \"[11,2]\"}');
INSERT INTO `orders` VALUES (16, 3, '{\"step\": 7, \"task\": 1, \"time\": \"10min\", \"volume\": \"5ml\", \"duration\": null, \"flowrate\": \"1\", \"involume\": \"1ml\", \"receiver\": 5, \"startTime\": 0, \"proportion\": \"1\", \"wavelength\": \"1\", \"HPLCSampleCount\": 2}');
INSERT INTO `orders` VALUES (17, 3, '{\"step\": 8, \"task\": 8, \"receiver\": 1, \"startTime\": 0, \"singleTask\": \"[1,2]\"}');
INSERT INTO `orders` VALUES (18, 3, '{\"step\": 8, \"task\": 2, \"receiver\": 3, \"startTime\": 0}');
INSERT INTO `orders` VALUES (19, 3, '{\"step\": 9, \"task\": 1, \"speed\": null, \"dst_pos\": \"[5,0]\", \"scr_pos\": \"[1,0]\", \"receiver\": 6, \"startTime\": 0, \"volume_all\": 40}');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户账号名称',
  `pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `realName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实名称',
  `schoolId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学号/工号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_uid_uindex`(`id`) USING BTREE,
  UNIQUE INDEX `users_userName_uindex`(`userName`) USING BTREE,
  UNIQUE INDEX `users_schoolId_uindex`(`schoolId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'root', '123456', NULL, NULL);

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
DROP TRIGGER IF EXISTS `injson`;
delimiter ;;
CREATE TRIGGER `injson` BEFORE INSERT ON `experimentstep` FOR EACH ROW BEGIN
INSERT INTO orders(id,experiments_id,allparameters) VALUES(new.id,new.experiments_id,
	CASE new.receiver 
	WHEN 1 THEN 
		CASE  
		WHEN new.task < 8 THEN 
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'moveTask',(SELECT CONCAT('[',new.start_pos,',',new.end_pos,',',new.tubes_move,',',new.tubes_platform,',',new.tubes_reaction,']'))) 
		WHEN new.task = 8 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'singleTask',(SELECT CONCAT('[',new.singleTask_start,',',new.singleTask_end,']')))
		WHEN new.task = 9 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'src_pos',(SELECT place FROM base WHERE id=new.base_id),'dst_pos',new.x)
		WHEN new.task = 10 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'src_pos',(SELECT place FROM chemicals WHERE id=new.chemicals_id),'dst_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE base_id=new.base_id AND experiments_id = new.experiments_id AND receiver = 1 AND task = 9),',',new.z,']')))
			WHEN new.task = 11 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'src_pos',(SELECT place FROM container WHERE id=new.container_id),'dst_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE base_id=new.base_id AND experiments_id = new.experiments_id AND receiver = 1 AND task = 9),',',new.z,']')))
		END
	WHEN 2 THEN
		CASE new.task
		WHEN 1 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'volume_all',new.usages,'scr_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE experiments_id=new.experiments_id AND receiver = 1 AND task = 9 AND base_id=(SELECT base_id FROM experimentstep WHERE experiments_id=new.experiments_id AND chemicals_id=new.chemicals_id AND receiver = 1 AND task = 10)), ',',(SELECT z FROM experimentstep WHERE experiments_id=new.experiments_id AND chemicals_id=new.chemicals_id AND receiver = 1 AND task = 10),']') ),'dst_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE experiments_id=new.experiments_id AND receiver = 1 AND task = 9 AND base_id=(SELECT base_id FROM experimentstep WHERE experiments_id=new.experiments_id AND container_id=new.container_id AND receiver = 1 AND task = 11)), ',',(SELECT z FROM experimentstep WHERE experiments_id=new.experiments_id AND container_id=new.container_id AND receiver = 1 AND task = 11),']') ),'speed',new.add_speed)
		END
	WHEN 3 THEN
		CASE new.task
		WHEN 1 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'dst_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE experiments_id=new.experiments_id AND receiver = 1 AND task = 9 AND base_id=(SELECT base_id FROM experimentstep WHERE experiments_id=new.experiments_id AND container_id=new.container_id AND receiver = 1 AND task = 11)), ',',(SELECT z FROM experimentstep WHERE experiments_id=new.experiments_id AND container_id=new.container_id AND receiver = 1 AND task = 11),']') ),'clean_demo_pos',(SELECT CONCAT('[',new.sample_pos_1,',',new.sample_pos_2,']')),'interval',new.intervals,'volume',new.sample_volume)
		WHEN 2 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver)
		END
	WHEN 4 THEN
		CASE new.task
		WHEN 1 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'duration',new.duration_min,'temperature',new.temperature)
		WHEN 2 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'duration',new.duration_min,'speed',new.react_speed)
		WHEN 3 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'duration',new.duration_min,'pressure',new.pressure)
		WHEN 4 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'duration',new.duration_min,'light',new.light)
		WHEN 5 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'duration',new.duration_min,'backup',new.backup_react)
		END
	WHEN 5 THEN
		CASE new.task
		WHEN 1 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'HPLCSampleCount',new.hplc_count,'volume',new.hplc_volume,'involume',new.hplc_involume,'wavelength',new.wavelength,'proportion',new.proportion,'flowrate',new.flowrate,'time',new.hplc_time)
		END
	WHEN 6 THEN
		CASE new.task
		WHEN 1 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'volume_all',new.usages,'scr_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE experiments_id=new.experiments_id AND receiver = 1 AND task = 9 AND base_id=(SELECT base_id FROM experimentstep WHERE experiments_id=new.experiments_id AND chemicals_id=new.chemicals_id AND receiver = 1 AND task = 10)), ',',(SELECT z FROM experimentstep WHERE experiments_id=new.experiments_id AND chemicals_id=new.chemicals_id AND receiver = 1 AND task = 10),']') ),'dst_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE experiments_id=new.experiments_id AND receiver = 1 AND task = 9 AND base_id=(SELECT base_id FROM experimentstep WHERE experiments_id=new.experiments_id AND container_id=new.container_id AND receiver = 1 AND task = 11)), ',',(SELECT z FROM experimentstep WHERE experiments_id=new.experiments_id AND container_id=new.container_id AND receiver = 1 AND task = 11),']') ),'speed',new.add_speed)
		END
	END);
END
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
DROP TRIGGER IF EXISTS `updateJson`;
delimiter ;;
CREATE TRIGGER `updateJson` BEFORE UPDATE ON `experimentstep` FOR EACH ROW BEGIN
DELETE FROM orders WHERE id = new.id;
INSERT INTO orders(id,experiments_id,allparameters) VALUES(new.id,new.experiments_id,
	CASE new.receiver 
	WHEN 1 THEN 
		CASE  
		WHEN new.task < 8 THEN 
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'moveTask',(SELECT CONCAT('[',new.start_pos,',',new.end_pos,',',new.tubes_move,',',new.tubes_platform,',',new.tubes_reaction,']'))) 
		WHEN new.task = 8 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'singleTask',(SELECT CONCAT('[',new.singleTask_start,',',new.singleTask_end,']')))
		WHEN new.task = 9 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'src_pos',(SELECT place FROM base WHERE id=new.base_id),'dst_pos',new.x)
		WHEN new.task = 10 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'src_pos',(SELECT place FROM chemicals WHERE id=new.chemicals_id),'dst_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE base_id=new.base_id AND experiments_id = new.experiments_id AND receiver = 1 AND task = 9),',',new.z,']')))
			WHEN new.task = 11 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'src_pos',(SELECT place FROM container WHERE id=new.container_id),'dst_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE base_id=new.base_id AND experiments_id = new.experiments_id AND receiver = 1 AND task = 9),',',new.z,']')))
		END
	WHEN 2 THEN
		CASE new.task
		WHEN 1 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'volume_all',new.usages,'scr_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE experiments_id=new.experiments_id AND receiver = 1 AND task = 9 AND base_id=(SELECT base_id FROM experimentstep WHERE experiments_id=new.experiments_id AND chemicals_id=new.chemicals_id AND receiver = 1 AND task = 10)), ',',(SELECT z FROM experimentstep WHERE experiments_id=new.experiments_id AND chemicals_id=new.chemicals_id AND receiver = 1 AND task = 10),']') ),'dst_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE experiments_id=new.experiments_id AND receiver = 1 AND task = 9 AND base_id=(SELECT base_id FROM experimentstep WHERE experiments_id=new.experiments_id AND container_id=new.container_id AND receiver = 1 AND task = 11)), ',',(SELECT z FROM experimentstep WHERE experiments_id=new.experiments_id AND container_id=new.container_id AND receiver = 1 AND task = 11),']') ),'speed',new.add_speed)
		END
	WHEN 3 THEN
		CASE new.task
		WHEN 1 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'dst_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE experiments_id=new.experiments_id AND receiver = 1 AND task = 9 AND base_id=(SELECT base_id FROM experimentstep WHERE experiments_id=new.experiments_id AND container_id=new.container_id AND receiver = 1 AND task = 11)), ',',(SELECT z FROM experimentstep WHERE experiments_id=new.experiments_id AND container_id=new.container_id AND receiver = 1 AND task = 11),']') ),'clean_demo_pos',(SELECT CONCAT('[',new.sample_pos_1,',',new.sample_pos_2,']')),'interval',new.intervals,'volume',new.sample_volume)
		WHEN 2 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver)
		END
	WHEN 4 THEN
		CASE new.task
		WHEN 1 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'duration',new.duration_min,'temperature',new.temperature)
		WHEN 2 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'duration',new.duration_min,'speed',new.react_speed)
		WHEN 3 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'duration',new.duration_min,'pressure',new.pressure)
		WHEN 4 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'duration',new.duration_min,'light',new.light)
		WHEN 5 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'duration',new.duration_min,'backup',new.backup_react)
		END
	WHEN 5 THEN
		CASE new.task
		WHEN 1 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'duration',new.duration_min,'HPLCSampleCount',new.hplc_count,'volume',new.hplc_volume,'involume',new.hplc_involume,'wavelength',new.wavelength,'proportion',new.proportion,'flowrate',new.flowrate,'time',new.hplc_time)
		END
	WHEN 6 THEN
		CASE new.task
		WHEN 1 THEN
			JSON_OBJECT('step',new.step,'startTime',new.startTime,'task',new.task,'receiver',new.receiver,'volume_all',new.usages,'scr_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE experiments_id=new.experiments_id AND receiver = 1 AND task = 9 AND base_id=(SELECT base_id FROM experimentstep WHERE experiments_id=new.experiments_id AND chemicals_id=new.chemicals_id AND receiver = 1 AND task = 10)), ',',(SELECT z FROM experimentstep WHERE experiments_id=new.experiments_id AND chemicals_id=new.chemicals_id AND receiver = 1 AND task = 10),']') ),'dst_pos',(SELECT CONCAT('[',(SELECT x FROM experimentstep WHERE experiments_id=new.experiments_id AND receiver = 1 AND task = 9 AND base_id=(SELECT base_id FROM experimentstep WHERE experiments_id=new.experiments_id AND container_id=new.container_id AND receiver = 1 AND task = 11)), ',',(SELECT z FROM experimentstep WHERE experiments_id=new.experiments_id AND container_id=new.container_id AND receiver = 1 AND task = 11),']') ),'speed',new.add_speed)
		END
	END);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table experimentstep
-- ----------------------------
DROP TRIGGER IF EXISTS `deljson`;
delimiter ;;
CREATE TRIGGER `deljson` AFTER DELETE ON `experimentstep` FOR EACH ROW DELETE FROM orders WHERE id = old.id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table experimentstep
-- ----------------------------
DROP TRIGGER IF EXISTS `deltime`;
delimiter ;;
CREATE TRIGGER `deltime` AFTER DELETE ON `experimentstep` FOR EACH ROW UPDATE experiments set updateTime=NOW() WHERE id=old.experiments_id
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
