/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : d-3

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 14/09/2021 21:25:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ge_admins
-- ----------------------------
DROP TABLE IF EXISTS `ge_admins`;
CREATE TABLE `ge_admins` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` smallint(5) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1=正常，2=冻结',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `group` (`role`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_admins
-- ----------------------------
BEGIN;
INSERT INTO `ge_admins` VALUES (1, 'adminer', 'eccaf433bc006dce6e64c8db5023629b5cb719f2', '89417fa8e2', 'hello@dilicms.com', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for ge_attachments
-- ----------------------------
DROP TABLE IF EXISTS `ge_attachments`;
CREATE TABLE `ge_attachments` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` smallint(10) NOT NULL DEFAULT '0',
  `model` mediumint(10) DEFAULT '0',
  `from` tinyint(1) DEFAULT '0' COMMENT '0:content model,1:cate model',
  `content` int(10) DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `folder` varchar(15) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `image` tinyint(1) DEFAULT '0',
  `posttime` int(11) DEFAULT '0',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=494 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_attachments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ge_backend_settings
-- ----------------------------
DROP TABLE IF EXISTS `ge_backend_settings`;
CREATE TABLE `ge_backend_settings` (
  `backend_theme` varchar(15) DEFAULT NULL,
  `backend_lang` varchar(10) DEFAULT NULL,
  `backend_root_access` tinyint(1) unsigned DEFAULT '1',
  `backend_access_point` varchar(20) DEFAULT 'admin',
  `backend_title` varchar(100) DEFAULT 'DiliCMS后台管理',
  `backend_logo` varchar(100) DEFAULT 'images/logo.gif',
  `plugin_dev_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `backend_http_auth_on` tinyint(1) DEFAULT '0',
  `backend_http_auth_user` varchar(40) DEFAULT NULL,
  `backend_http_auth_password` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_backend_settings
-- ----------------------------
BEGIN;
INSERT INTO `ge_backend_settings` VALUES ('default', 'zh-cn', 1, '', 'dilicms3.0', 'images/logo.gif', 0, 0, '', '');
COMMIT;

-- ----------------------------
-- Table structure for ge_cate_fields
-- ----------------------------
DROP TABLE IF EXISTS `ge_cate_fields`;
CREATE TABLE `ge_cate_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `model` smallint(10) unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` tinytext,
  `width` smallint(10) DEFAULT NULL,
  `height` smallint(10) DEFAULT NULL,
  `rules` tinytext,
  `ruledescription` tinytext,
  `searchable` tinyint(1) unsigned DEFAULT NULL,
  `listable` tinyint(1) unsigned DEFAULT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`,`model`) USING BTREE,
  KEY `model` (`model`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_cate_fields
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ge_cate_models
-- ----------------------------
DROP TABLE IF EXISTS `ge_cate_models`;
CREATE TABLE `ge_cate_models` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `perpage` varchar(2) NOT NULL,
  `level` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `hasattach` tinyint(1) NOT NULL DEFAULT '0',
  `built_in` tinyint(1) DEFAULT '0',
  `auto_update` tinyint(1) DEFAULT '0',
  `thumb_preferences` text,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_cate_models
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ge_fieldtypes
-- ----------------------------
DROP TABLE IF EXISTS `ge_fieldtypes`;
CREATE TABLE `ge_fieldtypes` (
  `k` varchar(20) NOT NULL,
  `v` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_fieldtypes
-- ----------------------------
BEGIN;
INSERT INTO `ge_fieldtypes` VALUES ('int', '整形(INT)');
INSERT INTO `ge_fieldtypes` VALUES ('float', '浮点型(FLOAT)');
INSERT INTO `ge_fieldtypes` VALUES ('input', '单行文本框(VARCHAR)');
INSERT INTO `ge_fieldtypes` VALUES ('textarea', '文本区域(VARCHAR)');
INSERT INTO `ge_fieldtypes` VALUES ('select', '下拉菜单(VARCHAR)');
INSERT INTO `ge_fieldtypes` VALUES ('select_from_model', '下拉菜单(模型数据)(INT)');
INSERT INTO `ge_fieldtypes` VALUES ('linked_menu', '联动下拉菜单(VARCHAR)');
INSERT INTO `ge_fieldtypes` VALUES ('radio', '单选按钮(VARCHAR)');
INSERT INTO `ge_fieldtypes` VALUES ('radio_from_model', '单选按钮(模型数据)(INT)');
INSERT INTO `ge_fieldtypes` VALUES ('checkbox', '复选框(VARCHAR)');
INSERT INTO `ge_fieldtypes` VALUES ('checkbox_from_model', '复选框(模型数据)(VARCHAR)');
INSERT INTO `ge_fieldtypes` VALUES ('wysiwyg', '编辑器(TEXT)');
INSERT INTO `ge_fieldtypes` VALUES ('wysiwyg_basic', '编辑器(简)(TEXT)');
INSERT INTO `ge_fieldtypes` VALUES ('datetime', '日期时间(VARCHAR)');
INSERT INTO `ge_fieldtypes` VALUES ('content', '内容模型调用(INT)');
COMMIT;

-- ----------------------------
-- Table structure for ge_group
-- ----------------------------
DROP TABLE IF EXISTS `ge_group`;
CREATE TABLE `ge_group` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `level` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_group
-- ----------------------------
BEGIN;
INSERT INTO `ge_group` VALUES (28, 'group_1', '分组1', 1);
COMMIT;

-- ----------------------------
-- Table structure for ge_menus
-- ----------------------------
DROP TABLE IF EXISTS `ge_menus`;
CREATE TABLE `ge_menus` (
  `menu_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) NOT NULL,
  `method_name` varchar(30) NOT NULL,
  `menu_name` varchar(20) NOT NULL,
  `menu_level` tinyint(2) unsigned DEFAULT '0',
  `menu_parent` tinyint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_menus
-- ----------------------------
BEGIN;
INSERT INTO `ge_menus` VALUES (1, 'system', 'home', '系统', 0, 0);
INSERT INTO `ge_menus` VALUES (2, 'system', 'home', '后台首页', 1, 1);
INSERT INTO `ge_menus` VALUES (3, 'system', 'home', '后台首页', 2, 2);
INSERT INTO `ge_menus` VALUES (4, 'setting', 'site', '系统设置', 1, 1);
INSERT INTO `ge_menus` VALUES (5, 'setting', 'site', '站点设置', 2, 4);
INSERT INTO `ge_menus` VALUES (6, 'setting', 'backend', '后台设置', 2, 4);
INSERT INTO `ge_menus` VALUES (7, 'system', 'password', '修改密码', 2, 4);
INSERT INTO `ge_menus` VALUES (8, 'system', 'cache', '更新缓存', 2, 4);
INSERT INTO `ge_menus` VALUES (9, 'model', 'view', '模型管理', 1, 1);
INSERT INTO `ge_menus` VALUES (10, 'model', 'view', '内容模型管理', 2, 9);
INSERT INTO `ge_menus` VALUES (11, 'category', 'view', '分类模型管理', 2, 9);
INSERT INTO `ge_menus` VALUES (12, 'plugin', 'view', '扩展管理', 1, 1);
INSERT INTO `ge_menus` VALUES (13, 'plugin', 'view', '插件管理', 2, 12);
INSERT INTO `ge_menus` VALUES (14, 'role', 'view', '权限管理', 1, 1);
INSERT INTO `ge_menus` VALUES (15, 'role', 'view', '用户组管理', 2, 14);
INSERT INTO `ge_menus` VALUES (16, 'user', 'view', '用户管理', 2, 14);
INSERT INTO `ge_menus` VALUES (17, 'content', 'view', '内容管理', 0, 0);
INSERT INTO `ge_menus` VALUES (18, 'content', 'view', '内容管理', 1, 17);
INSERT INTO `ge_menus` VALUES (19, 'category_content', 'view', '分类管理', 1, 17);
INSERT INTO `ge_menus` VALUES (20, 'module', 'run', '插件', 0, 0);
INSERT INTO `ge_menus` VALUES (21, 'database', 'index', '数据库管理', 1, 1);
INSERT INTO `ge_menus` VALUES (22, 'database', 'index', '数据库备份', 2, 21);
INSERT INTO `ge_menus` VALUES (23, 'database', 'recover', '数据库还原', 2, 21);
INSERT INTO `ge_menus` VALUES (24, 'database', 'optimize', '数据库优化', 2, 21);
COMMIT;

-- ----------------------------
-- Table structure for ge_model_fields
-- ----------------------------
DROP TABLE IF EXISTS `ge_model_fields`;
CREATE TABLE `ge_model_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `model` smallint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` text NOT NULL,
  `width` smallint(10) unsigned NOT NULL,
  `height` smallint(10) unsigned NOT NULL,
  `rules` tinytext NOT NULL,
  `ruledescription` tinytext NOT NULL,
  `searchable` tinyint(1) unsigned NOT NULL,
  `listable` tinyint(1) unsigned NOT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`,`model`) USING BTREE,
  KEY `model` (`model`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_model_fields
-- ----------------------------
BEGIN;
INSERT INTO `ge_model_fields` VALUES (1006, 'user_name', '用户名称', 187, 'input', 30, '', 0, 0, 'required', '', 1, 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for ge_models
-- ----------------------------
DROP TABLE IF EXISTS `ge_models`;
CREATE TABLE `ge_models` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `perpage` varchar(2) NOT NULL DEFAULT '10',
  `hasattach` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `built_in` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `thumb_preferences` text,
  `belong_group` smallint(10) NOT NULL,
  `model_sort` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_models
-- ----------------------------
BEGIN;
INSERT INTO `ge_models` VALUES (187, 'user', '用户信息', '50', 1, 0, '{\"enabled\":[],\"default\":\"original\"}', 28, 0);
COMMIT;

-- ----------------------------
-- Table structure for ge_plugins
-- ----------------------------
DROP TABLE IF EXISTS `ge_plugins`;
CREATE TABLE `ge_plugins` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `version` varchar(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `author` varchar(20) NOT NULL,
  `link` varchar(100) NOT NULL,
  `copyrights` varchar(100) NOT NULL,
  `access` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_plugins
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ge_rights
-- ----------------------------
DROP TABLE IF EXISTS `ge_rights`;
CREATE TABLE `ge_rights` (
  `right_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `right_name` varchar(30) DEFAULT NULL,
  `right_class` varchar(30) DEFAULT NULL,
  `right_method` varchar(30) DEFAULT NULL,
  `right_detail` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`right_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_rights
-- ----------------------------
BEGIN;
INSERT INTO `ge_rights` VALUES (1, '密码修改', 'system', 'password', NULL);
INSERT INTO `ge_rights` VALUES (2, '更新缓存', 'system', 'cache', NULL);
INSERT INTO `ge_rights` VALUES (3, ' 站点设置', 'setting', 'site', NULL);
INSERT INTO `ge_rights` VALUES (4, '后台设置', 'setting', 'backend', NULL);
INSERT INTO `ge_rights` VALUES (5, '插件管理[列表]', 'plugin', 'view', NULL);
INSERT INTO `ge_rights` VALUES (6, '添加插件', 'plugin', 'add', NULL);
INSERT INTO `ge_rights` VALUES (7, '修改插件', 'plugin', 'edit', NULL);
INSERT INTO `ge_rights` VALUES (8, '卸载插件', 'plugin', 'del', NULL);
INSERT INTO `ge_rights` VALUES (9, '导出插件', 'plugin', 'export', NULL);
INSERT INTO `ge_rights` VALUES (10, '导入插件', 'plugin', 'import', NULL);
INSERT INTO `ge_rights` VALUES (11, '激活插件', 'plugin', 'active', NULL);
INSERT INTO `ge_rights` VALUES (12, '禁用插件', 'plugin', 'deactive', NULL);
INSERT INTO `ge_rights` VALUES (13, '运行插件', 'module', 'run', NULL);
INSERT INTO `ge_rights` VALUES (14, '内容模型管理[列表]', 'model', 'view', NULL);
INSERT INTO `ge_rights` VALUES (15, '添加内容模型', 'model', 'add', NULL);
INSERT INTO `ge_rights` VALUES (16, '修改内容模型', 'model', 'edit', NULL);
INSERT INTO `ge_rights` VALUES (17, '删除内容模型', 'model', 'del', NULL);
INSERT INTO `ge_rights` VALUES (18, '内容模型字段管理[列表]', 'model', 'fields', NULL);
INSERT INTO `ge_rights` VALUES (19, '添加内容模型字段', 'model', 'add_filed', NULL);
INSERT INTO `ge_rights` VALUES (20, '修改内容模型字段', 'model', 'edit_field', NULL);
INSERT INTO `ge_rights` VALUES (21, '删除内容模型字段', 'model', 'del_field', NULL);
INSERT INTO `ge_rights` VALUES (22, '分类模型管理[列表]', 'category', 'view', NULL);
INSERT INTO `ge_rights` VALUES (23, '添加分类模型', 'category', 'add', NULL);
INSERT INTO `ge_rights` VALUES (24, '修改分类模型', 'category', 'edit', NULL);
INSERT INTO `ge_rights` VALUES (25, '删除分类模型', 'category', 'del', NULL);
INSERT INTO `ge_rights` VALUES (26, '分类模型字段管理[列表]', 'category', 'fields', NULL);
INSERT INTO `ge_rights` VALUES (27, '添加分类模型字段', 'category', 'add_filed', NULL);
INSERT INTO `ge_rights` VALUES (28, '修改分类模型字段', 'category', 'edit_field', NULL);
INSERT INTO `ge_rights` VALUES (29, '删除分类模型字段', 'category', 'del_field', NULL);
INSERT INTO `ge_rights` VALUES (30, '内容管理[列表]', 'content', 'view', NULL);
INSERT INTO `ge_rights` VALUES (31, '添加内容[表单]', 'content', 'form', 'add');
INSERT INTO `ge_rights` VALUES (32, '修改内容[表单]', 'content', 'form', 'edit');
INSERT INTO `ge_rights` VALUES (33, '添加内容[动作]', 'content', 'save', 'add');
INSERT INTO `ge_rights` VALUES (34, '修改内容[动作]', 'content', 'save', 'edit');
INSERT INTO `ge_rights` VALUES (35, '删除内容', 'content', 'del', NULL);
INSERT INTO `ge_rights` VALUES (36, '分类管理[列表]', 'category_content', 'view', NULL);
INSERT INTO `ge_rights` VALUES (37, '添加分类[表单]', 'category_content', 'form', 'add');
INSERT INTO `ge_rights` VALUES (38, '修改分类[表单]', 'category_content', 'form', 'edit');
INSERT INTO `ge_rights` VALUES (39, '添加分类[动作]', 'category_content', 'save', 'add');
INSERT INTO `ge_rights` VALUES (40, '修改分类[动作]', 'category_content', 'save', 'edit');
INSERT INTO `ge_rights` VALUES (41, '删除分类', 'category_content', 'del', NULL);
INSERT INTO `ge_rights` VALUES (42, '用户组管理[列表]', 'role', 'view', NULL);
INSERT INTO `ge_rights` VALUES (43, '添加用户组', 'role', 'add', NULL);
INSERT INTO `ge_rights` VALUES (44, '修改用户组', 'role', 'edit', NULL);
INSERT INTO `ge_rights` VALUES (45, '删除用户组', 'role', 'del', NULL);
INSERT INTO `ge_rights` VALUES (46, '用户管理[列表]', 'user', 'view', NULL);
INSERT INTO `ge_rights` VALUES (47, '添加用户', 'user', 'add', NULL);
INSERT INTO `ge_rights` VALUES (48, '修改用户', 'user', 'edit', NULL);
INSERT INTO `ge_rights` VALUES (49, '删除用户', 'user', 'del', NULL);
INSERT INTO `ge_rights` VALUES (50, '数据库备份', 'database', 'index', NULL);
INSERT INTO `ge_rights` VALUES (51, '数据库还原', 'database', 'recover', NULL);
INSERT INTO `ge_rights` VALUES (52, '数据库优化', 'database', 'optimize', NULL);
COMMIT;

-- ----------------------------
-- Table structure for ge_roles
-- ----------------------------
DROP TABLE IF EXISTS `ge_roles`;
CREATE TABLE `ge_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `rights` varchar(255) NOT NULL,
  `models` varchar(500) NOT NULL,
  `category_models` varchar(255) NOT NULL,
  `plugins` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_roles
-- ----------------------------
BEGIN;
INSERT INTO `ge_roles` VALUES (1, 'root', '', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for ge_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ge_sessions`;
CREATE TABLE `ge_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`) USING BTREE,
  KEY `last_activity_idx` (`last_activity`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_sessions
-- ----------------------------
BEGIN;
INSERT INTO `ge_sessions` VALUES ('8b26373cc2bb5fd44967947b10500976', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573471, 'a:3:{s:9:\"user_data\";s:0:\"\";s:17:\"throttles_adminer\";i:1;s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('1ad3294be2bf6624c57cc2ee43309b7a', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573508, '');
INSERT INTO `ge_sessions` VALUES ('feb047d94da50c147d0afd59e6893ad9', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573508, '');
INSERT INTO `ge_sessions` VALUES ('a563cf4f4bd19a32d9c38771cedda2b7', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573529, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('9e68c8bfd3263e3cddce7fdc4be32eae', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573529, '');
INSERT INTO `ge_sessions` VALUES ('cf3fc591d05a7713df09e9b39d34bf14', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573529, '');
INSERT INTO `ge_sessions` VALUES ('1e17ede92611ae15283c8ef6adaf6598', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573532, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('164dd293e4a1054b938080b5fce3ce78', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573532, '');
INSERT INTO `ge_sessions` VALUES ('ec9d37f1387c9fda2556aaa1b06dbaa9', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573532, '');
INSERT INTO `ge_sessions` VALUES ('4a836e5db76523778e15cde32de4a98e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573534, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('137d033453810be812eded0cf00e04fd', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573535, '');
INSERT INTO `ge_sessions` VALUES ('755c0eb6f533cd73efc81765830da248', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573535, '');
INSERT INTO `ge_sessions` VALUES ('46679c42c487f6e9254cdbacf04ea2a8', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573915, '');
INSERT INTO `ge_sessions` VALUES ('1e9b24971277447c80c2a6da720f2235', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573918, '');
INSERT INTO `ge_sessions` VALUES ('bc8a089dcdbbe9af3766302f8640a1fb', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573936, '');
INSERT INTO `ge_sessions` VALUES ('14cfa7923cd70ebba41ef496c98229c1', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573936, '');
INSERT INTO `ge_sessions` VALUES ('fe8a3b54c069f42942ffb0a5d53fc289', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573937, '');
INSERT INTO `ge_sessions` VALUES ('78b3ca8f285ee591a5540375608f9bed', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573937, '');
INSERT INTO `ge_sessions` VALUES ('fc9c12aa597b7ad6ce953380b020df0e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573974, '');
INSERT INTO `ge_sessions` VALUES ('8eafe603301eee4973e2b993462b9e54', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573975, '');
INSERT INTO `ge_sessions` VALUES ('c1b3339aeb978b26dd126e0c8ead804d', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618573978, '');
INSERT INTO `ge_sessions` VALUES ('a244da63628b69b1edcd71aa5054a038', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574006, '');
INSERT INTO `ge_sessions` VALUES ('8b1f640a196bb1447885df92366e78db', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574006, '');
INSERT INTO `ge_sessions` VALUES ('9f600e45a2517bb2aca456c8c132a54d', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574030, '');
INSERT INTO `ge_sessions` VALUES ('5ff2edf2aaabd3e3e4dbf24bc8ddc000', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574030, '');
INSERT INTO `ge_sessions` VALUES ('f83c64a5cf5e9307ea3c2afbb162fa49', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574034, '');
INSERT INTO `ge_sessions` VALUES ('aacdedfb31465041c9aef29e35b0f9b4', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574034, '');
INSERT INTO `ge_sessions` VALUES ('3d52a663db19d7730a96ade848f0d4a7', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574035, '');
INSERT INTO `ge_sessions` VALUES ('182b2d9dfd778355ccef4da490fffa32', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574035, '');
INSERT INTO `ge_sessions` VALUES ('e188f5b143484b44ccd047d02c2c5a8c', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574035, '');
INSERT INTO `ge_sessions` VALUES ('9b3b25a0e2044d310557ab9cb08ff24f', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574036, '');
INSERT INTO `ge_sessions` VALUES ('3bd63cabdc8fc65b0b4670b8892aeafe', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574036, '');
INSERT INTO `ge_sessions` VALUES ('a0fe0849b2ddd3ba2f0d8f8db1a7a69c', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574036, '');
INSERT INTO `ge_sessions` VALUES ('319e8a95359736c8f41b94366240abe8', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574036, '');
INSERT INTO `ge_sessions` VALUES ('6185404fb4361912fa15233cc408a0fd', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574036, '');
INSERT INTO `ge_sessions` VALUES ('d6422965afbaac48c6101a2cdfd2ebd2', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574037, '');
INSERT INTO `ge_sessions` VALUES ('5e332c1066082e9f102eac3f24f33678', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574057, '');
INSERT INTO `ge_sessions` VALUES ('8074290ec0fbca789e9a3f4935c84aa4', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574057, '');
INSERT INTO `ge_sessions` VALUES ('337a6007daa93d3d6e37895daa7ef535', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574058, '');
INSERT INTO `ge_sessions` VALUES ('b4f6876241734e38d39ac535ba46c0fe', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574058, '');
INSERT INTO `ge_sessions` VALUES ('bf33f742c4ccbddc49aff93079608555', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574059, '');
INSERT INTO `ge_sessions` VALUES ('9a1de4ae24a1098ada3f68ba46077b09', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574059, '');
INSERT INTO `ge_sessions` VALUES ('4decb9fbe3d977ae5440127d9942fbb4', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574108, '');
INSERT INTO `ge_sessions` VALUES ('13924dab4a09584ec7231bacf40eb820', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574109, '');
INSERT INTO `ge_sessions` VALUES ('27f85e4a482caf77ab96334eb3a8f359', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574109, '');
INSERT INTO `ge_sessions` VALUES ('cb3f387fd97ffc5ab5a7552a6116edc5', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574109, '');
INSERT INTO `ge_sessions` VALUES ('660870d8d5aec6359a03ffecd004aa9c', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574110, '');
INSERT INTO `ge_sessions` VALUES ('31df40c203c180023bdddc8caa5b25de', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574110, '');
INSERT INTO `ge_sessions` VALUES ('37a444f135fb18d7a89c530113c9c553', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574112, '');
INSERT INTO `ge_sessions` VALUES ('a794a67385b42d428ec214ec6b4b827e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574112, '');
INSERT INTO `ge_sessions` VALUES ('edb4edf58640d13650ac6a3d20a1132e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574112, '');
INSERT INTO `ge_sessions` VALUES ('ae34bf0e4848a8155fcb30e67b643713', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574113, '');
INSERT INTO `ge_sessions` VALUES ('6785db064016c04986b96ec4ff01b7df', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574113, '');
INSERT INTO `ge_sessions` VALUES ('f035547ab98fd5a713afb50098e08cf6', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574147, '');
INSERT INTO `ge_sessions` VALUES ('b8e18b7bba0bcf9e67ebc375e389818b', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574159, '');
INSERT INTO `ge_sessions` VALUES ('7451dfe387ba4405a2f915de272348c3', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574160, '');
INSERT INTO `ge_sessions` VALUES ('875054e2669350224bb23a4b634eddcb', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574160, '');
INSERT INTO `ge_sessions` VALUES ('ffae48dd9ba7b57225d73603528bc1bd', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574160, '');
INSERT INTO `ge_sessions` VALUES ('f7dbf28a71fb275d0546f04dbb60f69b', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574188, '');
INSERT INTO `ge_sessions` VALUES ('da7c02259c2d8c62d630cca9db1663f1', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574191, '');
INSERT INTO `ge_sessions` VALUES ('9cd17c8811bea3a95b6cf92869a3dcaa', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574192, '');
INSERT INTO `ge_sessions` VALUES ('abf2581ba1124b628bbf488dd2353bea', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574192, '');
INSERT INTO `ge_sessions` VALUES ('c78d214c222058f53e22ec6a35905f9f', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574275, '');
INSERT INTO `ge_sessions` VALUES ('ed819c5eb0456d48f40b36c6d676d478', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574288, '');
INSERT INTO `ge_sessions` VALUES ('05cb575291a12821efe2c42c9ffd3fe1', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574299, '');
INSERT INTO `ge_sessions` VALUES ('e4127cec877f6772d8945a38f15433a8', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574301, '');
INSERT INTO `ge_sessions` VALUES ('af894e795607c3a23cf65e5867d84d3d', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574301, '');
INSERT INTO `ge_sessions` VALUES ('51e0a8a93c15f9b74762f95aaeb6ab36', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574303, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('94e80b54d283366f5156c2e3f0515149', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574303, '');
INSERT INTO `ge_sessions` VALUES ('98d1c8dc69921e3b87a36e4124ca74ff', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574303, '');
INSERT INTO `ge_sessions` VALUES ('d4218365aba67d486fac325bc2831f7c', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574313, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('024bc9e705d7dc714e787815ecb8bc64', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574313, '');
INSERT INTO `ge_sessions` VALUES ('229051d1bb4b65b31969b6bd50d6d84e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574313, '');
INSERT INTO `ge_sessions` VALUES ('1baba67c689624d195dfa5098bb9c824', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574314, 'a:2:{s:9:\"user_data\";s:0:\"\";s:15:\"flash:new:error\";s:31:\"用户名和密码不能为空!\";}');
INSERT INTO `ge_sessions` VALUES ('9bf9aac131579831e6dda3ed9fb48457', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574314, '');
INSERT INTO `ge_sessions` VALUES ('33f51c1b763de7674f7888e5836f2197', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574354, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('1c36dcf372102400f5e2cc7af545291d', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574354, '');
INSERT INTO `ge_sessions` VALUES ('87aa7dc7f1f65f159874a6bb84862421', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574354, '');
INSERT INTO `ge_sessions` VALUES ('35ca7e2e57f3d68b326db82b46663d05', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574409, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('dd52adabcd8702247eed9419dd439c45', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574409, '');
INSERT INTO `ge_sessions` VALUES ('94f093b4c046bb4b478d72a863c725a6', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574409, '');
INSERT INTO `ge_sessions` VALUES ('db647f1740f74d133b6f577e0f63a6f7', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574410, 'a:2:{s:9:\"user_data\";s:0:\"\";s:15:\"flash:new:error\";s:31:\"用户名和密码不能为空!\";}');
INSERT INTO `ge_sessions` VALUES ('9e344257e46d433bb2bd55eca3ba08cb', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574410, '');
INSERT INTO `ge_sessions` VALUES ('6c01da088ec91881b6617b2244c2500f', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574410, 'a:2:{s:9:\"user_data\";s:0:\"\";s:15:\"flash:new:error\";s:31:\"用户名和密码不能为空!\";}');
INSERT INTO `ge_sessions` VALUES ('b73287adefb843153afcef1b04acbfb6', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574410, '');
INSERT INTO `ge_sessions` VALUES ('152f5691b90f8b5bdd2cec25bab148ba', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574411, 'a:2:{s:9:\"user_data\";s:0:\"\";s:15:\"flash:new:error\";s:31:\"用户名和密码不能为空!\";}');
INSERT INTO `ge_sessions` VALUES ('c92fd8fef3784f1a0f2dbbb7cc4bfcd6', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574411, '');
INSERT INTO `ge_sessions` VALUES ('ca403ff59603e475dc10db0165573cb2', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574412, 'a:2:{s:9:\"user_data\";s:0:\"\";s:15:\"flash:new:error\";s:31:\"用户名和密码不能为空!\";}');
INSERT INTO `ge_sessions` VALUES ('428fe3dedcb29352a339064e824086ea', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574412, '');
INSERT INTO `ge_sessions` VALUES ('a05ebb55b3491f06b14e64662bd82413', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574412, 'a:2:{s:9:\"user_data\";s:0:\"\";s:15:\"flash:new:error\";s:31:\"用户名和密码不能为空!\";}');
INSERT INTO `ge_sessions` VALUES ('7a9e3d6f822277317552c8d603fa3a6b', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574412, '');
INSERT INTO `ge_sessions` VALUES ('f1d82d1c4a361ad38d3e111b105991c3', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574456, '');
INSERT INTO `ge_sessions` VALUES ('72a7f492b0755d1fbdde9dd0f3924da9', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574456, '');
INSERT INTO `ge_sessions` VALUES ('efc97f14a203b136bb4f790e1d90773d', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574460, '');
INSERT INTO `ge_sessions` VALUES ('b55ad3d360af486d2a05dc3eab5ef371', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574501, '');
INSERT INTO `ge_sessions` VALUES ('2799d26b9ca6cf801492d9d209d4ae0c', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574501, '');
INSERT INTO `ge_sessions` VALUES ('67d08c506fc9203ca6ac12ce525bd938', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574501, '');
INSERT INTO `ge_sessions` VALUES ('08bfefeda46dafc5c12d28df2cc1bb76', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574505, '');
INSERT INTO `ge_sessions` VALUES ('ed3a2b94e580ddb0f2f22ef2ea4b0a38', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574522, '');
INSERT INTO `ge_sessions` VALUES ('9fed3f4969dab738af6d747ff9c5a60f', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574522, '');
INSERT INTO `ge_sessions` VALUES ('7c0cf79ef315722dc85943ef8499b697', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574526, '');
INSERT INTO `ge_sessions` VALUES ('b0440a87a15477321f781d7716b01923', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574558, '');
INSERT INTO `ge_sessions` VALUES ('a0aad3c586d3eea43e5edf8ded6eb39e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574558, '');
INSERT INTO `ge_sessions` VALUES ('4e841dea2486893ed47718e2a2a91385', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574562, '');
INSERT INTO `ge_sessions` VALUES ('eb3ffd5d2948f86bb27028647dd25dcb', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574601, '');
INSERT INTO `ge_sessions` VALUES ('dab88e62f4801b53bf1ebdcd393a27bd', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574601, '');
INSERT INTO `ge_sessions` VALUES ('686e17b0c9ddf525f45b0384b102fe6e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574603, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('d6170a8f37306e8cafe3c05c08b78f09', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574651, '');
INSERT INTO `ge_sessions` VALUES ('6e7c59f6498eb0d0577b711f6ac68ecd', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574651, '');
INSERT INTO `ge_sessions` VALUES ('ac4fe1bf51d596a284c99559f12b0e8f', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574655, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('081db4b51540c00e734cff1e9e5d5b93', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574655, '');
INSERT INTO `ge_sessions` VALUES ('f924694c1fc73f989e618dc3ab004545', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574655, '');
INSERT INTO `ge_sessions` VALUES ('4ae7296e935145bc89c96ae75490f664', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574686, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('633c868928b819190eaafcb47ac0e44d', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574686, '');
INSERT INTO `ge_sessions` VALUES ('b4a9b75c375f5c3310ae530f030ff2ff', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574686, '');
INSERT INTO `ge_sessions` VALUES ('6dac0d62088d73ef148d41f50d0939db', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574759, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('11dac1e6a8030a359ab61583656218f3', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574759, '');
INSERT INTO `ge_sessions` VALUES ('3d18e4a23a3ee328f57c470b1a8088f8', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574759, '');
INSERT INTO `ge_sessions` VALUES ('588161c73e81f0ca032f39f833daa353', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574786, '');
INSERT INTO `ge_sessions` VALUES ('0ab3347049eda5ffa066fc97c2358106', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574786, '');
INSERT INTO `ge_sessions` VALUES ('bd3d09260bcd99605e413804c89ec58a', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574790, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('5fdc8260ff24ea01648ccf92b5519802', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574864, '');
INSERT INTO `ge_sessions` VALUES ('725782a7e8badd57bfcc6408a1351570', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574864, '');
INSERT INTO `ge_sessions` VALUES ('ed0a9c8d72219c19ec0ee3b522dd3bb1', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574864, '');
INSERT INTO `ge_sessions` VALUES ('30d99f7fbd5be59240eb9a73b3f261a0', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574867, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('fb08bc6dd20ff20726a94f8035dbd137', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574867, '');
INSERT INTO `ge_sessions` VALUES ('bbd9eb04eb000b9a93f4ff31e325e6a1', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574867, '');
INSERT INTO `ge_sessions` VALUES ('737db89c97a8c34ec6bf71094f0ba632', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574895, '');
INSERT INTO `ge_sessions` VALUES ('53f90f6d855e8fd60d6f1e7dc1dd4cf8', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574896, '');
INSERT INTO `ge_sessions` VALUES ('11ff4fcd22a495f97cc24c37f2597e49', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574901, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('952342231a9c2993d21452bbd4e6d118', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574901, '');
INSERT INTO `ge_sessions` VALUES ('0f5611f60abda1b7b7aa8119cb3824ba', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574901, '');
INSERT INTO `ge_sessions` VALUES ('ba17b3324ab29d0561704c1af0491fb0', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574902, 'a:2:{s:9:\"user_data\";s:0:\"\";s:15:\"flash:new:error\";s:31:\"用户名和密码不能为空!\";}');
INSERT INTO `ge_sessions` VALUES ('003ca28ef2f38a4d48cba9fe76262df5', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618574902, '');
INSERT INTO `ge_sessions` VALUES ('5a4d91a26d37669b9f1f338bce88e15a', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575502, '');
INSERT INTO `ge_sessions` VALUES ('7eac145b7fd74cc7f3fe60666413bef4', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575524, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('a3092d1714021a5efbf6e2d451cff555', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575524, '');
INSERT INTO `ge_sessions` VALUES ('eba26d75bc3d033a324a6f05122c1392', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575524, '');
INSERT INTO `ge_sessions` VALUES ('f9a2bc7109ddcb1694e7e4d79adb097e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575526, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('6d50b77c5e630f893332baa453c92bb0', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575526, '');
INSERT INTO `ge_sessions` VALUES ('04663c33eb60eb47c4ef98f9e96d6aa8', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575527, '');
INSERT INTO `ge_sessions` VALUES ('60c426344bc9c25e599c0094d44a6645', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575617, '');
INSERT INTO `ge_sessions` VALUES ('3766c70006773aa67df361e495f18b12', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575617, '');
INSERT INTO `ge_sessions` VALUES ('16ccadfd4a17e9e3d26c4715601248b2', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575619, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('f16eb58a1bd6e28d0527cdf0b237aa9e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575619, '');
INSERT INTO `ge_sessions` VALUES ('f1f7d5cb8aa0ed9f4480d311d95b0b61', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575619, '');
INSERT INTO `ge_sessions` VALUES ('720bffba8078c305d3b5230a1b00e152', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575620, 'a:2:{s:9:\"user_data\";s:0:\"\";s:15:\"flash:new:error\";s:31:\"用户名和密码不能为空!\";}');
INSERT INTO `ge_sessions` VALUES ('e2e17ae8c09222b1c9e14b17bf68488c', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575620, '');
INSERT INTO `ge_sessions` VALUES ('508028125e7b80077b64571d44a724b6', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575651, '');
INSERT INTO `ge_sessions` VALUES ('a312bf0441ea8ac13617c48b1e4fe003', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575651, '');
INSERT INTO `ge_sessions` VALUES ('db12598cddfddb8d289af2747cd02411', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575653, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('d0ae347e709477d6ac0e0cf87aa06ba0', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575676, '');
INSERT INTO `ge_sessions` VALUES ('7bf3ee1885c94f3f4ba808ea9f948e23', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575676, '');
INSERT INTO `ge_sessions` VALUES ('67202e6a6d0303c3d969d03a2b5c49ea', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575676, '');
INSERT INTO `ge_sessions` VALUES ('e20f2b4f103e53f291a77419e3547303', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575679, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('7056eb236e434a34823fa6956029822f', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575679, '');
INSERT INTO `ge_sessions` VALUES ('bbff98dd731f5e855f25615c905ea163', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575679, '');
INSERT INTO `ge_sessions` VALUES ('b9161783d3d65f7633e76b0dd481125b', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575749, '');
INSERT INTO `ge_sessions` VALUES ('12a4833b71b30763a95dee66940de0e5', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575749, '');
INSERT INTO `ge_sessions` VALUES ('bdb2e694766260b3e532599adc9f3e75', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575749, '');
INSERT INTO `ge_sessions` VALUES ('3181196ef3d15a14f78d224dd499f9a9', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575752, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('d0310dbaf8c5d91b244aeceaaa8f17f6', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575752, '');
INSERT INTO `ge_sessions` VALUES ('1cb74275001a07cb732ccebe383ce584', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575752, '');
INSERT INTO `ge_sessions` VALUES ('fe115d5441bc71b9e9540ce6e2221e8f', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575956, '');
INSERT INTO `ge_sessions` VALUES ('139ab259bb1a547c1859b73a47e736ef', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575956, '');
INSERT INTO `ge_sessions` VALUES ('43b20f6a59c30a02a2d4a32164e237e8', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575984, '');
INSERT INTO `ge_sessions` VALUES ('9ba443c320f7f9cc16293a2ca4db9e1e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575984, '');
INSERT INTO `ge_sessions` VALUES ('7ede242bbbad7564b53206217b5a9b67', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575985, '');
INSERT INTO `ge_sessions` VALUES ('45d20d51a589954844f18bf4607f4988', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618575987, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('8f775710612f0768deea7a00931fd7c9', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576114, '');
INSERT INTO `ge_sessions` VALUES ('71c215b538a682f4947bacb5edd6c47b', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576114, '');
INSERT INTO `ge_sessions` VALUES ('f5be158410dd3bd1e49a8554089dd11c', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576116, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('f9cc0f6d9b2add6696973ffe134d119f', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576116, '');
INSERT INTO `ge_sessions` VALUES ('ebe51e273b8e7a1e9f58eef9f7bd50ea', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576136, '');
INSERT INTO `ge_sessions` VALUES ('de59cbbf4705594c192bd25f5f1370f3', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576137, '');
INSERT INTO `ge_sessions` VALUES ('6269053df486f3788dadd4e4282e7a94', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576140, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('72d5d6f6b51741eb5bd82d8d3af0e9df', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576140, '');
INSERT INTO `ge_sessions` VALUES ('03cdbea3d313761315aee99197ad9823', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576140, '');
INSERT INTO `ge_sessions` VALUES ('a83d45f5ef3b312d052c01a4dd311167', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576162, '');
INSERT INTO `ge_sessions` VALUES ('35b8317ffb323487556de56fd2d58861', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576164, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('11a8eb68fb2b798e86606b6a6001e973', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576164, '');
INSERT INTO `ge_sessions` VALUES ('0fce62a641533719875ca1438e0c3edb', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576178, '');
INSERT INTO `ge_sessions` VALUES ('ad302fbb3875b72929f50640175a39b1', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576178, '');
INSERT INTO `ge_sessions` VALUES ('8cc87757cb48944419c7e5e7bd4b038e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576180, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('f7ec986f326b5ec8f9a1106b39abb6cf', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576180, '');
INSERT INTO `ge_sessions` VALUES ('85457106b96cd53b0d28ef857cd3736f', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576196, '');
INSERT INTO `ge_sessions` VALUES ('7b0a721e4c85887842147600c2ad32e5', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576199, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('2729f3a9051b70cb52f6d204acefef58', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576199, '');
INSERT INTO `ge_sessions` VALUES ('c1f9981395347056b98c30deea5eb069', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576245, '');
INSERT INTO `ge_sessions` VALUES ('67b4a65394b4a0be81bbad6c39dbb2c1', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576308, '');
INSERT INTO `ge_sessions` VALUES ('c06972c86886b9ef1206137f3cc112db', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576309, '');
INSERT INTO `ge_sessions` VALUES ('7fda8121240e505c579ccd5556180085', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576310, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('83b86599de18b2336c785a4638acea9a', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576531, '');
INSERT INTO `ge_sessions` VALUES ('9d491ee8c3ff066a544d07c67497b3ae', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576531, '');
INSERT INTO `ge_sessions` VALUES ('525e1d48ca6c7534d19abb5ecdbfa3fa', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576531, '');
INSERT INTO `ge_sessions` VALUES ('65925f4e1b4c9e4c3a7de40fae8744dd', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576533, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('3214a3fb10e482bf73b76a1fdb0a8d1e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576607, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('239d9a41cfc330b49e1d2e982472ab06', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576974, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('9f5a5beee0452cd9d5d711085443683d', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618576974, '');
INSERT INTO `ge_sessions` VALUES ('20db5a478e9ffbdc8f7ddec1ecbd9b9f', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577045, '');
INSERT INTO `ge_sessions` VALUES ('537bd249acd7ecedf03ea933392afc0b', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577048, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('d4f99ea4636f3e19a08f572f3ca1015e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577056, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('c7de6b48c7aa7c3e1273ac2caee55924', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577144, '');
INSERT INTO `ge_sessions` VALUES ('448f8363078dd839b7c29497a4eb5b48', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577146, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('619f0292c7d049c072b3a691a9cd31cf', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577205, '');
INSERT INTO `ge_sessions` VALUES ('08d433c2311c133d5f50e50ad7edd1a2', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577205, '');
INSERT INTO `ge_sessions` VALUES ('c571bfb1532b1651aee3694a53e3c5c7', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577207, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('752dc8e554583c96b04bb90c938fc7fa', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577294, '');
INSERT INTO `ge_sessions` VALUES ('9ef53af1c48aba57c6a9411d94a83e1b', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577299, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('1241b234872cf11fc068233b8b39099b', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577299, '');
INSERT INTO `ge_sessions` VALUES ('8a708c50c32600d07e844d41925fd76a', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577317, '');
INSERT INTO `ge_sessions` VALUES ('120c7f1b53bdb82e2eb527b54a5a4341', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577317, '');
INSERT INTO `ge_sessions` VALUES ('f4d72f355340f2d3a356f726ef2fde0d', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577317, '');
INSERT INTO `ge_sessions` VALUES ('96dbacfa14ae6aa60cfe1bac8bf527c4', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577319, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('593681ad8e896e8023316b17c9c04c7d', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577319, '');
INSERT INTO `ge_sessions` VALUES ('f49dd88280f6683ceb9619b2063319f5', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577633, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('5f829f7ea75f1244f482beb1f3ee8774', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577633, '');
INSERT INTO `ge_sessions` VALUES ('5726ce017144c587acc791489e018c59', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577916, '');
INSERT INTO `ge_sessions` VALUES ('ceb539391c433a5998cbe8988a5a4f7f', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577916, '');
INSERT INTO `ge_sessions` VALUES ('ae08042d4d57e3cce131e460158c5c10', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577917, '');
INSERT INTO `ge_sessions` VALUES ('0c5657bed813fd619f626af58cecae39', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577919, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('9bb96b6ab9e03ffb53113f5c8c8eca4f', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618577919, '');
INSERT INTO `ge_sessions` VALUES ('0475f945a6f313502ea977a06b06d1d0', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618578187, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('ea88b23540dd1390276cb7f9128835f2', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618578187, '');
INSERT INTO `ge_sessions` VALUES ('000e86a6325516f6b8a26b7a5a3a93f2', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618578199, '');
INSERT INTO `ge_sessions` VALUES ('09a1ba6c1118920ea08c9cffa2350b2e', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618578244, '');
INSERT INTO `ge_sessions` VALUES ('7c0efbfa79a2a34780b0d61b8a39b26b', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618578253, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `ge_sessions` VALUES ('c740976957db718fb2e9e9ca88ba7850', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', 1618579967, 'a:4:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";s:10:\"model_type\";s:5:\"model\";s:5:\"model\";s:4:\"user\";}');
INSERT INTO `ge_sessions` VALUES ('029dc7d18ad8ae299636aaea4ef2fe2a', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', 1631625915, 'a:2:{s:9:\"user_data\";s:0:\"\";s:3:\"uid\";s:1:\"1\";}');
COMMIT;

-- ----------------------------
-- Table structure for ge_site_settings
-- ----------------------------
DROP TABLE IF EXISTS `ge_site_settings`;
CREATE TABLE `ge_site_settings` (
  `site_name` varchar(50) DEFAULT NULL,
  `site_domain` varchar(50) DEFAULT NULL,
  `site_logo` varchar(50) DEFAULT NULL,
  `site_icp` varchar(50) DEFAULT NULL,
  `site_terms` text,
  `site_stats` varchar(200) DEFAULT NULL,
  `site_footer` varchar(500) DEFAULT NULL,
  `site_status` tinyint(1) DEFAULT '1',
  `site_close_reason` varchar(200) DEFAULT NULL,
  `site_keyword` varchar(200) DEFAULT NULL,
  `site_description` varchar(200) DEFAULT NULL,
  `site_theme` varchar(20) DEFAULT NULL,
  `attachment_url` varchar(50) DEFAULT NULL,
  `attachment_dir` varchar(20) DEFAULT NULL,
  `attachment_type` varchar(50) DEFAULT NULL,
  `attachment_maxupload` varchar(20) DEFAULT NULL,
  `thumbs_preferences` varchar(500) DEFAULT '[]'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_site_settings
-- ----------------------------
BEGIN;
INSERT INTO `ge_site_settings` VALUES ('dilicms3.0', '', 'images/logo.gif', '', '', '', '', 1, '网站维护升级中......', 'dilicms3.0', 'dilicms3.0', 'default', '/ocean/attachments', 'attachments', '*.jpg;*.gif;*.png;*.doc', '2097152', '[]');
COMMIT;

-- ----------------------------
-- Table structure for ge_throttles
-- ----------------------------
DROP TABLE IF EXISTS `ge_throttles`;
CREATE TABLE `ge_throttles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_throttles
-- ----------------------------
BEGIN;
INSERT INTO `ge_throttles` VALUES (1, 1, 'attempt_login', '180.167.178.150', '2018-08-10 15:43:38', '2018-08-10 15:43:38');
INSERT INTO `ge_throttles` VALUES (2, 1, 'attempt_login', '180.167.178.150', '2018-08-10 15:43:46', '2018-08-10 15:43:46');
INSERT INTO `ge_throttles` VALUES (3, 1, 'attempt_login', '180.167.178.150', '2018-08-10 15:43:51', '2018-08-10 15:43:51');
INSERT INTO `ge_throttles` VALUES (4, 1, 'attempt_login', '180.167.178.150', '2018-11-17 16:54:15', '2018-11-17 16:54:15');
INSERT INTO `ge_throttles` VALUES (5, 1, 'attempt_login', '180.167.178.150', '2018-12-06 18:08:38', '2018-12-06 18:08:38');
INSERT INTO `ge_throttles` VALUES (6, 1, 'attempt_login', '180.167.178.150', '2018-12-06 18:17:39', '2018-12-06 18:17:39');
INSERT INTO `ge_throttles` VALUES (7, 1, 'attempt_login', '180.167.178.150', '2018-12-11 14:47:04', '2018-12-11 14:47:04');
COMMIT;

-- ----------------------------
-- Table structure for ge_u_m_user
-- ----------------------------
DROP TABLE IF EXISTS `ge_u_m_user`;
CREATE TABLE `ge_u_m_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `update_user` tinyint(10) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ge_u_m_user
-- ----------------------------
BEGIN;
INSERT INTO `ge_u_m_user` VALUES (1, 1618580204, 1618580204, 1, 1, '123');
COMMIT;

-- ----------------------------
-- Table structure for ge_validations
-- ----------------------------
DROP TABLE IF EXISTS `ge_validations`;
CREATE TABLE `ge_validations` (
  `k` varchar(20) DEFAULT NULL,
  `v` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of ge_validations
-- ----------------------------
BEGIN;
INSERT INTO `ge_validations` VALUES ('required', '必填');
INSERT INTO `ge_validations` VALUES ('valid_email', 'E-mail格式');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
