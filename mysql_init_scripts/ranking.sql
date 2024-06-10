/*
 Navicat Premium Data Transfer

 Source Server         : 188.131.140.15
 Source Server Type    : MariaDB
 Source Server Version : 100244 (10.2.44-MariaDB)
 Source Host           : 188.131.140.15:3306
 Source Schema         : ranking

 Target Server Type    : MariaDB
 Target Server Version : 100244 (10.2.44-MariaDB)
 File Encoding         : 65001

 Date: 19/07/2023 16:29:53
*/

CREATE DATABASE IF NOT EXISTS ranking CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;  
  
USE ranking; 

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `add_time` int(11) NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (1, '活动1', 1686105642);

-- ----------------------------
-- Table structure for player
-- ----------------------------
DROP TABLE IF EXISTS `player`;
CREATE TABLE `player`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NULL DEFAULT 0 COMMENT '所属排名活动',
  `ref` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `declaration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宣言',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `score` int(11) NULL DEFAULT 0 COMMENT '分数',
  `add_time` int(11) NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player
-- ----------------------------
INSERT INTO `player` VALUES (1, 1, '0001', '喜羊羊', '音乐，是我心灵的声音，是我与世界沟通的桥梁。我渴望在这个舞台上，用我的音乐触动你们的心弦。请给我一个机会，让我用旋律诉说我的故事。', '/images/11.png', 2, 1686105642, 0);
INSERT INTO `player` VALUES (2, 1, '0002', '美羊羊', '跳舞对我来说，不仅仅是动作和节奏，更是一种态度。我热爱舞蹈，热爱在舞台上展现自我。请支持我，让我用舞蹈点燃你们的热情！', '/images/12.png', 3, 1686105642, 0);
INSERT INTO `player` VALUES (3, 1, '0003', '懒羊羊', '我的画布，是我的世界，是我内心深处的梦境。我希望你们能在我的画作中找到一丝共鸣，感受我画笔下的奇妙世界。', '/images/13.png', 3, 1686105642, 0);
INSERT INTO `player` VALUES (4, 1, '0004', '沸羊羊', '诗歌是我灵魂的食粮，朗诵是我情感的出口。在这里，我将用最真挚的情感，为你们诵读每一篇诗作，让文字的力量直达你们的心灵。', '/images/14.png', 0, 1686105642, 0);
INSERT INTO `player` VALUES (5, 1, '0005', '灰太狼', '魔术，是一种神秘的艺术，它能带给我们无尽的惊喜。请期待我的表演，让我用魔术为你们揭开神秘的面纱。', '/images/15.png', 3, 1686105642, 0);
INSERT INTO `player` VALUES (6, 1, '0006', '红太狼', '书法，是中华文化的瑰宝。我致力于传承这一艺术，用笔墨书写历史，用文字传递文化。请投我一票，让我为你们展示书法的魅力。', '/images/16.png', 0, 1686105642, 0);
INSERT INTO `player` VALUES (7, 1, '0007', '蕉太狼', '美食，是治愈心灵的良药。我热爱烹饪，热爱将各种食材变成美味佳肴。请投我一票，让我用美食为你们带来幸福的味道！', '/images/17.png', 7, 1686105642, 0);
INSERT INTO `player` VALUES (8, 1, '0008', '小灰灰', '手工，是我表达创意的方式。我喜欢用手中的材料创造出独一无二的作品。请支持我，让我用双手为你们带来惊喜和感动。！', '/images/18.png', 0, 1686105642, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `add_time` int(11) NULL DEFAULT 0 COMMENT '添加时间',
  `update_time` int(11) NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'test', '96e79218965eb72c92a549dd5a330112', 1686130840, 1686130840);
INSERT INTO `user` VALUES (2, 'test111', '96e79218965eb72c92a549dd5a330112', 1686212844, 1686212844);
INSERT INTO `user` VALUES (3, 'test2', 'e3ceb5881a0a1fdaad01296d7554868d', 1686558256, 1686558256);
INSERT INTO `user` VALUES (5, 'liubei', '96e79218965eb72c92a549dd5a330112', 1688747874, 1688747874);
INSERT INTO `user` VALUES (6, 'zhja', '96e79218965eb72c92a549dd5a330112', 1689171940, 1689171940);
INSERT INTO `user` VALUES (7, 'zhja111', '96e79218965eb72c92a549dd5a330112', 1689175012, 1689175012);

-- ----------------------------
-- Table structure for vote
-- ----------------------------
DROP TABLE IF EXISTS `vote`;
CREATE TABLE `vote`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT 0 COMMENT '投票用户ID',
  `player_id` int(11) NULL DEFAULT 0 COMMENT '选手ID',
  `add_time` int(11) NULL DEFAULT 0 COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vote
-- ----------------------------
INSERT INTO `vote` VALUES (1, 2, 3, 1686279370);
INSERT INTO `vote` VALUES (2, 1, 3, 1686305248);
INSERT INTO `vote` VALUES (3, 3, 2, 1686617334);
INSERT INTO `vote` VALUES (4, 3, 7, 1686617960);
INSERT INTO `vote` VALUES (5, 5, 3, 1688751615);
INSERT INTO `vote` VALUES (6, 1, 7, 1688827908);
INSERT INTO `vote` VALUES (7, 1, 2, 1688827991);
INSERT INTO `vote` VALUES (8, 6, 1, 1689172370);
INSERT INTO `vote` VALUES (9, 6, 2, 1689174889);
INSERT INTO `vote` VALUES (10, 7, 1, 1689175040);
INSERT INTO `vote` VALUES (11, 7, 7, 1689175057);

SET FOREIGN_KEY_CHECKS = 1;
