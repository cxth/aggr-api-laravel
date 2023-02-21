-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.6.51 - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for isoftbetgamehub_codeception
DROP DATABASE IF EXISTS `isoftbetgamehub_codeception`;
CREATE DATABASE IF NOT EXISTS `isoftbetgamehub_codeception` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `isoftbetgamehub_codeception`;

-- DROP DATABASE IF EXISTS `new_sail_application`;
-- CREATE DATABASE IF NOT EXISTS `new_sail_application` /*!40100 DEFAULT CHARACTER SET latin1 */;
-- USE `new_sail_application`;

-- Dumping structure for table isoftbetgamehub_codeception.action_log_agent
DROP TABLE IF EXISTS `action_log_agent`;
CREATE TABLE IF NOT EXISTS `action_log_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `additional` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `uri` text NOT NULL,
  `referer` text NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `skin_id` int(11) NOT NULL,
  `user_target` int(10) NOT NULL DEFAULT '0',
  `user_target_type` enum('auser','agent','player','group','module') NOT NULL,
  `user_ip` varchar(64) NOT NULL,
  `countrycode` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`),
  KEY `action` (`action`),
  KEY `skin_id` (`skin_id`),
  KEY `user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.action_log_agent: ~0 rows (approximately)
/*!40000 ALTER TABLE `action_log_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_log_agent` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.action_log_player
DROP TABLE IF EXISTS `action_log_player`;
CREATE TABLE IF NOT EXISTS `action_log_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(255) NOT NULL,
  `additional` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `domain` varchar(255) NOT NULL,
  `uri` text NOT NULL,
  `referer` text NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `skin_id` int(11) NOT NULL,
  `user_ip` varchar(64) NOT NULL,
  `countrycode` varchar(2) DEFAULT NULL,
  `browser_signature` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`),
  KEY `action` (`action`),
  KEY `skin_id` (`skin_id`),
  KEY `user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.action_log_player: ~0 rows (approximately)
/*!40000 ALTER TABLE `action_log_player` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_log_player` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.action_log_player_unique
DROP TABLE IF EXISTS `action_log_player_unique`;
CREATE TABLE IF NOT EXISTS `action_log_player_unique` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(255) NOT NULL,
  `time` date NOT NULL,
  `skin_id` int(11) NOT NULL,
  `loginsall` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `action` (`action`),
  KEY `skin_id` (`skin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.action_log_player_unique: ~0 rows (approximately)
/*!40000 ALTER TABLE `action_log_player_unique` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_log_player_unique` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.admin_groups
DROP TABLE IF EXISTS `admin_groups`;
CREATE TABLE IF NOT EXISTS `admin_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.admin_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `admin_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_groups` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.admin_modules
DROP TABLE IF EXISTS `admin_modules`;
CREATE TABLE IF NOT EXISTS `admin_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `permissions` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.admin_modules: ~0 rows (approximately)
/*!40000 ALTER TABLE `admin_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_modules` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.admin_permissions
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE IF NOT EXISTS `admin_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission` bigint(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_id` (`module_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.admin_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.admin_usergroup
DROP TABLE IF EXISTS `admin_usergroup`;
CREATE TABLE IF NOT EXISTS `admin_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.admin_usergroup: ~0 rows (approximately)
/*!40000 ALTER TABLE `admin_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_usergroup` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.agents
DROP TABLE IF EXISTS `agents`;
CREATE TABLE IF NOT EXISTS `agents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(41) DEFAULT NULL,
  `salt` varchar(64) DEFAULT NULL,
  `nickname` varchar(20) NOT NULL,
  `hash` varchar(41) NOT NULL,
  `currencycode` varchar(3) DEFAULT NULL,
  `countrycode` char(2) DEFAULT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `balance_fidolimit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `balance_fun` decimal(15,2) NOT NULL,
  `balance_cell` decimal(15,2) NOT NULL,
  `dailydeplimit` int(11) DEFAULT NULL,
  `poker_credit` decimal(15,2) DEFAULT NULL,
  `poker_credit_date` datetime DEFAULT NULL,
  `profit` decimal(5,2) NOT NULL,
  `profit_dr` int(11) DEFAULT NULL,
  `profit_go` int(11) DEFAULT NULL,
  `profit_gv` int(11) DEFAULT NULL,
  `profit_rk` int(11) DEFAULT NULL,
  `profit_mt` int(11) DEFAULT NULL,
  `profit_bn` int(11) DEFAULT NULL,
  `profit_oa` decimal(5,2) DEFAULT NULL,
  `profit_os` decimal(5,2) DEFAULT NULL,
  `profit_ov` decimal(5,2) DEFAULT NULL,
  `profit_oh` decimal(5,2) DEFAULT NULL,
  `profit_ls` decimal(5,2) DEFAULT NULL,
  `profit_5m` decimal(5,2) DEFAULT NULL,
  `profit_ct` decimal(5,2) DEFAULT NULL,
  `profit_fa` decimal(5,2) DEFAULT NULL,
  `profit_g3` decimal(5,2) DEFAULT NULL,
  `profit_g2` decimal(5,2) DEFAULT NULL,
  `profit_p4` decimal(5,2) DEFAULT NULL,
  `profit_rd` decimal(5,2) DEFAULT NULL,
  `profit_ol` decimal(5,2) DEFAULT NULL,
  `profit_e2` decimal(5,2) DEFAULT NULL,
  `profit_py` decimal(5,2) DEFAULT NULL,
  `profit_p3` decimal(5,2) DEFAULT NULL,
  `profit_r2` decimal(5,2) DEFAULT NULL,
  `profit_sb` decimal(5,2) DEFAULT NULL,
  `profit_s2` decimal(5,2) DEFAULT NULL,
  `profit_eb` decimal(5,2) DEFAULT NULL,
  `profit_q3` decimal(5,2) DEFAULT NULL,
  `profit_mv` decimal(5,2) DEFAULT NULL,
  `profit_ae` decimal(5,2) DEFAULT NULL,
  `profit_ss` decimal(5,2) DEFAULT NULL,
  `profit_hw` decimal(5,2) DEFAULT NULL,
  `profit_lg` decimal(5,2) DEFAULT NULL,
  `profit_va` decimal(5,2) DEFAULT NULL,
  `profit_sw` decimal(5,2) DEFAULT NULL,
  `profit_fz` decimal(5,2) DEFAULT NULL,
  `profit_kd` decimal(5,2) NOT NULL,
  `profit_l2` decimal(5,2) NOT NULL,
  `profit_cp` decimal(5,2) NOT NULL,
  `profit_wo` decimal(5,2) NOT NULL,
  `profit_ka` decimal(5,2) NOT NULL,
  `profit_rv` decimal(5,2) NOT NULL,
  `profit_gr` decimal(5,2) NOT NULL,
  `profit_sm` decimal(5,2) NOT NULL,
  `profit_p1` decimal(5,2) NOT NULL,
  `profit_p0` decimal(5,2) NOT NULL,
  `profit_pn` decimal(5,2) NOT NULL,
  `profit_i8` decimal(5,2) NOT NULL,
  `profit_h8` decimal(5,2) NOT NULL,
  `profit_m4` decimal(5,2) NOT NULL,
  `profit_mk` decimal(5,2) NOT NULL,
  `profit_ko` decimal(5,2) NOT NULL,
  `profit_p2` decimal(5,2) NOT NULL,
  `profit_nv` decimal(5,2) NOT NULL,
  `profit_du` decimal(5,2) NOT NULL,
  `profit_qb` decimal(5,2) NOT NULL,
  `profit_q2` decimal(5,2) NOT NULL,
  `profit_sv` decimal(5,2) NOT NULL,
  `profit_pe` decimal(5,2) NOT NULL,
  `profit_ea` decimal(5,2) NOT NULL,
  `profit_bf` decimal(5,2) NOT NULL,
  `profit_b2` decimal(5,2) NOT NULL,
  `profit_bp` decimal(5,2) NOT NULL,
  `profit_hs` decimal(5,2) NOT NULL,
  `profit_jp` decimal(5,2) NOT NULL,
  `profit_sy` decimal(5,2) NOT NULL,
  `profit_pf` decimal(5,2) NOT NULL,
  `profit_ps` decimal(5,2) NOT NULL,
  `profit_am` decimal(5,2) NOT NULL,
  `profit_ma` decimal(5,2) NOT NULL,
  `profit_re` decimal(5,2) NOT NULL,
  `profit_qk` decimal(5,2) NOT NULL,
  `profit_m2` decimal(5,2) NOT NULL,
  `profit_wz` decimal(5,2) NOT NULL,
  `profit_yp` decimal(5,2) NOT NULL,
  `profit_pc` decimal(5,2) NOT NULL,
  `profit_tk` decimal(5,2) NOT NULL,
  `profit_tp` decimal(5,2) NOT NULL,
  `profit_pm` decimal(5,2) NOT NULL,
  `profit_yg` decimal(5,2) NOT NULL,
  `profit_ds` decimal(5,2) NOT NULL,
  `profit_o2` decimal(5,2) NOT NULL,
  `profit_qf` decimal(5,2) NOT NULL,
  `profit_qr` decimal(5,2) NOT NULL,
  `profit_qp` decimal(5,2) NOT NULL,
  `profit_md` decimal(5,2) NOT NULL,
  `profit_mn` decimal(5,2) NOT NULL,
  `profit_bx` decimal(5,2) NOT NULL,
  `profit_sg` decimal(5,2) NOT NULL,
  `profit_di` decimal(5,2) NOT NULL,
  `profit_le` decimal(5,2) NOT NULL,
  `profit_id` decimal(5,2) NOT NULL,
  `profit_xg` decimal(5,2) NOT NULL,
  `profit_sp` decimal(5,2) NOT NULL,
  `profit_no` decimal(5,2) NOT NULL,
  `profit_gb` decimal(5,2) NOT NULL,
  `profit_th` decimal(5,2) NOT NULL,
  `profit_ep` decimal(5,2) NOT NULL,
  `profit_gh` decimal(5,2) NOT NULL,
  `profit_el` decimal(5,2) NOT NULL,
  `profit_gp` decimal(5,2) NOT NULL,
  `profit_in` decimal(5,2) NOT NULL,
  `profit_kf` decimal(5,2) NOT NULL,
  `profit_kl` decimal(5,2) NOT NULL,
  `profit_kb` decimal(5,2) NOT NULL,
  `profit_lu` decimal(5,2) NOT NULL,
  `profit_ok` decimal(5,2) NOT NULL,
  `profit_op` decimal(5,2) NOT NULL,
  `profit_mb` decimal(5,2) NOT NULL,
  `profit_mj` decimal(5,2) NOT NULL,
  `profit_mf` decimal(5,2) NOT NULL,
  `profit_er` decimal(5,2) NOT NULL,
  `profit_ig` decimal(5,2) NOT NULL,
  `profit_vg` decimal(5,2) NOT NULL,
  `profit_rt` decimal(5,2) NOT NULL,
  `profit_li` decimal(5,2) NOT NULL,
  `profit_ou` decimal(5,2) NOT NULL,
  `profit_ha` decimal(5,2) NOT NULL,
  `profit_pb` decimal(5,2) NOT NULL,
  `profit_be` decimal(5,2) NOT NULL,
  `profit_gg` decimal(5,2) NOT NULL,
  `profit_fg` decimal(5,2) NOT NULL,
  `profit_pp` decimal(5,2) NOT NULL,
  `profit_pa` decimal(5,2) NOT NULL,
  `profit_dg` decimal(5,2) NOT NULL,
  `profit_bt` decimal(5,2) NOT NULL,
  `profit_as` decimal(5,2) NOT NULL,
  `profit_bs` decimal(5,2) NOT NULL,
  `profit_ar` decimal(5,2) NOT NULL,
  `profit_ev` decimal(5,2) NOT NULL,
  `profit_ex` decimal(5,2) NOT NULL,
  `profit_cb` decimal(5,2) NOT NULL,
  `profit_ml` decimal(5,2) NOT NULL,
  `profit_tw` decimal(5,2) NOT NULL,
  `profit_cc` decimal(5,2) NOT NULL,
  `profit_la` decimal(5,2) NOT NULL,
  `profit_lo` decimal(5,2) NOT NULL,
  `profit_3j` decimal(5,2) NOT NULL,
  `profit_mg` decimal(5,2) NOT NULL,
  `profit_mw` decimal(5,2) NOT NULL,
  `profit_rc` decimal(5,2) NOT NULL,
  `profit_ri` decimal(5,2) NOT NULL,
  `profit_rr` decimal(5,2) NOT NULL,
  `profit_oc` decimal(5,2) NOT NULL,
  `profit_ob` decimal(5,2) NOT NULL,
  `profit_po` decimal(5,2) NOT NULL,
  `profit_ki` decimal(5,2) NOT NULL,
  `profit_ga` decimal(5,2) NOT NULL,
  `profit_gs` decimal(5,2) NOT NULL,
  `profit_gw` decimal(5,2) NOT NULL,
  `profit_gc` decimal(5,2) NOT NULL,
  `profit_gd` decimal(5,2) NOT NULL,
  `profit_bl` decimal(5,2) NOT NULL,
  `profit_tu` decimal(5,2) NOT NULL,
  `profit_pr` decimal(5,2) NOT NULL,
  `profit_es` decimal(5,2) NOT NULL,
  `profit_rs` decimal(5,2) NOT NULL,
  `profit_np` decimal(5,2) NOT NULL,
  `profit_nl` decimal(5,2) NOT NULL,
  `profit_lp` decimal(5,2) NOT NULL,
  `profit_pl` decimal(5,2) NOT NULL,
  `profit_bc` decimal(5,2) NOT NULL,
  `profit_ac` decimal(5,2) NOT NULL,
  `profit_ht` decimal(5,2) NOT NULL,
  `profit_ks` decimal(5,2) NOT NULL,
  `profit_kw` decimal(5,2) NOT NULL,
  `profit_cs` decimal(5,2) NOT NULL,
  `profit_cw` decimal(5,2) NOT NULL,
  `profit_bg` decimal(5,2) NOT NULL,
  `profit_3d` decimal(5,2) NOT NULL,
  `profit_dl` decimal(5,2) NOT NULL,
  `profit_sl` decimal(5,2) NOT NULL,
  `profit_mi` decimal(5,2) NOT NULL,
  `profit_ms` decimal(5,2) NOT NULL,
  `profit_ne` decimal(5,2) NOT NULL,
  `profit_mc` decimal(5,2) NOT NULL,
  `profit_pt` decimal(5,2) NOT NULL,
  `profit_tb` decimal(5,2) NOT NULL,
  `profit_ag` decimal(5,2) NOT NULL,
  `profit_pg` decimal(5,2) NOT NULL,
  `profit_og` decimal(5,2) NOT NULL,
  `profit_or` decimal(5,2) NOT NULL,
  `profit_ot` decimal(5,2) NOT NULL,
  `profit_rp` decimal(5,2) NOT NULL,
  `profit_qs` decimal(5,2) NOT NULL,
  `profit_ip` decimal(5,2) NOT NULL,
  `profit_is` decimal(5,2) NOT NULL,
  `profit_kv` decimal(5,2) NOT NULL,
  `profit_hi` decimal(5,2) NOT NULL,
  `profit_mr` decimal(5,2) NOT NULL,
  `profit_mp` decimal(5,2) NOT NULL,
  `profit_gl` decimal(5,2) NOT NULL,
  `profit_vi` decimal(5,2) NOT NULL,
  `profit_ez` decimal(5,2) NOT NULL,
  `profit_xe` decimal(5,2) NOT NULL,
  `profit_pq` decimal(5,2) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `mobilenumber` varchar(20) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `company` varchar(128) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `casinoid` int(11) DEFAULT NULL,
  `fname` varchar(128) DEFAULT NULL,
  `lname` varchar(128) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `blockaccess` tinyint(1) NOT NULL DEFAULT '0',
  `blocktree` tinyint(1) NOT NULL DEFAULT '0',
  `lastactive` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `logins` int(6) NOT NULL,
  `sessionid` varchar(32) NOT NULL,
  `status` enum('PENDING','VALIDATED','FROZEN','DEACTIVATED','BLOCKED') NOT NULL,
  `perm` text NOT NULL,
  `disabled_systems` varchar(2048) DEFAULT NULL,
  `disabled_games` text NOT NULL,
  `games_position` text,
  `additional` text NOT NULL,
  `platformid` int(2) NOT NULL,
  `ref_code` varchar(10) NOT NULL,
  `agentaccreditation` varchar(15) NOT NULL,
  `group` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  KEY `platformid` (`platformid`),
  KEY `username` (`username`),
  KEY `fname` (`fname`),
  KEY `lname` (`lname`),
  KEY `email` (`email`),
  KEY `address` (`address`),
  KEY `city` (`city`),
  KEY `lastactive` (`lastactive`),
  KEY `currencycode` (`currencycode`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.agents: ~0 rows (approximately)
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
REPLACE INTO `agents` (`id`, `username`, `password`, `salt`, `nickname`, `hash`, `currencycode`, `countrycode`, `balance`, `balance_fidolimit`, `balance_fun`, `balance_cell`, `dailydeplimit`, `poker_credit`, `poker_credit_date`, `profit`, `profit_dr`, `profit_go`, `profit_gv`, `profit_rk`, `profit_mt`, `profit_bn`, `profit_oa`, `profit_os`, `profit_ov`, `profit_oh`, `profit_ls`, `profit_5m`, `profit_ct`, `profit_fa`, `profit_g3`, `profit_g2`, `profit_p4`, `profit_rd`, `profit_ol`, `profit_e2`, `profit_py`, `profit_p3`, `profit_r2`, `profit_sb`, `profit_s2`, `profit_eb`, `profit_q3`, `profit_mv`, `profit_ae`, `profit_ss`, `profit_hw`, `profit_lg`, `profit_va`, `profit_sw`, `profit_fz`, `profit_kd`, `profit_l2`, `profit_cp`, `profit_wo`, `profit_ka`, `profit_rv`, `profit_gr`, `profit_sm`, `profit_p1`, `profit_p0`, `profit_pn`, `profit_i8`, `profit_h8`, `profit_m4`, `profit_mk`, `profit_ko`, `profit_p2`, `profit_nv`, `profit_du`, `profit_qb`, `profit_q2`, `profit_sv`, `profit_pe`, `profit_ea`, `profit_bf`, `profit_b2`, `profit_bp`, `profit_hs`, `profit_jp`, `profit_sy`, `profit_pf`, `profit_ps`, `profit_am`, `profit_ma`, `profit_re`, `profit_qk`, `profit_m2`, `profit_wz`, `profit_yp`, `profit_pc`, `profit_tk`, `profit_tp`, `profit_pm`, `profit_yg`, `profit_ds`, `profit_o2`, `profit_qf`, `profit_qr`, `profit_qp`, `profit_md`, `profit_mn`, `profit_bx`, `profit_sg`, `profit_di`, `profit_le`, `profit_id`, `profit_xg`, `profit_sp`, `profit_no`, `profit_gb`, `profit_th`, `profit_ep`, `profit_gh`, `profit_el`, `profit_gp`, `profit_in`, `profit_kf`, `profit_kl`, `profit_kb`, `profit_lu`, `profit_ok`, `profit_op`, `profit_mb`, `profit_mj`, `profit_mf`, `profit_er`, `profit_ig`, `profit_vg`, `profit_rt`, `profit_li`, `profit_ou`, `profit_ha`, `profit_pb`, `profit_be`, `profit_gg`, `profit_fg`, `profit_pp`, `profit_pa`, `profit_dg`, `profit_bt`, `profit_as`, `profit_bs`, `profit_ar`, `profit_ev`, `profit_ex`, `profit_cb`, `profit_ml`, `profit_tw`, `profit_cc`, `profit_la`, `profit_lo`, `profit_3j`, `profit_mg`, `profit_mw`, `profit_rc`, `profit_ri`, `profit_rr`, `profit_oc`, `profit_ob`, `profit_po`, `profit_ki`, `profit_ga`, `profit_gs`, `profit_gw`, `profit_gc`, `profit_gd`, `profit_bl`, `profit_tu`, `profit_pr`, `profit_es`, `profit_rs`, `profit_np`, `profit_nl`, `profit_lp`, `profit_pl`, `profit_bc`, `profit_ac`, `profit_ht`, `profit_ks`, `profit_kw`, `profit_cs`, `profit_cw`, `profit_bg`, `profit_3d`, `profit_dl`, `profit_sl`, `profit_mi`, `profit_ms`, `profit_ne`, `profit_mc`, `profit_pt`, `profit_tb`, `profit_ag`, `profit_pg`, `profit_og`, `profit_or`, `profit_ot`, `profit_rp`, `profit_qs`, `profit_ip`, `profit_is`, `profit_kv`, `profit_hi`, `profit_mr`, `profit_mp`, `profit_gl`, `profit_vi`, `profit_ez`, `profit_xe`, `profit_pq`, `parent`, `mobilenumber`, `email`, `phone`, `fax`, `company`, `url`, `address`, `address2`, `state`, `zip`, `casinoid`, `fname`, `lname`, `created`, `city`, `is_admin`, `blockaccess`, `blocktree`, `lastactive`, `updated`, `logins`, `sessionid`, `status`, `perm`, `disabled_systems`, `disabled_games`, `games_position`, `additional`, `platformid`, `ref_code`, `agentaccreditation`, `group`) VALUES
	(55, 'codeception_isb_mc_s', '511f7a97acc3de474f415dab37dc3e5b6f0bcf25', NULL, '', '', 'EUR', 'mt', 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-15 13:48:58', NULL, 0, 0, 0, NULL, NULL, 0, '', 'PENDING', '', '', '[]', '{}', '', 0, '2fa394b7', '', '');
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.agent_disabled_systems_history
DROP TABLE IF EXISTS `agent_disabled_systems_history`;
CREATE TABLE IF NOT EXISTS `agent_disabled_systems_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL,
  `disabled_systems` varchar(1024) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `disabled_systems` (`disabled_systems`(767)),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.agent_disabled_systems_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `agent_disabled_systems_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_disabled_systems_history` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.agent_history
DROP TABLE IF EXISTS `agent_history`;
CREATE TABLE IF NOT EXISTS `agent_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL,
  `profit` text NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.agent_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `agent_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_history` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.agent_history_profit
DROP TABLE IF EXISTS `agent_history_profit`;
CREATE TABLE IF NOT EXISTS `agent_history_profit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` varchar(128) DEFAULT '',
  `agentid` int(10) unsigned DEFAULT NULL,
  `profit` decimal(5,2) DEFAULT NULL,
  `validto` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_2` (`system`,`agentid`,`validto`),
  KEY `system` (`system`),
  KEY `agentid` (`agentid`),
  KEY `validto` (`validto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.agent_history_profit: ~0 rows (approximately)
/*!40000 ALTER TABLE `agent_history_profit` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_history_profit` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.agent_images
DROP TABLE IF EXISTS `agent_images`;
CREATE TABLE IF NOT EXISTS `agent_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'Untitled.txt',
  `mime` varchar(50) NOT NULL DEFAULT 'text/plain',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `data` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `platform_id` int(11) DEFAULT NULL,
  `agenttype` varchar(32) NOT NULL,
  `aid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `platform_id` (`platform_id`),
  KEY `agenttype` (`agenttype`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.agent_images: ~0 rows (approximately)
/*!40000 ALTER TABLE `agent_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_images` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.agent_messages
DROP TABLE IF EXISTS `agent_messages`;
CREATE TABLE IF NOT EXISTS `agent_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agentid_recipient` int(11) NOT NULL,
  `username_recipient` varchar(15) CHARACTER SET utf8 NOT NULL,
  `message` text CHARACTER SET utf8,
  `agentid_sender` int(11) NOT NULL,
  `username_sender` varchar(15) CHARACTER SET utf8 NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.agent_messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `agent_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_messages` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.agent_settings
DROP TABLE IF EXISTS `agent_settings`;
CREATE TABLE IF NOT EXISTS `agent_settings` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `agent_id` int(6) NOT NULL,
  `game_ids_bonus_restricted` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_id` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.agent_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `agent_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_settings` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.agent_users
DROP TABLE IF EXISTS `agent_users`;
CREATE TABLE IF NOT EXISTS `agent_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 NOT NULL,
  `agent_id` int(11) NOT NULL,
  `password` varchar(41) CHARACTER SET utf8 NOT NULL,
  `salt` varchar(64) DEFAULT NULL,
  `status` enum('VALIDATED','BLOCKED','DEACTIVATED') CHARACTER SET utf8 NOT NULL,
  `additional` varchar(1024) DEFAULT NULL,
  `perm` text NOT NULL,
  `group` varchar(41) DEFAULT NULL,
  `sessionid` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `logins` int(6) DEFAULT NULL,
  `platformid` int(6) DEFAULT NULL,
  `lastactive` datetime DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `agent_id` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.agent_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `agent_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_users` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.apiusers
DROP TABLE IF EXISTS `apiusers`;
CREATE TABLE IF NOT EXISTS `apiusers` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `user` varchar(64) DEFAULT NULL,
  `pass` char(41) NOT NULL,
  `prefix` varchar(4) NOT NULL,
  `allow_hosts` mediumtext NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `siteprovider` tinyint(1) NOT NULL DEFAULT '0',
  `agentid` int(6) NOT NULL DEFAULT '0' COMMENT 'this user is game provider',
  `callback_url` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `multicurrency` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `freerounds_enabled` bool NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `pass` (`pass`),
  KEY `agentid` (`agentid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.apiusers: ~2 rows (approximately)
/*!40000 ALTER TABLE `apiusers` DISABLE KEYS */;
REPLACE INTO `apiusers` (`id`, `user`, `pass`, `prefix`, `allow_hosts`, `is_admin`, `siteprovider`, `agentid`, `callback_url`, `protocol`, `salt`, `multicurrency`, `active`) VALUES
	(11, 'ruslanlocal_mc_s', '7f5ca566f68dc7a10e133b2077dc05de814ee80a', 't6e4', '10.100.29.*;127.0.0.1;127.0.0.1;192.168.1.1;10.1.1.1', 0, 0, 55, 'http://10.1.1.66:8000/wallet/api', 'jsonISB', 'randomsalt', 1, 1),
	(12, 'codeception_bog_mc_s', '6445e28ecbfdd6b4f20a863a52b229508c1bbb5f', 'x3z4', '10.100.29.*;127.0.0.1;127.0.0.1;192.168.1.1;10.1.1.1', 0, 0, 55, 'http://10.1.1.66:8000/wallet/bog', 'jsonBOG', 'randomsalt', 1, 1),
	(13, 'codeception_betsson_mc_s', '25a72d902e5d49ee13556424f681d17c60f6b24c', 'b3s4', '10.100.29.*;127.0.0.1;127.0.0.1;192.168.1.1;10.1.1.1', 0, 0, 55, 'http://10.1.1.66:8000/wallet/betsson', 'jsonBetsson', 'randomsalt', 1, 1);
/*!40000 ALTER TABLE `apiusers` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.apiuserspayments
DROP TABLE IF EXISTS `apiuserspayments`;
CREATE TABLE IF NOT EXISTS `apiuserspayments` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `user` varchar(32) NOT NULL,
  `pass` char(41) NOT NULL,
  `prefix` varchar(8) NOT NULL,
  `allow_hosts` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `paymentprovider` tinyint(1) NOT NULL DEFAULT '0',
  `agentid` int(6) NOT NULL DEFAULT '0' COMMENT 'this user is payment provider',
  `callback_url` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.apiuserspayments: ~0 rows (approximately)
/*!40000 ALTER TABLE `apiuserspayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `apiuserspayments` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat
DROP TABLE IF EXISTS `arrowchat`;
CREATE TABLE IF NOT EXISTS `arrowchat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(25) NOT NULL,
  `to` varchar(25) NOT NULL,
  `message` text NOT NULL,
  `sent` int(10) unsigned NOT NULL,
  `read` int(10) unsigned NOT NULL,
  `user_read` tinyint(1) NOT NULL DEFAULT '0',
  `direction` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `to` (`to`),
  KEY `read` (`read`),
  KEY `user_read` (`user_read`),
  KEY `from` (`from`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_admin
DROP TABLE IF EXISTS `arrowchat_admin`;
CREATE TABLE IF NOT EXISTS `arrowchat_admin` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_admin: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_admin` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_applications
DROP TABLE IF EXISTS `arrowchat_applications`;
CREATE TABLE IF NOT EXISTS `arrowchat_applications` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `folder` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `width` int(4) unsigned NOT NULL,
  `height` int(4) unsigned NOT NULL,
  `bar_width` int(3) unsigned DEFAULT NULL,
  `bar_name` varchar(100) DEFAULT NULL,
  `dont_reload` tinyint(1) unsigned DEFAULT '0',
  `default_bookmark` tinyint(1) unsigned DEFAULT '1',
  `show_to_guests` tinyint(1) unsigned DEFAULT '1',
  `link` varchar(255) DEFAULT NULL,
  `update_link` varchar(255) DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_applications: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_applications` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_banlist
DROP TABLE IF EXISTS `arrowchat_banlist`;
CREATE TABLE IF NOT EXISTS `arrowchat_banlist` (
  `ban_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ban_userid` varchar(25) DEFAULT NULL,
  `ban_ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ban_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_banlist: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_banlist` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_chatroom_banlist
DROP TABLE IF EXISTS `arrowchat_chatroom_banlist`;
CREATE TABLE IF NOT EXISTS `arrowchat_chatroom_banlist` (
  `user_id` varchar(25) COLLATE utf8_bin NOT NULL,
  `chatroom_id` int(10) unsigned NOT NULL,
  `ban_length` int(10) unsigned NOT NULL,
  `ban_time` int(10) unsigned NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `chatroom_id` (`chatroom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_chatroom_banlist: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_chatroom_banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_chatroom_banlist` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_chatroom_messages
DROP TABLE IF EXISTS `arrowchat_chatroom_messages`;
CREATE TABLE IF NOT EXISTS `arrowchat_chatroom_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chatroom_id` int(10) unsigned NOT NULL,
  `user_id` varchar(25) COLLATE utf8_bin NOT NULL,
  `username` varchar(100) COLLATE utf8_bin NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `global_message` tinyint(1) unsigned DEFAULT '0',
  `is_mod` tinyint(1) unsigned DEFAULT '0',
  `is_admin` tinyint(1) unsigned DEFAULT '0',
  `sent` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chatroom_id` (`chatroom_id`),
  KEY `user_id` (`user_id`),
  KEY `sent` (`sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_chatroom_messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_chatroom_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_chatroom_messages` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_chatroom_rooms
DROP TABLE IF EXISTS `arrowchat_chatroom_rooms`;
CREATE TABLE IF NOT EXISTS `arrowchat_chatroom_rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` varchar(25) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `password` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `length` int(10) unsigned NOT NULL,
  `max_users` int(10) NOT NULL DEFAULT '0',
  `session_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_time` (`session_time`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_chatroom_rooms: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_chatroom_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_chatroom_rooms` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_chatroom_users
DROP TABLE IF EXISTS `arrowchat_chatroom_users`;
CREATE TABLE IF NOT EXISTS `arrowchat_chatroom_users` (
  `user_id` varchar(25) COLLATE utf8_bin NOT NULL,
  `chatroom_id` int(10) unsigned NOT NULL,
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_mod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `block_chats` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `session_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `chatroom_id` (`chatroom_id`),
  KEY `is_admin` (`is_admin`),
  KEY `is_mod` (`is_mod`),
  KEY `session_time` (`session_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_chatroom_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_chatroom_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_chatroom_users` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_config
DROP TABLE IF EXISTS `arrowchat_config`;
CREATE TABLE IF NOT EXISTS `arrowchat_config` (
  `config_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `config_value` text,
  `is_dynamic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `config_name` (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_config` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_graph_log
DROP TABLE IF EXISTS `arrowchat_graph_log`;
CREATE TABLE IF NOT EXISTS `arrowchat_graph_log` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(30) NOT NULL,
  `user_messages` int(10) unsigned DEFAULT '0',
  `chat_room_messages` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_graph_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_graph_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_graph_log` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_notifications
DROP TABLE IF EXISTS `arrowchat_notifications`;
CREATE TABLE IF NOT EXISTS `arrowchat_notifications` (
  `id` int(25) unsigned NOT NULL AUTO_INCREMENT,
  `to_id` varchar(25) NOT NULL,
  `author_id` varchar(25) NOT NULL,
  `author_name` varchar(100) NOT NULL,
  `misc1` varchar(255) DEFAULT NULL,
  `misc2` varchar(255) DEFAULT NULL,
  `misc3` varchar(255) DEFAULT NULL,
  `type` int(3) unsigned NOT NULL,
  `alert_read` int(1) unsigned NOT NULL DEFAULT '0',
  `user_read` int(1) unsigned NOT NULL DEFAULT '0',
  `alert_time` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `to_id` (`to_id`),
  KEY `alert_read` (`alert_read`),
  KEY `user_read` (`user_read`),
  KEY `alert_time` (`alert_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_notifications: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_notifications` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_notifications_markup
DROP TABLE IF EXISTS `arrowchat_notifications_markup`;
CREATE TABLE IF NOT EXISTS `arrowchat_notifications_markup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` int(3) unsigned NOT NULL,
  `markup` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_notifications_markup: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_notifications_markup` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_notifications_markup` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_smilies
DROP TABLE IF EXISTS `arrowchat_smilies`;
CREATE TABLE IF NOT EXISTS `arrowchat_smilies` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_smilies: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_smilies` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_smilies` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_status
DROP TABLE IF EXISTS `arrowchat_status`;
CREATE TABLE IF NOT EXISTS `arrowchat_status` (
  `userid` varchar(25) NOT NULL,
  `guest_name` varchar(50) DEFAULT NULL,
  `message` text,
  `status` varchar(10) DEFAULT NULL,
  `theme` int(3) unsigned DEFAULT NULL,
  `popout` int(11) unsigned DEFAULT NULL,
  `typing` text,
  `hide_bar` tinyint(1) unsigned DEFAULT NULL,
  `play_sound` tinyint(1) unsigned DEFAULT '1',
  `window_open` tinyint(1) unsigned DEFAULT NULL,
  `only_names` tinyint(1) unsigned DEFAULT NULL,
  `chatroom_window` varchar(2) NOT NULL DEFAULT '-1',
  `chatroom_stay` varchar(2) NOT NULL DEFAULT '-1',
  `chatroom_block_chats` tinyint(1) unsigned DEFAULT NULL,
  `chatroom_sound` tinyint(1) unsigned DEFAULT NULL,
  `announcement` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `unfocus_chat` text,
  `focus_chat` varchar(50) DEFAULT NULL,
  `last_message` text,
  `clear_chats` text,
  `apps_bookmarks` text,
  `apps_other` text,
  `apps_open` int(10) unsigned DEFAULT NULL,
  `apps_load` text,
  `block_chats` text,
  `session_time` int(20) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hash_id` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `hash_id` (`hash_id`),
  KEY `session_time` (`session_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_status: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_status` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_themes
DROP TABLE IF EXISTS `arrowchat_themes`;
CREATE TABLE IF NOT EXISTS `arrowchat_themes` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `folder` varchar(25) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) unsigned NOT NULL,
  `update_link` varchar(255) DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL,
  `default` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_themes: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_themes` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.arrowchat_trayicons
DROP TABLE IF EXISTS `arrowchat_trayicons`;
CREATE TABLE IF NOT EXISTS `arrowchat_trayicons` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `icon` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `target` varchar(25) DEFAULT NULL,
  `width` int(4) unsigned DEFAULT NULL,
  `height` int(4) unsigned DEFAULT NULL,
  `tray_width` int(3) unsigned DEFAULT NULL,
  `tray_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `tray_location` int(3) unsigned NOT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.arrowchat_trayicons: ~0 rows (approximately)
/*!40000 ALTER TABLE `arrowchat_trayicons` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrowchat_trayicons` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.bcl_log_all
DROP TABLE IF EXISTS `bcl_log_all`;
CREATE TABLE IF NOT EXISTS `bcl_log_all` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` varchar(2) NOT NULL,
  `date` datetime NOT NULL,
  `request` varchar(10000) NOT NULL,
  `params` varchar(10000) NOT NULL,
  `response` varchar(10000) NOT NULL,
  `stat` varchar(100) NOT NULL,
  `player` varchar(100) NOT NULL,
  `ip` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.bcl_log_all: ~0 rows (approximately)
/*!40000 ALTER TABLE `bcl_log_all` DISABLE KEYS */;
/*!40000 ALTER TABLE `bcl_log_all` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.blockaccess
DROP TABLE IF EXISTS `blockaccess`;
CREATE TABLE IF NOT EXISTS `blockaccess` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `game_id` int(10) NOT NULL,
  `player_id` int(10) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `block_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `blocked_by` enum('self','admin') COLLATE utf8_slovenian_ci NOT NULL,
  `blocker_id` int(11) NOT NULL,
  `description` text COLLATE utf8_slovenian_ci NOT NULL,
  `followups` text COLLATE utf8_slovenian_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Dumping data for table isoftbetgamehub_codeception.blockaccess: ~0 rows (approximately)
/*!40000 ALTER TABLE `blockaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `blockaccess` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.bonuses
DROP TABLE IF EXISTS `bonuses`;
CREATE TABLE IF NOT EXISTS `bonuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `creator` int(11) unsigned NOT NULL,
  `activated_by` varchar(50) NOT NULL,
  `applies_to_payments` text NOT NULL,
  `allow_above_zero` tinyint(1) NOT NULL,
  `deposit_min` decimal(15,2) NOT NULL,
  `deposit_max` decimal(15,2) NOT NULL,
  `bonus_min` decimal(15,2) NOT NULL,
  `deposit_match_with_percentage` int(3) NOT NULL,
  `days_to_clear` int(6) NOT NULL,
  `deposit_match_up_to` decimal(15,2) NOT NULL,
  `systems` text NOT NULL,
  `wagering_requirement` int(6) NOT NULL,
  `wagering_contribution` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `sticky` tinyint(1) NOT NULL DEFAULT '1',
  `sticky_real` tinyint(1) NOT NULL DEFAULT '0',
  `valid_from` datetime NOT NULL,
  `valid_until` datetime NOT NULL,
  `valid_on_days` varchar(30) NOT NULL,
  `valid_time_start` time NOT NULL,
  `valid_time_end` time NOT NULL,
  `chunk_size` int(3) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `platformid` int(6) NOT NULL,
  `allow_zero_out` tinyint(1) NOT NULL,
  `zero_out_threshold` decimal(15,2) DEFAULT NULL,
  `currencycode` char(3) DEFAULT NULL,
  `recharging` tinyint(1) NOT NULL,
  `visible_in_promotions` tinyint(1) NOT NULL DEFAULT '1',
  `auto_select` tinyint(1) NOT NULL,
  `content_id` varchar(255) DEFAULT NULL,
  `freeround_promo_id` varchar(24) NOT NULL,
  `content_id_big` varchar(255) DEFAULT NULL,
  `frontend_link` text,
  `frontend_slug` text,
  `max_bonus_cashout_factor` int(4) NOT NULL DEFAULT '0',
  `number_of_activations` int(3) NOT NULL DEFAULT '0',
  `time_activation_limit` varchar(20) DEFAULT NULL,
  `hide_in_transfers` tinyint(1) NOT NULL DEFAULT '0',
  `global_activation_limit` int(11) DEFAULT '0',
  `children` varchar(255) DEFAULT NULL,
  `parents` varchar(255) DEFAULT NULL,
  `restrict_disabled_in_bonus_games` tinyint(1) NOT NULL DEFAULT '0',
  `use_player_timezone` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_bonuses_agents` (`creator`),
  KEY `platformid` (`platformid`),
  KEY `active` (`active`),
  KEY `currencycode` (`currencycode`),
  KEY `activated_by` (`activated_by`),
  CONSTRAINT `bonuses_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `agents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Dumping data for table isoftbetgamehub_codeception.bonuses: ~0 rows (approximately)
/*!40000 ALTER TABLE `bonuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonuses` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.bonuses_rebate
DROP TABLE IF EXISTS `bonuses_rebate`;
CREATE TABLE IF NOT EXISTS `bonuses_rebate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `creator` int(11) unsigned NOT NULL,
  `bet_to_point` decimal(15,2) NOT NULL,
  `point_to_cashout` decimal(15,2) NOT NULL,
  `wagering_contribution` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `valid_from` datetime NOT NULL,
  `valid_until` datetime NOT NULL,
  `valid_on_days` varchar(30) NOT NULL,
  `valid_time_start` time NOT NULL,
  `valid_time_end` time NOT NULL,
  `chunk_size` int(3) NOT NULL,
  `platformid` int(6) NOT NULL,
  `currencycode` char(3) DEFAULT NULL,
  `active_with_other_bonuses` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_bonuses_agents` (`creator`),
  CONSTRAINT `bonuses_rebate_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `agents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Dumping data for table isoftbetgamehub_codeception.bonuses_rebate: ~0 rows (approximately)
/*!40000 ALTER TABLE `bonuses_rebate` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonuses_rebate` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.bonus_player
DROP TABLE IF EXISTS `bonus_player`;
CREATE TABLE IF NOT EXISTS `bonus_player` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) unsigned NOT NULL,
  `bonus_id` int(11) DEFAULT NULL,
  `bonus_amount` float(15,2) NOT NULL,
  `deposit_amount` float(15,2) NOT NULL,
  `points_needed` int(11) NOT NULL,
  `wagers` text NOT NULL,
  `wagers_start` text NOT NULL,
  `seamless_contributions` text NOT NULL,
  `points_current` int(6) NOT NULL DEFAULT '0',
  `bonus_cleared` decimal(15,2) NOT NULL,
  `bonus_left` decimal(15,2) NOT NULL DEFAULT '0.00',
  `trigger_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `chunk_size` float(15,2) NOT NULL,
  `valid_until` datetime NOT NULL,
  `issue_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finished_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` tinyint(1) NOT NULL DEFAULT '1',
  `completed_event` varchar(50) DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `bonus_data` text,
  `message_to_player` varchar(255) DEFAULT NULL,
  `message_shown` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bonus_player_players` (`player_id`),
  KEY `bonus_id` (`bonus_id`),
  KEY `active` (`active`),
  KEY `completed_event` (`completed_event`),
  KEY `finished_on` (`finished_on`),
  KEY `issue_time` (`issue_time`),
  CONSTRAINT `FK_bonus_player_players` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.bonus_player: ~0 rows (approximately)
/*!40000 ALTER TABLE `bonus_player` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus_player` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.bonus_rebate_player
DROP TABLE IF EXISTS `bonus_rebate_player`;
CREATE TABLE IF NOT EXISTS `bonus_rebate_player` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) unsigned NOT NULL,
  `bonus_id` int(11) DEFAULT NULL,
  `bonus_amount` float(15,2) NOT NULL,
  `bet_amount` float(15,2) NOT NULL,
  `points_needed` int(11) NOT NULL,
  `wagers` text NOT NULL,
  `wagers_start` text NOT NULL,
  `seamless_contributions` text NOT NULL,
  `points_current` int(6) NOT NULL DEFAULT '0',
  `bonus_cleared` decimal(15,2) NOT NULL,
  `bonus_left` decimal(15,2) NOT NULL DEFAULT '0.00',
  `trigger_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `chunk_size` float(15,2) NOT NULL,
  `valid_until` datetime NOT NULL,
  `issue_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finished_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `expires` tinyint(1) NOT NULL DEFAULT '1',
  `completed_event` varchar(50) DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `bonus_data` text,
  `message_to_player` varchar(255) DEFAULT NULL,
  `message_shown` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bonus_player_players` (`player_id`),
  KEY `bonus_id` (`bonus_id`),
  KEY `active` (`active`),
  KEY `completed_event` (`completed_event`),
  KEY `finished_on` (`finished_on`),
  KEY `issue_time` (`issue_time`),
  CONSTRAINT `bonus_rebate_player_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Dumping data for table isoftbetgamehub_codeception.bonus_rebate_player: ~0 rows (approximately)
/*!40000 ALTER TABLE `bonus_rebate_player` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus_rebate_player` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.cards
DROP TABLE IF EXISTS `cards`;
CREATE TABLE IF NOT EXISTS `cards` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `card_id` bigint(11) NOT NULL,
  `topAgent` int(11) NOT NULL,
  `cardAgent` int(11) DEFAULT NULL,
  `pl_username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `pl_password` varchar(6) CHARACTER SET utf8 NOT NULL,
  `transfered_to_Player` tinyint(1) NOT NULL DEFAULT '0',
  `amount` decimal(15,2) NOT NULL,
  `created` datetime NOT NULL,
  `transfered_to_cardAgent` tinyint(1) NOT NULL DEFAULT '0',
  `transfered_at` datetime DEFAULT NULL,
  `transferMoneyFromCardAgent` tinyint(1) NOT NULL DEFAULT '0',
  `platform_id` int(11) NOT NULL,
  `redeem` tinyint(1) NOT NULL DEFAULT '0',
  `redeem_to_Player` varchar(17) DEFAULT NULL,
  `redeem_at` datetime DEFAULT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `disabled_enabled_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pl_username` (`pl_username`),
  KEY `cardAgent` (`cardAgent`),
  KEY `transfered_to_Player` (`transfered_to_Player`),
  KEY `redeem` (`redeem`),
  KEY `platform_id` (`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.cards: ~0 rows (approximately)
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.catastali
DROP TABLE IF EXISTS `catastali`;
CREATE TABLE IF NOT EXISTS `catastali` (
  `id` int(11) NOT NULL,
  `municipal` varchar(64) NOT NULL,
  `state` varchar(2) NOT NULL,
  `code` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.catastali: ~0 rows (approximately)
/*!40000 ALTER TABLE `catastali` DISABLE KEYS */;
/*!40000 ALTER TABLE `catastali` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.cities_it
DROP TABLE IF EXISTS `cities_it`;
CREATE TABLE IF NOT EXISTS `cities_it` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) COLLATE utf8_slovenian_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_slovenian_ci NOT NULL,
  `province` varchar(5) COLLATE utf8_slovenian_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci;

-- Dumping data for table isoftbetgamehub_codeception.cities_it: ~0 rows (approximately)
/*!40000 ALTER TABLE `cities_it` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_it` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.connectionsCheck
DROP TABLE IF EXISTS `connectionsCheck`;
CREATE TABLE IF NOT EXISTS `connectionsCheck` (
  `id` bigint(20) DEFAULT NULL,
  `USER` varchar(255) DEFAULT NULL,
  `HOST` varchar(255) DEFAULT NULL,
  `DB` varchar(255) DEFAULT NULL,
  `COMMAND` varchar(255) DEFAULT NULL,
  `TIME` int(11) DEFAULT NULL,
  `STATE` varchar(50) DEFAULT NULL,
  `INFO` text,
  `DATE` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.connectionsCheck: ~0 rows (approximately)
/*!40000 ALTER TABLE `connectionsCheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `connectionsCheck` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.content
DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `language` varchar(50) NOT NULL,
  `title` text CHARACTER SET utf8 NOT NULL,
  `text` mediumtext CHARACTER SET utf8,
  `platform_id` int(11) NOT NULL,
  `global` tinyint(1) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `custom_link` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `summary` text CHARACTER SET utf8,
  `image` text CHARACTER SET utf8,
  `url_title` text CHARACTER SET utf8,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `head_title` text,
  `meta_keywords` text CHARACTER SET utf8,
  `meta_description` text CHARACTER SET utf8,
  `position` int(11) NOT NULL DEFAULT '0',
  `version` varchar(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `article_id` (`article_id`),
  KEY `platform_id` (`platform_id`),
  KEY `time` (`time`),
  KEY `language` (`language`),
  KEY `type` (`type`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.content: ~0 rows (approximately)
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
/*!40000 ALTER TABLE `content` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.content_gallery
DROP TABLE IF EXISTS `content_gallery`;
CREATE TABLE IF NOT EXISTS `content_gallery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'Untitled.txt',
  `mime` varchar(50) NOT NULL DEFAULT 'text/plain',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `data` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `platform_id` int(11) DEFAULT NULL,
  `global` tinyint(1) DEFAULT NULL,
  `alt` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `platform_id` (`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.content_gallery: ~0 rows (approximately)
/*!40000 ALTER TABLE `content_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_gallery` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.countries
DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `code` varchar(4) NOT NULL,
  `country` varchar(255) NOT NULL,
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  `defaultcurrency` varchar(4) DEFAULT '',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.countries: ~2 rows (approximately)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
REPLACE INTO `countries` (`code`, `country`, `lat`, `lon`, `defaultcurrency`) VALUES
	('ad', 'Andorra', 42.3, 1.3, 'EUR'),
	('ae', 'United Arab Emirates', 24, 54, 'AED'),
	('af', 'Afghanistan', 33, 65, 'AFN'),
	('ag', 'Antigua and Barbuda', 17.03, -61.48, 'XCD'),
	('ai', 'Anguilla', 18.15, -63.1, 'XCD'),
	('al', 'Albania', 41, 20, 'ALL'),
	('am', 'Armenia', 40, 45, 'AMD'),
	('an', 'Netherlands Antilles', 12.15, -68.45, ''),
	('ao', 'Angola', -12.3, 18.3, 'AOA'),
	('ap', 'Asia-Pacific', -2.81, 128.5, ''),
	('aq', 'Antarctica', -90, 0, ''),
	('ar', 'Argentina', -34, -64, 'ARS'),
	('as', 'American Samoa', -14.2, -170, 'USD'),
	('at', 'Austria', 47.2, 13.2, 'EUR'),
	('au', 'Australia', -27, 133, 'AUD'),
	('aw', 'Aruba', 12.3, -69.58, 'AWG'),
	('ax', 'Aland Islands', 60.21, 20.16, 'EUR'),
	('az', 'Azerbaijan', 40.3, 47.3, 'AZN'),
	('ba', 'Bosnia and Herzegovina', 44, 18, 'BAM'),
	('bb', 'Barbados', 13.1, -59.32, 'BBD'),
	('bd', 'Bangladesh', 24, 90, 'BDT'),
	('be', 'Belgium', 50.5, 4, 'EUR'),
	('bf', 'Burkina Faso', 13, -2, 'XOF'),
	('bg', 'Bulgaria', 43, 25, 'BGN'),
	('bh', 'Bahrain', 26, 50.33, 'BHD'),
	('bi', 'Burundi', -3.3, 30, 'BIF'),
	('bj', 'Benin', 9.3, 2.15, 'XOF'),
	('bm', 'Bermuda', 32.2, -64.45, 'BMD'),
	('bn', 'Brunei Darussalam', 4.3, 114.4, 'BND'),
	('bo', 'Bolivia', -17, -65, 'BOB'),
	('br', 'Brazil', -10, -55, 'BRL'),
	('bs', 'Bahamas', 24.15, -76, 'BSD'),
	('bt', 'Bhutan', 27.3, 90.3, 'BTN'),
	('bv', 'Bouvet Island', -54.26, 3.24, 'NOK'),
	('bw', 'Botswana', -22, 24, 'BWP'),
	('by', 'Belarus', 53, 28, 'BYN'),
	('bz', 'Belize', 17.15, -88.45, 'BZD'),
	('ca', 'Canada', 60, -95, 'CAD'),
	('cc', 'Cocos (Keeling) Islands', -12.3, 96.5, 'AUD'),
	('cd', 'Democratic Republic of Congo', -4.04, 30.75, 'CDF'),
	('cf', 'Central African Republic', 7, 21, 'XAF'),
	('cg', 'Congo', 0, 25, 'XAF'),
	('ch', 'Switzerland', 47, 8, 'CHF'),
	('ci', 'Ivory Coast', 7.64, -4.93, 'XOF'),
	('ck', 'Cook Islands', -21.14, -159.46, 'NZD'),
	('cl', 'Chile', -30, -71, 'CLP'),
	('cm', 'Cameroon', 6, 12, 'XAF'),
	('cn', 'China', 35, 105, 'CNY'),
	('co', 'Colombia', 4, -72, 'COP'),
	('cr', 'Costa Rica', 10, -84, 'CRC'),
	('cs', 'Serbia and Montenegro', 43.57, 21.41, ''),
	('cu', 'Cuba', 21.3, -80, 'CUP'),
	('cv', 'Cape Verde', 16, -24, 'CVE'),
	('cx', 'Christmas Island', -10.3, 105.4, 'AUD'),
	('cy', 'Cyprus', 35, 33, 'EUR'),
	('cz', 'Czech Republic', 49.45, 15.3, 'CZK'),
	('de', 'Germany', 51, 9, 'EUR'),
	('dj', 'Djibouti', 11.3, 43, 'DJF'),
	('dk', 'Denmark', 56, 10, 'DKK'),
	('dm', 'Dominica', 15.25, -61.2, 'XCD'),
	('do', 'Dominican Republic', 19, -70.4, 'DOP'),
	('dz', 'Algeria', 28, 3, 'DZD'),
	('ec', 'Ecuador', -2, -77.3, 'USD'),
	('ee', 'Estonia', 59, 26, 'EUR'),
	('eg', 'Egypt', 27, 30, 'EGP'),
	('eh', 'Western Sahara', 24.3, -13, 'MAD'),
	('er', 'Eritrea', 15, 39, 'ERN'),
	('es', 'Spain', 40, -4, 'EUR'),
	('et', 'Ethiopia', 8, 38, 'ETB'),
	('eu', 'Europe', 0, 0, ''),
	('fi', 'Finland', 64, 26, 'EUR'),
	('fj', 'Fiji', -18, 175, 'FJD'),
	('fk', 'Falkland Islands (Malvinas)', -51.45, -59, ''),
	('fm', 'Micronesia', 6.55, 158.15, 'USD'),
	('fo', 'Faroe Islands', 62, -7, 'DKK'),
	('fr', 'France', 46, 2, 'EUR'),
	('ga', 'Gabon', -1, 11.45, 'XAF'),
	('gb', 'Great Britain (UK)', 54, -2, 'GBP'),
	('gd', 'Grenada', 12.07, -61.4, 'XCD'),
	('ge', 'Georgia', 42, 43.3, 'GEL'),
	('gf', 'French Guiana', 4, -53, 'EUR'),
	('gh', 'Ghana', 8, -2, 'GHS'),
	('gi', 'Gibraltar', 36.8, -5.21, 'GIP'),
	('gl', 'Greenland', 72, -40, 'DKK'),
	('gm', 'Gambia', 13.28, -16.34, 'GMD'),
	('gn', 'Guinea', 11, -10, 'GNF'),
	('gp', 'Guadeloupe', 16.15, -61.35, 'EUR'),
	('gq', 'Equatorial Guinea', 2, 10, 'XAF'),
	('gr', 'Greece', 39, 22, 'EUR'),
	('gs', 'S. Georgia and S. Sandwich Isls.', -54.3, -37, ''),
	('gt', 'Guatemala', 15.3, -90.15, 'GTQ'),
	('gu', 'Guam', 13.28, 144.47, 'USD'),
	('gw', 'Guinea-Bissau', 12, -15, 'XOF'),
	('gy', 'Guyana', 5, -59, 'GYD'),
	('hk', 'Hong Kong', 22.15, 114.1, 'HKD'),
	('hm', 'Heard and McDonald Islands', -53.06, 72.31, 'AUD'),
	('hn', 'Honduras', 15, -86.3, 'HNL'),
	('hr', 'Croatia (Hrvatska)', 45.1, 15.3, 'HRK'),
	('ht', 'Haiti', 19, -72.25, 'USD'),
	('hu', 'Hungary', 47, 20, 'HUF'),
	('id', 'Indonesia', -5, 120, 'IDR'),
	('ie', 'Ireland', 53, -8, 'EUR'),
	('il', 'Israel', 31.3, 34.45, 'ILS'),
	('in', 'India', 20, 77, 'INR'),
	('io', 'British Indian Ocean Territory', -6, 71.3, 'USD'),
	('iq', 'Iraq', 33, 44, 'IQD'),
	('ir', 'Iran', 32, 53, 'IRR'),
	('is', 'Iceland', 65, -18, 'ISK'),
	('it', 'Italy', 42.5, 12.5, 'EUR'),
	('jm', 'Jamaica', 18.15, -77.3, 'JMD'),
	('jo', 'Jordan', 31, 36, 'JOD'),
	('jp', 'Japan', 36, 138, 'JPY'),
	('ke', 'Kenya', 1, 38, 'KES'),
	('kg', 'Kyrgyzstan', 41, 75, 'KGS'),
	('kh', 'Cambodia', 13, 105, 'KHR'),
	('ki', 'Kiribati', 1.25, 173, 'AUD'),
	('km', 'Comoros', -12.1, 44.15, 'KMF'),
	('kn', 'Saint Kitts and Nevis', 17.2, -62.45, 'XCD'),
	('kp', 'Korea (North)', 40, 127, 'KPW'),
	('kr', 'Korea (South)', 37, 127.3, 'KRW'),
	('kw', 'Kuwait', 29.3, 45.45, 'KWD'),
	('ky', 'Cayman Islands', 19.3, -80.3, 'KYD'),
	('kz', 'Kazakhstan', 48, 68, 'KZT'),
	('la', 'Laos', 18, 105, 'LAK'),
	('lb', 'Lebanon', 33.5, 35.5, 'LBP'),
	('lc', 'Saint Lucia', 13.53, -60.68, 'XCD'),
	('li', 'Liechtenstein', 47.16, 9.32, 'CHF'),
	('lk', 'Sri Lanka', 7, 81, 'LKR'),
	('lr', 'Liberia', 6.3, -9.3, 'LRD'),
	('ls', 'Lesotho', -29.3, 28.3, 'ZAR'),
	('lt', 'Lithuania', 56, 24, 'EUR'),
	('lu', 'Luxembourg', 49.45, 6.1, 'EUR'),
	('lv', 'Latvia', 57, 25, 'EUR'),
	('ly', 'Libya', 25, 17, 'LYD'),
	('ma', 'Morocco', 32, -5, 'MAD'),
	('mc', 'Monaco', 43.44, 7.24, 'EUR'),
	('md', 'Moldova', 47, 29, 'MDL'),
	('mg', 'Madagascar', -20, 47, 'MGA'),
	('mh', 'Marshall Islands', 9, 168, 'USD'),
	('mk', 'Macedonia', 41.5, 22, 'MKD'),
	('ml', 'Mali', 17, -4, 'XOF'),
	('mm', 'Burma (Myanmar)', 22, 98, 'MMK'),
	('mn', 'Mongolia', 46, 105, 'MNT'),
	('mo', 'Macau', 22.1, 113.33, 'MOP'),
	('mp', 'Northern Mariana Islands', 15.12, 145.45, 'USD'),
	('mq', 'Martinique', 14.4, -61, 'EUR'),
	('mr', 'Mauritania', 20, -12, 'MRO'),
	('ms', 'Montserrat', 16.45, -62.12, 'XCD'),
	('mt', 'Malta', 35.5, 14.35, 'EUR'),
	('mu', 'Mauritius', -20.17, 57.33, 'MUR'),
	('mv', 'Maldives', 3.15, 73, 'MVR'),
	('mw', 'Malawi', -13.3, 34, 'MWK'),
	('mx', 'Mexico', 23, -102, 'MXN'),
	('my', 'Malaysia', 2.3, 112.3, 'MYR'),
	('mz', 'Mozambique', -18.15, 35, 'MZN'),
	('na', 'Namibia', -22, 17, 'ZAR'),
	('nc', 'New Caledonia', -21.3, 165.3, 'XPF'),
	('ne', 'Niger', 16, 8, 'XOF'),
	('nf', 'Norfolk Island', -29.02, 167.57, 'AUD'),
	('ng', 'Nigeria', 10, 8, 'NGN'),
	('ni', 'Nicaragua', 13, -85, 'NIO'),
	('nl', 'Netherlands', 52.3, 5.45, 'EUR'),
	('no', 'Norway', 62, 10, 'NOK'),
	('np', 'Nepal', 28, 84, 'NPR'),
	('nr', 'Nauru', -0.32, 166.55, 'AUD'),
	('nt', 'Neutral Zone', 0, 0, ''),
	('nu', 'Niue', -19.02, -169.52, 'NZD'),
	('nz', 'New Zealand (Aotearoa)', -41, 174, 'NZD'),
	('om', 'Oman', 21, 57, 'OMR'),
	('pa', 'Panama', 9, -80, 'USD'),
	('pe', 'Peru', -10, -76, 'PEN'),
	('pf', 'French Polynesia', -15, -140, 'XPF'),
	('pg', 'Papua New Guinea', -6, 147, 'PGK'),
	('ph', 'Philippines', 13, 122, 'PHP'),
	('pk', 'Pakistan', 30, 70, 'PKR'),
	('pl', 'Poland', 52, 20, 'PLN'),
	('pm', 'St. Pierre and Miquelon', 46.5, -56.2, 'EUR'),
	('pn', 'Pitcairn', -25.04, -130.06, 'NZD'),
	('pr', 'Puerto Rico', 18.15, -66.3, 'USD'),
	('ps', 'Palestinian Territory, Occupied', 31.89, 34.9, ''),
	('pt', 'Portugal', 39.3, -8, 'EUR'),
	('pw', 'Palau', 7.3, 134.3, 'USD'),
	('py', 'Paraguay', -23, -58, 'PYG'),
	('qa', 'Qatar', 25.3, 51.15, 'QAR'),
	('re', 'Reunion', -21.06, 55.36, 'EUR'),
	('ro', 'Romania', 46, 25, 'RON'),
	('rs', 'Republic of Serbia', 44.02, 21.01, 'RSD'),
	('ru', 'Russia', 60, 100, 'RUB'),
	('rw', 'Rwanda', -2, 30, 'RWF'),
	('sa', 'Saudi Arabia', 25, 45, 'SAR'),
	('sb', 'Solomon Islands', -8, 159, 'SBD'),
	('sc', 'Seychelles', -4.35, 55.4, 'SCR'),
	('sd', 'Sudan', 15, 30, 'SDG'),
	('se', 'Sweden', 62, 15, 'SEK'),
	('sg', 'Singapore', 1.22, 103.48, 'SGD'),
	('sh', 'St. Helena', -15.56, -5.42, 'SHP'),
	('si', 'Slovenia', 46.07, 14.49, 'EUR'),
	('sj', 'Svalbard and Jan Mayen Islands', 78, 20, 'NOK'),
	('sk', 'Slovak Republic', 48.4, 19.3, 'EUR'),
	('sl', 'Sierra Leone', 8.3, -11.3, 'SLL'),
	('sm', 'San Marino', 43.46, 12.25, 'EUR'),
	('sn', 'Senegal', 14, -14, 'XOF'),
	('so', 'Somalia', 10, 49, 'SOS'),
	('sr', 'Suriname', 4, -56, 'SRD'),
	('st', 'Sao Tome and Principe', 1, 7, 'STD'),
	('sv', 'El Salvador', 13.5, -88.55, 'USD'),
	('sy', 'Syria', 35, 38, 'SYP'),
	('sz', 'Swaziland', -26.3, 31.3, 'SZL'),
	('tc', 'Turks and Caicos Islands', 21.45, -71.35, 'USD'),
	('td', 'Chad', 15, 19, 'XAF'),
	('tf', 'French Southern Territories', -43, 67, 'EUR'),
	('tg', 'Togo', 8, 1.1, 'XOF'),
	('th', 'Thailand', 15, 100, 'THB'),
	('tj', 'Tajikistan', 39, 71, 'TJS'),
	('tk', 'Tokelau', -9, -172, 'NZD'),
	('tm', 'Turkmenistan', 40, 60, 'TMT'),
	('tn', 'Tunisia', 34, 9, 'TND'),
	('to', 'Tonga', -20, -175, 'TOP'),
	('tp', 'East Timor', -8.5, 125.55, ''),
	('tr', 'Turkey', 39, 35, 'TRY'),
	('tt', 'Trinidad and Tobago', 11, -61, 'TTD'),
	('tv', 'Tuvalu', -8, 178, 'AUD'),
	('tw', 'Taiwan', 23.3, 121, ''),
	('tz', 'Tanzania', -6, 35, 'TZS'),
	('ua', 'Ukraine', 49, 32, 'UAH'),
	('ug', 'Uganda', 1, 32, 'UGX'),
	('uk', 'United Kingdom', 54, -2, ''),
	('us', 'United States', 38, -97, 'USD'),
	('uy', 'Uruguay', -33, -56, 'UYU'),
	('uz', 'Uzbekistan', 41, 64, 'UZS'),
	('va', 'Vatican City State (Holy See)', 41.54, 12.27, 'EUR'),
	('vc', 'Saint Vincent and the Grenadines', 13.15, -61.12, 'XCD'),
	('ve', 'Venezuela', 8, -66, 'VES'),
	('vg', 'Virgin Islands (British)', 18.2, -64.5, 'USD'),
	('vi', 'Virgin Islands (U.S.)', 18.2, -64.5, 'USD'),
	('vn', 'Viet Nam', 16, 106, 'VND'),
	('vu', 'Vanuatu', -16, 167, 'VUV'),
	('wf', 'Wallis and Futuna Islands', -13.18, -176.12, 'XPF'),
	('ws', 'Samoa', -13.35, -172.2, 'WST'),
	('ye', 'Yemen', 15, 48, 'YER'),
	('yt', 'Mayotte', -12.5, 45.1, 'EUR'),
	('yu', 'Yugoslavia', 44, 21, ''),
	('za', 'South Africa', -29, 24, 'ZAR'),
	('zm', 'Zambia', -15, 30, 'ZMW'),
	('zw', 'Zimbabwe', -20, 30, 'ZWL');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.currencies
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `currency` varchar(4) NOT NULL DEFAULT '',
  `name` varchar(32) DEFAULT NULL,
  `symbol` char(4) NOT NULL,
  PRIMARY KEY (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.currencies: ~4 rows (approximately)
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
REPLACE INTO `currencies` (`currency`, `name`, `symbol`) VALUES
	('EUR', 'Euro', 'â‚¬'),
	('GBP', 'British Pound', 'Â£'),
	('TEU', 'Euro Token', 'tEUR'),
	('USD', 'Dolar', '$');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.currency_rate
DROP TABLE IF EXISTS `currency_rate`;
CREATE TABLE IF NOT EXISTS `currency_rate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `rate` decimal(30,8) NOT NULL,
  `type` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date_type_unique` (`date`,`type`),
  KEY `date_type` (`date`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.currency_rate: ~0 rows (approximately)
/*!40000 ALTER TABLE `currency_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_rate` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.currency_rate_latest
DROP TABLE IF EXISTS `currency_rate_latest`;
CREATE TABLE IF NOT EXISTS `currency_rate_latest` (
  `rate` decimal(30,8) NOT NULL,
  `type` varchar(6) NOT NULL,
  PRIMARY KEY (`type`) USING BTREE,
  UNIQUE KEY `type_unique` (`type`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.currency_rate_latest: ~0 rows (approximately)
/*!40000 ALTER TABLE `currency_rate_latest` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_rate_latest` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.data_3j
DROP TABLE IF EXISTS `data_3j`;
CREATE TABLE IF NOT EXISTS `data_3j` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `agentid` int(6) NOT NULL,
  `playerid` int(6) NOT NULL,
  `gameID` int(11) NOT NULL,
  `jackpotContribution` decimal(10,2) NOT NULL,
  `lastUpdatedDateTime` datetime NOT NULL,
  `machID` int(8) NOT NULL,
  `netWin` decimal(10,2) NOT NULL,
  `pID` int(8) NOT NULL,
  `sessionID` int(8) NOT NULL,
  `totalBets` decimal(10,2) NOT NULL,
  `totalGames` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `lastUpdatedDateTime` (`lastUpdatedDateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.data_3j: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_3j` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_3j` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.data_bg
DROP TABLE IF EXISTS `data_bg`;
CREATE TABLE IF NOT EXISTS `data_bg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `playerid` int(7) DEFAULT NULL,
  `agentid` int(7) DEFAULT NULL,
  `currency` char(9) DEFAULT NULL,
  `bet` decimal(12,2) DEFAULT NULL,
  `win` decimal(12,2) DEFAULT NULL,
  `rake` decimal(14,2) DEFAULT NULL,
  `tournament` decimal(12,2) DEFAULT NULL,
  `fin` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.data_bg: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_bg` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_bg` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.data_bl
DROP TABLE IF EXISTS `data_bl`;
CREATE TABLE IF NOT EXISTS `data_bl` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) DEFAULT NULL,
  `agentid` int(6) DEFAULT NULL,
  `game` varchar(192) DEFAULT NULL,
  `bet` decimal(12,2) DEFAULT NULL,
  `win` decimal(12,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.data_bl: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_bl` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_bl` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.data_cb
DROP TABLE IF EXISTS `data_cb`;
CREATE TABLE IF NOT EXISTS `data_cb` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `game` varchar(64) NOT NULL,
  `bet` decimal(10,2) DEFAULT NULL,
  `win` decimal(10,2) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.data_cb: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_cb` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_cb` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.data_cb_bck
DROP TABLE IF EXISTS `data_cb_bck`;
CREATE TABLE IF NOT EXISTS `data_cb_bck` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `game` varchar(64) NOT NULL,
  `bet` decimal(10,2) DEFAULT NULL,
  `win` decimal(10,2) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.data_cb_bck: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_cb_bck` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_cb_bck` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.data_cc
DROP TABLE IF EXISTS `data_cc`;
CREATE TABLE IF NOT EXISTS `data_cc` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `game` varchar(64) NOT NULL,
  `bet` decimal(10,2) DEFAULT NULL,
  `win` decimal(10,2) DEFAULT NULL,
  `rounds` int(4) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.data_cc: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_cc` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_cc` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.data_eg
DROP TABLE IF EXISTS `data_eg`;
CREATE TABLE IF NOT EXISTS `data_eg` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `coinIn` decimal(10,2) DEFAULT NULL,
  `coinOut` decimal(10,2) DEFAULT NULL,
  `profit` decimal(10,2) DEFAULT NULL,
  `gamesPlayed` int(4) NOT NULL,
  `sessionId` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.data_eg: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_eg` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_eg` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.data_ga_tokens
DROP TABLE IF EXISTS `data_ga_tokens`;
CREATE TABLE IF NOT EXISTS `data_ga_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `session_hash` varchar(100) NOT NULL,
  `date` varchar(20) NOT NULL,
  `game_id` varchar(50) NOT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.data_ga_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_ga_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_ga_tokens` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.data_gm
DROP TABLE IF EXISTS `data_gm`;
CREATE TABLE IF NOT EXISTS `data_gm` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `bet` decimal(10,2) DEFAULT NULL,
  `win` decimal(10,2) DEFAULT NULL,
  `rounds` int(4) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.data_gm: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_gm` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_gm` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.data_jackpots
DROP TABLE IF EXISTS `data_jackpots`;
CREATE TABLE IF NOT EXISTS `data_jackpots` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `system` char(2) NOT NULL,
  `agentid` int(6) NOT NULL,
  `playerid` int(7) NOT NULL,
  `bet` decimal(10,2) NOT NULL,
  `jackpot` decimal(10,2) NOT NULL,
  `date` datetime NOT NULL,
  `game` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.data_jackpots: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_jackpots` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_jackpots` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.data_mg
DROP TABLE IF EXISTS `data_mg`;
CREATE TABLE IF NOT EXISTS `data_mg` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `agentid` int(6) NOT NULL,
  `playerid` int(6) NOT NULL,
  `date` date NOT NULL,
  `index` int(5) NOT NULL DEFAULT '0',
  `betAmount` decimal(10,2) NOT NULL,
  `pID` int(8) NOT NULL,
  `payoutAmount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.data_mg: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_mg` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_mg` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.data_po
DROP TABLE IF EXISTS `data_po`;
CREATE TABLE IF NOT EXISTS `data_po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `playerid` int(7) unsigned NOT NULL,
  `agentid` int(7) unsigned NOT NULL,
  `currency` char(3) NOT NULL,
  `bet` decimal(10,2) DEFAULT NULL,
  `win` decimal(10,2) DEFAULT NULL,
  `rake` decimal(10,2) DEFAULT NULL,
  `tournament` decimal(10,2) DEFAULT NULL,
  `fin` decimal(10,2) DEFAULT NULL,
  `net` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.data_po: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_po` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_po` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.data_tw
DROP TABLE IF EXISTS `data_tw`;
CREATE TABLE IF NOT EXISTS `data_tw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `playerid` int(7) unsigned NOT NULL,
  `agentid` int(7) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payout` decimal(10,2) NOT NULL DEFAULT '0.00',
  `dataid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.data_tw: ~0 rows (approximately)
/*!40000 ALTER TABLE `data_tw` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_tw` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.email_templates
DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `language` text CHARACTER SET utf8 NOT NULL,
  `title` text CHARACTER SET utf8,
  `text` text CHARACTER SET utf8,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.email_templates: ~0 rows (approximately)
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.email_templates_string
DROP TABLE IF EXISTS `email_templates_string`;
CREATE TABLE IF NOT EXISTS `email_templates_string` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `language` text CHARACTER SET utf8 NOT NULL,
  `title` text CHARACTER SET utf8,
  `text` text CHARACTER SET utf8,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;

-- Dumping data for table isoftbetgamehub_codeception.email_templates_string: ~0 rows (approximately)
/*!40000 ALTER TABLE `email_templates_string` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates_string` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.fraud_system
DROP TABLE IF EXISTS `fraud_system`;
CREATE TABLE IF NOT EXISTS `fraud_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) NOT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `system` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `score` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created` datetime NOT NULL,
  `additional` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.fraud_system: ~0 rows (approximately)
/*!40000 ALTER TABLE `fraud_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `fraud_system` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.games
DROP TABLE IF EXISTS `games`;
CREATE TABLE IF NOT EXISTS `games` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `parent` int(6) NOT NULL DEFAULT '0',
  `system` char(2) NOT NULL,
  `title` varchar(64) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `gameid` varchar(64) NOT NULL,
  `gamename` varchar(64) NOT NULL,
  `game_extra` varchar(60) DEFAULT NULL,
  `gametype` varchar(32) NOT NULL,
  `laifacai` varchar(32) NOT NULL,
  `options` text NOT NULL,
  `details` text NOT NULL,
  `contentid` int(11) NOT NULL,
  `plays` int(8) NOT NULL,
  `errors` int(8) NOT NULL,
  `wagering` float DEFAULT NULL,
  `rtp` float DEFAULT NULL,
  `position` int(5) NOT NULL,
  `hide` tinyint(1) DEFAULT NULL,
  `new` tinyint(4) NOT NULL DEFAULT '0',
  `ext` varchar(3) NOT NULL,
  `version` varchar(10) NOT NULL,
  `category` varchar(20) DEFAULT NULL,
  `frb_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `licence` varchar(50) DEFAULT NULL,
  `jackpot` tinyint(1) NOT NULL DEFAULT '0',
  `report` varchar(4) DEFAULT '',
  `skinid` varchar(128) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `system` (`system`),
  KEY `gametype` (`gametype`),
  KEY `laifacai` (`laifacai`),
  KEY `gameid` (`gameid`),
  KEY `gamename` (`gamename`),
  KEY `report` (`report`),
  KEY `jackpot` (`jackpot`),
  KEY `frb_enabled` (`frb_enabled`),
  KEY `category` (`category`),
  KEY `new` (`new`),
  KEY `hide` (`hide`),
  KEY `position` (`position`),
  KEY `title` (`title`),
  KEY `name` (`name`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB AUTO_INCREMENT=914430 DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.games: ~23 rows (approximately)
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
REPLACE INTO `games` (`id`, `parent`, `system`, `title`, `name`, `description`, `gameid`, `gamename`, `game_extra`, `gametype`, `laifacai`, `options`, `details`, `contentid`, `plays`, `errors`, `wagering`, `rtp`, `position`, `hide`, `new`, `ext`, `version`, `category`, `frb_enabled`, `licence`, `jackpot`, `report`, `skinid`) VALUES
	(6147, 0, 'fg', 'fg-lucky-spin-euro-roulette', 'Lucky Spin Euro Roulette', '', 'luckyspineuroroulette', '50224', '', 'Table Games', 'table-games', '_fugaso', '{"text_en":"The roulette wheel contains 37 numbered ball pockets, alternatively coloured red and black and a green 0. You win if your bet covers the number on which the roulette ball stops."}', 0, 21230, 0, 1, 97.3, 40, 0, 0, 'png', '&v=2', 'fugaso', 0, 'CUR', 0, 'fg', '50224'),
	(6151, 0, 'fg', 'fg-brave-mongoose', 'Brave Mongoose', '', 'bravemongoose', '50225', '', 'Video Slots', 'video-slots', '_fugaso', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"no"}', 0, 9143, 0, 1, 96, 50, 0, 0, 'png', '&v=2', 'fugaso', 0, 'CUR', 0, 'fg', '50225'),
	(8961, 0, 'wz', 'wz-lost-treasure', 'Lost Treasure', '', '305', 'Lost Treasure', '', 'Video slots', 'video-slots', '_wazdan', '{"lines":"[20]","reels":"5","freespins":"15/15/15"}', 0, 1901, 0, NULL, 96, 50, 0, 0, 'png', 'v=2', 'Wazdan', 1, '', 0, 'wz', '5691'),
	(11523, 0, 'xg', 'xg-sherlocks-casebook', 'Sherlock\'s Casebook', '', '8014', '50698', '', 'Video Slot', 'video-slots', '_1x2_gaming', '{"reels":"5","freespins":"no","bonusgame":"no"}', 0, 2690, 0, 0, 96, 30, 0, 0, 'png', '', '1x2 Gaming', 0, '', 0, 'xg', '50698'),
	(12573, 1233, 'ez', 'ez-blackjack-gold-5', 'Blackjack Gold 5', '', '1', '50128', '', 'slots', 'live-casino-table', '_ezugi', '{}', 0, 948, 0, 0, 0, 0, 0, 0, 'png', 'html5', 'ezugi', 0, '', 0, 'ez', '50128'),
	(13313, 0, 'gb', 'gb-colossal-fruit-smash', 'Colossal Fruit Smash', '', '5d0f7c061e4f270019b5751e', 'Colossal Fruit Smash', '', 'Video Slot', 'video-slots', '_booming_games', '{"lines":"20","reels":"5","freespins":"no","bonusgame":"no"}', 0, 3537, 0, 0, 95.5, 30, 0, 0, 'png', '', 'Booming Games', 0, '', 0, 'gb', '11159'),
	(15131, 0, 'gs', 'gs-norns-fate', 'Norns Fate', '', '225', 'Norns Fate', '', 'Video Slot', 'video-slots', '_gameart', '{"lines":"30","reels":"5","freespins":"yes","bonusgame":"no"}', 0, 33638, 0, 0, 96, 10, 1, 0, 'png', '', 'gameart', 1, '', 0, 'gs', '11876'),
	(15619, 0, 'p0', 'p0-great-rhino', 'Great Rhino', '', '1521189220', '50891', '', 'Video Slots', 'video-slots', '_pragmatic_play', '{"lines":"20"}', 0, 162776, 0, 0, 0, 20, 0, 0, 'png', '', 'Pragmatic Play', 1, '', 1, 'p0', '50891'),
	(19717, 0, 'xg', 'xg-theseus-rises', 'Theseus Rises', '', '8032', '50714', '', 'Video Slots', 'video-slots', '_1x2_gaming', '{}', 0, 658, 0, 0, 0, 31, 0, 0, 'png', '', '1X2 Gaming', 0, '', 0, 'xg', '50714'),
	(22089, 1233, 'ez', 'ez-lucky-7', 'Lucky 7', '', '228001', '50144', '', 'slots', 'live-casino-table', '_ezugi', '{}', 0, 290, 0, 0, 0, 40, 0, 1, 'png', 'html5', 'ezugi', 0, '', 0, 'ez', '50144'),
	(24671, 0, 'fz', 'fz-golden-crown', 'Golden Crown', '', 'GoldenCrown', '16704', '', 'Video Slots', 'video-slots', '_fazi', '{"lines":"10","reels":"5"}', 0, 3963, 0, 0, 95.96, 30, 0, 0, 'png', '', 'Fazi', 0, '', 0, 'fz', '16704'),
	(25087, 0, 'ka', 'ka-speakeasy-boost', 'Speakeasy Boost', '', 'speakeasyboost', '50527', '', 'Video Slots', 'video-slots', '_kalamba', '{"lines":"243","reels":"3"}', 0, 839, 0, 0, 96.5, 30, 0, 0, 'png', '', 'Kalamba', 0, '', 0, 'ka', '50527'),
	(26483, 0, 'bn', 'bn-sun-of-egypt', 'Sun of Egypt', '', 'sun_of_egypt', 'sun_of_egypt', '', 'Video Slots', 'video-slots', '_booongo', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 4, 0, NULL, 95.3, 50, 0, 0, 'png', '', 'Booongo', 1, '', 0, 'bn', '11459'),
	(26883, 0, 'rk', 'rk-million-7', 'Million 7', '', 'reevo-millionsevens', '', '', 'Video Slot', 'video-slots', '_redrake', '{}', 0, 0, 0, NULL, 0, 50, 0, 0, 'png', '', 'RedRake', 1, '', 0, 'rk', '10648'),
	(27249, 0, 'is', 'is-mystic-ming-zhi', 'Mystic Ming Zhi', '', 'pulse_mysticmingzhi', '906004', '', 'Video slots', 'video-slots', '_iSoftBet', '{"lines":"[40]"}', 0, 2, 0, 0, 96, 50, 0, 0, 'png', 'v=2', 'isoftbet', 1, '', 0, 'is', '906004'),
	(909295, 0, 'gv', 'gv-500k-heist', '500K HEIST', '', '500K_HEIST', '500K_HEIST', '', 'Video Slots', 'video-slots', '_gamevy', '{"lines":"3","reels":"5","freespins":"yes","bonusgame":"no"}', 0, 20, 0, 0, 95.05, 50, 0, 0, 'png', '', 'Gamevy', 1, '', 0, 'gv', '16953'),
	(909309, 0, 'lu', 'lu-piggy-ironside', 'Piggy Ironside â€” Muspelheim\'s Treasure', '', '147', '147', '', 'Video Slots', 'video-slots', '_reevo', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 124, 0, 0, 95.69, 0, 0, 1, 'png', '', 'Reevo', 1, '', 0, 'lu', '17603'),
	(909317, 0, 'gv', 'gv-blackjack', ' Blackjack', '', 'BLACKJACK', 'BLACKJACK', '', 'Video Slots', 'video-slots', '_gamevy', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 18, 0, 0, 95.69, 0, 0, 1, 'png', '', 'Gamevy', 0, '', 0, 'gv', '5401'),
	(910369, 0, 'rl', 'rl-sugar-fruit-frenzy', 'Sugar Fruit Frenzy', '{"text_en":""}', '3', '50215', '', 'Video Slots', 'video-slots', '_reevo', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 147, 0, 0, 95.69, 0, 0, 1, 'png', '', 'Reevo', 1, '', 0, 'rl', '50218'),
	(910607, 0, 'bn', 'bn-happy-fish', 'Happy Fish', '', 'happy_fish', 'happy_fish', '', 'Video Slots', 'video-slots', '_booongo', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 0, 0, 0, 95.69, 0, 0, 1, 'png', '', 'Booongo', 0, '', 0, 'bn', '50497'),
	(910835, 0, 'dr', 'dr-i-scream', 'I Scream', '', '1041', 'I Scream', '', 'Slots', 'slots', '_dragon_gaming', '{"lines":"6","reels":"6"}', 0, 0, 0, NULL, 95.54, 50, 0, 0, 'png', '', 'Dragon Gaming', 0, '', 0, 'dr', '51757'),
	(911401, 0, 'ak', 'ak-king-octopus', 'King Octopus', '{"text_en":""}', 'KingOctopus', 'KingOctopus', '', 'Video Slots', 'video-slots', '_Ka_Gaming', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 0, 0, 0, 95.69, 0, 0, 1, 'png', '', 'KA Gaming', 0, '', 0, 'ak', '51380'),
    (4353, 0, 'er', 'er-gladiators', 'Gladiators', '{"text_en":"Gladiators, Endorphina\\u2019s 5-reel, 3-row, 21-line video slot game, is based on the historical character of Gladiator, a professional fighter in the Ancient Rome. Only that this game features fish gladiators, which are as brave as the real ones and definitely worth your admiration and acclaim. Get ready to participate in Gladiators\\u2019 tournaments while playing Free Games.","text_type_en":""}', 'endorphina_Gladiators@ENDORPHINA', 'Gladiators', '', 'Video Slots', 'video-slots', '_Endorphina', '{"lines":"21","reels":"5","freespins":"yes","bonusgame":"no"}', 0, 11124, 0, 0, 96, 153, 0, 0, 'png', '&v=2', 'Endorphina', 0, '', 0, 'er', '51086'),
    (6713, 0, 'th', 'th-wild-weather', 'Wild Weather', '{"text_en":""}', '10164', 'Wild Weather', '', 'Video Slots', 'video-slots', '_Tom_Horn', '{"reels":"0","lines":"0","freespins":"no","bonusgame":"no"}', 0, 5560, 0, 1, 96, 50, 0, 0, 'png', '&v=2', 'Tom Horn', 0, 'CUR', 0, 'th', '8899'),
    (911351, 0, 'sr', 'sr-aviator', 'Aviator', '{"text_en":""}', 'aviator', 'aviator', '', 'Video Slots', 'video-slots', '_Spribe', '{"lines":"6","reels":"6"}', 0, 291, 0, 0, 95.54, 50, 0, 0, 'png', '', 'Spribe', 0, '', 0, 'sr', '51935'),
	(914429, 0, 'rg', 'rg-rome-caesars-glory', 'Rome Caesars Glory', '{"text_en":""}', 'pls_rome_caesars_glory', 'pls_rome_caesars_glory', '', 'slots', 'slots', '_redgenn', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 0, 0, 0, 95.69, 0, 0, 1, 'png', '', 'Redgenn', 1, '', 0, 'rg', '52734'),
    (914430, 0, 'ep', 'ep-egypt-gods', 'Egypt Gods', '', '556', 'Egypt Gods', '', 'Video slots', 'video-slots', '_evoplay', '', 0, 2, 0, 0, 96, 50, 0, 0, 'png', 'v=2', 'Evoplay', 1, '', 0, 'ep', '914556'),
    (917971, 0, 'es', 'es-american-roulette', 'American Roulette', '{"text_en":""}', 'AmericanTable001', 'AmericanTable001', '', 'Virtual Games', 'virtual-games', '_Evolution', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 69, 0, 0, 95.69, 0, 0, 1, 'png', '', 'Evolution', 1, '', 0, 'es', '54175'),
    (914791, 0, 'bf', 'bf-buffalo-trail-lite', 'Buffalo Trail Lite', '{"text_en":""}', 'BFGbuffalo-trail-lite', 'BFGbuffalo-trail-lite', '', 'slots', 'slots', '_BF_Games', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 0, 0, 0, 95.69, 0, 0, 1, 'png', '', 'BF Games', 1, '', 0, 'bf', '52914'),
    (15407, 0, 'p0', 'p0-3-kingdoms-battle-of-red-cliffs', '3 Kingdoms - Battle of Red Cliffs', '{"text_en":""}', '1489503590', 'vs25kingdoms', '', 'Video Slots', 'video-slots', '_Pragmatic_Play', '{"lines":"25"}', 0, 54262, 0, 0, 0, 10, 0, 0, 'png', '', 'Pragmatic Play', 1, '', 0, 'p0', '50922'),
	(1521, 0,'pa','pa-fire-vs-ice','Fire Vs Ice','{"text_en":"","text_type_en":""}','PP_HTML5_FireVsIce_Desktop','Fire Vs Ice','','Video Slots','video-slots','_Pariplay','{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}',0,8334,0,1.0,94.0,80,0,0,'png','&v=2','Pariplay',1,'',0,'pa','4543'),
	(15101, 0, 'lk', 'lk-blackjack-2', 'Blackjack 2', '{"text_en":""}', '4', '4', '', 'table-games', 'table-games', '_Lucky_Streak', '{"lines":"6","reels":"6"}', 0, 1605, 0, 0.0, 95.54, 50, 0, 0, 'png', '', 'Lucky Streak', 0, '', 0, 'lk', '51148'),
	(15102, 0, 'xg', 'xg-sic-bo-888', 'Sic Bo 888', '{"text_en":""}', '4', '4', '', 'table-games', 'table-games', '_1x2_Gaming', '{"lines":"6","reels":"6"}', 0, 1605, 0, 0.0, 95.54, 50, 0, 0, 'png', '', '1x2 Gaming', 0, '', 0, 'xg', '51149'),
	(917815, 0, 'bs', 'bs-trinity-reels', 'Trinity Reels', '{"text_en":""}', '876', '876', '', 'Slots', 'slots', '_Betsoft', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 0, 0, 0.0, 95.69, 0, 0, 1, 'png', '', 'Betsoft', 1, '', 0, 'bs', '54107'),
    (17738, 0, 'or', 'or-fruit-twist', 'Fruit Twist', '{"text_en":""}', 'ORYX_HTML5_FT', 'ORYX_HTML5_FT', '', 'Video Slots', 'video-slots', '_Oryx', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 0, 0, 0.0, 95.69, 0, 0, 1, 'png', '', 'Oryx', 0, '', 0, 'or', '53938'),
    (914327, 0, 'be', 'be-classic-wheel', 'Classic Wheel', '{"text_en":""}', 16, 16, '', 'slots', 'slots', '_Betgames', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 30, 0, 1, 97.3, 40, 0, 0, 'png', '', 'Betgames', 0, '', 0, 'be', '52643'),
    /* TODO: fake Evolution brands game data -> accommodate Evolution system */
    (111111, 0, 'ne', 'ne-american-roulette', 'American Roulette', '{"text_en":""}', 'AmericanTable001ne', 'AmericanTable001ne', '', 'Virtual Games', 'virtual-games', '_Netent', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 69, 0, 0, 95.69, 0, 0, 1, 'png', '', 'Netent', 1, '', 0, 'ne', '111111'),
    (111222, 0, 're', 're-american-roulette', 'American Roulette', '{"text_en":""}', 'AmericanTable001re', 'AmericanTable001re', '', 'Virtual Games', 'virtual-games', '_RedTiger', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 69, 0, 0, 95.69, 0, 0, 1, 'png', '', 'RedTiger', 1, '', 0, 're', '111222'),
    (111333, 0, 'mn', 'mn-american-roulette', 'American Roulette', '{"text_en":""}', 'AmericanTable001mn', 'AmericanTable001mn', '', 'Virtual Games', 'virtual-games', '_BitTimeGaming', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 69, 0, 0, 95.69, 0, 0, 1, 'png', '', 'BitTimeGaming', 1, '', 0, 'mn', '111333'),
	(910529, 0,'sp','sp-1-reel-egypt','1 Reel Egypt','{"text_en":""}','Tower_1ReelEgypt','50439','','Video Slots','video-slots','_Spinomenal','{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}',0,11,0,0.0,95.69,0,0,1,'png','','Spinomenal',0,'',0,'sp','50439'),
    (910233, 0, 'mt', 'mt-hothoney-22', 'HotHoney 22', '{"text_en":""}', 'hothoney22', '50094', '', 'Video Slots', 'video-slots', '_MrSlotty', '{"lines":"25","reels":"5","freespins":"yes","bonusgame":"yes"}', 0, 9, 0, 0, 95.69, 0, 0, 1, 'png', '', 'MrSlotty', 1, '', 0, 'mt', '50094');


/*!40000 ALTER TABLE `games` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.games_additional
DROP TABLE IF EXISTS `games_additional`;
CREATE TABLE IF NOT EXISTS `games_additional` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `games_id` int(6) NOT NULL DEFAULT '0',
  `system` char(2) NOT NULL,
  `title` varchar(64) NOT NULL,
  `width` int(20) NOT NULL DEFAULT '0',
  `height` int(20) NOT NULL DEFAULT '0',
  `aspect_ratio` varchar(255) DEFAULT NULL,
  `scale_up` tinyint(4) DEFAULT '0',
  `scale_down` tinyint(4) DEFAULT '0',
  `stretching` tinyint(4) DEFAULT '0',
  `jackpot` tinyint(1) NOT NULL DEFAULT '0',
  `html5` tinyint(1) NOT NULL DEFAULT '0',
  `frb_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `rtp` float DEFAULT NULL,
  `volatility` enum('low','medium','high') DEFAULT 'low',
  `max_exposure` varchar(255) DEFAULT NULL,
  `mobile` tinyint(1) NOT NULL DEFAULT '0',
  `wagering` float DEFAULT NULL,
  `description` text,
  `lines` int(20) DEFAULT NULL,
  `reels` int(20) DEFAULT NULL,
  `freespins` tinyint(1) NOT NULL DEFAULT '0',
  `bonusgame` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `system` (`system`),
  KEY `games_id` (`games_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.games_additional: ~0 rows (approximately)
/*!40000 ALTER TABLE `games_additional` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_additional` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.games_most_played
DROP TABLE IF EXISTS `games_most_played`;
CREATE TABLE IF NOT EXISTS `games_most_played` (
  `game_id` int(10) NOT NULL COMMENT 'internal gameid',
  `game_id_hash` varchar(128) DEFAULT NULL,
  `amount_bet` bigint(20) DEFAULT NULL,
  `amount_spins` bigint(20) DEFAULT NULL,
  `platformid` bigint(20) NOT NULL,
  PRIMARY KEY (`game_id`,`platformid`),
  KEY `gameidIdx` (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.games_most_played: ~0 rows (approximately)
/*!40000 ALTER TABLE `games_most_played` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_most_played` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.game_details
DROP TABLE IF EXISTS `game_details`;
CREATE TABLE IF NOT EXISTS `game_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `reels` int(11) NOT NULL DEFAULT '0',
  `lines` int(11) NOT NULL DEFAULT '0',
  `freespins` tinyint(1) NOT NULL DEFAULT '0',
  `bonus_game` tinyint(1) NOT NULL DEFAULT '0',
  `stretching` tinyint(1) NOT NULL DEFAULT '0',
  `scale_up` tinyint(1) NOT NULL DEFAULT '0',
  `scale_down` tinyint(1) NOT NULL DEFAULT '0',
  `html5` tinyint(1) NOT NULL DEFAULT '0',
  `volatility` enum('low','medium','medium-high','high') NOT NULL DEFAULT 'low',
  `mobile` tinyint(1) NOT NULL DEFAULT '0',
  `max_exposure` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.game_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `game_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_details` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.gaminator_log_all
DROP TABLE IF EXISTS `gaminator_log_all`;
CREATE TABLE IF NOT EXISTS `gaminator_log_all` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `url` varchar(1000) NOT NULL,
  `params` varchar(10000) NOT NULL,
  `response_code` varchar(10) NOT NULL,
  `response_header` varchar(10000) NOT NULL,
  `response_content` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.gaminator_log_all: ~0 rows (approximately)
/*!40000 ALTER TABLE `gaminator_log_all` DISABLE KEYS */;
/*!40000 ALTER TABLE `gaminator_log_all` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.ga_session_tokens
DROP TABLE IF EXISTS `ga_session_tokens`;
CREATE TABLE IF NOT EXISTS `ga_session_tokens` (
  `playerid` int(11) NOT NULL,
  `agentid` int(11) NOT NULL,
  `token` varchar(46) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.ga_session_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `ga_session_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `ga_session_tokens` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.hand_history_la
DROP TABLE IF EXISTS `hand_history_la`;
CREATE TABLE IF NOT EXISTS `hand_history_la` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `wagered` decimal(15,2) NOT NULL,
  `win_loss` decimal(15,2) NOT NULL,
  `game` varchar(3000) NOT NULL,
  `system` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.hand_history_la: ~0 rows (approximately)
/*!40000 ALTER TABLE `hand_history_la` DISABLE KEYS */;
/*!40000 ALTER TABLE `hand_history_la` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.helpcategory
DROP TABLE IF EXISTS `helpcategory`;
CREATE TABLE IF NOT EXISTS `helpcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `language` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.helpcategory: ~0 rows (approximately)
/*!40000 ALTER TABLE `helpcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpcategory` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.helpcontent
DROP TABLE IF EXISTS `helpcontent`;
CREATE TABLE IF NOT EXISTS `helpcontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `content` text,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.helpcontent: ~0 rows (approximately)
/*!40000 ALTER TABLE `helpcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpcontent` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.ip2nation
DROP TABLE IF EXISTS `ip2nation`;
CREATE TABLE IF NOT EXISTS `ip2nation` (
  `ip` int(11) unsigned NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL DEFAULT '',
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.ip2nation: ~0 rows (approximately)
/*!40000 ALTER TABLE `ip2nation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip2nation` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.ip2nationCountries
DROP TABLE IF EXISTS `ip2nationCountries`;
CREATE TABLE IF NOT EXISTS `ip2nationCountries` (
  `code` varchar(4) NOT NULL DEFAULT '',
  `iso_code_2` varchar(2) NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) DEFAULT '',
  `iso_country` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.ip2nationCountries: ~0 rows (approximately)
/*!40000 ALTER TABLE `ip2nationCountries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip2nationCountries` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.languages
DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `code` char(3) NOT NULL,
  `language` varchar(63) NOT NULL,
  `default_country` char(2) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.languages: ~0 rows (approximately)
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.logs
DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `type` tinytext NOT NULL,
  `message` text NOT NULL,
  `details` text NOT NULL,
  `sessionid` varchar(32) NOT NULL,
  `platformid` int(2) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.log_audit
DROP TABLE IF EXISTS `log_audit`;
CREATE TABLE IF NOT EXISTS `log_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NULL DEFAULT NULL,
  `tbl_name` varchar(30) DEFAULT NULL,
  `table_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `old_data` text,
  `new_data` text,
  `is_bo` int(1) DEFAULT NULL,
  `agent_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.log_audit: ~0 rows (approximately)
/*!40000 ALTER TABLE `log_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_audit` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.money_transactions
DROP TABLE IF EXISTS `money_transactions`;
CREATE TABLE IF NOT EXISTS `money_transactions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `agent` varchar(20) NOT NULL,
  `skin` varchar(20) NOT NULL,
  `player_id` int(10) NOT NULL,
  `agent_id` int(10) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `start_balance` decimal(15,2) NOT NULL,
  `end_balance` decimal(15,2) NOT NULL,
  `email` varchar(64) NOT NULL COMMENT 'email used for the transaction',
  `date_request` datetime NOT NULL,
  `date_processed` datetime NOT NULL,
  `status` enum('PENDING','PROCESSED','FAILED','CANCELLED','ERROR','DENIED','IN PROGRESS') NOT NULL DEFAULT 'PENDING',
  `withdrawals_limit_exceeded` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('deposit','withdraw') NOT NULL,
  `instrument` varchar(30) NOT NULL,
  `instrument_type` varchar(30) DEFAULT NULL,
  `instrument_transid` varchar(255) NOT NULL,
  `message` varchar(255) CHARACTER SET utf8 NOT NULL,
  `deny_type` text,
  `error_message` text CHARACTER SET utf8 NOT NULL COMMENT 'message visible only to support',
  `postback` text CHARACTER SET utf8 NOT NULL COMMENT 'signed with keyword, can not be modified!',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_instrumentTransid` (`instrument_transid`),
  KEY `player_id` (`player_id`),
  KEY `agent_id` (`agent_id`),
  KEY `instrument` (`instrument`),
  KEY `instrument_type` (`instrument_type`),
  KEY `skin` (`skin`),
  KEY `date_processed` (`date_processed`),
  KEY `status` (`status`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.money_transactions: ~0 rows (approximately)
/*!40000 ALTER TABLE `money_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `money_transactions` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.perm
DROP TABLE IF EXISTS `perm`;
CREATE TABLE IF NOT EXISTS `perm` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `aid` int(6) NOT NULL,
  `perm` varchar(64) NOT NULL,
  `val` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.perm: ~0 rows (approximately)
/*!40000 ALTER TABLE `perm` DISABLE KEYS */;
/*!40000 ALTER TABLE `perm` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.phinxlog
DROP TABLE IF EXISTS `phinxlog`;
CREATE TABLE IF NOT EXISTS `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.phinxlog: ~0 rows (approximately)
/*!40000 ALTER TABLE `phinxlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `phinxlog` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.platform
DROP TABLE IF EXISTS `platform`;
CREATE TABLE IF NOT EXISTS `platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platform` varchar(255) NOT NULL,
  `skin` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `platformid` int(10) NOT NULL,
  `root_agent` int(20) NOT NULL,
  `countries` varchar(255) NOT NULL,
  `default_lang` varchar(10) NOT NULL DEFAULT 'en_GB',
  `http_host` varchar(2048) NOT NULL,
  `active` int(1) NOT NULL,
  `main` tinyint(1) NOT NULL DEFAULT '0',
  `concession` varchar(255) DEFAULT NULL,
  `menu` varchar(255) NOT NULL,
  `skin_folder` varchar(50) DEFAULT NULL,
  `tz` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `http_host` (`http_host`(255)),
  KEY `platformid` (`platformid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.platform: ~3 rows (approximately)
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
REPLACE INTO `platform` (`id`, `platform`, `skin`, `title`, `info`, `platformid`, `root_agent`, `countries`, `default_lang`, `http_host`, `active`, `main`, `concession`, `menu`, `skin_folder`, `tz`) VALUES
	(1, 'pantaloo', 'touchvegas', 'Reevo', '{"simpleRegistration":{"backoffice":"1","registration_custom_url":"","page":0},"paymentInstruments":"1","gameSectionIntroPage":"custom1","metaKeywords":["Vegas"," casino"," poker"," slots"," promotion "," bonueses"," affiliate programe"," megavipclub"," online poker Texas Holdem"," Omaha"," tournaments"," gdt tournaments"," MTT"," Heads up HU"," Free roll"," free spins "," playtech"," novomatic"," artistocrat"," IGT"," netent"," Microgaming"," RTG"," Realtimegaming"," live casino"," vivo"," ezugi"," GGL"," GD live casino"," EZ live casino"," Rulete live"," Blackjack live"," Baccarat"," puntobanco live"],"metaDescription":"Feel the real touch of Vegas and join the best on line casino! The most exclusive gaming experience, only for vip players.","googleAnalytics":"UA-26225878-17","contactUsWorkingHours":{"dayFrom":"Mon","dayTo":"Sat","hourFrom":"9am","hourTo":"8pm CET"},"emailSupport":"support@gammixcasino.com","dailyDepositLimit":"10000","bonuses":"1","email_system":"1","headerSocial":{"facebook":"","like":"","google_plus":"","twitter":"","youtube":"","instagram":"","instagram_access_token":""},"malta":{"kyc_withdraw_limit":"","excluded_countries":"","extra_age_check":""},"footerSocial":{"enabled":"1","facebook":"https://www.facebook.com/","google_plus":"https://plus.google.com/","twitter":"https://twitter.com","youtube":"","instagram":"","foursquare":"","vine":"","tumblr":"","skype":"","pinterest":"","digg":"","blogger":""},"playerRegFields":{"fname":{"type":{"order":""}},"lname":{"type":{"order":""}},"nickname":{"type":{"order":""}},"username":{"type":{"order":""}},"password":{"type":{"order":""}},"email":{"type":{"order":""}},"countrycode":{"type":{"order":""}},"languagecode":{"type":{"order":""}},"additional":{"type":{"order":""},"optional":{"order":""}},"properties":{"document_id":{"order":""},"ref_code":{"order":""},"gender":{"order":""},"language":{"order":""},"address":{"order":""},"zip":{"order":""},"city":{"order":""},"secquestion":{"order":""},"secanswer":{"order":""},"birthcity":{"order":""},"birthregion":{"order":""},"marketing":{"order":""}}},"promotionsSettings":{"num_promotions":""},"slotsImagesType":{"type":"jpg"},"footerRightsYear":"2020","showBestPlayers":"1","css_less":"1","slotsIntroPage":"1","subTemplate":"1","footer_navigation":"1","promotions_on_homepage":"1","news_on_homepage":"1","news_scroller_on_homepage":"1","bonuses_list_new_view":"1","registration_popup_redirect":"1","games_in_popup":"1","slotsIntroPageCustomContent":"1","is_mobile_skin":"1","skin_folder_mobile":"touchvegasmobile;skins/pantaloonewmobile","show_all_games_on_homepage":"1","cashier_profile_responsive_menu":"1","cashier_profile_icons":"1","fancy_inputs":"1","bonuses_consume_balance_first":"1","livecasinoSkinImages":"default","multicurrency":"1","cxm":{"apikey":"","endpoint":""},"languages":"en,de,es,cn","enable_player_qr_code":"1","loginRedirects":{"first_login_redirect_url":"","no_deposit_redirect_url":"","zero_balance_redirect_url":"","low_balance_redirect_url":""},"oneSignalSettings":{"appIdOneSignal":""},"casino_games_limit_to_show":"50","bonuses_check_open_bets_in_casino":"1","play_for_fun":"1","show_bonuses_in_player_profile":"1","bog":{"domain":"","password_reset_url_path":"","register_form_url_path":"","after_register_token_url_path":"","cdn":""},"casino_countries_blacklist":"hu","alway_show_withdrawal_methods":"1","has_rebate_bonus":"1","bo_2nd_username":"admin.dani","multiple_sportsbook":"1","payments":{"prepaidcard":{"EUR":{"enabled":"1"},"ZAR":{"enabled":"1"}}}}', 3, 2, '', 'en_GB', 'aggr.reeltech.co;isoftbet.platform', 1, 0, NULL, 'casinolive,casino,sectionVirtualSports,sportsbook-tb,sportsbook-tbl,sportsbook-di,sportsbook-ds,sportsbook-die,sportsbook-dse,promotions_bamako', 'skins/touchvegas', 0),
	(3, 'pantaloo', 'thegameprovider', 'TheGameProvider Admin', '{"simpleRegistration":{"page":{"show":"1"},"backoffice":"1","registration_custom_url":""},"showCookiesNotification":"1","paymentInstruments":"1","metaKeywords":["casino"," poker"," slots"," promotion "," bonueses"," affiliate programe"," megavipclub"," online poker Texas Holdem"," Omaha"," tournaments"," gdt tournaments"," MTT"," Heads up HU"," Free roll"," free spins"," playtech"," novomatic"," artistocrat"," IGT"," netent"," Microgaming"," RTG"," Realtimegaming"," live casino"," vivo"," ezugi"," GGL"," GD live casino"," EZ live casino"," Rulete live"," Blackjack live"," Baccarat"," puntobanco live"],"metaDescription":"The casino platform ready for online and landbased operations!","contactUsWorkingHours":{"dayFrom":"Mon","dayTo":"Sat","hourFrom":"9am","hourTo":"8pm CET"},"emailSupport":"support@pantaloo.com","dailyDepositLimit":"10000","bonuses":"1","promotionsSettings":{"num_promotions":""},"headerSocial":{"facebook":"","like":"","google_plus":"","twitter":"","youtube":"","instagram":"","instagram_access_token":""},"footerSocial":{"facebook":"","google_plus":"","twitter":"","youtube":"","instagram":"","foursquare":"","vine":"","tumblr":"","skype":"","pinterest":"","digg":"","blogger":""},"playerRegFields":{"fname":{"type":{"order":""}},"lname":{"type":{"order":""}},"nickname":{"type":{"order":""}},"username":{"type":{"order":""}},"password":{"type":{"order":""}},"email":{"type":{"order":""}},"countrycode":{"type":{"order":""}},"languagecode":{"type":{"order":""}},"additional":{"type":{"order":""},"optional":{"order":""}},"properties":{"birthdate":{"order":""},"city":{"order":""},"adress":{"order":""},"mobile":{"order":""},"gender":{"order":""}}},"malta":{"kyc_withdraw_limit":"","excluded_countries":"","extra_age_check":""},"multicurrency":"1","loginRedirects":{"first_login_redirect_url":"","no_deposit_redirect_url":"","zero_balance_redirect_url":"","low_balance_redirect_url":""},"oneSignalSettings":{"appIdOneSignal":""},"cxm":{"apikey":"","endpoint":""},"bog":{"domain":"","password_reset_url_path":"","register_form_url_path":"","after_register_token_url_path":"","cdn":""},"big_win_bet_factor":"8","2step_auth_bo":"1","payments":[]}', 0, 1, '', 'en_GB', 'aggr.reeltech.co;backoffice.reeltech.co;isoftbet.platform', 1, 0, NULL, '', 'skins/noskin', 0),
	(6, 'pantaloo', 'touchvegas', 'Reevo', '{"simpleRegistration":{"backoffice":"1","registration_custom_url":"","page":0},"paymentInstruments":"1","gameSectionIntroPage":"custom1","metaKeywords":["Vegas"," casino"," poker"," slots"," promotion "," bonueses"," affiliate programe"," megavipclub"," online poker Texas Holdem"," Omaha"," tournaments"," gdt tournaments"," MTT"," Heads up HU"," Free roll"," free spins "," playtech"," novomatic"," artistocrat"," IGT"," netent"," Microgaming"," RTG"," Realtimegaming"," live casino"," vivo"," ezugi"," GGL"," GD live casino"," EZ live casino"," Rulete live"," Blackjack live"," Baccarat"," puntobanco live"],"metaDescription":"Feel the real touch of Vegas and join the best on line casino! The most exclusive gaming experience, only for vip players.","googleAnalytics":"UA-26225878-17","contactUsWorkingHours":{"dayFrom":"Mon","dayTo":"Sat","hourFrom":"9am","hourTo":"8pm CET"},"emailSupport":"support@gammixcasino.com","dailyDepositLimit":"10000","bonuses":"1","email_system":"1","headerSocial":{"facebook":"","like":"","google_plus":"","twitter":"","youtube":"","instagram":"","instagram_access_token":""},"malta":{"kyc_withdraw_limit":"","excluded_countries":"","extra_age_check":""},"footerSocial":{"enabled":"1","facebook":"https://www.facebook.com/","google_plus":"https://plus.google.com/","twitter":"https://twitter.com","youtube":"","instagram":"","foursquare":"","vine":"","tumblr":"","skype":"","pinterest":"","digg":"","blogger":""},"playerRegFields":{"fname":{"type":{"order":""}},"lname":{"type":{"order":""}},"nickname":{"type":{"order":""}},"username":{"type":{"order":""}},"password":{"type":{"order":""}},"email":{"type":{"order":""}},"countrycode":{"type":{"order":""}},"languagecode":{"type":{"order":""}},"additional":{"type":{"order":""},"optional":{"order":""}},"properties":{"document_id":{"order":""},"ref_code":{"order":""},"gender":{"order":""},"language":{"order":""},"address":{"order":""},"zip":{"order":""},"city":{"order":""},"secquestion":{"order":""},"secanswer":{"order":""},"birthcity":{"order":""},"birthregion":{"order":""},"marketing":{"order":""}}},"promotionsSettings":{"num_promotions":""},"slotsImagesType":{"type":"jpg"},"footerRightsYear":"2020","showBestPlayers":"1","css_less":"1","slotsIntroPage":"1","subTemplate":"1","footer_navigation":"1","promotions_on_homepage":"1","news_on_homepage":"1","news_scroller_on_homepage":"1","bonuses_list_new_view":"1","registration_popup_redirect":"1","games_in_popup":"1","slotsIntroPageCustomContent":"1","is_mobile_skin":"1","skin_folder_mobile":"touchvegasmobile;skins/pantaloonewmobile","show_all_games_on_homepage":"1","cashier_profile_responsive_menu":"1","cashier_profile_icons":"1","fancy_inputs":"1","bonuses_consume_balance_first":"1","livecasinoSkinImages":"default","multicurrency":"1","cxm":{"apikey":"","endpoint":""},"languages":"en,de,es,cn","enable_player_qr_code":"1","loginRedirects":{"first_login_redirect_url":"","no_deposit_redirect_url":"","zero_balance_redirect_url":"","low_balance_redirect_url":""},"oneSignalSettings":{"appIdOneSignal":""},"casino_games_limit_to_show":"50","bonuses_check_open_bets_in_casino":"1","play_for_fun":"1","show_bonuses_in_player_profile":"1","bog":{"domain":"","password_reset_url_path":"","register_form_url_path":"","after_register_token_url_path":"","cdn":""},"casino_countries_blacklist":"hu","alway_show_withdrawal_methods":"1","has_rebate_bonus":"1","bo_2nd_username":"admin.dani","multiple_sportsbook":"1","payments":{"prepaidcard":{"EUR":{"enabled":"1"},"ZAR":{"enabled":"1"}}}}', 3, 2, '', 'en_GB', 'aggr.reeltech.co;127.0.0.1;aggr-api.localhost', 1, 0, NULL, 'casinolive,casino,sectionVirtualSports,sportsbook-tb,sportsbook-tbl,sportsbook-di,sportsbook-ds,sportsbook-die,sportsbook-dse,promotions_bamako', 'skins/touchvegas', 0);
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(25) NOT NULL,
  `lname` varchar(25) NOT NULL,
  `nickname` varchar(260) NOT NULL,
  `username` varchar(260) NOT NULL,
  `password` varchar(41) NOT NULL,
  `email` varchar(64) NOT NULL,
  `currencycode` char(3) NOT NULL,
  `countrycode` char(2) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `associateid` int(11) NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `balance_fun` decimal(15,2) NOT NULL,
  `bonus` decimal(15,2) NOT NULL,
  `first_deposit` decimal(15,2) NOT NULL,
  `facebook_id` varchar(32) NOT NULL,
  `first_deposit_date` datetime NOT NULL,
  `system` char(3) NOT NULL,
  `system_fun` varchar(2) NOT NULL,
  `dailydeplimit` int(20) NOT NULL,
  `blockaccess` tinyint(1) NOT NULL DEFAULT '0',
  `logins` int(6) NOT NULL,
  `lastactive` datetime DEFAULT NULL,
  `sessionid` varchar(255) NOT NULL,
  `status` enum('PENDING','VALIDATED','FROZEN','DEACTIVATED','BLOCKED','TOKEN','REVIEW') NOT NULL,
  `created` datetime DEFAULT NULL,
  `additional` text NOT NULL,
  `platformid` int(2) NOT NULL,
  `disabled_systems` varchar(200) NOT NULL,
  `favorite_games` text,
  `recent_games` text,
  `egass_clickid` varchar(32) NOT NULL,
  `note` text NOT NULL,
  `processing` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `a_aid` varchar(40) DEFAULT NULL,
  `remote` int(11) DEFAULT NULL,
  `nodeposits` int(11) DEFAULT '0',
  `nowithdrawals` int(11) DEFAULT '0',
  `totaldeposits` decimal(15,2) DEFAULT '0.00',
  `totalwithdrawals` decimal(15,2) DEFAULT '0.00',
  `version` int(11) NOT NULL DEFAULT '0',
  `updated` datetime DEFAULT NULL,
  `languagecode` varchar(5) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT '',
  `level` int(1) NOT NULL DEFAULT '0',
  `tz` varchar(60) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `platformid` (`platformid`),
  KEY `username` (`username`(255)),
  KEY `fname` (`fname`),
  KEY `lname` (`lname`),
  KEY `email` (`email`),
  KEY `lastactive` (`lastactive`),
  KEY `a_aid` (`a_aid`),
  KEY `password` (`password`),
  KEY `sessionid` (`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.players: ~0 rows (approximately)
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
/*!40000 ALTER TABLE `players` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.player_balances
DROP TABLE IF EXISTS `player_balances`;
CREATE TABLE IF NOT EXISTS `player_balances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) NOT NULL,
  `agentid` int(11) NOT NULL,
  `balance` decimal(22,2) NOT NULL,
  `bonus` decimal(22,2) NOT NULL,
  `jackpot` decimal(22,2) NOT NULL,
  `withdrawal_pending` decimal(22,2) NOT NULL,
  `date` date NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `error` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;

-- Dumping data for table isoftbetgamehub_codeception.player_balances: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_balances` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_balances` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.player_btcchannels
DROP TABLE IF EXISTS `player_btcchannels`;
CREATE TABLE IF NOT EXISTS `player_btcchannels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `channelid` varchar(255) DEFAULT NULL,
  `txs_callback_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `receiver_currency` varchar(3) DEFAULT NULL,
  `channel_url` varchar(255) DEFAULT NULL,
  `created_at` varchar(20) DEFAULT NULL,
  `updated_at` varchar(20) DEFAULT NULL,
  `share_to_keep_in_btc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Dumping data for table isoftbetgamehub_codeception.player_btcchannels: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_btcchannels` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_btcchannels` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.player_cryptocurrency_details
DROP TABLE IF EXISTS `player_cryptocurrency_details`;
CREATE TABLE IF NOT EXISTS `player_cryptocurrency_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) NOT NULL,
  `explayerid` int(11) NOT NULL,
  `address` varchar(256) NOT NULL DEFAULT '',
  `destination_tag` varchar(128) DEFAULT NULL,
  `currency` varchar(12) NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `additional` varchar(512) NOT NULL DEFAULT '',
  `processor` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.player_cryptocurrency_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_cryptocurrency_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_cryptocurrency_details` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.player_cryptocurrency_details_bckup
DROP TABLE IF EXISTS `player_cryptocurrency_details_bckup`;
CREATE TABLE IF NOT EXISTS `player_cryptocurrency_details_bckup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) NOT NULL,
  `explayerid` int(11) NOT NULL,
  `address` varchar(256) NOT NULL DEFAULT '',
  `currency` varchar(6) NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `additional` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Dumping data for table isoftbetgamehub_codeception.player_cryptocurrency_details_bckup: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_cryptocurrency_details_bckup` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_cryptocurrency_details_bckup` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.player_documents
DROP TABLE IF EXISTS `player_documents`;
CREATE TABLE IF NOT EXISTS `player_documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'Untitled.txt',
  `mime` varchar(50) NOT NULL DEFAULT 'text/plain',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `data` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `player_id` int(11) NOT NULL,
  `type` varchar(128) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.player_documents: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_documents` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.player_settings
DROP TABLE IF EXISTS `player_settings`;
CREATE TABLE IF NOT EXISTS `player_settings` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `player_id` int(6) NOT NULL,
  `disabled_games` text NOT NULL,
  `disabled_menus` varchar(255) NOT NULL,
  `playing_time_warning` int(11) NOT NULL,
  `weekly_deposit_limit` int(6) NOT NULL,
  `limits_additional` text CHARACTER SET utf8,
  `daily_deposit_limit` int(6) DEFAULT NULL,
  `daily_deposit_limit_time` datetime DEFAULT NULL,
  `frozen_date` date NOT NULL,
  `frozen_for_nodays` int(6) DEFAULT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `version` varchar(10) DEFAULT '0',
  `achievements` text,
  `aff_token` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.player_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_settings` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.reports
DROP TABLE IF EXISTS `reports`;
CREATE TABLE IF NOT EXISTS `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `playerid` int(7) unsigned NOT NULL,
  `agentid` int(7) unsigned NOT NULL,
  `currency` char(10) NOT NULL,
  `bet` decimal(15,2) DEFAULT NULL,
  `win` decimal(15,2) DEFAULT NULL,
  `rake` decimal(15,2) DEFAULT NULL,
  `tournament` decimal(15,2) DEFAULT NULL,
  `fin` decimal(15,2) DEFAULT NULL,
  `net` decimal(15,2) NOT NULL,
  `system` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.reports: ~0 rows (approximately)
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.report_affiliate
DROP TABLE IF EXISTS `report_affiliate`;
CREATE TABLE IF NOT EXISTS `report_affiliate` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `affiliate_id` varchar(15) NOT NULL,
  `campaign_id` varchar(10) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `bet_casino` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win_casino` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net_casino` decimal(15,2) NOT NULL DEFAULT '0.00',
  `financial` decimal(15,2) NOT NULL,
  `total_rake` decimal(15,2) NOT NULL,
  `total_tournament` decimal(15,2) NOT NULL,
  `total_rake_tournament` decimal(15,2) NOT NULL,
  `bonus` decimal(15,2) DEFAULT '0.00',
  `bonusrebate` decimal(15,4) DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`),
  KEY `affiliate_id` (`affiliate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='don''t delete rows, or we won''t be able to update pap api';

-- Dumping data for table isoftbetgamehub_codeception.report_affiliate: ~0 rows (approximately)
/*!40000 ALTER TABLE `report_affiliate` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_affiliate` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.report_balances
DROP TABLE IF EXISTS `report_balances`;
CREATE TABLE IF NOT EXISTS `report_balances` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `agentid` int(7) NOT NULL,
  `player_id` int(8) DEFAULT '0',
  `username` varchar(32) NOT NULL,
  `balance` decimal(15,2) DEFAULT '0.00',
  `system` varchar(2) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.report_balances: ~0 rows (approximately)
/*!40000 ALTER TABLE `report_balances` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_balances` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.report_sums
DROP TABLE IF EXISTS `report_sums`;
CREATE TABLE IF NOT EXISTS `report_sums` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `agentid` int(7) NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `debit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(10) NOT NULL,
  `chips_in_play` decimal(15,2) DEFAULT '0.00',
  `withdrawal_pending` decimal(15,2) DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `system` varchar(128) DEFAULT '',
  `tip` decimal(15,2) DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusGivenLeft` decimal(17,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.report_sums: ~0 rows (approximately)
/*!40000 ALTER TABLE `report_sums` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_sums` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.report_sums_utc
DROP TABLE IF EXISTS `report_sums_utc`;
CREATE TABLE IF NOT EXISTS `report_sums_utc` (
  `id` varchar(100) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `agentid` int(7) NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `debit` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(10) NOT NULL,
  `chips_in_play` decimal(15,2) DEFAULT '0.00',
  `withdrawal_pending` decimal(15,2) DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `system` varchar(128) DEFAULT '',
  `tip` decimal(15,2) DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusGivenLeft` decimal(17,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `agentid` (`agentid`) USING BTREE,
  KEY `date` (`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.report_sums_utc: ~0 rows (approximately)
/*!40000 ALTER TABLE `report_sums_utc` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_sums_utc` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.reset_attempts
DROP TABLE IF EXISTS `reset_attempts`;
CREATE TABLE IF NOT EXISTS `reset_attempts` (
  `user_id` int(11) NOT NULL,
  `type` enum('PLAYER','AGENT') CHARACTER SET utf8 NOT NULL,
  `attempts` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.reset_attempts: ~0 rows (approximately)
/*!40000 ALTER TABLE `reset_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `reset_attempts` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(24) NOT NULL,
  `last_active` int(10) unsigned NOT NULL,
  `contents` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_active` (`last_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.sessions: ~0 rows (approximately)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.settings
DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
REPLACE INTO `settings` (`id`, `name`, `type`, `value`) VALUES
	(1, 'conf', NULL, '{"bonusplatformids":[],"method":{"100":" (from player)","101":" (pm from player)","102":" (from player fido balance)","104":" (from player prepaidcard)","105":" (from player wiretransfer)","106":" (from player bitcoin)","107":" (from player blockcypher)","108":" (from player unionpay)","109":" (from player vcash88)","110":" (from player mc2)","111":" (from player paymentiq)","112":" (from player cubits)","113":" (from player neosurf)","114":" (from player paybetr)","115":" (from player tumcash)","116":" (from player apco)","117":" (from player coinpayments)","118":" (from player tigomoney)","200":" (from agent)","201":" (pm from agent)","202":" (from agent fido balance)","203":" (fido limit from agent)","204":" (from agent prepaidcard)","205":" (from agent wiretransfer)","206":" (from agent bitcoin)","207":" (from agent blockcypher)","208":" (from agent unionpay)","209":" (from agent vcash88)","210":" (from agent mc2)","211":" (from agent paymentiq)","212":" (from agent cubits)","213":" (from agent neosurf)","214":" (from agent paybetr)","215":" (from agent tumcash)","216":" (from agent apco)","217":" (from agent coinpayments)","218":" (from agent tigomoney)","300":" (system transfer)","400":" (settlement)","500":" (INFO)","600":" (balance refresh)","700":" (ERROR)","800":" (game session)","900":" (refund from player)","901":" (refund from agent)"},"rip":"84.255.236.5","available_langs":{"en":"en_GB","de":"de_DE","it":"it_IT","si":"si_SI","es":"es_ES","vn":"vn_VN","cn":"cn_CN","hr":"hr_HR","ru":"ru_RU","th":"th_TH","tr":"tr_TR","ro":"ro_RO","sr":"sr_SR","pt":"pt_PT","bs":"bs_BA","sh":"sh_SH","ms":"ms_MS","ko":"ko_KR","jp":"jp_JP","pl":"pl_PL","sv":"sv_SE","no":"no_NO"},"langs":{"en_GB":"English","de_DE":"German","it_IT":"Italian","si_SI":"Slovenian","es_ES":"Spanish","vn_VN":"Vietnamese","cn_CN":"\\u4e2d\\u6587","hr_HR":"Croatian","ru_RU":"Russian","th_TH":"Thai","tr_TR":"Turkish","ro_RO":"Romanian","sr_SR":"Serbian","pt_PT":"Portuguese","bs_BA":"Bosnian","sh_SH":"Serbian Latin","ms_MS":"Malaysian","ko_KR":"Korean","jp_JP":"Japanese","pl_PL":"Polish","sv_SE":"Swedish","no_NO":"Norwegian"},"elangs":{"en":"eng","de":"deu","it":"ita","si":"slo","es":"spa","vn":"vnm","cn":"chi","hr":"cro","th":"thai","tr":"tur","ro":"ron","sr":"srb","pt":"por","bs":"bos","sh":"scr","ms":"may","ko":"kor","jp":"jpn","pl":"pol","sv":"swe","no":"nor"},"timezones":{"cn":"Asia\\/Hong_Kong","my":"Asia\\/Hong_Kong","it":"Europe\\/Rome","ru":"Europe\\/Moscow"},"systems":{"ar":"GameArt Wallet","as":"GameArt Seamless","rr":"RR Poker","3d":"3D Poker","po":"APN Poker","pq":"Playlogiq Sportsbook","la":"Laifacai","sl":"Slots","dl":"DBG Live Casino","mi":"Mirage Wallet","mc":"Mirage Seamless","pt":"Playtech","gl":"GGL Live Casino","vi":"Vivo Live Casino","gd":"GD Live Casino","gc":"GD Live Casino CW","es":"Evolution Live Casino","ri":"Ri Games","ex":"Exaloc SportsBook","ez":"Ezugi Live Casino","oc":"NT Casino","ob":"Over Bet","rc":"Bingo RCT","ne":"Netent","nl":"Netent Live Casino","np":"Netent Premium","mw":"Mirage W","ms":"Mirage CW","gw":"GameArt W","gs":"GameArt CW","bs":"BetSoft","cw":"Xplosive W","cs":"Xplosive CW","kw":"SlotMotion W","ks":"SlotMotion","kf":"Fuga Gaming","kl":"LottoPop","kb":"BlueOceanGaming","pl":"PlayTech","lp":"PlayTech Live Casino","bc":"2BC SportsBook","tb":"TB SportsBook","ag":"AsiaGaming Live Casino","mr":"MicroGaming","mp":"MicroGaming premium","mf":"MicroGaming - Foxium","mj":"MicroGaming - JFTW","mb":"MicroGaming - Rabcat","mn":"MicroGaming - Big time gaming normal","md":"MicroGaming - Big time gaming branded","m2":"Microgaming - 2by2","rs":"ReelTime Gaming","hi":"The Hive Poker","kv":"Kiron","is":"iSoftBet","ip":"iSoftBet premium","ht":"Hollywood TV","pr":"Pragmatic Play","ac":"Arenacube","xe":"Evolution s2s","qs":"QuickSpin","rp":"RedInPove","ot":"Onetouch","or":"Oryx","og":"Oryx(Gamomat)","op":"Oryx(Gamomat - premium)","ok":"Oryx(Kalamba)","pg":"Play\'n go","pb":"Play\'n go premium","dg":"Dream Gaming","bt":"Bitgames oferwall\\/faucet","pa":"Pariplay","pp":"Pariplay premium","fg":"Fugaso Gaming","be":"BetGames","rt":"Realtime Gaming","ha":"Habanero","vg":"Virtual generation","ou":"OutcomeBet s2s","li":"Lion","ig":"iGTech","er":"Endorphina","gh":"Entire Gamehub","gg":"GG poker","gp":"Ganapati","lu":"Lucky","in":"Inplaynet","el":"Elk","ep":"EvoPlay","gb":"Booming Games","th":"Tom Horn","no":"Nolimit","qp":"Push Gaming","qr":"Relax Gaming","qf":"Felt Gaming","sp":"Spinomenal","xg":"1X2 Gaming","le":"Leap","id":"Iron Dog","di":"Digitain Sportsbook","sg":"Spade Gaming","ds":"DelaSport","yg":"YggDrasil","yp":"YggDrasil premium","bx":"Betixon","o2":"One Touch","pm":"MicroGaming Poker","tp":"Triple Pg","tk":"ThunderKick","re":"RedTiger","pc":"Poker as Content","wz":"Wazdan","qk":"Relax(Kalamba)","ma":"Mascot","am":"Amatic","ps":"Platipus","pf":"PG Soft","sy":"Synot","jp":"Justplay"},"livecasino":["cb","ml","dl","gl","vi","gd","gc","ez","lp","nl","ag","es","ht","dg","be"],"pokers":["rr","3d","po","hi","rp","tu","gg","pm","pc"],"sportsbook":["ex","bc","tb","in","di","ds"],"report_transfers":{"trans":"Transfers","refund":"Transfers Refund","bonuses":"Bonuses","playmoney":"Play money","fido":"Fido limit","payments":"Payments"},"report_transfers_skip_in_total":["playmoney","fido"],"report_categories":["transfers","poker","livecasino","casino","sportsbook","playerbalances"],"report_playerbalances":{"chips_in_play":"Chips in play","withdrawal_pending":"Pending withdrawals"},"systems_cashier":["3d","dl","gl","vi","po"],"order":["mi","la","sl"],"skin_basic_auth":[],"default_weekly_deposit_limit":10000,"site_intro":[{"url":"livecasino","name":"Live Casino","play_urls":["play\\/ml\\/mini-live"]},{"url":"casino","name":"Casino","play_urls":["play\\/la"]}],"inactivity":30,"balanceRefreshInterval":5,"money_transfer_on_inactivity_disable":["rr"],"money_transfer_on_window_close_disable":["ki"],"categories":{"livebets":1,"bets":2,"poker":3,"livecasino":4,"casino":5,"video-slots":5,"trading":6},"categorySlots":["video-slots","table-games","video-poker"],"skinConfig":["languages","showArrowchat","simpleRegistration","registrationViaToken","secondaryPassword","showBestPlayers","bestPlayersPlatformIDs","css_less","showCookiesNotification","showClock","categoryGamesGamminator","hasTotem","hasTotemUSA","BOredirectAfterLogin","deposit_popup","paymentInstruments","footerRightsYear","customCssLink","customJSLink","skinTitle","loginCreateAnAccount","gameSectionIntroPage","livecasinoSkinImages","promotionsSettings","headerSocial","footerSocial","footerProvidersCustom","metaKeywords","metaDescription","googleAnalytics","baiduAnalytics","contactUsWorkingHours","registrationExtraStepMarketing","emailSupport","emailAffiliates","phoneSupport","dailyDepositLimit","slotsIntroPage","slotsIntroPageCustomContent","subTemplate","registrationIDDocumentNumber","redeemCards","pap_affiliate_campaignid","pap_affiliate_config","pap_affiliate_impressiontracker","pap_affiliate_clicktracker","pap_affiliate_clicktrackerurl","pap_affiliate_impressiontrackerurl","rootAgent","multicurrency","currencyShow","bonuses","bonuses_consume_balance_first","bonuses_hide_in_cashier","please_login_to_play_popup","claim_players","player_reality_check","player_inactive_logout_time","email_system","email_system_always_send_in_default_skin_language","slider_payment","modern_login","fun_credits","fun_credits_auto_switch","fun_credits_welcome_gift","fun_credits_api_welcome_gift","play_for_fun","show_promotions_on_poker","do_not_send_welcome_mail","welcome_popup","refferal_link_redirect_to_register","malta","is_mobile_skin","skin_folder_mobile","mobile_games_position","show_all_games_on_homepage","cashier_profile_responsive_menu","success_after_registration_seconds","cashier_profile_icons","fancy_inputs","mobile_support","mobile_floating_chat_button","mobile_fixed_bottom_navigation","cxm_url","send_deposit_approval_email","send_withdraw_approval_email","2step_auth","alway_show_withdrawal_methods","footer_navigation","FEredirectAfterLogout","promotions_on_homepage","news_on_homepage","news_scroller_on_homepage","letspoker_custom_elements","livecasino_show_active_tables","gameart_spin_button_on_right","hide_unpopular_games","banners_by_section","banners_logged_in","playerRegFields","payment_withdraw_cancels_bonus","hide_player_restriction_tab","casino_games_ajax_loading","casino_games_limit_to_show","show_favorite_games","show_recent_games","show_live_casino_games","show_virtual_sports_games","show_poker_games","show_sportsbook_games","categorized_footer","news_all_over_page","bonuses_list_new_view","has_rebate_bonus","registration_popup_redirect","restriction_hidden_forms","casino_renamed_to_slots","slotsImagesType","profile_change_email","hide_promotions_in_cashier","contact_form_with_username","old_skins_ajax_games_loading","games_in_popup","hide_cashback_bonus_tab","login_landing_page","money_transactions_ajax_loading","money_transactions_limit_to_show","fido_limit_show","transfer_message","agent_tree_transfer","bonus_chained","bonuses_check_open_bets_in_casino","external_paymentpopup_css","external_paymentpopup_js","gameartLeaderboards","cashierinmodal","bo_reports_ngr_jc_calculation","disableeditprofileFE","hide_transaction_history","promotions_order_by_position","hideChangePasswordForm","oneSignalSettings","loginRedirects","login_captcha","enable_player_qr_code","multiple_sportsbook","most_played_livecasino","bo_2nd_username","bo_2nd_password","quickdeposit","versionTouCheck","casino_countries_whitelist","casino_countries_blacklist","last_logged_in_popup","player_documents","show_bonuses_in_player_profile","visit_homepage_desktop_redirect","visit_homepage_mobile_redirect"],"skinConfigDirect":["root_agent","title","skin","http_host","active","default_lang","menu","skin_folder","tz"],"regions":{"AG":"Agrigento","AL":"Alessandria","AN":"Ancona","AO":"Aosta","AR":"Arezzo","AP":"Ascoli Piceno","AT":"Asti","AV":"Avellino","BA":"Bari","BT":"Barletta-Andria-Trani","BL":"Belluno","BN":"Benevento","BG":"Bergamo","BI":"Biella","BO":"Bologna","BZ":"Bolzano","BS":"Brescia","BR":"Brindisi","CA":"Cagliari","CL":"Caltanissetta","CB":"Campobasso","CI":"Carbonia-Iglesias","CE":"Caserta","CT":"Catania","CZ":"Catanzaro","CH":"Chieti","CO":"Como","CS":"Cosenza","CR":"Cremona","KR":"Crotone","CN":"Cuneo","EN":"Enna","FM":"Fermo","FE":"Ferrara","FI":"Firenze","FG":"Foggia","FC":"Forli Cesena","FR":"Frosinone","GE":"Genova","GO":"Gorizia","GR":"Grosseto","IM":"Imperia","IS":"Isernia","AQ":"L\'Aquila","SP":"La Spezia","LT":"Latina","LE":"Lecce","LC":"Lecco","LI":"Livorno","LO":"Lodi","LU":"Lucca","MC":"Macerata","MN":"Mantova","MS":"Massa Carrara","MT":"Matera","VS":"Medio Campidano","ME":"Messina","MI":"Milano","MO":"Modena","MB":"Monza e Brianza","NA":"Napoli","NO":"Novara","NL":"Nullo","NU":"Nuoro","OG":"Ogliastra","OT":"Olbia-Tempio","OR":"Oristano","PD":"Padova","PA":"Palermo","PR":"Parma","PV":"Pavia","PG":"Perugia","PU":"Pesaro Urbino","PE":"Pescara","PC":"Piacenza","PI":"Pisa","PT":"Pistoia","PN":"Pordenone","PZ":"Potenza","PO":"Prato","RG":"Ragusa","RA":"Ravenna","RC":"Reggio Calabria","RE":"Reggio Emilia","RI":"Rieti","RN":"Rimini","RM":"Roma","RO":"Rovigo","SA":"Salerno","SS":"Sassari","SV":"Savona","SI":"Siena","SR":"Siracusa","SO":"Sondrio","TA":"Taranto","TE":"Teramo","TR":"Terni","TO":"Torino","TP":"Trapani","TN":"Trento","TV":"Treviso","TS":"Trieste","UD":"Udine","VA":"Varese","VE":"Venezia","VB":"Verbania","VC":"Vercelli","VR":"Verona","VV":"Vibo Valentia","VI":"Vicenza","VT":"Viterbo"},"playerRegistrationAdditionalFields":{"document_id":"document_id","ref_code":"ref_code","gender":"gender","language":"language","address":"address","zip":"zip","city":"city","secquestion":"secquestion","secanswer":"secanswer","birthcity":"birthcity","birthregion":"birthregion","marketing":{"internet":"internet","socialmedia":"socialmedia","directreferral":"directreferral","email":"email","marketingcampaign":"marketingcampaign"}},"document_types":{"proof_of_identity":"Proof of identity","proof_of_address":"Proof of address","proof_of_bank":"Proof of bank","credit_card_front":"Credit card (front)","credit_card_back":"Credit card (back)"},"transfer_to_player_players_per_tab":10,"transfer_to_player_banknote":{"ILS":"10,20,50,100,500,1000","default":"1,5,10,50,100,500"},"payment_methods_name":{"1":"INDUSTRIAL AND COMMERCIAL BANK OF CHINA","2":"AGRICULTURE BANK OF CHINA","3":"BANK OF CHINA","4":"CHINA CONSTRUCTION BANK","5":"BANK OF COMMUNICATIONS","6":"CHINA EVERBRIGHT BANK","7":"SHANGHAI PUDONG DEVELOPMENT BANK","8":"BANK OF BEIJING","9":"CHINA GUANGFA BANK","10":"PINGAN BANK","11":"INDUSTRIAL BANK","12":"CHINA MERCHANTS BANK","13":"SHENZHEN DEVELOPMENT BANK","14":"POSTAL SAVING BANK OF CHINA","15":"HUAXIA BANK","16":"CHINA MINSHENG BANK","creditcard":"Creditcard","mastercard":"Mastercard","mc":"Mastercard","visa":"Visa","diners":"Diners","discover":"Discover","amex":"American express","visavoucher":"Visavoucher","mc2visa":"Visa","mc2mc":"Mastercard","mc2amex":"American express","maestro":"Maestro","astropaydirect_sb":"Santander","astropaydirect_bv":"Bancomer (BBVA)","astropaydirect_bm":"Banamex","astropaydirect_sm":"Santander","astropaybank_sb":"Santander","astropaybank_bv":"Bancomer (BBVA)","astropaybank_bm":"Banamex","astropaybank_sm":"Santander","ideal":"Ideal","envoy":"Envoy","mbb":"Maybank Berhad","pbb":"Public Bank Berhad","cimb":"CIMB Bank Berhad","hlb":"Hong Leong Bank Berhad","kkr":"Kasikorn Bank (K-Bank)","ktb":"Krung Thai Bank","bbl":"Bangkok Bank","scb":"Siam Commercial Bank","astropaydirect_i":"Itau","astropaydirect_b":"Bradesco","astropaydirect_bb":"Banco do Brasil","astropaydirect_h":"HSBC","astropaydirect_wp":"WebPay","astropaydirect_pa":"BCP (via LatinAmericanPayments)","astropaydirect_ib":"InterBank","astropaydirect_bp":"BBVA","astropaydirect_ef":"Pago Efectivo","astropaybank_i":"Itau","astropaybank_b":"Bradesco","astropaybank_bb":"Banco do Brasil","astropaybank_h":"HSBC","astropaybank_wp":"WebPay","astropaybank_pa":"BCP (via LatinAmericanPayments)","astropaybank_ib":"InterBank","astropaybank_bp":"BBVA","astropaybank_ef":"Pago Efectivo","idebit":"Idebit","instadebit":"Instadebit","skrill":"Skrill","neteller":"Neteller","paypal":"Paypal","ecopayz":"Ecopayz","myneosurf":"MyNeosurf","icard":"Icard","entropay":"Entropay","neosurf":"Neosurf","astropay":"Astropay","astropaycard":"Astropaycard","paysafecard":"Paysafecard","prepaidcard":"Prepaidcard","astropaydirect_re":"Redpagos","astropaydirect_te":"test","astropaydirect_ee":"ePayLinks","astropaybank_re":"Redpagos","astropaybank_te":"test","astropaybank_ee":"ePayLinks","tumcash":"Tumcash","paysafecardd":"Paysafecard","bank":"Bank","banklocal":"Banklocal","bankinitban":"Bankinitban","bankiban":"Bankiban","ibanq":"Ibanq","default":"Bank Transfer","custom_tr":"Bank Transfer","custom_withdraw":"Bank Transfer","china_construction_bank_dep":"China Construction Bank","industrial_and_commercial_bank_of_china_dep":"Industrial And Commercial Bank Of China","agriculture_bank_of_china_dep":"Agriculture Bank Of China","maybank":"Maybank","cimb_bank":"CIMB Bank","public_bank":"Public Bank","rhb_bank":"RHB Bank","hong_leong_bank":"Hong Leong Bank","industrial_and_commercial_bank_of_china":"Industrial And Commercial Bank Of China","agriculture_bank_of_china":"Agriculture Bank Of China","bank_of_china":"Bank Of China","china_construction_bank":"China Construction Bank","bank_of_communications":"Bank Of Communications","china_everbright_bank":"China Everbright Bank","shanghai_pudong_development_bank":"Shanghai Pudong Development Bank","bank_of_beijing":"Bank Of Beijing","china_guangfa_bank":"China Guangfa Bank","pingan_bank":"Pingan Bank","industrial_bank":"Industrial Bank","china_merchants_bank":"China Merchants Bank","shenzhen_development_bank":"Shenzhen Development Bank","postal_saving_bank_of_china":"Postal Saving Bank Of China","huaxia_bank":"Huaxia Bank","china_minsheng_bank":"China Minsheng Bank","kbank":"Kasikorn Bank","scb_thai":"Siam Commercial Bank","bangkokbank":"Bangkok Bank","krungthai":"Krungthai Bank","kbank_wd":"Kasikorn Bank","scb_thai_wd":"Siam Commercial Bank","bangkokbank_wd":"Bangkok Bank","krungthai_wd":"Krungthai Bank","zelle":"Zelle","banco_de_pacifico":"Akbank Cep C\\u00fczdan","banco_pichincha":"Akbank Cep C\\u00fczdan","interbank":"Interbank","zelle_wd":"Zelle","banco_de_pacifico_wd":"Banco De Pacifico","banco_pichincha_wd":"Banco Pichincha","cepbank":"CepBank","cepbank_wd":"CepBank","mc2wu":"Westernunion","mc2mg":"Moneygram","astropaydirect_bl":"Boleto","astropaydirect_ox":"Oxxo","astropaybank_bl":"Boleto","astropaybank_ox":"Oxxo","bitcoin":"Bitcoin","blockcypher":"Bitcoin","cubits":"Bitcoin","paybetr_btc":"Bitcoin","paybetr_eth":"Ethereum","coinpayments_btc":"Bitcoin","coinpayments_eth":"Ethereum","coinpayments_ltc":"Litecoin","coinpayments_xrp":"Ripple","coinpayments_ltct":"Litecoin test","akbank_cep":"Akbank Cep C\\u00fczdan","denizbank_cep":"Denizbank Cep Param","isbank_cebe":"\\u0130\\u015f Bank Cebe Havale","yapikredi_cep":"Yap\\u0131 Kredi Cep Havale","garanti_cep":"Garanti Cep","flexepin":"Flexepin","neosurfvoucher":"Neosurfvoucher","neosurfd":"Neosurf","mc2":"Creditcard","quickteller":"Quickteller","pugglepay":"Pugglepay","siru":"Siru","ukash":"Ukash","clickandbuy":"Clickandbuy","mbancomat":"Mbancomat","paylevo":"Paylevo","lavapay":"Lavapay","trustly":"Trustly","apco_coinnor_visa":"Visa","apco_coinnor_mastercard":"Mastercard","tigomoney":"Tigo Money","paraguay_custom":"Paraguay custom","papara":"Papara","papara_wd":"Papara","astropaybank":"Astropay Bank","zimple":"Zimple"},"payment_methods_by_category":{"credit_cards":["creditcard","mastercard","mc","visa","diners","discover","amex","visavoucher","mc2visa","mc2mc","mc2amex","apco_coinnor_visa","apco_coinnor_mastercard"],"debit_cards":["maestro","astropaydirect_sb","astropaydirect_bv","astropaydirect_bm","astropaydirect_sm","astropaybank_sb","astropaybank_bv","astropaybank_bm","astropaybank_sm"],"instant_banking":["ideal","envoy","mbb","pbb","cimb","hlb","kkr","ktb","bbl","scb","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","astropaydirect_i","astropaydirect_b","astropaydirect_bb","astropaydirect_h","astropaydirect_wp","astropaydirect_pa","astropaydirect_ib","astropaydirect_bp","astropaydirect_ef","astropaybank_i","astropaybank_b","astropaybank_bb","astropaybank_h","astropaybank_wp","astropaybank_pa","astropaybank_ib","astropaybank_bp","astropaybank_ef","astropaybank","idebit","instadebit"],"e_wallets":["skrill","neteller","paypal","ecopayz","myneosurf","tigomoney"],"prepaid_cards":["icard","entropay","neosurf","astropay","astropaycard","paysafecard","prepaidcard","astropaydirect_re","astropaydirect_te","astropaydirect_ee","astropaybank_re","astropaybank_te","astropaybank_ee","tumcash","paysafecardd"],"bank_transfers":["bank","banklocal","bankinitban","bankiban","ibanq","default","custom_tr","custom_withdraw","china_construction_bank_dep","industrial_and_commercial_bank_of_china_dep","agriculture_bank_of_china_dep","maybank","cimb_bank","public_bank","rhb_bank","hong_leong_bank","industrial_and_commercial_bank_of_china","agriculture_bank_of_china","bank_of_china","china_construction_bank","bank_of_communications","china_everbright_bank","shanghai_pudong_development_bank","bank_of_beijing","china_guangfa_bank","pingan_bank","industrial_bank","china_merchants_bank","shenzhen_development_bank","postal_saving_bank_of_china","huaxia_bank","china_minsheng_bank","kbank","scb_thai","bangkokbank","krungthai","kbank_wd","scb_thai_wd","bangkokbank_wd","krungthai_wd","zelle","banco_de_pacifico","banco_pichincha","interbank","interbank_wd","zelle_wd","banco_de_pacifico_wd","banco_pichincha_wd","cepbank","cepbank_wd","aramor_wd","paraguay_custom","papara","papara_wd","zimple"],"money_orders":["mc2wu","mc2mg","astropaydirect_bl","astropaydirect_ox","astropaybank_bl","astropaybank_ox"],"bitcoins":["bitcoin","blockcypher","cubits","paybetr_btc","coinpayments_btc"],"etherum":["paybetr_eth","coinpayments_eth"],"litecoin":["coinpayments_ltc"],"litecointest":["coinpayments_ltct"],"ripple":["coinpayments_xrp"],"mobile_banks":["akbank_cep","denizbank_cep","isbank_cebe","yapikredi_cep","garanti_cep"],"vouchers":["flexepin","neosurfvoucher","neosurfd"],"other":["mc2","quickteller","pugglepay","siru","ukash","clickandbuy","mbancomat","paylevo","lavapay","trustly"]},"payment_methods_by_provider":{"apco":["apco_coinnor_visa","apco_coinnor_mastercard"],"prepaidcard":"prepaidcard","tigomoney":"tigomoney","tumcash":"tumcash","papara":"papara","wiretransfer":["default","custom_tr","akbank_cep","denizbank_cep","garanti_cep","isbank_cebe","yapikredi_cep","maybank","cimb_bank","public_bank","rhb_bank","hong_leong_bank","ak_bank","denizbank","finansbank","graniti_bakasi","halkbank","is_bankasi","teb","yapi_kredit_bankasi","ziraat_bankasi","ing_bank","vakif_bank","china_construction_bank_dep","industrial_and_commercial_bank_of_china_dep","agriculture_bank_of_china_dep","kbank","scb_thai","bangkokbank","krungthai","zelle","banco_de_pacifico","banco_pichincha","interbank","cepbank","aramor_wd","paraguay_custom","zimple"],"bitcoin":"bitcoin","blockcypher":"blockcypher","cubits":"cubits","paybetr":["paybetr_btc","paybetr_eth"],"coinpayments":["coinpayments_btc","coinpayments_eth","coinpayments_ltc","coinpayments_ltct","coinpayments_xrp"],"unionpay":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"],"vcash88":["mbb","pbb","cimb","hlb","kkr","ktb","bbl","scb"],"mc2":["mc2","mc2visa","mc2mc","mc2amex","mc2wu","mc2mg"],"quickteller":"quickteller","paymentiq":["paysafecard","pugglepay","neteller","creditcard","paypal","bank","ideal","ibanq","siru","ukash","skrill","clickandbuy","mbancomat","paylevo","lavapay","trustly","banklocal","bankinitban","bankiban","astropay","astropaycard","envoy","ecopayz","astropaydirect","idebit","instadebit","neosurf","entropay","icard","flexepin","visavoucher","neosurfvoucher","mastercard","astropaybank_i","astropaybank_b","astropaybank_bb","astropaybank_h","astropaybank_wp","astropaybank_pa","astropaybank_ib","astropaybank_bp","astropaybank_ef","astropaybank_sb","astropaybank_bv","astropaybank_bm","astropaybank_sm","astropaybank_re","astropaybank_te","astropaybank_ee","astropaybank_bl","astropaybank_ox"],"adyen":["mc","visa","diners","discover","amex","maestro"],"paysafecard":"paysafecardd","neosurfd":["neosurfd","myneosurf"]},"systems_lobby_link":["rr","3d","dl","ml","gd","es","ez","xe"]}'),
	(3, 'cdn', NULL, '{"cdn_enabled":false,"server_css":"aggr-api-prod.reevotech.com","server_css_bak":"cdn1.content8482ok.com","server_js":"aggr-api-prod.reevotech.com","server_js_bak":"cdn2.content8482ok.com","server_images":"aggr-static-prod.reevotech.com","server_images_bak":"cdn3.content8482ok.com","server_less":"aggr-api-prod.reevotech.com","server_less_bak":"cdn2.content8482ok.com"}'),
	(5, 'mailer', NULL, '\n        {\n          "0": "nore",\n          "default": {\n            "smtp": {\n              "host": "https://example.net",\n              "port": "123123",\n              "auth": true,\n              "username": "noreply@askldajsld.com",\n              "password": "098adklasjdl"\n            }\n          },\n          "default-noreply": {\n            "smtp": {\n              "host": "tls://smtp.gmail.com",\n              "port": "587",\n              "auth": true,\n              "username": "no-reply@reevotech.com",\n              "password": "fje0wDSfds43"\n            }\n          },\n          "pantaloo-noreply": {\n            "from": "noreply@asdasd12.com",\n            "smtp": {\n              "host": "ssl://https://example.com",\n              "port": "123123",\n              "auth": true,\n              "username": "noreply@123123asdasd.com",\n              "password": "sadasd123"\n            }\n          },\n          "pantaloo": {\n            "from": "noreply@asdasdas123123.com",\n            "smtp": {\n              "host": "smtpout.https://example.com",\n              "port": "80",\n              "auth": true,\n              "username": "noreply@asdasd123123.com",\n              "password": "asdasdsa123213"\n            }\n          }\n        }\n        '),
    (6, 'admin_config_restricted_countries', NULL, '{"dbPath":"docker\/geoip.mmdb","countries":["United States","United Kingdom"],"countries_fun_mode":["United States","United Kingdom"]}'),
	(7, 'provider_is', NULL, '{"EUR":{"lid":"","secretKey":"doqfhROINCFp5BPf9hWPt27AYAYdbJdh","baseUrl":"","apiUrl":"","currency":"","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-lux.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":false},"770-STAGE":{"lid":"1110","secretKey":"rNOiATAAHzUlShCOFLj23Ss77piV4vde","baseUrl":"https:\\/\\/stage-game-launcher-lux.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-lux.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-lux.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":false},"WSULT-STAGE":{"lid":"1180","secretKey":"FU4hXsbnBudTpmAE2smFnMryNfxTi1vu","baseUrl":"https:\\/\\/stage-game-launcher-lux.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-lux.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-lux.isoftbet.com\\/Xml"}},"ROO-STAGE":{"lid":"1155","secretKey":"mO7FdWnk8MCN9bWXJwGsvCEMhxvmWaL9","baseUrl":"https:\\/\\/stage-game-launcher-sg.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-sg.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-sg.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"JOEFORTUNE-STAGE":{"lid":"1256","secretKey":"DhVC9ymrLHCpUbdjXnWyMGNdBeAtC3rj","baseUrl":"https:\\/\\/stage-game-launcher-sg.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-sg.isoftbet.com","currency":"USD","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-sg.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"TABELLA-KINGCHANCE-STAGE":{"lid":"1235","secretKey":"doqfhROINCFp5BPf9hWPt27AYAYdbJdh","baseUrl":"https:\\/\\/stage-game-launcher-sg.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-sg.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-sg.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"TABELLA-MALIBUCASINO-STAGE":{"lid":"1236","secretKey":"a4PX1U5u1KhBWRzQHfyGJTBbmGCX3uBl","baseUrl":"https:\\/\\/stage-game-launcher-sg.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-sg.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-sg.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"TABELLA-SCARLETCASINO-STAGE":{"lid":"1237","secretKey":"WnJFus57d8DFoJcBVplaWF2emE9lw6MR","baseUrl":"https:\\/\\/stage-game-launcher-sg.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-sg.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-sg.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"TABELLA-ULTIMATESPINS-STAGE":{"lid":"1238","secretKey":"gbaxRsvGQ9CIS8MO6uIdO8o9sqXiBqS1","baseUrl":"https:\\/\\/stage-game-launcher-sg.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-sg.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-sg.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"PLAYLOGIA-VEGASPLUS-STAGE":{"lid":"1232","secretKey":"pkWrecz1T6kDmJYLzEVjsOC39g7fIzcg","baseUrl":"https:\\/\\/stage-game-launcher-lux.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-lux.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-lux.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"PLAYLOGIA-PLAYZAX-STAGE":{"lid":"1233","secretKey":"YWs8juJ6YrBhX6gFXeri4nHWfNOBXJpz","baseUrl":"https:\\/\\/stage-game-launcher-lux.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-lux.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-lux.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"PLAYLOGIA-MACHANCE-STAGE":{"lid":"1230","secretKey":"kUij8H7J5NtgEGqPcdxOGrfDAIxVq5gX","baseUrl":"https:\\/\\/stage-game-launcher-lux.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-lux.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-lux.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"PLAYLOGIA-UNIQUECASINO-STAGE":{"lid":"1231","secretKey":"sokWscJlFnW9AeVy5jI6WOPOXGmYrT9c","baseUrl":"https:\\/\\/stage-game-launcher-lux.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-lux.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-lux.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"PLAYLOGIA-CASINOINTENSE-STAGE":{"lid":"1234","secretKey":"6mnWdI16f8HsqrnDOmBszw4kX2oGEePb","baseUrl":"https:\\/\\/stage-game-launcher-lux.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-lux.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-lux.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"PLAYLOGIA-PLAYREGAL-STAGE":{"lid":"1280","secretKey":"GacLAjRuRA5I8eSszywawfuosK7aNMAg","baseUrl":"https:\\/\\/stage-game-launcher-lux.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-lux.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-lux.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"GML-STAGE":{"lid":"1154","secretKey":"JSi0APhTlu1ifYilqgpvDfexPoQSNJXw","baseUrl":"https:\\/\\/stage-game-launcher-sg.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-sg.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-sg.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"SOFTG-STAGE":{"lid":"1200","secretKey":"ErVjvs1fLZfsh3qLBE5b2j6iHB1U31UG","baseUrl":"https:\\/\\/stage-game-launcher-sg.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-sg.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-sg.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"SOFTSWISS-STAGE":{"lid":"1158","secretKey":"qWfNxiJHswdRw5paDXGiSJyEjflWjRvb","baseUrl":"https:\\/\\/stage-game-launcher-lux.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-lux.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-lux.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"AZUROLONGO-STAGE":{"lid":"1227","secretKey":"qFbjsIpu9nnHYpSDfI2BYLFxT4JBueSO","baseUrl":"https:\\/\\/stage-game-launcher-lux.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-lux.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-lux.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"GAMBLINGTEC-STAGE":{"lid":"1305","secretKey":"zfJsoXZQFLZRyDYlfDp0jOFBFVuewZ2g","baseUrl":"https:\\/\\/stage-game-launcher-lux.isoftbet.com\\/","apiUrl":"https:\\/\\/promoapi-mbo-aws2.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-lux.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"FULLFORCE-STAGE":{"lid":"1306","secretKey":"cQpfbbhzHLOOSFWJhFPyCsXWVERGIsKQ","baseUrl":"https:\\/\\/stage-game-launcher-sg.isoftbet.com\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-sg.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-sg.isoftbet.com\\/Xml"},"freerounds_intermediate_results_enabled":true},"EUR-localtestuser":{"lid":"6","secretKey":"NOXLhcZhGwc5","baseUrl":"https:\\/\\/aggr-bo-prod.reevotech.com\\/isblauncher\\/","apiUrl":"https:\\/\\/stage-promoapi-mbo-lux.isoftbet.com","currency":"EUR","ip_whitelist":["176.65.77.56","127.0.0.1","192.168.1.1","10.100.28.29","192.168.1.70","78.129.250.77","192.168.20.69","10.100.29.21","10.100.29.86","10.100.29.82","10.100.*","10.100.29.*","10.100.29*","*","3.66.134.90","3.64.203.101"],"jackpot_feed_settings":{"url":"https:\\/\\/feeds-lux.isoftbet.com\\/Xml"}}}'),
	(13, 'prohibited_passwords', NULL, '["123456","Password","12345678","qwerty","12345","123456789","letmein","1234567","football","iloveyou","admin","welcome","monkey","login","abc123","starwars","123123","dragon","passw0rd","master","hello","freedom","whatever","qazwsx","trustno1","querty","quertz"]'),
	(21, 'rr', NULL, '{"EUR":{"url":"https:\\/\\/example.com\\/ws\\/ServiceManager","partnerid":44,"md5":"asdadas","lobby":"http:\\/\\/test.italypoker.it\\/www\\/Lobby?_key=","casino":{"url":"https:\\/\\/example.com:8080\\/services\\/ServiceManager","partnerid":44,"md5":"asdasdasd","lobby":"http:\\/\\/test.cslivegames.com\\/www\\/games.php"}},"cert":{"url":"https:\\/\\/example.com\\/ws\\/ServiceManager","partnerid":44,"md5":"asdasdsad","lobby":"https:\\/\\/example.com\\/www\\/Lobby?_key="}}'),
	(45, 'provider_ez', NULL, '{"_providerCurrencies":{"1":"EUR"},"EUR":{"url":"https:\\/\\/example.com\\/common\\/operator_proxy.php?","url_balance":"https:\\/\\/example.com:8080\\/GameServer\\/OperatorGateController","hashId":"?","salt":"?","operatorId":10453002,"currencycode":"EUR","APIUrl":"https:\\/\\/example.com\\/api\\/","APIID":"10928301293-12312","APIUser":"sOmetin","APIAccess":"loremipsem91021dolori","studio":{"VideoSlots":{"url_studio":"https:\\/\\/playint.tableslive.com\\/"}}},"AZUROLONGO-LUCKY8-STAGE":{"url":"https:\\/\\/aggr.reeltech.co\\/api\\/seamless\\/ez\\/","url_balance":"","hashId":"ebOx7hkBcoDB1U5cVDWJegEYJW2dVnLr","salt":"","operatorId":10453001,"currencycode":"EUR","APIUrl":"https:\\/\\/boint.tableslive.com\\/api\\/get\\/","APIID":"10453001-2a763256","APIUser":"lucky8","studio":{"slots":{"url_studio":"https:\\/\\/playint.tableslive.com\\/"}},"APIAccess":"4b63753c57e85381a599cfbca8a2550960acad1db136198d8d9e9a01f43fa80e"},"AZUROLONGO-STAGE":{"studio":{"VideoSlots":{"url_studio":"https:\\/\\/playint.tableslive.com\\/"},"slots":{"url_studio":"https:\\/\\/playint.tableslive.com\\/"}},"url":"https:\\/\\/aggr.reeltech.co\\/api\\/seamless\\/ez\\/","url_balance":"","hashId":"ebOx7hkBcoDB1U5cVDWJegEYJW2dVnLr","salt":"","operatorId":10453004,"currencycode":"EUR","APIUrl":"https:\\/\\/boint.tableslive.com\\/api\\/get\\/","APIID":"10453002-7039c33d","APIUser":"cresusonlinecasino","APIAccess":"35612c51097a705643b331b5b20ac4ae0264075db9896fb0d1fd19933ea0a00d"},"AZUROLONGO-TORTUGA-STAGE":{"studio":{"VideoSlots":{"url_studio":"https:\\/\\/playint.tableslive.com\\/"}},"url":"https:\\/\\/aggr.reeltech.co\\/api\\/seamless\\/ez\\/","url_balance":"","hashId":"ebOx7hkBcoDB1U5cVDWJegEYJW2dVnLr","salt":"","operatorId":10453003,"currencycode":"EUR","APIUrl":"https:\\/\\/boint.tableslive.com\\/api\\/get\\/","APIID":"10453003-f0d391db","APIUser":"tortuga","APIAccess":"116272267c46639b7e5a16fa77a5a8f8b68eaf6b5a0cc961baa6e294c1984439"},"AZUROLONGO-CASINOPRIVE-STAGE":{"url":"https:\\/\\/aggr.reeltech.co\\/api\\/seamless\\/ez\\/","studio":{"slots":{"url_studio":"https:\\/\\/playint.tableslive.com\\/"}},"url_balance":"","hashId":"ebOx7hkBcoDB1U5cVDWJegEYJW2dVnLr","salt":"","operatorId":10453002,"currencycode":"EUR","APIUrl":"https:\\/\\/boint.tableslive.com\\/api\\/get\\/","APIID":"10453004-c4a621eb","APIUser":"azurolongo","APIAccess":"ca961d04ef82fb1f38acce130c093905882269b0db0314502f3db8c5a44051ec"}}'),
	(57, 'provider_bs', NULL, '{"EUR":{"params":{"url":"https:\/\/reevo-gp3.discreetgaming.com\/","url_freerounds":"http:\/\/10.1.1.66:8000\/provider\/bs","bankId":"6696","secretkey":"0sVPpXRj3MEUpwrT"},"auth":{"usr":"test","passw":"test"},"jackpot_feed_settings":{"url1":"https:\/\/reevo-gp3.discreetgaming.com\/jackpots\/jackpots_6696.xml","url2":"https:\/\/reevo-gp3.discreetgaming.com\/jackpots\/jackpots3_6696.xml","url3":"https:\/\/reevo-gp3.discreetgaming.com\/jackpots\/jackpots4_6696.xml"}}}'),
	(107, 'provider_fg', NULL, '{"EUR":{"baseUrl":"https:\\/\\/gs.fugaso.com\\/fugaso-play\\/launcher.html","operatorId":"4660601","key":"rNehGdGfOjPUl8Try42LubJzPIXoGA","jackpot_feed_settings":{"url":"https:\\/\\/fugaso.com\\/DevJackpotApi.php"}},"TABELLA-KINGCHANCE-STAGE":{"baseUrl":"https:\\/\\/gs.fugaso.com\\/fugaso-play\\/launcher.html","operatorId":"4783256","key":"JeExak0kEv6MFnz6ql0rnUdlK2yNMm","jackpot_feed_settings":{"url":"https:\\/\\/fugaso.com\\/DevJackpotApi.php"}},"770-STAGE":{"baseUrl":"https:\\/\\/gs.fugaso.com\\/fugaso-play\\/launcher.html","operatorId":"4783265","key":"z65Vgjo2ZU3CobaF7HfvfUp7RHuqir","jackpot_feed_settings":{"url":"https:\\/\\/fugaso.com\\/DevJackpotApi.php"}}}'),
	(109, 'provider_be', NULL, '{"EUR":{"api_url":"https:\\/\\/example.com\\/back","secret_key":"adasd-123123-asdasdsa-123","expire_period_time":60,"timezone_UTC":2,"partner_codes":{"1":"blueocean_lucky7","3":"blueocean_lucky5","4":"blueocean_dice","5":"blueocean_bop","6":"blueocean_bob","lobby":"blueocean"}}}'),
	(113, 'provider_ha', NULL, '{"EUR":{"theirWS":{"url":"https:\\/\\/example.com\\/hosted.asmx","apikey":"9817982sahjdkhasd"},"brandid":"lhdkasdas-dljaslkdjaskl","game_launch_base":"https:\\/\\/example.com\\/go.ashx","passkey":"asdasdas","jackpot_feed_settings":{"url":"https:\\/\\/example.com\\/jsonapi\\/GetJackpots"}}}'),
	(131, 'provider_lucky_seamless', NULL, '{"EUR": {"admin": "http://10.1.1.66:8000/provider/lu","report": "https://staging.lucky897.com/rgs/api/report.js","auth": {"usr": "reevo_aggregation_lu_eur_s","passw": "reevo_ngfv0vstt9yzprm0"},"salt": "9fr0xq0nblSsXjPBa7DlKOjC","force_to_agent": false}}'),
	(137, 'provider_ep', NULL, '{"EUR":{"apiUrl":"https:\\/\\/example.com\\/game\\/","projectId":"9879","secretKey":"lkajsdas897","apiVersion":"1","denomination":"0.5","salt":"evo_salt"}}'),
	(139, 'provider_gb', NULL, '{"EUR":{"url":"https:\\/\\/api.intgr.booming-games.com\\/","api_login":"VpqC\\/fLVCJoV2Hym7FD9PQ==","api_password":"NdDm72KjgNgt\\/XPgkBZGTY7I+tBZsNvsyW4A8k26YhmNIILnGG\\/O1duGA6QLfK26","rollback":"https:\\/\\/aggr.reeltech.co\\/api\\/seamless\\/gb\\/rollback","ourCallbackUrl":"https:\\/\\/aggr.reeltech.co\\/api\\/seamless\\/gb"},"DEMO":{"url":"https:\\/\\/api.intgr.booming-games.com\\/","api_login":"VpqC\\/fLVCJoV2Hym7FD9PQ==","api_password":"NdDm72KjgNgt\\/XPgkBZGTY7I+tBZsNvsyW4A8k26YhmNIILnGG\\/O1duGA6QLfK26","rollback":"https:\\/\\/aggr.reeltech.co\\/api\\/seamless\\/gb\\/rollback","ourCallbackUrl":"https:\\/\\/aggr.reeltech.co\\/api\\/seamless\\/gb"},"JOEFORTUNE-STAGE":{"url":"https:\\/\\/api.intgr.booming-games.com\\/","api_login":"h9AkF2f591KkEkmdr1cMCQ==","api_password":"HZtSW1X5nPil0TJonb7AF\\/d6Sl93v6VR0\\/gPykMBnomBiS+7CKXKdgy4es\\/9+WQP","rollback":"https:\\/\\/aggr.reeltech.co\\/api\\/seamless\\/gb\\/rollback","ourCallbackUrl":"https:\\/\\/aggr.reeltech.co\\/api\\/seamless\\/gb"},"SOFTMAYA-STAGE":{"url":"","api_login":"","api_password":"","rollback":"","ourCallbackUrl":""}}'),
	(153, 'provider_ds', NULL, '{"EUR":{"game_url":"https:\\/\\/example.com\\/","mobile_url":"https:\\/\\/example.com\\/","key":"123456","view":"european","history":"https:\\/\\/example.com\\/v1\\/json\\/b2b\\/export\\/get-bet-details","app-key":"$1aslasdkasdjlaksda"}}'),
	(171, 'provider_wz', NULL, '{"EUR":{"host":"https:\\/\\/gl-staging.wazdanep.com","partnercode":"ervvag8q","partnercodeapi":"reevo_casino770","partnername":"reevo_casino770","licence":"curacao","licenceapi":"curacao","serviceAPI":"https:\\/\\/service-stage.wazdanep.com","secretKey":"LousiCmYw4U8vWJd4Bm6thnyQyVai9PO"},"770-STAGE":{"host":"https:\\/\\/gl-staging.wazdanep.com","partnercode":"ervvag8q","partnercodeapi":"reevo_casino770","partnername":"reevo_casino770","licence":"curacao","licenceapi":"curacao","serviceAPI":"https:\\/\\/service-stage.wazdanep.com","secretKey":"LousiCmYw4U8vWJd4Bm6thnyQyVai9PO"},"DEMO":{"host":"https:\\/\\/gl-staging.wazdanep.com","partnercode":"ervvag8q","partnercodeapi":"reevo_casino770","partnername":"reevo_casino770","licence":"curacao","licenceapi":"curacao","serviceAPI":"https:\\/\\/service-stage.wazdanep.com","secretKey":"LousiCmYw4U8vWJd4Bm6thnyQyVai9PO"},"ROO-STAGE":{"host":"https:\\/\\/gl-staging.wazdanep.com","partnercode":"pxxrz8l3","partnercodeapi":"reevo_roocasino","partnername":"reevo_roocasino","licence":"curacao","licenceapi":"curacao","serviceAPI":"https:\\/\\/service-stage.wazdanep.com","secretKey":"z1k0AWgxWKgxI4ZVLViBDipxk2wCu0Jv"},"GML-STAGE":{"host":"https:\\/\\/gl-staging.wazdanep.com","partnercode":"vtbqktx5","partnercodeapi":"reevo_gml","partnername":"reevo_gml","licence":"curacao","licenceapi":"curacao","serviceAPI":"https:\\/\\/service-stage.wazdanep.com","secretKey":"CousiCmYw4U8vWJd4Dm6thnyQyVai9PO"},"GAMBLINGTEC-FUZEBET-STAGE":{"host":"https:\\/\\/gl-staging.wazdanep.com","partnercode":"x9nwfm8a","partnercodeapi":"fuzebet","partnername":"fuzebet","licence":"curacao","licenceapi":"curacao","serviceAPI":"https:\\/\\/service-stage.wazdanep.com","secretKey":"sD6RXu3rk1od2WRc0b0be25Wqv0sRq9M"},"GAMBLINGTEC-SUN7LOTTERY-STAGE":{"host":"https:\\/\\/gl-staging.wazdanep.com","partnercode":"x9nwfm8a","partnercodeapi":"sun7lottery","partnername":"sun7lottery","licence":"curacao","licenceapi":"curacao","serviceAPI":"https:\\/\\/service-stage.wazdanep.com","secretKey":"jgduSlfowUh5PgcANfDcNxYbbAgnUVfj"},"GAMBLINGTEC-GPANEL-DEMO-STAGE":{"host":"https:\\/\\/gl-staging.wazdanep.com","partnercode":"x9nwfm8a","partnercodeapi":"gpanel","partnername":"gpanel","licence":"curacao","licenceapi":"curacao","serviceAPI":"https:\\/\\/service-stage.wazdanep.com","secretKey":"tW7SJA6Hhi3KlwqESA8E0dXlcC9PwxjW"},"TABELLA-KINGSCHANCE-STAGE":{"host":"https:\\/\\/gl-staging.wazdanep.com","partnercode":"pahjp3ej","partnercodeapi":"kingschance","partnername":"kingschance","licence":"curacao","licenceapi":"curacao","serviceAPI":"https:\\/\\/service-stage.wazdanep.com","secretKey":"OjnxyCGsnrEHH187Esq3HKgmPzrBSEkU"}}'),
    (172, 'provider_hs', NULL, '{"EUR":{"game_url":"","secret":"abc123","partnerid":"123"},"DEMO":{"game_url":"","secret":"abc123","partnerid":"123"}}'),
	(183, 'provider_bn', NULL, '{"EUR":{"url": "https://alfred-stage.betsrv.com/launcher/blueocean-reeltech-dev/2378", "auth": {"api_login": "boongoSTAGING", "api_password": "boongoPWD"}, "salt": "O9Jx2j0aje", "api_url": "http://10.1.1.66:8000/provider/bn", "callerId": "boongoSTAGING", "callerPassword": "boongoPWD"}}'),
	(191, 'provider_fz', NULL, '{"EUR":{"url":"https:\\/\\/igpcasino770.fazi.rs\\/Home\\/IntegrationGameLaunchCcy","auth":{"api_login":"fazidev","api_password":"fazidev"},"salt":"fazidev","jackpot_feed_settings":{"url":"https:\\/\\/igpcasino770.fazi.rs\\/vltapi\\/integration\\/postjackpotsapi","name":"igpstaging"}},"EUR-OLD":{"url":"https:\\/\\/igpstaging2.fazi.rs\\/Home\\/IntegrationGameLaunchCcy","auth":{"api_login":"fazidev","api_password":"fazidev"},"salt":"fazidev","jackpot_feed_settings":{"url":"https:\\/\\/igpstagingeur2.fazi.rs\\/vltapi\\/integration\\/postjackpotsapi","name":"igpstaging"}}}'),
	(195, 'provider_rk', NULL, '{"EUR":{"endpoint":"https:\\/\\/dev.redrakegaming.com\\/rrgreevo\\/","frendpoint":"https:\\/\\/devapi.redrakegaming.com\\/frb-auth.php","gamesendpoint":"https:\\/\\/devapi.redrakegaming.com\\/games-auth.php","replayendpoint":"https:\\/\\/dev.redrakegaming.com\\/bet_viewer.php?","ba_username":"reevo","ba_password":"kah%&sdf9","secret":"356aa764fab2344abb45566d430844ab","fr_username":"reevo","fr_password":"kah%&sdf9","operator":"casino770"},"BCT-STAGE":{"endpoint":"https:\\/\\/dev.redrakegaming.com\\/rrgreevo\\/","frendpoint":"https:\\/\\/devapi.redrakegaming.com\\/frb-auth.php","gamesendpoint":"https:\\/\\/devapi.redrakegaming.com\\/games-auth.php","replayendpoint":"https:\\/\\/dev.redrakegaming.com\\/bet_viewer.php?","ba_username":"reevo","ba_password":"kah%&sdf9","secret":"356aa764fab2344abb45566d430844ab","fr_username":"reevo","fr_password":"dfgh%&dsd","operator":"bluechameleon"},"SPINMAD-STAGE":{"endpoint":"https:\\/\\/dev.redrakegaming.com\\/rrgreevo\\/","frendpoint":"https:\\/\\/devapi.redrakegaming.com\\/frb-auth.php","gamesendpoint":"https:\\/\\/devapi.redrakegaming.com\\/games-auth.php","replayendpoint":"https:\\/\\/dev.redrakegaming.com\\/bet_viewer.php?","ba_username":"reevo","ba_password":"kah%&sdf9","secret":"356aa764fab2344abb45566d430844ab","fr_username":"reevo","fr_password":"kah%&sdf9","operator":"spinmadness"},"GML-STAGE":{"endpoint":"https:\\/\\/dev.redrakegaming.com\\/rrgreevo\\/","frendpoint":"https:\\/\\/devapi.redrakegaming.com\\/frb-auth.php","gamesendpoint":"https:\\/\\/devapi.redrakegaming.com\\/games-auth.php","replayendpoint":"https:\\/\\/dev.redrakegaming.com\\/bet_viewer.php?","ba_username":"reevo","ba_password":"Ofgh%&dsd","secret":"356aa764fab2344abb45566d430844ab","fr_username":"reevo","fr_password":"Ofgh%&dsd","operator":"gml"}}'),
	(197, 'provider_bindings', '', '{"alternate_config":{"xx":[],"sp":{"55":{"EUR":"EUR"}},"mn":{"55":{"EUR":"EUR"}},"re":{"55":{"EUR":"EUR"}},"ne":{"55":{"EUR":"EUR"}},"or":{"55":{"EUR":"EUR"}},"bs":{"55":{"EUR":"EUR"}},"lu":{"55":{"EUR":"EUR"}},"gb":{"55":{"EUR":"EUR"}},"wz":{"55":{"EUR":"EUR"}},"rk":{"55":{"EUR":"EUR"}},"bn":{"55":{"EUR":"EUR"}},"py":{"55":{"EUR":"EUR"}},"gv":{"55":{"EUR":"EUR"}},"is":{"55":{"EUR":"EUR"}},"fg":{"55":{"EUR":"EUR"}}},"supported_currencies":{"gb":["USD","EUR"],"go":["USD","EUR"],"gv":["USD","EUR"],"lu":["USD","EUR"],"pa":["USD","EUR"],"fz":["EUR"],"bn":["USD","EUR"],"is":["USD","EUR"],"fg":["USD","EUR"],"gs":["EUR"],"bs":["EUR"],"rk":["USD","EUR"],"wz":["USD","EUR"],"py":["USD","EUR"],"xg":["USD","EUR"]},"supported_languages":{"ne":["br","bg","hr","cs","da","nl","en","et","fi","fr","de","el","iw","hu","it","no","pl","pt","ro","ru","cn","sk","es","sv","tr"],"or":["br","bg","hr","nl","en","de","it","cn"],"or_default":"en"},"currencies":{"th":{"TEU":"tEUR"},"fg":{"TEU":"tEUR"},"gv":{"TEU":"tEUR"},"lu":{"TEU":"tEUR"},"rk":{"TEU":"TEUR"},"pa":{"TEU":"tEUR"},"mt":{"TEU":"tEUR"},"is":{"TEU":"tEUR"},"fz":{"TEU":"tEUR"},"bs":{"TEU":"TUR"},"bn":{"TEU":"tEUR"},"gb":{"TEU":"TEUR"},"gs":{"TEU":"tEUR"},"wz":{"TEU":"tEUR"},"py":{"TEU":"TKN"},"sv":{"TEU":"tEUR"}},"languages":{"yg":{"cn":"zh"},"gs":{"en":"zh"}}}'),
    (198, 'provider_xg', NULL,'{"EUR":{"game_url":"https://1x2networkhubstage.com/f1x2games/loadGame.jsp","api_url":"","site_id":"4788","key":"secretKey"}}'),
	(199, 'provider_gv', NULL, '{"EUR":{"url":"https:\\/\\/bornlucky-test-lon.gamevy.com\\/reevo\\/gps","auth":{"api_login":"reevo","api_password":"WVAtcDYWxGVKSBwEudU3b"},"salt":"U7qbRjbt","api_url":"https:\\/\\/bornlucky-test-lon.gamevy.com\\/reevo\\/reports\\/gps","callerId":"reevo","callerPassword":"8JEMf3nnt8AbuHYXS7aSC"},"TABELLA-STAGE":{"url":"https:\\/\\/bornlucky-staging-euwest2.gamevy.com\\/reevo\\/gps","auth":{"api_login":"reevo","api_password":"WVAtcDYWxGVKSBwEudU3b"},"salt":"U7qbRjbt","api_url":"https:\\/\\/bornlucky-staging-euwest2.gamevy.com\\/reevo\\/reports\\/gps","callerId":"reevo","callerPassword":"8JEMf3nnt8AbuHYXS7aSC"},"GAMBLINGTEC-FUZEBET-STAGE":{"url":"https:\\/\\/bornlucky-staging-euwest2.gamevy.com\\/reevo\\/gps","auth":{"api_login":"reevo","api_password":"WVAtcDYWxGVKSBwEudU3b"},"salt":"U7qbRjbt","api_url":"https:\\/\\/bornlucky-staging-euwest2.gamevy.com\\/reevo\\/reports\\/gps","callerId":"reevo","callerPassword":"8JEMf3nnt8AbuHYXS7aSC"},"GAMBLINGTEC-SUN7LOTTERY-STAGE":{"url":"https:\\/\\/bornlucky-staging-euwest2.gamevy.com\\/reevo\\/gps","auth":{"api_login":"reevo","api_password":"WVAtcDYWxGVKSBwEudU3b"},"salt":"U7qbRjbt","api_url":"https:\\/\\/bornlucky-staging-euwest2.gamevy.com\\/reevo\\/reports\\/gps","callerId":"reevo","callerPassword":"8JEMf3nnt8AbuHYXS7aSC"},"GAMBLINGTEC-GPANELDEMO-STAGE":{"url":"https:\\/\\/bornlucky-staging-euwest2.gamevy.com\\/reevo\\/gps","auth":{"api_login":"reevo","api_password":"WVAtcDYWxGVKSBwEudU3b"},"salt":"U7qbRjbt","api_url":"https:\\/\\/bornlucky-staging-euwest2.gamevy.com\\/reevo\\/reports\\/gps","callerId":"reevo","callerPassword":"8JEMf3nnt8AbuHYXS7aSC"}}'),
	(201, 'admin_global_config_log', NULL, '{"enabled":true}'),
	(203, 'admin_config_code_log', NULL, '["ez","bn","bs","dr","fz","gb","go","gv","ip","is","lu","ma","mt","no","p0","pa","pp","py","rk","sv","th","wz","xg"]'),
	(205, 'provider_go', NULL, '{"EUR":{"url":"https:\\/\\/staging-backend.gamingcorpscasino.com\\/third_parties\\/reevo\\/","auth":{"api_login":"reevo","api_password":"YYLc8kSyZkEc"},"salt":"NZzEeEI7Hr03","callerId":"reevo","callerPassword":"YYLc8kSyZkEc"},"770-STAGE":{"url":"https:\\/\\/staging-backend.gamingcorpscasino.com\\/third_parties\\/reevo\\/","auth":{"api_login":"reevo_casino770","api_password":"LnTqgWtzN9qzZB5q"},"salt":"k3DtHYHdWbgyL4Nu","callerId":"reevo_casino770","callerPassword":"LnTqgWtzN9qzZB5q"},"PLAYLOGIA-MACHANCE-STAGE":{"url":"https:\\/\\/staging-backend.gamingcorpscasino.com\\/third_parties\\/reevo\\/","auth":{"api_login":"reevo_machance","api_password":"YYLc8kSyZkEc"},"salt":"NZzEeEI7Hr03","callerId":"reevo_machance","callerPassword":"YYLc8kSyZkEc"},"PLAYLOGIA-VEGASPLUS-STAGE":{"url":"https:\\/\\/staging-backend.gamingcorpscasino.com\\/third_parties\\/reevo\\/","auth":{"api_login":"reevo_vegasplus","api_password":"2WBBKjrUvcSZ7gEt"},"salt":"J9u7Kg7MYCcz942k","callerId":"reevo_vegasplus","callerPassword":"2WBBKjrUvcSZ7gEt"},"PLAYLOGIA-UNIQUECASINO-STAGE":{"url":"https:\\/\\/staging-backend.gamingcorpscasino.com\\/third_parties\\/reevo\\/","auth":{"api_login":"reevo_uniquecasino","api_password":"PEfWg3ZfnGSEwtPn"},"salt":"6GSqnF5yjnnuv6mU","callerId":"reevo_uniquecasino","callerPassword":"PEfWg3ZfnGSEwtPn"},"PLAYLOGIA-CASINOINTENSE-STAGE":{"url":"https:\\/\\/staging-backend.gamingcorpscasino.com\\/third_parties\\/reevo\\/","auth":{"api_login":"reevo_casinointense","api_password":"2ZnXKLN2EnjqG5xg"},"salt":"d8VVtEYV586e8sNG","callerId":"reevo_casinointense","callerPassword":"2ZnXKLN2EnjqG5xg"},"PLAYLOGIA-PLAYZAX-STAGE":{"url":"https:\\/\\/staging-backend.gamingcorpscasino.com\\/third_parties\\/reevo\\/","auth":{"api_login":"reevo_playzax","api_password":"24QK8QJxxt8pBm9f"},"salt":"7UC5QWcYfsHQ3aNx","callerId":"reevo_playzax","callerPassword":"24QK8QJxxt8pBm9f"},"PLAYLOGIA-PLAYREGAL-STAGE":{"url":"https:\\/\\/staging-backend.gamingcorpscasino.com\\/third_parties\\/reevo\\/","auth":{"api_login":"reevo_playregal","api_password":"az9d4k73zH6wWBPQ"},"salt":"dfjcbG2hwjCARAn2","callerId":"reevo_playregal","callerPassword":"az9d4k73zH6wWBPQ"},"GAMBLINGTEC-FUZEBET-STAGE":{"url":"https:\\/\\/staging-backend.gamingcorpscasino.com\\/third_parties\\/reevo\\/","auth":{"api_login":"reevo_fuzebet","api_password":"GtqB2kXhm5JGEDVg"},"salt":"AgtfUe6rh8Z8yJDv","callerId":"reevo_fuzebet","callerPassword":"GtqB2kXhm5JGEDVg"},"GAMBLINGTEC-SUN7LOTTERY-STAGE":{"url":"https:\\/\\/staging-backend.gamingcorpscasino.com\\/third_parties\\/reevo\\/","auth":{"api_login":"reevo_sun7lottery","api_password":"NeAyb53sevtA8h4V"},"salt":"F5tLKVkVc2DDLRSA","callerId":"reevo_sun7lottery","callerPassword":"NeAyb53sevtA8h4V"},"GAMBLINGTEC-GPANELDEMO-STAGE":{"url":"https:\\/\\/staging-backend.gamingcorpscasino.com\\/third_parties\\/reevo\\/","auth":{"api_login":"reevo_gpaneldemo","api_password":"u2ga94SR4Jpgq4Fv"},"salt":"qSHqzt3hKxfZRHqQ","callerId":"reevo_gpaneldemo","callerPassword":"u2ga94SR4Jpgq4Fv"}}'),
	(207, 'admin_setting_editor_last_visit', NULL, '{"username":"admin.remus","time":1645518567}'),
	(209, 'provider_ka', NULL, '{"EUR":{"url":"https:\\/\\/reevo.integration.test.kalambagames.com\\/games\\/url","auth":{"api_login":"3beWgexUNXnFRRGVzGrJzPxWLK8nvykY","api_password":"bq3XXfH27sxpfFeUD9i56d9r6v6sEjFV"},"salt":"vSkvWemcbd4r"}}'),
	(211, 'provider_p0', NULL, '{"EUR":{"apiurl":"https:\\/\\/api.prerelease-env.biz\\/IntegrationService\\/v3\\/http\\/CasinoGameAPI","gameLaunchUrl":"https:\\/\\/reevo.prerelease-env.biz","demoLaunchUrl":"https:\\/\\/reevo.prerelease-env.biz","secureLogin":"reevo_reevotest","secretKey":"testKey","params":{"url_playforfun":"https:\\/\\/example.com\\/","url_freerounds":"https:\\/\\/api.prerelease-env.biz\\/IntegrationService\\/v3\\/http\\/BSG\\/FreeRoundsBonusAPI\\/awardFRBonus","bankId":"test"},"auth":{"usr":"reevo_reevotest","passw":"testKey"}}}'),
	(213, 'provider_qr', NULL, '{"EUR":{"game_load":{"partnerid":1325,"operator":"reevoaggregation","baseurl":"https:\\/\\/d2drhksbtcqozo.cloudfront.net"},"their_api":{"username":"reevoaggregation","password":"lyJt7POAn78bsQkv","baseurl":"https:\\/\\/stag-casino-partner.api.relaxg.net:7000\\/papi\\/1.0"}}}'),
	(215, 'provider_dr', NULL, '{"EUR":{"salt":"eIBGUSOFpChYUdsH6X1rMfyH","base_url":"https:\\/\\/staging-api.dragongaming.com\\/v1","auth":{"api_key":"mBgtk1ROp1EJ6rEv"}},"DEMO":{"base_url":"https:\\/\\/staging-api.dragongaming.com\\/v1","auth":{"api_key":"mBgtk1ROp1EJ6rEv"}}}'),
	(216, 'provider_ak', NULL, '{"EUR":{"url":"https:\\/\\/rmpstage.kaga88.com\\/kaga\\/reevo","callerId":"dockerlocal_eur","callerPassword":"930b9bcf9d4a01f36d49f8862f5e8976d09ac263","salt":"316FAE7DED1FDE2675919B42871C72F8"},"DEMO":{"url":"https:\\/\\/rmpstage.kaga88.com\\/kaga\\/reevo","callerId":"dockerlocal_eur","callerPassword":"930b9bcf9d4a01f36d49f8862f5e8976d09ac263","salt":"316FAE7DED1FDE2675919B42871C72F8"}}'),
	(239, 'provider_rg', '', '{"EUR":{"host":"https:\\/\\/gamelaunch\\/URL","partner":"partner_string","gamelist":"https:\\/\\/gamelist\\/URL","username":"username_string","password":"password_string","promo_api_url":"https:\\/\\/promo_api\\/URL","promo_api_password":"promo_api_password_string","wlcode":"wlcode_string"},"REDGENN-REEVO-DEMO-CASINO":{"host":"https:\\/\\/static-stage.rowzone.tech\\/gm\\/index.html","partner":"reevo-staging","gamelist":"https:\\/\\/adm-stage.redgenn.com\\/admservice","username":"reevo","password":"erfz3d@d09c3","promo_api_url":"https:\\/\\/adm-stage.redgenn.com\\/admservice","promo_api_login":"reevo","promo_api_password":"erfz3d@d09c3","wlcode":"reevo.staging"},"770-STAGE":{"host":"https:\\/\\/static-stage.rowzone.tech\\/gm\\/index.html","partner":"reevo-staging","gamelist":"https:\\/\\/adm-stage.redgenn.com\\/admservice","username":"reevo","password":"erfz3d@d09c3","promo_api_url":"https:\\/\\/adm-stage.redgenn.com\\/admservice","promo_api_login":"reevo","promo_api_password":"erfz3d@d09c3","wlcode":"reevo.staging"}}'),
	(240, 'provider_th', NULL, '{"EUR": {"params": {"url":"https:\/\/gamelaunch\/URL","username":"username_string","secretkey":"secretTom"}}}'),
	(241, 'provider_sr', NULL, '{"EUR":{"theirWS":{"url":"https:\\/\\/example.com\\/hosted.asmx","apikey":"9817982sahjdkhasd"},"brandid":"lhdkasdas-dljaslkdjaskl","game_launch_base":"https:\\/\\/example.com\\/go.ashx","passkey":"asdasdas","jackpot_feed_settings":{"url":"https:\\/\\/example.com\\/jsonapi\\/GetJackpots"}}}'),
	(242, 'provider_er', NULL, '{"EUR":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"DEMO":{"demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"THRONE-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"BETSSON-B10-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"BETSSON-BETS10-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"BETSSON-CASINOMAXI-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"BETSSON-CASINOMETROPOL-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"BETSSON-MOBILBAHIS-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"JUPITECH-KINGBIT-DEV":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"JUPITECH-KINGBIT-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"X2DYNAMIC-X2TERMINAL-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"SLOTEGRATOR-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"HKBGAMING-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"GAMBLINGTEC-ULTRFAIR-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"GAMBLINGTEC-KINEKO-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"BETADAM-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"HAPPYBILLY-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110},"KGON-STAGE":{"baseUrl":"https://test.endorphina.network","demoUrl":"https://edemo.endorphina.com/api","secretKey":"B0CAEF49729B492EBA63C5CCBA9B40DE","nodeId":1296,"EdemoId":6110}}'),
    (243, 'provider_evolution_seamless', NULL,'{"EUR":{"path":"https:\/\/reevo.uat1.evo-test.com\/cgibin\/UserAuthentication?","host":"https:\/\/reevo.uat1.evo-test.com","authToken":"39H0JrDBzD50","casinoKey":"reevo00000000001","apiToken":"test123","auth":{"uaID":"test123","uaID_pass":"test123","euID":"test123"},"vip_gameids":[],"vip_bet_fee":0.1,"brandId":1,"brandSkin":1,"host_alternate_domain":"example.com","host_alternate_for_agents":["exampleagentusernamesartswith"],"host_alternate_for_countries":["xx","zz"],"host_alternate_client_redirect":1,"block_countries_for_agents":{"agentsusernames_starting_with*":["si"],"agentusernames2_starting_with*":["it"]}}}'),
    (244, 'provider_bf', NULL,'{"EUR":{"host":"https://gs-gammix-int.beefee.co.uk/gamehub/reevo","user":"igaming","license":"curacao","password":"ebuMWHN9XJk4PY9y","X-Api-Key":"igaming-api-key"}}'),
	(245, 'provider_pa', NULL,'{"EUR":{"url":"https://hubgames.stage.pariplaygames.com/api","user":"Casino770","password":"Casino770!"}}'),
	(246, 'provider_lk', NULL, '{"EUR":{"operatorname":"Reevo","operator_id":2082,"apiUrl":"https://live-api-ids.livepbt.com/ids/connect/","lobbyApiUrl":"https://live-api.livepbt.com/lobby/api/v4/lobby/games","auth":{"operator_client_id":"reevo_operator","operator_client_secret":"w3bRplUe7CZyI7n7M4Eo"},"force_to_agent":"","hmackey":"MqFg8dTvyF0om9UCh4oI"}}'),
    (247, 'provider_or', NULL, '{"EUR":{"base_url":"https://play-prodcopy.oryxgaming.com/agg_plus_public/launch/wallets/","wallet":"REEVO","namespace":"https://aggr.reeltech.co/api/seamless/or","auth":{"username":"reevo","pass":"test"}}}'),
    (248, 'provider_re', NULL, '{"EUR":{"path":"https:\/\/reevo.uat1.evo-test.com\/cgibin\/UserAuthentication?","host":"https:\/\/reevo.uat1.evo-test.com","authToken":"39H0JrDBzD50","casinoKey":"reevo00000000001","apiToken":"test123","auth":{"uaID":"test123","uaID_pass":"test123","euID":"test123"},"vip_gameids":[],"vip_bet_fee":0.1,"brandId":1,"brandSkin":1,"host_alternate_domain":"example.com","host_alternate_for_agents":["exampleagentusernamesartswith"],"host_alternate_for_countries":["xx","zz"],"host_alternate_client_redirect":1,"block_countries_for_agents":{"agentsusernames_starting_with*":["si"],"agentusernames2_starting_with*":["it"]}}}'),
    (249, 'provider_netent', NULL, '{"EUR":{"path":"https:\/\/reevo.uat1.evo-test.com\/cgibin\/UserAuthentication?","host":"https:\/\/reevo.uat1.evo-test.com","authToken":"39H0JrDBzD50","casinoKey":"reevo00000000001","apiToken":"test123","auth":{"uaID":"test123","uaID_pass":"test123","euID":"test123"},"vip_gameids":[],"vip_bet_fee":0.1,"brandId":1,"brandSkin":1,"host_alternate_domain":"example.com","host_alternate_for_agents":["exampleagentusernamesartswith"],"host_alternate_for_countries":["xx","zz"],"host_alternate_client_redirect":1,"block_countries_for_agents":{"agentsusernames_starting_with*":["si"],"agentusernames2_starting_with*":["it"]}}}'),
    (250, 'provider_mn', NULL, '{"EUR":{"path":"https:\/\/reevo.uat1.evo-test.com\/cgibin\/UserAuthentication?","host":"https:\/\/reevo.uat1.evo-test.com","authToken":"39H0JrDBzD50","casinoKey":"reevo00000000001","apiToken":"test123","auth":{"uaID":"test123","uaID_pass":"test123","euID":"test123"},"vip_gameids":[],"vip_bet_fee":0.1,"brandId":1,"brandSkin":1,"host_alternate_domain":"example.com","host_alternate_for_agents":["exampleagentusernamesartswith"],"host_alternate_for_countries":["xx","zz"],"host_alternate_client_redirect":1,"block_countries_for_agents":{"agentsusernames_starting_with*":["si"],"agentusernames2_starting_with*":["it"]}}}'),
    (251, 'provider_sp', NULL, '{"EUR":{"partnerId":"Reevo-agg-test","privateKey":"b2X9LqtwuP9LqNxU","launchUrl":"https://api-test.spinomenal.com/gamelauncher/","freerounds":"https://api-test.spinomenal.com/Promotions/","history":"http://visualizer.test.spinomenal.com/TicketAnalyzer/"}}'),
    (193, 'provider_mt', '', '{"EUR":{"host":"https://staging.mrslotty.com/integrations/reevo/rpc","secret":"2853418a-7cd5-4979-94b6-a7742121b1a9","hmac_salt":"fc276f32-2df2-4f4a-a630-ec3346817780","history_url":"https://play-staging.mrslotty.com/history/details/"}}');

/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.shift_report
DROP TABLE IF EXISTS `shift_report`;
CREATE TABLE IF NOT EXISTS `shift_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currentdate` datetime NOT NULL,
  `fname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `shiftstartdate` datetime NOT NULL,
  `shiftenddate` datetime NOT NULL,
  `startbalance` decimal(15,2) NOT NULL,
  `deposit` decimal(15,2) NOT NULL,
  `withdraw` decimal(15,2) NOT NULL,
  `net` decimal(15,2) NOT NULL,
  `endbalance` decimal(15,2) NOT NULL,
  `platformid` int(11) NOT NULL,
  `agentid` int(11) NOT NULL,
  `drawer_balance_start` decimal(15,2) DEFAULT '0.00',
  `drawer_balance_end` decimal(15,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.shift_report: ~0 rows (approximately)
/*!40000 ALTER TABLE `shift_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `shift_report` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.shop
DROP TABLE IF EXISTS `shop`;
CREATE TABLE IF NOT EXISTS `shop` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `oid` int(6) NOT NULL,
  `asid` varchar(128) NOT NULL,
  `pid` int(7) NOT NULL,
  `aid` int(7) NOT NULL,
  `name` varchar(128) NOT NULL,
  `qty` int(6) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.shop: ~0 rows (approximately)
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.site_menu
DROP TABLE IF EXISTS `site_menu`;
CREATE TABLE IF NOT EXISTS `site_menu` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `href` varchar(100) NOT NULL,
  `system` varchar(2) NOT NULL,
  `class` varchar(50) NOT NULL,
  `order` int(6) NOT NULL,
  `platform` varchar(30) NOT NULL COMMENT 'which platform menu tab belongs to',
  `url` varchar(200) NOT NULL,
  `name2` varchar(200) NOT NULL,
  `date_added` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `system` (`system`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.site_menu: ~0 rows (approximately)
/*!40000 ALTER TABLE `site_menu` DISABLE KEYS */;
REPLACE INTO `site_menu` (`id`, `name`, `href`, `system`, `class`, `order`, `platform`, `url`, `name2`, `date_added`) VALUES
	(1, 'Playson', '', 'py', '', 0, '', '', '', '2022-08-03'),
	(2, 'Wazdan', '', 'wz', '', 0, '', '', '', '2022-08-03'),
	(3, 'Reevo', '', 'lu', '', 0, '', '', '', '2022-08-03'),
	(4, 'Fugaso', '', 'fz', '', 0, '', '', '', '2022-08-03'),
	(5, 'Ezugi', '', 'ez', '', 0, '', '', '', '2022-08-03'),
	(6, 'Dragon Gaming', '', 'dr', '', 0, '', '', '', '2022-08-03'),
	(7, 'Booming Games', '', 'gb', '', 0, '', '', '', '2022-08-03'),
	(8, '1x2 Gaming', '', 'xg', '', 0, '', '', '', '2022-08-03'),
	(9, 'Gamevy', '', 'gv', '', 0, '', '', '', '2022-08-03'),
	(10, 'Booongo', '', 'bn', '', 0, '', '', '', '2022-08-03'),
	(11, 'KA Gaming', '', 'ak', '', 0, '', '', '', '2022-08-03'),
	(12, 'isoftbet', '', 'is', '', 0, '', '', '', '2022-08-03'),
	(13, 'Kalamba', '', 'ka', '', 0, '', '', '', '2022-08-03'),
	(14, 'Fugaso Gaming', '', 'fg', '', 0, '', '', '', '2022-08-03'),
	(15, 'Pragmatic Play', '', 'p0', '', 0, '', '', '', '2022-08-03'),
	(16, 'Reevo Premium', '', 'rl', '', 0, '', '', '', '2022-08-03'),
	(17, 'Redgenn', '', 'rg', '', 0, '', '', '', '2022-08-03'),
	(18, 'EvoPlay', '', 'ep', '', 0, '', '', '', '2022-08-03'),
    (19, 'Endorphina', '', 'er', '', 0, '', '', '', '2022-08-03'),
    (20, 'Spribe', '', 'sr', '', 0, '', '', '', '2022-08-03'),
    (21, 'Fazi', '', 'fz', '', 0, '', '', '', '2022-08-03'),
    (22, 'Hacksaw', '', 'hs', '', 0, '', '', '', '2022-08-03'),
    (23, 'Habanero', '', 'ha', '', 0, '', '', '', '2022-08-03'),
    (24, 'Gaming Corp', '', 'go', '', 0, '', '', '', '2022-09-16'),
    (25, 'TomHorn', '', 'th', '', 0, '', '', '', '2022-09-16'),
    (26, 'Betsoft', '', 'bs', '', 0, '', '', '', '2022-09-16'),
    (27, 'Evolution', '', 'es', '', 0, '', '', '', '2022-09-16'),
    (28, 'BF Games', '', 'bf', '', 0, '', '', '', '2022-09-16'),
	(29, 'Pariplay', '', 'pa', '', 0, '', '', '', '2022-09-16'),
    (30, 'Lucky Streak','','lk','',0,'','','', now()),
    (31, 'Oryx', '', 'or', '', 0, '', '', '', now()),
    (32, 'Netent', '', 'ne', '', 0, '', '', '', now()),
    (33, 'Red Tiger', '', 're', '', 0, '', '', '', now()),
    (34, 'Big Time Gaming', '', 'mn', '', 0, '', '', '', now()),
    (35, 'Spinomenal', '', 'sp', '', 0, '', '', '', now()),
    (36, 'MrSlotty', '', 'mt', '', 0, '', '', '', now()),
    (37, 'BetGames', '', 'be', '', 0, '', '', '', now());

/*!40000 ALTER TABLE `site_menu` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.skin_conf_cat
DROP TABLE IF EXISTS `skin_conf_cat`;
CREATE TABLE IF NOT EXISTS `skin_conf_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.skin_conf_cat: ~0 rows (approximately)
/*!40000 ALTER TABLE `skin_conf_cat` DISABLE KEYS */;
REPLACE INTO `skin_conf_cat` (`id`, `name`, `enabled`, `updated`) VALUES
	(1, 'CDNglobal', 1, 1475228188);
/*!40000 ALTER TABLE `skin_conf_cat` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.skin_conf_fields
DROP TABLE IF EXISTS `skin_conf_fields`;
CREATE TABLE IF NOT EXISTS `skin_conf_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `additional` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.skin_conf_fields: ~0 rows (approximately)
/*!40000 ALTER TABLE `skin_conf_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `skin_conf_fields` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.skin_conf_values
DROP TABLE IF EXISTS `skin_conf_values`;
CREATE TABLE IF NOT EXISTS `skin_conf_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `value_int` int(11) DEFAULT NULL,
  `value_varchar` varchar(255) DEFAULT NULL,
  `value_text` text,
  `value_date` date DEFAULT NULL,
  `value_time` time DEFAULT NULL,
  `value_datetime` datetime DEFAULT NULL,
  `value_float` float DEFAULT NULL,
  `value_bool` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.skin_conf_values: ~0 rows (approximately)
/*!40000 ALTER TABLE `skin_conf_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `skin_conf_values` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.skin_menu
DROP TABLE IF EXISTS `skin_menu`;
CREATE TABLE IF NOT EXISTS `skin_menu` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `title` varchar(60) CHARACTER SET utf8 NOT NULL,
  `href` varchar(100) CHARACTER SET utf8 NOT NULL,
  `class1` varchar(100) CHARACTER SET utf8 NOT NULL,
  `picture1` varchar(100) CHARACTER SET utf8 NOT NULL,
  `class2` varchar(100) CHARACTER SET utf8 NOT NULL,
  `picture2` varchar(100) CHARACTER SET utf8 NOT NULL,
  `sub_title` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.skin_menu: ~0 rows (approximately)
/*!40000 ALTER TABLE `skin_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `skin_menu` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.splayers
DROP TABLE IF EXISTS `splayers`;
CREATE TABLE IF NOT EXISTS `splayers` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `player_id` int(7) NOT NULL,
  `system` char(2) NOT NULL,
  `pid` varchar(16) NOT NULL,
  `username` varchar(260) NOT NULL,
  `password` varchar(128) NOT NULL,
  `balance` decimal(15,2) NOT NULL,
  `bonus` decimal(15,2) NOT NULL,
  `session_hash` varchar(255) NOT NULL,
  `initial_session_hash` varchar(255) NOT NULL,
  `session_expire` datetime NOT NULL,
  `activated` datetime DEFAULT NULL,
  `lastactive` datetime DEFAULT NULL,
  `lastsync` datetime DEFAULT NULL,
  `disabled` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  KEY `system` (`system`),
  KEY `username` (`username`(255)),
  KEY `session_hash` (`session_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.splayers: ~0 rows (approximately)
/*!40000 ALTER TABLE `splayers` DISABLE KEYS */;
/*!40000 ALTER TABLE `splayers` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.splayers_fun
DROP TABLE IF EXISTS `splayers_fun`;
CREATE TABLE IF NOT EXISTS `splayers_fun` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `player_id` int(7) NOT NULL,
  `system` char(2) NOT NULL,
  `pid` varchar(16) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(41) NOT NULL,
  `balance` decimal(15,2) NOT NULL,
  `bonus` decimal(15,2) NOT NULL,
  `session_hash` varchar(46) NOT NULL,
  `session_expire` datetime NOT NULL,
  `activated` datetime DEFAULT NULL,
  `lastactive` datetime DEFAULT NULL,
  `lastsync` datetime DEFAULT NULL,
  `disabled` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Dumping data for table isoftbetgamehub_codeception.splayers_fun: ~0 rows (approximately)
/*!40000 ALTER TABLE `splayers_fun` DISABLE KEYS */;
/*!40000 ALTER TABLE `splayers_fun` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.stat
DROP TABLE IF EXISTS `stat`;
CREATE TABLE IF NOT EXISTS `stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(6) unsigned NOT NULL,
  `player_id` int(6) NOT NULL,
  `game_count` smallint(5) unsigned NOT NULL,
  `bet_count` smallint(5) unsigned NOT NULL,
  `bet` decimal(15,2) NOT NULL,
  `win` decimal(15,2) NOT NULL,
  `net` decimal(15,2) NOT NULL,
  `date` date NOT NULL,
  `session` varchar(255) NOT NULL,
  `time_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `time_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.stat: ~0 rows (approximately)
/*!40000 ALTER TABLE `stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `stat` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.statistics
DROP TABLE IF EXISTS `statistics`;
CREATE TABLE IF NOT EXISTS `statistics` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `country` char(2) NOT NULL,
  `type` enum('playerlogin','agentlogin','game','agentuserlogin') NOT NULL,
  `sid` int(6) NOT NULL,
  `sid2` int(6) NOT NULL,
  `ip` varchar(15) NOT NULL,
  KEY `Index 1` (`id`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.statistics: ~0 rows (approximately)
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.tagged_objects
DROP TABLE IF EXISTS `tagged_objects`;
CREATE TABLE IF NOT EXISTS `tagged_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(60) DEFAULT '',
  `tag_id` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_2` (`table`,`tag_id`,`object_id`),
  UNIQUE KEY `table_3` (`table`,`tag_id`,`object_id`),
  KEY `table` (`table`),
  KEY `tag_id` (`tag_id`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.tagged_objects: ~0 rows (approximately)
/*!40000 ALTER TABLE `tagged_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagged_objects` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.tags
DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platformid` int(11) DEFAULT NULL,
  `table` varchar(60) DEFAULT '',
  `tag_name` varchar(60) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_3` (`table`,`platformid`,`tag_name`),
  KEY `platformid` (`platformid`),
  KEY `table` (`table`),
  KEY `table_2` (`table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.tags: ~0 rows (approximately)
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.tokens
DROP TABLE IF EXISTS `tokens`;
CREATE TABLE IF NOT EXISTS `tokens` (
  `token` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `model` enum('PLAYER','AGENT') NOT NULL,
  `type` enum('RECOVERY','REGISTRATION','LOGIN','REGISTRATION_VIA_TOKEN') NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.transactions
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transid` int(11) unsigned DEFAULT NULL,
  `transby` int(11) DEFAULT '0',
  `agentid` int(7) unsigned DEFAULT NULL,
  `agentuser` varchar(16) DEFAULT NULL,
  `method` int(3) unsigned NOT NULL,
  `system` char(3) DEFAULT NULL,
  `account` int(7) unsigned DEFAULT NULL,
  `accountuser` varchar(16) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `credit` decimal(15,2) DEFAULT '0.00',
  `debit` decimal(15,2) DEFAULT '0.00',
  `settled` decimal(15,2) DEFAULT '0.00',
  `balance` decimal(15,2) DEFAULT '0.00',
  `balance_agent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `platformid` int(2) NOT NULL,
  `sessionid` varchar(40) DEFAULT NULL,
  `bonus` decimal(15,2) DEFAULT NULL,
  `error` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`time_stamp`),
  KEY `transid` (`transid`),
  KEY `agentid` (`agentid`),
  KEY `agentuser` (`agentuser`),
  KEY `time_stamp` (`time_stamp`),
  KEY `account` (`account`),
  KEY `accountuser` (`accountuser`),
  KEY `method` (`method`),
  KEY `platformid` (`platformid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.transactions: ~0 rows (approximately)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.transactions_new
DROP TABLE IF EXISTS `transactions_new`;
CREATE TABLE IF NOT EXISTS `transactions_new` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transid` int(11) unsigned DEFAULT NULL,
  `transby` int(11) DEFAULT '0',
  `agentid` int(7) unsigned DEFAULT NULL,
  `agentuser` varchar(16) DEFAULT NULL,
  `method` int(3) unsigned NOT NULL,
  `system` char(3) DEFAULT NULL,
  `account` int(7) unsigned DEFAULT NULL,
  `accountuser` varchar(16) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `credit` decimal(15,2) DEFAULT '0.00',
  `debit` decimal(15,2) DEFAULT '0.00',
  `settled` decimal(15,2) DEFAULT '0.00',
  `balance` decimal(15,2) DEFAULT '0.00',
  `balance_agent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `platformid` int(2) NOT NULL,
  `sessionid` varchar(40) DEFAULT NULL,
  `bonus` decimal(15,2) DEFAULT NULL,
  `error` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`time_stamp`),
  KEY `transid` (`transid`),
  KEY `agentid` (`agentid`),
  KEY `agentuser` (`agentuser`),
  KEY `time_stamp` (`time_stamp`),
  KEY `account` (`account`),
  KEY `accountuser` (`accountuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.transactions_new: ~0 rows (approximately)
/*!40000 ALTER TABLE `transactions_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions_new` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.transactions_system
DROP TABLE IF EXISTS `transactions_system`;
CREATE TABLE IF NOT EXISTS `transactions_system` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `playerid` int(6) NOT NULL,
  `transid` varchar(40) NOT NULL,
  `table` varchar(60) NOT NULL,
  `gameid` varchar(32) NOT NULL,
  `bet_type` varchar(32) NOT NULL,
  `ticket` varchar(32) NOT NULL,
  `session` varchar(32) NOT NULL,
  `date_start` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `balance_start` decimal(15,2) NOT NULL,
  `balance_end` decimal(15,2) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `rake` decimal(15,2) NOT NULL,
  `system_in` decimal(15,2) NOT NULL,
  `system_out` decimal(15,2) NOT NULL,
  `bonus` decimal(15,2) NOT NULL,
  `system` varchar(3) NOT NULL,
  `status` enum('RESERVED','PROCESSED','CANCELED','REFUNDED','COMMIT') NOT NULL DEFAULT 'RESERVED',
  `description` varchar(255) NOT NULL,
  `error_code` varchar(255) NOT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index 2` (`transid`),
  KEY `playerid` (`playerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.transactions_system: ~0 rows (approximately)
/*!40000 ALTER TABLE `transactions_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions_system` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_3d
DROP TABLE IF EXISTS `view_3d`;
CREATE TABLE IF NOT EXISTS `view_3d` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `playerid` int(7) unsigned NOT NULL,
  `agentid` int(7) unsigned NOT NULL,
  `currency` char(3) NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `aams_ticket` varchar(40) NOT NULL,
  `aams_table` varchar(40) NOT NULL,
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_3d: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_3d` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_3d` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_5m
DROP TABLE IF EXISTS `view_5m`;
CREATE TABLE IF NOT EXISTS `view_5m` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_5m: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_5m` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_5m` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ac
DROP TABLE IF EXISTS `view_ac`;
CREATE TABLE IF NOT EXISTS `view_ac` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ac: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ac` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ac` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ae
DROP TABLE IF EXISTS `view_ae`;
CREATE TABLE IF NOT EXISTS `view_ae` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ae: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ae` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ae` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ag
DROP TABLE IF EXISTS `view_ag`;
CREATE TABLE IF NOT EXISTS `view_ag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ag: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ag` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ag` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ak
DROP TABLE IF EXISTS `view_ak`;
CREATE TABLE IF NOT EXISTS `view_ak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) DEFAULT NULL,
  `freeWin` decimal(15,2) DEFAULT NULL,
  `win` decimal(15,2) DEFAULT NULL,
  `net` decimal(15,2) DEFAULT NULL,
  `jackpotContributionWin` decimal(17,4) DEFAULT NULL,
  `jackpotContribution` decimal(17,4) DEFAULT NULL,
  `gamesPlayed` int(11) DEFAULT NULL,
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `playerid` (`playerid`) USING BTREE,
  KEY `agentid` (`agentid`) USING BTREE,
  KEY `date` (`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ak: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ak` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ak` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_am
DROP TABLE IF EXISTS `view_am`;
CREATE TABLE IF NOT EXISTS `view_am` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_am: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_am` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_am` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ar
DROP TABLE IF EXISTS `view_ar`;
CREATE TABLE IF NOT EXISTS `view_ar` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Dumping data for table isoftbetgamehub_codeception.view_ar: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ar` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ar` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_as
DROP TABLE IF EXISTS `view_as`;
CREATE TABLE IF NOT EXISTS `view_as` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_as: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_as` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_as` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_b2
DROP TABLE IF EXISTS `view_b2`;
CREATE TABLE IF NOT EXISTS `view_b2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_b2: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_b2` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_b2` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_bc
DROP TABLE IF EXISTS `view_bc`;
CREATE TABLE IF NOT EXISTS `view_bc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_bc: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_bc` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_bc` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_be
DROP TABLE IF EXISTS `view_be`;
CREATE TABLE IF NOT EXISTS `view_be` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_be: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_be` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_be` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_bf
DROP TABLE IF EXISTS `view_bf`;
CREATE TABLE IF NOT EXISTS `view_bf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_bf: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_bf` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_bf` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_bn
DROP TABLE IF EXISTS `view_bn`;
CREATE TABLE IF NOT EXISTS `view_bn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) DEFAULT NULL,
  `freeWin` decimal(15,2) DEFAULT NULL,
  `win` decimal(15,2) DEFAULT NULL,
  `net` decimal(15,2) DEFAULT NULL,
  `jackpotContributionWin` decimal(17,4) DEFAULT NULL,
  `jackpotContribution` decimal(17,4) DEFAULT NULL,
  `gamesPlayed` int(11) DEFAULT NULL,
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_bn: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_bn` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_bn` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_bp
DROP TABLE IF EXISTS `view_bp`;
CREATE TABLE IF NOT EXISTS `view_bp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_bp: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_bp` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_bp` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_bs
DROP TABLE IF EXISTS `view_bs`;
CREATE TABLE IF NOT EXISTS `view_bs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_bs: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_bs` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_bs` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_bt
DROP TABLE IF EXISTS `view_bt`;
CREATE TABLE IF NOT EXISTS `view_bt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_bt: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_bt` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_bt` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_bx
DROP TABLE IF EXISTS `view_bx`;
CREATE TABLE IF NOT EXISTS `view_bx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_bx: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_bx` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_bx` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_cp
DROP TABLE IF EXISTS `view_cp`;
CREATE TABLE IF NOT EXISTS `view_cp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_cp: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_cp` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_cp` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_cs
DROP TABLE IF EXISTS `view_cs`;
CREATE TABLE IF NOT EXISTS `view_cs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) NOT NULL,
  `agentid` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_cs: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_cs` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_cs` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ct
DROP TABLE IF EXISTS `view_ct`;
CREATE TABLE IF NOT EXISTS `view_ct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ct: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ct` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ct` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_cw
DROP TABLE IF EXISTS `view_cw`;
CREATE TABLE IF NOT EXISTS `view_cw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) NOT NULL,
  `agentid` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_cw: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_cw` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_cw` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_dg
DROP TABLE IF EXISTS `view_dg`;
CREATE TABLE IF NOT EXISTS `view_dg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_dg: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_dg` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_dg` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_di
DROP TABLE IF EXISTS `view_di`;
CREATE TABLE IF NOT EXISTS `view_di` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_di: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_di` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_di` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_dl
DROP TABLE IF EXISTS `view_dl`;
CREATE TABLE IF NOT EXISTS `view_dl` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_dl: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_dl` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_dl` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_dr
DROP TABLE IF EXISTS `view_dr`;
CREATE TABLE IF NOT EXISTS `view_dr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) DEFAULT NULL,
  `freeWin` decimal(15,2) DEFAULT NULL,
  `win` decimal(15,2) DEFAULT NULL,
  `net` decimal(15,2) DEFAULT NULL,
  `jackpotContributionWin` decimal(17,4) DEFAULT NULL,
  `jackpotContribution` decimal(17,4) DEFAULT NULL,
  `gamesPlayed` int(11) DEFAULT NULL,
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_dr: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_dr` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_dr` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ds
DROP TABLE IF EXISTS `view_ds`;
CREATE TABLE IF NOT EXISTS `view_ds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ds: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ds` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ds` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_du
DROP TABLE IF EXISTS `view_du`;
CREATE TABLE IF NOT EXISTS `view_du` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_du: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_du` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_du` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_e2
DROP TABLE IF EXISTS `view_e2`;
CREATE TABLE IF NOT EXISTS `view_e2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_e2: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_e2` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_e2` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ea
DROP TABLE IF EXISTS `view_ea`;
CREATE TABLE IF NOT EXISTS `view_ea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ea: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ea` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ea` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_eb
DROP TABLE IF EXISTS `view_eb`;
CREATE TABLE IF NOT EXISTS `view_eb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_eb: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_eb` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_eb` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_el
DROP TABLE IF EXISTS `view_el`;
CREATE TABLE IF NOT EXISTS `view_el` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_el: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_el` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_el` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ep
DROP TABLE IF EXISTS `view_ep`;
CREATE TABLE IF NOT EXISTS `view_ep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ep: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ep` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ep` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_er
DROP TABLE IF EXISTS `view_er`;
CREATE TABLE IF NOT EXISTS `view_er` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED;

-- Dumping data for table isoftbetgamehub_codeception.view_er: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_er` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_er` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_es
DROP TABLE IF EXISTS `view_es`;
CREATE TABLE IF NOT EXISTS `view_es` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_es: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_es` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_es` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_es_utc
DROP TABLE IF EXISTS `view_es_utc`;
CREATE TABLE IF NOT EXISTS `view_es_utc` (
  `playerid` int(11) NOT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`playerid`,`date`),
  KEY `agentid` (`agentid`) USING BTREE,
  KEY `playerid` (`playerid`) USING BTREE,
  KEY `dateutc` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_es_utc: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_es_utc` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_es_utc` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ex
DROP TABLE IF EXISTS `view_ex`;
CREATE TABLE IF NOT EXISTS `view_ex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ex: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ex` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ex` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ez
DROP TABLE IF EXISTS `view_ez`;
CREATE TABLE IF NOT EXISTS `view_ez` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_ez: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ez` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ez` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_fa
DROP TABLE IF EXISTS `view_fa`;
CREATE TABLE IF NOT EXISTS `view_fa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_fa: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_fa` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_fa` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_fg
DROP TABLE IF EXISTS `view_fg`;
CREATE TABLE IF NOT EXISTS `view_fg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_fg: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_fg` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_fg` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_fz
DROP TABLE IF EXISTS `view_fz`;
CREATE TABLE IF NOT EXISTS `view_fz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,6) NOT NULL DEFAULT '0.000000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_fz: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_fz` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_fz` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_g2
DROP TABLE IF EXISTS `view_g2`;
CREATE TABLE IF NOT EXISTS `view_g2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_g2: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_g2` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_g2` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_g3
DROP TABLE IF EXISTS `view_g3`;
CREATE TABLE IF NOT EXISTS `view_g3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_g3: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_g3` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_g3` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ga
DROP TABLE IF EXISTS `view_ga`;
CREATE TABLE IF NOT EXISTS `view_ga` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date DEFAULT NULL,
  `game` decimal(15,2) NOT NULL,
  `bet` decimal(15,2) NOT NULL,
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL,
  `net` decimal(15,2) NOT NULL,
  `rake` decimal(15,2) DEFAULT NULL,
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) DEFAULT NULL,
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonus_win` decimal(15,2) NOT NULL,
  `games_played` int(11) NOT NULL,
  `gamesPlayed` int(11) NOT NULL,
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `lastUpdatedDateTime` datetime NOT NULL,
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_ga: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ga` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ga` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_gb
DROP TABLE IF EXISTS `view_gb`;
CREATE TABLE IF NOT EXISTS `view_gb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_gb: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_gb` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_gb` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_gc
DROP TABLE IF EXISTS `view_gc`;
CREATE TABLE IF NOT EXISTS `view_gc` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_gc: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_gc` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_gc` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_gd
DROP TABLE IF EXISTS `view_gd`;
CREATE TABLE IF NOT EXISTS `view_gd` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_2` (`playerid`),
  KEY `agentid_2` (`agentid`),
  KEY `date_2` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_gd: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_gd` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_gd` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_gg
DROP TABLE IF EXISTS `view_gg`;
CREATE TABLE IF NOT EXISTS `view_gg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_gg: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_gg` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_gg` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_gh
DROP TABLE IF EXISTS `view_gh`;
CREATE TABLE IF NOT EXISTS `view_gh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_gh: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_gh` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_gh` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_gl
DROP TABLE IF EXISTS `view_gl`;
CREATE TABLE IF NOT EXISTS `view_gl` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_gl: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_gl` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_gl` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_go
DROP TABLE IF EXISTS `view_go`;
CREATE TABLE IF NOT EXISTS `view_go` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) DEFAULT NULL,
  `freeWin` decimal(15,2) DEFAULT NULL,
  `win` decimal(15,2) DEFAULT NULL,
  `net` decimal(15,2) DEFAULT NULL,
  `jackpotContributionWin` decimal(17,4) DEFAULT NULL,
  `jackpotContribution` decimal(17,4) DEFAULT NULL,
  `gamesPlayed` int(11) DEFAULT NULL,
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_go: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_go` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_go` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_gp
DROP TABLE IF EXISTS `view_gp`;
CREATE TABLE IF NOT EXISTS `view_gp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_gp: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_gp` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_gp` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_gr
DROP TABLE IF EXISTS `view_gr`;
CREATE TABLE IF NOT EXISTS `view_gr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_gr: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_gr` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_gr` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_gs
DROP TABLE IF EXISTS `view_gs`;
CREATE TABLE IF NOT EXISTS `view_gs` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Dumping data for table isoftbetgamehub_codeception.view_gs: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_gs` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_gs` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_gv
DROP TABLE IF EXISTS `view_gv`;
CREATE TABLE IF NOT EXISTS `view_gv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) DEFAULT NULL,
  `freeWin` decimal(15,2) DEFAULT NULL,
  `win` decimal(15,2) DEFAULT NULL,
  `net` decimal(15,2) DEFAULT NULL,
  `jackpotContributionWin` decimal(17,4) DEFAULT NULL,
  `jackpotContribution` decimal(17,4) DEFAULT NULL,
  `gamesPlayed` int(11) DEFAULT NULL,
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_gv: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_gv` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_gv` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_gw
DROP TABLE IF EXISTS `view_gw`;
CREATE TABLE IF NOT EXISTS `view_gw` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` bigint(20) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_gw: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_gw` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_gw` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_h8
DROP TABLE IF EXISTS `view_h8`;
CREATE TABLE IF NOT EXISTS `view_h8` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_h8: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_h8` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_h8` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ha
DROP TABLE IF EXISTS `view_ha`;
CREATE TABLE IF NOT EXISTS `view_ha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ha: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ha` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ha` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_hi
DROP TABLE IF EXISTS `view_hi`;
CREATE TABLE IF NOT EXISTS `view_hi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `currency` char(3) NOT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_hi: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_hi` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_hi` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_hs
DROP TABLE IF EXISTS `view_hs`;
CREATE TABLE IF NOT EXISTS `view_hs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_hs: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_hs` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_hs` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ht
DROP TABLE IF EXISTS `view_ht`;
CREATE TABLE IF NOT EXISTS `view_ht` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ht: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ht` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ht` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_hw
DROP TABLE IF EXISTS `view_hw`;
CREATE TABLE IF NOT EXISTS `view_hw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_hw: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_hw` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_hw` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_i8
DROP TABLE IF EXISTS `view_i8`;
CREATE TABLE IF NOT EXISTS `view_i8` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_i8: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_i8` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_i8` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_id
DROP TABLE IF EXISTS `view_id`;
CREATE TABLE IF NOT EXISTS `view_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_id: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_id` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ig
DROP TABLE IF EXISTS `view_ig`;
CREATE TABLE IF NOT EXISTS `view_ig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ig: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ig` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ig` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_in
DROP TABLE IF EXISTS `view_in`;
CREATE TABLE IF NOT EXISTS `view_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_in: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_in` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ip
DROP TABLE IF EXISTS `view_ip`;
CREATE TABLE IF NOT EXISTS `view_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ip: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ip` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_is
DROP TABLE IF EXISTS `view_is`;
CREATE TABLE IF NOT EXISTS `view_is` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_is: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_is` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_is` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_jp
DROP TABLE IF EXISTS `view_jp`;
CREATE TABLE IF NOT EXISTS `view_jp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_jp: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_jp` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_jp` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ka
DROP TABLE IF EXISTS `view_ka`;
CREATE TABLE IF NOT EXISTS `view_ka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ka: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ka` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ka` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_kb
DROP TABLE IF EXISTS `view_kb`;
CREATE TABLE IF NOT EXISTS `view_kb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_kb: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_kb` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_kb` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_kd
DROP TABLE IF EXISTS `view_kd`;
CREATE TABLE IF NOT EXISTS `view_kd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_kd: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_kd` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_kd` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_kf
DROP TABLE IF EXISTS `view_kf`;
CREATE TABLE IF NOT EXISTS `view_kf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_kf: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_kf` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_kf` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ki
DROP TABLE IF EXISTS `view_ki`;
CREATE TABLE IF NOT EXISTS `view_ki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `playerid` int(7) unsigned NOT NULL,
  `agentid` int(7) unsigned NOT NULL,
  `gamesPlayed` int(7) unsigned NOT NULL,
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) DEFAULT NULL,
  `rake` decimal(15,2) DEFAULT NULL,
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) DEFAULT NULL,
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_ki: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ki` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ki` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_kl
DROP TABLE IF EXISTS `view_kl`;
CREATE TABLE IF NOT EXISTS `view_kl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_kl: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_kl` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_kl` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ko
DROP TABLE IF EXISTS `view_ko`;
CREATE TABLE IF NOT EXISTS `view_ko` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ko: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ko` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ko` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ks
DROP TABLE IF EXISTS `view_ks`;
CREATE TABLE IF NOT EXISTS `view_ks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) NOT NULL,
  `agentid` int(11) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ks: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ks` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ks` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_kv
DROP TABLE IF EXISTS `view_kv`;
CREATE TABLE IF NOT EXISTS `view_kv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_kv: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_kv` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_kv` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_kw
DROP TABLE IF EXISTS `view_kw`;
CREATE TABLE IF NOT EXISTS `view_kw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) NOT NULL,
  `agentid` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_kw: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_kw` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_kw` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_l2
DROP TABLE IF EXISTS `view_l2`;
CREATE TABLE IF NOT EXISTS `view_l2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_l2: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_l2` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_l2` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_la
DROP TABLE IF EXISTS `view_la`;
CREATE TABLE IF NOT EXISTS `view_la` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_la: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_la` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_la` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_le
DROP TABLE IF EXISTS `view_le`;
CREATE TABLE IF NOT EXISTS `view_le` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_le: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_le` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_le` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_lg
DROP TABLE IF EXISTS `view_lg`;
CREATE TABLE IF NOT EXISTS `view_lg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_lg: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_lg` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_lg` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_li
DROP TABLE IF EXISTS `view_li`;
CREATE TABLE IF NOT EXISTS `view_li` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_li: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_li` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_li` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_lk
DROP TABLE IF EXISTS `view_lk`;
CREATE TABLE IF NOT EXISTS `view_lk` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `playerid` int(11) DEFAULT NULL,
    `agentid` int(11) DEFAULT NULL,
    `date` date DEFAULT NULL,
    `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
    `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
    `win` decimal(15,2) NOT NULL DEFAULT '0.00',
    `net` decimal(15,2) NOT NULL DEFAULT '0.00',
    `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
    `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
    `gamesPlayed` int(11) NOT NULL DEFAULT '0',
    `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
    `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
    `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
    `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
    `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
    `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
    `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
    `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
    `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
    `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
    PRIMARY KEY (`id`),
    KEY `playerid` (`playerid`),
    KEY `agentid` (`agentid`),
    KEY `date` (`date`),
    KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_lk: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_lk` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_lk` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_lp
DROP TABLE IF EXISTS `view_lp`;
CREATE TABLE IF NOT EXISTS `view_lp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_lp: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_lp` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_lp` ENABLE KEYS */;


-- Dumping structure for table isoftbetgamehub_codeception.view_mt
DROP TABLE IF EXISTS `view_mt`;
CREATE TABLE IF NOT EXISTS `view_mt` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `playerid` int(11) DEFAULT NULL,
    `agentid` int(11) DEFAULT NULL,
    `date` date DEFAULT NULL,
    `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
    `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
    `win` decimal(15,2) NOT NULL DEFAULT '0.00',
    `net` decimal(15,2) NOT NULL DEFAULT '0.00',
    `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
    `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
    `gamesPlayed` int(11) NOT NULL DEFAULT '0',
    `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
    `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
    `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
    `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
    `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
    `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
    `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
    `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
    `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
    `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
    PRIMARY KEY (`id`),
    KEY `playerid` (`playerid`),
    KEY `agentid` (`agentid`),
    KEY `date` (`date`),
    KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- Dumping data for table isoftbetgamehub_codeception.view_mt: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_mt` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_mt` ENABLE KEYS */;


-- Dumping structure for table isoftbetgamehub_codeception.view_ls
DROP TABLE IF EXISTS `view_ls`;
CREATE TABLE IF NOT EXISTS `view_ls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ls: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ls` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ls` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_lu
DROP TABLE IF EXISTS `view_lu`;
CREATE TABLE IF NOT EXISTS `view_lu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_lu: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_lu` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_lu` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub.view_rl
DROP TABLE IF EXISTS `view_rl`;
CREATE TABLE IF NOT EXISTS `view_rl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) DEFAULT NULL,
  `freeWin` decimal(15,2) DEFAULT NULL,
  `win` decimal(15,2) DEFAULT NULL,
  `net` decimal(15,2) DEFAULT NULL,
  `jackpotContributionWin` decimal(17,4) DEFAULT NULL,
  `jackpotContribution` decimal(17,4) DEFAULT NULL,
  `gamesPlayed` int(11) DEFAULT NULL,
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=602 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table isoftbetgamehub.view_sr
DROP TABLE IF EXISTS `view_sr`;
CREATE TABLE IF NOT EXISTS `view_sr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) DEFAULT NULL,
  `freeWin` decimal(15,2) DEFAULT NULL,
  `win` decimal(15,2) DEFAULT NULL,
  `net` decimal(15,2) DEFAULT NULL,
  `jackpotContributionWin` decimal(17,4) DEFAULT NULL,
  `jackpotContribution` decimal(17,4) DEFAULT NULL,
  `gamesPlayed` int(11) DEFAULT NULL,
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- Dumping structure for table isoftbetgamehub_codeception.view_m2
DROP TABLE IF EXISTS `view_m2`;
CREATE TABLE IF NOT EXISTS `view_m2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_m2: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_m2` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_m2` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_m4
DROP TABLE IF EXISTS `view_m4`;
CREATE TABLE IF NOT EXISTS `view_m4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_m4: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_m4` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_m4` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ma
DROP TABLE IF EXISTS `view_ma`;
CREATE TABLE IF NOT EXISTS `view_ma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ma: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ma` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ma` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_mb
DROP TABLE IF EXISTS `view_mb`;
CREATE TABLE IF NOT EXISTS `view_mb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_mb: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_mb` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_mb` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_mc
DROP TABLE IF EXISTS `view_mc`;
CREATE TABLE IF NOT EXISTS `view_mc` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;

-- Dumping data for table isoftbetgamehub_codeception.view_mc: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_mc` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_mc` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_md
DROP TABLE IF EXISTS `view_md`;
CREATE TABLE IF NOT EXISTS `view_md` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_md: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_md` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_mf
DROP TABLE IF EXISTS `view_mf`;
CREATE TABLE IF NOT EXISTS `view_mf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_mf: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_mf` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_mf` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_mi
DROP TABLE IF EXISTS `view_mi`;
CREATE TABLE IF NOT EXISTS `view_mi` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_mi: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_mi` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_mi` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_mj
DROP TABLE IF EXISTS `view_mj`;
CREATE TABLE IF NOT EXISTS `view_mj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_mj: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_mj` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_mj` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_mk
DROP TABLE IF EXISTS `view_mk`;
CREATE TABLE IF NOT EXISTS `view_mk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_mk: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_mk` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_mk` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ml
DROP TABLE IF EXISTS `view_ml`;
CREATE TABLE IF NOT EXISTS `view_ml` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `gametype` varchar(64) NOT NULL,
  `bet` decimal(15,2) DEFAULT NULL,
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) DEFAULT NULL,
  `net` decimal(15,2) DEFAULT NULL,
  `rake` decimal(15,2) DEFAULT NULL,
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) DEFAULT NULL,
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `noofbets` int(6) NOT NULL,
  `gamesPlayed` int(6) NOT NULL,
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `date` date NOT NULL,
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_ml: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ml` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ml` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_mn
DROP TABLE IF EXISTS `view_mn`;
CREATE TABLE IF NOT EXISTS `view_mn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_mn: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_mn` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_mn` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_mp
DROP TABLE IF EXISTS `view_mp`;
CREATE TABLE IF NOT EXISTS `view_mp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_mp: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_mp` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_mp` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_mr
DROP TABLE IF EXISTS `view_mr`;
CREATE TABLE IF NOT EXISTS `view_mr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_mr: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_mr` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_mr` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ms
DROP TABLE IF EXISTS `view_ms`;
CREATE TABLE IF NOT EXISTS `view_ms` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` bigint(20) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_ms: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ms` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ms` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_mt
DROP TABLE IF EXISTS `view_mt`;
CREATE TABLE IF NOT EXISTS `view_mt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) DEFAULT NULL,
  `freeWin` decimal(15,2) DEFAULT NULL,
  `win` decimal(15,2) DEFAULT NULL,
  `net` decimal(15,2) DEFAULT NULL,
  `jackpotContributionWin` decimal(17,4) DEFAULT NULL,
  `jackpotContribution` decimal(17,4) DEFAULT NULL,
  `gamesPlayed` int(11) DEFAULT NULL,
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_mt: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_mt` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_mt` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_mv
DROP TABLE IF EXISTS `view_mv`;
CREATE TABLE IF NOT EXISTS `view_mv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_mv: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_mv` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_mv` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_mw
DROP TABLE IF EXISTS `view_mw`;
CREATE TABLE IF NOT EXISTS `view_mw` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_mw: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_mw` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_mw` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ne
DROP TABLE IF EXISTS `view_ne`;
CREATE TABLE IF NOT EXISTS `view_ne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ne: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ne` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ne` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_nl
DROP TABLE IF EXISTS `view_nl`;
CREATE TABLE IF NOT EXISTS `view_nl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_nl: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_nl` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_nl` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_no
DROP TABLE IF EXISTS `view_no`;
CREATE TABLE IF NOT EXISTS `view_no` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_no: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_no` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_no` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_np
DROP TABLE IF EXISTS `view_np`;
CREATE TABLE IF NOT EXISTS `view_np` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_np: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_np` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_np` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_nv
DROP TABLE IF EXISTS `view_nv`;
CREATE TABLE IF NOT EXISTS `view_nv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_nv: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_nv` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_nv` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_o2
DROP TABLE IF EXISTS `view_o2`;
CREATE TABLE IF NOT EXISTS `view_o2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_o2: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_o2` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_o2` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_oa
DROP TABLE IF EXISTS `view_oa`;
CREATE TABLE IF NOT EXISTS `view_oa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_oa: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_oa` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_oa` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ob
DROP TABLE IF EXISTS `view_ob`;
CREATE TABLE IF NOT EXISTS `view_ob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ob: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ob` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ob` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_oc
DROP TABLE IF EXISTS `view_oc`;
CREATE TABLE IF NOT EXISTS `view_oc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_oc: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_oc` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_oc` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_og
DROP TABLE IF EXISTS `view_og`;
CREATE TABLE IF NOT EXISTS `view_og` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_og: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_og` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_og` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_oh
DROP TABLE IF EXISTS `view_oh`;
CREATE TABLE IF NOT EXISTS `view_oh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_oh: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_oh` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_oh` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ok
DROP TABLE IF EXISTS `view_ok`;
CREATE TABLE IF NOT EXISTS `view_ok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ok: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ok` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ok` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ol
DROP TABLE IF EXISTS `view_ol`;
CREATE TABLE IF NOT EXISTS `view_ol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ol: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ol` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ol` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_op
DROP TABLE IF EXISTS `view_op`;
CREATE TABLE IF NOT EXISTS `view_op` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_op: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_op` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_op` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_or
DROP TABLE IF EXISTS `view_or`;
CREATE TABLE IF NOT EXISTS `view_or` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_or: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_or` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_or` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_os
DROP TABLE IF EXISTS `view_os`;
CREATE TABLE IF NOT EXISTS `view_os` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_os: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_os` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_os` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ot
DROP TABLE IF EXISTS `view_ot`;
CREATE TABLE IF NOT EXISTS `view_ot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ot: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ot` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ot` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ou
DROP TABLE IF EXISTS `view_ou`;
CREATE TABLE IF NOT EXISTS `view_ou` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ou: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ou` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ou` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ov
DROP TABLE IF EXISTS `view_ov`;
CREATE TABLE IF NOT EXISTS `view_ov` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ov: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ov` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ov` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_p0
DROP TABLE IF EXISTS `view_p0`;
CREATE TABLE IF NOT EXISTS `view_p0` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_p0: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_p0` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_p0` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_p1
DROP TABLE IF EXISTS `view_p1`;
CREATE TABLE IF NOT EXISTS `view_p1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_p1: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_p1` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_p1` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_p2
DROP TABLE IF EXISTS `view_p2`;
CREATE TABLE IF NOT EXISTS `view_p2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_p2: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_p2` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_p2` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_p3
DROP TABLE IF EXISTS `view_p3`;
CREATE TABLE IF NOT EXISTS `view_p3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_p3: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_p3` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_p3` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_p4
DROP TABLE IF EXISTS `view_p4`;
CREATE TABLE IF NOT EXISTS `view_p4` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_p4: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_p4` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_p4` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_pa
DROP TABLE IF EXISTS `view_pa`;
CREATE TABLE IF NOT EXISTS `view_pa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_pa: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_pa` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pa` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_pb
DROP TABLE IF EXISTS `view_pb`;
CREATE TABLE IF NOT EXISTS `view_pb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_pb: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_pb` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pb` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_pc
DROP TABLE IF EXISTS `view_pc`;
CREATE TABLE IF NOT EXISTS `view_pc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_pc: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_pc` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pc` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_pe
DROP TABLE IF EXISTS `view_pe`;
CREATE TABLE IF NOT EXISTS `view_pe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_pe: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_pe` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pe` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_pf
DROP TABLE IF EXISTS `view_pf`;
CREATE TABLE IF NOT EXISTS `view_pf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_pf: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_pf` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pf` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_pg
DROP TABLE IF EXISTS `view_pg`;
CREATE TABLE IF NOT EXISTS `view_pg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_pg: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_pg` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pg` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_pl
DROP TABLE IF EXISTS `view_pl`;
CREATE TABLE IF NOT EXISTS `view_pl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_pl: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_pl` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pl` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_pm
DROP TABLE IF EXISTS `view_pm`;
CREATE TABLE IF NOT EXISTS `view_pm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_pm: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_pm` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pm` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_pn
DROP TABLE IF EXISTS `view_pn`;
CREATE TABLE IF NOT EXISTS `view_pn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_pn: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_pn` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pn` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_po
DROP TABLE IF EXISTS `view_po`;
CREATE TABLE IF NOT EXISTS `view_po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `playerid` int(7) unsigned NOT NULL,
  `agentid` int(7) unsigned NOT NULL,
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `currency` char(3) NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_po: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_po` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_po` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_pp
DROP TABLE IF EXISTS `view_pp`;
CREATE TABLE IF NOT EXISTS `view_pp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_pp: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_pp` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pp` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_pq
DROP TABLE IF EXISTS `view_pq`;
CREATE TABLE IF NOT EXISTS `view_pq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(12,2) DEFAULT NULL,
  `freeWin` decimal(12,2) DEFAULT NULL,
  `win` decimal(12,2) DEFAULT NULL,
  `net` decimal(12,2) DEFAULT NULL,
  `jackpotContributionWin` decimal(12,2) DEFAULT NULL,
  `jackpotContribution` decimal(12,2) DEFAULT NULL,
  `gamesPlayed` int(11) DEFAULT NULL,
  `bonusBet` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(10,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_pq: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_pq` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pq` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_pr
DROP TABLE IF EXISTS `view_pr`;
CREATE TABLE IF NOT EXISTS `view_pr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_pr: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_pr` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pr` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ps
DROP TABLE IF EXISTS `view_ps`;
CREATE TABLE IF NOT EXISTS `view_ps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ps: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ps` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ps` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_pt
DROP TABLE IF EXISTS `view_pt`;
CREATE TABLE IF NOT EXISTS `view_pt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_pt: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_pt` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_pt` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_py
DROP TABLE IF EXISTS `view_py`;
CREATE TABLE IF NOT EXISTS `view_py` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_py: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_py` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_py` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_q2
DROP TABLE IF EXISTS `view_q2`;
CREATE TABLE IF NOT EXISTS `view_q2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_q2: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_q2` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_q2` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_q3
DROP TABLE IF EXISTS `view_q3`;
CREATE TABLE IF NOT EXISTS `view_q3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_q3: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_q3` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_q3` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_qb
DROP TABLE IF EXISTS `view_qb`;
CREATE TABLE IF NOT EXISTS `view_qb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_qb: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_qb` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_qb` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_qf
DROP TABLE IF EXISTS `view_qf`;
CREATE TABLE IF NOT EXISTS `view_qf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_qf: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_qf` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_qf` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_qk
DROP TABLE IF EXISTS `view_qk`;
CREATE TABLE IF NOT EXISTS `view_qk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_qk: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_qk` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_qk` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_qp
DROP TABLE IF EXISTS `view_qp`;
CREATE TABLE IF NOT EXISTS `view_qp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_qp: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_qp` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_qp` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_qr
DROP TABLE IF EXISTS `view_qr`;
CREATE TABLE IF NOT EXISTS `view_qr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_qr: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_qr` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_qr` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_qs
DROP TABLE IF EXISTS `view_qs`;
CREATE TABLE IF NOT EXISTS `view_qs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_qs: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_qs` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_qs` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_r2
DROP TABLE IF EXISTS `view_r2`;
CREATE TABLE IF NOT EXISTS `view_r2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_r2: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_r2` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_r2` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_rc
DROP TABLE IF EXISTS `view_rc`;
CREATE TABLE IF NOT EXISTS `view_rc` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_rc: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_rc` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_rc` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_rd
DROP TABLE IF EXISTS `view_rd`;
CREATE TABLE IF NOT EXISTS `view_rd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_rd: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_rd` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_rd` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_re
DROP TABLE IF EXISTS `view_re`;
CREATE TABLE IF NOT EXISTS `view_re` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_re: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_re` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_re` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_rg
DROP TABLE IF EXISTS `view_rg`;
CREATE TABLE IF NOT EXISTS `view_rg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) DEFAULT NULL,
  `freeWin` decimal(15,2) DEFAULT NULL,
  `win` decimal(15,2) DEFAULT NULL,
  `net` decimal(15,2) DEFAULT NULL,
  `jackpotContributionWin` decimal(17,4) DEFAULT NULL,
  `jackpotContribution` decimal(17,4) DEFAULT NULL,
  `gamesPlayed` int(11) DEFAULT NULL,
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_rg: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_rg` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_rg` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ri
DROP TABLE IF EXISTS `view_ri`;
CREATE TABLE IF NOT EXISTS `view_ri` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_2` (`playerid`),
  KEY `agentid_2` (`agentid`),
  KEY `date_2` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_ri: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ri` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ri` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_rk
DROP TABLE IF EXISTS `view_rk`;
CREATE TABLE IF NOT EXISTS `view_rk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) DEFAULT NULL,
  `freeWin` decimal(15,2) DEFAULT NULL,
  `win` decimal(15,2) DEFAULT NULL,
  `net` decimal(15,2) DEFAULT NULL,
  `jackpotContributionWin` decimal(17,4) DEFAULT NULL,
  `jackpotContribution` decimal(17,4) DEFAULT NULL,
  `gamesPlayed` int(11) DEFAULT NULL,
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_rk: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_rk` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_rk` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_rp
DROP TABLE IF EXISTS `view_rp`;
CREATE TABLE IF NOT EXISTS `view_rp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `currency` char(3) NOT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_rp: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_rp` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_rp` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_rr
DROP TABLE IF EXISTS `view_rr`;
CREATE TABLE IF NOT EXISTS `view_rr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `playerid` int(7) unsigned NOT NULL,
  `agentid` int(7) unsigned NOT NULL,
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `currency` char(3) NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_rr: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_rr` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_rr` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_rs
DROP TABLE IF EXISTS `view_rs`;
CREATE TABLE IF NOT EXISTS `view_rs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_rs: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_rs` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_rs` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_rt
DROP TABLE IF EXISTS `view_rt`;
CREATE TABLE IF NOT EXISTS `view_rt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_rt: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_rt` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_rt` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_rv
DROP TABLE IF EXISTS `view_rv`;
CREATE TABLE IF NOT EXISTS `view_rv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_rv: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_rv` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_rv` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_s2
DROP TABLE IF EXISTS `view_s2`;
CREATE TABLE IF NOT EXISTS `view_s2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_s2: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_s2` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_s2` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_sb
DROP TABLE IF EXISTS `view_sb`;
CREATE TABLE IF NOT EXISTS `view_sb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_sb: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_sb` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_sb` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_sg
DROP TABLE IF EXISTS `view_sg`;
CREATE TABLE IF NOT EXISTS `view_sg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_sg: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_sg` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_sg` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_sl
DROP TABLE IF EXISTS `view_sl`;
CREATE TABLE IF NOT EXISTS `view_sl` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_sl: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_sl` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_sl` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_sm
DROP TABLE IF EXISTS `view_sm`;
CREATE TABLE IF NOT EXISTS `view_sm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_sm: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_sm` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_sm` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_sp
DROP TABLE IF EXISTS `view_sp`;
CREATE TABLE IF NOT EXISTS `view_sp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_sp: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_sp` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_sp` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_ss
DROP TABLE IF EXISTS `view_ss`;
CREATE TABLE IF NOT EXISTS `view_ss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_ss: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_ss` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_ss` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_sv
DROP TABLE IF EXISTS `view_sv`;
CREATE TABLE IF NOT EXISTS `view_sv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_sv: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_sv` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_sv` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_sw
DROP TABLE IF EXISTS `view_sw`;
CREATE TABLE IF NOT EXISTS `view_sw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_sw: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_sw` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_sw` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_sy
DROP TABLE IF EXISTS `view_sy`;
CREATE TABLE IF NOT EXISTS `view_sy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_sy: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_sy` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_sy` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_tb
DROP TABLE IF EXISTS `view_tb`;
CREATE TABLE IF NOT EXISTS `view_tb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_tb: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_tb` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_tb` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_th
DROP TABLE IF EXISTS `view_th`;
CREATE TABLE IF NOT EXISTS `view_th` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_th: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_th` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_th` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_tk
DROP TABLE IF EXISTS `view_tk`;
CREATE TABLE IF NOT EXISTS `view_tk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_tk: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_tk` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_tk` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_tp
DROP TABLE IF EXISTS `view_tp`;
CREATE TABLE IF NOT EXISTS `view_tp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_tp: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_tp` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_tp` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_tu
DROP TABLE IF EXISTS `view_tu`;
CREATE TABLE IF NOT EXISTS `view_tu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `agentid` (`agentid`),
  KEY `playerid` (`playerid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_tu: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_tu` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_tu` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_va
DROP TABLE IF EXISTS `view_va`;
CREATE TABLE IF NOT EXISTS `view_va` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_va: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_va` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_va` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_vg
DROP TABLE IF EXISTS `view_vg`;
CREATE TABLE IF NOT EXISTS `view_vg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_vg: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_vg` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_vg` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_vi
DROP TABLE IF EXISTS `view_vi`;
CREATE TABLE IF NOT EXISTS `view_vi` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `playerid` int(7) NOT NULL,
  `agentid` int(6) NOT NULL,
  `date` date NOT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table isoftbetgamehub_codeception.view_vi: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_vi` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_vi` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_wo
DROP TABLE IF EXISTS `view_wo`;
CREATE TABLE IF NOT EXISTS `view_wo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_wo: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_wo` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_wo` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_wz
DROP TABLE IF EXISTS `view_wz`;
CREATE TABLE IF NOT EXISTS `view_wz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_wz: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_wz` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_wz` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_xe
DROP TABLE IF EXISTS `view_xe`;
CREATE TABLE IF NOT EXISTS `view_xe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) DEFAULT NULL,
  `win` decimal(15,2) DEFAULT NULL,
  `tbet` decimal(15,2) DEFAULT NULL,
  `twin` decimal(15,2) DEFAULT NULL,
  `bonusBet` decimal(15,2) DEFAULT NULL,
  `bonusWin` decimal(15,2) DEFAULT NULL,
  `tip` decimal(15,2) DEFAULT NULL,
  `fee` decimal(15,2) DEFAULT NULL,
  `tournament` decimal(15,2) DEFAULT NULL,
  `net` decimal(15,2) DEFAULT NULL,
  `rake` decimal(15,2) DEFAULT NULL,
  `fin` decimal(15,2) DEFAULT NULL,
  `gamesPlayed` double DEFAULT NULL,
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_xe: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_xe` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_xe` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_xg
DROP TABLE IF EXISTS `view_xg`;
CREATE TABLE IF NOT EXISTS `view_xg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_xg: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_xg` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_xg` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_yg
DROP TABLE IF EXISTS `view_yg`;
CREATE TABLE IF NOT EXISTS `view_yg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_yg: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_yg` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_yg` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.view_yp
DROP TABLE IF EXISTS `view_yp`;
CREATE TABLE IF NOT EXISTS `view_yp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` int(11) DEFAULT NULL,
  `agentid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `freeWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `win` decimal(15,2) NOT NULL DEFAULT '0.00',
  `net` decimal(15,2) NOT NULL DEFAULT '0.00',
  `jackpotContributionWin` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `jackpotContribution` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `gamesPlayed` int(11) NOT NULL DEFAULT '0',
  `bonusBet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `bonusWin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  `twin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tip` decimal(15,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tournament` decimal(15,2) NOT NULL DEFAULT '0.00',
  `rbet` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `playerid` (`playerid`),
  KEY `agentid` (`agentid`),
  KEY `date` (`date`),
  KEY `playerid_date` (`playerid`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.view_yp: ~0 rows (approximately)
/*!40000 ALTER TABLE `view_yp` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_yp` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.vouchers
DROP TABLE IF EXISTS `vouchers`;
CREATE TABLE IF NOT EXISTS `vouchers` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `player_id` int(6) NOT NULL,
  `from_player_id` int(6) DEFAULT NULL,
  `agentid` int(6) NOT NULL,
  `code` varchar(30) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `date_used` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.vouchers: ~0 rows (approximately)
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.vouchers_additional
DROP TABLE IF EXISTS `vouchers_additional`;
CREATE TABLE IF NOT EXISTS `vouchers_additional` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `vid` int(6) NOT NULL,
  `code` varchar(30) NOT NULL,
  `playerid` int(6) DEFAULT NULL,
  `agentid` int(6) DEFAULT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.vouchers_additional: ~0 rows (approximately)
/*!40000 ALTER TABLE `vouchers_additional` DISABLE KEYS */;
/*!40000 ALTER TABLE `vouchers_additional` ENABLE KEYS */;

-- Dumping structure for table isoftbetgamehub_codeception.voucher_history
DROP TABLE IF EXISTS `voucher_history`;
CREATE TABLE IF NOT EXISTS `voucher_history` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `vid` int(6) NOT NULL,
  `playerid` int(6) NOT NULL,
  `agentid` int(6) NOT NULL,
  `code` varchar(30) NOT NULL,
  `amountadd` decimal(15,2) DEFAULT NULL,
  `amountredeem` decimal(15,2) DEFAULT NULL,
  `date` datetime NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table isoftbetgamehub_codeception.voucher_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `voucher_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher_history` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

DROP TABLE IF EXISTS `competition_lab_widget`;
CREATE TABLE `competition_lab_widget` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `api_user_id` int(11) NOT NULL,
      `skin_ids` varchar(255) NOT NULL,
      `players` varchar(255) DEFAULT NULL,
      `start_date` datetime NOT NULL,
      `end_date` datetime NOT NULL,
      PRIMARY KEY (`id`),
      UNIQUE KEY `api_user_id` (`api_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

REPLACE INTO `competition_lab_widget` (`id`,`api_user_id`,`skin_ids`,`players`,`start_date`,`end_date`) VALUES (7,129,'3564,14658,2126','','2022-12-06 04:35:00','2022-12-30 17:35:00');
