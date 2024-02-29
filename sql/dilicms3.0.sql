/*
 Navicat Premium Data Transfer

 Source Server         : 本地-127
 Source Server Type    : MySQL
 Source Server Version : 50743 (5.7.43)
 Source Host           : localhost:3306
 Source Schema         : dilicms3.0

 Target Server Type    : MySQL
 Target Server Version : 50743 (5.7.43)
 File Encoding         : 65001

 Date: 29/02/2024 20:09:51
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
INSERT INTO `ge_admins` (`uid`, `username`, `password`, `salt`, `email`, `role`, `status`) VALUES (1, 'adminer', 'eccaf433bc006dce6e64c8db5023629b5cb719f2', '89417fa8e2', 'hello@dilicms.com', 1, 1);
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
INSERT INTO `ge_backend_settings` (`backend_theme`, `backend_lang`, `backend_root_access`, `backend_access_point`, `backend_title`, `backend_logo`, `plugin_dev_mode`, `backend_http_auth_on`, `backend_http_auth_user`, `backend_http_auth_password`) VALUES ('default', 'zh-cn', 1, '', '通用数据库管理系统', 'images/logo.jpeg', 0, 0, '', '');
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
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('int', '整形(INT)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('float', '浮点型(FLOAT)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('input', '单行文本框(VARCHAR)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('textarea', '文本区域(VARCHAR)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('select', '下拉菜单(VARCHAR)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('select_from_model', '下拉菜单(模型数据)(INT)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('linked_menu', '联动下拉菜单(VARCHAR)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('radio', '单选按钮(VARCHAR)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('radio_from_model', '单选按钮(模型数据)(INT)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('checkbox', '复选框(VARCHAR)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('checkbox_from_model', '复选框(模型数据)(VARCHAR)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('wysiwyg', '编辑器(TEXT)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('wysiwyg_basic', '编辑器(简)(TEXT)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('datetime', '日期时间(VARCHAR)');
INSERT INTO `ge_fieldtypes` (`k`, `v`) VALUES ('content', '内容模型调用(INT)');
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
INSERT INTO `ge_group` (`id`, `name`, `description`, `level`) VALUES (28, 'group_1', '分组1', 1);
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
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (1, 'system', 'home', '系统', 0, 0);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (2, 'system', 'home', '后台首页', 1, 1);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (3, 'system', 'home', '后台首页', 2, 2);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (4, 'setting', 'site', '系统设置', 1, 1);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (5, 'setting', 'site', '站点设置', 2, 4);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (6, 'setting', 'backend', '后台设置', 2, 4);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (7, 'system', 'password', '修改密码', 2, 4);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (8, 'system', 'cache', '更新缓存', 2, 4);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (9, 'model', 'view', '模型管理', 1, 1);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (10, 'model', 'view', '内容模型管理', 2, 9);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (11, 'category', 'view', '分类模型管理', 2, 9);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (12, 'plugin', 'view', '扩展管理', 1, 1);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (13, 'plugin', 'view', '插件管理', 2, 12);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (14, 'role', 'view', '权限管理', 1, 1);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (15, 'role', 'view', '用户组管理', 2, 14);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (16, 'user', 'view', '用户管理', 2, 14);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (17, 'content', 'view', '内容管理', 0, 0);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (18, 'content', 'view', '内容管理', 1, 17);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (19, 'category_content', 'view', '分类管理', 1, 17);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (20, 'module', 'run', '插件', 0, 0);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (21, 'database', 'index', '数据库管理', 1, 1);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (22, 'database', 'index', '数据库备份', 2, 21);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (23, 'database', 'recover', '数据库还原', 2, 21);
INSERT INTO `ge_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES (24, 'database', 'optimize', '数据库优化', 2, 21);
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
INSERT INTO `ge_model_fields` (`id`, `name`, `description`, `model`, `type`, `length`, `values`, `width`, `height`, `rules`, `ruledescription`, `searchable`, `listable`, `order`, `editable`) VALUES (1006, 'user_name', '用户名称', 187, 'input', 30, '', 0, 0, 'required', '', 1, 1, 1, 1);
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
INSERT INTO `ge_models` (`id`, `name`, `description`, `perpage`, `hasattach`, `built_in`, `thumb_preferences`, `belong_group`, `model_sort`) VALUES (187, 'user', '用户信息', '50', 1, 0, '{\"enabled\":[],\"default\":\"original\"}', 28, 0);
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
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (1, '密码修改', 'system', 'password', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (2, '更新缓存', 'system', 'cache', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (3, ' 站点设置', 'setting', 'site', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (4, '后台设置', 'setting', 'backend', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (5, '插件管理[列表]', 'plugin', 'view', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (6, '添加插件', 'plugin', 'add', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (7, '修改插件', 'plugin', 'edit', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (8, '卸载插件', 'plugin', 'del', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (9, '导出插件', 'plugin', 'export', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (10, '导入插件', 'plugin', 'import', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (11, '激活插件', 'plugin', 'active', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (12, '禁用插件', 'plugin', 'deactive', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (13, '运行插件', 'module', 'run', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (14, '内容模型管理[列表]', 'model', 'view', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (15, '添加内容模型', 'model', 'add', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (16, '修改内容模型', 'model', 'edit', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (17, '删除内容模型', 'model', 'del', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (18, '内容模型字段管理[列表]', 'model', 'fields', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (19, '添加内容模型字段', 'model', 'add_filed', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (20, '修改内容模型字段', 'model', 'edit_field', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (21, '删除内容模型字段', 'model', 'del_field', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (22, '分类模型管理[列表]', 'category', 'view', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (23, '添加分类模型', 'category', 'add', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (24, '修改分类模型', 'category', 'edit', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (25, '删除分类模型', 'category', 'del', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (26, '分类模型字段管理[列表]', 'category', 'fields', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (27, '添加分类模型字段', 'category', 'add_filed', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (28, '修改分类模型字段', 'category', 'edit_field', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (29, '删除分类模型字段', 'category', 'del_field', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (30, '内容管理[列表]', 'content', 'view', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (31, '添加内容[表单]', 'content', 'form', 'add');
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (32, '修改内容[表单]', 'content', 'form', 'edit');
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (33, '添加内容[动作]', 'content', 'save', 'add');
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (34, '修改内容[动作]', 'content', 'save', 'edit');
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (35, '删除内容', 'content', 'del', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (36, '分类管理[列表]', 'category_content', 'view', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (37, '添加分类[表单]', 'category_content', 'form', 'add');
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (38, '修改分类[表单]', 'category_content', 'form', 'edit');
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (39, '添加分类[动作]', 'category_content', 'save', 'add');
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (40, '修改分类[动作]', 'category_content', 'save', 'edit');
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (41, '删除分类', 'category_content', 'del', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (42, '用户组管理[列表]', 'role', 'view', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (43, '添加用户组', 'role', 'add', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (44, '修改用户组', 'role', 'edit', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (45, '删除用户组', 'role', 'del', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (46, '用户管理[列表]', 'user', 'view', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (47, '添加用户', 'user', 'add', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (48, '修改用户', 'user', 'edit', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (49, '删除用户', 'user', 'del', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (50, '数据库备份', 'database', 'index', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (51, '数据库还原', 'database', 'recover', NULL);
INSERT INTO `ge_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES (52, '数据库优化', 'database', 'optimize', NULL);
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
INSERT INTO `ge_roles` (`id`, `name`, `rights`, `models`, `category_models`, `plugins`) VALUES (1, 'root', '', '', '', '');
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
INSERT INTO `ge_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('a5df76dedf100e336f427110253dc512', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 1709205779, '');
INSERT INTO `ge_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('4a029cc7fed4311670c323e0c94221f2', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 1709205125, '');
INSERT INTO `ge_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('802c7d548e0c5d0d3b5b46ae9fc62ec2', '127.0.0.1', 'Mozilla/5.0 (iPad; CPU OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari', 1709205200, '');
INSERT INTO `ge_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('980fe41e40199bb530a9d9ad962511f2', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 1709204814, '');
INSERT INTO `ge_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('221c67e607fe56fe475762ee90e9c97b', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E1', 1709204827, '');
INSERT INTO `ge_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('c44e9c73038854a3a9e20ac3a81f9b72', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E1', 1709204470, '');
INSERT INTO `ge_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('fd18794eabb5123d435d7569971b0aeb', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 1709204412, '');
INSERT INTO `ge_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('ac649d949176867a903705e1be52afb8', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E1', 1709204326, '');
INSERT INTO `ge_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('0dfb756ece3f07145c27f0c89bdd44fe', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 1709204284, '');
INSERT INTO `ge_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('80ca3a4c61c72be34d67c8491956d6a1', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 1709204072, '');
INSERT INTO `ge_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('5b45d6d562273c925c17ae35aa34dde4', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E1', 1709204274, '');
INSERT INTO `ge_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('51dd9b188a7947b0de62e0d98a1413d6', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36', 1709203180, '');
INSERT INTO `ge_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES ('5e093f1c678a273ad01693b6e9e31c59', '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E1', 1709203206, '');
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
INSERT INTO `ge_site_settings` (`site_name`, `site_domain`, `site_logo`, `site_icp`, `site_terms`, `site_stats`, `site_footer`, `site_status`, `site_close_reason`, `site_keyword`, `site_description`, `site_theme`, `attachment_url`, `attachment_dir`, `attachment_type`, `attachment_maxupload`, `thumbs_preferences`) VALUES ('通用数据库管理系统', '', 'images/logo.jpeg', '', '', '', '', 1, '网站维护升级中......', 'dilicms3.0', 'dilicms3.0', 'default', '/ocean/attachments', 'attachments', '*.jpg;*.gif;*.png;*.doc', '2097152', '[]');
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
INSERT INTO `ge_throttles` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES (1, 1, 'attempt_login', '180.167.178.150', '2018-08-10 15:43:38', '2018-08-10 15:43:38');
INSERT INTO `ge_throttles` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES (2, 1, 'attempt_login', '180.167.178.150', '2018-08-10 15:43:46', '2018-08-10 15:43:46');
INSERT INTO `ge_throttles` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES (3, 1, 'attempt_login', '180.167.178.150', '2018-08-10 15:43:51', '2018-08-10 15:43:51');
INSERT INTO `ge_throttles` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES (4, 1, 'attempt_login', '180.167.178.150', '2018-11-17 16:54:15', '2018-11-17 16:54:15');
INSERT INTO `ge_throttles` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES (5, 1, 'attempt_login', '180.167.178.150', '2018-12-06 18:08:38', '2018-12-06 18:08:38');
INSERT INTO `ge_throttles` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES (6, 1, 'attempt_login', '180.167.178.150', '2018-12-06 18:17:39', '2018-12-06 18:17:39');
INSERT INTO `ge_throttles` (`id`, `user_id`, `type`, `ip`, `created_at`, `updated_at`) VALUES (7, 1, 'attempt_login', '180.167.178.150', '2018-12-11 14:47:04', '2018-12-11 14:47:04');
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
INSERT INTO `ge_u_m_user` (`id`, `create_time`, `update_time`, `create_user`, `update_user`, `user_name`) VALUES (1, 1618580204, 1618580204, 1, 1, '123');
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
INSERT INTO `ge_validations` (`k`, `v`) VALUES ('required', '必填');
INSERT INTO `ge_validations` (`k`, `v`) VALUES ('valid_email', 'E-mail格式');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
