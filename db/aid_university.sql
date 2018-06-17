/*
Navicat MySQL Data Transfer

Source Server         : aliyun_zy_mysql
Source Server Version : 50639
Source Host           : 120.79.228.198:3306
Source Database       : aid_university

Target Server Type    : MYSQL
Target Server Version : 50639
File Encoding         : 65001

Date: 2018-05-10 14:41:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'tech.yiyehu.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720030746563682E7969796568752E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', null, 'tech.yiyehu.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720030746563682E7969796568752E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'zy1525250779540', '1525934492254', '15000');

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1525935600000', '1525933800000', '5', 'WAITING', 'CRON', '1523001667000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720030746563682E7969796568752E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000017400047465737474000672656E72656E74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1523003400000', '-1', '5', 'PAUSED', 'CRON', '1523001667000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720030746563682E7969796568752E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('1', 'testTask', 'test', 'renren', '0 0/30 * * * ?', '0', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` VALUES ('2', 'testTask', 'test2', null, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1252 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES ('1', '1', 'testTask', 'test', 'renren', '0', null, '1096', '2018-04-06 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('2', '1', 'testTask', 'test', 'renren', '0', null, '1088', '2018-04-06 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('3', '1', 'testTask', 'test', 'renren', '0', null, '1079', '2018-04-06 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('4', '1', 'testTask', 'test', 'renren', '0', null, '1088', '2018-04-06 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('5', '1', 'testTask', 'test', 'renren', '0', null, '1080', '2018-04-06 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('6', '1', 'testTask', 'test', 'renren', '0', null, '1078', '2018-04-06 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('7', '1', 'testTask', 'test', 'renren', '0', null, '1088', '2018-04-06 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('8', '1', 'testTask', 'test', 'renren', '0', null, '1089', '2018-04-06 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('9', '1', 'testTask', 'test', 'renren', '0', null, '1086', '2018-04-06 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('10', '1', 'testTask', 'test', 'renren', '0', null, '1085', '2018-04-06 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('11', '1', 'testTask', 'test', 'renren', '0', null, '1079', '2018-04-06 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('12', '1', 'testTask', 'test', 'renren', '0', null, '1087', '2018-04-06 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('13', '1', 'testTask', 'test', 'renren', '0', null, '1086', '2018-04-07 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('14', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-07 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('15', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-07 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('16', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-07 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('17', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-07 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('18', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-07 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('19', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-07 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('20', '1', 'testTask', 'test', 'renren', '0', null, '1053', '2018-04-07 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('21', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-07 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('22', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-07 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('23', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-07 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('24', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-07 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('25', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-07 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('26', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-07 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('27', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-07 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('28', '1', 'testTask', 'test', 'renren', '0', null, '1051', '2018-04-07 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('29', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-07 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('30', '1', 'testTask', 'test', 'renren', '0', null, '1089', '2018-04-07 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('31', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-07 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('32', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-07 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('33', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-07 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('34', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-07 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('35', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-07 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('36', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-07 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('37', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-07 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('38', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-07 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('39', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-07 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('40', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-08 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('41', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-08 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('42', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-08 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('43', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-08 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('44', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-08 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('45', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-08 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('46', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-08 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('47', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-08 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('48', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-08 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('49', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-08 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('50', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-08 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('51', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-08 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('52', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-08 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('53', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-08 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('54', '1', 'testTask', 'test', 'renren', '0', null, '1030', '2018-04-08 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('55', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-08 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('56', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-08 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('57', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-08 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('58', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-08 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('59', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-08 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('60', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-08 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('61', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-08 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('62', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-08 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('63', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-08 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('64', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-08 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('65', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-08 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('66', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-08 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('67', '1', 'testTask', 'test', 'renren', '0', null, '1094', '2018-04-08 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('68', '1', 'testTask', 'test', 'renren', '0', null, '1093', '2018-04-08 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('69', '1', 'testTask', 'test', 'renren', '0', null, '1082', '2018-04-08 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('70', '1', 'testTask', 'test', 'renren', '0', null, '1089', '2018-04-08 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('71', '1', 'testTask', 'test', 'renren', '0', null, '1082', '2018-04-08 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('72', '1', 'testTask', 'test', 'renren', '0', null, '1072', '2018-04-08 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('73', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-08 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('74', '1', 'testTask', 'test', 'renren', '0', null, '1087', '2018-04-08 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('75', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-08 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('76', '1', 'testTask', 'test', 'renren', '0', null, '1078', '2018-04-08 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('77', '1', 'testTask', 'test', 'renren', '0', null, '1016', '2018-04-08 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('78', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-08 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('79', '1', 'testTask', 'test', 'renren', '0', null, '1103', '2018-04-08 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('80', '1', 'testTask', 'test', 'renren', '0', null, '1085', '2018-04-08 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('81', '1', 'testTask', 'test', 'renren', '0', null, '1080', '2018-04-08 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('82', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-08 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('83', '1', 'testTask', 'test', 'renren', '0', null, '1101', '2018-04-08 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('84', '1', 'testTask', 'test', 'renren', '0', null, '1076', '2018-04-08 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('85', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-08 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('86', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-08 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('87', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-08 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('88', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-09 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('89', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-09 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('90', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-09 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('91', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-09 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('92', '1', 'testTask', 'test', 'renren', '0', null, '1026', '2018-04-09 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('93', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-09 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('94', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-09 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('95', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-09 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('96', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-09 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('97', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-09 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('98', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-09 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('99', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-09 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('100', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-04-09 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('101', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-09 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('102', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-09 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('103', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-09 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('104', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-09 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('105', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-09 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('106', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-09 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('107', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-09 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('108', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-09 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('109', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-09 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('110', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-09 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('111', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-09 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('112', '1', 'testTask', 'test', 'renren', '0', null, '1038', '2018-04-09 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('113', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-09 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('114', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-09 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('115', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-09 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('116', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-04-09 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('117', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-09 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('118', '1', 'testTask', 'test', 'renren', '0', null, '1091', '2018-04-09 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('119', '1', 'testTask', 'test', 'renren', '0', null, '1045', '2018-04-09 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('120', '1', 'testTask', 'test', 'renren', '0', null, '1081', '2018-04-09 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('121', '1', 'testTask', 'test', 'renren', '0', null, '1081', '2018-04-09 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('122', '1', 'testTask', 'test', 'renren', '0', null, '1098', '2018-04-09 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('123', '1', 'testTask', 'test', 'renren', '0', null, '1086', '2018-04-09 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('124', '1', 'testTask', 'test', 'renren', '0', null, '1086', '2018-04-09 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('125', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-09 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('126', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-09 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('127', '1', 'testTask', 'test', 'renren', '0', null, '1085', '2018-04-09 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('128', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-09 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('129', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-09 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('130', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-09 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('131', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-09 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('132', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-09 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('133', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-09 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('134', '1', 'testTask', 'test', 'renren', '0', null, '1819', '2018-04-09 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('135', '1', 'testTask', 'test', 'renren', '0', null, '1053', '2018-04-09 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('136', '1', 'testTask', 'test', 'renren', '0', null, '1159', '2018-04-10 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('137', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-04-10 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('138', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-10 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('139', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-10 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('140', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-10 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('141', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-10 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('142', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-10 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('143', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-10 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('144', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-10 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('145', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-10 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('146', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-10 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('147', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-10 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('148', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-10 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('149', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-10 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('150', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-10 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('151', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-10 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('152', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-10 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('153', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-10 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('154', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-10 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('155', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-10 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('156', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-10 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('157', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-10 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('158', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-10 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('159', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-10 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('160', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-10 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('161', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-10 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('162', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-10 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('163', '1', 'testTask', 'test', 'renren', '0', null, '1098', '2018-04-10 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('164', '1', 'testTask', 'test', 'renren', '0', null, '1088', '2018-04-10 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('165', '1', 'testTask', 'test', 'renren', '0', null, '1082', '2018-04-10 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('166', '1', 'testTask', 'test', 'renren', '0', null, '1084', '2018-04-10 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('167', '1', 'testTask', 'test', 'renren', '0', null, '1114', '2018-04-10 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('168', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-10 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('169', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-10 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('170', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-10 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('171', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-10 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('172', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-10 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('173', '1', 'testTask', 'test', 'renren', '0', null, '1092', '2018-04-10 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('174', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-10 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('175', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-10 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('176', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-10 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('177', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-10 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('178', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-10 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('179', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-10 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('180', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-10 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('181', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-10 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('182', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-10 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('183', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-10 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('184', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-11 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('185', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-11 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('186', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-11 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('187', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-11 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('188', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-11 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('189', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-11 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('190', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-11 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('191', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-11 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('192', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-11 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('193', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-11 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('194', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-11 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('195', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-11 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('196', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-11 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('197', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-11 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('198', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-11 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('199', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-11 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('200', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-11 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('201', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-11 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('202', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-11 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('203', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-11 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('204', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-11 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('205', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-11 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('206', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-11 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('207', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-11 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('208', '1', 'testTask', 'test', 'renren', '0', null, '1043', '2018-04-11 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('209', '1', 'testTask', 'test', 'renren', '0', null, '1037', '2018-04-11 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('210', '1', 'testTask', 'test', 'renren', '0', null, '1041', '2018-04-11 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('211', '1', 'testTask', 'test', 'renren', '0', null, '1089', '2018-04-11 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('212', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-11 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('213', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-11 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('214', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-04-11 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('215', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-11 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('216', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-11 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('217', '1', 'testTask', 'test', 'renren', '0', null, '1086', '2018-04-11 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('218', '1', 'testTask', 'test', 'renren', '0', null, '1089', '2018-04-11 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('219', '1', 'testTask', 'test', 'renren', '0', null, '1090', '2018-04-11 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('220', '1', 'testTask', 'test', 'renren', '0', null, '1096', '2018-04-11 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('221', '1', 'testTask', 'test', 'renren', '0', null, '1083', '2018-04-11 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('222', '1', 'testTask', 'test', 'renren', '0', null, '1069', '2018-04-11 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('223', '1', 'testTask', 'test', 'renren', '0', null, '1069', '2018-04-11 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('224', '1', 'testTask', 'test', 'renren', '0', null, '1099', '2018-04-11 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('225', '1', 'testTask', 'test', 'renren', '0', null, '1055', '2018-04-11 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('226', '1', 'testTask', 'test', 'renren', '0', null, '1091', '2018-04-11 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('227', '1', 'testTask', 'test', 'renren', '0', null, '1095', '2018-04-11 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('228', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-04-11 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('229', '1', 'testTask', 'test', 'renren', '0', null, '1097', '2018-04-11 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('230', '1', 'testTask', 'test', 'renren', '0', null, '1096', '2018-04-11 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('231', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-11 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('232', '1', 'testTask', 'test', 'renren', '0', null, '1029', '2018-04-12 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('233', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-12 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('234', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-12 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('235', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-12 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('236', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-12 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('237', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-12 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('238', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-12 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('239', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-12 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('240', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-12 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('241', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-12 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('242', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-12 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('243', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-12 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('244', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-12 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('245', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-12 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('246', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-12 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('247', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-12 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('248', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-04-12 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('249', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-12 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('250', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-12 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('251', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-12 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('252', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-12 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('253', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-12 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('254', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-12 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('255', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-12 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('256', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-12 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('257', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-12 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('258', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-12 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('259', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-12 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('260', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-12 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('261', '1', 'testTask', 'test', 'renren', '0', null, '1129', '2018-04-12 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('262', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-12 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('263', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-12 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('264', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-12 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('265', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-12 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('266', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-12 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('267', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-12 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('268', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-12 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('269', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-12 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('270', '1', 'testTask', 'test', 'renren', '0', null, '1193', '2018-04-12 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('271', '1', 'testTask', 'test', 'renren', '0', null, '1137', '2018-04-12 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('272', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-12 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('273', '1', 'testTask', 'test', 'renren', '0', null, '1101', '2018-04-12 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('274', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-12 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('275', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-12 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('276', '1', 'testTask', 'test', 'renren', '0', null, '1125', '2018-04-12 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('277', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-12 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('278', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-12 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('279', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-12 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('280', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-13 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('281', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-13 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('282', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('283', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-13 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('284', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-13 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('285', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-13 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('286', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-13 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('287', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-13 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('288', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-13 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('289', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('290', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('291', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('292', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('293', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('294', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-13 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('295', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-13 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('296', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-13 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('297', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-13 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('298', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-13 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('299', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-13 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('300', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-13 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('301', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-13 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('302', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-13 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('303', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('304', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('305', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-13 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('306', '1', 'testTask', 'test', 'renren', '0', null, '1096', '2018-04-13 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('307', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('308', '1', 'testTask', 'test', 'renren', '0', null, '1033', '2018-04-13 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('309', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-13 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('310', '1', 'testTask', 'test', 'renren', '0', null, '1145', '2018-04-13 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('311', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('312', '1', 'testTask', 'test', 'renren', '0', null, '1083', '2018-04-13 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('313', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-13 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('314', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('315', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-13 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('316', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-04-13 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('317', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-13 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('318', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('319', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-13 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('320', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-13 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('321', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-13 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('322', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-13 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('323', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('324', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-13 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('325', '1', 'testTask', 'test', 'renren', '0', null, '1098', '2018-04-13 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('326', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-13 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('327', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-13 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('328', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-14 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('329', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-14 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('330', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-14 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('331', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-14 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('332', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-14 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('333', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-14 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('334', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-14 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('335', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-14 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('336', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-14 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('337', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-14 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('338', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-14 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('339', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-14 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('340', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-14 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('341', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-14 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('342', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-14 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('343', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-14 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('344', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-14 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('345', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-14 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('346', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-14 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('347', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-14 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('348', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-14 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('349', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-14 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('350', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-14 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('351', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-14 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('352', '1', 'testTask', 'test', 'renren', '0', null, '1016', '2018-04-14 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('353', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-14 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('354', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-14 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('355', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-14 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('356', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-14 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('357', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-14 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('358', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-04-14 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('359', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-14 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('360', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-14 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('361', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-14 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('362', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-14 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('363', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-14 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('364', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-14 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('365', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-14 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('366', '1', 'testTask', 'test', 'renren', '0', null, '1094', '2018-04-14 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('367', '1', 'testTask', 'test', 'renren', '0', null, '1085', '2018-04-14 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('368', '1', 'testTask', 'test', 'renren', '0', null, '1085', '2018-04-14 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('369', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-14 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('370', '1', 'testTask', 'test', 'renren', '0', null, '1046', '2018-04-14 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('371', '1', 'testTask', 'test', 'renren', '0', null, '1086', '2018-04-14 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('372', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-14 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('373', '1', 'testTask', 'test', 'renren', '0', null, '1077', '2018-04-14 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('374', '1', 'testTask', 'test', 'renren', '0', null, '1029', '2018-04-14 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('375', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-14 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('376', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-15 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('377', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-15 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('378', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-15 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('379', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-15 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('380', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-15 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('381', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-15 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('382', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-15 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('383', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('384', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-15 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('385', '1', 'testTask', 'test', 'renren', '0', null, '1023', '2018-04-15 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('386', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-15 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('387', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-15 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('388', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-15 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('389', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('390', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-15 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('391', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-15 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('392', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('393', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('394', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('395', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-15 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('396', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('397', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('398', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('399', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-15 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('400', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-15 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('401', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-15 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('402', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-04-15 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('403', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-15 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('404', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('405', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('406', '1', 'testTask', 'test', 'renren', '0', null, '1097', '2018-04-15 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('407', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-15 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('408', '1', 'testTask', 'test', 'renren', '0', null, '1049', '2018-04-15 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('409', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('410', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-15 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('411', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-15 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('412', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('413', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-15 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('414', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-15 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('415', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('416', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-15 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('417', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-15 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('418', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-15 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('419', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('420', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('421', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('422', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-15 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('423', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-15 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('424', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-16 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('425', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-16 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('426', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-16 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('427', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-16 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('428', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-16 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('429', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('430', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-16 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('431', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-04-16 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('432', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('433', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('434', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('435', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-16 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('436', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-04-16 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('437', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('438', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('439', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2018-04-16 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('440', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('441', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-16 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('442', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-16 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('443', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('444', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-16 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('445', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-16 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('446', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-16 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('447', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-16 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('448', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('449', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('450', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('451', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('452', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('453', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('454', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('455', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-16 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('456', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-16 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('457', '1', 'testTask', 'test', 'renren', '0', null, '1082', '2018-04-16 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('458', '1', 'testTask', 'test', 'renren', '0', null, '1073', '2018-04-16 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('459', '1', 'testTask', 'test', 'renren', '0', null, '1083', '2018-04-16 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('460', '1', 'testTask', 'test', 'renren', '0', null, '1071', '2018-04-16 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('461', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-16 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('462', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-16 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('463', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-16 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('464', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-16 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('465', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-16 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('466', '1', 'testTask', 'test', 'renren', '0', null, '1089', '2018-04-16 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('467', '1', 'testTask', 'test', 'renren', '0', null, '1081', '2018-04-16 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('468', '1', 'testTask', 'test', 'renren', '0', null, '1079', '2018-04-16 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('469', '1', 'testTask', 'test', 'renren', '0', null, '1083', '2018-04-16 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('470', '1', 'testTask', 'test', 'renren', '0', null, '1106', '2018-04-16 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('471', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-17 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('472', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-17 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('473', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-04-17 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('474', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-17 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('475', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-17 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('476', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-17 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('477', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-17 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('478', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-17 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('479', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-17 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('480', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-17 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('481', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-17 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('482', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-17 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('483', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-17 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('484', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-17 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('485', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-17 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('486', '1', 'testTask', 'test', 'renren', '0', null, '1016', '2018-04-17 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('487', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-17 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('488', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-17 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('489', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-17 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('490', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-17 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('491', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-17 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('492', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-17 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('493', '1', 'testTask', 'test', 'renren', '0', null, '1088', '2018-04-17 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('494', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-17 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('495', '1', 'testTask', 'test', 'renren', '0', null, '1077', '2018-04-17 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('496', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-17 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('497', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-17 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('498', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-17 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('499', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-17 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('500', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-17 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('501', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-17 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('502', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-17 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('503', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-17 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('504', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-17 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('505', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-17 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('506', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-17 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('507', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-17 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('508', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-04-17 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('509', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-17 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('510', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-17 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('511', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2018-04-17 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('512', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-04-17 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('513', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-17 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('514', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-17 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('515', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-17 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('516', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-17 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('517', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-17 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('518', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-17 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('519', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-18 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('520', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-18 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('521', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-18 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('522', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-18 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('523', '1', 'testTask', 'test', 'renren', '0', null, '1029', '2018-04-18 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('524', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-18 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('525', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-18 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('526', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-18 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('527', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-18 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('528', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-18 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('529', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-18 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('530', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-18 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('531', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-18 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('532', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-18 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('533', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-18 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('534', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-18 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('535', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-18 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('536', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-18 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('537', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-18 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('538', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-18 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('539', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-18 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('540', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-18 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('541', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-18 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('542', '1', 'testTask', 'test', 'renren', '0', null, '1089', '2018-04-18 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('543', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-18 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('544', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-18 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('545', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-18 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('546', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-18 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('547', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-18 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('548', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-18 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('549', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-18 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('550', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-18 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('551', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-18 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('552', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-18 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('553', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-18 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('554', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-18 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('555', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-18 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('556', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-18 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('557', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-18 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('558', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-18 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('559', '1', 'testTask', 'test', 'renren', '0', null, '1092', '2018-04-18 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('560', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-18 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('561', '1', 'testTask', 'test', 'renren', '0', null, '1129', '2018-04-18 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('562', '1', 'testTask', 'test', 'renren', '0', null, '1114', '2018-04-18 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('563', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-18 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('564', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-18 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('565', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-18 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('566', '1', 'testTask', 'test', 'renren', '0', null, '1094', '2018-04-18 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('567', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-19 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('568', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-19 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('569', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-19 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('570', '1', 'testTask', 'test', 'renren', '0', null, '1044', '2018-04-19 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('571', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-19 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('572', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-19 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('573', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-19 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('574', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('575', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-19 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('576', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-19 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('577', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('578', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('579', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-19 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('580', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('581', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-19 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('582', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-19 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('583', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('584', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-19 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('585', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-19 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('586', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-19 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('587', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-19 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('588', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('589', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-19 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('590', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-19 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('591', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-19 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('592', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-19 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('593', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-19 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('594', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-19 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('595', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('596', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('597', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-19 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('598', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-19 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('599', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-19 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('600', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('601', '1', 'testTask', 'test', 'renren', '0', null, '1117', '2018-04-19 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('602', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('603', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('604', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-19 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('605', '1', 'testTask', 'test', 'renren', '0', null, '1100', '2018-04-19 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('606', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-19 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('607', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('608', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('609', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('610', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-19 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('611', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-19 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('612', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('613', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-19 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('614', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-19 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('615', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('616', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('617', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-20 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('618', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('619', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-20 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('620', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('621', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-20 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('622', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('623', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('624', '1', 'testTask', 'test', 'renren', '0', null, '1046', '2018-04-20 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('625', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-20 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('626', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-20 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('627', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('628', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-20 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('629', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('630', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-20 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('631', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('632', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-20 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('633', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-20 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('634', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-20 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('635', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-20 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('636', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-20 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('637', '1', 'testTask', 'test', 'renren', '0', null, '1003', '2018-04-20 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('638', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-20 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('639', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-20 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('640', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-20 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('641', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-20 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('642', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-20 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('643', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('644', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-20 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('645', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-20 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('646', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-20 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('647', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-20 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('648', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-20 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('649', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-20 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('650', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('651', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-20 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('652', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('653', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-20 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('654', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-20 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('655', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-20 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('656', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('657', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-20 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('658', '1', 'testTask', 'test', 'renren', '0', null, '1113', '2018-04-20 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('659', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-20 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('660', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-20 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('661', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-20 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('662', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-20 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('663', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-21 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('664', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-21 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('665', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-21 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('666', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-21 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('667', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-21 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('668', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-21 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('669', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-21 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('670', '1', 'testTask', 'test', 'renren', '0', null, '1043', '2018-04-21 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('671', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-21 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('672', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-21 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('673', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-21 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('674', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-21 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('675', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-21 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('676', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-21 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('677', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-21 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('678', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-21 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('679', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-21 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('680', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-21 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('681', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-21 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('682', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-21 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('683', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-21 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('684', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-21 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('685', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-21 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('686', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-21 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('687', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-21 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('688', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-21 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('689', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-21 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('690', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-21 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('691', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-21 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('692', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-21 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('693', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-21 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('694', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-21 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('695', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-21 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('696', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-21 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('697', '1', 'testTask', 'test', 'renren', '0', null, '1016', '2018-04-21 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('698', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-21 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('699', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-21 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('700', '1', 'testTask', 'test', 'renren', '0', null, '1104', '2018-04-21 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('701', '1', 'testTask', 'test', 'renren', '0', null, '1088', '2018-04-21 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('702', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-21 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('703', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-21 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('704', '1', 'testTask', 'test', 'renren', '0', null, '1096', '2018-04-21 20:30:01');
INSERT INTO `schedule_job_log` VALUES ('705', '1', 'testTask', 'test', 'renren', '0', null, '1092', '2018-04-21 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('706', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-21 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('707', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-21 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('708', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-21 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('709', '1', 'testTask', 'test', 'renren', '0', null, '1134', '2018-04-21 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('710', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-21 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('711', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-22 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('712', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-22 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('713', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-22 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('714', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2018-04-22 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('715', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-22 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('716', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-22 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('717', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-22 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('718', '1', 'testTask', 'test', 'renren', '0', null, '1016', '2018-04-22 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('719', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-22 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('720', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-22 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('721', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-22 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('722', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-22 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('723', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-22 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('724', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-22 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('725', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-22 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('726', '1', 'testTask', 'test', 'renren', '0', null, '1024', '2018-04-22 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('727', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-22 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('728', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-22 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('729', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-22 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('730', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-22 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('731', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-22 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('732', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-22 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('733', '1', 'testTask', 'test', 'renren', '0', null, '1108', '2018-04-22 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('734', '1', 'testTask', 'test', 'renren', '0', null, '1097', '2018-04-22 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('735', '1', 'testTask', 'test', 'renren', '0', null, '1102', '2018-04-22 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('736', '1', 'testTask', 'test', 'renren', '0', null, '1092', '2018-04-22 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('737', '1', 'testTask', 'test', 'renren', '0', null, '1104', '2018-04-22 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('738', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-22 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('739', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-22 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('740', '1', 'testTask', 'test', 'renren', '0', null, '1078', '2018-04-22 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('741', '1', 'testTask', 'test', 'renren', '0', null, '1069', '2018-04-22 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('742', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-22 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('743', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-22 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('744', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-22 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('745', '1', 'testTask', 'test', 'renren', '0', null, '1034', '2018-04-22 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('746', '1', 'testTask', 'test', 'renren', '0', null, '1100', '2018-04-22 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('747', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-22 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('748', '1', 'testTask', 'test', 'renren', '0', null, '1093', '2018-04-22 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('749', '1', 'testTask', 'test', 'renren', '0', null, '1086', '2018-04-22 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('750', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-22 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('751', '1', 'testTask', 'test', 'renren', '0', null, '1048', '2018-04-22 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('752', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-22 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('753', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-22 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('754', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-22 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('755', '1', 'testTask', 'test', 'renren', '0', null, '1016', '2018-04-22 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('756', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-22 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('757', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-22 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('758', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-04-22 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('759', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-23 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('760', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-23 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('761', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-23 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('762', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-23 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('763', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-23 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('764', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-23 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('765', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-23 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('766', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-23 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('767', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-23 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('768', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-23 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('769', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-23 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('770', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-23 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('771', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-23 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('772', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-23 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('773', '1', 'testTask', 'test', 'renren', '0', null, '1066', '2018-04-23 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('774', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-23 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('775', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-23 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('776', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-23 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('777', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-24 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('778', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-24 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('779', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-04-24 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('780', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-24 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('781', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-24 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('782', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-24 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('783', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-24 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('784', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-24 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('785', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-24 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('786', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-24 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('787', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-24 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('788', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-24 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('789', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-24 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('790', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-04-24 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('791', '1', 'testTask', 'test', 'renren', '0', null, '1105', '2018-04-27 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('792', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-27 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('793', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-27 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('794', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-27 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('795', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-27 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('796', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-27 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('797', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-27 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('798', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-27 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('799', '1', 'testTask', 'test', 'renren', '0', null, '1019', '2018-04-27 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('800', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-27 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('801', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-27 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('802', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-27 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('803', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-27 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('804', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-27 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('805', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-27 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('806', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-27 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('807', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-27 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('808', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-27 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('809', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-27 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('810', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-27 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('811', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-27 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('812', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-27 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('813', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-27 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('814', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-27 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('815', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-27 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('816', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-27 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('817', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-27 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('818', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-27 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('819', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-04-28 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('820', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-28 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('821', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-28 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('822', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-28 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('823', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-28 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('824', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-28 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('825', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-28 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('826', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-28 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('827', '1', 'testTask', 'test', 'renren', '0', null, '1044', '2018-04-28 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('828', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-28 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('829', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-04-28 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('830', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-04-28 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('831', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-28 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('832', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-28 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('833', '1', 'testTask', 'test', 'renren', '0', null, '1117', '2018-04-28 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('834', '1', 'testTask', 'test', 'renren', '0', null, '1110', '2018-04-28 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('835', '1', 'testTask', 'test', 'renren', '0', null, '1082', '2018-04-28 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('836', '1', 'testTask', 'test', 'renren', '0', null, '1067', '2018-04-28 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('837', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-04-28 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('838', '1', 'testTask', 'test', 'renren', '0', null, '1072', '2018-04-28 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('839', '1', 'testTask', 'test', 'renren', '0', null, '1080', '2018-04-28 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('840', '1', 'testTask', 'test', 'renren', '0', null, '1116', '2018-04-28 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('841', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-28 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('842', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-28 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('843', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-28 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('844', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-28 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('845', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-28 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('846', '1', 'testTask', 'test', 'renren', '0', null, '1094', '2018-04-28 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('847', '1', 'testTask', 'test', 'renren', '0', null, '1138', '2018-04-28 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('848', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-28 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('849', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-28 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('850', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-28 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('851', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-28 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('852', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-29 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('853', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-29 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('854', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-04-29 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('855', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-04-29 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('856', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-29 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('857', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-29 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('858', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-29 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('859', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-29 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('860', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-04-29 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('861', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-29 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('862', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-04-29 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('863', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-04-29 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('864', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-29 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('865', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-04-29 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('866', '1', 'testTask', 'test', 'renren', '0', null, '1094', '2018-05-02 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('867', '1', 'testTask', 'test', 'renren', '0', null, '1084', '2018-05-02 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('868', '1', 'testTask', 'test', 'renren', '0', null, '1081', '2018-05-02 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('869', '1', 'testTask', 'test', 'renren', '0', null, '1095', '2018-05-02 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('870', '1', 'testTask', 'test', 'renren', '0', null, '1138', '2018-05-02 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('871', '1', 'testTask', 'test', 'renren', '0', null, '1070', '2018-05-02 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('872', '1', 'testTask', 'test', 'renren', '0', null, '1212', '2018-05-02 17:00:01');
INSERT INTO `schedule_job_log` VALUES ('873', '1', 'testTask', 'test', 'renren', '0', null, '1120', '2018-05-02 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('874', '1', 'testTask', 'test', 'renren', '0', null, '1147', '2018-05-02 18:00:01');
INSERT INTO `schedule_job_log` VALUES ('875', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-02 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('876', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-02 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('877', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-02 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('878', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-02 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('879', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-05-02 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('880', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-02 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('881', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-02 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('882', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-02 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('883', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-02 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('884', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-02 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('885', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-02 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('886', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-03 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('887', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-05-03 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('888', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('889', '1', 'testTask', 'test', 'renren', '0', null, '1059', '2018-05-03 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('890', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('891', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('892', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('893', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-03 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('894', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-03 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('895', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-05-03 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('896', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-03 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('897', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('898', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-05-03 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('899', '1', 'testTask', 'test', 'renren', '0', null, '1197', '2018-05-03 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('900', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-03 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('901', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('902', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-03 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('903', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('904', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-05-03 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('905', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('906', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('907', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-03 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('908', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-05-03 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('909', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-03 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('910', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-05-03 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('911', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-03 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('912', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-05-03 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('913', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-03 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('914', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-05-03 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('915', '1', 'testTask', 'test', 'renren', '0', null, '1097', '2018-05-03 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('916', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-03 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('917', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('918', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('919', '1', 'testTask', 'test', 'renren', '0', null, '1087', '2018-05-03 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('920', '1', 'testTask', 'test', 'renren', '0', null, '1075', '2018-05-03 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('921', '1', 'testTask', 'test', 'renren', '0', null, '1083', '2018-05-03 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('922', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('923', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-03 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('924', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-03 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('925', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('926', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('927', '1', 'testTask', 'test', 'renren', '0', null, '1104', '2018-05-03 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('928', '1', 'testTask', 'test', 'renren', '0', null, '1077', '2018-05-03 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('929', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('930', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-03 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('931', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('932', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-03 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('933', '1', 'testTask', 'test', 'renren', '0', null, '1045', '2018-05-03 23:30:01');
INSERT INTO `schedule_job_log` VALUES ('934', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-04 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('935', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-04 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('936', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-04 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('937', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-04 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('938', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-04 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('939', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-04 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('940', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-05-04 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('941', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-04 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('942', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-04 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('943', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-04 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('944', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-04 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('945', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-04 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('946', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-04 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('947', '1', 'testTask', 'test', 'renren', '0', null, '1022', '2018-05-04 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('948', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-04 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('949', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-04 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('950', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-04 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('951', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-04 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('952', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2018-05-04 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('953', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-04 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('954', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-04 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('955', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-04 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('956', '1', 'testTask', 'test', 'renren', '0', null, '1105', '2018-05-04 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('957', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-04 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('958', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-04 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('959', '1', 'testTask', 'test', 'renren', '0', null, '1091', '2018-05-04 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('960', '1', 'testTask', 'test', 'renren', '0', null, '1087', '2018-05-04 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('961', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-05-04 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('962', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-04 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('963', '1', 'testTask', 'test', 'renren', '0', null, '1086', '2018-05-04 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('964', '1', 'testTask', 'test', 'renren', '0', null, '1039', '2018-05-04 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('965', '1', 'testTask', 'test', 'renren', '0', null, '1085', '2018-05-04 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('966', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-05-04 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('967', '1', 'testTask', 'test', 'renren', '0', null, '1094', '2018-05-04 16:30:01');
INSERT INTO `schedule_job_log` VALUES ('968', '1', 'testTask', 'test', 'renren', '0', null, '1086', '2018-05-04 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('969', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-04 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('970', '1', 'testTask', 'test', 'renren', '0', null, '1084', '2018-05-04 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('971', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-04 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('972', '1', 'testTask', 'test', 'renren', '0', null, '1085', '2018-05-04 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('973', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-04 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('974', '1', 'testTask', 'test', 'renren', '0', null, '1101', '2018-05-04 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('975', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-05-04 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('976', '1', 'testTask', 'test', 'renren', '0', null, '1093', '2018-05-04 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('977', '1', 'testTask', 'test', 'renren', '0', null, '1105', '2018-05-04 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('978', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-04 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('979', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-04 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('980', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-04 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('981', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-05-04 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('982', '1', 'testTask', 'test', 'renren', '0', null, '1104', '2018-05-05 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('983', '1', 'testTask', 'test', 'renren', '0', null, '1059', '2018-05-05 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('984', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-05 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('985', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-05 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('986', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-05-05 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('987', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('988', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('989', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-05-05 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('990', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('991', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('992', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('993', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-05-05 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('994', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-05-05 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('995', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-05 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('996', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-05 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('997', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-05-05 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('998', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('999', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-05-05 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('1000', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('1001', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-05-05 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('1002', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-05 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1003', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1004', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1005', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1006', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1007', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1008', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1009', '1', 'testTask', 'test', 'renren', '0', null, '1148', '2018-05-05 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1010', '1', 'testTask', 'test', 'renren', '0', null, '1189', '2018-05-05 14:00:01');
INSERT INTO `schedule_job_log` VALUES ('1011', '1', 'testTask', 'test', 'renren', '0', null, '1345', '2018-05-05 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1012', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-05 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1013', '1', 'testTask', 'test', 'renren', '0', null, '1099', '2018-05-05 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1014', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-05 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1015', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-05 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1016', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-05 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1017', '1', 'testTask', 'test', 'renren', '0', null, '1089', '2018-05-05 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1018', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-05 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1019', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-05 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1020', '1', 'testTask', 'test', 'renren', '0', null, '1098', '2018-05-05 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1021', '1', 'testTask', 'test', 'renren', '0', null, '1092', '2018-05-05 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1022', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-05 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1023', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-05 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1024', '1', 'testTask', 'test', 'renren', '0', null, '1090', '2018-05-05 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1025', '1', 'testTask', 'test', 'renren', '0', null, '1369', '2018-05-05 21:30:01');
INSERT INTO `schedule_job_log` VALUES ('1026', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-05 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1027', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-05 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1028', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-05 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1029', '1', 'testTask', 'test', 'renren', '0', null, '1014', '2018-05-05 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1030', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-06 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('1031', '1', 'testTask', 'test', 'renren', '0', null, '1015', '2018-05-06 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('1032', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-05-06 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('1033', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('1034', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-06 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('1035', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('1036', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('1037', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-06 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('1038', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('1039', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('1040', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-06 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('1041', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('1042', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-06 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('1043', '1', 'testTask', 'test', 'renren', '0', null, '1107', '2018-05-06 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('1044', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-06 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('1045', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-06 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('1046', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-05-06 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('1047', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('1048', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('1049', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-06 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('1050', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-05-06 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1051', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-06 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1052', '1', 'testTask', 'test', 'renren', '0', null, '1100', '2018-05-06 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1053', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1054', '1', 'testTask', 'test', 'renren', '0', null, '1102', '2018-05-06 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1055', '1', 'testTask', 'test', 'renren', '0', null, '1268', '2018-05-06 12:30:01');
INSERT INTO `schedule_job_log` VALUES ('1056', '1', 'testTask', 'test', 'renren', '0', null, '1088', '2018-05-06 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1057', '1', 'testTask', 'test', 'renren', '0', null, '1079', '2018-05-06 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1058', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-06 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1059', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-06 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1060', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1061', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1062', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-06 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1063', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1064', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-06 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1065', '1', 'testTask', 'test', 'renren', '0', null, '1093', '2018-05-06 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1066', '1', 'testTask', 'test', 'renren', '0', null, '1084', '2018-05-06 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1067', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-06 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1068', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1069', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-05-06 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1070', '1', 'testTask', 'test', 'renren', '0', null, '1102', '2018-05-06 20:00:01');
INSERT INTO `schedule_job_log` VALUES ('1071', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1072', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1073', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-06 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1074', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-06 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1075', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1076', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-06 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1077', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-05-06 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1078', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-07 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('1079', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-07 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('1080', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('1081', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-07 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('1082', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-07 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('1083', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-07 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('1084', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('1085', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-07 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('1086', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('1087', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('1088', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('1089', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('1090', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-07 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('1091', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-07 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('1092', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-07 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('1093', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-07 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('1094', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-07 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('1095', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('1096', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('1097', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-07 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('1098', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1099', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-07 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1100', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-07 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1101', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-05-07 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1102', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-07 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1103', '1', 'testTask', 'test', 'renren', '0', null, '1013', '2018-05-07 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1104', '1', 'testTask', 'test', 'renren', '0', null, '1018', '2018-05-07 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1105', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-07 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1106', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1107', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1108', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-07 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1109', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1110', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1111', '1', 'testTask', 'test', 'renren', '0', null, '1105', '2018-05-07 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1112', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-07 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1113', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-07 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1114', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-07 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1115', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-07 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1116', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-07 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1117', '1', 'testTask', 'test', 'renren', '0', null, '1093', '2018-05-07 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1118', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1119', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-05-07 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1120', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-07 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1121', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-07 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1122', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-05-07 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1123', '1', 'testTask', 'test', 'renren', '0', null, '1122', '2018-05-07 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1124', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-07 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1125', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-05-07 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1126', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-08 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('1127', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('1128', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('1129', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-08 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('1130', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-08 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('1131', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-08 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('1132', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('1133', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('1134', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-08 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('1135', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-08 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('1136', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-08 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('1137', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-08 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('1138', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-08 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('1139', '1', 'testTask', 'test', 'renren', '0', null, '1012', '2018-05-08 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('1140', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('1141', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-08 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('1142', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-08 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('1143', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-08 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('1144', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('1145', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-08 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('1146', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-05-08 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1147', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-08 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1148', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-08 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1149', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1150', '1', 'testTask', 'test', 'renren', '0', null, '1057', '2018-05-08 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1151', '1', 'testTask', 'test', 'renren', '0', null, '1096', '2018-05-08 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1152', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1153', '1', 'testTask', 'test', 'renren', '0', null, '1105', '2018-05-08 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1154', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-08 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1155', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 14:30:00');
INSERT INTO `schedule_job_log` VALUES ('1156', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1157', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1158', '1', 'testTask', 'test', 'renren', '0', null, '1092', '2018-05-08 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1159', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1160', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-08 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1161', '1', 'testTask', 'test', 'renren', '0', null, '1098', '2018-05-08 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1162', '1', 'testTask', 'test', 'renren', '0', null, '1107', '2018-05-08 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1163', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1164', '1', 'testTask', 'test', 'renren', '0', null, '1103', '2018-05-08 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1165', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 19:30:06');
INSERT INTO `schedule_job_log` VALUES ('1166', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1167', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1168', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-05-08 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1169', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-08 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1170', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-08 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1171', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-08 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1172', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-08 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1173', '1', 'testTask', 'test', 'renren', '0', null, '1107', '2018-05-08 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1174', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-09 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('1175', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-09 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('1176', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-09 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('1177', '1', 'testTask', 'test', 'renren', '0', null, '1050', '2018-05-09 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('1178', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-05-09 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('1179', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-05-09 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('1180', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-09 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('1181', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-09 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('1182', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-05-09 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('1183', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-09 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('1184', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-09 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('1185', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-09 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('1186', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-09 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('1187', '1', 'testTask', 'test', 'renren', '0', null, '1110', '2018-05-09 06:30:00');
INSERT INTO `schedule_job_log` VALUES ('1188', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-09 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('1189', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-09 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('1190', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-09 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('1191', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-09 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('1192', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-09 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('1193', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-09 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('1194', '1', 'testTask', 'test', 'renren', '0', null, '1086', '2018-05-09 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1195', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-09 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1196', '1', 'testTask', 'test', 'renren', '0', null, '1104', '2018-05-09 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1197', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-09 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1198', '1', 'testTask', 'test', 'renren', '0', null, '1075', '2018-05-09 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1199', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-09 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1200', '1', 'testTask', 'test', 'renren', '0', null, '1074', '2018-05-09 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1201', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-09 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1202', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-09 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1203', '1', 'testTask', 'test', 'renren', '0', null, '1099', '2018-05-09 14:30:01');
INSERT INTO `schedule_job_log` VALUES ('1204', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-09 15:00:00');
INSERT INTO `schedule_job_log` VALUES ('1205', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-09 15:30:00');
INSERT INTO `schedule_job_log` VALUES ('1206', '1', 'testTask', 'test', 'renren', '0', null, '1102', '2018-05-09 16:00:00');
INSERT INTO `schedule_job_log` VALUES ('1207', '1', 'testTask', 'test', 'renren', '0', null, '1005', '2018-05-09 16:30:00');
INSERT INTO `schedule_job_log` VALUES ('1208', '1', 'testTask', 'test', 'renren', '0', null, '1091', '2018-05-09 17:00:00');
INSERT INTO `schedule_job_log` VALUES ('1209', '1', 'testTask', 'test', 'renren', '0', null, '1040', '2018-05-09 17:30:00');
INSERT INTO `schedule_job_log` VALUES ('1210', '1', 'testTask', 'test', 'renren', '0', null, '1071', '2018-05-09 18:00:00');
INSERT INTO `schedule_job_log` VALUES ('1211', '1', 'testTask', 'test', 'renren', '0', null, '1043', '2018-05-09 18:30:00');
INSERT INTO `schedule_job_log` VALUES ('1212', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-09 19:00:00');
INSERT INTO `schedule_job_log` VALUES ('1213', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-09 19:30:00');
INSERT INTO `schedule_job_log` VALUES ('1214', '1', 'testTask', 'test', 'renren', '0', null, '1095', '2018-05-09 20:00:00');
INSERT INTO `schedule_job_log` VALUES ('1215', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-09 20:30:00');
INSERT INTO `schedule_job_log` VALUES ('1216', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-05-09 21:00:00');
INSERT INTO `schedule_job_log` VALUES ('1217', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-09 21:30:00');
INSERT INTO `schedule_job_log` VALUES ('1218', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-09 22:00:00');
INSERT INTO `schedule_job_log` VALUES ('1219', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-09 22:30:00');
INSERT INTO `schedule_job_log` VALUES ('1220', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-09 23:00:00');
INSERT INTO `schedule_job_log` VALUES ('1221', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-09 23:30:00');
INSERT INTO `schedule_job_log` VALUES ('1222', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-10 00:00:00');
INSERT INTO `schedule_job_log` VALUES ('1223', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-10 00:30:00');
INSERT INTO `schedule_job_log` VALUES ('1224', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-10 01:00:00');
INSERT INTO `schedule_job_log` VALUES ('1225', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-10 01:30:00');
INSERT INTO `schedule_job_log` VALUES ('1226', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-10 02:00:00');
INSERT INTO `schedule_job_log` VALUES ('1227', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-10 02:30:00');
INSERT INTO `schedule_job_log` VALUES ('1228', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-10 03:00:00');
INSERT INTO `schedule_job_log` VALUES ('1229', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-10 03:30:00');
INSERT INTO `schedule_job_log` VALUES ('1230', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-10 04:00:00');
INSERT INTO `schedule_job_log` VALUES ('1231', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-10 04:30:00');
INSERT INTO `schedule_job_log` VALUES ('1232', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-10 05:00:00');
INSERT INTO `schedule_job_log` VALUES ('1233', '1', 'testTask', 'test', 'renren', '0', null, '1009', '2018-05-10 05:30:00');
INSERT INTO `schedule_job_log` VALUES ('1234', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-10 06:00:00');
INSERT INTO `schedule_job_log` VALUES ('1235', '1', 'testTask', 'test', 'renren', '0', null, '1302', '2018-05-10 06:30:01');
INSERT INTO `schedule_job_log` VALUES ('1236', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-10 07:00:00');
INSERT INTO `schedule_job_log` VALUES ('1237', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-10 07:30:00');
INSERT INTO `schedule_job_log` VALUES ('1238', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-10 08:00:00');
INSERT INTO `schedule_job_log` VALUES ('1239', '1', 'testTask', 'test', 'renren', '0', null, '1011', '2018-05-10 08:30:00');
INSERT INTO `schedule_job_log` VALUES ('1240', '1', 'testTask', 'test', 'renren', '0', null, '1008', '2018-05-10 09:00:00');
INSERT INTO `schedule_job_log` VALUES ('1241', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-10 09:30:00');
INSERT INTO `schedule_job_log` VALUES ('1242', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-05-10 10:00:00');
INSERT INTO `schedule_job_log` VALUES ('1243', '1', 'testTask', 'test', 'renren', '0', null, '1017', '2018-05-10 10:30:00');
INSERT INTO `schedule_job_log` VALUES ('1244', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-10 11:00:00');
INSERT INTO `schedule_job_log` VALUES ('1245', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-10 11:30:00');
INSERT INTO `schedule_job_log` VALUES ('1246', '1', 'testTask', 'test', 'renren', '0', null, '1010', '2018-05-10 12:00:00');
INSERT INTO `schedule_job_log` VALUES ('1247', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-10 12:30:00');
INSERT INTO `schedule_job_log` VALUES ('1248', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-10 13:00:00');
INSERT INTO `schedule_job_log` VALUES ('1249', '1', 'testTask', 'test', 'renren', '0', null, '1004', '2018-05-10 13:30:00');
INSERT INTO `schedule_job_log` VALUES ('1250', '1', 'testTask', 'test', 'renren', '0', null, '1006', '2018-05-10 14:00:00');
INSERT INTO `schedule_job_log` VALUES ('1251', '1', 'testTask', 'test', 'renren', '0', null, '1007', '2018-05-10 14:30:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('0219461e-fe09-4d71-9555-cab8f84afbd7', 'ff5db', '2018-04-22 19:18:39');
INSERT INTO `sys_captcha` VALUES ('02684690-23ad-4498-84a5-884871f68187', 'x45a7', '2018-04-18 21:09:39');
INSERT INTO `sys_captcha` VALUES ('049e7c9b-72ee-435d-87af-0f8d3de31842', 'eda8d', '2018-04-06 21:01:00');
INSERT INTO `sys_captcha` VALUES ('0558edc5-46c6-462a-8107-db88bffff6a5', 'wcn7f', '2018-05-02 17:42:40');
INSERT INTO `sys_captcha` VALUES ('05a8e4c8-836c-47b2-8f87-804ec9b8d1c2', '3cden', '2018-04-11 10:56:07');
INSERT INTO `sys_captcha` VALUES ('0914ee97-8095-42bb-92d6-1be1f9d85bef', 'w6fa2', '2018-04-11 10:18:34');
INSERT INTO `sys_captcha` VALUES ('0a71fc1a-4a49-4c63-82c6-6ed97d4de20f', 'ny7ca', '2018-04-06 20:03:06');
INSERT INTO `sys_captcha` VALUES ('0ab67973-338d-432e-8fcf-d5673e6c7580', '4yan6', '2018-04-11 10:17:24');
INSERT INTO `sys_captcha` VALUES ('0ba42795-23cc-412e-8a07-c91a901f8fd7', 'gbbgn', '2018-04-16 21:48:09');
INSERT INTO `sys_captcha` VALUES ('1327f9fc-f48c-4aea-80c7-fae64daafc35', 'b7bap', '2018-04-16 21:48:01');
INSERT INTO `sys_captcha` VALUES ('164b384c-82d5-431f-8888-1ed66a04f821', 'dwf68', '2018-04-12 22:49:21');
INSERT INTO `sys_captcha` VALUES ('19d9d680-6083-4877-bc30-6f046e9530e5', 'agxb2', '2018-04-22 19:19:29');
INSERT INTO `sys_captcha` VALUES ('246d6016-5db6-4357-a936-64e2e3e01e76', 'p7afd', '2018-04-06 20:03:03');
INSERT INTO `sys_captcha` VALUES ('2abde2fa-7c98-4e33-8b3b-5fe863d3a756', '5fxa6', '2018-04-22 04:11:48');
INSERT INTO `sys_captcha` VALUES ('2b2c8304-8143-4d5f-8f41-c3df50454954', 'agbmd', '2018-04-23 05:44:14');
INSERT INTO `sys_captcha` VALUES ('2c027ccb-a6a9-4bfa-9991-8406c3e9debd', 'nbb7y', '2018-05-02 17:42:00');
INSERT INTO `sys_captcha` VALUES ('34ee25ca-cf21-49f9-8042-e7ff7cee59f8', 'b88c6', '2018-04-28 21:23:22');
INSERT INTO `sys_captcha` VALUES ('35a01a8d-e260-44b6-9acb-531fa2b89f7b', 'ynwgd', '2018-04-18 23:33:20');
INSERT INTO `sys_captcha` VALUES ('375c9bd5-ce65-427e-b512-7828d594a5a0', '262wf', '2018-04-06 20:26:30');
INSERT INTO `sys_captcha` VALUES ('382cc02b-c7fe-4407-8e5f-a55d54eca048', 'c3g24', '2018-04-11 10:41:43');
INSERT INTO `sys_captcha` VALUES ('38805f49-a6f7-4b3d-81c0-351aa8707437', 'fcmwn', '2018-04-11 10:17:59');
INSERT INTO `sys_captcha` VALUES ('38ab4373-1920-4721-8710-315e3ab58974', 'xmn62', '2018-04-11 10:18:07');
INSERT INTO `sys_captcha` VALUES ('38ed0976-0e90-4be7-8de9-6279f478b15c', 'c5fcb', '2018-05-02 17:41:44');
INSERT INTO `sys_captcha` VALUES ('3aaa6970-8e28-41f8-9634-fae1f3d58243', '3bn4d', '2018-04-22 19:40:08');
INSERT INTO `sys_captcha` VALUES ('3dece3b1-ea35-4834-b9db-9e59c59c0658', 'w3pfy', '2018-04-18 23:26:34');
INSERT INTO `sys_captcha` VALUES ('3dece3b1-ec35-4834-b4db-9e59c59c0678', 'cfm85', '2018-04-18 21:16:57');
INSERT INTO `sys_captcha` VALUES ('3dece3b1-ec35-4834-b9db-9e49c53e0570', 'w3c53', '2018-04-22 14:39:46');
INSERT INTO `sys_captcha` VALUES ('3dece3b1-ec35-4834-b9db-9e49c53e0578', 'bgnx8', '2018-04-22 14:35:26');
INSERT INTO `sys_captcha` VALUES ('3dece3b1-ec35-4834-b9db-9e50c59c0578', '2b2cn', '2018-04-22 16:42:22');
INSERT INTO `sys_captcha` VALUES ('3dece3b1-ec35-4834-b9db-9e59c57c0578', '4ng22', '2018-04-22 11:35:22');
INSERT INTO `sys_captcha` VALUES ('3dece3b1-ec35-4834-b9db-9e59c59c0578', '846y8', '2018-04-18 21:10:17');
INSERT INTO `sys_captcha` VALUES ('3dece3b1-ec35-4834-b9db-9e59c59c0658', 'cf3ea', '2018-04-18 21:26:59');
INSERT INTO `sys_captcha` VALUES ('3dece3b1-ec35-4834-b9db-9e59c59c0678', '47pp7', '2018-04-18 21:08:25');
INSERT INTO `sys_captcha` VALUES ('3dece3b1-ec35-4834-b9db-9e59c59e0578', 'p7m2n', '2018-04-22 14:26:51');
INSERT INTO `sys_captcha` VALUES ('4237cc71-4eb5-4994-8474-7b1fda4f3d67', 'pgpbe', '2018-04-18 22:44:24');
INSERT INTO `sys_captcha` VALUES ('431c913c-b932-49a9-bd84-67402cd00200', '48e6c', '2018-04-16 21:46:37');
INSERT INTO `sys_captcha` VALUES ('47238d18-3929-450a-a2a8-4680edaa9065', '3eaap', '2018-04-06 21:43:07');
INSERT INTO `sys_captcha` VALUES ('48e32231-3063-4ee1-898c-e9f7f4674257', 'apfn7', '2018-05-02 17:42:09');
INSERT INTO `sys_captcha` VALUES ('5154506f-1199-4ab5-bed5-0f8c9c9b7dca', '475fx', '2018-04-11 10:41:48');
INSERT INTO `sys_captcha` VALUES ('52cb5805-897c-44fc-8280-70db3d16697b', 'n4f2p', '2018-04-11 10:21:50');
INSERT INTO `sys_captcha` VALUES ('544c175a-fb98-4a37-be40-9dfe7fb64ab2', '7n468', '2018-04-21 09:58:15');
INSERT INTO `sys_captcha` VALUES ('54bf6ffc-37d6-404d-965d-06ad090bb333', 'wfpnf', '2018-04-06 21:37:23');
INSERT INTO `sys_captcha` VALUES ('575ec8e5-b811-47f3-8431-23361fe3c47b', 'mne22', '2018-04-11 15:30:40');
INSERT INTO `sys_captcha` VALUES ('57c30c29-e018-4090-9f64-2dacbfc8fcc3', 'nw7f6', '2018-04-11 10:41:52');
INSERT INTO `sys_captcha` VALUES ('59120dc5-4d77-47a1-81ca-b3ce4cef5d25', 'pfgdg', '2018-04-06 20:13:48');
INSERT INTO `sys_captcha` VALUES ('5beed1b9-9e92-4523-92d6-549f45da89c3', 'yc6xa', '2018-04-16 21:48:12');
INSERT INTO `sys_captcha` VALUES ('66529ddc-5f83-484e-bb0e-e27ade856988', '2288x', '2018-04-11 10:41:44');
INSERT INTO `sys_captcha` VALUES ('7833196a-bf84-44c4-82bb-949a48cf4c9d', 'nycnf', '2018-04-06 20:25:39');
INSERT INTO `sys_captcha` VALUES ('7b4ba04d-8589-430c-a3c2-a733cd750768', 'x3cmn', '2018-04-11 10:41:41');
INSERT INTO `sys_captcha` VALUES ('7cf30d0d-cd6b-4195-82f0-4534906a7b70', 'xp7pd', '2018-04-09 17:41:27');
INSERT INTO `sys_captcha` VALUES ('7d824abf-a3b9-4fb3-8dae-08d30d17212f', 'xanmg', '2018-04-12 15:54:43');
INSERT INTO `sys_captcha` VALUES ('838b5e92-2d41-4d01-88b8-841607062050', 'xag3n', '2018-04-12 22:49:23');
INSERT INTO `sys_captcha` VALUES ('83edd26e-353d-4b71-9bcf-5b3e3e09339d', '8x86w', '2018-04-20 21:13:44');
INSERT INTO `sys_captcha` VALUES ('877ce997-1853-4ff0-8ddf-7655de519e67', '488e5', '2018-04-16 23:35:17');
INSERT INTO `sys_captcha` VALUES ('880f937b-676f-4d13-829e-47c5ffd6f0bc', '4w5ma', '2018-04-11 15:46:12');
INSERT INTO `sys_captcha` VALUES ('89e8ebcb-2294-4a06-a248-d81b01353723', 'af4c2', '2018-05-02 17:41:49');
INSERT INTO `sys_captcha` VALUES ('8d886b09-3c72-496f-b61a-03adbfb2083d', 'cp6nf', '2018-04-20 21:13:44');
INSERT INTO `sys_captcha` VALUES ('904ee0fa-85c8-4884-8297-bca1bef28eb3', 'bf5fb', '2018-04-22 19:29:13');
INSERT INTO `sys_captcha` VALUES ('930f5f17-79c0-4c29-8735-e728683bc11a', 'xmc3f', '2018-04-16 21:53:33');
INSERT INTO `sys_captcha` VALUES ('9bf79bf8-e183-4d8b-9398-caf6565ab32c', '8an4w', '2018-04-27 16:14:33');
INSERT INTO `sys_captcha` VALUES ('9fab422d-a6be-4695-a707-dbd758f1466e', 'x7n3w', '2018-04-28 15:11:59');
INSERT INTO `sys_captcha` VALUES ('a4aa2e54-5328-4c7a-8caf-c9d8f86a54aa', '53xnw', '2018-05-02 16:57:42');
INSERT INTO `sys_captcha` VALUES ('a501170e-17b2-44d8-b0db-869489d9269f', 'ca3dn', '2018-04-16 16:16:13');
INSERT INTO `sys_captcha` VALUES ('b0c03351-2812-4586-896f-d9107177e731', 'e4egp', '2018-05-02 17:53:00');
INSERT INTO `sys_captcha` VALUES ('b3110876-aa76-422a-8e3f-83ae9e5310d3', 'd5m2f', '2018-04-11 10:17:48');
INSERT INTO `sys_captcha` VALUES ('bb387941-c1c7-4842-ae01-03a68328036d', 'dp42d', '2018-04-11 10:42:01');
INSERT INTO `sys_captcha` VALUES ('bf7cc3b7-313a-4770-b5d8-c69bcf0f5d4e', 'eywxb', '2018-04-11 10:17:35');
INSERT INTO `sys_captcha` VALUES ('c24a365a-0f18-4ceb-8019-d526283780c4', 'y2wgx', '2018-04-11 10:41:56');
INSERT INTO `sys_captcha` VALUES ('c274cf82-ed33-428a-9730-f5b121c79c17', 'd5fp6', '2018-04-21 09:57:31');
INSERT INTO `sys_captcha` VALUES ('c4facc76-921b-4db0-a21f-c1752240318e', 'dg75f', '2018-04-11 10:19:34');
INSERT INTO `sys_captcha` VALUES ('c560f893-2f9f-4bf9-aa6d-e1d65da653c2', 'deenf', '2018-04-11 10:17:05');
INSERT INTO `sys_captcha` VALUES ('c6073e77-3cc5-479a-8649-3a98ecf9d1c9', 'x85bf', '2018-04-06 20:59:53');
INSERT INTO `sys_captcha` VALUES ('c757cae0-f75d-41c7-8d53-69a8e0509b62', 'w84yd', '2018-04-11 10:19:45');
INSERT INTO `sys_captcha` VALUES ('c784c8d3-97ec-4d45-ab90-daeff3970829', 'xwgm4', '2018-04-18 21:16:57');
INSERT INTO `sys_captcha` VALUES ('c784c8d3-97ec-4d85-ab90-daeff3970829', 'weyf8', '2018-04-18 21:16:57');
INSERT INTO `sys_captcha` VALUES ('c9150865-3fe2-4d36-a4a8-9d2608c83c0c', '564x4', '2018-04-22 20:01:55');
INSERT INTO `sys_captcha` VALUES ('c921cda8-3f6c-449c-8f68-8e4fe8ba0c73', '7my22', '2018-05-02 16:56:46');
INSERT INTO `sys_captcha` VALUES ('ca33cb53-3b09-44e2-8f82-11420bb15dba', '4853g', '2018-04-11 10:18:06');
INSERT INTO `sys_captcha` VALUES ('cf8f3a80-23b5-47ca-8eee-9e8ed347168c', 'mbcy5', '2018-04-16 21:49:06');
INSERT INTO `sys_captcha` VALUES ('d0ffc30d-6a69-49f0-afe2-a8cf119ef750', '43bac', '2018-04-16 20:20:54');
INSERT INTO `sys_captcha` VALUES ('d90bd8d9-6850-420a-b04c-c0ad1ad80f69', '34p6m', '2018-04-11 10:41:34');
INSERT INTO `sys_captcha` VALUES ('db4f5d51-d105-47e8-99c9-0bd9bfbfffd0', 'm8abm', '2018-04-16 21:51:51');
INSERT INTO `sys_captcha` VALUES ('e046feb5-3c52-44c1-8861-53c471f5c5de', 'pdmnw', '2018-04-18 21:09:41');
INSERT INTO `sys_captcha` VALUES ('e315d02a-e1d6-42ef-ad5e-feca63a54038', '65wyg', '2018-04-20 21:13:44');
INSERT INTO `sys_captcha` VALUES ('ea2fe16d-e777-4242-926f-029c8de7a2fe', 'd67yy', '2018-04-22 16:42:22');
INSERT INTO `sys_captcha` VALUES ('eab6f557-1380-4dcc-a8d8-02df3d6c9495', 'amf5n', '2018-04-06 20:13:13');
INSERT INTO `sys_captcha` VALUES ('ee370a28-5a1b-469f-a01e-90f6b578c760', '8nmf8', '2018-04-06 21:01:30');
INSERT INTO `sys_captcha` VALUES ('f595f4d5-3ad3-4c66-843d-d6bf0b33910b', '84522', '2018-04-11 13:29:50');
INSERT INTO `sys_captcha` VALUES ('fb0a34e7-1a77-4be6-8063-b24d290236d7', 'd5xnx', '2018-04-18 21:09:00');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"type\":2,\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"qiniuBucketName\":\"ios-app\",\"aliyunDomain\":\"http://k-print.oss-cn-beijing.aliyuncs.com\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"oss-cn-beijing.aliyuncs.com\",\"aliyunAccessKeyId\":\"LTAIUFvBq02Jnx09\",\"aliyunAccessKeySecret\":\"1s1wEfqtdHwqYYmxIbVEV4W4In2wA8\",\"aliyunBucketName\":\"k-print\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\"}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存菜单', 'tech.yiyehu.modules.sys.controller.SysMenuController.save()', '{\"menuId\":71,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"校园跳蚤市场\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":0}', '202', '0:0:0:0:0:0:0:1', '2018-04-07 18:20:03');
INSERT INTO `sys_log` VALUES ('2', 'admin', '保存菜单', 'tech.yiyehu.modules.sys.controller.SysMenuController.save()', '{\"menuId\":72,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"用户管理\",\"type\":0,\"icon\":\"fa fa-cog\",\"orderNum\":2}', '196', '0:0:0:0:0:0:0:1', '2018-04-07 18:22:09');
INSERT INTO `sys_log` VALUES ('3', 'admin', '保存用户', 'tech.yiyehu.modules.sys.controller.SysUserController.save()', '{\"userId\":2,\"username\":\"test\",\"password\":\"bf817b2701db70beaef0ad756811cbdbc79fff309dda5163b7ea5486983814d3\",\"salt\":\"fvg9LF6gjMxDPO1za7Of\",\"email\":\"test@qq.com\",\"mobile\":\"13236532850\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Apr 8, 2018 2:52:14 PM\"}', '390', '0:0:0:0:0:0:0:1', '2018-04-08 14:52:15');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存角色', 'tech.yiyehu.modules.sys.controller.SysRoleController.save()', '{\"roleId\":1,\"roleName\":\"用户\",\"remark\":\"tb_user\",\"createUserId\":1,\"menuIdList\":[71,31,32,36,37,38,39,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,72,61,62,63,64,66,67,68,69,70],\"createTime\":\"Apr 8, 2018 2:55:57 PM\"}', '1581', '0:0:0:0:0:0:0:1', '2018-04-08 14:55:59');
INSERT INTO `sys_log` VALUES ('5', 'admin', '修改用户', 'tech.yiyehu.modules.sys.controller.SysUserController.update()', '{\"userId\":2,\"username\":\"test\",\"salt\":\"fvg9LF6gjMxDPO1za7Of\",\"email\":\"test@qq.com\",\"mobile\":\"13236532850\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Apr 8, 2018 2:52:15 PM\"}', '353', '0:0:0:0:0:0:0:1', '2018-04-08 15:01:44');
INSERT INTO `sys_log` VALUES ('6', 'admin', '保存菜单', 'tech.yiyehu.modules.sys.controller.SysMenuController.save()', '{\"menuId\":73,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"资源管理\",\"type\":0,\"orderNum\":4}', '239', '0:0:0:0:0:0:0:1', '2018-04-09 15:03:35');
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改菜单', 'tech.yiyehu.modules.sys.controller.SysMenuController.update()', '{\"menuId\":51,\"parentId\":73,\"parentName\":\"资源管理\",\"name\":\"图片\",\"url\":\"modules/app/images.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '280', '0:0:0:0:0:0:0:1', '2018-04-09 15:04:17');
INSERT INTO `sys_log` VALUES ('8', 'admin', '修改菜单', 'tech.yiyehu.modules.sys.controller.SysMenuController.update()', '{\"menuId\":51,\"parentId\":73,\"parentName\":\"资源管理\",\"name\":\"图片\",\"url\":\"modules/app/images.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":1}', '277', '0:0:0:0:0:0:0:1', '2018-04-09 15:04:30');
INSERT INTO `sys_log` VALUES ('9', 'admin', '删除菜单', 'tech.yiyehu.modules.sys.controller.SysMenuController.delete()', '32', '391', '0:0:0:0:0:0:0:1', '2018-04-09 16:33:25');
INSERT INTO `sys_log` VALUES ('10', 'admin', '修改菜单', 'tech.yiyehu.modules.sys.controller.SysMenuController.update()', '{\"menuId\":74,\"parentId\":72,\"parentName\":\"用户管理\",\"name\":\"城市\",\"url\":\"modules/app/city.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '297', '127.0.0.1', '2018-04-14 18:30:19');
INSERT INTO `sys_log` VALUES ('11', 'admin', '修改菜单', 'tech.yiyehu.modules.sys.controller.SysMenuController.update()', '{\"menuId\":78,\"parentId\":72,\"parentName\":\"用户管理\",\"name\":\"省份\",\"url\":\"modules/app/province.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '279', '127.0.0.1', '2018-04-14 18:30:47');
INSERT INTO `sys_log` VALUES ('12', 'admin', '修改菜单', 'tech.yiyehu.modules.sys.controller.SysMenuController.update()', '{\"menuId\":82,\"parentId\":72,\"parentName\":\"用户管理\",\"name\":\"县区\",\"url\":\"modules/app/region.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '281', '127.0.0.1', '2018-04-14 18:31:11');
INSERT INTO `sys_log` VALUES ('13', 'admin', '修改菜单', 'tech.yiyehu.modules.sys.controller.SysMenuController.update()', '{\"menuId\":86,\"parentId\":72,\"parentName\":\"用户管理\",\"name\":\"城镇\",\"url\":\"modules/app/town.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '274', '127.0.0.1', '2018-04-14 18:31:44');
INSERT INTO `sys_log` VALUES ('14', 'admin', '修改菜单', 'tech.yiyehu.modules.sys.controller.SysMenuController.update()', '{\"menuId\":90,\"parentId\":72,\"parentName\":\"用户管理\",\"name\":\"用户地址\",\"url\":\"modules/app/useraddress.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":6}', '275', '127.0.0.1', '2018-04-14 18:32:08');
INSERT INTO `sys_log` VALUES ('15', 'admin', '删除菜单', 'tech.yiyehu.modules.sys.controller.SysMenuController.delete()', '73', '370', '127.0.0.1', '2018-04-14 18:32:29');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'modules/sys/user.html', null, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'modules/sys/role.html', null, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'modules/sys/menu.html', null, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'modules/job/schedule.html', null, '1', 'fa fa-tasks', '5');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'modules/sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'modules/oss/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` VALUES ('31', '71', '分类', 'modules/app/category.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('33', '31', '新增', null, 'app:category:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('34', '31', '修改', null, 'app:category:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('35', '31', '删除', null, 'app:category:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('36', '71', '评论', 'modules/app/comments.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('37', '36', '查看', null, 'app:comments:list,app:comments:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('38', '36', '新增', null, 'app:comments:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('39', '36', '修改', null, 'app:comments:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('40', '36', '删除', null, 'app:comments:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('41', '71', '商品', 'modules/app/goods.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('42', '41', '查看', null, 'app:goods:list,app:goods:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('43', '41', '新增', null, 'app:goods:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('44', '41', '修改', null, 'app:goods:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('45', '41', '删除', null, 'app:goods:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('46', '71', '商品图片', 'modules/app/goodsimages.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('47', '46', '查看', null, 'app:goodsimages:list,app:goodsimages:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('48', '46', '新增', null, 'app:goodsimages:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('49', '46', '修改', null, 'app:goodsimages:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('50', '46', '删除', null, 'app:goodsimages:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('56', '71', '订单', 'modules/app/order.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('57', '56', '查看', null, 'app:order:list,app:order:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('58', '56', '新增', null, 'app:order:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('59', '56', '修改', null, 'app:order:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('60', '56', '删除', null, 'app:order:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('61', '72', '用户', 'modules/app/user.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('62', '61', '查看', null, 'app:user:list,app:user:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('63', '61', '新增', null, 'app:user:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('64', '61', '修改', null, 'app:user:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('65', '61', '删除', null, 'app:user:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('66', '72', '用户地址', 'modules/app/useraddress.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('67', '66', '查看', null, 'app:useraddress:list,app:useraddress:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('68', '66', '新增', null, 'app:useraddress:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('69', '66', '修改', null, 'app:useraddress:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('70', '66', '删除', null, 'app:useraddress:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('71', '0', '校园跳蚤市场', null, null, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` VALUES ('72', '0', '用户管理', null, null, '0', 'fa fa-cog', '2');
INSERT INTO `sys_menu` VALUES ('75', '95', '城市新增', null, 'sys:city:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('76', '95', '城市修改', null, 'sys:city:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('77', '95', '城市删除', null, 'sys:city:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('79', '95', '省份新增', null, 'sys:province:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('80', '95', '省份修改', null, 'sys:province:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('81', '95', '省份删除', null, 'sys:province:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('83', '95', '县区新增', null, 'sys:region:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('84', '95', '县区修改', null, 'sys:region:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('85', '95', '县区删除', null, 'sys:region:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('87', '95', '城镇新增', null, 'sys:town:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('88', '95', '城镇修改', null, 'sys:town:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('89', '86', '城镇删除', null, 'sys:town:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('95', '1', '地址', 'modules/sys/address.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('96', '1', '购物车', 'modules/app/carts.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('97', '96', '查看', null, 'app:carts:list,app:carts:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('98', '96', '新增', null, 'app:carts:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('99', '96', '修改', null, 'app:carts:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('100', '96', '删除', null, 'app:carts:delete', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('101', '1', '帮帮订单', 'modules/app/aidorder.html', null, '1', 'fa fa-file-code-o', '6');
INSERT INTO `sys_menu` VALUES ('102', '101', '查看', null, 'app:aidorder:list,app:aidorder:info', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('103', '101', '新增', null, 'app:aidorder:save', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('104', '101', '修改', null, 'app:aidorder:update', '2', null, '6');
INSERT INTO `sys_menu` VALUES ('105', '101', '删除', null, 'app:aidorder:delete', '2', null, '6');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES ('108', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg', '2018-04-22 18:12:00');
INSERT INTO `sys_oss` VALUES ('109', '20180422/ae7f40b00b1c4581817d067687092d1c.jpg', '2018-04-22 19:04:06');
INSERT INTO `sys_oss` VALUES ('110', '20180422/893aaecd47334d95875e8de073acf346.jpg', '2018-04-22 19:05:30');
INSERT INTO `sys_oss` VALUES ('111', '20180422/b4989d9acad249caabe41b82bd873eed.jpg', '2018-04-22 19:06:37');
INSERT INTO `sys_oss` VALUES ('112', '20180422/53f2fd8fb92c43f1bb3af9bcc5b59ad2.jpg', '2018-04-22 19:24:52');
INSERT INTO `sys_oss` VALUES ('113', '20180422/7d0a8358dc164f2da9e40c3feff234d3.jpg', '2018-04-22 19:38:16');
INSERT INTO `sys_oss` VALUES ('114', '20180422/17d7ce684e1d4e57a8e06c61ce645429.jpg', '2018-04-22 19:38:47');
INSERT INTO `sys_oss` VALUES ('115', '20180422/7dbccfa2e96644efaadc23f6aafe3fb0.jpg', '2018-04-22 19:39:06');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '用户', 'tb_user', '1', '2018-04-08 14:55:57');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '71');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('4', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('5', '1', '37');
INSERT INTO `sys_role_menu` VALUES ('6', '1', '38');
INSERT INTO `sys_role_menu` VALUES ('7', '1', '39');
INSERT INTO `sys_role_menu` VALUES ('8', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('9', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('10', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('11', '1', '44');
INSERT INTO `sys_role_menu` VALUES ('12', '1', '45');
INSERT INTO `sys_role_menu` VALUES ('13', '1', '46');
INSERT INTO `sys_role_menu` VALUES ('14', '1', '47');
INSERT INTO `sys_role_menu` VALUES ('15', '1', '48');
INSERT INTO `sys_role_menu` VALUES ('16', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('17', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('23', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('24', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('25', '1', '58');
INSERT INTO `sys_role_menu` VALUES ('26', '1', '72');
INSERT INTO `sys_role_menu` VALUES ('27', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('28', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('29', '1', '63');
INSERT INTO `sys_role_menu` VALUES ('30', '1', '64');
INSERT INTO `sys_role_menu` VALUES ('31', '1', '66');
INSERT INTO `sys_role_menu` VALUES ('32', '1', '67');
INSERT INTO `sys_role_menu` VALUES ('33', '1', '68');
INSERT INTO `sys_role_menu` VALUES ('34', '1', '69');
INSERT INTO `sys_role_menu` VALUES ('35', '1', '70');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES ('2', 'test', 'bf817b2701db70beaef0ad756811cbdbc79fff309dda5163b7ea5486983814d3', 'fvg9LF6gjMxDPO1za7Of', 'test@qq.com', '13236532850', '1', '1', '2018-04-08 14:52:15');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '2', '1');

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', '17fc470c073d0015651704d68dd9adc4', '2018-05-03 05:30:23', '2018-05-02 17:30:23');
INSERT INTO `sys_user_token` VALUES ('2', 'dd1657b913e2f2453835764055dc6af7', '2018-04-19 10:18:44', '2018-04-18 22:18:44');

-- ----------------------------
-- Table structure for tb_aid_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_aid_order`;
CREATE TABLE `tb_aid_order` (
  `aid_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '帮帮订单ID',
  `category_id` bigint(20) DEFAULT '2' COMMENT '分类ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `deadline` datetime DEFAULT NULL COMMENT '截至时间',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `description` varchar(1000) DEFAULT NULL COMMENT '订单描述',
  `status` smallint(6) DEFAULT '0' COMMENT '订单状态',
  `order_address` varchar(200) DEFAULT NULL COMMENT '订单地址',
  `remuneration` int(11) DEFAULT NULL COMMENT '接单报酬',
  `payment_method` int(11) DEFAULT '0' COMMENT '付款方式',
  `receiver_id` bigint(20) DEFAULT NULL COMMENT '接单人ID',
  `receiver_contact` varchar(20) DEFAULT NULL COMMENT '接单人联系方式',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `creator_contact` varchar(20) DEFAULT NULL COMMENT '创建人联系方式',
  `comment_thing` varchar(200) DEFAULT NULL COMMENT '评价',
  `comment_star` smallint(6) DEFAULT '0' COMMENT '星级',
  `received_info` varchar(200) DEFAULT NULL COMMENT '接单后信息',
  PRIMARY KEY (`aid_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='帮帮订单';

-- ----------------------------
-- Records of tb_aid_order
-- ----------------------------
INSERT INTO `tb_aid_order` VALUES ('1', '27', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '1', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('2', '28', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '1', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('3', '28', '2018-05-06 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '1', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('4', '29', '2018-05-01 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '1', '新校区25栋韵达快递', '2', '0', '1', '1231241534', '2', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('5', '26', '2018-05-02 13:16:42', '2018-05-28 13:16:46', null, '问问题', '问问题', '1', '新校区25栋韵达快递', '2', '0', '1', '13655245362', '2', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('6', '26', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '求资料-资料费另算', '求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算', '0', '新校区25栋韵达快递', '2', '0', null, null, '1', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('7', '26', '2018-05-03 13:16:42', '2018-05-28 13:16:46', null, '问问题', '问问题', '0', '新校区25栋韵达快递', '2', '0', null, null, '1', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('8', '29', '2018-05-07 22:16:42', '2018-05-28 13:16:46', null, '求习题', '求习题', '0', '新校区25栋韵达快递', '2', '0', null, null, '1', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('9', '28', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '1', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('10', '29', '2018-05-03 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '1', '新校区25栋韵达快递', '2', '0', '7', '微信:oekjdi', '1', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('11', '29', '2018-05-05 17:53:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '2', '新校区25栋韵达快递', '2', '0', '3', 'QQ:00001', '1', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('12', '27', '2018-04-30 17:45:24', '2018-05-06 17:45:52', null, '帮我拿快递', '帮我拿快递', '1', '新校区25栋韵达快递', '2', '0', '4', 'QQ:3425252', '2', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('13', '27', '2018-05-08 13:16:42', '2018-05-09 23:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '2', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('14', '27', '2018-05-06 17:25:24', '2018-05-01 14:16:52', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '1', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('15', '27', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '2', '新校区25栋韵达快递', '2', '0', '6', '电话：890707335', '1', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('16', '28', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '1', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('17', '28', '2018-05-06 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '1', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('18', '29', '2018-05-01 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '1', '新校区25栋韵达快递', '2', '0', '1', '1231241534', '3', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('19', '26', '2018-05-02 13:16:42', '2018-05-28 13:16:46', null, '问问题', '问问题', '1', '新校区25栋韵达快递', '2', '0', '1', '13655245362', '3', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('20', '26', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '求资料-资料费另算', '求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算', '2', '新校区25栋韵达快递', '2', '0', '1', '23423424234', '4', '13655248995', '务很周到', '5', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('21', '26', '2018-05-03 13:16:42', '2018-05-28 13:16:46', null, '问问题', '问问题', '2', '新校区25栋韵达快递', '2', '0', '3', '2342424242', '5', '13655248995', '务很周到', '5', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('22', '29', '2018-05-07 22:16:42', '2018-05-28 13:16:46', null, '求习题', '求习题', '2', '新校区25栋韵达快递', '2', '0', '2', '1232414235', '4', '13655248995', '务很周到', '4', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('23', '28', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '7', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('24', '29', '2018-05-03 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '3', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('25', '29', '2018-05-05 17:53:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '8', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('26', '27', '2018-04-30 17:45:24', '2018-05-06 17:45:52', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '2', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('27', '27', '2018-05-08 13:16:42', '2018-05-09 23:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '2', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('28', '27', '2018-05-06 17:25:24', '2018-05-01 14:16:52', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '3', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('30', '27', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '4', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('31', '28', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '5', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('32', '27', '2018-04-30 17:45:24', '2018-05-06 17:45:52', '2018-05-15 18:29:18', '帮我拿快递', '帮我拿快递', '2', '新校区25栋韵达快递', '2', '0', '2', '电话：1593032472', '2', '13655248995', '服务很周到', '5', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('33', '29', '2018-05-01 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '1', '新校区25栋韵达快递', '2', '0', '1', '1231241534', '2', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('34', '26', '2018-05-02 13:16:42', '2018-05-28 13:16:46', null, '问问题', '问问题', '1', '新校区25栋韵达快递', '2', '0', '1', '13655245362', '2', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('35', '26', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '求资料-资料费另算', '求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算', '0', '新校区25栋韵达快递', '2', '0', null, null, '7', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('36', '26', '2018-05-03 13:16:42', '2018-05-28 13:16:46', null, '问问题', '问问题', '1', '新校区25栋韵达快递', '2', '0', '1', '13655245362', '8', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('37', '29', '2018-05-07 22:16:42', '2018-05-28 13:16:46', null, '求习题', '求习题', '0', '新校区25栋韵达快递', '2', '0', null, null, '5', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('38', '28', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '9', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('39', '29', '2018-05-03 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '4', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('40', '29', '2018-05-05 17:53:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '3', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('41', '27', '2018-04-30 17:45:24', '2018-05-06 17:45:52', '2018-05-09 18:29:29', '帮我拿快递', '帮我拿快递', '2', '新校区25栋韵达快递', '2', '0', '2', '电话：1593032472', '2', '13655248995', '服务很周到', '5', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('42', '27', '2018-05-08 13:16:42', '2018-05-09 23:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '2', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('43', '27', '2018-05-06 17:25:24', '2018-05-01 14:16:52', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '4', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('44', '27', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '3', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('45', '28', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '5', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('46', '28', '2018-05-06 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '6', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('47', '29', '2018-05-01 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '1', '新校区25栋韵达快递', '2', '0', '1', '1231241534', '6', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('48', '26', '2018-05-02 13:16:42', '2018-05-28 13:16:46', null, '问问题', '问问题', '1', '新校区25栋韵达快递', '2', '0', '1', '13655245362', '7', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('49', '26', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '求资料-资料费另算', '求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算求资料-资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算资料费另算', '1', '新校区25栋韵达快递', '2', '0', '1', '13655245362', '6', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('50', '26', '2018-05-03 13:16:42', '2018-05-28 13:16:46', null, '问问题', '问问题', '0', '新校区25栋韵达快递', '2', '0', null, null, '6', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('51', '29', '2018-05-07 22:16:42', '2018-05-28 13:16:46', null, '求习题', '求习题', '0', '新校区25栋韵达快递', '2', '0', null, null, '6', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('52', '28', '2018-05-07 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '6', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('53', '29', '2018-05-03 13:16:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '2', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('54', '29', '2018-05-05 17:53:42', '2018-05-28 13:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '6', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('55', '27', '2018-04-30 17:45:24', '2018-05-06 17:45:52', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '8', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('56', '27', '2018-05-08 13:16:42', '2018-05-09 23:16:46', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '8', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('57', '27', '2018-05-06 17:25:24', '2018-05-01 14:16:52', null, '帮我拿快递', '帮我拿快递', '0', '新校区25栋韵达快递', '2', '0', null, null, '3', '13655248995', null, '0', '电话：13655248995，姓名：小鱼干，取货码：0009');
INSERT INTO `tb_aid_order` VALUES ('61', '26', '2018-05-09 20:10:19', '2018-05-31 20:23:38', null, '问问题啦', '电话联系吧', '0', '新校区', '2', '0', null, null, '1', 'QQ：54676196', null, '0', '电话联系吧');
INSERT INTO `tb_aid_order` VALUES ('62', '26', '2018-05-09 20:15:57', '2018-05-01 14:16:52', null, '问问人', '数学题\n高数题\n矩阵\n微积分', '0', '新校区', '6', '0', null, null, '1', 'QQ：21694546676', null, '0', '电话联系吧：13652834619');
INSERT INTO `tb_aid_order` VALUES ('63', '26', '2018-05-09 20:15:57', '2018-05-01 14:16:52', null, '问问人', '数学题\n高数题\n矩阵\n微积分', '0', '新校区', '6', '0', null, null, '1', 'QQ：21694546676', null, '0', '电话联系吧：13652834619');
INSERT INTO `tb_aid_order` VALUES ('64', '26', '2018-05-09 20:15:59', '2018-05-01 14:16:52', null, '问问人', '数学题\n高数题\n矩阵\n微积分', '0', '新校区', '6', '0', null, null, '1', 'QQ：21694546676', null, '0', '电话联系吧：13652834619');

-- ----------------------------
-- Table structure for tb_carts
-- ----------------------------
DROP TABLE IF EXISTS `tb_carts`;
CREATE TABLE `tb_carts` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of tb_carts
-- ----------------------------
INSERT INTO `tb_carts` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '分类名',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类ID',
  `urlname` varchar(100) DEFAULT NULL COMMENT 'url路径',
  `level` smallint(6) DEFAULT NULL COMMENT '等级',
  `icon` varchar(50) DEFAULT NULL COMMENT '小图标',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `keywords` varchar(200) DEFAULT NULL COMMENT '关键字',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='分类';

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES ('1', '系统', '0', null, null, null, '系统，总', null);
INSERT INTO `tb_category` VALUES ('2', '帮帮', '0', null, '1', 'fa fa-helping', '帮帮订单模块的总分类，无父分类', null);
INSERT INTO `tb_category` VALUES ('3', '跳蚤街', '0', null, '1', 'fa fa-shop', '校园跳蚤市场模块中商品分类，等级1', null);
INSERT INTO `tb_category` VALUES ('4', '服饰', '3', null, '2', 'fas fa-shopping-cart', null, null);
INSERT INTO `tb_category` VALUES ('5', '电子产品', '3', null, '2', 'fas fa-mobile', null, null);
INSERT INTO `tb_category` VALUES ('6', '书籍', '3', null, '2', 'fa fa-book', null, 'book');
INSERT INTO `tb_category` VALUES ('7', '计算机/网络', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('8', '哲学', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('9', '经济学', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('10', '政治法学', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('11', '教育学', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('12', '文学艺术', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('13', '历史学', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('14', '理学', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('15', '工学', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('16', '农学', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('17', '医学', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('18', '管理学', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('19', '外语', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('20', '公共课与文化课', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('21', '其他', '6', null, '3', null, null, null);
INSERT INTO `tb_category` VALUES ('26', '学习提点', '2', null, '3', 'iconfont icon-yiwen', null, null);
INSERT INTO `tb_category` VALUES ('27', '取件', '2', null, '3', 'iconfont icon-kuaidi1', null, null);
INSERT INTO `tb_category` VALUES ('28', '送物', '2', null, '3', 'iconfont icon-kuaidi', null, null);
INSERT INTO `tb_category` VALUES ('29', '其他', '2', null, '3', 'iconfont icon-qita', null, null);

-- ----------------------------
-- Table structure for tb_city
-- ----------------------------
DROP TABLE IF EXISTS `tb_city`;
CREATE TABLE `tb_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '城市ID',
  `name` varchar(30) DEFAULT NULL COMMENT '城市名称',
  `zipcode` varchar(50) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL COMMENT '省份ID',
  PRIMARY KEY (`city_id`),
  KEY `FK_Relationship_8` (`province_id`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`province_id`) REFERENCES `tb_province` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 COMMENT='城市';

-- ----------------------------
-- Records of tb_city
-- ----------------------------
INSERT INTO `tb_city` VALUES ('1', '北京市', '100000', '1');
INSERT INTO `tb_city` VALUES ('2', '天津市', '100000', '2');
INSERT INTO `tb_city` VALUES ('3', '石家庄市', '050000', '3');
INSERT INTO `tb_city` VALUES ('4', '唐山市', '063000', '3');
INSERT INTO `tb_city` VALUES ('5', '秦皇岛市', '066000', '3');
INSERT INTO `tb_city` VALUES ('6', '邯郸市', '056000', '3');
INSERT INTO `tb_city` VALUES ('7', '邢台市', '054000', '3');
INSERT INTO `tb_city` VALUES ('8', '保定市', '071000', '3');
INSERT INTO `tb_city` VALUES ('9', '张家口市', '075000', '3');
INSERT INTO `tb_city` VALUES ('10', '承德市', '067000', '3');
INSERT INTO `tb_city` VALUES ('11', '沧州市', '061000', '3');
INSERT INTO `tb_city` VALUES ('12', '廊坊市', '065000', '3');
INSERT INTO `tb_city` VALUES ('13', '衡水市', '053000', '3');
INSERT INTO `tb_city` VALUES ('14', '太原市', '030000', '4');
INSERT INTO `tb_city` VALUES ('15', '大同市', '037000', '4');
INSERT INTO `tb_city` VALUES ('16', '阳泉市', '045000', '4');
INSERT INTO `tb_city` VALUES ('17', '长治市', '046000', '4');
INSERT INTO `tb_city` VALUES ('18', '晋城市', '048000', '4');
INSERT INTO `tb_city` VALUES ('19', '朔州市', '036000', '4');
INSERT INTO `tb_city` VALUES ('20', '晋中市', '030600', '4');
INSERT INTO `tb_city` VALUES ('21', '运城市', '044000', '4');
INSERT INTO `tb_city` VALUES ('22', '忻州市', '034000', '4');
INSERT INTO `tb_city` VALUES ('23', '临汾市', '041000', '4');
INSERT INTO `tb_city` VALUES ('24', '吕梁市', '030500', '4');
INSERT INTO `tb_city` VALUES ('25', '呼和浩特市', '010000', '5');
INSERT INTO `tb_city` VALUES ('26', '包头市', '014000', '5');
INSERT INTO `tb_city` VALUES ('27', '乌海市', '016000', '5');
INSERT INTO `tb_city` VALUES ('28', '赤峰市', '024000', '5');
INSERT INTO `tb_city` VALUES ('29', '通辽市', '028000', '5');
INSERT INTO `tb_city` VALUES ('30', '鄂尔多斯市', '010300', '5');
INSERT INTO `tb_city` VALUES ('31', '呼伦贝尔市', '021000', '5');
INSERT INTO `tb_city` VALUES ('32', '巴彦淖尔市', '014400', '5');
INSERT INTO `tb_city` VALUES ('33', '乌兰察布市', '011800', '5');
INSERT INTO `tb_city` VALUES ('34', '兴安盟', '137500', '5');
INSERT INTO `tb_city` VALUES ('35', '锡林郭勒盟', '011100', '5');
INSERT INTO `tb_city` VALUES ('36', '阿拉善盟', '016000', '5');
INSERT INTO `tb_city` VALUES ('37', '沈阳市', '110000', '6');
INSERT INTO `tb_city` VALUES ('38', '大连市', '116000', '6');
INSERT INTO `tb_city` VALUES ('39', '鞍山市', '114000', '6');
INSERT INTO `tb_city` VALUES ('40', '抚顺市', '113000', '6');
INSERT INTO `tb_city` VALUES ('41', '本溪市', '117000', '6');
INSERT INTO `tb_city` VALUES ('42', '丹东市', '118000', '6');
INSERT INTO `tb_city` VALUES ('43', '锦州市', '121000', '6');
INSERT INTO `tb_city` VALUES ('44', '营口市', '115000', '6');
INSERT INTO `tb_city` VALUES ('45', '阜新市', '123000', '6');
INSERT INTO `tb_city` VALUES ('46', '辽阳市', '111000', '6');
INSERT INTO `tb_city` VALUES ('47', '盘锦市', '124000', '6');
INSERT INTO `tb_city` VALUES ('48', '铁岭市', '112000', '6');
INSERT INTO `tb_city` VALUES ('49', '朝阳市', '122000', '6');
INSERT INTO `tb_city` VALUES ('50', '葫芦岛市', '125000', '6');
INSERT INTO `tb_city` VALUES ('51', '长春市', '130000', '7');
INSERT INTO `tb_city` VALUES ('52', '吉林市', '132000', '7');
INSERT INTO `tb_city` VALUES ('53', '四平市', '136000', '7');
INSERT INTO `tb_city` VALUES ('54', '辽源市', '136200', '7');
INSERT INTO `tb_city` VALUES ('55', '通化市', '134000', '7');
INSERT INTO `tb_city` VALUES ('56', '白山市', '134300', '7');
INSERT INTO `tb_city` VALUES ('57', '松原市', '131100', '7');
INSERT INTO `tb_city` VALUES ('58', '白城市', '137000', '7');
INSERT INTO `tb_city` VALUES ('59', '延边朝鲜族自治州', '133000', '7');
INSERT INTO `tb_city` VALUES ('60', '哈尔滨市', '150000', '8');
INSERT INTO `tb_city` VALUES ('61', '齐齐哈尔市', '161000', '8');
INSERT INTO `tb_city` VALUES ('62', '鸡西市', '158100', '8');
INSERT INTO `tb_city` VALUES ('63', '鹤岗市', '154100', '8');
INSERT INTO `tb_city` VALUES ('64', '双鸭山市', '155100', '8');
INSERT INTO `tb_city` VALUES ('65', '大庆市', '163000', '8');
INSERT INTO `tb_city` VALUES ('66', '伊春市', '152300', '8');
INSERT INTO `tb_city` VALUES ('67', '佳木斯市', '154000', '8');
INSERT INTO `tb_city` VALUES ('68', '七台河市', '154600', '8');
INSERT INTO `tb_city` VALUES ('69', '牡丹江市', '157000', '8');
INSERT INTO `tb_city` VALUES ('70', '黑河市', '164300', '8');
INSERT INTO `tb_city` VALUES ('71', '绥化市', '152000', '8');
INSERT INTO `tb_city` VALUES ('72', '大兴安岭地区', '165000', '8');
INSERT INTO `tb_city` VALUES ('73', '上海市', '200000', '9');
INSERT INTO `tb_city` VALUES ('74', '南京市', '210000', '10');
INSERT INTO `tb_city` VALUES ('75', '无锡市', '214000', '10');
INSERT INTO `tb_city` VALUES ('76', '徐州市', '221000', '10');
INSERT INTO `tb_city` VALUES ('77', '常州市', '213000', '10');
INSERT INTO `tb_city` VALUES ('78', '苏州市', '215000', '10');
INSERT INTO `tb_city` VALUES ('79', '南通市', '226000', '10');
INSERT INTO `tb_city` VALUES ('80', '连云港市', '222000', '10');
INSERT INTO `tb_city` VALUES ('81', '淮安市', '223200', '10');
INSERT INTO `tb_city` VALUES ('82', '盐城市', '224000', '10');
INSERT INTO `tb_city` VALUES ('83', '扬州市', '225000', '10');
INSERT INTO `tb_city` VALUES ('84', '镇江市', '212000', '10');
INSERT INTO `tb_city` VALUES ('85', '泰州市', '225300', '10');
INSERT INTO `tb_city` VALUES ('86', '宿迁市', '223800', '10');
INSERT INTO `tb_city` VALUES ('87', '杭州市', '310000', '11');
INSERT INTO `tb_city` VALUES ('88', '宁波市', '315000', '11');
INSERT INTO `tb_city` VALUES ('89', '温州市', '325000', '11');
INSERT INTO `tb_city` VALUES ('90', '嘉兴市', '314000', '11');
INSERT INTO `tb_city` VALUES ('91', '湖州市', '313000', '11');
INSERT INTO `tb_city` VALUES ('92', '绍兴市', '312000', '11');
INSERT INTO `tb_city` VALUES ('93', '金华市', '321000', '11');
INSERT INTO `tb_city` VALUES ('94', '衢州市', '324000', '11');
INSERT INTO `tb_city` VALUES ('95', '舟山市', '316000', '11');
INSERT INTO `tb_city` VALUES ('96', '台州市', '318000', '11');
INSERT INTO `tb_city` VALUES ('97', '丽水市', '323000', '11');
INSERT INTO `tb_city` VALUES ('98', '合肥市', '230000', '12');
INSERT INTO `tb_city` VALUES ('99', '芜湖市', '241000', '12');
INSERT INTO `tb_city` VALUES ('100', '蚌埠市', '233000', '12');
INSERT INTO `tb_city` VALUES ('101', '淮南市', '232000', '12');
INSERT INTO `tb_city` VALUES ('102', '马鞍山市', '243000', '12');
INSERT INTO `tb_city` VALUES ('103', '淮北市', '235000', '12');
INSERT INTO `tb_city` VALUES ('104', '铜陵市', '244000', '12');
INSERT INTO `tb_city` VALUES ('105', '安庆市', '246000', '12');
INSERT INTO `tb_city` VALUES ('106', '黄山市', '242700', '12');
INSERT INTO `tb_city` VALUES ('107', '滁州市', '239000', '12');
INSERT INTO `tb_city` VALUES ('108', '阜阳市', '236100', '12');
INSERT INTO `tb_city` VALUES ('109', '宿州市', '234100', '12');
INSERT INTO `tb_city` VALUES ('110', '巢湖市', '238000', '12');
INSERT INTO `tb_city` VALUES ('111', '六安市', '237000', '12');
INSERT INTO `tb_city` VALUES ('112', '亳州市', '236800', '12');
INSERT INTO `tb_city` VALUES ('113', '池州市', '247100', '12');
INSERT INTO `tb_city` VALUES ('114', '宣城市', '366000', '12');
INSERT INTO `tb_city` VALUES ('115', '福州市', '350000', '13');
INSERT INTO `tb_city` VALUES ('116', '厦门市', '361000', '13');
INSERT INTO `tb_city` VALUES ('117', '莆田市', '351100', '13');
INSERT INTO `tb_city` VALUES ('118', '三明市', '365000', '13');
INSERT INTO `tb_city` VALUES ('119', '泉州市', '362000', '13');
INSERT INTO `tb_city` VALUES ('120', '漳州市', '363000', '13');
INSERT INTO `tb_city` VALUES ('121', '南平市', '353000', '13');
INSERT INTO `tb_city` VALUES ('122', '龙岩市', '364000', '13');
INSERT INTO `tb_city` VALUES ('123', '宁德市', '352100', '13');
INSERT INTO `tb_city` VALUES ('124', '南昌市', '330000', '14');
INSERT INTO `tb_city` VALUES ('125', '景德镇市', '333000', '14');
INSERT INTO `tb_city` VALUES ('126', '萍乡市', '337000', '14');
INSERT INTO `tb_city` VALUES ('127', '九江市', '332000', '14');
INSERT INTO `tb_city` VALUES ('128', '新余市', '338000', '14');
INSERT INTO `tb_city` VALUES ('129', '鹰潭市', '335000', '14');
INSERT INTO `tb_city` VALUES ('130', '赣州市', '341000', '14');
INSERT INTO `tb_city` VALUES ('131', '吉安市', '343000', '14');
INSERT INTO `tb_city` VALUES ('132', '宜春市', '336000', '14');
INSERT INTO `tb_city` VALUES ('133', '抚州市', '332900', '14');
INSERT INTO `tb_city` VALUES ('134', '上饶市', '334000', '14');
INSERT INTO `tb_city` VALUES ('135', '济南市', '250000', '15');
INSERT INTO `tb_city` VALUES ('136', '青岛市', '266000', '15');
INSERT INTO `tb_city` VALUES ('137', '淄博市', '255000', '15');
INSERT INTO `tb_city` VALUES ('138', '枣庄市', '277100', '15');
INSERT INTO `tb_city` VALUES ('139', '东营市', '257000', '15');
INSERT INTO `tb_city` VALUES ('140', '烟台市', '264000', '15');
INSERT INTO `tb_city` VALUES ('141', '潍坊市', '261000', '15');
INSERT INTO `tb_city` VALUES ('142', '济宁市', '272100', '15');
INSERT INTO `tb_city` VALUES ('143', '泰安市', '271000', '15');
INSERT INTO `tb_city` VALUES ('144', '威海市', '265700', '15');
INSERT INTO `tb_city` VALUES ('145', '日照市', '276800', '15');
INSERT INTO `tb_city` VALUES ('146', '莱芜市', '271100', '15');
INSERT INTO `tb_city` VALUES ('147', '临沂市', '276000', '15');
INSERT INTO `tb_city` VALUES ('148', '德州市', '253000', '15');
INSERT INTO `tb_city` VALUES ('149', '聊城市', '252000', '15');
INSERT INTO `tb_city` VALUES ('150', '滨州市', '256600', '15');
INSERT INTO `tb_city` VALUES ('151', '荷泽市', '255000', '15');
INSERT INTO `tb_city` VALUES ('152', '郑州市', '450000', '16');
INSERT INTO `tb_city` VALUES ('153', '开封市', '475000', '16');
INSERT INTO `tb_city` VALUES ('154', '洛阳市', '471000', '16');
INSERT INTO `tb_city` VALUES ('155', '平顶山市', '467000', '16');
INSERT INTO `tb_city` VALUES ('156', '安阳市', '454900', '16');
INSERT INTO `tb_city` VALUES ('157', '鹤壁市', '456600', '16');
INSERT INTO `tb_city` VALUES ('158', '新乡市', '453000', '16');
INSERT INTO `tb_city` VALUES ('159', '焦作市', '454100', '16');
INSERT INTO `tb_city` VALUES ('160', '濮阳市', '457000', '16');
INSERT INTO `tb_city` VALUES ('161', '许昌市', '461000', '16');
INSERT INTO `tb_city` VALUES ('162', '漯河市', '462000', '16');
INSERT INTO `tb_city` VALUES ('163', '三门峡市', '472000', '16');
INSERT INTO `tb_city` VALUES ('164', '南阳市', '473000', '16');
INSERT INTO `tb_city` VALUES ('165', '商丘市', '476000', '16');
INSERT INTO `tb_city` VALUES ('166', '信阳市', '464000', '16');
INSERT INTO `tb_city` VALUES ('167', '周口市', '466000', '16');
INSERT INTO `tb_city` VALUES ('168', '驻马店市', '463000', '16');
INSERT INTO `tb_city` VALUES ('169', '武汉市', '430000', '17');
INSERT INTO `tb_city` VALUES ('170', '黄石市', '435000', '17');
INSERT INTO `tb_city` VALUES ('171', '十堰市', '442000', '17');
INSERT INTO `tb_city` VALUES ('172', '宜昌市', '443000', '17');
INSERT INTO `tb_city` VALUES ('173', '襄樊市', '441000', '17');
INSERT INTO `tb_city` VALUES ('174', '鄂州市', '436000', '17');
INSERT INTO `tb_city` VALUES ('175', '荆门市', '448000', '17');
INSERT INTO `tb_city` VALUES ('176', '孝感市', '432100', '17');
INSERT INTO `tb_city` VALUES ('177', '荆州市', '434000', '17');
INSERT INTO `tb_city` VALUES ('178', '黄冈市', '438000', '17');
INSERT INTO `tb_city` VALUES ('179', '咸宁市', '437000', '17');
INSERT INTO `tb_city` VALUES ('180', '随州市', '441300', '17');
INSERT INTO `tb_city` VALUES ('181', '恩施土家族苗族自治州', '445000', '17');
INSERT INTO `tb_city` VALUES ('182', '神农架', '442400', '17');
INSERT INTO `tb_city` VALUES ('183', '长沙市', '410000', '18');
INSERT INTO `tb_city` VALUES ('184', '株洲市', '412000', '18');
INSERT INTO `tb_city` VALUES ('185', '湘潭市', '411100', '18');
INSERT INTO `tb_city` VALUES ('186', '衡阳市', '421000', '18');
INSERT INTO `tb_city` VALUES ('187', '邵阳市', '422000', '18');
INSERT INTO `tb_city` VALUES ('188', '岳阳市', '414000', '18');
INSERT INTO `tb_city` VALUES ('189', '常德市', '415000', '18');
INSERT INTO `tb_city` VALUES ('190', '张家界市', '427000', '18');
INSERT INTO `tb_city` VALUES ('191', '益阳市', '413000', '18');
INSERT INTO `tb_city` VALUES ('192', '郴州市', '423000', '18');
INSERT INTO `tb_city` VALUES ('193', '永州市', '425000', '18');
INSERT INTO `tb_city` VALUES ('194', '怀化市', '418000', '18');
INSERT INTO `tb_city` VALUES ('195', '娄底市', '417000', '18');
INSERT INTO `tb_city` VALUES ('196', '湘西土家族苗族自治州', '416000', '18');
INSERT INTO `tb_city` VALUES ('197', '广州市', '510000', '19');
INSERT INTO `tb_city` VALUES ('198', '韶关市', '521000', '19');
INSERT INTO `tb_city` VALUES ('199', '深圳市', '518000', '19');
INSERT INTO `tb_city` VALUES ('200', '珠海市', '519000', '19');
INSERT INTO `tb_city` VALUES ('201', '汕头市', '515000', '19');
INSERT INTO `tb_city` VALUES ('202', '佛山市', '528000', '19');
INSERT INTO `tb_city` VALUES ('203', '江门市', '529000', '19');
INSERT INTO `tb_city` VALUES ('204', '湛江市', '524000', '19');
INSERT INTO `tb_city` VALUES ('205', '茂名市', '525000', '19');
INSERT INTO `tb_city` VALUES ('206', '肇庆市', '526000', '19');
INSERT INTO `tb_city` VALUES ('207', '惠州市', '516000', '19');
INSERT INTO `tb_city` VALUES ('208', '梅州市', '514000', '19');
INSERT INTO `tb_city` VALUES ('209', '汕尾市', '516600', '19');
INSERT INTO `tb_city` VALUES ('210', '河源市', '517000', '19');
INSERT INTO `tb_city` VALUES ('211', '阳江市', '529500', '19');
INSERT INTO `tb_city` VALUES ('212', '清远市', '511500', '19');
INSERT INTO `tb_city` VALUES ('213', '东莞市', '511700', '19');
INSERT INTO `tb_city` VALUES ('214', '中山市', '528400', '19');
INSERT INTO `tb_city` VALUES ('215', '潮州市', '515600', '19');
INSERT INTO `tb_city` VALUES ('216', '揭阳市', '522000', '19');
INSERT INTO `tb_city` VALUES ('217', '云浮市', '527300', '19');
INSERT INTO `tb_city` VALUES ('218', '南宁市', '530000', '20');
INSERT INTO `tb_city` VALUES ('219', '柳州市', '545000', '20');
INSERT INTO `tb_city` VALUES ('220', '桂林市', '541000', '20');
INSERT INTO `tb_city` VALUES ('221', '梧州市', '543000', '20');
INSERT INTO `tb_city` VALUES ('222', '北海市', '536000', '20');
INSERT INTO `tb_city` VALUES ('223', '防城港市', '538000', '20');
INSERT INTO `tb_city` VALUES ('224', '钦州市', '535000', '20');
INSERT INTO `tb_city` VALUES ('225', '贵港市', '537100', '20');
INSERT INTO `tb_city` VALUES ('226', '玉林市', '537000', '20');
INSERT INTO `tb_city` VALUES ('227', '百色市', '533000', '20');
INSERT INTO `tb_city` VALUES ('228', '贺州市', '542800', '20');
INSERT INTO `tb_city` VALUES ('229', '河池市', '547000', '20');
INSERT INTO `tb_city` VALUES ('230', '来宾市', '546100', '20');
INSERT INTO `tb_city` VALUES ('231', '崇左市', '532200', '20');
INSERT INTO `tb_city` VALUES ('232', '海口市', '570000', '21');
INSERT INTO `tb_city` VALUES ('233', '三亚市', '572000', '21');
INSERT INTO `tb_city` VALUES ('234', '重庆市', '400000', '22');
INSERT INTO `tb_city` VALUES ('235', '成都市', '610000', '23');
INSERT INTO `tb_city` VALUES ('236', '自贡市', '643000', '23');
INSERT INTO `tb_city` VALUES ('237', '攀枝花市', '617000', '23');
INSERT INTO `tb_city` VALUES ('238', '泸州市', '646100', '23');
INSERT INTO `tb_city` VALUES ('239', '德阳市', '618000', '23');
INSERT INTO `tb_city` VALUES ('240', '绵阳市', '621000', '23');
INSERT INTO `tb_city` VALUES ('241', '广元市', '628000', '23');
INSERT INTO `tb_city` VALUES ('242', '遂宁市', '629000', '23');
INSERT INTO `tb_city` VALUES ('243', '内江市', '641000', '23');
INSERT INTO `tb_city` VALUES ('244', '乐山市', '614000', '23');
INSERT INTO `tb_city` VALUES ('245', '南充市', '637000', '23');
INSERT INTO `tb_city` VALUES ('246', '眉山市', '612100', '23');
INSERT INTO `tb_city` VALUES ('247', '宜宾市', '644000', '23');
INSERT INTO `tb_city` VALUES ('248', '广安市', '638000', '23');
INSERT INTO `tb_city` VALUES ('249', '达州市', '635000', '23');
INSERT INTO `tb_city` VALUES ('250', '雅安市', '625000', '23');
INSERT INTO `tb_city` VALUES ('251', '巴中市', '635500', '23');
INSERT INTO `tb_city` VALUES ('252', '资阳市', '641300', '23');
INSERT INTO `tb_city` VALUES ('253', '阿坝藏族羌族自治州', '624600', '23');
INSERT INTO `tb_city` VALUES ('254', '甘孜藏族自治州', '626000', '23');
INSERT INTO `tb_city` VALUES ('255', '凉山彝族自治州', '615000', '23');
INSERT INTO `tb_city` VALUES ('256', '贵阳市', '55000', '24');
INSERT INTO `tb_city` VALUES ('257', '六盘水市', '553000', '24');
INSERT INTO `tb_city` VALUES ('258', '遵义市', '563000', '24');
INSERT INTO `tb_city` VALUES ('259', '安顺市', '561000', '24');
INSERT INTO `tb_city` VALUES ('260', '铜仁地区', '554300', '24');
INSERT INTO `tb_city` VALUES ('261', '黔西南布依族苗族自治州', '551500', '24');
INSERT INTO `tb_city` VALUES ('262', '毕节地区', '551700', '24');
INSERT INTO `tb_city` VALUES ('263', '黔东南苗族侗族自治州', '551500', '24');
INSERT INTO `tb_city` VALUES ('264', '黔南布依族苗族自治州', '550100', '24');
INSERT INTO `tb_city` VALUES ('265', '昆明市', '650000', '25');
INSERT INTO `tb_city` VALUES ('266', '曲靖市', '655000', '25');
INSERT INTO `tb_city` VALUES ('267', '玉溪市', '653100', '25');
INSERT INTO `tb_city` VALUES ('268', '保山市', '678000', '25');
INSERT INTO `tb_city` VALUES ('269', '昭通市', '657000', '25');
INSERT INTO `tb_city` VALUES ('270', '丽江市', '674100', '25');
INSERT INTO `tb_city` VALUES ('271', '思茅市', '665000', '25');
INSERT INTO `tb_city` VALUES ('272', '临沧市', '677000', '25');
INSERT INTO `tb_city` VALUES ('273', '楚雄彝族自治州', '675000', '25');
INSERT INTO `tb_city` VALUES ('274', '红河哈尼族彝族自治州', '654400', '25');
INSERT INTO `tb_city` VALUES ('275', '文山壮族苗族自治州', '663000', '25');
INSERT INTO `tb_city` VALUES ('276', '西双版纳傣族自治州', '666200', '25');
INSERT INTO `tb_city` VALUES ('277', '大理白族自治州', '671000', '25');
INSERT INTO `tb_city` VALUES ('278', '德宏傣族景颇族自治州', '678400', '25');
INSERT INTO `tb_city` VALUES ('279', '怒江傈僳族自治州', '671400', '25');
INSERT INTO `tb_city` VALUES ('280', '迪庆藏族自治州', '674400', '25');
INSERT INTO `tb_city` VALUES ('281', '拉萨市', '850000', '26');
INSERT INTO `tb_city` VALUES ('282', '昌都地区', '854000', '26');
INSERT INTO `tb_city` VALUES ('283', '山南地区', '856000', '26');
INSERT INTO `tb_city` VALUES ('284', '日喀则地区', '857000', '26');
INSERT INTO `tb_city` VALUES ('285', '那曲地区', '852000', '26');
INSERT INTO `tb_city` VALUES ('286', '阿里地区', '859100', '26');
INSERT INTO `tb_city` VALUES ('287', '林芝地区', '860100', '26');
INSERT INTO `tb_city` VALUES ('288', '西安市', '710000', '27');
INSERT INTO `tb_city` VALUES ('289', '铜川市', '727000', '27');
INSERT INTO `tb_city` VALUES ('290', '宝鸡市', '721000', '27');
INSERT INTO `tb_city` VALUES ('291', '咸阳市', '712000', '27');
INSERT INTO `tb_city` VALUES ('292', '渭南市', '714000', '27');
INSERT INTO `tb_city` VALUES ('293', '延安市', '716000', '27');
INSERT INTO `tb_city` VALUES ('294', '汉中市', '723000', '27');
INSERT INTO `tb_city` VALUES ('295', '榆林市', '719000', '27');
INSERT INTO `tb_city` VALUES ('296', '安康市', '725000', '27');
INSERT INTO `tb_city` VALUES ('297', '商洛市', '711500', '27');
INSERT INTO `tb_city` VALUES ('298', '兰州市', '730000', '28');
INSERT INTO `tb_city` VALUES ('299', '嘉峪关市', '735100', '28');
INSERT INTO `tb_city` VALUES ('300', '金昌市', '737100', '28');
INSERT INTO `tb_city` VALUES ('301', '白银市', '730900', '28');
INSERT INTO `tb_city` VALUES ('302', '天水市', '741000', '28');
INSERT INTO `tb_city` VALUES ('303', '武威市', '733000', '28');
INSERT INTO `tb_city` VALUES ('304', '张掖市', '734000', '28');
INSERT INTO `tb_city` VALUES ('305', '平凉市', '744000', '28');
INSERT INTO `tb_city` VALUES ('306', '酒泉市', '735000', '28');
INSERT INTO `tb_city` VALUES ('307', '庆阳市', '744500', '28');
INSERT INTO `tb_city` VALUES ('308', '定西市', '743000', '28');
INSERT INTO `tb_city` VALUES ('309', '陇南市', '742100', '28');
INSERT INTO `tb_city` VALUES ('310', '临夏回族自治州', '731100', '28');
INSERT INTO `tb_city` VALUES ('311', '甘南藏族自治州', '747000', '28');
INSERT INTO `tb_city` VALUES ('312', '西宁市', '810000', '29');
INSERT INTO `tb_city` VALUES ('313', '海东地区', '810600', '29');
INSERT INTO `tb_city` VALUES ('314', '海北藏族自治州', '810300', '29');
INSERT INTO `tb_city` VALUES ('315', '黄南藏族自治州', '811300', '29');
INSERT INTO `tb_city` VALUES ('316', '海南藏族自治州', '813000', '29');
INSERT INTO `tb_city` VALUES ('317', '果洛藏族自治州', '814000', '29');
INSERT INTO `tb_city` VALUES ('318', '玉树藏族自治州', '815000', '29');
INSERT INTO `tb_city` VALUES ('319', '海西蒙古族藏族自治州', '817000', '29');
INSERT INTO `tb_city` VALUES ('320', '银川市', '750000', '30');
INSERT INTO `tb_city` VALUES ('321', '石嘴山市', '753000', '30');
INSERT INTO `tb_city` VALUES ('322', '吴忠市', '751100', '30');
INSERT INTO `tb_city` VALUES ('323', '固原市', '756000', '30');
INSERT INTO `tb_city` VALUES ('324', '中卫市', '751700', '30');
INSERT INTO `tb_city` VALUES ('325', '乌鲁木齐市', '830000', '31');
INSERT INTO `tb_city` VALUES ('326', '克拉玛依市', '834000', '31');
INSERT INTO `tb_city` VALUES ('327', '吐鲁番地区', '838000', '31');
INSERT INTO `tb_city` VALUES ('328', '哈密地区', '839000', '31');
INSERT INTO `tb_city` VALUES ('329', '昌吉回族自治州', '831100', '31');
INSERT INTO `tb_city` VALUES ('330', '博尔塔拉蒙古自治州', '833400', '31');
INSERT INTO `tb_city` VALUES ('331', '巴音郭楞蒙古自治州', '841000', '31');
INSERT INTO `tb_city` VALUES ('332', '阿克苏地区', '843000', '31');
INSERT INTO `tb_city` VALUES ('333', '克孜勒苏柯尔克孜自治州', '835600', '31');
INSERT INTO `tb_city` VALUES ('334', '喀什地区', '844000', '31');
INSERT INTO `tb_city` VALUES ('335', '和田地区', '848000', '31');
INSERT INTO `tb_city` VALUES ('336', '伊犁哈萨克自治州', '833200', '31');
INSERT INTO `tb_city` VALUES ('337', '塔城地区', '834700', '31');
INSERT INTO `tb_city` VALUES ('338', '阿勒泰地区', '836500', '31');
INSERT INTO `tb_city` VALUES ('339', '石河子市', '832000', '31');
INSERT INTO `tb_city` VALUES ('340', '阿拉尔市', '843300', '31');
INSERT INTO `tb_city` VALUES ('341', '图木舒克市', '843900', '31');
INSERT INTO `tb_city` VALUES ('342', '五家渠市', '831300', '31');
INSERT INTO `tb_city` VALUES ('343', '香港特别行政区', '000000', '32');
INSERT INTO `tb_city` VALUES ('344', '澳门特别行政区', '000000', '33');
INSERT INTO `tb_city` VALUES ('345', '台湾省', '000000', '34');

-- ----------------------------
-- Table structure for tb_comments
-- ----------------------------
DROP TABLE IF EXISTS `tb_comments`;
CREATE TABLE `tb_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `content` varchar(1000) DEFAULT NULL COMMENT '评价内容',
  `star` smallint(6) DEFAULT NULL COMMENT '星级',
  `is_anon` smallint(6) DEFAULT NULL COMMENT '是否匿名',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  PRIMARY KEY (`comment_id`),
  KEY `FK_order_comments` (`order_id`),
  CONSTRAINT `FK_order_comments` FOREIGN KEY (`order_id`) REFERENCES `tb_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of tb_comments
-- ----------------------------

-- ----------------------------
-- Table structure for tb_goods
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `category_id` bigint(20) DEFAULT '3' COMMENT '分类ID',
  `name` varchar(200) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL COMMENT '价格',
  `newprice` decimal(10,2) DEFAULT NULL COMMENT '新货价格',
  `status` smallint(6) NOT NULL COMMENT '状态',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `goods_address` varchar(200) DEFAULT '' COMMENT '商品地址',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  `description` varchar(200) DEFAULT NULL COMMENT '商品描述',
  `decoration` text COMMENT '商品描述',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('1', '1', '7', '数据结构与算法分析', '55.00', '98.00', '0', '2018-04-25 14:03:50', '茶花路', '2018-04-03 14:03:50', '本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够', '<h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n<img src = \"http://192.168.1.100:8080/aid-university/image/127d6f85a32d451d91974985ca02bd4e.jpg\" />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p>');
INSERT INTO `tb_goods` VALUES ('2', '1', '7', '操作系统', '52.00', '100.00', '1', '2018-04-03 14:03:54', '考上东风路', '2018-04-03 14:03:50', '本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够', '<h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n<h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n<img src = \"http://yiyehu.tech:8080/aid-university/image/127d6f85a32d451d91974985ca02bd4e.jpg\" />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p>\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br /><img :src = \"http://192.168.1.100:8080/aid-university/image/127d6f85a32d451d91974985ca02bd4e.jpg\">\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p>');
INSERT INTO `tb_goods` VALUES ('3', '2', '7', '计算机网络', '30.00', '66.00', '2', '2018-04-12 14:03:58', '据说东风路', '2018-04-03 14:03:50', '计算机网络计算机网络计算机网络计算机网络计算机网络计算机网络计算机网络计算机网络计算机网络计算机网络', '<h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n<img src = \"http://yiyehu.tech:8080/aid-university/image/127d6f85a32d451d91974985ca02bd4e.jpg\" />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p>');
INSERT INTO `tb_goods` VALUES ('4', '2', '8', '计算机网络', '30.00', '66.00', '2', '2018-04-12 14:03:58', '文峰山路', '2018-04-03 14:03:50', '计算机网络', '<h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p>');
INSERT INTO `tb_goods` VALUES ('5', '1', '9', '操作系统', '234.00', '100.00', '0', '2018-04-12 14:03:58', '上丰路', '2018-04-03 14:03:50', '操作系统', '<h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br /><img :src = \"http://192.168.1.100:8080/aid-university/image/127d6f85a32d451d91974985ca02bd4e.jpg\">\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p>');
INSERT INTO `tb_goods` VALUES ('6', '1', '7', '操作系统', '43.00', '100.00', '0', '2018-04-12 20:04:07', '上丰路', '2018-04-03 14:03:50', '操作系统', '<h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br /><img :src = \"http://192.168.1.100:8080/aid-university/image/127d6f85a32d451d91974985ca02bd4e.jpg\">\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p>');
INSERT INTO `tb_goods` VALUES ('7', '1', '7', '操作系统', '52324.00', '100.00', '1', '2018-04-17 14:03:58', '惊世毒妃河路', '2018-04-03 14:03:50', '操作系统', '<h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br /><img :src = \"http://192.168.1.100:8080/aid-university/image/127d6f85a32d451d91974985ca02bd4e.jpg\">\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p>');
INSERT INTO `tb_goods` VALUES ('8', '3', '8', '操作系统', '553.00', '100.00', '1', '2018-04-12 14:03:58', '水电费路', '2018-04-03 14:03:50', '操作系统', '<h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br /><img :src = \"baseURL+\'image/127d6f85a32d451d91974985ca02bd4e.jpg\'\">\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br /><img :src = \"http://192.168.1.100:8080/aid-university/image/127d6f85a32d451d91974985ca02bd4e.jpg\">\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p>');
INSERT INTO `tb_goods` VALUES ('9', '1', '7', '操作系统', '124.00', '100.00', '1', '2018-04-09 14:03:58', '惊世毒妃河路', '2018-04-03 14:03:50', '操作系统', '<h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br /><img :src = \"http://192.168.1.100:8080/aid-university/image/127d6f85a32d451d91974985ca02bd4e.jpg\">\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p>');
INSERT INTO `tb_goods` VALUES ('10', '1', '7', '操作系统', '78.00', '100.00', '2', '2018-04-16 14:03:58', '惊世毒妃河路', '2018-04-03 14:03:50', '操作系统', '<h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br /><img :src = \"baseURL+\'image/127d6f85a32d451d91974985ca02bd4e.jpg\'\">\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p><h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br /><img :src = \"http://192.168.1.100:8080/aid-university/image/127d6f85a32d451d91974985ca02bd4e.jpg\">\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p>');
INSERT INTO `tb_goods` VALUES ('11', '1', '8', '操作系统', '4734636.00', '100.00', '1', '2018-04-09 14:03:58', '惊世毒妃河路', '2018-04-03 14:03:50', '操作系统', '<h1><big><strong>目录</strong></big></h1>\r\n\r\n<p>第0章 读者与教师指南 1<br />\r\n　　0.1 本书概述 1<br />\r\n　　0.2 实例系统 1<br />\r\n　　0.3 读者和教师的路线图 2<br />\r\n　　0.4 互联网和网站资源 3<br />\r\n第一部分 背景知识<br />\r\n第1章 计算机系统概述 6<br />\r\n　　1.1 基本构成 6<br />\r\n　　1.2 微处理器的发展 7<br />\r\n　　1.3 指令的执行 8<br />\r\n　　1.4 中断 10<br />\r\n1.4.1 中断和指令周期 11<br />\r\n1.4.2 中断处理 12<br />\r\n1.4.3 多个中断 14</p>\r\n<h1><strong>编辑推荐</strong></h1>\r\n\r\n<p>本书的目的是使读者熟悉现代操作系统的设计原理和实现问题，因此单纯讲述概念和理论远远不够。为说明这些概念，同时将它们与真实世界中不得不做出的设计选择相关联，本书选择了4个操作系统作为实例：<br />\r\n◆ Windows 8：用于个人计算机、工作站和服务器的多任务操作系统。它融入了很多操作系统发展的*技术。此外，Windows是*早采用面向对象原理进行设计的重要商业操作系统之一。本书涵盖了Windows*版本所采用的技术，包括Windows 8。<br />\r\n◆ Android：Android是为嵌入式设备特别是手机量身定做的，主要是为了满足嵌入式环境的独特需求。本书介绍了Android的内核信息。<br />\r\n◆ UNIX：*初是为小型计算机设计的多用户操作系统，但后来广泛用于从微机到超级计算机的各种机器中。本书采用若干版本的UNIX作为实例。FreeBSD融合了很多的现代特征，是一个广泛应用的操作系统；Solaris是一个广泛应用的商业版UNIX系统。<br />\r\n◆ Linux：一个非常普及且源代码开放的UNIX版本。<br />\r\n选择这些操作系统的原因是它们之间存在相关性，同时它们也具有代表性。关于这些实例操作系统的讨论贯穿全书，而非集中于某一章或附录部分。因此在讨论并发性时，会描述每个实例操作系统的并发机制，并探讨各种设计选择的动机。采用真实的例子可加深读者对相关章节中设计概念的理解。为方便起见，读者也可在在线文档中查阅所有实例操作系统的资料。&nbsp;</p>');

-- ----------------------------
-- Table structure for tb_goods_images
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_images`;
CREATE TABLE `tb_goods_images` (
  `good_image_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品图片ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `name` varchar(50) DEFAULT NULL COMMENT '图片名称',
  `type` varchar(20) DEFAULT NULL COMMENT '图片类型',
  `local_path` varchar(200) DEFAULT NULL COMMENT '图片缓存地址',
  `path_key` varchar(200) DEFAULT NULL COMMENT '云存储key',
  PRIMARY KEY (`good_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='商品图片';

-- ----------------------------
-- Records of tb_goods_images
-- ----------------------------
INSERT INTO `tb_goods_images` VALUES ('1', '1', '操作系统.jpg', 'image/jpg', 'image/b4989d9acad249caabe41b82bd873eed.jpg', '20180422/b4989d9acad249caabe41b82bd873eed.jpg');
INSERT INTO `tb_goods_images` VALUES ('2', '2', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');
INSERT INTO `tb_goods_images` VALUES ('3', '3', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');
INSERT INTO `tb_goods_images` VALUES ('4', '4', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');
INSERT INTO `tb_goods_images` VALUES ('5', '5', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');
INSERT INTO `tb_goods_images` VALUES ('6', '6', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');
INSERT INTO `tb_goods_images` VALUES ('7', '7', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');
INSERT INTO `tb_goods_images` VALUES ('8', '8', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');
INSERT INTO `tb_goods_images` VALUES ('9', '9', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');
INSERT INTO `tb_goods_images` VALUES ('10', '10', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');
INSERT INTO `tb_goods_images` VALUES ('11', '11', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');
INSERT INTO `tb_goods_images` VALUES ('12', '2', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');
INSERT INTO `tb_goods_images` VALUES ('13', '2', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');
INSERT INTO `tb_goods_images` VALUES ('14', '3', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');
INSERT INTO `tb_goods_images` VALUES ('15', '4', '操作系统.jpg', 'image/jpg', 'image/127d6f85a32d451d91974985ca02bd4e.jpg', '20180422/127d6f85a32d451d91974985ca02bd4e.jpg');

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message` (
  `message_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '留言的上级ID',
  `content` varchar(1000) DEFAULT NULL COMMENT '留言内容',
  `anon` smallint(6) DEFAULT NULL COMMENT '是否匿名',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `user_id` char(10) NOT NULL DEFAULT '0' COMMENT '留言人ID',
  `user_name` varchar(30) DEFAULT NULL COMMENT '留言人姓名',
  `talk_to` bigint(20) NOT NULL DEFAULT '0' COMMENT '对面聊天人的ID',
  `talk_to_name` varchar(30) DEFAULT NULL COMMENT '对面聊天人的姓名',
  `category_id` bigint(20) NOT NULL DEFAULT '3' COMMENT '消息类型ID',
  `category_message_id` bigint(20) DEFAULT NULL COMMENT '消息类型对应的服务ID',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='留言';

-- ----------------------------
-- Records of tb_message
-- ----------------------------
INSERT INTO `tb_message` VALUES ('1', '0', '你好啊', '0', '2018-04-10 16:23:05', '1', 'mark', '2', 'usern', '3', '1');
INSERT INTO `tb_message` VALUES ('2', '0', '你也好啊', '0', '2018-04-05 16:23:53', '2', 'usern', '1', 'mark', '3', '1');
INSERT INTO `tb_message` VALUES ('3', '0', '有什么要问的没？', '0', '2018-04-05 16:23:53', '1', 'mark', '3', 'moies', '3', '1');
INSERT INTO `tb_message` VALUES ('4', '0', '你这东西好不好啊', '0', '2018-04-05 16:23:53', '4', 'pinnaoi', '1', 'mark', '3', '1');
INSERT INTO `tb_message` VALUES ('5', '0', '你好啊', '0', '2018-04-10 16:23:05', '1', 'mark', '2', 'usern', '3', '1');
INSERT INTO `tb_message` VALUES ('6', '0', '你也好啊', '0', '2018-04-05 16:23:53', '2', 'usern', '1', 'mark', '3', '1');
INSERT INTO `tb_message` VALUES ('7', '0', '有什么要问的没？', '0', '2018-04-05 16:23:53', '1', 'mark', '4', 'moies', '3', '1');
INSERT INTO `tb_message` VALUES ('8', '0', '你这东西好不好啊', '0', '2018-04-05 16:23:53', '1', 'pinnaoi', '5', 'mark', '3', '1');
INSERT INTO `tb_message` VALUES ('9', '0', '你好啊', '0', '2018-04-10 16:23:05', '1', 'mark', '6', 'usern', '3', '1');
INSERT INTO `tb_message` VALUES ('10', '0', '你也好啊', '0', '2018-04-05 16:23:53', '1', 'usern', '7', 'mark', '3', '1');
INSERT INTO `tb_message` VALUES ('11', '0', '有什么要问的没？', '0', '2018-04-05 16:23:53', '1', 'mark', '8', 'moies', '3', '1');
INSERT INTO `tb_message` VALUES ('12', '0', '你这东西好不好啊', '0', '2018-04-05 16:23:53', '1', 'pinnaoi', '9', 'mark', '3', '1');
INSERT INTO `tb_message` VALUES ('13', '0', '你好啊', '0', '2018-04-10 16:23:05', '1', 'mark', '10', 'usern', '3', '1');
INSERT INTO `tb_message` VALUES ('14', '0', '你也好啊', '0', '2018-04-05 16:23:53', '1', 'usern', '10', 'mark', '3', '1');
INSERT INTO `tb_message` VALUES ('15', '0', '有什么要问的没？', '0', '2018-04-05 16:23:53', '1', 'mark', '11', 'moies', '3', '1');
INSERT INTO `tb_message` VALUES ('16', '0', '你这东西好不好啊', '0', '2018-04-05 16:23:53', '1', 'pinnaoi', '12', 'mark', '3', '1');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `comment_id` bigint(20) DEFAULT NULL COMMENT '评价ID',
  `address_id` bigint(20) DEFAULT NULL COMMENT '收货地址ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `is_comment` smallint(6) DEFAULT NULL COMMENT '是否评价',
  `status` smallint(6) DEFAULT NULL COMMENT '订单状态',
  `create_time` datetime NOT NULL COMMENT '下单时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `goods_money` int(11) DEFAULT NULL COMMENT '商品金额',
  `deliver_type` smallint(6) DEFAULT NULL COMMENT '收货方式',
  `deliver_money` int(11) DEFAULT NULL COMMENT '快递费用',
  `total_money` int(11) DEFAULT NULL COMMENT '订单总金额',
  `real_total_money` int(11) DEFAULT NULL COMMENT '实际订单总金额',
  `payType` smallint(6) DEFAULT '0' COMMENT '付费方式',
  `payFrom` smallint(6) DEFAULT '0' COMMENT '支付来源',
  `user_name` varchar(30) DEFAULT NULL COMMENT '收货人姓名',
  `user_adress` varchar(50) DEFAULT NULL COMMENT '收货人地址',
  `user_mobile` varchar(20) DEFAULT NULL COMMENT '收货人手机',
  PRIMARY KEY (`order_id`),
  KEY `FK_Relationship_7` (`comment_id`),
  KEY `FK_goods_many` (`goods_id`),
  KEY `FK_order_deliver_address` (`address_id`),
  KEY `FK_tb_user_order` (`user_id`),
  CONSTRAINT `FK_Relationship_7` FOREIGN KEY (`comment_id`) REFERENCES `tb_comments` (`comment_id`),
  CONSTRAINT `FK_goods_many` FOREIGN KEY (`goods_id`) REFERENCES `tb_goods` (`goods_id`),
  CONSTRAINT `FK_order_deliver_address` FOREIGN KEY (`address_id`) REFERENCES `tb_user_address` (`address_id`),
  CONSTRAINT `FK_tb_user_order` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of tb_order
-- ----------------------------

-- ----------------------------
-- Table structure for tb_province
-- ----------------------------
DROP TABLE IF EXISTS `tb_province`;
CREATE TABLE `tb_province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '省份ID',
  `name` varchar(30) DEFAULT NULL COMMENT '省份名称',
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='省份';

-- ----------------------------
-- Records of tb_province
-- ----------------------------
INSERT INTO `tb_province` VALUES ('1', '北京市');
INSERT INTO `tb_province` VALUES ('2', '天津市');
INSERT INTO `tb_province` VALUES ('3', '河北省');
INSERT INTO `tb_province` VALUES ('4', '山西省');
INSERT INTO `tb_province` VALUES ('5', '内蒙古自治区');
INSERT INTO `tb_province` VALUES ('6', '辽宁省');
INSERT INTO `tb_province` VALUES ('7', '吉林省');
INSERT INTO `tb_province` VALUES ('8', '黑龙江省');
INSERT INTO `tb_province` VALUES ('9', '上海市');
INSERT INTO `tb_province` VALUES ('10', '江苏省');
INSERT INTO `tb_province` VALUES ('11', '浙江省');
INSERT INTO `tb_province` VALUES ('12', '安徽省');
INSERT INTO `tb_province` VALUES ('13', '福建省');
INSERT INTO `tb_province` VALUES ('14', '江西省');
INSERT INTO `tb_province` VALUES ('15', '山东省');
INSERT INTO `tb_province` VALUES ('16', '河南省');
INSERT INTO `tb_province` VALUES ('17', '湖北省');
INSERT INTO `tb_province` VALUES ('18', '湖南省');
INSERT INTO `tb_province` VALUES ('19', '广东省');
INSERT INTO `tb_province` VALUES ('20', '广西壮族自治区');
INSERT INTO `tb_province` VALUES ('21', '海南省');
INSERT INTO `tb_province` VALUES ('22', '重庆市');
INSERT INTO `tb_province` VALUES ('23', '四川省');
INSERT INTO `tb_province` VALUES ('24', '贵州省');
INSERT INTO `tb_province` VALUES ('25', '云南省');
INSERT INTO `tb_province` VALUES ('26', '西藏自治区');
INSERT INTO `tb_province` VALUES ('27', '陕西省');
INSERT INTO `tb_province` VALUES ('28', '甘肃省');
INSERT INTO `tb_province` VALUES ('29', '青海省');
INSERT INTO `tb_province` VALUES ('30', '宁夏回族自治区');
INSERT INTO `tb_province` VALUES ('31', '新疆维吾尔自治区');
INSERT INTO `tb_province` VALUES ('32', '香港特别行政区');
INSERT INTO `tb_province` VALUES ('33', '澳门特别行政区');
INSERT INTO `tb_province` VALUES ('34', '台湾省');

-- ----------------------------
-- Table structure for tb_region
-- ----------------------------
DROP TABLE IF EXISTS `tb_region`;
CREATE TABLE `tb_region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '县区ID',
  `city_id` int(11) DEFAULT NULL COMMENT '城市ID',
  `name` varchar(30) DEFAULT NULL COMMENT '县区名称',
  PRIMARY KEY (`region_id`),
  KEY `FK_Relationship_9` (`city_id`),
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`city_id`) REFERENCES `tb_city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2863 DEFAULT CHARSET=utf8 COMMENT='县区';

-- ----------------------------
-- Records of tb_region
-- ----------------------------
INSERT INTO `tb_region` VALUES ('1', '1', '东城区');
INSERT INTO `tb_region` VALUES ('2', '1', '西城区');
INSERT INTO `tb_region` VALUES ('3', '1', '崇文区');
INSERT INTO `tb_region` VALUES ('4', '1', '宣武区');
INSERT INTO `tb_region` VALUES ('5', '1', '朝阳区');
INSERT INTO `tb_region` VALUES ('6', '1', '丰台区');
INSERT INTO `tb_region` VALUES ('7', '1', '石景山区');
INSERT INTO `tb_region` VALUES ('8', '1', '海淀区');
INSERT INTO `tb_region` VALUES ('9', '1', '门头沟区');
INSERT INTO `tb_region` VALUES ('10', '1', '房山区');
INSERT INTO `tb_region` VALUES ('11', '1', '通州区');
INSERT INTO `tb_region` VALUES ('12', '1', '顺义区');
INSERT INTO `tb_region` VALUES ('13', '1', '昌平区');
INSERT INTO `tb_region` VALUES ('14', '1', '大兴区');
INSERT INTO `tb_region` VALUES ('15', '1', '怀柔区');
INSERT INTO `tb_region` VALUES ('16', '1', '平谷区');
INSERT INTO `tb_region` VALUES ('17', '1', '密云县');
INSERT INTO `tb_region` VALUES ('18', '1', '延庆县');
INSERT INTO `tb_region` VALUES ('19', '2', '和平区');
INSERT INTO `tb_region` VALUES ('20', '2', '河东区');
INSERT INTO `tb_region` VALUES ('21', '2', '河西区');
INSERT INTO `tb_region` VALUES ('22', '2', '南开区');
INSERT INTO `tb_region` VALUES ('23', '2', '河北区');
INSERT INTO `tb_region` VALUES ('24', '2', '红桥区');
INSERT INTO `tb_region` VALUES ('25', '2', '塘沽区');
INSERT INTO `tb_region` VALUES ('26', '2', '汉沽区');
INSERT INTO `tb_region` VALUES ('27', '2', '大港区');
INSERT INTO `tb_region` VALUES ('28', '2', '东丽区');
INSERT INTO `tb_region` VALUES ('29', '2', '西青区');
INSERT INTO `tb_region` VALUES ('30', '2', '津南区');
INSERT INTO `tb_region` VALUES ('31', '2', '北辰区');
INSERT INTO `tb_region` VALUES ('32', '2', '武清区');
INSERT INTO `tb_region` VALUES ('33', '2', '宝坻区');
INSERT INTO `tb_region` VALUES ('34', '2', '宁河县');
INSERT INTO `tb_region` VALUES ('35', '2', '静海县');
INSERT INTO `tb_region` VALUES ('36', '2', '蓟县');
INSERT INTO `tb_region` VALUES ('37', '3', '长安区');
INSERT INTO `tb_region` VALUES ('38', '3', '桥东区');
INSERT INTO `tb_region` VALUES ('39', '3', '桥西区');
INSERT INTO `tb_region` VALUES ('40', '3', '新华区');
INSERT INTO `tb_region` VALUES ('41', '3', '井陉矿区');
INSERT INTO `tb_region` VALUES ('42', '3', '裕华区');
INSERT INTO `tb_region` VALUES ('43', '3', '井陉县');
INSERT INTO `tb_region` VALUES ('44', '3', '正定县');
INSERT INTO `tb_region` VALUES ('45', '3', '栾城县');
INSERT INTO `tb_region` VALUES ('46', '3', '行唐县');
INSERT INTO `tb_region` VALUES ('47', '3', '灵寿县');
INSERT INTO `tb_region` VALUES ('48', '3', '高邑县');
INSERT INTO `tb_region` VALUES ('49', '3', '深泽县');
INSERT INTO `tb_region` VALUES ('50', '3', '赞皇县');
INSERT INTO `tb_region` VALUES ('51', '3', '无极县');
INSERT INTO `tb_region` VALUES ('52', '3', '平山县');
INSERT INTO `tb_region` VALUES ('53', '3', '元氏县');
INSERT INTO `tb_region` VALUES ('54', '3', '赵县');
INSERT INTO `tb_region` VALUES ('55', '3', '辛集市');
INSERT INTO `tb_region` VALUES ('56', '3', '藁城市');
INSERT INTO `tb_region` VALUES ('57', '3', '晋州市');
INSERT INTO `tb_region` VALUES ('58', '3', '新乐市');
INSERT INTO `tb_region` VALUES ('59', '3', '鹿泉市');
INSERT INTO `tb_region` VALUES ('60', '4', '路南区');
INSERT INTO `tb_region` VALUES ('61', '4', '路北区');
INSERT INTO `tb_region` VALUES ('62', '4', '古冶区');
INSERT INTO `tb_region` VALUES ('63', '4', '开平区');
INSERT INTO `tb_region` VALUES ('64', '4', '丰南区');
INSERT INTO `tb_region` VALUES ('65', '4', '丰润区');
INSERT INTO `tb_region` VALUES ('66', '4', '滦县');
INSERT INTO `tb_region` VALUES ('67', '4', '滦南县');
INSERT INTO `tb_region` VALUES ('68', '4', '乐亭县');
INSERT INTO `tb_region` VALUES ('69', '4', '迁西县');
INSERT INTO `tb_region` VALUES ('70', '4', '玉田县');
INSERT INTO `tb_region` VALUES ('71', '4', '唐海县');
INSERT INTO `tb_region` VALUES ('72', '4', '遵化市');
INSERT INTO `tb_region` VALUES ('73', '4', '迁安市');
INSERT INTO `tb_region` VALUES ('74', '5', '海港区');
INSERT INTO `tb_region` VALUES ('75', '5', '山海关区');
INSERT INTO `tb_region` VALUES ('76', '5', '北戴河区');
INSERT INTO `tb_region` VALUES ('77', '5', '青龙满族自治县');
INSERT INTO `tb_region` VALUES ('78', '5', '昌黎县');
INSERT INTO `tb_region` VALUES ('79', '5', '抚宁县');
INSERT INTO `tb_region` VALUES ('80', '5', '卢龙县');
INSERT INTO `tb_region` VALUES ('81', '6', '邯山区');
INSERT INTO `tb_region` VALUES ('82', '6', '丛台区');
INSERT INTO `tb_region` VALUES ('83', '6', '复兴区');
INSERT INTO `tb_region` VALUES ('84', '6', '峰峰矿区');
INSERT INTO `tb_region` VALUES ('85', '6', '邯郸县');
INSERT INTO `tb_region` VALUES ('86', '6', '临漳县');
INSERT INTO `tb_region` VALUES ('87', '6', '成安县');
INSERT INTO `tb_region` VALUES ('88', '6', '大名县');
INSERT INTO `tb_region` VALUES ('89', '6', '涉县');
INSERT INTO `tb_region` VALUES ('90', '6', '磁县');
INSERT INTO `tb_region` VALUES ('91', '6', '肥乡县');
INSERT INTO `tb_region` VALUES ('92', '6', '永年县');
INSERT INTO `tb_region` VALUES ('93', '6', '邱县');
INSERT INTO `tb_region` VALUES ('94', '6', '鸡泽县');
INSERT INTO `tb_region` VALUES ('95', '6', '广平县');
INSERT INTO `tb_region` VALUES ('96', '6', '馆陶县');
INSERT INTO `tb_region` VALUES ('97', '6', '魏县');
INSERT INTO `tb_region` VALUES ('98', '6', '曲周县');
INSERT INTO `tb_region` VALUES ('99', '6', '武安市');
INSERT INTO `tb_region` VALUES ('100', '7', '桥东区');
INSERT INTO `tb_region` VALUES ('101', '7', '桥西区');
INSERT INTO `tb_region` VALUES ('102', '7', '邢台县');
INSERT INTO `tb_region` VALUES ('103', '7', '临城县');
INSERT INTO `tb_region` VALUES ('104', '7', '内丘县');
INSERT INTO `tb_region` VALUES ('105', '7', '柏乡县');
INSERT INTO `tb_region` VALUES ('106', '7', '隆尧县');
INSERT INTO `tb_region` VALUES ('107', '7', '任县');
INSERT INTO `tb_region` VALUES ('108', '7', '南和县');
INSERT INTO `tb_region` VALUES ('109', '7', '宁晋县');
INSERT INTO `tb_region` VALUES ('110', '7', '巨鹿县');
INSERT INTO `tb_region` VALUES ('111', '7', '新河县');
INSERT INTO `tb_region` VALUES ('112', '7', '广宗县');
INSERT INTO `tb_region` VALUES ('113', '7', '平乡县');
INSERT INTO `tb_region` VALUES ('114', '7', '威县');
INSERT INTO `tb_region` VALUES ('115', '7', '清河县');
INSERT INTO `tb_region` VALUES ('116', '7', '临西县');
INSERT INTO `tb_region` VALUES ('117', '7', '南宫市');
INSERT INTO `tb_region` VALUES ('118', '7', '沙河市');
INSERT INTO `tb_region` VALUES ('119', '8', '新市区');
INSERT INTO `tb_region` VALUES ('120', '8', '北市区');
INSERT INTO `tb_region` VALUES ('121', '8', '南市区');
INSERT INTO `tb_region` VALUES ('122', '8', '满城县');
INSERT INTO `tb_region` VALUES ('123', '8', '清苑县');
INSERT INTO `tb_region` VALUES ('124', '8', '涞水县');
INSERT INTO `tb_region` VALUES ('125', '8', '阜平县');
INSERT INTO `tb_region` VALUES ('126', '8', '徐水县');
INSERT INTO `tb_region` VALUES ('127', '8', '定兴县');
INSERT INTO `tb_region` VALUES ('128', '8', '唐县');
INSERT INTO `tb_region` VALUES ('129', '8', '高阳县');
INSERT INTO `tb_region` VALUES ('130', '8', '容城县');
INSERT INTO `tb_region` VALUES ('131', '8', '涞源县');
INSERT INTO `tb_region` VALUES ('132', '8', '望都县');
INSERT INTO `tb_region` VALUES ('133', '8', '安新县');
INSERT INTO `tb_region` VALUES ('134', '8', '易县');
INSERT INTO `tb_region` VALUES ('135', '8', '曲阳县');
INSERT INTO `tb_region` VALUES ('136', '8', '蠡县');
INSERT INTO `tb_region` VALUES ('137', '8', '顺平县');
INSERT INTO `tb_region` VALUES ('138', '8', '博野县');
INSERT INTO `tb_region` VALUES ('139', '8', '雄县');
INSERT INTO `tb_region` VALUES ('140', '8', '涿州市');
INSERT INTO `tb_region` VALUES ('141', '8', '定州市');
INSERT INTO `tb_region` VALUES ('142', '8', '安国市');
INSERT INTO `tb_region` VALUES ('143', '8', '高碑店市');
INSERT INTO `tb_region` VALUES ('144', '9', '桥东区');
INSERT INTO `tb_region` VALUES ('145', '9', '桥西区');
INSERT INTO `tb_region` VALUES ('146', '9', '宣化区');
INSERT INTO `tb_region` VALUES ('147', '9', '下花园区');
INSERT INTO `tb_region` VALUES ('148', '9', '宣化县');
INSERT INTO `tb_region` VALUES ('149', '9', '张北县');
INSERT INTO `tb_region` VALUES ('150', '9', '康保县');
INSERT INTO `tb_region` VALUES ('151', '9', '沽源县');
INSERT INTO `tb_region` VALUES ('152', '9', '尚义县');
INSERT INTO `tb_region` VALUES ('153', '9', '蔚县');
INSERT INTO `tb_region` VALUES ('154', '9', '阳原县');
INSERT INTO `tb_region` VALUES ('155', '9', '怀安县');
INSERT INTO `tb_region` VALUES ('156', '9', '万全县');
INSERT INTO `tb_region` VALUES ('157', '9', '怀来县');
INSERT INTO `tb_region` VALUES ('158', '9', '涿鹿县');
INSERT INTO `tb_region` VALUES ('159', '9', '赤城县');
INSERT INTO `tb_region` VALUES ('160', '9', '崇礼县');
INSERT INTO `tb_region` VALUES ('161', '10', '双桥区');
INSERT INTO `tb_region` VALUES ('162', '10', '双滦区');
INSERT INTO `tb_region` VALUES ('163', '10', '鹰手营子矿区');
INSERT INTO `tb_region` VALUES ('164', '10', '承德县');
INSERT INTO `tb_region` VALUES ('165', '10', '兴隆县');
INSERT INTO `tb_region` VALUES ('166', '10', '平泉县');
INSERT INTO `tb_region` VALUES ('167', '10', '滦平县');
INSERT INTO `tb_region` VALUES ('168', '10', '隆化县');
INSERT INTO `tb_region` VALUES ('169', '10', '丰宁满族自治县');
INSERT INTO `tb_region` VALUES ('170', '10', '宽城满族自治县');
INSERT INTO `tb_region` VALUES ('171', '10', '围场满族蒙古族自治县');
INSERT INTO `tb_region` VALUES ('172', '11', '新华区');
INSERT INTO `tb_region` VALUES ('173', '11', '运河区');
INSERT INTO `tb_region` VALUES ('174', '11', '沧县');
INSERT INTO `tb_region` VALUES ('175', '11', '青县');
INSERT INTO `tb_region` VALUES ('176', '11', '东光县');
INSERT INTO `tb_region` VALUES ('177', '11', '海兴县');
INSERT INTO `tb_region` VALUES ('178', '11', '盐山县');
INSERT INTO `tb_region` VALUES ('179', '11', '肃宁县');
INSERT INTO `tb_region` VALUES ('180', '11', '南皮县');
INSERT INTO `tb_region` VALUES ('181', '11', '吴桥县');
INSERT INTO `tb_region` VALUES ('182', '11', '献县');
INSERT INTO `tb_region` VALUES ('183', '11', '孟村回族自治县');
INSERT INTO `tb_region` VALUES ('184', '11', '泊头市');
INSERT INTO `tb_region` VALUES ('185', '11', '任丘市');
INSERT INTO `tb_region` VALUES ('186', '11', '黄骅市');
INSERT INTO `tb_region` VALUES ('187', '11', '河间市');
INSERT INTO `tb_region` VALUES ('188', '12', '安次区');
INSERT INTO `tb_region` VALUES ('189', '12', '广阳区');
INSERT INTO `tb_region` VALUES ('190', '12', '固安县');
INSERT INTO `tb_region` VALUES ('191', '12', '永清县');
INSERT INTO `tb_region` VALUES ('192', '12', '香河县');
INSERT INTO `tb_region` VALUES ('193', '12', '大城县');
INSERT INTO `tb_region` VALUES ('194', '12', '文安县');
INSERT INTO `tb_region` VALUES ('195', '12', '大厂回族自治县');
INSERT INTO `tb_region` VALUES ('196', '12', '霸州市');
INSERT INTO `tb_region` VALUES ('197', '12', '三河市');
INSERT INTO `tb_region` VALUES ('198', '13', '桃城区');
INSERT INTO `tb_region` VALUES ('199', '13', '枣强县');
INSERT INTO `tb_region` VALUES ('200', '13', '武邑县');
INSERT INTO `tb_region` VALUES ('201', '13', '武强县');
INSERT INTO `tb_region` VALUES ('202', '13', '饶阳县');
INSERT INTO `tb_region` VALUES ('203', '13', '安平县');
INSERT INTO `tb_region` VALUES ('204', '13', '故城县');
INSERT INTO `tb_region` VALUES ('205', '13', '景县');
INSERT INTO `tb_region` VALUES ('206', '13', '阜城县');
INSERT INTO `tb_region` VALUES ('207', '13', '冀州市');
INSERT INTO `tb_region` VALUES ('208', '13', '深州市');
INSERT INTO `tb_region` VALUES ('209', '14', '小店区');
INSERT INTO `tb_region` VALUES ('210', '14', '迎泽区');
INSERT INTO `tb_region` VALUES ('211', '14', '杏花岭区');
INSERT INTO `tb_region` VALUES ('212', '14', '尖草坪区');
INSERT INTO `tb_region` VALUES ('213', '14', '万柏林区');
INSERT INTO `tb_region` VALUES ('214', '14', '晋源区');
INSERT INTO `tb_region` VALUES ('215', '14', '清徐县');
INSERT INTO `tb_region` VALUES ('216', '14', '阳曲县');
INSERT INTO `tb_region` VALUES ('217', '14', '娄烦县');
INSERT INTO `tb_region` VALUES ('218', '14', '古交市');
INSERT INTO `tb_region` VALUES ('219', '15', '城区');
INSERT INTO `tb_region` VALUES ('220', '15', '矿区');
INSERT INTO `tb_region` VALUES ('221', '15', '南郊区');
INSERT INTO `tb_region` VALUES ('222', '15', '新荣区');
INSERT INTO `tb_region` VALUES ('223', '15', '阳高县');
INSERT INTO `tb_region` VALUES ('224', '15', '天镇县');
INSERT INTO `tb_region` VALUES ('225', '15', '广灵县');
INSERT INTO `tb_region` VALUES ('226', '15', '灵丘县');
INSERT INTO `tb_region` VALUES ('227', '15', '浑源县');
INSERT INTO `tb_region` VALUES ('228', '15', '左云县');
INSERT INTO `tb_region` VALUES ('229', '15', '大同县');
INSERT INTO `tb_region` VALUES ('230', '16', '城区');
INSERT INTO `tb_region` VALUES ('231', '16', '矿区');
INSERT INTO `tb_region` VALUES ('232', '16', '郊区');
INSERT INTO `tb_region` VALUES ('233', '16', '平定县');
INSERT INTO `tb_region` VALUES ('234', '16', '盂县');
INSERT INTO `tb_region` VALUES ('235', '17', '城区');
INSERT INTO `tb_region` VALUES ('236', '17', '郊区');
INSERT INTO `tb_region` VALUES ('237', '17', '长治县');
INSERT INTO `tb_region` VALUES ('238', '17', '襄垣县');
INSERT INTO `tb_region` VALUES ('239', '17', '屯留县');
INSERT INTO `tb_region` VALUES ('240', '17', '平顺县');
INSERT INTO `tb_region` VALUES ('241', '17', '黎城县');
INSERT INTO `tb_region` VALUES ('242', '17', '壶关县');
INSERT INTO `tb_region` VALUES ('243', '17', '长子县');
INSERT INTO `tb_region` VALUES ('244', '17', '武乡县');
INSERT INTO `tb_region` VALUES ('245', '17', '沁县');
INSERT INTO `tb_region` VALUES ('246', '17', '沁源县');
INSERT INTO `tb_region` VALUES ('247', '17', '潞城市');
INSERT INTO `tb_region` VALUES ('248', '18', '城区');
INSERT INTO `tb_region` VALUES ('249', '18', '沁水县');
INSERT INTO `tb_region` VALUES ('250', '18', '阳城县');
INSERT INTO `tb_region` VALUES ('251', '18', '陵川县');
INSERT INTO `tb_region` VALUES ('252', '18', '泽州县');
INSERT INTO `tb_region` VALUES ('253', '18', '高平市');
INSERT INTO `tb_region` VALUES ('254', '19', '朔城区');
INSERT INTO `tb_region` VALUES ('255', '19', '平鲁区');
INSERT INTO `tb_region` VALUES ('256', '19', '山阴县');
INSERT INTO `tb_region` VALUES ('257', '19', '应县');
INSERT INTO `tb_region` VALUES ('258', '19', '右玉县');
INSERT INTO `tb_region` VALUES ('259', '19', '怀仁县');
INSERT INTO `tb_region` VALUES ('260', '20', '榆次区');
INSERT INTO `tb_region` VALUES ('261', '20', '榆社县');
INSERT INTO `tb_region` VALUES ('262', '20', '左权县');
INSERT INTO `tb_region` VALUES ('263', '20', '和顺县');
INSERT INTO `tb_region` VALUES ('264', '20', '昔阳县');
INSERT INTO `tb_region` VALUES ('265', '20', '寿阳县');
INSERT INTO `tb_region` VALUES ('266', '20', '太谷县');
INSERT INTO `tb_region` VALUES ('267', '20', '祁县');
INSERT INTO `tb_region` VALUES ('268', '20', '平遥县');
INSERT INTO `tb_region` VALUES ('269', '20', '灵石县');
INSERT INTO `tb_region` VALUES ('270', '20', '介休市');
INSERT INTO `tb_region` VALUES ('271', '21', '盐湖区');
INSERT INTO `tb_region` VALUES ('272', '21', '临猗县');
INSERT INTO `tb_region` VALUES ('273', '21', '万荣县');
INSERT INTO `tb_region` VALUES ('274', '21', '闻喜县');
INSERT INTO `tb_region` VALUES ('275', '21', '稷山县');
INSERT INTO `tb_region` VALUES ('276', '21', '新绛县');
INSERT INTO `tb_region` VALUES ('277', '21', '绛县');
INSERT INTO `tb_region` VALUES ('278', '21', '垣曲县');
INSERT INTO `tb_region` VALUES ('279', '21', '夏县');
INSERT INTO `tb_region` VALUES ('280', '21', '平陆县');
INSERT INTO `tb_region` VALUES ('281', '21', '芮城县');
INSERT INTO `tb_region` VALUES ('282', '21', '永济市');
INSERT INTO `tb_region` VALUES ('283', '21', '河津市');
INSERT INTO `tb_region` VALUES ('284', '22', '忻府区');
INSERT INTO `tb_region` VALUES ('285', '22', '定襄县');
INSERT INTO `tb_region` VALUES ('286', '22', '五台县');
INSERT INTO `tb_region` VALUES ('287', '22', '代县');
INSERT INTO `tb_region` VALUES ('288', '22', '繁峙县');
INSERT INTO `tb_region` VALUES ('289', '22', '宁武县');
INSERT INTO `tb_region` VALUES ('290', '22', '静乐县');
INSERT INTO `tb_region` VALUES ('291', '22', '神池县');
INSERT INTO `tb_region` VALUES ('292', '22', '五寨县');
INSERT INTO `tb_region` VALUES ('293', '22', '岢岚县');
INSERT INTO `tb_region` VALUES ('294', '22', '河曲县');
INSERT INTO `tb_region` VALUES ('295', '22', '保德县');
INSERT INTO `tb_region` VALUES ('296', '22', '偏关县');
INSERT INTO `tb_region` VALUES ('297', '22', '原平市');
INSERT INTO `tb_region` VALUES ('298', '23', '尧都区');
INSERT INTO `tb_region` VALUES ('299', '23', '曲沃县');
INSERT INTO `tb_region` VALUES ('300', '23', '翼城县');
INSERT INTO `tb_region` VALUES ('301', '23', '襄汾县');
INSERT INTO `tb_region` VALUES ('302', '23', '洪洞县');
INSERT INTO `tb_region` VALUES ('303', '23', '古县');
INSERT INTO `tb_region` VALUES ('304', '23', '安泽县');
INSERT INTO `tb_region` VALUES ('305', '23', '浮山县');
INSERT INTO `tb_region` VALUES ('306', '23', '吉县');
INSERT INTO `tb_region` VALUES ('307', '23', '乡宁县');
INSERT INTO `tb_region` VALUES ('308', '23', '大宁县');
INSERT INTO `tb_region` VALUES ('309', '23', '隰县');
INSERT INTO `tb_region` VALUES ('310', '23', '永和县');
INSERT INTO `tb_region` VALUES ('311', '23', '蒲县');
INSERT INTO `tb_region` VALUES ('312', '23', '汾西县');
INSERT INTO `tb_region` VALUES ('313', '23', '侯马市');
INSERT INTO `tb_region` VALUES ('314', '23', '霍州市');
INSERT INTO `tb_region` VALUES ('315', '24', '离石区');
INSERT INTO `tb_region` VALUES ('316', '24', '文水县');
INSERT INTO `tb_region` VALUES ('317', '24', '交城县');
INSERT INTO `tb_region` VALUES ('318', '24', '兴县');
INSERT INTO `tb_region` VALUES ('319', '24', '临县');
INSERT INTO `tb_region` VALUES ('320', '24', '柳林县');
INSERT INTO `tb_region` VALUES ('321', '24', '石楼县');
INSERT INTO `tb_region` VALUES ('322', '24', '岚县');
INSERT INTO `tb_region` VALUES ('323', '24', '方山县');
INSERT INTO `tb_region` VALUES ('324', '24', '中阳县');
INSERT INTO `tb_region` VALUES ('325', '24', '交口县');
INSERT INTO `tb_region` VALUES ('326', '24', '孝义市');
INSERT INTO `tb_region` VALUES ('327', '24', '汾阳市');
INSERT INTO `tb_region` VALUES ('328', '25', '新城区');
INSERT INTO `tb_region` VALUES ('329', '25', '回民区');
INSERT INTO `tb_region` VALUES ('330', '25', '玉泉区');
INSERT INTO `tb_region` VALUES ('331', '25', '赛罕区');
INSERT INTO `tb_region` VALUES ('332', '25', '土默特左旗');
INSERT INTO `tb_region` VALUES ('333', '25', '托克托县');
INSERT INTO `tb_region` VALUES ('334', '25', '和林格尔县');
INSERT INTO `tb_region` VALUES ('335', '25', '清水河县');
INSERT INTO `tb_region` VALUES ('336', '25', '武川县');
INSERT INTO `tb_region` VALUES ('337', '26', '东河区');
INSERT INTO `tb_region` VALUES ('338', '26', '昆都仑区');
INSERT INTO `tb_region` VALUES ('339', '26', '青山区');
INSERT INTO `tb_region` VALUES ('340', '26', '石拐区');
INSERT INTO `tb_region` VALUES ('341', '26', '白云矿区');
INSERT INTO `tb_region` VALUES ('342', '26', '九原区');
INSERT INTO `tb_region` VALUES ('343', '26', '土默特右旗');
INSERT INTO `tb_region` VALUES ('344', '26', '固阳县');
INSERT INTO `tb_region` VALUES ('345', '26', '达尔罕茂明安联合旗');
INSERT INTO `tb_region` VALUES ('346', '27', '海勃湾区');
INSERT INTO `tb_region` VALUES ('347', '27', '海南区');
INSERT INTO `tb_region` VALUES ('348', '27', '乌达区');
INSERT INTO `tb_region` VALUES ('349', '28', '红山区');
INSERT INTO `tb_region` VALUES ('350', '28', '元宝山区');
INSERT INTO `tb_region` VALUES ('351', '28', '松山区');
INSERT INTO `tb_region` VALUES ('352', '28', '阿鲁科尔沁旗');
INSERT INTO `tb_region` VALUES ('353', '28', '巴林左旗');
INSERT INTO `tb_region` VALUES ('354', '28', '巴林右旗');
INSERT INTO `tb_region` VALUES ('355', '28', '林西县');
INSERT INTO `tb_region` VALUES ('356', '28', '克什克腾旗');
INSERT INTO `tb_region` VALUES ('357', '28', '翁牛特旗');
INSERT INTO `tb_region` VALUES ('358', '28', '喀喇沁旗');
INSERT INTO `tb_region` VALUES ('359', '28', '宁城县');
INSERT INTO `tb_region` VALUES ('360', '28', '敖汉旗');
INSERT INTO `tb_region` VALUES ('361', '29', '科尔沁区');
INSERT INTO `tb_region` VALUES ('362', '29', '科尔沁左翼中旗');
INSERT INTO `tb_region` VALUES ('363', '29', '科尔沁左翼后旗');
INSERT INTO `tb_region` VALUES ('364', '29', '开鲁县');
INSERT INTO `tb_region` VALUES ('365', '29', '库伦旗');
INSERT INTO `tb_region` VALUES ('366', '29', '奈曼旗');
INSERT INTO `tb_region` VALUES ('367', '29', '扎鲁特旗');
INSERT INTO `tb_region` VALUES ('368', '29', '霍林郭勒市');
INSERT INTO `tb_region` VALUES ('369', '30', '东胜区');
INSERT INTO `tb_region` VALUES ('370', '30', '达拉特旗');
INSERT INTO `tb_region` VALUES ('371', '30', '准格尔旗');
INSERT INTO `tb_region` VALUES ('372', '30', '鄂托克前旗');
INSERT INTO `tb_region` VALUES ('373', '30', '鄂托克旗');
INSERT INTO `tb_region` VALUES ('374', '30', '杭锦旗');
INSERT INTO `tb_region` VALUES ('375', '30', '乌审旗');
INSERT INTO `tb_region` VALUES ('376', '30', '伊金霍洛旗');
INSERT INTO `tb_region` VALUES ('377', '31', '海拉尔区');
INSERT INTO `tb_region` VALUES ('378', '31', '阿荣旗');
INSERT INTO `tb_region` VALUES ('379', '31', '莫力达瓦达斡尔族自治旗');
INSERT INTO `tb_region` VALUES ('380', '31', '鄂伦春自治旗');
INSERT INTO `tb_region` VALUES ('381', '31', '鄂温克族自治旗');
INSERT INTO `tb_region` VALUES ('382', '31', '陈巴尔虎旗');
INSERT INTO `tb_region` VALUES ('383', '31', '新巴尔虎左旗');
INSERT INTO `tb_region` VALUES ('384', '31', '新巴尔虎右旗');
INSERT INTO `tb_region` VALUES ('385', '31', '满洲里市');
INSERT INTO `tb_region` VALUES ('386', '31', '牙克石市');
INSERT INTO `tb_region` VALUES ('387', '31', '扎兰屯市');
INSERT INTO `tb_region` VALUES ('388', '31', '额尔古纳市');
INSERT INTO `tb_region` VALUES ('389', '31', '根河市');
INSERT INTO `tb_region` VALUES ('390', '32', '临河区');
INSERT INTO `tb_region` VALUES ('391', '32', '五原县');
INSERT INTO `tb_region` VALUES ('392', '32', '磴口县');
INSERT INTO `tb_region` VALUES ('393', '32', '乌拉特前旗');
INSERT INTO `tb_region` VALUES ('394', '32', '乌拉特中旗');
INSERT INTO `tb_region` VALUES ('395', '32', '乌拉特后旗');
INSERT INTO `tb_region` VALUES ('396', '32', '杭锦后旗');
INSERT INTO `tb_region` VALUES ('397', '33', '集宁区');
INSERT INTO `tb_region` VALUES ('398', '33', '卓资县');
INSERT INTO `tb_region` VALUES ('399', '33', '化德县');
INSERT INTO `tb_region` VALUES ('400', '33', '商都县');
INSERT INTO `tb_region` VALUES ('401', '33', '兴和县');
INSERT INTO `tb_region` VALUES ('402', '33', '凉城县');
INSERT INTO `tb_region` VALUES ('403', '33', '察哈尔右翼前旗');
INSERT INTO `tb_region` VALUES ('404', '33', '察哈尔右翼中旗');
INSERT INTO `tb_region` VALUES ('405', '33', '察哈尔右翼后旗');
INSERT INTO `tb_region` VALUES ('406', '33', '四子王旗');
INSERT INTO `tb_region` VALUES ('407', '33', '丰镇市');
INSERT INTO `tb_region` VALUES ('408', '34', '乌兰浩特市');
INSERT INTO `tb_region` VALUES ('409', '34', '阿尔山市');
INSERT INTO `tb_region` VALUES ('410', '34', '科尔沁右翼前旗');
INSERT INTO `tb_region` VALUES ('411', '34', '科尔沁右翼中旗');
INSERT INTO `tb_region` VALUES ('412', '34', '扎赉特旗');
INSERT INTO `tb_region` VALUES ('413', '34', '突泉县');
INSERT INTO `tb_region` VALUES ('414', '35', '二连浩特市');
INSERT INTO `tb_region` VALUES ('415', '35', '锡林浩特市');
INSERT INTO `tb_region` VALUES ('416', '35', '阿巴嘎旗');
INSERT INTO `tb_region` VALUES ('417', '35', '苏尼特左旗');
INSERT INTO `tb_region` VALUES ('418', '35', '苏尼特右旗');
INSERT INTO `tb_region` VALUES ('419', '35', '东乌珠穆沁旗');
INSERT INTO `tb_region` VALUES ('420', '35', '西乌珠穆沁旗');
INSERT INTO `tb_region` VALUES ('421', '35', '太仆寺旗');
INSERT INTO `tb_region` VALUES ('422', '35', '镶黄旗');
INSERT INTO `tb_region` VALUES ('423', '35', '正镶白旗');
INSERT INTO `tb_region` VALUES ('424', '35', '正蓝旗');
INSERT INTO `tb_region` VALUES ('425', '35', '多伦县');
INSERT INTO `tb_region` VALUES ('426', '36', '阿拉善左旗');
INSERT INTO `tb_region` VALUES ('427', '36', '阿拉善右旗');
INSERT INTO `tb_region` VALUES ('428', '36', '额济纳旗');
INSERT INTO `tb_region` VALUES ('429', '37', '和平区');
INSERT INTO `tb_region` VALUES ('430', '37', '沈河区');
INSERT INTO `tb_region` VALUES ('431', '37', '大东区');
INSERT INTO `tb_region` VALUES ('432', '37', '皇姑区');
INSERT INTO `tb_region` VALUES ('433', '37', '铁西区');
INSERT INTO `tb_region` VALUES ('434', '37', '苏家屯区');
INSERT INTO `tb_region` VALUES ('435', '37', '东陵区');
INSERT INTO `tb_region` VALUES ('436', '37', '新城子区');
INSERT INTO `tb_region` VALUES ('437', '37', '于洪区');
INSERT INTO `tb_region` VALUES ('438', '37', '辽中县');
INSERT INTO `tb_region` VALUES ('439', '37', '康平县');
INSERT INTO `tb_region` VALUES ('440', '37', '法库县');
INSERT INTO `tb_region` VALUES ('441', '37', '新民市');
INSERT INTO `tb_region` VALUES ('442', '38', '中山区');
INSERT INTO `tb_region` VALUES ('443', '38', '西岗区');
INSERT INTO `tb_region` VALUES ('444', '38', '沙河口区');
INSERT INTO `tb_region` VALUES ('445', '38', '甘井子区');
INSERT INTO `tb_region` VALUES ('446', '38', '旅顺口区');
INSERT INTO `tb_region` VALUES ('447', '38', '金州区');
INSERT INTO `tb_region` VALUES ('448', '38', '长海县');
INSERT INTO `tb_region` VALUES ('449', '38', '瓦房店市');
INSERT INTO `tb_region` VALUES ('450', '38', '普兰店市');
INSERT INTO `tb_region` VALUES ('451', '38', '庄河市');
INSERT INTO `tb_region` VALUES ('452', '39', '铁东区');
INSERT INTO `tb_region` VALUES ('453', '39', '铁西区');
INSERT INTO `tb_region` VALUES ('454', '39', '立山区');
INSERT INTO `tb_region` VALUES ('455', '39', '千山区');
INSERT INTO `tb_region` VALUES ('456', '39', '台安县');
INSERT INTO `tb_region` VALUES ('457', '39', '岫岩满族自治县');
INSERT INTO `tb_region` VALUES ('458', '39', '海城市');
INSERT INTO `tb_region` VALUES ('459', '40', '新抚区');
INSERT INTO `tb_region` VALUES ('460', '40', '东洲区');
INSERT INTO `tb_region` VALUES ('461', '40', '望花区');
INSERT INTO `tb_region` VALUES ('462', '40', '顺城区');
INSERT INTO `tb_region` VALUES ('463', '40', '抚顺县');
INSERT INTO `tb_region` VALUES ('464', '40', '新宾满族自治县');
INSERT INTO `tb_region` VALUES ('465', '40', '清原满族自治县');
INSERT INTO `tb_region` VALUES ('466', '41', '平山区');
INSERT INTO `tb_region` VALUES ('467', '41', '溪湖区');
INSERT INTO `tb_region` VALUES ('468', '41', '明山区');
INSERT INTO `tb_region` VALUES ('469', '41', '南芬区');
INSERT INTO `tb_region` VALUES ('470', '41', '本溪满族自治县');
INSERT INTO `tb_region` VALUES ('471', '41', '桓仁满族自治县');
INSERT INTO `tb_region` VALUES ('472', '42', '元宝区');
INSERT INTO `tb_region` VALUES ('473', '42', '振兴区');
INSERT INTO `tb_region` VALUES ('474', '42', '振安区');
INSERT INTO `tb_region` VALUES ('475', '42', '宽甸满族自治县');
INSERT INTO `tb_region` VALUES ('476', '42', '东港市');
INSERT INTO `tb_region` VALUES ('477', '42', '凤城市');
INSERT INTO `tb_region` VALUES ('478', '43', '古塔区');
INSERT INTO `tb_region` VALUES ('479', '43', '凌河区');
INSERT INTO `tb_region` VALUES ('480', '43', '太和区');
INSERT INTO `tb_region` VALUES ('481', '43', '黑山县');
INSERT INTO `tb_region` VALUES ('482', '43', '义县');
INSERT INTO `tb_region` VALUES ('483', '43', '凌海市');
INSERT INTO `tb_region` VALUES ('484', '43', '北宁市');
INSERT INTO `tb_region` VALUES ('485', '44', '站前区');
INSERT INTO `tb_region` VALUES ('486', '44', '西市区');
INSERT INTO `tb_region` VALUES ('487', '44', '鲅鱼圈区');
INSERT INTO `tb_region` VALUES ('488', '44', '老边区');
INSERT INTO `tb_region` VALUES ('489', '44', '盖州市');
INSERT INTO `tb_region` VALUES ('490', '44', '大石桥市');
INSERT INTO `tb_region` VALUES ('491', '45', '海州区');
INSERT INTO `tb_region` VALUES ('492', '45', '新邱区');
INSERT INTO `tb_region` VALUES ('493', '45', '太平区');
INSERT INTO `tb_region` VALUES ('494', '45', '清河门区');
INSERT INTO `tb_region` VALUES ('495', '45', '细河区');
INSERT INTO `tb_region` VALUES ('496', '45', '阜新蒙古族自治县');
INSERT INTO `tb_region` VALUES ('497', '45', '彰武县');
INSERT INTO `tb_region` VALUES ('498', '46', '白塔区');
INSERT INTO `tb_region` VALUES ('499', '46', '文圣区');
INSERT INTO `tb_region` VALUES ('500', '46', '宏伟区');
INSERT INTO `tb_region` VALUES ('501', '46', '弓长岭区');
INSERT INTO `tb_region` VALUES ('502', '46', '太子河区');
INSERT INTO `tb_region` VALUES ('503', '46', '辽阳县');
INSERT INTO `tb_region` VALUES ('504', '46', '灯塔市');
INSERT INTO `tb_region` VALUES ('505', '47', '双台子区');
INSERT INTO `tb_region` VALUES ('506', '47', '兴隆台区');
INSERT INTO `tb_region` VALUES ('507', '47', '大洼县');
INSERT INTO `tb_region` VALUES ('508', '47', '盘山县');
INSERT INTO `tb_region` VALUES ('509', '48', '银州区');
INSERT INTO `tb_region` VALUES ('510', '48', '清河区');
INSERT INTO `tb_region` VALUES ('511', '48', '铁岭县');
INSERT INTO `tb_region` VALUES ('512', '48', '西丰县');
INSERT INTO `tb_region` VALUES ('513', '48', '昌图县');
INSERT INTO `tb_region` VALUES ('514', '48', '调兵山市');
INSERT INTO `tb_region` VALUES ('515', '48', '开原市');
INSERT INTO `tb_region` VALUES ('516', '49', '双塔区');
INSERT INTO `tb_region` VALUES ('517', '49', '龙城区');
INSERT INTO `tb_region` VALUES ('518', '49', '朝阳县');
INSERT INTO `tb_region` VALUES ('519', '49', '建平县');
INSERT INTO `tb_region` VALUES ('520', '49', '喀喇沁左翼蒙古族自治县');
INSERT INTO `tb_region` VALUES ('521', '49', '北票市');
INSERT INTO `tb_region` VALUES ('522', '49', '凌源市');
INSERT INTO `tb_region` VALUES ('523', '50', '连山区');
INSERT INTO `tb_region` VALUES ('524', '50', '龙港区');
INSERT INTO `tb_region` VALUES ('525', '50', '南票区');
INSERT INTO `tb_region` VALUES ('526', '50', '绥中县');
INSERT INTO `tb_region` VALUES ('527', '50', '建昌县');
INSERT INTO `tb_region` VALUES ('528', '50', '兴城市');
INSERT INTO `tb_region` VALUES ('529', '51', '南关区');
INSERT INTO `tb_region` VALUES ('530', '51', '宽城区');
INSERT INTO `tb_region` VALUES ('531', '51', '朝阳区');
INSERT INTO `tb_region` VALUES ('532', '51', '二道区');
INSERT INTO `tb_region` VALUES ('533', '51', '绿园区');
INSERT INTO `tb_region` VALUES ('534', '51', '双阳区');
INSERT INTO `tb_region` VALUES ('535', '51', '农安县');
INSERT INTO `tb_region` VALUES ('536', '51', '九台市');
INSERT INTO `tb_region` VALUES ('537', '51', '榆树市');
INSERT INTO `tb_region` VALUES ('538', '51', '德惠市');
INSERT INTO `tb_region` VALUES ('539', '52', '昌邑区');
INSERT INTO `tb_region` VALUES ('540', '52', '龙潭区');
INSERT INTO `tb_region` VALUES ('541', '52', '船营区');
INSERT INTO `tb_region` VALUES ('542', '52', '丰满区');
INSERT INTO `tb_region` VALUES ('543', '52', '永吉县');
INSERT INTO `tb_region` VALUES ('544', '52', '蛟河市');
INSERT INTO `tb_region` VALUES ('545', '52', '桦甸市');
INSERT INTO `tb_region` VALUES ('546', '52', '舒兰市');
INSERT INTO `tb_region` VALUES ('547', '52', '磐石市');
INSERT INTO `tb_region` VALUES ('548', '53', '铁西区');
INSERT INTO `tb_region` VALUES ('549', '53', '铁东区');
INSERT INTO `tb_region` VALUES ('550', '53', '梨树县');
INSERT INTO `tb_region` VALUES ('551', '53', '伊通满族自治县');
INSERT INTO `tb_region` VALUES ('552', '53', '公主岭市');
INSERT INTO `tb_region` VALUES ('553', '53', '双辽市');
INSERT INTO `tb_region` VALUES ('554', '54', '龙山区');
INSERT INTO `tb_region` VALUES ('555', '54', '西安区');
INSERT INTO `tb_region` VALUES ('556', '54', '东丰县');
INSERT INTO `tb_region` VALUES ('557', '54', '东辽县');
INSERT INTO `tb_region` VALUES ('558', '55', '东昌区');
INSERT INTO `tb_region` VALUES ('559', '55', '二道江区');
INSERT INTO `tb_region` VALUES ('560', '55', '通化县');
INSERT INTO `tb_region` VALUES ('561', '55', '辉南县');
INSERT INTO `tb_region` VALUES ('562', '55', '柳河县');
INSERT INTO `tb_region` VALUES ('563', '55', '梅河口市');
INSERT INTO `tb_region` VALUES ('564', '55', '集安市');
INSERT INTO `tb_region` VALUES ('565', '56', '八道江区');
INSERT INTO `tb_region` VALUES ('566', '56', '抚松县');
INSERT INTO `tb_region` VALUES ('567', '56', '靖宇县');
INSERT INTO `tb_region` VALUES ('568', '56', '长白朝鲜族自治县');
INSERT INTO `tb_region` VALUES ('569', '56', '江源县');
INSERT INTO `tb_region` VALUES ('570', '56', '临江市');
INSERT INTO `tb_region` VALUES ('571', '57', '宁江区');
INSERT INTO `tb_region` VALUES ('572', '57', '前郭尔罗斯蒙古族自治县');
INSERT INTO `tb_region` VALUES ('573', '57', '长岭县');
INSERT INTO `tb_region` VALUES ('574', '57', '乾安县');
INSERT INTO `tb_region` VALUES ('575', '57', '扶余县');
INSERT INTO `tb_region` VALUES ('576', '58', '洮北区');
INSERT INTO `tb_region` VALUES ('577', '58', '镇赉县');
INSERT INTO `tb_region` VALUES ('578', '58', '通榆县');
INSERT INTO `tb_region` VALUES ('579', '58', '洮南市');
INSERT INTO `tb_region` VALUES ('580', '58', '大安市');
INSERT INTO `tb_region` VALUES ('581', '59', '延吉市');
INSERT INTO `tb_region` VALUES ('582', '59', '图们市');
INSERT INTO `tb_region` VALUES ('583', '59', '敦化市');
INSERT INTO `tb_region` VALUES ('584', '59', '珲春市');
INSERT INTO `tb_region` VALUES ('585', '59', '龙井市');
INSERT INTO `tb_region` VALUES ('586', '59', '和龙市');
INSERT INTO `tb_region` VALUES ('587', '59', '汪清县');
INSERT INTO `tb_region` VALUES ('588', '59', '安图县');
INSERT INTO `tb_region` VALUES ('589', '60', '道里区');
INSERT INTO `tb_region` VALUES ('590', '60', '南岗区');
INSERT INTO `tb_region` VALUES ('591', '60', '道外区');
INSERT INTO `tb_region` VALUES ('592', '60', '香坊区');
INSERT INTO `tb_region` VALUES ('593', '60', '动力区');
INSERT INTO `tb_region` VALUES ('594', '60', '平房区');
INSERT INTO `tb_region` VALUES ('595', '60', '松北区');
INSERT INTO `tb_region` VALUES ('596', '60', '呼兰区');
INSERT INTO `tb_region` VALUES ('597', '60', '依兰县');
INSERT INTO `tb_region` VALUES ('598', '60', '方正县');
INSERT INTO `tb_region` VALUES ('599', '60', '宾县');
INSERT INTO `tb_region` VALUES ('600', '60', '巴彦县');
INSERT INTO `tb_region` VALUES ('601', '60', '木兰县');
INSERT INTO `tb_region` VALUES ('602', '60', '通河县');
INSERT INTO `tb_region` VALUES ('603', '60', '延寿县');
INSERT INTO `tb_region` VALUES ('604', '60', '阿城市');
INSERT INTO `tb_region` VALUES ('605', '60', '双城市');
INSERT INTO `tb_region` VALUES ('606', '60', '尚志市');
INSERT INTO `tb_region` VALUES ('607', '60', '五常市');
INSERT INTO `tb_region` VALUES ('608', '61', '龙沙区');
INSERT INTO `tb_region` VALUES ('609', '61', '建华区');
INSERT INTO `tb_region` VALUES ('610', '61', '铁锋区');
INSERT INTO `tb_region` VALUES ('611', '61', '昂昂溪区');
INSERT INTO `tb_region` VALUES ('612', '61', '富拉尔基区');
INSERT INTO `tb_region` VALUES ('613', '61', '碾子山区');
INSERT INTO `tb_region` VALUES ('614', '61', '梅里斯达斡尔族区');
INSERT INTO `tb_region` VALUES ('615', '61', '龙江县');
INSERT INTO `tb_region` VALUES ('616', '61', '依安县');
INSERT INTO `tb_region` VALUES ('617', '61', '泰来县');
INSERT INTO `tb_region` VALUES ('618', '61', '甘南县');
INSERT INTO `tb_region` VALUES ('619', '61', '富裕县');
INSERT INTO `tb_region` VALUES ('620', '61', '克山县');
INSERT INTO `tb_region` VALUES ('621', '61', '克东县');
INSERT INTO `tb_region` VALUES ('622', '61', '拜泉县');
INSERT INTO `tb_region` VALUES ('623', '61', '讷河市');
INSERT INTO `tb_region` VALUES ('624', '62', '鸡冠区');
INSERT INTO `tb_region` VALUES ('625', '62', '恒山区');
INSERT INTO `tb_region` VALUES ('626', '62', '滴道区');
INSERT INTO `tb_region` VALUES ('627', '62', '梨树区');
INSERT INTO `tb_region` VALUES ('628', '62', '城子河区');
INSERT INTO `tb_region` VALUES ('629', '62', '麻山区');
INSERT INTO `tb_region` VALUES ('630', '62', '鸡东县');
INSERT INTO `tb_region` VALUES ('631', '62', '虎林市');
INSERT INTO `tb_region` VALUES ('632', '62', '密山市');
INSERT INTO `tb_region` VALUES ('633', '63', '向阳区');
INSERT INTO `tb_region` VALUES ('634', '63', '工农区');
INSERT INTO `tb_region` VALUES ('635', '63', '南山区');
INSERT INTO `tb_region` VALUES ('636', '63', '兴安区');
INSERT INTO `tb_region` VALUES ('637', '63', '东山区');
INSERT INTO `tb_region` VALUES ('638', '63', '兴山区');
INSERT INTO `tb_region` VALUES ('639', '63', '萝北县');
INSERT INTO `tb_region` VALUES ('640', '63', '绥滨县');
INSERT INTO `tb_region` VALUES ('641', '64', '尖山区');
INSERT INTO `tb_region` VALUES ('642', '64', '岭东区');
INSERT INTO `tb_region` VALUES ('643', '64', '四方台区');
INSERT INTO `tb_region` VALUES ('644', '64', '宝山区');
INSERT INTO `tb_region` VALUES ('645', '64', '集贤县');
INSERT INTO `tb_region` VALUES ('646', '64', '友谊县');
INSERT INTO `tb_region` VALUES ('647', '64', '宝清县');
INSERT INTO `tb_region` VALUES ('648', '64', '饶河县');
INSERT INTO `tb_region` VALUES ('649', '65', '萨尔图区');
INSERT INTO `tb_region` VALUES ('650', '65', '龙凤区');
INSERT INTO `tb_region` VALUES ('651', '65', '让胡路区');
INSERT INTO `tb_region` VALUES ('652', '65', '红岗区');
INSERT INTO `tb_region` VALUES ('653', '65', '大同区');
INSERT INTO `tb_region` VALUES ('654', '65', '肇州县');
INSERT INTO `tb_region` VALUES ('655', '65', '肇源县');
INSERT INTO `tb_region` VALUES ('656', '65', '林甸县');
INSERT INTO `tb_region` VALUES ('657', '65', '杜尔伯特蒙古族自治县');
INSERT INTO `tb_region` VALUES ('658', '66', '伊春区');
INSERT INTO `tb_region` VALUES ('659', '66', '南岔区');
INSERT INTO `tb_region` VALUES ('660', '66', '友好区');
INSERT INTO `tb_region` VALUES ('661', '66', '西林区');
INSERT INTO `tb_region` VALUES ('662', '66', '翠峦区');
INSERT INTO `tb_region` VALUES ('663', '66', '新青区');
INSERT INTO `tb_region` VALUES ('664', '66', '美溪区');
INSERT INTO `tb_region` VALUES ('665', '66', '金山屯区');
INSERT INTO `tb_region` VALUES ('666', '66', '五营区');
INSERT INTO `tb_region` VALUES ('667', '66', '乌马河区');
INSERT INTO `tb_region` VALUES ('668', '66', '汤旺河区');
INSERT INTO `tb_region` VALUES ('669', '66', '带岭区');
INSERT INTO `tb_region` VALUES ('670', '66', '乌伊岭区');
INSERT INTO `tb_region` VALUES ('671', '66', '红星区');
INSERT INTO `tb_region` VALUES ('672', '66', '上甘岭区');
INSERT INTO `tb_region` VALUES ('673', '66', '嘉荫县');
INSERT INTO `tb_region` VALUES ('674', '66', '铁力市');
INSERT INTO `tb_region` VALUES ('675', '67', '永红区');
INSERT INTO `tb_region` VALUES ('676', '67', '向阳区');
INSERT INTO `tb_region` VALUES ('677', '67', '前进区');
INSERT INTO `tb_region` VALUES ('678', '67', '东风区');
INSERT INTO `tb_region` VALUES ('679', '67', '郊区');
INSERT INTO `tb_region` VALUES ('680', '67', '桦南县');
INSERT INTO `tb_region` VALUES ('681', '67', '桦川县');
INSERT INTO `tb_region` VALUES ('682', '67', '汤原县');
INSERT INTO `tb_region` VALUES ('683', '67', '抚远县');
INSERT INTO `tb_region` VALUES ('684', '67', '同江市');
INSERT INTO `tb_region` VALUES ('685', '67', '富锦市');
INSERT INTO `tb_region` VALUES ('686', '68', '新兴区');
INSERT INTO `tb_region` VALUES ('687', '68', '桃山区');
INSERT INTO `tb_region` VALUES ('688', '68', '茄子河区');
INSERT INTO `tb_region` VALUES ('689', '68', '勃利县');
INSERT INTO `tb_region` VALUES ('690', '69', '东安区');
INSERT INTO `tb_region` VALUES ('691', '69', '阳明区');
INSERT INTO `tb_region` VALUES ('692', '69', '爱民区');
INSERT INTO `tb_region` VALUES ('693', '69', '西安区');
INSERT INTO `tb_region` VALUES ('694', '69', '东宁县');
INSERT INTO `tb_region` VALUES ('695', '69', '林口县');
INSERT INTO `tb_region` VALUES ('696', '69', '绥芬河市');
INSERT INTO `tb_region` VALUES ('697', '69', '海林市');
INSERT INTO `tb_region` VALUES ('698', '69', '宁安市');
INSERT INTO `tb_region` VALUES ('699', '69', '穆棱市');
INSERT INTO `tb_region` VALUES ('700', '70', '爱辉区');
INSERT INTO `tb_region` VALUES ('701', '70', '嫩江县');
INSERT INTO `tb_region` VALUES ('702', '70', '逊克县');
INSERT INTO `tb_region` VALUES ('703', '70', '孙吴县');
INSERT INTO `tb_region` VALUES ('704', '70', '北安市');
INSERT INTO `tb_region` VALUES ('705', '70', '五大连池市');
INSERT INTO `tb_region` VALUES ('706', '71', '北林区');
INSERT INTO `tb_region` VALUES ('707', '71', '望奎县');
INSERT INTO `tb_region` VALUES ('708', '71', '兰西县');
INSERT INTO `tb_region` VALUES ('709', '71', '青冈县');
INSERT INTO `tb_region` VALUES ('710', '71', '庆安县');
INSERT INTO `tb_region` VALUES ('711', '71', '明水县');
INSERT INTO `tb_region` VALUES ('712', '71', '绥棱县');
INSERT INTO `tb_region` VALUES ('713', '71', '安达市');
INSERT INTO `tb_region` VALUES ('714', '71', '肇东市');
INSERT INTO `tb_region` VALUES ('715', '71', '海伦市');
INSERT INTO `tb_region` VALUES ('716', '72', '呼玛县');
INSERT INTO `tb_region` VALUES ('717', '72', '塔河县');
INSERT INTO `tb_region` VALUES ('718', '72', '漠河县');
INSERT INTO `tb_region` VALUES ('719', '73', '黄浦区');
INSERT INTO `tb_region` VALUES ('720', '73', '卢湾区');
INSERT INTO `tb_region` VALUES ('721', '73', '徐汇区');
INSERT INTO `tb_region` VALUES ('722', '73', '长宁区');
INSERT INTO `tb_region` VALUES ('723', '73', '静安区');
INSERT INTO `tb_region` VALUES ('724', '73', '普陀区');
INSERT INTO `tb_region` VALUES ('725', '73', '闸北区');
INSERT INTO `tb_region` VALUES ('726', '73', '虹口区');
INSERT INTO `tb_region` VALUES ('727', '73', '杨浦区');
INSERT INTO `tb_region` VALUES ('728', '73', '闵行区');
INSERT INTO `tb_region` VALUES ('729', '73', '宝山区');
INSERT INTO `tb_region` VALUES ('730', '73', '嘉定区');
INSERT INTO `tb_region` VALUES ('731', '73', '浦东新区');
INSERT INTO `tb_region` VALUES ('732', '73', '金山区');
INSERT INTO `tb_region` VALUES ('733', '73', '松江区');
INSERT INTO `tb_region` VALUES ('734', '73', '青浦区');
INSERT INTO `tb_region` VALUES ('735', '73', '南汇区');
INSERT INTO `tb_region` VALUES ('736', '73', '奉贤区');
INSERT INTO `tb_region` VALUES ('737', '73', '崇明县');
INSERT INTO `tb_region` VALUES ('738', '74', '玄武区');
INSERT INTO `tb_region` VALUES ('739', '74', '白下区');
INSERT INTO `tb_region` VALUES ('740', '74', '秦淮区');
INSERT INTO `tb_region` VALUES ('741', '74', '建邺区');
INSERT INTO `tb_region` VALUES ('742', '74', '鼓楼区');
INSERT INTO `tb_region` VALUES ('743', '74', '下关区');
INSERT INTO `tb_region` VALUES ('744', '74', '浦口区');
INSERT INTO `tb_region` VALUES ('745', '74', '栖霞区');
INSERT INTO `tb_region` VALUES ('746', '74', '雨花台区');
INSERT INTO `tb_region` VALUES ('747', '74', '江宁区');
INSERT INTO `tb_region` VALUES ('748', '74', '六合区');
INSERT INTO `tb_region` VALUES ('749', '74', '溧水县');
INSERT INTO `tb_region` VALUES ('750', '74', '高淳县');
INSERT INTO `tb_region` VALUES ('751', '75', '崇安区');
INSERT INTO `tb_region` VALUES ('752', '75', '南长区');
INSERT INTO `tb_region` VALUES ('753', '75', '北塘区');
INSERT INTO `tb_region` VALUES ('754', '75', '锡山区');
INSERT INTO `tb_region` VALUES ('755', '75', '惠山区');
INSERT INTO `tb_region` VALUES ('756', '75', '滨湖区');
INSERT INTO `tb_region` VALUES ('757', '75', '江阴市');
INSERT INTO `tb_region` VALUES ('758', '75', '宜兴市');
INSERT INTO `tb_region` VALUES ('759', '76', '鼓楼区');
INSERT INTO `tb_region` VALUES ('760', '76', '云龙区');
INSERT INTO `tb_region` VALUES ('761', '76', '九里区');
INSERT INTO `tb_region` VALUES ('762', '76', '贾汪区');
INSERT INTO `tb_region` VALUES ('763', '76', '泉山区');
INSERT INTO `tb_region` VALUES ('764', '76', '丰县');
INSERT INTO `tb_region` VALUES ('765', '76', '沛县');
INSERT INTO `tb_region` VALUES ('766', '76', '铜山县');
INSERT INTO `tb_region` VALUES ('767', '76', '睢宁县');
INSERT INTO `tb_region` VALUES ('768', '76', '新沂市');
INSERT INTO `tb_region` VALUES ('769', '76', '邳州市');
INSERT INTO `tb_region` VALUES ('770', '77', '天宁区');
INSERT INTO `tb_region` VALUES ('771', '77', '钟楼区');
INSERT INTO `tb_region` VALUES ('772', '77', '戚墅堰区');
INSERT INTO `tb_region` VALUES ('773', '77', '新北区');
INSERT INTO `tb_region` VALUES ('774', '77', '武进区');
INSERT INTO `tb_region` VALUES ('775', '77', '溧阳市');
INSERT INTO `tb_region` VALUES ('776', '77', '金坛市');
INSERT INTO `tb_region` VALUES ('777', '78', '沧浪区');
INSERT INTO `tb_region` VALUES ('778', '78', '平江区');
INSERT INTO `tb_region` VALUES ('779', '78', '金阊区');
INSERT INTO `tb_region` VALUES ('780', '78', '虎丘区');
INSERT INTO `tb_region` VALUES ('781', '78', '吴中区');
INSERT INTO `tb_region` VALUES ('782', '78', '相城区');
INSERT INTO `tb_region` VALUES ('783', '78', '常熟市');
INSERT INTO `tb_region` VALUES ('784', '78', '张家港市');
INSERT INTO `tb_region` VALUES ('785', '78', '昆山市');
INSERT INTO `tb_region` VALUES ('786', '78', '吴江市');
INSERT INTO `tb_region` VALUES ('787', '78', '太仓市');
INSERT INTO `tb_region` VALUES ('788', '79', '崇川区');
INSERT INTO `tb_region` VALUES ('789', '79', '港闸区');
INSERT INTO `tb_region` VALUES ('790', '79', '海安县');
INSERT INTO `tb_region` VALUES ('791', '79', '如东县');
INSERT INTO `tb_region` VALUES ('792', '79', '启东市');
INSERT INTO `tb_region` VALUES ('793', '79', '如皋市');
INSERT INTO `tb_region` VALUES ('794', '79', '通州市');
INSERT INTO `tb_region` VALUES ('795', '79', '海门市');
INSERT INTO `tb_region` VALUES ('796', '80', '连云区');
INSERT INTO `tb_region` VALUES ('797', '80', '新浦区');
INSERT INTO `tb_region` VALUES ('798', '80', '海州区');
INSERT INTO `tb_region` VALUES ('799', '80', '赣榆县');
INSERT INTO `tb_region` VALUES ('800', '80', '东海县');
INSERT INTO `tb_region` VALUES ('801', '80', '灌云县');
INSERT INTO `tb_region` VALUES ('802', '80', '灌南县');
INSERT INTO `tb_region` VALUES ('803', '81', '清河区');
INSERT INTO `tb_region` VALUES ('804', '81', '楚州区');
INSERT INTO `tb_region` VALUES ('805', '81', '淮阴区');
INSERT INTO `tb_region` VALUES ('806', '81', '清浦区');
INSERT INTO `tb_region` VALUES ('807', '81', '涟水县');
INSERT INTO `tb_region` VALUES ('808', '81', '洪泽县');
INSERT INTO `tb_region` VALUES ('809', '81', '盱眙县');
INSERT INTO `tb_region` VALUES ('810', '81', '金湖县');
INSERT INTO `tb_region` VALUES ('811', '82', '亭湖区');
INSERT INTO `tb_region` VALUES ('812', '82', '盐都区');
INSERT INTO `tb_region` VALUES ('813', '82', '响水县');
INSERT INTO `tb_region` VALUES ('814', '82', '滨海县');
INSERT INTO `tb_region` VALUES ('815', '82', '阜宁县');
INSERT INTO `tb_region` VALUES ('816', '82', '射阳县');
INSERT INTO `tb_region` VALUES ('817', '82', '建湖县');
INSERT INTO `tb_region` VALUES ('818', '82', '东台市');
INSERT INTO `tb_region` VALUES ('819', '82', '大丰市');
INSERT INTO `tb_region` VALUES ('820', '83', '广陵区');
INSERT INTO `tb_region` VALUES ('821', '83', '邗江区');
INSERT INTO `tb_region` VALUES ('822', '83', '维扬区');
INSERT INTO `tb_region` VALUES ('823', '83', '宝应县');
INSERT INTO `tb_region` VALUES ('824', '83', '仪征市');
INSERT INTO `tb_region` VALUES ('825', '83', '高邮市');
INSERT INTO `tb_region` VALUES ('826', '83', '江都市');
INSERT INTO `tb_region` VALUES ('827', '84', '京口区');
INSERT INTO `tb_region` VALUES ('828', '84', '润州区');
INSERT INTO `tb_region` VALUES ('829', '84', '丹徒区');
INSERT INTO `tb_region` VALUES ('830', '84', '丹阳市');
INSERT INTO `tb_region` VALUES ('831', '84', '扬中市');
INSERT INTO `tb_region` VALUES ('832', '84', '句容市');
INSERT INTO `tb_region` VALUES ('833', '85', '海陵区');
INSERT INTO `tb_region` VALUES ('834', '85', '高港区');
INSERT INTO `tb_region` VALUES ('835', '85', '兴化市');
INSERT INTO `tb_region` VALUES ('836', '85', '靖江市');
INSERT INTO `tb_region` VALUES ('837', '85', '泰兴市');
INSERT INTO `tb_region` VALUES ('838', '85', '姜堰市');
INSERT INTO `tb_region` VALUES ('839', '86', '宿城区');
INSERT INTO `tb_region` VALUES ('840', '86', '宿豫区');
INSERT INTO `tb_region` VALUES ('841', '86', '沭阳县');
INSERT INTO `tb_region` VALUES ('842', '86', '泗阳县');
INSERT INTO `tb_region` VALUES ('843', '86', '泗洪县');
INSERT INTO `tb_region` VALUES ('844', '87', '上城区');
INSERT INTO `tb_region` VALUES ('845', '87', '下城区');
INSERT INTO `tb_region` VALUES ('846', '87', '江干区');
INSERT INTO `tb_region` VALUES ('847', '87', '拱墅区');
INSERT INTO `tb_region` VALUES ('848', '87', '西湖区');
INSERT INTO `tb_region` VALUES ('849', '87', '滨江区');
INSERT INTO `tb_region` VALUES ('850', '87', '萧山区');
INSERT INTO `tb_region` VALUES ('851', '87', '余杭区');
INSERT INTO `tb_region` VALUES ('852', '87', '桐庐县');
INSERT INTO `tb_region` VALUES ('853', '87', '淳安县');
INSERT INTO `tb_region` VALUES ('854', '87', '建德市');
INSERT INTO `tb_region` VALUES ('855', '87', '富阳市');
INSERT INTO `tb_region` VALUES ('856', '87', '临安市');
INSERT INTO `tb_region` VALUES ('857', '88', '海曙区');
INSERT INTO `tb_region` VALUES ('858', '88', '江东区');
INSERT INTO `tb_region` VALUES ('859', '88', '江北区');
INSERT INTO `tb_region` VALUES ('860', '88', '北仑区');
INSERT INTO `tb_region` VALUES ('861', '88', '镇海区');
INSERT INTO `tb_region` VALUES ('862', '88', '鄞州区');
INSERT INTO `tb_region` VALUES ('863', '88', '象山县');
INSERT INTO `tb_region` VALUES ('864', '88', '宁海县');
INSERT INTO `tb_region` VALUES ('865', '88', '余姚市');
INSERT INTO `tb_region` VALUES ('866', '88', '慈溪市');
INSERT INTO `tb_region` VALUES ('867', '88', '奉化市');
INSERT INTO `tb_region` VALUES ('868', '89', '鹿城区');
INSERT INTO `tb_region` VALUES ('869', '89', '龙湾区');
INSERT INTO `tb_region` VALUES ('870', '89', '瓯海区');
INSERT INTO `tb_region` VALUES ('871', '89', '洞头县');
INSERT INTO `tb_region` VALUES ('872', '89', '永嘉县');
INSERT INTO `tb_region` VALUES ('873', '89', '平阳县');
INSERT INTO `tb_region` VALUES ('874', '89', '苍南县');
INSERT INTO `tb_region` VALUES ('875', '89', '文成县');
INSERT INTO `tb_region` VALUES ('876', '89', '泰顺县');
INSERT INTO `tb_region` VALUES ('877', '89', '瑞安市');
INSERT INTO `tb_region` VALUES ('878', '89', '乐清市');
INSERT INTO `tb_region` VALUES ('879', '90', '秀城区');
INSERT INTO `tb_region` VALUES ('880', '90', '秀洲区');
INSERT INTO `tb_region` VALUES ('881', '90', '嘉善县');
INSERT INTO `tb_region` VALUES ('882', '90', '海盐县');
INSERT INTO `tb_region` VALUES ('883', '90', '海宁市');
INSERT INTO `tb_region` VALUES ('884', '90', '平湖市');
INSERT INTO `tb_region` VALUES ('885', '90', '桐乡市');
INSERT INTO `tb_region` VALUES ('886', '91', '吴兴区');
INSERT INTO `tb_region` VALUES ('887', '91', '南浔区');
INSERT INTO `tb_region` VALUES ('888', '91', '德清县');
INSERT INTO `tb_region` VALUES ('889', '91', '长兴县');
INSERT INTO `tb_region` VALUES ('890', '91', '安吉县');
INSERT INTO `tb_region` VALUES ('891', '92', '越城区');
INSERT INTO `tb_region` VALUES ('892', '92', '绍兴县');
INSERT INTO `tb_region` VALUES ('893', '92', '新昌县');
INSERT INTO `tb_region` VALUES ('894', '92', '诸暨市');
INSERT INTO `tb_region` VALUES ('895', '92', '上虞市');
INSERT INTO `tb_region` VALUES ('896', '92', '嵊州市');
INSERT INTO `tb_region` VALUES ('897', '93', '婺城区');
INSERT INTO `tb_region` VALUES ('898', '93', '金东区');
INSERT INTO `tb_region` VALUES ('899', '93', '武义县');
INSERT INTO `tb_region` VALUES ('900', '93', '浦江县');
INSERT INTO `tb_region` VALUES ('901', '93', '磐安县');
INSERT INTO `tb_region` VALUES ('902', '93', '兰溪市');
INSERT INTO `tb_region` VALUES ('903', '93', '义乌市');
INSERT INTO `tb_region` VALUES ('904', '93', '东阳市');
INSERT INTO `tb_region` VALUES ('905', '93', '永康市');
INSERT INTO `tb_region` VALUES ('906', '94', '柯城区');
INSERT INTO `tb_region` VALUES ('907', '94', '衢江区');
INSERT INTO `tb_region` VALUES ('908', '94', '常山县');
INSERT INTO `tb_region` VALUES ('909', '94', '开化县');
INSERT INTO `tb_region` VALUES ('910', '94', '龙游县');
INSERT INTO `tb_region` VALUES ('911', '94', '江山市');
INSERT INTO `tb_region` VALUES ('912', '95', '定海区');
INSERT INTO `tb_region` VALUES ('913', '95', '普陀区');
INSERT INTO `tb_region` VALUES ('914', '95', '岱山县');
INSERT INTO `tb_region` VALUES ('915', '95', '嵊泗县');
INSERT INTO `tb_region` VALUES ('916', '96', '椒江区');
INSERT INTO `tb_region` VALUES ('917', '96', '黄岩区');
INSERT INTO `tb_region` VALUES ('918', '96', '路桥区');
INSERT INTO `tb_region` VALUES ('919', '96', '玉环县');
INSERT INTO `tb_region` VALUES ('920', '96', '三门县');
INSERT INTO `tb_region` VALUES ('921', '96', '天台县');
INSERT INTO `tb_region` VALUES ('922', '96', '仙居县');
INSERT INTO `tb_region` VALUES ('923', '96', '温岭市');
INSERT INTO `tb_region` VALUES ('924', '96', '临海市');
INSERT INTO `tb_region` VALUES ('925', '97', '莲都区');
INSERT INTO `tb_region` VALUES ('926', '97', '青田县');
INSERT INTO `tb_region` VALUES ('927', '97', '缙云县');
INSERT INTO `tb_region` VALUES ('928', '97', '遂昌县');
INSERT INTO `tb_region` VALUES ('929', '97', '松阳县');
INSERT INTO `tb_region` VALUES ('930', '97', '云和县');
INSERT INTO `tb_region` VALUES ('931', '97', '庆元县');
INSERT INTO `tb_region` VALUES ('932', '97', '景宁畲族自治县');
INSERT INTO `tb_region` VALUES ('933', '97', '龙泉市');
INSERT INTO `tb_region` VALUES ('934', '98', '瑶海区');
INSERT INTO `tb_region` VALUES ('935', '98', '庐阳区');
INSERT INTO `tb_region` VALUES ('936', '98', '蜀山区');
INSERT INTO `tb_region` VALUES ('937', '98', '包河区');
INSERT INTO `tb_region` VALUES ('938', '98', '长丰县');
INSERT INTO `tb_region` VALUES ('939', '98', '肥东县');
INSERT INTO `tb_region` VALUES ('940', '98', '肥西县');
INSERT INTO `tb_region` VALUES ('941', '99', '镜湖区');
INSERT INTO `tb_region` VALUES ('942', '99', '马塘区');
INSERT INTO `tb_region` VALUES ('943', '99', '新芜区');
INSERT INTO `tb_region` VALUES ('944', '99', '鸠江区');
INSERT INTO `tb_region` VALUES ('945', '99', '芜湖县');
INSERT INTO `tb_region` VALUES ('946', '99', '繁昌县');
INSERT INTO `tb_region` VALUES ('947', '99', '南陵县');
INSERT INTO `tb_region` VALUES ('948', '100', '龙子湖区');
INSERT INTO `tb_region` VALUES ('949', '100', '蚌山区');
INSERT INTO `tb_region` VALUES ('950', '100', '禹会区');
INSERT INTO `tb_region` VALUES ('951', '100', '淮上区');
INSERT INTO `tb_region` VALUES ('952', '100', '怀远县');
INSERT INTO `tb_region` VALUES ('953', '100', '五河县');
INSERT INTO `tb_region` VALUES ('954', '100', '固镇县');
INSERT INTO `tb_region` VALUES ('955', '101', '大通区');
INSERT INTO `tb_region` VALUES ('956', '101', '田家庵区');
INSERT INTO `tb_region` VALUES ('957', '101', '谢家集区');
INSERT INTO `tb_region` VALUES ('958', '101', '八公山区');
INSERT INTO `tb_region` VALUES ('959', '101', '潘集区');
INSERT INTO `tb_region` VALUES ('960', '101', '凤台县');
INSERT INTO `tb_region` VALUES ('961', '102', '金家庄区');
INSERT INTO `tb_region` VALUES ('962', '102', '花山区');
INSERT INTO `tb_region` VALUES ('963', '102', '雨山区');
INSERT INTO `tb_region` VALUES ('964', '102', '当涂县');
INSERT INTO `tb_region` VALUES ('965', '103', '杜集区');
INSERT INTO `tb_region` VALUES ('966', '103', '相山区');
INSERT INTO `tb_region` VALUES ('967', '103', '烈山区');
INSERT INTO `tb_region` VALUES ('968', '103', '濉溪县');
INSERT INTO `tb_region` VALUES ('969', '104', '铜官山区');
INSERT INTO `tb_region` VALUES ('970', '104', '狮子山区');
INSERT INTO `tb_region` VALUES ('971', '104', '郊区');
INSERT INTO `tb_region` VALUES ('972', '104', '铜陵县');
INSERT INTO `tb_region` VALUES ('973', '105', '迎江区');
INSERT INTO `tb_region` VALUES ('974', '105', '大观区');
INSERT INTO `tb_region` VALUES ('975', '105', '郊区');
INSERT INTO `tb_region` VALUES ('976', '105', '怀宁县');
INSERT INTO `tb_region` VALUES ('977', '105', '枞阳县');
INSERT INTO `tb_region` VALUES ('978', '105', '潜山县');
INSERT INTO `tb_region` VALUES ('979', '105', '太湖县');
INSERT INTO `tb_region` VALUES ('980', '105', '宿松县');
INSERT INTO `tb_region` VALUES ('981', '105', '望江县');
INSERT INTO `tb_region` VALUES ('982', '105', '岳西县');
INSERT INTO `tb_region` VALUES ('983', '105', '桐城市');
INSERT INTO `tb_region` VALUES ('984', '106', '屯溪区');
INSERT INTO `tb_region` VALUES ('985', '106', '黄山区');
INSERT INTO `tb_region` VALUES ('986', '106', '徽州区');
INSERT INTO `tb_region` VALUES ('987', '106', '歙县');
INSERT INTO `tb_region` VALUES ('988', '106', '休宁县');
INSERT INTO `tb_region` VALUES ('989', '106', '黟县');
INSERT INTO `tb_region` VALUES ('990', '106', '祁门县');
INSERT INTO `tb_region` VALUES ('991', '107', '琅琊区');
INSERT INTO `tb_region` VALUES ('992', '107', '南谯区');
INSERT INTO `tb_region` VALUES ('993', '107', '来安县');
INSERT INTO `tb_region` VALUES ('994', '107', '全椒县');
INSERT INTO `tb_region` VALUES ('995', '107', '定远县');
INSERT INTO `tb_region` VALUES ('996', '107', '凤阳县');
INSERT INTO `tb_region` VALUES ('997', '107', '天长市');
INSERT INTO `tb_region` VALUES ('998', '107', '明光市');
INSERT INTO `tb_region` VALUES ('999', '108', '颍州区');
INSERT INTO `tb_region` VALUES ('1000', '108', '颍东区');
INSERT INTO `tb_region` VALUES ('1001', '108', '颍泉区');
INSERT INTO `tb_region` VALUES ('1002', '108', '临泉县');
INSERT INTO `tb_region` VALUES ('1003', '108', '太和县');
INSERT INTO `tb_region` VALUES ('1004', '108', '阜南县');
INSERT INTO `tb_region` VALUES ('1005', '108', '颍上县');
INSERT INTO `tb_region` VALUES ('1006', '108', '界首市');
INSERT INTO `tb_region` VALUES ('1007', '109', '埇桥区');
INSERT INTO `tb_region` VALUES ('1008', '109', '砀山县');
INSERT INTO `tb_region` VALUES ('1009', '109', '萧县');
INSERT INTO `tb_region` VALUES ('1010', '109', '灵璧县');
INSERT INTO `tb_region` VALUES ('1011', '109', '泗县');
INSERT INTO `tb_region` VALUES ('1012', '110', '居巢区');
INSERT INTO `tb_region` VALUES ('1013', '110', '庐江县');
INSERT INTO `tb_region` VALUES ('1014', '110', '无为县');
INSERT INTO `tb_region` VALUES ('1015', '110', '含山县');
INSERT INTO `tb_region` VALUES ('1016', '110', '和县');
INSERT INTO `tb_region` VALUES ('1017', '111', '金安区');
INSERT INTO `tb_region` VALUES ('1018', '111', '裕安区');
INSERT INTO `tb_region` VALUES ('1019', '111', '寿县');
INSERT INTO `tb_region` VALUES ('1020', '111', '霍邱县');
INSERT INTO `tb_region` VALUES ('1021', '111', '舒城县');
INSERT INTO `tb_region` VALUES ('1022', '111', '金寨县');
INSERT INTO `tb_region` VALUES ('1023', '111', '霍山县');
INSERT INTO `tb_region` VALUES ('1024', '112', '谯城区');
INSERT INTO `tb_region` VALUES ('1025', '112', '涡阳县');
INSERT INTO `tb_region` VALUES ('1026', '112', '蒙城县');
INSERT INTO `tb_region` VALUES ('1027', '112', '利辛县');
INSERT INTO `tb_region` VALUES ('1028', '113', '贵池区');
INSERT INTO `tb_region` VALUES ('1029', '113', '东至县');
INSERT INTO `tb_region` VALUES ('1030', '113', '石台县');
INSERT INTO `tb_region` VALUES ('1031', '113', '青阳县');
INSERT INTO `tb_region` VALUES ('1032', '114', '宣州区');
INSERT INTO `tb_region` VALUES ('1033', '114', '郎溪县');
INSERT INTO `tb_region` VALUES ('1034', '114', '广德县');
INSERT INTO `tb_region` VALUES ('1035', '114', '泾县');
INSERT INTO `tb_region` VALUES ('1036', '114', '绩溪县');
INSERT INTO `tb_region` VALUES ('1037', '114', '旌德县');
INSERT INTO `tb_region` VALUES ('1038', '114', '宁国市');
INSERT INTO `tb_region` VALUES ('1039', '115', '鼓楼区');
INSERT INTO `tb_region` VALUES ('1040', '115', '台江区');
INSERT INTO `tb_region` VALUES ('1041', '115', '仓山区');
INSERT INTO `tb_region` VALUES ('1042', '115', '马尾区');
INSERT INTO `tb_region` VALUES ('1043', '115', '晋安区');
INSERT INTO `tb_region` VALUES ('1044', '115', '闽侯县');
INSERT INTO `tb_region` VALUES ('1045', '115', '连江县');
INSERT INTO `tb_region` VALUES ('1046', '115', '罗源县');
INSERT INTO `tb_region` VALUES ('1047', '115', '闽清县');
INSERT INTO `tb_region` VALUES ('1048', '115', '永泰县');
INSERT INTO `tb_region` VALUES ('1049', '115', '平潭县');
INSERT INTO `tb_region` VALUES ('1050', '115', '福清市');
INSERT INTO `tb_region` VALUES ('1051', '115', '长乐市');
INSERT INTO `tb_region` VALUES ('1052', '116', '思明区');
INSERT INTO `tb_region` VALUES ('1053', '116', '海沧区');
INSERT INTO `tb_region` VALUES ('1054', '116', '湖里区');
INSERT INTO `tb_region` VALUES ('1055', '116', '集美区');
INSERT INTO `tb_region` VALUES ('1056', '116', '同安区');
INSERT INTO `tb_region` VALUES ('1057', '116', '翔安区');
INSERT INTO `tb_region` VALUES ('1058', '117', '城厢区');
INSERT INTO `tb_region` VALUES ('1059', '117', '涵江区');
INSERT INTO `tb_region` VALUES ('1060', '117', '荔城区');
INSERT INTO `tb_region` VALUES ('1061', '117', '秀屿区');
INSERT INTO `tb_region` VALUES ('1062', '117', '仙游县');
INSERT INTO `tb_region` VALUES ('1063', '118', '梅列区');
INSERT INTO `tb_region` VALUES ('1064', '118', '三元区');
INSERT INTO `tb_region` VALUES ('1065', '118', '明溪县');
INSERT INTO `tb_region` VALUES ('1066', '118', '清流县');
INSERT INTO `tb_region` VALUES ('1067', '118', '宁化县');
INSERT INTO `tb_region` VALUES ('1068', '118', '大田县');
INSERT INTO `tb_region` VALUES ('1069', '118', '尤溪县');
INSERT INTO `tb_region` VALUES ('1070', '118', '沙县');
INSERT INTO `tb_region` VALUES ('1071', '118', '将乐县');
INSERT INTO `tb_region` VALUES ('1072', '118', '泰宁县');
INSERT INTO `tb_region` VALUES ('1073', '118', '建宁县');
INSERT INTO `tb_region` VALUES ('1074', '118', '永安市');
INSERT INTO `tb_region` VALUES ('1075', '119', '鲤城区');
INSERT INTO `tb_region` VALUES ('1076', '119', '丰泽区');
INSERT INTO `tb_region` VALUES ('1077', '119', '洛江区');
INSERT INTO `tb_region` VALUES ('1078', '119', '泉港区');
INSERT INTO `tb_region` VALUES ('1079', '119', '惠安县');
INSERT INTO `tb_region` VALUES ('1080', '119', '安溪县');
INSERT INTO `tb_region` VALUES ('1081', '119', '永春县');
INSERT INTO `tb_region` VALUES ('1082', '119', '德化县');
INSERT INTO `tb_region` VALUES ('1083', '119', '金门县');
INSERT INTO `tb_region` VALUES ('1084', '119', '石狮市');
INSERT INTO `tb_region` VALUES ('1085', '119', '晋江市');
INSERT INTO `tb_region` VALUES ('1086', '119', '南安市');
INSERT INTO `tb_region` VALUES ('1087', '120', '芗城区');
INSERT INTO `tb_region` VALUES ('1088', '120', '龙文区');
INSERT INTO `tb_region` VALUES ('1089', '120', '云霄县');
INSERT INTO `tb_region` VALUES ('1090', '120', '漳浦县');
INSERT INTO `tb_region` VALUES ('1091', '120', '诏安县');
INSERT INTO `tb_region` VALUES ('1092', '120', '长泰县');
INSERT INTO `tb_region` VALUES ('1093', '120', '东山县');
INSERT INTO `tb_region` VALUES ('1094', '120', '南靖县');
INSERT INTO `tb_region` VALUES ('1095', '120', '平和县');
INSERT INTO `tb_region` VALUES ('1096', '120', '华安县');
INSERT INTO `tb_region` VALUES ('1097', '120', '龙海市');
INSERT INTO `tb_region` VALUES ('1098', '121', '延平区');
INSERT INTO `tb_region` VALUES ('1099', '121', '顺昌县');
INSERT INTO `tb_region` VALUES ('1100', '121', '浦城县');
INSERT INTO `tb_region` VALUES ('1101', '121', '光泽县');
INSERT INTO `tb_region` VALUES ('1102', '121', '松溪县');
INSERT INTO `tb_region` VALUES ('1103', '121', '政和县');
INSERT INTO `tb_region` VALUES ('1104', '121', '邵武市');
INSERT INTO `tb_region` VALUES ('1105', '121', '武夷山市');
INSERT INTO `tb_region` VALUES ('1106', '121', '建瓯市');
INSERT INTO `tb_region` VALUES ('1107', '121', '建阳市');
INSERT INTO `tb_region` VALUES ('1108', '122', '新罗区');
INSERT INTO `tb_region` VALUES ('1109', '122', '长汀县');
INSERT INTO `tb_region` VALUES ('1110', '122', '永定县');
INSERT INTO `tb_region` VALUES ('1111', '122', '上杭县');
INSERT INTO `tb_region` VALUES ('1112', '122', '武平县');
INSERT INTO `tb_region` VALUES ('1113', '122', '连城县');
INSERT INTO `tb_region` VALUES ('1114', '122', '漳平市');
INSERT INTO `tb_region` VALUES ('1115', '123', '蕉城区');
INSERT INTO `tb_region` VALUES ('1116', '123', '霞浦县');
INSERT INTO `tb_region` VALUES ('1117', '123', '古田县');
INSERT INTO `tb_region` VALUES ('1118', '123', '屏南县');
INSERT INTO `tb_region` VALUES ('1119', '123', '寿宁县');
INSERT INTO `tb_region` VALUES ('1120', '123', '周宁县');
INSERT INTO `tb_region` VALUES ('1121', '123', '柘荣县');
INSERT INTO `tb_region` VALUES ('1122', '123', '福安市');
INSERT INTO `tb_region` VALUES ('1123', '123', '福鼎市');
INSERT INTO `tb_region` VALUES ('1124', '124', '东湖区');
INSERT INTO `tb_region` VALUES ('1125', '124', '西湖区');
INSERT INTO `tb_region` VALUES ('1126', '124', '青云谱区');
INSERT INTO `tb_region` VALUES ('1127', '124', '湾里区');
INSERT INTO `tb_region` VALUES ('1128', '124', '青山湖区');
INSERT INTO `tb_region` VALUES ('1129', '124', '南昌县');
INSERT INTO `tb_region` VALUES ('1130', '124', '新建县');
INSERT INTO `tb_region` VALUES ('1131', '124', '安义县');
INSERT INTO `tb_region` VALUES ('1132', '124', '进贤县');
INSERT INTO `tb_region` VALUES ('1133', '125', '昌江区');
INSERT INTO `tb_region` VALUES ('1134', '125', '珠山区');
INSERT INTO `tb_region` VALUES ('1135', '125', '浮梁县');
INSERT INTO `tb_region` VALUES ('1136', '125', '乐平市');
INSERT INTO `tb_region` VALUES ('1137', '126', '安源区');
INSERT INTO `tb_region` VALUES ('1138', '126', '湘东区');
INSERT INTO `tb_region` VALUES ('1139', '126', '莲花县');
INSERT INTO `tb_region` VALUES ('1140', '126', '上栗县');
INSERT INTO `tb_region` VALUES ('1141', '126', '芦溪县');
INSERT INTO `tb_region` VALUES ('1142', '127', '庐山区');
INSERT INTO `tb_region` VALUES ('1143', '127', '浔阳区');
INSERT INTO `tb_region` VALUES ('1144', '127', '九江县');
INSERT INTO `tb_region` VALUES ('1145', '127', '武宁县');
INSERT INTO `tb_region` VALUES ('1146', '127', '修水县');
INSERT INTO `tb_region` VALUES ('1147', '127', '永修县');
INSERT INTO `tb_region` VALUES ('1148', '127', '德安县');
INSERT INTO `tb_region` VALUES ('1149', '127', '星子县');
INSERT INTO `tb_region` VALUES ('1150', '127', '都昌县');
INSERT INTO `tb_region` VALUES ('1151', '127', '湖口县');
INSERT INTO `tb_region` VALUES ('1152', '127', '彭泽县');
INSERT INTO `tb_region` VALUES ('1153', '127', '瑞昌市');
INSERT INTO `tb_region` VALUES ('1154', '128', '渝水区');
INSERT INTO `tb_region` VALUES ('1155', '128', '分宜县');
INSERT INTO `tb_region` VALUES ('1156', '129', '月湖区');
INSERT INTO `tb_region` VALUES ('1157', '129', '余江县');
INSERT INTO `tb_region` VALUES ('1158', '129', '贵溪市');
INSERT INTO `tb_region` VALUES ('1159', '130', '章贡区');
INSERT INTO `tb_region` VALUES ('1160', '130', '赣县');
INSERT INTO `tb_region` VALUES ('1161', '130', '信丰县');
INSERT INTO `tb_region` VALUES ('1162', '130', '大余县');
INSERT INTO `tb_region` VALUES ('1163', '130', '上犹县');
INSERT INTO `tb_region` VALUES ('1164', '130', '崇义县');
INSERT INTO `tb_region` VALUES ('1165', '130', '安远县');
INSERT INTO `tb_region` VALUES ('1166', '130', '龙南县');
INSERT INTO `tb_region` VALUES ('1167', '130', '定南县');
INSERT INTO `tb_region` VALUES ('1168', '130', '全南县');
INSERT INTO `tb_region` VALUES ('1169', '130', '宁都县');
INSERT INTO `tb_region` VALUES ('1170', '130', '于都县');
INSERT INTO `tb_region` VALUES ('1171', '130', '兴国县');
INSERT INTO `tb_region` VALUES ('1172', '130', '会昌县');
INSERT INTO `tb_region` VALUES ('1173', '130', '寻乌县');
INSERT INTO `tb_region` VALUES ('1174', '130', '石城县');
INSERT INTO `tb_region` VALUES ('1175', '130', '瑞金市');
INSERT INTO `tb_region` VALUES ('1176', '130', '南康市');
INSERT INTO `tb_region` VALUES ('1177', '131', '吉州区');
INSERT INTO `tb_region` VALUES ('1178', '131', '青原区');
INSERT INTO `tb_region` VALUES ('1179', '131', '吉安县');
INSERT INTO `tb_region` VALUES ('1180', '131', '吉水县');
INSERT INTO `tb_region` VALUES ('1181', '131', '峡江县');
INSERT INTO `tb_region` VALUES ('1182', '131', '新干县');
INSERT INTO `tb_region` VALUES ('1183', '131', '永丰县');
INSERT INTO `tb_region` VALUES ('1184', '131', '泰和县');
INSERT INTO `tb_region` VALUES ('1185', '131', '遂川县');
INSERT INTO `tb_region` VALUES ('1186', '131', '万安县');
INSERT INTO `tb_region` VALUES ('1187', '131', '安福县');
INSERT INTO `tb_region` VALUES ('1188', '131', '永新县');
INSERT INTO `tb_region` VALUES ('1189', '131', '井冈山市');
INSERT INTO `tb_region` VALUES ('1190', '132', '袁州区');
INSERT INTO `tb_region` VALUES ('1191', '132', '奉新县');
INSERT INTO `tb_region` VALUES ('1192', '132', '万载县');
INSERT INTO `tb_region` VALUES ('1193', '132', '上高县');
INSERT INTO `tb_region` VALUES ('1194', '132', '宜丰县');
INSERT INTO `tb_region` VALUES ('1195', '132', '靖安县');
INSERT INTO `tb_region` VALUES ('1196', '132', '铜鼓县');
INSERT INTO `tb_region` VALUES ('1197', '132', '丰城市');
INSERT INTO `tb_region` VALUES ('1198', '132', '樟树市');
INSERT INTO `tb_region` VALUES ('1199', '132', '高安市');
INSERT INTO `tb_region` VALUES ('1200', '133', '临川区');
INSERT INTO `tb_region` VALUES ('1201', '133', '南城县');
INSERT INTO `tb_region` VALUES ('1202', '133', '黎川县');
INSERT INTO `tb_region` VALUES ('1203', '133', '南丰县');
INSERT INTO `tb_region` VALUES ('1204', '133', '崇仁县');
INSERT INTO `tb_region` VALUES ('1205', '133', '乐安县');
INSERT INTO `tb_region` VALUES ('1206', '133', '宜黄县');
INSERT INTO `tb_region` VALUES ('1207', '133', '金溪县');
INSERT INTO `tb_region` VALUES ('1208', '133', '资溪县');
INSERT INTO `tb_region` VALUES ('1209', '133', '东乡县');
INSERT INTO `tb_region` VALUES ('1210', '133', '广昌县');
INSERT INTO `tb_region` VALUES ('1211', '134', '信州区');
INSERT INTO `tb_region` VALUES ('1212', '134', '上饶县');
INSERT INTO `tb_region` VALUES ('1213', '134', '广丰县');
INSERT INTO `tb_region` VALUES ('1214', '134', '玉山县');
INSERT INTO `tb_region` VALUES ('1215', '134', '铅山县');
INSERT INTO `tb_region` VALUES ('1216', '134', '横峰县');
INSERT INTO `tb_region` VALUES ('1217', '134', '弋阳县');
INSERT INTO `tb_region` VALUES ('1218', '134', '余干县');
INSERT INTO `tb_region` VALUES ('1219', '134', '鄱阳县');
INSERT INTO `tb_region` VALUES ('1220', '134', '万年县');
INSERT INTO `tb_region` VALUES ('1221', '134', '婺源县');
INSERT INTO `tb_region` VALUES ('1222', '134', '德兴市');
INSERT INTO `tb_region` VALUES ('1223', '135', '历下区');
INSERT INTO `tb_region` VALUES ('1224', '135', '市中区');
INSERT INTO `tb_region` VALUES ('1225', '135', '槐荫区');
INSERT INTO `tb_region` VALUES ('1226', '135', '天桥区');
INSERT INTO `tb_region` VALUES ('1227', '135', '历城区');
INSERT INTO `tb_region` VALUES ('1228', '135', '长清区');
INSERT INTO `tb_region` VALUES ('1229', '135', '平阴县');
INSERT INTO `tb_region` VALUES ('1230', '135', '济阳县');
INSERT INTO `tb_region` VALUES ('1231', '135', '商河县');
INSERT INTO `tb_region` VALUES ('1232', '135', '章丘市');
INSERT INTO `tb_region` VALUES ('1233', '136', '市南区');
INSERT INTO `tb_region` VALUES ('1234', '136', '市北区');
INSERT INTO `tb_region` VALUES ('1235', '136', '四方区');
INSERT INTO `tb_region` VALUES ('1236', '136', '黄岛区');
INSERT INTO `tb_region` VALUES ('1237', '136', '崂山区');
INSERT INTO `tb_region` VALUES ('1238', '136', '李沧区');
INSERT INTO `tb_region` VALUES ('1239', '136', '城阳区');
INSERT INTO `tb_region` VALUES ('1240', '136', '胶州市');
INSERT INTO `tb_region` VALUES ('1241', '136', '即墨市');
INSERT INTO `tb_region` VALUES ('1242', '136', '平度市');
INSERT INTO `tb_region` VALUES ('1243', '136', '胶南市');
INSERT INTO `tb_region` VALUES ('1244', '136', '莱西市');
INSERT INTO `tb_region` VALUES ('1245', '137', '淄川区');
INSERT INTO `tb_region` VALUES ('1246', '137', '张店区');
INSERT INTO `tb_region` VALUES ('1247', '137', '博山区');
INSERT INTO `tb_region` VALUES ('1248', '137', '临淄区');
INSERT INTO `tb_region` VALUES ('1249', '137', '周村区');
INSERT INTO `tb_region` VALUES ('1250', '137', '桓台县');
INSERT INTO `tb_region` VALUES ('1251', '137', '高青县');
INSERT INTO `tb_region` VALUES ('1252', '137', '沂源县');
INSERT INTO `tb_region` VALUES ('1253', '138', '市中区');
INSERT INTO `tb_region` VALUES ('1254', '138', '薛城区');
INSERT INTO `tb_region` VALUES ('1255', '138', '峄城区');
INSERT INTO `tb_region` VALUES ('1256', '138', '台儿庄区');
INSERT INTO `tb_region` VALUES ('1257', '138', '山亭区');
INSERT INTO `tb_region` VALUES ('1258', '138', '滕州市');
INSERT INTO `tb_region` VALUES ('1259', '139', '东营区');
INSERT INTO `tb_region` VALUES ('1260', '139', '河口区');
INSERT INTO `tb_region` VALUES ('1261', '139', '垦利县');
INSERT INTO `tb_region` VALUES ('1262', '139', '利津县');
INSERT INTO `tb_region` VALUES ('1263', '139', '广饶县');
INSERT INTO `tb_region` VALUES ('1264', '140', '芝罘区');
INSERT INTO `tb_region` VALUES ('1265', '140', '福山区');
INSERT INTO `tb_region` VALUES ('1266', '140', '牟平区');
INSERT INTO `tb_region` VALUES ('1267', '140', '莱山区');
INSERT INTO `tb_region` VALUES ('1268', '140', '长岛县');
INSERT INTO `tb_region` VALUES ('1269', '140', '龙口市');
INSERT INTO `tb_region` VALUES ('1270', '140', '莱阳市');
INSERT INTO `tb_region` VALUES ('1271', '140', '莱州市');
INSERT INTO `tb_region` VALUES ('1272', '140', '蓬莱市');
INSERT INTO `tb_region` VALUES ('1273', '140', '招远市');
INSERT INTO `tb_region` VALUES ('1274', '140', '栖霞市');
INSERT INTO `tb_region` VALUES ('1275', '140', '海阳市');
INSERT INTO `tb_region` VALUES ('1276', '141', '潍城区');
INSERT INTO `tb_region` VALUES ('1277', '141', '寒亭区');
INSERT INTO `tb_region` VALUES ('1278', '141', '坊子区');
INSERT INTO `tb_region` VALUES ('1279', '141', '奎文区');
INSERT INTO `tb_region` VALUES ('1280', '141', '临朐县');
INSERT INTO `tb_region` VALUES ('1281', '141', '昌乐县');
INSERT INTO `tb_region` VALUES ('1282', '141', '青州市');
INSERT INTO `tb_region` VALUES ('1283', '141', '诸城市');
INSERT INTO `tb_region` VALUES ('1284', '141', '寿光市');
INSERT INTO `tb_region` VALUES ('1285', '141', '安丘市');
INSERT INTO `tb_region` VALUES ('1286', '141', '高密市');
INSERT INTO `tb_region` VALUES ('1287', '141', '昌邑市');
INSERT INTO `tb_region` VALUES ('1288', '142', '市中区');
INSERT INTO `tb_region` VALUES ('1289', '142', '任城区');
INSERT INTO `tb_region` VALUES ('1290', '142', '微山县');
INSERT INTO `tb_region` VALUES ('1291', '142', '鱼台县');
INSERT INTO `tb_region` VALUES ('1292', '142', '金乡县');
INSERT INTO `tb_region` VALUES ('1293', '142', '嘉祥县');
INSERT INTO `tb_region` VALUES ('1294', '142', '汶上县');
INSERT INTO `tb_region` VALUES ('1295', '142', '泗水县');
INSERT INTO `tb_region` VALUES ('1296', '142', '梁山县');
INSERT INTO `tb_region` VALUES ('1297', '142', '曲阜市');
INSERT INTO `tb_region` VALUES ('1298', '142', '兖州市');
INSERT INTO `tb_region` VALUES ('1299', '142', '邹城市');
INSERT INTO `tb_region` VALUES ('1300', '143', '泰山区');
INSERT INTO `tb_region` VALUES ('1301', '143', '岱岳区');
INSERT INTO `tb_region` VALUES ('1302', '143', '宁阳县');
INSERT INTO `tb_region` VALUES ('1303', '143', '东平县');
INSERT INTO `tb_region` VALUES ('1304', '143', '新泰市');
INSERT INTO `tb_region` VALUES ('1305', '143', '肥城市');
INSERT INTO `tb_region` VALUES ('1306', '144', '环翠区');
INSERT INTO `tb_region` VALUES ('1307', '144', '文登市');
INSERT INTO `tb_region` VALUES ('1308', '144', '荣成市');
INSERT INTO `tb_region` VALUES ('1309', '144', '乳山市');
INSERT INTO `tb_region` VALUES ('1310', '145', '东港区');
INSERT INTO `tb_region` VALUES ('1311', '145', '岚山区');
INSERT INTO `tb_region` VALUES ('1312', '145', '五莲县');
INSERT INTO `tb_region` VALUES ('1313', '145', '莒县');
INSERT INTO `tb_region` VALUES ('1314', '146', '莱城区');
INSERT INTO `tb_region` VALUES ('1315', '146', '钢城区');
INSERT INTO `tb_region` VALUES ('1316', '147', '兰山区');
INSERT INTO `tb_region` VALUES ('1317', '147', '罗庄区');
INSERT INTO `tb_region` VALUES ('1318', '147', '河东区');
INSERT INTO `tb_region` VALUES ('1319', '147', '沂南县');
INSERT INTO `tb_region` VALUES ('1320', '147', '郯城县');
INSERT INTO `tb_region` VALUES ('1321', '147', '沂水县');
INSERT INTO `tb_region` VALUES ('1322', '147', '苍山县');
INSERT INTO `tb_region` VALUES ('1323', '147', '费县');
INSERT INTO `tb_region` VALUES ('1324', '147', '平邑县');
INSERT INTO `tb_region` VALUES ('1325', '147', '莒南县');
INSERT INTO `tb_region` VALUES ('1326', '147', '蒙阴县');
INSERT INTO `tb_region` VALUES ('1327', '147', '临沭县');
INSERT INTO `tb_region` VALUES ('1328', '148', '德城区');
INSERT INTO `tb_region` VALUES ('1329', '148', '陵县');
INSERT INTO `tb_region` VALUES ('1330', '148', '宁津县');
INSERT INTO `tb_region` VALUES ('1331', '148', '庆云县');
INSERT INTO `tb_region` VALUES ('1332', '148', '临邑县');
INSERT INTO `tb_region` VALUES ('1333', '148', '齐河县');
INSERT INTO `tb_region` VALUES ('1334', '148', '平原县');
INSERT INTO `tb_region` VALUES ('1335', '148', '夏津县');
INSERT INTO `tb_region` VALUES ('1336', '148', '武城县');
INSERT INTO `tb_region` VALUES ('1337', '148', '乐陵市');
INSERT INTO `tb_region` VALUES ('1338', '148', '禹城市');
INSERT INTO `tb_region` VALUES ('1339', '149', '东昌府区');
INSERT INTO `tb_region` VALUES ('1340', '149', '阳谷县');
INSERT INTO `tb_region` VALUES ('1341', '149', '莘县');
INSERT INTO `tb_region` VALUES ('1342', '149', '茌平县');
INSERT INTO `tb_region` VALUES ('1343', '149', '东阿县');
INSERT INTO `tb_region` VALUES ('1344', '149', '冠县');
INSERT INTO `tb_region` VALUES ('1345', '149', '高唐县');
INSERT INTO `tb_region` VALUES ('1346', '149', '临清市');
INSERT INTO `tb_region` VALUES ('1347', '150', '滨城区');
INSERT INTO `tb_region` VALUES ('1348', '150', '惠民县');
INSERT INTO `tb_region` VALUES ('1349', '150', '阳信县');
INSERT INTO `tb_region` VALUES ('1350', '150', '无棣县');
INSERT INTO `tb_region` VALUES ('1351', '150', '沾化县');
INSERT INTO `tb_region` VALUES ('1352', '150', '博兴县');
INSERT INTO `tb_region` VALUES ('1353', '150', '邹平县');
INSERT INTO `tb_region` VALUES ('1354', '151', '牡丹区');
INSERT INTO `tb_region` VALUES ('1355', '151', '曹县');
INSERT INTO `tb_region` VALUES ('1356', '151', '单县');
INSERT INTO `tb_region` VALUES ('1357', '151', '成武县');
INSERT INTO `tb_region` VALUES ('1358', '151', '巨野县');
INSERT INTO `tb_region` VALUES ('1359', '151', '郓城县');
INSERT INTO `tb_region` VALUES ('1360', '151', '鄄城县');
INSERT INTO `tb_region` VALUES ('1361', '151', '定陶县');
INSERT INTO `tb_region` VALUES ('1362', '151', '东明县');
INSERT INTO `tb_region` VALUES ('1363', '152', '中原区');
INSERT INTO `tb_region` VALUES ('1364', '152', '二七区');
INSERT INTO `tb_region` VALUES ('1365', '152', '管城回族区');
INSERT INTO `tb_region` VALUES ('1366', '152', '金水区');
INSERT INTO `tb_region` VALUES ('1367', '152', '上街区');
INSERT INTO `tb_region` VALUES ('1368', '152', '惠济区');
INSERT INTO `tb_region` VALUES ('1369', '152', '中牟县');
INSERT INTO `tb_region` VALUES ('1370', '152', '巩义市');
INSERT INTO `tb_region` VALUES ('1371', '152', '荥阳市');
INSERT INTO `tb_region` VALUES ('1372', '152', '新密市');
INSERT INTO `tb_region` VALUES ('1373', '152', '新郑市');
INSERT INTO `tb_region` VALUES ('1374', '152', '登封市');
INSERT INTO `tb_region` VALUES ('1375', '153', '龙亭区');
INSERT INTO `tb_region` VALUES ('1376', '153', '顺河回族区');
INSERT INTO `tb_region` VALUES ('1377', '153', '鼓楼区');
INSERT INTO `tb_region` VALUES ('1378', '153', '南关区');
INSERT INTO `tb_region` VALUES ('1379', '153', '郊区');
INSERT INTO `tb_region` VALUES ('1380', '153', '杞县');
INSERT INTO `tb_region` VALUES ('1381', '153', '通许县');
INSERT INTO `tb_region` VALUES ('1382', '153', '尉氏县');
INSERT INTO `tb_region` VALUES ('1383', '153', '开封县');
INSERT INTO `tb_region` VALUES ('1384', '153', '兰考县');
INSERT INTO `tb_region` VALUES ('1385', '154', '老城区');
INSERT INTO `tb_region` VALUES ('1386', '154', '西工区');
INSERT INTO `tb_region` VALUES ('1387', '154', '廛河回族区');
INSERT INTO `tb_region` VALUES ('1388', '154', '涧西区');
INSERT INTO `tb_region` VALUES ('1389', '154', '吉利区');
INSERT INTO `tb_region` VALUES ('1390', '154', '洛龙区');
INSERT INTO `tb_region` VALUES ('1391', '154', '孟津县');
INSERT INTO `tb_region` VALUES ('1392', '154', '新安县');
INSERT INTO `tb_region` VALUES ('1393', '154', '栾川县');
INSERT INTO `tb_region` VALUES ('1394', '154', '嵩县');
INSERT INTO `tb_region` VALUES ('1395', '154', '汝阳县');
INSERT INTO `tb_region` VALUES ('1396', '154', '宜阳县');
INSERT INTO `tb_region` VALUES ('1397', '154', '洛宁县');
INSERT INTO `tb_region` VALUES ('1398', '154', '伊川县');
INSERT INTO `tb_region` VALUES ('1399', '154', '偃师市');
INSERT INTO `tb_region` VALUES ('1400', '155', '新华区');
INSERT INTO `tb_region` VALUES ('1401', '155', '卫东区');
INSERT INTO `tb_region` VALUES ('1402', '155', '石龙区');
INSERT INTO `tb_region` VALUES ('1403', '155', '湛河区');
INSERT INTO `tb_region` VALUES ('1404', '155', '宝丰县');
INSERT INTO `tb_region` VALUES ('1405', '155', '叶县');
INSERT INTO `tb_region` VALUES ('1406', '155', '鲁山县');
INSERT INTO `tb_region` VALUES ('1407', '155', '郏县');
INSERT INTO `tb_region` VALUES ('1408', '155', '舞钢市');
INSERT INTO `tb_region` VALUES ('1409', '155', '汝州市');
INSERT INTO `tb_region` VALUES ('1410', '156', '文峰区');
INSERT INTO `tb_region` VALUES ('1411', '156', '北关区');
INSERT INTO `tb_region` VALUES ('1412', '156', '殷都区');
INSERT INTO `tb_region` VALUES ('1413', '156', '龙安区');
INSERT INTO `tb_region` VALUES ('1414', '156', '安阳县');
INSERT INTO `tb_region` VALUES ('1415', '156', '汤阴县');
INSERT INTO `tb_region` VALUES ('1416', '156', '滑县');
INSERT INTO `tb_region` VALUES ('1417', '156', '内黄县');
INSERT INTO `tb_region` VALUES ('1418', '156', '林州市');
INSERT INTO `tb_region` VALUES ('1419', '157', '鹤山区');
INSERT INTO `tb_region` VALUES ('1420', '157', '山城区');
INSERT INTO `tb_region` VALUES ('1421', '157', '淇滨区');
INSERT INTO `tb_region` VALUES ('1422', '157', '浚县');
INSERT INTO `tb_region` VALUES ('1423', '157', '淇县');
INSERT INTO `tb_region` VALUES ('1424', '158', '红旗区');
INSERT INTO `tb_region` VALUES ('1425', '158', '卫滨区');
INSERT INTO `tb_region` VALUES ('1426', '158', '凤泉区');
INSERT INTO `tb_region` VALUES ('1427', '158', '牧野区');
INSERT INTO `tb_region` VALUES ('1428', '158', '新乡县');
INSERT INTO `tb_region` VALUES ('1429', '158', '获嘉县');
INSERT INTO `tb_region` VALUES ('1430', '158', '原阳县');
INSERT INTO `tb_region` VALUES ('1431', '158', '延津县');
INSERT INTO `tb_region` VALUES ('1432', '158', '封丘县');
INSERT INTO `tb_region` VALUES ('1433', '158', '长垣县');
INSERT INTO `tb_region` VALUES ('1434', '158', '卫辉市');
INSERT INTO `tb_region` VALUES ('1435', '158', '辉县市');
INSERT INTO `tb_region` VALUES ('1436', '159', '解放区');
INSERT INTO `tb_region` VALUES ('1437', '159', '中站区');
INSERT INTO `tb_region` VALUES ('1438', '159', '马村区');
INSERT INTO `tb_region` VALUES ('1439', '159', '山阳区');
INSERT INTO `tb_region` VALUES ('1440', '159', '修武县');
INSERT INTO `tb_region` VALUES ('1441', '159', '博爱县');
INSERT INTO `tb_region` VALUES ('1442', '159', '武陟县');
INSERT INTO `tb_region` VALUES ('1443', '159', '温县');
INSERT INTO `tb_region` VALUES ('1444', '159', '济源市');
INSERT INTO `tb_region` VALUES ('1445', '159', '沁阳市');
INSERT INTO `tb_region` VALUES ('1446', '159', '孟州市');
INSERT INTO `tb_region` VALUES ('1447', '160', '华龙区');
INSERT INTO `tb_region` VALUES ('1448', '160', '清丰县');
INSERT INTO `tb_region` VALUES ('1449', '160', '南乐县');
INSERT INTO `tb_region` VALUES ('1450', '160', '范县');
INSERT INTO `tb_region` VALUES ('1451', '160', '台前县');
INSERT INTO `tb_region` VALUES ('1452', '160', '濮阳县');
INSERT INTO `tb_region` VALUES ('1453', '161', '魏都区');
INSERT INTO `tb_region` VALUES ('1454', '161', '许昌县');
INSERT INTO `tb_region` VALUES ('1455', '161', '鄢陵县');
INSERT INTO `tb_region` VALUES ('1456', '161', '襄城县');
INSERT INTO `tb_region` VALUES ('1457', '161', '禹州市');
INSERT INTO `tb_region` VALUES ('1458', '161', '长葛市');
INSERT INTO `tb_region` VALUES ('1459', '162', '源汇区');
INSERT INTO `tb_region` VALUES ('1460', '162', '郾城区');
INSERT INTO `tb_region` VALUES ('1461', '162', '召陵区');
INSERT INTO `tb_region` VALUES ('1462', '162', '舞阳县');
INSERT INTO `tb_region` VALUES ('1463', '162', '临颍县');
INSERT INTO `tb_region` VALUES ('1464', '163', '市辖区');
INSERT INTO `tb_region` VALUES ('1465', '163', '湖滨区');
INSERT INTO `tb_region` VALUES ('1466', '163', '渑池县');
INSERT INTO `tb_region` VALUES ('1467', '163', '陕县');
INSERT INTO `tb_region` VALUES ('1468', '163', '卢氏县');
INSERT INTO `tb_region` VALUES ('1469', '163', '义马市');
INSERT INTO `tb_region` VALUES ('1470', '163', '灵宝市');
INSERT INTO `tb_region` VALUES ('1471', '164', '宛城区');
INSERT INTO `tb_region` VALUES ('1472', '164', '卧龙区');
INSERT INTO `tb_region` VALUES ('1473', '164', '南召县');
INSERT INTO `tb_region` VALUES ('1474', '164', '方城县');
INSERT INTO `tb_region` VALUES ('1475', '164', '西峡县');
INSERT INTO `tb_region` VALUES ('1476', '164', '镇平县');
INSERT INTO `tb_region` VALUES ('1477', '164', '内乡县');
INSERT INTO `tb_region` VALUES ('1478', '164', '淅川县');
INSERT INTO `tb_region` VALUES ('1479', '164', '社旗县');
INSERT INTO `tb_region` VALUES ('1480', '164', '唐河县');
INSERT INTO `tb_region` VALUES ('1481', '164', '新野县');
INSERT INTO `tb_region` VALUES ('1482', '164', '桐柏县');
INSERT INTO `tb_region` VALUES ('1483', '164', '邓州市');
INSERT INTO `tb_region` VALUES ('1484', '165', '梁园区');
INSERT INTO `tb_region` VALUES ('1485', '165', '睢阳区');
INSERT INTO `tb_region` VALUES ('1486', '165', '民权县');
INSERT INTO `tb_region` VALUES ('1487', '165', '睢县');
INSERT INTO `tb_region` VALUES ('1488', '165', '宁陵县');
INSERT INTO `tb_region` VALUES ('1489', '165', '柘城县');
INSERT INTO `tb_region` VALUES ('1490', '165', '虞城县');
INSERT INTO `tb_region` VALUES ('1491', '165', '夏邑县');
INSERT INTO `tb_region` VALUES ('1492', '165', '永城市');
INSERT INTO `tb_region` VALUES ('1493', '166', '浉河区');
INSERT INTO `tb_region` VALUES ('1494', '166', '平桥区');
INSERT INTO `tb_region` VALUES ('1495', '166', '罗山县');
INSERT INTO `tb_region` VALUES ('1496', '166', '光山县');
INSERT INTO `tb_region` VALUES ('1497', '166', '新县');
INSERT INTO `tb_region` VALUES ('1498', '166', '商城县');
INSERT INTO `tb_region` VALUES ('1499', '166', '固始县');
INSERT INTO `tb_region` VALUES ('1500', '166', '潢川县');
INSERT INTO `tb_region` VALUES ('1501', '166', '淮滨县');
INSERT INTO `tb_region` VALUES ('1502', '166', '息县');
INSERT INTO `tb_region` VALUES ('1503', '167', '川汇区');
INSERT INTO `tb_region` VALUES ('1504', '167', '扶沟县');
INSERT INTO `tb_region` VALUES ('1505', '167', '西华县');
INSERT INTO `tb_region` VALUES ('1506', '167', '商水县');
INSERT INTO `tb_region` VALUES ('1507', '167', '沈丘县');
INSERT INTO `tb_region` VALUES ('1508', '167', '郸城县');
INSERT INTO `tb_region` VALUES ('1509', '167', '淮阳县');
INSERT INTO `tb_region` VALUES ('1510', '167', '太康县');
INSERT INTO `tb_region` VALUES ('1511', '167', '鹿邑县');
INSERT INTO `tb_region` VALUES ('1512', '167', '项城市');
INSERT INTO `tb_region` VALUES ('1513', '168', '驿城区');
INSERT INTO `tb_region` VALUES ('1514', '168', '西平县');
INSERT INTO `tb_region` VALUES ('1515', '168', '上蔡县');
INSERT INTO `tb_region` VALUES ('1516', '168', '平舆县');
INSERT INTO `tb_region` VALUES ('1517', '168', '正阳县');
INSERT INTO `tb_region` VALUES ('1518', '168', '确山县');
INSERT INTO `tb_region` VALUES ('1519', '168', '泌阳县');
INSERT INTO `tb_region` VALUES ('1520', '168', '汝南县');
INSERT INTO `tb_region` VALUES ('1521', '168', '遂平县');
INSERT INTO `tb_region` VALUES ('1522', '168', '新蔡县');
INSERT INTO `tb_region` VALUES ('1523', '169', '江岸区');
INSERT INTO `tb_region` VALUES ('1524', '169', '江汉区');
INSERT INTO `tb_region` VALUES ('1525', '169', '硚口区');
INSERT INTO `tb_region` VALUES ('1526', '169', '汉阳区');
INSERT INTO `tb_region` VALUES ('1527', '169', '武昌区');
INSERT INTO `tb_region` VALUES ('1528', '169', '青山区');
INSERT INTO `tb_region` VALUES ('1529', '169', '洪山区');
INSERT INTO `tb_region` VALUES ('1530', '169', '东西湖区');
INSERT INTO `tb_region` VALUES ('1531', '169', '汉南区');
INSERT INTO `tb_region` VALUES ('1532', '169', '蔡甸区');
INSERT INTO `tb_region` VALUES ('1533', '169', '江夏区');
INSERT INTO `tb_region` VALUES ('1534', '169', '黄陂区');
INSERT INTO `tb_region` VALUES ('1535', '169', '新洲区');
INSERT INTO `tb_region` VALUES ('1536', '170', '黄石港区');
INSERT INTO `tb_region` VALUES ('1537', '170', '西塞山区');
INSERT INTO `tb_region` VALUES ('1538', '170', '下陆区');
INSERT INTO `tb_region` VALUES ('1539', '170', '铁山区');
INSERT INTO `tb_region` VALUES ('1540', '170', '阳新县');
INSERT INTO `tb_region` VALUES ('1541', '170', '大冶市');
INSERT INTO `tb_region` VALUES ('1542', '171', '茅箭区');
INSERT INTO `tb_region` VALUES ('1543', '171', '张湾区');
INSERT INTO `tb_region` VALUES ('1544', '171', '郧县');
INSERT INTO `tb_region` VALUES ('1545', '171', '郧西县');
INSERT INTO `tb_region` VALUES ('1546', '171', '竹山县');
INSERT INTO `tb_region` VALUES ('1547', '171', '竹溪县');
INSERT INTO `tb_region` VALUES ('1548', '171', '房县');
INSERT INTO `tb_region` VALUES ('1549', '171', '丹江口市');
INSERT INTO `tb_region` VALUES ('1550', '172', '西陵区');
INSERT INTO `tb_region` VALUES ('1551', '172', '伍家岗区');
INSERT INTO `tb_region` VALUES ('1552', '172', '点军区');
INSERT INTO `tb_region` VALUES ('1553', '172', '猇亭区');
INSERT INTO `tb_region` VALUES ('1554', '172', '夷陵区');
INSERT INTO `tb_region` VALUES ('1555', '172', '远安县');
INSERT INTO `tb_region` VALUES ('1556', '172', '兴山县');
INSERT INTO `tb_region` VALUES ('1557', '172', '秭归县');
INSERT INTO `tb_region` VALUES ('1558', '172', '长阳土家族自治县');
INSERT INTO `tb_region` VALUES ('1559', '172', '五峰土家族自治县');
INSERT INTO `tb_region` VALUES ('1560', '172', '宜都市');
INSERT INTO `tb_region` VALUES ('1561', '172', '当阳市');
INSERT INTO `tb_region` VALUES ('1562', '172', '枝江市');
INSERT INTO `tb_region` VALUES ('1563', '173', '襄城区');
INSERT INTO `tb_region` VALUES ('1564', '173', '樊城区');
INSERT INTO `tb_region` VALUES ('1565', '173', '襄阳区');
INSERT INTO `tb_region` VALUES ('1566', '173', '南漳县');
INSERT INTO `tb_region` VALUES ('1567', '173', '谷城县');
INSERT INTO `tb_region` VALUES ('1568', '173', '保康县');
INSERT INTO `tb_region` VALUES ('1569', '173', '老河口市');
INSERT INTO `tb_region` VALUES ('1570', '173', '枣阳市');
INSERT INTO `tb_region` VALUES ('1571', '173', '宜城市');
INSERT INTO `tb_region` VALUES ('1572', '174', '梁子湖区');
INSERT INTO `tb_region` VALUES ('1573', '174', '华容区');
INSERT INTO `tb_region` VALUES ('1574', '174', '鄂城区');
INSERT INTO `tb_region` VALUES ('1575', '175', '东宝区');
INSERT INTO `tb_region` VALUES ('1576', '175', '掇刀区');
INSERT INTO `tb_region` VALUES ('1577', '175', '京山县');
INSERT INTO `tb_region` VALUES ('1578', '175', '沙洋县');
INSERT INTO `tb_region` VALUES ('1579', '175', '钟祥市');
INSERT INTO `tb_region` VALUES ('1580', '176', '孝南区');
INSERT INTO `tb_region` VALUES ('1581', '176', '孝昌县');
INSERT INTO `tb_region` VALUES ('1582', '176', '大悟县');
INSERT INTO `tb_region` VALUES ('1583', '176', '云梦县');
INSERT INTO `tb_region` VALUES ('1584', '176', '应城市');
INSERT INTO `tb_region` VALUES ('1585', '176', '安陆市');
INSERT INTO `tb_region` VALUES ('1586', '176', '汉川市');
INSERT INTO `tb_region` VALUES ('1587', '177', '沙市区');
INSERT INTO `tb_region` VALUES ('1588', '177', '荆州区');
INSERT INTO `tb_region` VALUES ('1589', '177', '公安县');
INSERT INTO `tb_region` VALUES ('1590', '177', '监利县');
INSERT INTO `tb_region` VALUES ('1591', '177', '江陵县');
INSERT INTO `tb_region` VALUES ('1592', '177', '石首市');
INSERT INTO `tb_region` VALUES ('1593', '177', '洪湖市');
INSERT INTO `tb_region` VALUES ('1594', '177', '松滋市');
INSERT INTO `tb_region` VALUES ('1595', '178', '黄州区');
INSERT INTO `tb_region` VALUES ('1596', '178', '团风县');
INSERT INTO `tb_region` VALUES ('1597', '178', '红安县');
INSERT INTO `tb_region` VALUES ('1598', '178', '罗田县');
INSERT INTO `tb_region` VALUES ('1599', '178', '英山县');
INSERT INTO `tb_region` VALUES ('1600', '178', '浠水县');
INSERT INTO `tb_region` VALUES ('1601', '178', '蕲春县');
INSERT INTO `tb_region` VALUES ('1602', '178', '黄梅县');
INSERT INTO `tb_region` VALUES ('1603', '178', '麻城市');
INSERT INTO `tb_region` VALUES ('1604', '178', '武穴市');
INSERT INTO `tb_region` VALUES ('1605', '179', '咸安区');
INSERT INTO `tb_region` VALUES ('1606', '179', '嘉鱼县');
INSERT INTO `tb_region` VALUES ('1607', '179', '通城县');
INSERT INTO `tb_region` VALUES ('1608', '179', '崇阳县');
INSERT INTO `tb_region` VALUES ('1609', '179', '通山县');
INSERT INTO `tb_region` VALUES ('1610', '179', '赤壁市');
INSERT INTO `tb_region` VALUES ('1611', '180', '曾都区');
INSERT INTO `tb_region` VALUES ('1612', '180', '广水市');
INSERT INTO `tb_region` VALUES ('1613', '181', '恩施市');
INSERT INTO `tb_region` VALUES ('1614', '181', '利川市');
INSERT INTO `tb_region` VALUES ('1615', '181', '建始县');
INSERT INTO `tb_region` VALUES ('1616', '181', '巴东县');
INSERT INTO `tb_region` VALUES ('1617', '181', '宣恩县');
INSERT INTO `tb_region` VALUES ('1618', '181', '咸丰县');
INSERT INTO `tb_region` VALUES ('1619', '181', '来凤县');
INSERT INTO `tb_region` VALUES ('1620', '181', '鹤峰县');
INSERT INTO `tb_region` VALUES ('1621', '182', '仙桃市');
INSERT INTO `tb_region` VALUES ('1622', '182', '潜江市');
INSERT INTO `tb_region` VALUES ('1623', '182', '天门市');
INSERT INTO `tb_region` VALUES ('1624', '182', '神农架林区');
INSERT INTO `tb_region` VALUES ('1625', '183', '芙蓉区');
INSERT INTO `tb_region` VALUES ('1626', '183', '天心区');
INSERT INTO `tb_region` VALUES ('1627', '183', '岳麓区');
INSERT INTO `tb_region` VALUES ('1628', '183', '开福区');
INSERT INTO `tb_region` VALUES ('1629', '183', '雨花区');
INSERT INTO `tb_region` VALUES ('1630', '183', '长沙县');
INSERT INTO `tb_region` VALUES ('1631', '183', '望城县');
INSERT INTO `tb_region` VALUES ('1632', '183', '宁乡县');
INSERT INTO `tb_region` VALUES ('1633', '183', '浏阳市');
INSERT INTO `tb_region` VALUES ('1634', '184', '荷塘区');
INSERT INTO `tb_region` VALUES ('1635', '184', '芦淞区');
INSERT INTO `tb_region` VALUES ('1636', '184', '石峰区');
INSERT INTO `tb_region` VALUES ('1637', '184', '天元区');
INSERT INTO `tb_region` VALUES ('1638', '184', '株洲县');
INSERT INTO `tb_region` VALUES ('1639', '184', '攸县');
INSERT INTO `tb_region` VALUES ('1640', '184', '茶陵县');
INSERT INTO `tb_region` VALUES ('1641', '184', '炎陵县');
INSERT INTO `tb_region` VALUES ('1642', '184', '醴陵市');
INSERT INTO `tb_region` VALUES ('1643', '185', '雨湖区');
INSERT INTO `tb_region` VALUES ('1644', '185', '岳塘区');
INSERT INTO `tb_region` VALUES ('1645', '185', '湘潭县');
INSERT INTO `tb_region` VALUES ('1646', '185', '湘乡市');
INSERT INTO `tb_region` VALUES ('1647', '185', '韶山市');
INSERT INTO `tb_region` VALUES ('1648', '186', '珠晖区');
INSERT INTO `tb_region` VALUES ('1649', '186', '雁峰区');
INSERT INTO `tb_region` VALUES ('1650', '186', '石鼓区');
INSERT INTO `tb_region` VALUES ('1651', '186', '蒸湘区');
INSERT INTO `tb_region` VALUES ('1652', '186', '南岳区');
INSERT INTO `tb_region` VALUES ('1653', '186', '衡阳县');
INSERT INTO `tb_region` VALUES ('1654', '186', '衡南县');
INSERT INTO `tb_region` VALUES ('1655', '186', '衡山县');
INSERT INTO `tb_region` VALUES ('1656', '186', '衡东县');
INSERT INTO `tb_region` VALUES ('1657', '186', '祁东县');
INSERT INTO `tb_region` VALUES ('1658', '186', '耒阳市');
INSERT INTO `tb_region` VALUES ('1659', '186', '常宁市');
INSERT INTO `tb_region` VALUES ('1660', '187', '双清区');
INSERT INTO `tb_region` VALUES ('1661', '187', '大祥区');
INSERT INTO `tb_region` VALUES ('1662', '187', '北塔区');
INSERT INTO `tb_region` VALUES ('1663', '187', '邵东县');
INSERT INTO `tb_region` VALUES ('1664', '187', '新邵县');
INSERT INTO `tb_region` VALUES ('1665', '187', '邵阳县');
INSERT INTO `tb_region` VALUES ('1666', '187', '隆回县');
INSERT INTO `tb_region` VALUES ('1667', '187', '洞口县');
INSERT INTO `tb_region` VALUES ('1668', '187', '绥宁县');
INSERT INTO `tb_region` VALUES ('1669', '187', '新宁县');
INSERT INTO `tb_region` VALUES ('1670', '187', '城步苗族自治县');
INSERT INTO `tb_region` VALUES ('1671', '187', '武冈市');
INSERT INTO `tb_region` VALUES ('1672', '188', '岳阳楼区');
INSERT INTO `tb_region` VALUES ('1673', '188', '云溪区');
INSERT INTO `tb_region` VALUES ('1674', '188', '君山区');
INSERT INTO `tb_region` VALUES ('1675', '188', '岳阳县');
INSERT INTO `tb_region` VALUES ('1676', '188', '华容县');
INSERT INTO `tb_region` VALUES ('1677', '188', '湘阴县');
INSERT INTO `tb_region` VALUES ('1678', '188', '平江县');
INSERT INTO `tb_region` VALUES ('1679', '188', '汨罗市');
INSERT INTO `tb_region` VALUES ('1680', '188', '临湘市');
INSERT INTO `tb_region` VALUES ('1681', '189', '武陵区');
INSERT INTO `tb_region` VALUES ('1682', '189', '鼎城区');
INSERT INTO `tb_region` VALUES ('1683', '189', '安乡县');
INSERT INTO `tb_region` VALUES ('1684', '189', '汉寿县');
INSERT INTO `tb_region` VALUES ('1685', '189', '澧县');
INSERT INTO `tb_region` VALUES ('1686', '189', '临澧县');
INSERT INTO `tb_region` VALUES ('1687', '189', '桃源县');
INSERT INTO `tb_region` VALUES ('1688', '189', '石门县');
INSERT INTO `tb_region` VALUES ('1689', '189', '津市市');
INSERT INTO `tb_region` VALUES ('1690', '190', '永定区');
INSERT INTO `tb_region` VALUES ('1691', '190', '武陵源区');
INSERT INTO `tb_region` VALUES ('1692', '190', '慈利县');
INSERT INTO `tb_region` VALUES ('1693', '190', '桑植县');
INSERT INTO `tb_region` VALUES ('1694', '191', '资阳区');
INSERT INTO `tb_region` VALUES ('1695', '191', '赫山区');
INSERT INTO `tb_region` VALUES ('1696', '191', '南县');
INSERT INTO `tb_region` VALUES ('1697', '191', '桃江县');
INSERT INTO `tb_region` VALUES ('1698', '191', '安化县');
INSERT INTO `tb_region` VALUES ('1699', '191', '沅江市');
INSERT INTO `tb_region` VALUES ('1700', '192', '北湖区');
INSERT INTO `tb_region` VALUES ('1701', '192', '苏仙区');
INSERT INTO `tb_region` VALUES ('1702', '192', '桂阳县');
INSERT INTO `tb_region` VALUES ('1703', '192', '宜章县');
INSERT INTO `tb_region` VALUES ('1704', '192', '永兴县');
INSERT INTO `tb_region` VALUES ('1705', '192', '嘉禾县');
INSERT INTO `tb_region` VALUES ('1706', '192', '临武县');
INSERT INTO `tb_region` VALUES ('1707', '192', '汝城县');
INSERT INTO `tb_region` VALUES ('1708', '192', '桂东县');
INSERT INTO `tb_region` VALUES ('1709', '192', '安仁县');
INSERT INTO `tb_region` VALUES ('1710', '192', '资兴市');
INSERT INTO `tb_region` VALUES ('1711', '193', '芝山区');
INSERT INTO `tb_region` VALUES ('1712', '193', '冷水滩区');
INSERT INTO `tb_region` VALUES ('1713', '193', '祁阳县');
INSERT INTO `tb_region` VALUES ('1714', '193', '东安县');
INSERT INTO `tb_region` VALUES ('1715', '193', '双牌县');
INSERT INTO `tb_region` VALUES ('1716', '193', '道县');
INSERT INTO `tb_region` VALUES ('1717', '193', '江永县');
INSERT INTO `tb_region` VALUES ('1718', '193', '宁远县');
INSERT INTO `tb_region` VALUES ('1719', '193', '蓝山县');
INSERT INTO `tb_region` VALUES ('1720', '193', '新田县');
INSERT INTO `tb_region` VALUES ('1721', '193', '江华瑶族自治县');
INSERT INTO `tb_region` VALUES ('1722', '194', '鹤城区');
INSERT INTO `tb_region` VALUES ('1723', '194', '中方县');
INSERT INTO `tb_region` VALUES ('1724', '194', '沅陵县');
INSERT INTO `tb_region` VALUES ('1725', '194', '辰溪县');
INSERT INTO `tb_region` VALUES ('1726', '194', '溆浦县');
INSERT INTO `tb_region` VALUES ('1727', '194', '会同县');
INSERT INTO `tb_region` VALUES ('1728', '194', '麻阳苗族自治县');
INSERT INTO `tb_region` VALUES ('1729', '194', '新晃侗族自治县');
INSERT INTO `tb_region` VALUES ('1730', '194', '芷江侗族自治县');
INSERT INTO `tb_region` VALUES ('1731', '194', '靖州苗族侗族自治县');
INSERT INTO `tb_region` VALUES ('1732', '194', '通道侗族自治县');
INSERT INTO `tb_region` VALUES ('1733', '194', '洪江市');
INSERT INTO `tb_region` VALUES ('1734', '195', '娄星区');
INSERT INTO `tb_region` VALUES ('1735', '195', '双峰县');
INSERT INTO `tb_region` VALUES ('1736', '195', '新化县');
INSERT INTO `tb_region` VALUES ('1737', '195', '冷水江市');
INSERT INTO `tb_region` VALUES ('1738', '195', '涟源市');
INSERT INTO `tb_region` VALUES ('1739', '196', '吉首市');
INSERT INTO `tb_region` VALUES ('1740', '196', '泸溪县');
INSERT INTO `tb_region` VALUES ('1741', '196', '凤凰县');
INSERT INTO `tb_region` VALUES ('1742', '196', '花垣县');
INSERT INTO `tb_region` VALUES ('1743', '196', '保靖县');
INSERT INTO `tb_region` VALUES ('1744', '196', '古丈县');
INSERT INTO `tb_region` VALUES ('1745', '196', '永顺县');
INSERT INTO `tb_region` VALUES ('1746', '196', '龙山县');
INSERT INTO `tb_region` VALUES ('1747', '197', '东山区');
INSERT INTO `tb_region` VALUES ('1748', '197', '荔湾区');
INSERT INTO `tb_region` VALUES ('1749', '197', '越秀区');
INSERT INTO `tb_region` VALUES ('1750', '197', '海珠区');
INSERT INTO `tb_region` VALUES ('1751', '197', '天河区');
INSERT INTO `tb_region` VALUES ('1752', '197', '芳村区');
INSERT INTO `tb_region` VALUES ('1753', '197', '白云区');
INSERT INTO `tb_region` VALUES ('1754', '197', '黄埔区');
INSERT INTO `tb_region` VALUES ('1755', '197', '番禺区');
INSERT INTO `tb_region` VALUES ('1756', '197', '花都区');
INSERT INTO `tb_region` VALUES ('1757', '197', '增城市');
INSERT INTO `tb_region` VALUES ('1758', '197', '从化市');
INSERT INTO `tb_region` VALUES ('1759', '198', '武江区');
INSERT INTO `tb_region` VALUES ('1760', '198', '浈江区');
INSERT INTO `tb_region` VALUES ('1761', '198', '曲江区');
INSERT INTO `tb_region` VALUES ('1762', '198', '始兴县');
INSERT INTO `tb_region` VALUES ('1763', '198', '仁化县');
INSERT INTO `tb_region` VALUES ('1764', '198', '翁源县');
INSERT INTO `tb_region` VALUES ('1765', '198', '乳源瑶族自治县');
INSERT INTO `tb_region` VALUES ('1766', '198', '新丰县');
INSERT INTO `tb_region` VALUES ('1767', '198', '乐昌市');
INSERT INTO `tb_region` VALUES ('1768', '198', '南雄市');
INSERT INTO `tb_region` VALUES ('1769', '199', '罗湖区');
INSERT INTO `tb_region` VALUES ('1770', '199', '福田区');
INSERT INTO `tb_region` VALUES ('1771', '199', '南山区');
INSERT INTO `tb_region` VALUES ('1772', '199', '宝安区');
INSERT INTO `tb_region` VALUES ('1773', '199', '龙岗区');
INSERT INTO `tb_region` VALUES ('1774', '199', '盐田区');
INSERT INTO `tb_region` VALUES ('1775', '200', '香洲区');
INSERT INTO `tb_region` VALUES ('1776', '200', '斗门区');
INSERT INTO `tb_region` VALUES ('1777', '200', '金湾区');
INSERT INTO `tb_region` VALUES ('1778', '201', '龙湖区');
INSERT INTO `tb_region` VALUES ('1779', '201', '金平区');
INSERT INTO `tb_region` VALUES ('1780', '201', '濠江区');
INSERT INTO `tb_region` VALUES ('1781', '201', '潮阳区');
INSERT INTO `tb_region` VALUES ('1782', '201', '潮南区');
INSERT INTO `tb_region` VALUES ('1783', '201', '澄海区');
INSERT INTO `tb_region` VALUES ('1784', '201', '南澳县');
INSERT INTO `tb_region` VALUES ('1785', '202', '禅城区');
INSERT INTO `tb_region` VALUES ('1786', '202', '南海区');
INSERT INTO `tb_region` VALUES ('1787', '202', '顺德区');
INSERT INTO `tb_region` VALUES ('1788', '202', '三水区');
INSERT INTO `tb_region` VALUES ('1789', '202', '高明区');
INSERT INTO `tb_region` VALUES ('1790', '203', '蓬江区');
INSERT INTO `tb_region` VALUES ('1791', '203', '江海区');
INSERT INTO `tb_region` VALUES ('1792', '203', '新会区');
INSERT INTO `tb_region` VALUES ('1793', '203', '台山市');
INSERT INTO `tb_region` VALUES ('1794', '203', '开平市');
INSERT INTO `tb_region` VALUES ('1795', '203', '鹤山市');
INSERT INTO `tb_region` VALUES ('1796', '203', '恩平市');
INSERT INTO `tb_region` VALUES ('1797', '204', '赤坎区');
INSERT INTO `tb_region` VALUES ('1798', '204', '霞山区');
INSERT INTO `tb_region` VALUES ('1799', '204', '坡头区');
INSERT INTO `tb_region` VALUES ('1800', '204', '麻章区');
INSERT INTO `tb_region` VALUES ('1801', '204', '遂溪县');
INSERT INTO `tb_region` VALUES ('1802', '204', '徐闻县');
INSERT INTO `tb_region` VALUES ('1803', '204', '廉江市');
INSERT INTO `tb_region` VALUES ('1804', '204', '雷州市');
INSERT INTO `tb_region` VALUES ('1805', '204', '吴川市');
INSERT INTO `tb_region` VALUES ('1806', '205', '茂南区');
INSERT INTO `tb_region` VALUES ('1807', '205', '茂港区');
INSERT INTO `tb_region` VALUES ('1808', '205', '电白县');
INSERT INTO `tb_region` VALUES ('1809', '205', '高州市');
INSERT INTO `tb_region` VALUES ('1810', '205', '化州市');
INSERT INTO `tb_region` VALUES ('1811', '205', '信宜市');
INSERT INTO `tb_region` VALUES ('1812', '206', '端州区');
INSERT INTO `tb_region` VALUES ('1813', '206', '鼎湖区');
INSERT INTO `tb_region` VALUES ('1814', '206', '广宁县');
INSERT INTO `tb_region` VALUES ('1815', '206', '怀集县');
INSERT INTO `tb_region` VALUES ('1816', '206', '封开县');
INSERT INTO `tb_region` VALUES ('1817', '206', '德庆县');
INSERT INTO `tb_region` VALUES ('1818', '206', '高要市');
INSERT INTO `tb_region` VALUES ('1819', '206', '四会市');
INSERT INTO `tb_region` VALUES ('1820', '207', '惠城区');
INSERT INTO `tb_region` VALUES ('1821', '207', '惠阳区');
INSERT INTO `tb_region` VALUES ('1822', '207', '博罗县');
INSERT INTO `tb_region` VALUES ('1823', '207', '惠东县');
INSERT INTO `tb_region` VALUES ('1824', '207', '龙门县');
INSERT INTO `tb_region` VALUES ('1825', '208', '梅江区');
INSERT INTO `tb_region` VALUES ('1826', '208', '梅县');
INSERT INTO `tb_region` VALUES ('1827', '208', '大埔县');
INSERT INTO `tb_region` VALUES ('1828', '208', '丰顺县');
INSERT INTO `tb_region` VALUES ('1829', '208', '五华县');
INSERT INTO `tb_region` VALUES ('1830', '208', '平远县');
INSERT INTO `tb_region` VALUES ('1831', '208', '蕉岭县');
INSERT INTO `tb_region` VALUES ('1832', '208', '兴宁市');
INSERT INTO `tb_region` VALUES ('1833', '209', '城区');
INSERT INTO `tb_region` VALUES ('1834', '209', '海丰县');
INSERT INTO `tb_region` VALUES ('1835', '209', '陆河县');
INSERT INTO `tb_region` VALUES ('1836', '209', '陆丰市');
INSERT INTO `tb_region` VALUES ('1837', '210', '源城区');
INSERT INTO `tb_region` VALUES ('1838', '210', '紫金县');
INSERT INTO `tb_region` VALUES ('1839', '210', '龙川县');
INSERT INTO `tb_region` VALUES ('1840', '210', '连平县');
INSERT INTO `tb_region` VALUES ('1841', '210', '和平县');
INSERT INTO `tb_region` VALUES ('1842', '210', '东源县');
INSERT INTO `tb_region` VALUES ('1843', '211', '江城区');
INSERT INTO `tb_region` VALUES ('1844', '211', '阳西县');
INSERT INTO `tb_region` VALUES ('1845', '211', '阳东县');
INSERT INTO `tb_region` VALUES ('1846', '211', '阳春市');
INSERT INTO `tb_region` VALUES ('1847', '212', '清城区');
INSERT INTO `tb_region` VALUES ('1848', '212', '佛冈县');
INSERT INTO `tb_region` VALUES ('1849', '212', '阳山县');
INSERT INTO `tb_region` VALUES ('1850', '212', '连山壮族瑶族自治县');
INSERT INTO `tb_region` VALUES ('1851', '212', '连南瑶族自治县');
INSERT INTO `tb_region` VALUES ('1852', '212', '清新县');
INSERT INTO `tb_region` VALUES ('1853', '212', '英德市');
INSERT INTO `tb_region` VALUES ('1854', '212', '连州市');
INSERT INTO `tb_region` VALUES ('1855', '215', '湘桥区');
INSERT INTO `tb_region` VALUES ('1856', '215', '潮安县');
INSERT INTO `tb_region` VALUES ('1857', '215', '饶平县');
INSERT INTO `tb_region` VALUES ('1858', '216', '榕城区');
INSERT INTO `tb_region` VALUES ('1859', '216', '揭东县');
INSERT INTO `tb_region` VALUES ('1860', '216', '揭西县');
INSERT INTO `tb_region` VALUES ('1861', '216', '惠来县');
INSERT INTO `tb_region` VALUES ('1862', '216', '普宁市');
INSERT INTO `tb_region` VALUES ('1863', '217', '云城区');
INSERT INTO `tb_region` VALUES ('1864', '217', '新兴县');
INSERT INTO `tb_region` VALUES ('1865', '217', '郁南县');
INSERT INTO `tb_region` VALUES ('1866', '217', '云安县');
INSERT INTO `tb_region` VALUES ('1867', '217', '罗定市');
INSERT INTO `tb_region` VALUES ('1868', '218', '兴宁区');
INSERT INTO `tb_region` VALUES ('1869', '218', '青秀区');
INSERT INTO `tb_region` VALUES ('1870', '218', '江南区');
INSERT INTO `tb_region` VALUES ('1871', '218', '西乡塘区');
INSERT INTO `tb_region` VALUES ('1872', '218', '良庆区');
INSERT INTO `tb_region` VALUES ('1873', '218', '邕宁区');
INSERT INTO `tb_region` VALUES ('1874', '218', '武鸣县');
INSERT INTO `tb_region` VALUES ('1875', '218', '隆安县');
INSERT INTO `tb_region` VALUES ('1876', '218', '马山县');
INSERT INTO `tb_region` VALUES ('1877', '218', '上林县');
INSERT INTO `tb_region` VALUES ('1878', '218', '宾阳县');
INSERT INTO `tb_region` VALUES ('1879', '218', '横县');
INSERT INTO `tb_region` VALUES ('1880', '219', '城中区');
INSERT INTO `tb_region` VALUES ('1881', '219', '鱼峰区');
INSERT INTO `tb_region` VALUES ('1882', '219', '柳南区');
INSERT INTO `tb_region` VALUES ('1883', '219', '柳北区');
INSERT INTO `tb_region` VALUES ('1884', '219', '柳江县');
INSERT INTO `tb_region` VALUES ('1885', '219', '柳城县');
INSERT INTO `tb_region` VALUES ('1886', '219', '鹿寨县');
INSERT INTO `tb_region` VALUES ('1887', '219', '融安县');
INSERT INTO `tb_region` VALUES ('1888', '219', '融水苗族自治县');
INSERT INTO `tb_region` VALUES ('1889', '219', '三江侗族自治县');
INSERT INTO `tb_region` VALUES ('1890', '220', '秀峰区');
INSERT INTO `tb_region` VALUES ('1891', '220', '叠彩区');
INSERT INTO `tb_region` VALUES ('1892', '220', '象山区');
INSERT INTO `tb_region` VALUES ('1893', '220', '七星区');
INSERT INTO `tb_region` VALUES ('1894', '220', '雁山区');
INSERT INTO `tb_region` VALUES ('1895', '220', '阳朔县');
INSERT INTO `tb_region` VALUES ('1896', '220', '临桂县');
INSERT INTO `tb_region` VALUES ('1897', '220', '灵川县');
INSERT INTO `tb_region` VALUES ('1898', '220', '全州县');
INSERT INTO `tb_region` VALUES ('1899', '220', '兴安县');
INSERT INTO `tb_region` VALUES ('1900', '220', '永福县');
INSERT INTO `tb_region` VALUES ('1901', '220', '灌阳县');
INSERT INTO `tb_region` VALUES ('1902', '220', '龙胜各族自治县');
INSERT INTO `tb_region` VALUES ('1903', '220', '资源县');
INSERT INTO `tb_region` VALUES ('1904', '220', '平乐县');
INSERT INTO `tb_region` VALUES ('1905', '220', '荔蒲县');
INSERT INTO `tb_region` VALUES ('1906', '220', '恭城瑶族自治县');
INSERT INTO `tb_region` VALUES ('1907', '221', '万秀区');
INSERT INTO `tb_region` VALUES ('1908', '221', '蝶山区');
INSERT INTO `tb_region` VALUES ('1909', '221', '长洲区');
INSERT INTO `tb_region` VALUES ('1910', '221', '苍梧县');
INSERT INTO `tb_region` VALUES ('1911', '221', '藤县');
INSERT INTO `tb_region` VALUES ('1912', '221', '蒙山县');
INSERT INTO `tb_region` VALUES ('1913', '221', '岑溪市');
INSERT INTO `tb_region` VALUES ('1914', '222', '海城区');
INSERT INTO `tb_region` VALUES ('1915', '222', '银海区');
INSERT INTO `tb_region` VALUES ('1916', '222', '铁山港区');
INSERT INTO `tb_region` VALUES ('1917', '222', '合浦县');
INSERT INTO `tb_region` VALUES ('1918', '223', '港口区');
INSERT INTO `tb_region` VALUES ('1919', '223', '防城区');
INSERT INTO `tb_region` VALUES ('1920', '223', '上思县');
INSERT INTO `tb_region` VALUES ('1921', '223', '东兴市');
INSERT INTO `tb_region` VALUES ('1922', '224', '钦南区');
INSERT INTO `tb_region` VALUES ('1923', '224', '钦北区');
INSERT INTO `tb_region` VALUES ('1924', '224', '灵山县');
INSERT INTO `tb_region` VALUES ('1925', '224', '浦北县');
INSERT INTO `tb_region` VALUES ('1926', '225', '港北区');
INSERT INTO `tb_region` VALUES ('1927', '225', '港南区');
INSERT INTO `tb_region` VALUES ('1928', '225', '覃塘区');
INSERT INTO `tb_region` VALUES ('1929', '225', '平南县');
INSERT INTO `tb_region` VALUES ('1930', '225', '桂平市');
INSERT INTO `tb_region` VALUES ('1931', '226', '玉州区');
INSERT INTO `tb_region` VALUES ('1932', '226', '容县');
INSERT INTO `tb_region` VALUES ('1933', '226', '陆川县');
INSERT INTO `tb_region` VALUES ('1934', '226', '博白县');
INSERT INTO `tb_region` VALUES ('1935', '226', '兴业县');
INSERT INTO `tb_region` VALUES ('1936', '226', '北流市');
INSERT INTO `tb_region` VALUES ('1937', '227', '右江区');
INSERT INTO `tb_region` VALUES ('1938', '227', '田阳县');
INSERT INTO `tb_region` VALUES ('1939', '227', '田东县');
INSERT INTO `tb_region` VALUES ('1940', '227', '平果县');
INSERT INTO `tb_region` VALUES ('1941', '227', '德保县');
INSERT INTO `tb_region` VALUES ('1942', '227', '靖西县');
INSERT INTO `tb_region` VALUES ('1943', '227', '那坡县');
INSERT INTO `tb_region` VALUES ('1944', '227', '凌云县');
INSERT INTO `tb_region` VALUES ('1945', '227', '乐业县');
INSERT INTO `tb_region` VALUES ('1946', '227', '田林县');
INSERT INTO `tb_region` VALUES ('1947', '227', '西林县');
INSERT INTO `tb_region` VALUES ('1948', '227', '隆林各族自治县');
INSERT INTO `tb_region` VALUES ('1949', '228', '八步区');
INSERT INTO `tb_region` VALUES ('1950', '228', '昭平县');
INSERT INTO `tb_region` VALUES ('1951', '228', '钟山县');
INSERT INTO `tb_region` VALUES ('1952', '228', '富川瑶族自治县');
INSERT INTO `tb_region` VALUES ('1953', '229', '金城江区');
INSERT INTO `tb_region` VALUES ('1954', '229', '南丹县');
INSERT INTO `tb_region` VALUES ('1955', '229', '天峨县');
INSERT INTO `tb_region` VALUES ('1956', '229', '凤山县');
INSERT INTO `tb_region` VALUES ('1957', '229', '东兰县');
INSERT INTO `tb_region` VALUES ('1958', '229', '罗城仫佬族自治县');
INSERT INTO `tb_region` VALUES ('1959', '229', '环江毛南族自治县');
INSERT INTO `tb_region` VALUES ('1960', '229', '巴马瑶族自治县');
INSERT INTO `tb_region` VALUES ('1961', '229', '都安瑶族自治县');
INSERT INTO `tb_region` VALUES ('1962', '229', '大化瑶族自治县');
INSERT INTO `tb_region` VALUES ('1963', '229', '宜州市');
INSERT INTO `tb_region` VALUES ('1964', '230', '兴宾区');
INSERT INTO `tb_region` VALUES ('1965', '230', '忻城县');
INSERT INTO `tb_region` VALUES ('1966', '230', '象州县');
INSERT INTO `tb_region` VALUES ('1967', '230', '武宣县');
INSERT INTO `tb_region` VALUES ('1968', '230', '金秀瑶族自治县');
INSERT INTO `tb_region` VALUES ('1969', '230', '合山市');
INSERT INTO `tb_region` VALUES ('1970', '231', '江洲区');
INSERT INTO `tb_region` VALUES ('1971', '231', '扶绥县');
INSERT INTO `tb_region` VALUES ('1972', '231', '宁明县');
INSERT INTO `tb_region` VALUES ('1973', '231', '龙州县');
INSERT INTO `tb_region` VALUES ('1974', '231', '大新县');
INSERT INTO `tb_region` VALUES ('1975', '231', '天等县');
INSERT INTO `tb_region` VALUES ('1976', '231', '凭祥市');
INSERT INTO `tb_region` VALUES ('1977', '232', '秀英区');
INSERT INTO `tb_region` VALUES ('1978', '232', '龙华区');
INSERT INTO `tb_region` VALUES ('1979', '232', '琼山区');
INSERT INTO `tb_region` VALUES ('1980', '232', '美兰区');
INSERT INTO `tb_region` VALUES ('1981', '233', '五指山市');
INSERT INTO `tb_region` VALUES ('1982', '233', '琼海市');
INSERT INTO `tb_region` VALUES ('1983', '233', '儋州市');
INSERT INTO `tb_region` VALUES ('1984', '233', '文昌市');
INSERT INTO `tb_region` VALUES ('1985', '233', '万宁市');
INSERT INTO `tb_region` VALUES ('1986', '233', '东方市');
INSERT INTO `tb_region` VALUES ('1987', '233', '定安县');
INSERT INTO `tb_region` VALUES ('1988', '233', '屯昌县');
INSERT INTO `tb_region` VALUES ('1989', '233', '澄迈县');
INSERT INTO `tb_region` VALUES ('1990', '233', '临高县');
INSERT INTO `tb_region` VALUES ('1991', '233', '白沙黎族自治县');
INSERT INTO `tb_region` VALUES ('1992', '233', '昌江黎族自治县');
INSERT INTO `tb_region` VALUES ('1993', '233', '乐东黎族自治县');
INSERT INTO `tb_region` VALUES ('1994', '233', '陵水黎族自治县');
INSERT INTO `tb_region` VALUES ('1995', '233', '保亭黎族苗族自治县');
INSERT INTO `tb_region` VALUES ('1996', '233', '琼中黎族苗族自治县');
INSERT INTO `tb_region` VALUES ('1997', '233', '西沙群岛');
INSERT INTO `tb_region` VALUES ('1998', '233', '南沙群岛');
INSERT INTO `tb_region` VALUES ('1999', '233', '中沙群岛的岛礁及其海域');
INSERT INTO `tb_region` VALUES ('2000', '234', '万州区');
INSERT INTO `tb_region` VALUES ('2001', '234', '涪陵区');
INSERT INTO `tb_region` VALUES ('2002', '234', '渝中区');
INSERT INTO `tb_region` VALUES ('2003', '234', '大渡口区');
INSERT INTO `tb_region` VALUES ('2004', '234', '江北区');
INSERT INTO `tb_region` VALUES ('2005', '234', '沙坪坝区');
INSERT INTO `tb_region` VALUES ('2006', '234', '九龙坡区');
INSERT INTO `tb_region` VALUES ('2007', '234', '南岸区');
INSERT INTO `tb_region` VALUES ('2008', '234', '北碚区');
INSERT INTO `tb_region` VALUES ('2009', '234', '万盛区');
INSERT INTO `tb_region` VALUES ('2010', '234', '双桥区');
INSERT INTO `tb_region` VALUES ('2011', '234', '渝北区');
INSERT INTO `tb_region` VALUES ('2012', '234', '巴南区');
INSERT INTO `tb_region` VALUES ('2013', '234', '黔江区');
INSERT INTO `tb_region` VALUES ('2014', '234', '长寿区');
INSERT INTO `tb_region` VALUES ('2015', '234', '綦江县');
INSERT INTO `tb_region` VALUES ('2016', '234', '潼南县');
INSERT INTO `tb_region` VALUES ('2017', '234', '铜梁县');
INSERT INTO `tb_region` VALUES ('2018', '234', '大足县');
INSERT INTO `tb_region` VALUES ('2019', '234', '荣昌县');
INSERT INTO `tb_region` VALUES ('2020', '234', '璧山县');
INSERT INTO `tb_region` VALUES ('2021', '234', '梁平县');
INSERT INTO `tb_region` VALUES ('2022', '234', '城口县');
INSERT INTO `tb_region` VALUES ('2023', '234', '丰都县');
INSERT INTO `tb_region` VALUES ('2024', '234', '垫江县');
INSERT INTO `tb_region` VALUES ('2025', '234', '武隆县');
INSERT INTO `tb_region` VALUES ('2026', '234', '忠县');
INSERT INTO `tb_region` VALUES ('2027', '234', '开县');
INSERT INTO `tb_region` VALUES ('2028', '234', '云阳县');
INSERT INTO `tb_region` VALUES ('2029', '234', '奉节县');
INSERT INTO `tb_region` VALUES ('2030', '234', '巫山县');
INSERT INTO `tb_region` VALUES ('2031', '234', '巫溪县');
INSERT INTO `tb_region` VALUES ('2032', '234', '石柱土家族自治县');
INSERT INTO `tb_region` VALUES ('2033', '234', '秀山土家族苗族自治县');
INSERT INTO `tb_region` VALUES ('2034', '234', '酉阳土家族苗族自治县');
INSERT INTO `tb_region` VALUES ('2035', '234', '彭水苗族土家族自治县');
INSERT INTO `tb_region` VALUES ('2036', '234', '江津市');
INSERT INTO `tb_region` VALUES ('2037', '234', '合川市');
INSERT INTO `tb_region` VALUES ('2038', '234', '永川市');
INSERT INTO `tb_region` VALUES ('2039', '234', '南川市');
INSERT INTO `tb_region` VALUES ('2040', '235', '锦江区');
INSERT INTO `tb_region` VALUES ('2041', '235', '青羊区');
INSERT INTO `tb_region` VALUES ('2042', '235', '金牛区');
INSERT INTO `tb_region` VALUES ('2043', '235', '武侯区');
INSERT INTO `tb_region` VALUES ('2044', '235', '成华区');
INSERT INTO `tb_region` VALUES ('2045', '235', '龙泉驿区');
INSERT INTO `tb_region` VALUES ('2046', '235', '青白江区');
INSERT INTO `tb_region` VALUES ('2047', '235', '新都区');
INSERT INTO `tb_region` VALUES ('2048', '235', '温江区');
INSERT INTO `tb_region` VALUES ('2049', '235', '金堂县');
INSERT INTO `tb_region` VALUES ('2050', '235', '双流县');
INSERT INTO `tb_region` VALUES ('2051', '235', '郫县');
INSERT INTO `tb_region` VALUES ('2052', '235', '大邑县');
INSERT INTO `tb_region` VALUES ('2053', '235', '蒲江县');
INSERT INTO `tb_region` VALUES ('2054', '235', '新津县');
INSERT INTO `tb_region` VALUES ('2055', '235', '都江堰市');
INSERT INTO `tb_region` VALUES ('2056', '235', '彭州市');
INSERT INTO `tb_region` VALUES ('2057', '235', '邛崃市');
INSERT INTO `tb_region` VALUES ('2058', '235', '崇州市');
INSERT INTO `tb_region` VALUES ('2059', '236', '自流井区');
INSERT INTO `tb_region` VALUES ('2060', '236', '贡井区');
INSERT INTO `tb_region` VALUES ('2061', '236', '大安区');
INSERT INTO `tb_region` VALUES ('2062', '236', '沿滩区');
INSERT INTO `tb_region` VALUES ('2063', '236', '荣县');
INSERT INTO `tb_region` VALUES ('2064', '236', '富顺县');
INSERT INTO `tb_region` VALUES ('2065', '237', '东区');
INSERT INTO `tb_region` VALUES ('2066', '237', '西区');
INSERT INTO `tb_region` VALUES ('2067', '237', '仁和区');
INSERT INTO `tb_region` VALUES ('2068', '237', '米易县');
INSERT INTO `tb_region` VALUES ('2069', '237', '盐边县');
INSERT INTO `tb_region` VALUES ('2070', '238', '江阳区');
INSERT INTO `tb_region` VALUES ('2071', '238', '纳溪区');
INSERT INTO `tb_region` VALUES ('2072', '238', '龙马潭区');
INSERT INTO `tb_region` VALUES ('2073', '238', '泸县');
INSERT INTO `tb_region` VALUES ('2074', '238', '合江县');
INSERT INTO `tb_region` VALUES ('2075', '238', '叙永县');
INSERT INTO `tb_region` VALUES ('2076', '238', '古蔺县');
INSERT INTO `tb_region` VALUES ('2077', '239', '旌阳区');
INSERT INTO `tb_region` VALUES ('2078', '239', '中江县');
INSERT INTO `tb_region` VALUES ('2079', '239', '罗江县');
INSERT INTO `tb_region` VALUES ('2080', '239', '广汉市');
INSERT INTO `tb_region` VALUES ('2081', '239', '什邡市');
INSERT INTO `tb_region` VALUES ('2082', '239', '绵竹市');
INSERT INTO `tb_region` VALUES ('2083', '240', '涪城区');
INSERT INTO `tb_region` VALUES ('2084', '240', '游仙区');
INSERT INTO `tb_region` VALUES ('2085', '240', '三台县');
INSERT INTO `tb_region` VALUES ('2086', '240', '盐亭县');
INSERT INTO `tb_region` VALUES ('2087', '240', '安县');
INSERT INTO `tb_region` VALUES ('2088', '240', '梓潼县');
INSERT INTO `tb_region` VALUES ('2089', '240', '北川羌族自治县');
INSERT INTO `tb_region` VALUES ('2090', '240', '平武县');
INSERT INTO `tb_region` VALUES ('2091', '240', '江油市');
INSERT INTO `tb_region` VALUES ('2092', '241', '市中区');
INSERT INTO `tb_region` VALUES ('2093', '241', '元坝区');
INSERT INTO `tb_region` VALUES ('2094', '241', '朝天区');
INSERT INTO `tb_region` VALUES ('2095', '241', '旺苍县');
INSERT INTO `tb_region` VALUES ('2096', '241', '青川县');
INSERT INTO `tb_region` VALUES ('2097', '241', '剑阁县');
INSERT INTO `tb_region` VALUES ('2098', '241', '苍溪县');
INSERT INTO `tb_region` VALUES ('2099', '242', '船山区');
INSERT INTO `tb_region` VALUES ('2100', '242', '安居区');
INSERT INTO `tb_region` VALUES ('2101', '242', '蓬溪县');
INSERT INTO `tb_region` VALUES ('2102', '242', '射洪县');
INSERT INTO `tb_region` VALUES ('2103', '242', '大英县');
INSERT INTO `tb_region` VALUES ('2104', '243', '市中区');
INSERT INTO `tb_region` VALUES ('2105', '243', '东兴区');
INSERT INTO `tb_region` VALUES ('2106', '243', '威远县');
INSERT INTO `tb_region` VALUES ('2107', '243', '资中县');
INSERT INTO `tb_region` VALUES ('2108', '243', '隆昌县');
INSERT INTO `tb_region` VALUES ('2109', '244', '市中区');
INSERT INTO `tb_region` VALUES ('2110', '244', '沙湾区');
INSERT INTO `tb_region` VALUES ('2111', '244', '五通桥区');
INSERT INTO `tb_region` VALUES ('2112', '244', '金口河区');
INSERT INTO `tb_region` VALUES ('2113', '244', '犍为县');
INSERT INTO `tb_region` VALUES ('2114', '244', '井研县');
INSERT INTO `tb_region` VALUES ('2115', '244', '夹江县');
INSERT INTO `tb_region` VALUES ('2116', '244', '沐川县');
INSERT INTO `tb_region` VALUES ('2117', '244', '峨边彝族自治县');
INSERT INTO `tb_region` VALUES ('2118', '244', '马边彝族自治县');
INSERT INTO `tb_region` VALUES ('2119', '244', '峨眉山市');
INSERT INTO `tb_region` VALUES ('2120', '245', '顺庆区');
INSERT INTO `tb_region` VALUES ('2121', '245', '高坪区');
INSERT INTO `tb_region` VALUES ('2122', '245', '嘉陵区');
INSERT INTO `tb_region` VALUES ('2123', '245', '南部县');
INSERT INTO `tb_region` VALUES ('2124', '245', '营山县');
INSERT INTO `tb_region` VALUES ('2125', '245', '蓬安县');
INSERT INTO `tb_region` VALUES ('2126', '245', '仪陇县');
INSERT INTO `tb_region` VALUES ('2127', '245', '西充县');
INSERT INTO `tb_region` VALUES ('2128', '245', '阆中市');
INSERT INTO `tb_region` VALUES ('2129', '246', '东坡区');
INSERT INTO `tb_region` VALUES ('2130', '246', '仁寿县');
INSERT INTO `tb_region` VALUES ('2131', '246', '彭山县');
INSERT INTO `tb_region` VALUES ('2132', '246', '洪雅县');
INSERT INTO `tb_region` VALUES ('2133', '246', '丹棱县');
INSERT INTO `tb_region` VALUES ('2134', '246', '青神县');
INSERT INTO `tb_region` VALUES ('2135', '247', '翠屏区');
INSERT INTO `tb_region` VALUES ('2136', '247', '宜宾县');
INSERT INTO `tb_region` VALUES ('2137', '247', '南溪县');
INSERT INTO `tb_region` VALUES ('2138', '247', '江安县');
INSERT INTO `tb_region` VALUES ('2139', '247', '长宁县');
INSERT INTO `tb_region` VALUES ('2140', '247', '高县');
INSERT INTO `tb_region` VALUES ('2141', '247', '珙县');
INSERT INTO `tb_region` VALUES ('2142', '247', '筠连县');
INSERT INTO `tb_region` VALUES ('2143', '247', '兴文县');
INSERT INTO `tb_region` VALUES ('2144', '247', '屏山县');
INSERT INTO `tb_region` VALUES ('2145', '248', '广安区');
INSERT INTO `tb_region` VALUES ('2146', '248', '岳池县');
INSERT INTO `tb_region` VALUES ('2147', '248', '武胜县');
INSERT INTO `tb_region` VALUES ('2148', '248', '邻水县');
INSERT INTO `tb_region` VALUES ('2149', '248', '华蓥市');
INSERT INTO `tb_region` VALUES ('2150', '249', '通川区');
INSERT INTO `tb_region` VALUES ('2151', '249', '达县');
INSERT INTO `tb_region` VALUES ('2152', '249', '宣汉县');
INSERT INTO `tb_region` VALUES ('2153', '249', '开江县');
INSERT INTO `tb_region` VALUES ('2154', '249', '大竹县');
INSERT INTO `tb_region` VALUES ('2155', '249', '渠县');
INSERT INTO `tb_region` VALUES ('2156', '249', '万源市');
INSERT INTO `tb_region` VALUES ('2157', '250', '雨城区');
INSERT INTO `tb_region` VALUES ('2158', '250', '名山县');
INSERT INTO `tb_region` VALUES ('2159', '250', '荥经县');
INSERT INTO `tb_region` VALUES ('2160', '250', '汉源县');
INSERT INTO `tb_region` VALUES ('2161', '250', '石棉县');
INSERT INTO `tb_region` VALUES ('2162', '250', '天全县');
INSERT INTO `tb_region` VALUES ('2163', '250', '芦山县');
INSERT INTO `tb_region` VALUES ('2164', '250', '宝兴县');
INSERT INTO `tb_region` VALUES ('2165', '251', '巴州区');
INSERT INTO `tb_region` VALUES ('2166', '251', '通江县');
INSERT INTO `tb_region` VALUES ('2167', '251', '南江县');
INSERT INTO `tb_region` VALUES ('2168', '251', '平昌县');
INSERT INTO `tb_region` VALUES ('2169', '252', '雁江区');
INSERT INTO `tb_region` VALUES ('2170', '252', '安岳县');
INSERT INTO `tb_region` VALUES ('2171', '252', '乐至县');
INSERT INTO `tb_region` VALUES ('2172', '252', '简阳市');
INSERT INTO `tb_region` VALUES ('2173', '253', '汶川县');
INSERT INTO `tb_region` VALUES ('2174', '253', '理县');
INSERT INTO `tb_region` VALUES ('2175', '253', '茂县');
INSERT INTO `tb_region` VALUES ('2176', '253', '松潘县');
INSERT INTO `tb_region` VALUES ('2177', '253', '九寨沟县');
INSERT INTO `tb_region` VALUES ('2178', '253', '金川县');
INSERT INTO `tb_region` VALUES ('2179', '253', '小金县');
INSERT INTO `tb_region` VALUES ('2180', '253', '黑水县');
INSERT INTO `tb_region` VALUES ('2181', '253', '马尔康县');
INSERT INTO `tb_region` VALUES ('2182', '253', '壤塘县');
INSERT INTO `tb_region` VALUES ('2183', '253', '阿坝县');
INSERT INTO `tb_region` VALUES ('2184', '253', '若尔盖县');
INSERT INTO `tb_region` VALUES ('2185', '253', '红原县');
INSERT INTO `tb_region` VALUES ('2186', '254', '康定县');
INSERT INTO `tb_region` VALUES ('2187', '254', '泸定县');
INSERT INTO `tb_region` VALUES ('2188', '254', '丹巴县');
INSERT INTO `tb_region` VALUES ('2189', '254', '九龙县');
INSERT INTO `tb_region` VALUES ('2190', '254', '雅江县');
INSERT INTO `tb_region` VALUES ('2191', '254', '道孚县');
INSERT INTO `tb_region` VALUES ('2192', '254', '炉霍县');
INSERT INTO `tb_region` VALUES ('2193', '254', '甘孜县');
INSERT INTO `tb_region` VALUES ('2194', '254', '新龙县');
INSERT INTO `tb_region` VALUES ('2195', '254', '德格县');
INSERT INTO `tb_region` VALUES ('2196', '254', '白玉县');
INSERT INTO `tb_region` VALUES ('2197', '254', '石渠县');
INSERT INTO `tb_region` VALUES ('2198', '254', '色达县');
INSERT INTO `tb_region` VALUES ('2199', '254', '理塘县');
INSERT INTO `tb_region` VALUES ('2200', '254', '巴塘县');
INSERT INTO `tb_region` VALUES ('2201', '254', '乡城县');
INSERT INTO `tb_region` VALUES ('2202', '254', '稻城县');
INSERT INTO `tb_region` VALUES ('2203', '254', '得荣县');
INSERT INTO `tb_region` VALUES ('2204', '255', '西昌市');
INSERT INTO `tb_region` VALUES ('2205', '255', '木里藏族自治县');
INSERT INTO `tb_region` VALUES ('2206', '255', '盐源县');
INSERT INTO `tb_region` VALUES ('2207', '255', '德昌县');
INSERT INTO `tb_region` VALUES ('2208', '255', '会理县');
INSERT INTO `tb_region` VALUES ('2209', '255', '会东县');
INSERT INTO `tb_region` VALUES ('2210', '255', '宁南县');
INSERT INTO `tb_region` VALUES ('2211', '255', '普格县');
INSERT INTO `tb_region` VALUES ('2212', '255', '布拖县');
INSERT INTO `tb_region` VALUES ('2213', '255', '金阳县');
INSERT INTO `tb_region` VALUES ('2214', '255', '昭觉县');
INSERT INTO `tb_region` VALUES ('2215', '255', '喜德县');
INSERT INTO `tb_region` VALUES ('2216', '255', '冕宁县');
INSERT INTO `tb_region` VALUES ('2217', '255', '越西县');
INSERT INTO `tb_region` VALUES ('2218', '255', '甘洛县');
INSERT INTO `tb_region` VALUES ('2219', '255', '美姑县');
INSERT INTO `tb_region` VALUES ('2220', '255', '雷波县');
INSERT INTO `tb_region` VALUES ('2221', '256', '南明区');
INSERT INTO `tb_region` VALUES ('2222', '256', '云岩区');
INSERT INTO `tb_region` VALUES ('2223', '256', '花溪区');
INSERT INTO `tb_region` VALUES ('2224', '256', '乌当区');
INSERT INTO `tb_region` VALUES ('2225', '256', '白云区');
INSERT INTO `tb_region` VALUES ('2226', '256', '小河区');
INSERT INTO `tb_region` VALUES ('2227', '256', '开阳县');
INSERT INTO `tb_region` VALUES ('2228', '256', '息烽县');
INSERT INTO `tb_region` VALUES ('2229', '256', '修文县');
INSERT INTO `tb_region` VALUES ('2230', '256', '清镇市');
INSERT INTO `tb_region` VALUES ('2231', '257', '钟山区');
INSERT INTO `tb_region` VALUES ('2232', '257', '六枝特区');
INSERT INTO `tb_region` VALUES ('2233', '257', '水城县');
INSERT INTO `tb_region` VALUES ('2234', '257', '盘县');
INSERT INTO `tb_region` VALUES ('2235', '258', '红花岗区');
INSERT INTO `tb_region` VALUES ('2236', '258', '汇川区');
INSERT INTO `tb_region` VALUES ('2237', '258', '遵义县');
INSERT INTO `tb_region` VALUES ('2238', '258', '桐梓县');
INSERT INTO `tb_region` VALUES ('2239', '258', '绥阳县');
INSERT INTO `tb_region` VALUES ('2240', '258', '正安县');
INSERT INTO `tb_region` VALUES ('2241', '258', '道真仡佬族苗族自治县');
INSERT INTO `tb_region` VALUES ('2242', '258', '务川仡佬族苗族自治县');
INSERT INTO `tb_region` VALUES ('2243', '258', '凤冈县');
INSERT INTO `tb_region` VALUES ('2244', '258', '湄潭县');
INSERT INTO `tb_region` VALUES ('2245', '258', '余庆县');
INSERT INTO `tb_region` VALUES ('2246', '258', '习水县');
INSERT INTO `tb_region` VALUES ('2247', '258', '赤水市');
INSERT INTO `tb_region` VALUES ('2248', '258', '仁怀市');
INSERT INTO `tb_region` VALUES ('2249', '259', '西秀区');
INSERT INTO `tb_region` VALUES ('2250', '259', '平坝县');
INSERT INTO `tb_region` VALUES ('2251', '259', '普定县');
INSERT INTO `tb_region` VALUES ('2252', '259', '镇宁布依族苗族自治县');
INSERT INTO `tb_region` VALUES ('2253', '259', '关岭布依族苗族自治县');
INSERT INTO `tb_region` VALUES ('2254', '259', '紫云苗族布依族自治县');
INSERT INTO `tb_region` VALUES ('2255', '260', '铜仁市');
INSERT INTO `tb_region` VALUES ('2256', '260', '江口县');
INSERT INTO `tb_region` VALUES ('2257', '260', '玉屏侗族自治县');
INSERT INTO `tb_region` VALUES ('2258', '260', '石阡县');
INSERT INTO `tb_region` VALUES ('2259', '260', '思南县');
INSERT INTO `tb_region` VALUES ('2260', '260', '印江土家族苗族自治县');
INSERT INTO `tb_region` VALUES ('2261', '260', '德江县');
INSERT INTO `tb_region` VALUES ('2262', '260', '沿河土家族自治县');
INSERT INTO `tb_region` VALUES ('2263', '260', '松桃苗族自治县');
INSERT INTO `tb_region` VALUES ('2264', '260', '万山特区');
INSERT INTO `tb_region` VALUES ('2265', '261', '兴义市');
INSERT INTO `tb_region` VALUES ('2266', '261', '兴仁县');
INSERT INTO `tb_region` VALUES ('2267', '261', '普安县');
INSERT INTO `tb_region` VALUES ('2268', '261', '晴隆县');
INSERT INTO `tb_region` VALUES ('2269', '261', '贞丰县');
INSERT INTO `tb_region` VALUES ('2270', '261', '望谟县');
INSERT INTO `tb_region` VALUES ('2271', '261', '册亨县');
INSERT INTO `tb_region` VALUES ('2272', '261', '安龙县');
INSERT INTO `tb_region` VALUES ('2273', '262', '毕节市');
INSERT INTO `tb_region` VALUES ('2274', '262', '大方县');
INSERT INTO `tb_region` VALUES ('2275', '262', '黔西县');
INSERT INTO `tb_region` VALUES ('2276', '262', '金沙县');
INSERT INTO `tb_region` VALUES ('2277', '262', '织金县');
INSERT INTO `tb_region` VALUES ('2278', '262', '纳雍县');
INSERT INTO `tb_region` VALUES ('2279', '262', '威宁彝族回族苗族自治县');
INSERT INTO `tb_region` VALUES ('2280', '262', '赫章县');
INSERT INTO `tb_region` VALUES ('2281', '263', '凯里市');
INSERT INTO `tb_region` VALUES ('2282', '263', '黄平县');
INSERT INTO `tb_region` VALUES ('2283', '263', '施秉县');
INSERT INTO `tb_region` VALUES ('2284', '263', '三穗县');
INSERT INTO `tb_region` VALUES ('2285', '263', '镇远县');
INSERT INTO `tb_region` VALUES ('2286', '263', '岑巩县');
INSERT INTO `tb_region` VALUES ('2287', '263', '天柱县');
INSERT INTO `tb_region` VALUES ('2288', '263', '锦屏县');
INSERT INTO `tb_region` VALUES ('2289', '263', '剑河县');
INSERT INTO `tb_region` VALUES ('2290', '263', '台江县');
INSERT INTO `tb_region` VALUES ('2291', '263', '黎平县');
INSERT INTO `tb_region` VALUES ('2292', '263', '榕江县');
INSERT INTO `tb_region` VALUES ('2293', '263', '从江县');
INSERT INTO `tb_region` VALUES ('2294', '263', '雷山县');
INSERT INTO `tb_region` VALUES ('2295', '263', '麻江县');
INSERT INTO `tb_region` VALUES ('2296', '263', '丹寨县');
INSERT INTO `tb_region` VALUES ('2297', '264', '都匀市');
INSERT INTO `tb_region` VALUES ('2298', '264', '福泉市');
INSERT INTO `tb_region` VALUES ('2299', '264', '荔波县');
INSERT INTO `tb_region` VALUES ('2300', '264', '贵定县');
INSERT INTO `tb_region` VALUES ('2301', '264', '瓮安县');
INSERT INTO `tb_region` VALUES ('2302', '264', '独山县');
INSERT INTO `tb_region` VALUES ('2303', '264', '平塘县');
INSERT INTO `tb_region` VALUES ('2304', '264', '罗甸县');
INSERT INTO `tb_region` VALUES ('2305', '264', '长顺县');
INSERT INTO `tb_region` VALUES ('2306', '264', '龙里县');
INSERT INTO `tb_region` VALUES ('2307', '264', '惠水县');
INSERT INTO `tb_region` VALUES ('2308', '264', '三都水族自治县');
INSERT INTO `tb_region` VALUES ('2309', '265', '五华区');
INSERT INTO `tb_region` VALUES ('2310', '265', '盘龙区');
INSERT INTO `tb_region` VALUES ('2311', '265', '官渡区');
INSERT INTO `tb_region` VALUES ('2312', '265', '西山区');
INSERT INTO `tb_region` VALUES ('2313', '265', '东川区');
INSERT INTO `tb_region` VALUES ('2314', '265', '呈贡县');
INSERT INTO `tb_region` VALUES ('2315', '265', '晋宁县');
INSERT INTO `tb_region` VALUES ('2316', '265', '富民县');
INSERT INTO `tb_region` VALUES ('2317', '265', '宜良县');
INSERT INTO `tb_region` VALUES ('2318', '265', '石林彝族自治县');
INSERT INTO `tb_region` VALUES ('2319', '265', '嵩明县');
INSERT INTO `tb_region` VALUES ('2320', '265', '禄劝彝族苗族自治县');
INSERT INTO `tb_region` VALUES ('2321', '265', '寻甸回族彝族自治县');
INSERT INTO `tb_region` VALUES ('2322', '265', '安宁市');
INSERT INTO `tb_region` VALUES ('2323', '266', '麒麟区');
INSERT INTO `tb_region` VALUES ('2324', '266', '马龙县');
INSERT INTO `tb_region` VALUES ('2325', '266', '陆良县');
INSERT INTO `tb_region` VALUES ('2326', '266', '师宗县');
INSERT INTO `tb_region` VALUES ('2327', '266', '罗平县');
INSERT INTO `tb_region` VALUES ('2328', '266', '富源县');
INSERT INTO `tb_region` VALUES ('2329', '266', '会泽县');
INSERT INTO `tb_region` VALUES ('2330', '266', '沾益县');
INSERT INTO `tb_region` VALUES ('2331', '266', '宣威市');
INSERT INTO `tb_region` VALUES ('2332', '267', '红塔区');
INSERT INTO `tb_region` VALUES ('2333', '267', '江川县');
INSERT INTO `tb_region` VALUES ('2334', '267', '澄江县');
INSERT INTO `tb_region` VALUES ('2335', '267', '通海县');
INSERT INTO `tb_region` VALUES ('2336', '267', '华宁县');
INSERT INTO `tb_region` VALUES ('2337', '267', '易门县');
INSERT INTO `tb_region` VALUES ('2338', '267', '峨山彝族自治县');
INSERT INTO `tb_region` VALUES ('2339', '267', '新平彝族傣族自治县');
INSERT INTO `tb_region` VALUES ('2340', '267', '元江哈尼族彝族傣族自治县');
INSERT INTO `tb_region` VALUES ('2341', '268', '隆阳区');
INSERT INTO `tb_region` VALUES ('2342', '268', '施甸县');
INSERT INTO `tb_region` VALUES ('2343', '268', '腾冲县');
INSERT INTO `tb_region` VALUES ('2344', '268', '龙陵县');
INSERT INTO `tb_region` VALUES ('2345', '268', '昌宁县');
INSERT INTO `tb_region` VALUES ('2346', '269', '昭阳区');
INSERT INTO `tb_region` VALUES ('2347', '269', '鲁甸县');
INSERT INTO `tb_region` VALUES ('2348', '269', '巧家县');
INSERT INTO `tb_region` VALUES ('2349', '269', '盐津县');
INSERT INTO `tb_region` VALUES ('2350', '269', '大关县');
INSERT INTO `tb_region` VALUES ('2351', '269', '永善县');
INSERT INTO `tb_region` VALUES ('2352', '269', '绥江县');
INSERT INTO `tb_region` VALUES ('2353', '269', '镇雄县');
INSERT INTO `tb_region` VALUES ('2354', '269', '彝良县');
INSERT INTO `tb_region` VALUES ('2355', '269', '威信县');
INSERT INTO `tb_region` VALUES ('2356', '269', '水富县');
INSERT INTO `tb_region` VALUES ('2357', '270', '古城区');
INSERT INTO `tb_region` VALUES ('2358', '270', '玉龙纳西族自治县');
INSERT INTO `tb_region` VALUES ('2359', '270', '永胜县');
INSERT INTO `tb_region` VALUES ('2360', '270', '华坪县');
INSERT INTO `tb_region` VALUES ('2361', '270', '宁蒗彝族自治县');
INSERT INTO `tb_region` VALUES ('2362', '271', '翠云区');
INSERT INTO `tb_region` VALUES ('2363', '271', '普洱哈尼族彝族自治县');
INSERT INTO `tb_region` VALUES ('2364', '271', '墨江哈尼族自治县');
INSERT INTO `tb_region` VALUES ('2365', '271', '景东彝族自治县');
INSERT INTO `tb_region` VALUES ('2366', '271', '景谷傣族彝族自治县');
INSERT INTO `tb_region` VALUES ('2367', '271', '镇沅彝族哈尼族拉祜族自治县');
INSERT INTO `tb_region` VALUES ('2368', '271', '江城哈尼族彝族自治县');
INSERT INTO `tb_region` VALUES ('2369', '271', '孟连傣族拉祜族佤族自治县');
INSERT INTO `tb_region` VALUES ('2370', '271', '澜沧拉祜族自治县');
INSERT INTO `tb_region` VALUES ('2371', '271', '西盟佤族自治县');
INSERT INTO `tb_region` VALUES ('2372', '272', '临翔区');
INSERT INTO `tb_region` VALUES ('2373', '272', '凤庆县');
INSERT INTO `tb_region` VALUES ('2374', '272', '云县');
INSERT INTO `tb_region` VALUES ('2375', '272', '永德县');
INSERT INTO `tb_region` VALUES ('2376', '272', '镇康县');
INSERT INTO `tb_region` VALUES ('2377', '272', '双江拉祜族佤族布朗族傣族自治县');
INSERT INTO `tb_region` VALUES ('2378', '272', '耿马傣族佤族自治县');
INSERT INTO `tb_region` VALUES ('2379', '272', '沧源佤族自治县');
INSERT INTO `tb_region` VALUES ('2380', '273', '楚雄市');
INSERT INTO `tb_region` VALUES ('2381', '273', '双柏县');
INSERT INTO `tb_region` VALUES ('2382', '273', '牟定县');
INSERT INTO `tb_region` VALUES ('2383', '273', '南华县');
INSERT INTO `tb_region` VALUES ('2384', '273', '姚安县');
INSERT INTO `tb_region` VALUES ('2385', '273', '大姚县');
INSERT INTO `tb_region` VALUES ('2386', '273', '永仁县');
INSERT INTO `tb_region` VALUES ('2387', '273', '元谋县');
INSERT INTO `tb_region` VALUES ('2388', '273', '武定县');
INSERT INTO `tb_region` VALUES ('2389', '273', '禄丰县');
INSERT INTO `tb_region` VALUES ('2390', '274', '个旧市');
INSERT INTO `tb_region` VALUES ('2391', '274', '开远市');
INSERT INTO `tb_region` VALUES ('2392', '274', '蒙自县');
INSERT INTO `tb_region` VALUES ('2393', '274', '屏边苗族自治县');
INSERT INTO `tb_region` VALUES ('2394', '274', '建水县');
INSERT INTO `tb_region` VALUES ('2395', '274', '石屏县');
INSERT INTO `tb_region` VALUES ('2396', '274', '弥勒县');
INSERT INTO `tb_region` VALUES ('2397', '274', '泸西县');
INSERT INTO `tb_region` VALUES ('2398', '274', '元阳县');
INSERT INTO `tb_region` VALUES ('2399', '274', '红河县');
INSERT INTO `tb_region` VALUES ('2400', '274', '金平苗族瑶族傣族自治县');
INSERT INTO `tb_region` VALUES ('2401', '274', '绿春县');
INSERT INTO `tb_region` VALUES ('2402', '274', '河口瑶族自治县');
INSERT INTO `tb_region` VALUES ('2403', '275', '文山县');
INSERT INTO `tb_region` VALUES ('2404', '275', '砚山县');
INSERT INTO `tb_region` VALUES ('2405', '275', '西畴县');
INSERT INTO `tb_region` VALUES ('2406', '275', '麻栗坡县');
INSERT INTO `tb_region` VALUES ('2407', '275', '马关县');
INSERT INTO `tb_region` VALUES ('2408', '275', '丘北县');
INSERT INTO `tb_region` VALUES ('2409', '275', '广南县');
INSERT INTO `tb_region` VALUES ('2410', '275', '富宁县');
INSERT INTO `tb_region` VALUES ('2411', '276', '景洪市');
INSERT INTO `tb_region` VALUES ('2412', '276', '勐海县');
INSERT INTO `tb_region` VALUES ('2413', '276', '勐腊县');
INSERT INTO `tb_region` VALUES ('2414', '277', '大理市');
INSERT INTO `tb_region` VALUES ('2415', '277', '漾濞彝族自治县');
INSERT INTO `tb_region` VALUES ('2416', '277', '祥云县');
INSERT INTO `tb_region` VALUES ('2417', '277', '宾川县');
INSERT INTO `tb_region` VALUES ('2418', '277', '弥渡县');
INSERT INTO `tb_region` VALUES ('2419', '277', '南涧彝族自治县');
INSERT INTO `tb_region` VALUES ('2420', '277', '巍山彝族回族自治县');
INSERT INTO `tb_region` VALUES ('2421', '277', '永平县');
INSERT INTO `tb_region` VALUES ('2422', '277', '云龙县');
INSERT INTO `tb_region` VALUES ('2423', '277', '洱源县');
INSERT INTO `tb_region` VALUES ('2424', '277', '剑川县');
INSERT INTO `tb_region` VALUES ('2425', '277', '鹤庆县');
INSERT INTO `tb_region` VALUES ('2426', '278', '瑞丽市');
INSERT INTO `tb_region` VALUES ('2427', '278', '潞西市');
INSERT INTO `tb_region` VALUES ('2428', '278', '梁河县');
INSERT INTO `tb_region` VALUES ('2429', '278', '盈江县');
INSERT INTO `tb_region` VALUES ('2430', '278', '陇川县');
INSERT INTO `tb_region` VALUES ('2431', '279', '泸水县');
INSERT INTO `tb_region` VALUES ('2432', '279', '福贡县');
INSERT INTO `tb_region` VALUES ('2433', '279', '贡山独龙族怒族自治县');
INSERT INTO `tb_region` VALUES ('2434', '279', '兰坪白族普米族自治县');
INSERT INTO `tb_region` VALUES ('2435', '280', '香格里拉县');
INSERT INTO `tb_region` VALUES ('2436', '280', '德钦县');
INSERT INTO `tb_region` VALUES ('2437', '280', '维西傈僳族自治县');
INSERT INTO `tb_region` VALUES ('2438', '281', '城关区');
INSERT INTO `tb_region` VALUES ('2439', '281', '林周县');
INSERT INTO `tb_region` VALUES ('2440', '281', '当雄县');
INSERT INTO `tb_region` VALUES ('2441', '281', '尼木县');
INSERT INTO `tb_region` VALUES ('2442', '281', '曲水县');
INSERT INTO `tb_region` VALUES ('2443', '281', '堆龙德庆县');
INSERT INTO `tb_region` VALUES ('2444', '281', '达孜县');
INSERT INTO `tb_region` VALUES ('2445', '281', '墨竹工卡县');
INSERT INTO `tb_region` VALUES ('2446', '282', '昌都县');
INSERT INTO `tb_region` VALUES ('2447', '282', '江达县');
INSERT INTO `tb_region` VALUES ('2448', '282', '贡觉县');
INSERT INTO `tb_region` VALUES ('2449', '282', '类乌齐县');
INSERT INTO `tb_region` VALUES ('2450', '282', '丁青县');
INSERT INTO `tb_region` VALUES ('2451', '282', '察雅县');
INSERT INTO `tb_region` VALUES ('2452', '282', '八宿县');
INSERT INTO `tb_region` VALUES ('2453', '282', '左贡县');
INSERT INTO `tb_region` VALUES ('2454', '282', '芒康县');
INSERT INTO `tb_region` VALUES ('2455', '282', '洛隆县');
INSERT INTO `tb_region` VALUES ('2456', '282', '边坝县');
INSERT INTO `tb_region` VALUES ('2457', '283', '乃东县');
INSERT INTO `tb_region` VALUES ('2458', '283', '扎囊县');
INSERT INTO `tb_region` VALUES ('2459', '283', '贡嘎县');
INSERT INTO `tb_region` VALUES ('2460', '283', '桑日县');
INSERT INTO `tb_region` VALUES ('2461', '283', '琼结县');
INSERT INTO `tb_region` VALUES ('2462', '283', '曲松县');
INSERT INTO `tb_region` VALUES ('2463', '283', '措美县');
INSERT INTO `tb_region` VALUES ('2464', '283', '洛扎县');
INSERT INTO `tb_region` VALUES ('2465', '283', '加查县');
INSERT INTO `tb_region` VALUES ('2466', '283', '隆子县');
INSERT INTO `tb_region` VALUES ('2467', '283', '错那县');
INSERT INTO `tb_region` VALUES ('2468', '283', '浪卡子县');
INSERT INTO `tb_region` VALUES ('2469', '284', '日喀则市');
INSERT INTO `tb_region` VALUES ('2470', '284', '南木林县');
INSERT INTO `tb_region` VALUES ('2471', '284', '江孜县');
INSERT INTO `tb_region` VALUES ('2472', '284', '定日县');
INSERT INTO `tb_region` VALUES ('2473', '284', '萨迦县');
INSERT INTO `tb_region` VALUES ('2474', '284', '拉孜县');
INSERT INTO `tb_region` VALUES ('2475', '284', '昂仁县');
INSERT INTO `tb_region` VALUES ('2476', '284', '谢通门县');
INSERT INTO `tb_region` VALUES ('2477', '284', '白朗县');
INSERT INTO `tb_region` VALUES ('2478', '284', '仁布县');
INSERT INTO `tb_region` VALUES ('2479', '284', '康马县');
INSERT INTO `tb_region` VALUES ('2480', '284', '定结县');
INSERT INTO `tb_region` VALUES ('2481', '284', '仲巴县');
INSERT INTO `tb_region` VALUES ('2482', '284', '亚东县');
INSERT INTO `tb_region` VALUES ('2483', '284', '吉隆县');
INSERT INTO `tb_region` VALUES ('2484', '284', '聂拉木县');
INSERT INTO `tb_region` VALUES ('2485', '284', '萨嘎县');
INSERT INTO `tb_region` VALUES ('2486', '284', '岗巴县');
INSERT INTO `tb_region` VALUES ('2487', '285', '那曲县');
INSERT INTO `tb_region` VALUES ('2488', '285', '嘉黎县');
INSERT INTO `tb_region` VALUES ('2489', '285', '比如县');
INSERT INTO `tb_region` VALUES ('2490', '285', '聂荣县');
INSERT INTO `tb_region` VALUES ('2491', '285', '安多县');
INSERT INTO `tb_region` VALUES ('2492', '285', '申扎县');
INSERT INTO `tb_region` VALUES ('2493', '285', '索县');
INSERT INTO `tb_region` VALUES ('2494', '285', '班戈县');
INSERT INTO `tb_region` VALUES ('2495', '285', '巴青县');
INSERT INTO `tb_region` VALUES ('2496', '285', '尼玛县');
INSERT INTO `tb_region` VALUES ('2497', '286', '普兰县');
INSERT INTO `tb_region` VALUES ('2498', '286', '札达县');
INSERT INTO `tb_region` VALUES ('2499', '286', '噶尔县');
INSERT INTO `tb_region` VALUES ('2500', '286', '日土县');
INSERT INTO `tb_region` VALUES ('2501', '286', '革吉县');
INSERT INTO `tb_region` VALUES ('2502', '286', '改则县');
INSERT INTO `tb_region` VALUES ('2503', '286', '措勤县');
INSERT INTO `tb_region` VALUES ('2504', '287', '林芝县');
INSERT INTO `tb_region` VALUES ('2505', '287', '工布江达县');
INSERT INTO `tb_region` VALUES ('2506', '287', '米林县');
INSERT INTO `tb_region` VALUES ('2507', '287', '墨脱县');
INSERT INTO `tb_region` VALUES ('2508', '287', '波密县');
INSERT INTO `tb_region` VALUES ('2509', '287', '察隅县');
INSERT INTO `tb_region` VALUES ('2510', '287', '朗县');
INSERT INTO `tb_region` VALUES ('2511', '288', '新城区');
INSERT INTO `tb_region` VALUES ('2512', '288', '碑林区');
INSERT INTO `tb_region` VALUES ('2513', '288', '莲湖区');
INSERT INTO `tb_region` VALUES ('2514', '288', '灞桥区');
INSERT INTO `tb_region` VALUES ('2515', '288', '未央区');
INSERT INTO `tb_region` VALUES ('2516', '288', '雁塔区');
INSERT INTO `tb_region` VALUES ('2517', '288', '阎良区');
INSERT INTO `tb_region` VALUES ('2518', '288', '临潼区');
INSERT INTO `tb_region` VALUES ('2519', '288', '长安区');
INSERT INTO `tb_region` VALUES ('2520', '288', '蓝田县');
INSERT INTO `tb_region` VALUES ('2521', '288', '周至县');
INSERT INTO `tb_region` VALUES ('2522', '288', '户县');
INSERT INTO `tb_region` VALUES ('2523', '288', '高陵县');
INSERT INTO `tb_region` VALUES ('2524', '289', '王益区');
INSERT INTO `tb_region` VALUES ('2525', '289', '印台区');
INSERT INTO `tb_region` VALUES ('2526', '289', '耀州区');
INSERT INTO `tb_region` VALUES ('2527', '289', '宜君县');
INSERT INTO `tb_region` VALUES ('2528', '290', '渭滨区');
INSERT INTO `tb_region` VALUES ('2529', '290', '金台区');
INSERT INTO `tb_region` VALUES ('2530', '290', '陈仓区');
INSERT INTO `tb_region` VALUES ('2531', '290', '凤翔县');
INSERT INTO `tb_region` VALUES ('2532', '290', '岐山县');
INSERT INTO `tb_region` VALUES ('2533', '290', '扶风县');
INSERT INTO `tb_region` VALUES ('2534', '290', '眉县');
INSERT INTO `tb_region` VALUES ('2535', '290', '陇县');
INSERT INTO `tb_region` VALUES ('2536', '290', '千阳县');
INSERT INTO `tb_region` VALUES ('2537', '290', '麟游县');
INSERT INTO `tb_region` VALUES ('2538', '290', '凤县');
INSERT INTO `tb_region` VALUES ('2539', '290', '太白县');
INSERT INTO `tb_region` VALUES ('2540', '291', '秦都区');
INSERT INTO `tb_region` VALUES ('2541', '291', '杨凌区');
INSERT INTO `tb_region` VALUES ('2542', '291', '渭城区');
INSERT INTO `tb_region` VALUES ('2543', '291', '三原县');
INSERT INTO `tb_region` VALUES ('2544', '291', '泾阳县');
INSERT INTO `tb_region` VALUES ('2545', '291', '乾县');
INSERT INTO `tb_region` VALUES ('2546', '291', '礼泉县');
INSERT INTO `tb_region` VALUES ('2547', '291', '永寿县');
INSERT INTO `tb_region` VALUES ('2548', '291', '彬县');
INSERT INTO `tb_region` VALUES ('2549', '291', '长武县');
INSERT INTO `tb_region` VALUES ('2550', '291', '旬邑县');
INSERT INTO `tb_region` VALUES ('2551', '291', '淳化县');
INSERT INTO `tb_region` VALUES ('2552', '291', '武功县');
INSERT INTO `tb_region` VALUES ('2553', '291', '兴平市');
INSERT INTO `tb_region` VALUES ('2554', '292', '临渭区');
INSERT INTO `tb_region` VALUES ('2555', '292', '华县');
INSERT INTO `tb_region` VALUES ('2556', '292', '潼关县');
INSERT INTO `tb_region` VALUES ('2557', '292', '大荔县');
INSERT INTO `tb_region` VALUES ('2558', '292', '合阳县');
INSERT INTO `tb_region` VALUES ('2559', '292', '澄城县');
INSERT INTO `tb_region` VALUES ('2560', '292', '蒲城县');
INSERT INTO `tb_region` VALUES ('2561', '292', '白水县');
INSERT INTO `tb_region` VALUES ('2562', '292', '富平县');
INSERT INTO `tb_region` VALUES ('2563', '292', '韩城市');
INSERT INTO `tb_region` VALUES ('2564', '292', '华阴市');
INSERT INTO `tb_region` VALUES ('2565', '293', '宝塔区');
INSERT INTO `tb_region` VALUES ('2566', '293', '延长县');
INSERT INTO `tb_region` VALUES ('2567', '293', '延川县');
INSERT INTO `tb_region` VALUES ('2568', '293', '子长县');
INSERT INTO `tb_region` VALUES ('2569', '293', '安塞县');
INSERT INTO `tb_region` VALUES ('2570', '293', '志丹县');
INSERT INTO `tb_region` VALUES ('2571', '293', '吴旗县');
INSERT INTO `tb_region` VALUES ('2572', '293', '甘泉县');
INSERT INTO `tb_region` VALUES ('2573', '293', '富县');
INSERT INTO `tb_region` VALUES ('2574', '293', '洛川县');
INSERT INTO `tb_region` VALUES ('2575', '293', '宜川县');
INSERT INTO `tb_region` VALUES ('2576', '293', '黄龙县');
INSERT INTO `tb_region` VALUES ('2577', '293', '黄陵县');
INSERT INTO `tb_region` VALUES ('2578', '294', '汉台区');
INSERT INTO `tb_region` VALUES ('2579', '294', '南郑县');
INSERT INTO `tb_region` VALUES ('2580', '294', '城固县');
INSERT INTO `tb_region` VALUES ('2581', '294', '洋县');
INSERT INTO `tb_region` VALUES ('2582', '294', '西乡县');
INSERT INTO `tb_region` VALUES ('2583', '294', '勉县');
INSERT INTO `tb_region` VALUES ('2584', '294', '宁强县');
INSERT INTO `tb_region` VALUES ('2585', '294', '略阳县');
INSERT INTO `tb_region` VALUES ('2586', '294', '镇巴县');
INSERT INTO `tb_region` VALUES ('2587', '294', '留坝县');
INSERT INTO `tb_region` VALUES ('2588', '294', '佛坪县');
INSERT INTO `tb_region` VALUES ('2589', '295', '榆阳区');
INSERT INTO `tb_region` VALUES ('2590', '295', '神木县');
INSERT INTO `tb_region` VALUES ('2591', '295', '府谷县');
INSERT INTO `tb_region` VALUES ('2592', '295', '横山县');
INSERT INTO `tb_region` VALUES ('2593', '295', '靖边县');
INSERT INTO `tb_region` VALUES ('2594', '295', '定边县');
INSERT INTO `tb_region` VALUES ('2595', '295', '绥德县');
INSERT INTO `tb_region` VALUES ('2596', '295', '米脂县');
INSERT INTO `tb_region` VALUES ('2597', '295', '佳县');
INSERT INTO `tb_region` VALUES ('2598', '295', '吴堡县');
INSERT INTO `tb_region` VALUES ('2599', '295', '清涧县');
INSERT INTO `tb_region` VALUES ('2600', '295', '子洲县');
INSERT INTO `tb_region` VALUES ('2601', '296', '汉滨区');
INSERT INTO `tb_region` VALUES ('2602', '296', '汉阴县');
INSERT INTO `tb_region` VALUES ('2603', '296', '石泉县');
INSERT INTO `tb_region` VALUES ('2604', '296', '宁陕县');
INSERT INTO `tb_region` VALUES ('2605', '296', '紫阳县');
INSERT INTO `tb_region` VALUES ('2606', '296', '岚皋县');
INSERT INTO `tb_region` VALUES ('2607', '296', '平利县');
INSERT INTO `tb_region` VALUES ('2608', '296', '镇坪县');
INSERT INTO `tb_region` VALUES ('2609', '296', '旬阳县');
INSERT INTO `tb_region` VALUES ('2610', '296', '白河县');
INSERT INTO `tb_region` VALUES ('2611', '297', '商州区');
INSERT INTO `tb_region` VALUES ('2612', '297', '洛南县');
INSERT INTO `tb_region` VALUES ('2613', '297', '丹凤县');
INSERT INTO `tb_region` VALUES ('2614', '297', '商南县');
INSERT INTO `tb_region` VALUES ('2615', '297', '山阳县');
INSERT INTO `tb_region` VALUES ('2616', '297', '镇安县');
INSERT INTO `tb_region` VALUES ('2617', '297', '柞水县');
INSERT INTO `tb_region` VALUES ('2618', '298', '城关区');
INSERT INTO `tb_region` VALUES ('2619', '298', '七里河区');
INSERT INTO `tb_region` VALUES ('2620', '298', '西固区');
INSERT INTO `tb_region` VALUES ('2621', '298', '安宁区');
INSERT INTO `tb_region` VALUES ('2622', '298', '红古区');
INSERT INTO `tb_region` VALUES ('2623', '298', '永登县');
INSERT INTO `tb_region` VALUES ('2624', '298', '皋兰县');
INSERT INTO `tb_region` VALUES ('2625', '298', '榆中县');
INSERT INTO `tb_region` VALUES ('2626', '300', '金川区');
INSERT INTO `tb_region` VALUES ('2627', '300', '永昌县');
INSERT INTO `tb_region` VALUES ('2628', '301', '白银区');
INSERT INTO `tb_region` VALUES ('2629', '301', '平川区');
INSERT INTO `tb_region` VALUES ('2630', '301', '靖远县');
INSERT INTO `tb_region` VALUES ('2631', '301', '会宁县');
INSERT INTO `tb_region` VALUES ('2632', '301', '景泰县');
INSERT INTO `tb_region` VALUES ('2633', '302', '秦城区');
INSERT INTO `tb_region` VALUES ('2634', '302', '北道区');
INSERT INTO `tb_region` VALUES ('2635', '302', '清水县');
INSERT INTO `tb_region` VALUES ('2636', '302', '秦安县');
INSERT INTO `tb_region` VALUES ('2637', '302', '甘谷县');
INSERT INTO `tb_region` VALUES ('2638', '302', '武山县');
INSERT INTO `tb_region` VALUES ('2639', '302', '张家川回族自治县');
INSERT INTO `tb_region` VALUES ('2640', '303', '凉州区');
INSERT INTO `tb_region` VALUES ('2641', '303', '民勤县');
INSERT INTO `tb_region` VALUES ('2642', '303', '古浪县');
INSERT INTO `tb_region` VALUES ('2643', '303', '天祝藏族自治县');
INSERT INTO `tb_region` VALUES ('2644', '304', '甘州区');
INSERT INTO `tb_region` VALUES ('2645', '304', '肃南裕固族自治县');
INSERT INTO `tb_region` VALUES ('2646', '304', '民乐县');
INSERT INTO `tb_region` VALUES ('2647', '304', '临泽县');
INSERT INTO `tb_region` VALUES ('2648', '304', '高台县');
INSERT INTO `tb_region` VALUES ('2649', '304', '山丹县');
INSERT INTO `tb_region` VALUES ('2650', '305', '崆峒区');
INSERT INTO `tb_region` VALUES ('2651', '305', '泾川县');
INSERT INTO `tb_region` VALUES ('2652', '305', '灵台县');
INSERT INTO `tb_region` VALUES ('2653', '305', '崇信县');
INSERT INTO `tb_region` VALUES ('2654', '305', '华亭县');
INSERT INTO `tb_region` VALUES ('2655', '305', '庄浪县');
INSERT INTO `tb_region` VALUES ('2656', '305', '静宁县');
INSERT INTO `tb_region` VALUES ('2657', '306', '肃州区');
INSERT INTO `tb_region` VALUES ('2658', '306', '金塔县');
INSERT INTO `tb_region` VALUES ('2659', '306', '安西县');
INSERT INTO `tb_region` VALUES ('2660', '306', '肃北蒙古族自治县');
INSERT INTO `tb_region` VALUES ('2661', '306', '阿克塞哈萨克族自治县');
INSERT INTO `tb_region` VALUES ('2662', '306', '玉门市');
INSERT INTO `tb_region` VALUES ('2663', '306', '敦煌市');
INSERT INTO `tb_region` VALUES ('2664', '307', '西峰区');
INSERT INTO `tb_region` VALUES ('2665', '307', '庆城县');
INSERT INTO `tb_region` VALUES ('2666', '307', '环县');
INSERT INTO `tb_region` VALUES ('2667', '307', '华池县');
INSERT INTO `tb_region` VALUES ('2668', '307', '合水县');
INSERT INTO `tb_region` VALUES ('2669', '307', '正宁县');
INSERT INTO `tb_region` VALUES ('2670', '307', '宁县');
INSERT INTO `tb_region` VALUES ('2671', '307', '镇原县');
INSERT INTO `tb_region` VALUES ('2672', '308', '安定区');
INSERT INTO `tb_region` VALUES ('2673', '308', '通渭县');
INSERT INTO `tb_region` VALUES ('2674', '308', '陇西县');
INSERT INTO `tb_region` VALUES ('2675', '308', '渭源县');
INSERT INTO `tb_region` VALUES ('2676', '308', '临洮县');
INSERT INTO `tb_region` VALUES ('2677', '308', '漳县');
INSERT INTO `tb_region` VALUES ('2678', '308', '岷县');
INSERT INTO `tb_region` VALUES ('2679', '309', '武都区');
INSERT INTO `tb_region` VALUES ('2680', '309', '成县');
INSERT INTO `tb_region` VALUES ('2681', '309', '文县');
INSERT INTO `tb_region` VALUES ('2682', '309', '宕昌县');
INSERT INTO `tb_region` VALUES ('2683', '309', '康县');
INSERT INTO `tb_region` VALUES ('2684', '309', '西和县');
INSERT INTO `tb_region` VALUES ('2685', '309', '礼县');
INSERT INTO `tb_region` VALUES ('2686', '309', '徽县');
INSERT INTO `tb_region` VALUES ('2687', '309', '两当县');
INSERT INTO `tb_region` VALUES ('2688', '310', '临夏市');
INSERT INTO `tb_region` VALUES ('2689', '310', '临夏县');
INSERT INTO `tb_region` VALUES ('2690', '310', '康乐县');
INSERT INTO `tb_region` VALUES ('2691', '310', '永靖县');
INSERT INTO `tb_region` VALUES ('2692', '310', '广河县');
INSERT INTO `tb_region` VALUES ('2693', '310', '和政县');
INSERT INTO `tb_region` VALUES ('2694', '310', '东乡族自治县');
INSERT INTO `tb_region` VALUES ('2695', '310', '积石山保安族东乡族撒拉族自治县');
INSERT INTO `tb_region` VALUES ('2696', '311', '合作市');
INSERT INTO `tb_region` VALUES ('2697', '311', '临潭县');
INSERT INTO `tb_region` VALUES ('2698', '311', '卓尼县');
INSERT INTO `tb_region` VALUES ('2699', '311', '舟曲县');
INSERT INTO `tb_region` VALUES ('2700', '311', '迭部县');
INSERT INTO `tb_region` VALUES ('2701', '311', '玛曲县');
INSERT INTO `tb_region` VALUES ('2702', '311', '碌曲县');
INSERT INTO `tb_region` VALUES ('2703', '311', '夏河县');
INSERT INTO `tb_region` VALUES ('2704', '312', '城东区');
INSERT INTO `tb_region` VALUES ('2705', '312', '城中区');
INSERT INTO `tb_region` VALUES ('2706', '312', '城西区');
INSERT INTO `tb_region` VALUES ('2707', '312', '城北区');
INSERT INTO `tb_region` VALUES ('2708', '312', '大通回族土族自治县');
INSERT INTO `tb_region` VALUES ('2709', '312', '湟中县');
INSERT INTO `tb_region` VALUES ('2710', '312', '湟源县');
INSERT INTO `tb_region` VALUES ('2711', '313', '平安县');
INSERT INTO `tb_region` VALUES ('2712', '313', '民和回族土族自治县');
INSERT INTO `tb_region` VALUES ('2713', '313', '乐都县');
INSERT INTO `tb_region` VALUES ('2714', '313', '互助土族自治县');
INSERT INTO `tb_region` VALUES ('2715', '313', '化隆回族自治县');
INSERT INTO `tb_region` VALUES ('2716', '313', '循化撒拉族自治县');
INSERT INTO `tb_region` VALUES ('2717', '314', '门源回族自治县');
INSERT INTO `tb_region` VALUES ('2718', '314', '祁连县');
INSERT INTO `tb_region` VALUES ('2719', '314', '海晏县');
INSERT INTO `tb_region` VALUES ('2720', '314', '刚察县');
INSERT INTO `tb_region` VALUES ('2721', '315', '同仁县');
INSERT INTO `tb_region` VALUES ('2722', '315', '尖扎县');
INSERT INTO `tb_region` VALUES ('2723', '315', '泽库县');
INSERT INTO `tb_region` VALUES ('2724', '315', '河南蒙古族自治县');
INSERT INTO `tb_region` VALUES ('2725', '316', '共和县');
INSERT INTO `tb_region` VALUES ('2726', '316', '同德县');
INSERT INTO `tb_region` VALUES ('2727', '316', '贵德县');
INSERT INTO `tb_region` VALUES ('2728', '316', '兴海县');
INSERT INTO `tb_region` VALUES ('2729', '316', '贵南县');
INSERT INTO `tb_region` VALUES ('2730', '317', '玛沁县');
INSERT INTO `tb_region` VALUES ('2731', '317', '班玛县');
INSERT INTO `tb_region` VALUES ('2732', '317', '甘德县');
INSERT INTO `tb_region` VALUES ('2733', '317', '达日县');
INSERT INTO `tb_region` VALUES ('2734', '317', '久治县');
INSERT INTO `tb_region` VALUES ('2735', '317', '玛多县');
INSERT INTO `tb_region` VALUES ('2736', '318', '玉树县');
INSERT INTO `tb_region` VALUES ('2737', '318', '杂多县');
INSERT INTO `tb_region` VALUES ('2738', '318', '称多县');
INSERT INTO `tb_region` VALUES ('2739', '318', '治多县');
INSERT INTO `tb_region` VALUES ('2740', '318', '囊谦县');
INSERT INTO `tb_region` VALUES ('2741', '318', '曲麻莱县');
INSERT INTO `tb_region` VALUES ('2742', '319', '格尔木市');
INSERT INTO `tb_region` VALUES ('2743', '319', '德令哈市');
INSERT INTO `tb_region` VALUES ('2744', '319', '乌兰县');
INSERT INTO `tb_region` VALUES ('2745', '319', '都兰县');
INSERT INTO `tb_region` VALUES ('2746', '319', '天峻县');
INSERT INTO `tb_region` VALUES ('2747', '320', '兴庆区');
INSERT INTO `tb_region` VALUES ('2748', '320', '西夏区');
INSERT INTO `tb_region` VALUES ('2749', '320', '金凤区');
INSERT INTO `tb_region` VALUES ('2750', '320', '永宁县');
INSERT INTO `tb_region` VALUES ('2751', '320', '贺兰县');
INSERT INTO `tb_region` VALUES ('2752', '320', '灵武市');
INSERT INTO `tb_region` VALUES ('2753', '321', '大武口区');
INSERT INTO `tb_region` VALUES ('2754', '321', '惠农区');
INSERT INTO `tb_region` VALUES ('2755', '321', '平罗县');
INSERT INTO `tb_region` VALUES ('2756', '322', '利通区');
INSERT INTO `tb_region` VALUES ('2757', '322', '盐池县');
INSERT INTO `tb_region` VALUES ('2758', '322', '同心县');
INSERT INTO `tb_region` VALUES ('2759', '322', '青铜峡市');
INSERT INTO `tb_region` VALUES ('2760', '323', '原州区');
INSERT INTO `tb_region` VALUES ('2761', '323', '西吉县');
INSERT INTO `tb_region` VALUES ('2762', '323', '隆德县');
INSERT INTO `tb_region` VALUES ('2763', '323', '泾源县');
INSERT INTO `tb_region` VALUES ('2764', '323', '彭阳县');
INSERT INTO `tb_region` VALUES ('2765', '324', '沙坡头区');
INSERT INTO `tb_region` VALUES ('2766', '324', '中宁县');
INSERT INTO `tb_region` VALUES ('2767', '324', '海原县');
INSERT INTO `tb_region` VALUES ('2768', '325', '天山区');
INSERT INTO `tb_region` VALUES ('2769', '325', '沙依巴克区');
INSERT INTO `tb_region` VALUES ('2770', '325', '新市区');
INSERT INTO `tb_region` VALUES ('2771', '325', '水磨沟区');
INSERT INTO `tb_region` VALUES ('2772', '325', '头屯河区');
INSERT INTO `tb_region` VALUES ('2773', '325', '达坂城区');
INSERT INTO `tb_region` VALUES ('2774', '325', '东山区');
INSERT INTO `tb_region` VALUES ('2775', '325', '乌鲁木齐县');
INSERT INTO `tb_region` VALUES ('2776', '326', '独山子区');
INSERT INTO `tb_region` VALUES ('2777', '326', '克拉玛依区');
INSERT INTO `tb_region` VALUES ('2778', '326', '白碱滩区');
INSERT INTO `tb_region` VALUES ('2779', '326', '乌尔禾区');
INSERT INTO `tb_region` VALUES ('2780', '327', '吐鲁番市');
INSERT INTO `tb_region` VALUES ('2781', '327', '鄯善县');
INSERT INTO `tb_region` VALUES ('2782', '327', '托克逊县');
INSERT INTO `tb_region` VALUES ('2783', '328', '哈密市');
INSERT INTO `tb_region` VALUES ('2784', '328', '巴里坤哈萨克自治县');
INSERT INTO `tb_region` VALUES ('2785', '328', '伊吾县');
INSERT INTO `tb_region` VALUES ('2786', '329', '昌吉市');
INSERT INTO `tb_region` VALUES ('2787', '329', '阜康市');
INSERT INTO `tb_region` VALUES ('2788', '329', '米泉市');
INSERT INTO `tb_region` VALUES ('2789', '329', '呼图壁县');
INSERT INTO `tb_region` VALUES ('2790', '329', '玛纳斯县');
INSERT INTO `tb_region` VALUES ('2791', '329', '奇台县');
INSERT INTO `tb_region` VALUES ('2792', '329', '吉木萨尔县');
INSERT INTO `tb_region` VALUES ('2793', '329', '木垒哈萨克自治县');
INSERT INTO `tb_region` VALUES ('2794', '330', '博乐市');
INSERT INTO `tb_region` VALUES ('2795', '330', '精河县');
INSERT INTO `tb_region` VALUES ('2796', '330', '温泉县');
INSERT INTO `tb_region` VALUES ('2797', '331', '库尔勒市');
INSERT INTO `tb_region` VALUES ('2798', '331', '轮台县');
INSERT INTO `tb_region` VALUES ('2799', '331', '尉犁县');
INSERT INTO `tb_region` VALUES ('2800', '331', '若羌县');
INSERT INTO `tb_region` VALUES ('2801', '331', '且末县');
INSERT INTO `tb_region` VALUES ('2802', '331', '焉耆回族自治县');
INSERT INTO `tb_region` VALUES ('2803', '331', '和静县');
INSERT INTO `tb_region` VALUES ('2804', '331', '和硕县');
INSERT INTO `tb_region` VALUES ('2805', '331', '博湖县');
INSERT INTO `tb_region` VALUES ('2806', '332', '阿克苏市');
INSERT INTO `tb_region` VALUES ('2807', '332', '温宿县');
INSERT INTO `tb_region` VALUES ('2808', '332', '库车县');
INSERT INTO `tb_region` VALUES ('2809', '332', '沙雅县');
INSERT INTO `tb_region` VALUES ('2810', '332', '新和县');
INSERT INTO `tb_region` VALUES ('2811', '332', '拜城县');
INSERT INTO `tb_region` VALUES ('2812', '332', '乌什县');
INSERT INTO `tb_region` VALUES ('2813', '332', '阿瓦提县');
INSERT INTO `tb_region` VALUES ('2814', '332', '柯坪县');
INSERT INTO `tb_region` VALUES ('2815', '333', '阿图什市');
INSERT INTO `tb_region` VALUES ('2816', '333', '阿克陶县');
INSERT INTO `tb_region` VALUES ('2817', '333', '阿合奇县');
INSERT INTO `tb_region` VALUES ('2818', '333', '乌恰县');
INSERT INTO `tb_region` VALUES ('2819', '334', '喀什市');
INSERT INTO `tb_region` VALUES ('2820', '334', '疏附县');
INSERT INTO `tb_region` VALUES ('2821', '334', '疏勒县');
INSERT INTO `tb_region` VALUES ('2822', '334', '英吉沙县');
INSERT INTO `tb_region` VALUES ('2823', '334', '泽普县');
INSERT INTO `tb_region` VALUES ('2824', '334', '莎车县');
INSERT INTO `tb_region` VALUES ('2825', '334', '叶城县');
INSERT INTO `tb_region` VALUES ('2826', '334', '麦盖提县');
INSERT INTO `tb_region` VALUES ('2827', '334', '岳普湖县');
INSERT INTO `tb_region` VALUES ('2828', '334', '伽师县');
INSERT INTO `tb_region` VALUES ('2829', '334', '巴楚县');
INSERT INTO `tb_region` VALUES ('2830', '334', '塔什库尔干塔吉克自治县');
INSERT INTO `tb_region` VALUES ('2831', '335', '和田市');
INSERT INTO `tb_region` VALUES ('2832', '335', '和田县');
INSERT INTO `tb_region` VALUES ('2833', '335', '墨玉县');
INSERT INTO `tb_region` VALUES ('2834', '335', '皮山县');
INSERT INTO `tb_region` VALUES ('2835', '335', '洛浦县');
INSERT INTO `tb_region` VALUES ('2836', '335', '策勒县');
INSERT INTO `tb_region` VALUES ('2837', '335', '于田县');
INSERT INTO `tb_region` VALUES ('2838', '335', '民丰县');
INSERT INTO `tb_region` VALUES ('2839', '336', '伊宁市');
INSERT INTO `tb_region` VALUES ('2840', '336', '奎屯市');
INSERT INTO `tb_region` VALUES ('2841', '336', '伊宁县');
INSERT INTO `tb_region` VALUES ('2842', '336', '察布查尔锡伯自治县');
INSERT INTO `tb_region` VALUES ('2843', '336', '霍城县');
INSERT INTO `tb_region` VALUES ('2844', '336', '巩留县');
INSERT INTO `tb_region` VALUES ('2845', '336', '新源县');
INSERT INTO `tb_region` VALUES ('2846', '336', '昭苏县');
INSERT INTO `tb_region` VALUES ('2847', '336', '特克斯县');
INSERT INTO `tb_region` VALUES ('2848', '336', '尼勒克县');
INSERT INTO `tb_region` VALUES ('2849', '337', '塔城市');
INSERT INTO `tb_region` VALUES ('2850', '337', '乌苏市');
INSERT INTO `tb_region` VALUES ('2851', '337', '额敏县');
INSERT INTO `tb_region` VALUES ('2852', '337', '沙湾县');
INSERT INTO `tb_region` VALUES ('2853', '337', '托里县');
INSERT INTO `tb_region` VALUES ('2854', '337', '裕民县');
INSERT INTO `tb_region` VALUES ('2855', '337', '和布克赛尔蒙古自治县');
INSERT INTO `tb_region` VALUES ('2856', '338', '阿勒泰市');
INSERT INTO `tb_region` VALUES ('2857', '338', '布尔津县');
INSERT INTO `tb_region` VALUES ('2858', '338', '富蕴县');
INSERT INTO `tb_region` VALUES ('2859', '338', '福海县');
INSERT INTO `tb_region` VALUES ('2860', '338', '哈巴河县');
INSERT INTO `tb_region` VALUES ('2861', '338', '青河县');
INSERT INTO `tb_region` VALUES ('2862', '338', '吉木乃县');

-- ----------------------------
-- Table structure for tb_town
-- ----------------------------
DROP TABLE IF EXISTS `tb_town`;
CREATE TABLE `tb_town` (
  `town_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '城镇ID',
  `region_id` int(11) DEFAULT NULL COMMENT '县区ID',
  `name` varchar(30) DEFAULT NULL COMMENT '城镇名称',
  PRIMARY KEY (`town_id`),
  KEY `FK_Relationship_10` (`region_id`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城镇';

-- ----------------------------
-- Records of tb_town
-- ----------------------------

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `img` varchar(200) DEFAULT NULL COMMENT '小图标',
  `address` bigint(20) DEFAULT NULL COMMENT '默认地址',
  `path_key` varchar(200) DEFAULT NULL COMMENT '云存储key',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `index_unique` (`username`,`mobile`) USING BTREE COMMENT 'username唯一索引，BTree'
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '正品管理员你妹', '13655245362', '2017-03-23 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7d0a8358dc164f2da9e40c3feff234d3.jpg', '3', null);
INSERT INTO `tb_user` VALUES ('2', '你不是管理员', '13623423422', '2017-03-23 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/17d7ce684e1d4e57a8e06c61ce645429.jpg', '2', null);
INSERT INTO `tb_user` VALUES ('3', 'moies', '14574635235', '2017-03-06 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7d0a8358dc164f2da9e40c3feff234d3.jpg', '3', '');
INSERT INTO `tb_user` VALUES ('4', 'pinnaoi', '16758345636', '2017-03-15 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7d0a8358dc164f2da9e40c3feff234d3.jpg', '3', '');
INSERT INTO `tb_user` VALUES ('5', 'dfs', '10348956235', '2017-03-08 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7dbccfa2e96644efaadc23f6aafe3fb0.jpg', '1', null);
INSERT INTO `tb_user` VALUES ('6', 'marile', '14234256246', '2017-03-23 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7d0a8358dc164f2da9e40c3feff234d3.jpg', '3', '');
INSERT INTO `tb_user` VALUES ('7', 'usioey', '17468453672', '2017-03-23 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/17d7ce684e1d4e57a8e06c61ce645429.jpg', '2', '');
INSERT INTO `tb_user` VALUES ('8', 'moiesefse', '15473483463', '2017-03-06 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7d0a8358dc164f2da9e40c3feff234d3.jpg', '3', '');
INSERT INTO `tb_user` VALUES ('9', '月色多', '14347458356', '2017-03-15 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7d0a8358dc164f2da9e40c3feff234d3.jpg', '3', '');
INSERT INTO `tb_user` VALUES ('10', '剪刀手', '15736436734', '2017-03-08 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7dbccfa2e96644efaadc23f6aafe3fb0.jpg', '1', '');
INSERT INTO `tb_user` VALUES ('11', '我才是剪刀手', '15923453636', '2017-03-06 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7d0a8358dc164f2da9e40c3feff234d3.jpg', '3', '');
INSERT INTO `tb_user` VALUES ('12', '爱德华', '14235347572', '2017-03-15 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7d0a8358dc164f2da9e40c3feff234d3.jpg', '3', '');
INSERT INTO `tb_user` VALUES ('13', '你敢用爱德华', '13457584623', '2017-03-08 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7dbccfa2e96644efaadc23f6aafe3fb0.jpg', '1', '');
INSERT INTO `tb_user` VALUES ('14', '信不信我一个', '14769452345', '2017-03-23 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7d0a8358dc164f2da9e40c3feff234d3.jpg', '3', '');
INSERT INTO `tb_user` VALUES ('15', '我一个剪刀手', '10673527637', '2017-03-23 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/17d7ce684e1d4e57a8e06c61ce645429.jpg', '2', '');
INSERT INTO `tb_user` VALUES ('16', '能不能不聊', '14564852355', '2017-03-06 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7d0a8358dc164f2da9e40c3feff234d3.jpg', '3', '');
INSERT INTO `tb_user` VALUES ('17', '那啥了', '13445645734', '2017-03-15 22:37:41', 'bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a', 'image/7d0a8358dc164f2da9e40c3feff234d3.jpg', '3', '');

-- ----------------------------
-- Table structure for tb_user_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_address`;
CREATE TABLE `tb_user_address` (
  `address_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `province_id` int(11) DEFAULT NULL COMMENT '省份ID',
  `city_id` int(11) DEFAULT NULL COMMENT '城市ID',
  `region_id` int(11) DEFAULT NULL COMMENT '县区ID',
  `town_id` int(11) DEFAULT NULL COMMENT '城镇ID',
  `province_name` varchar(50) DEFAULT NULL COMMENT '省份名称',
  `city_name` varchar(50) DEFAULT NULL COMMENT '城市名称',
  `region_name` varchar(50) DEFAULT NULL COMMENT '县区名称',
  `town_name` varchar(50) DEFAULT NULL COMMENT '城镇名称',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `telephone` varchar(30) DEFAULT NULL COMMENT '电话号',
  `mobile` varchar(30) DEFAULT NULL COMMENT '手机号',
  `default_addr` int(11) DEFAULT NULL COMMENT '是否为默认地址',
  PRIMARY KEY (`address_id`),
  KEY `FK_tb_user_addr` (`user_id`),
  KEY `FK_tb_user_address_province` (`province_id`),
  KEY `FK_tb_user_address_city` (`city_id`),
  KEY `FK_tb_user_address_region` (`region_id`),
  KEY `FK_tb_user_address_town` (`town_id`),
  CONSTRAINT `FK_tb_user_addr` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`),
  CONSTRAINT `FK_tb_user_address_city` FOREIGN KEY (`city_id`) REFERENCES `tb_city` (`city_id`),
  CONSTRAINT `FK_tb_user_address_province` FOREIGN KEY (`province_id`) REFERENCES `tb_province` (`province_id`),
  CONSTRAINT `FK_tb_user_address_region` FOREIGN KEY (`region_id`) REFERENCES `tb_region` (`region_id`),
  CONSTRAINT `FK_tb_user_address_town` FOREIGN KEY (`town_id`) REFERENCES `tb_town` (`town_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户地址';

-- ----------------------------
-- Records of tb_user_address
-- ----------------------------
INSERT INTO `tb_user_address` VALUES ('1', '2', 'usern', '1', '1', '2', null, '北京市', '北京市', '西城区', null, '西城区中心小区', '13236532850', '13236532850', '1');
INSERT INTO `tb_user_address` VALUES ('3', '1', 'mark', '1', '1', '1', null, '北京市', '北京市', '东城区', null, 'dongc', '111', '111', '1');
INSERT INTO `tb_user_address` VALUES ('9', '1', '我的亲亲亲亲亲亲', null, null, null, null, '北京市', '北京市', '东城区', null, '不知告诉过小区', null, '18765242536', '0');

-- ----------------------------
-- View structure for tb_goods_info_view
-- ----------------------------
DROP VIEW IF EXISTS `tb_goods_info_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `tb_goods_info_view` AS select `a`.`goods_id` AS `goods_id`,`a`.`user_id` AS `user_id`,`a`.`category_id` AS `category_id`,`a`.`name` AS `goods_name`,`a`.`price` AS `price`,`a`.`newprice` AS `newprice`,`a`.`status` AS `status`,`a`.`addtime` AS `addtime`,`a`.`updatetime` AS `updatetime`,`a`.`description` AS `description`,`a`.`goods_address` AS `goods_address`,`a`.`decoration` AS `decoration`,`b`.`username` AS `username`,`b`.`img` AS `user_img`,`c`.`name` AS `category_name`,`c`.`icon` AS `category_icon`,`d`.`local_path` AS `goods_img`,`d`.`path_key` AS `path_key` from (((`tb_goods` `a` left join `tb_user` `b` on((`a`.`user_id` = `b`.`user_id`))) left join `tb_category` `c` on((`a`.`category_id` = `c`.`category_id`))) left join `tb_goods_images` `d` on((`a`.`goods_id` = `d`.`goods_id`))) group by `a`.`goods_id` ;
