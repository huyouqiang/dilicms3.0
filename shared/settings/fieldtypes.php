<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting=array (
  'fieldtypes' => 
  array (
    'int' => '整形(INT)',
    'float' => '浮点型(FLOAT)',
    'input' => '单行文本框(VARCHAR)',
    'textarea' => '文本区域(VARCHAR)',
    'select_int' => '下拉菜单(INT)',
    'select' => '下拉菜单(VARCHAR)',
    'radio_int' => '单选按钮(INT)',
    'radio' => '单选按钮(VARCHAR)',
    'checkbox' => '复选框(VARCHAR)',
    'wysiwyg' => '编辑器(TEXT)',
    'wysiwyg_basic' => '编辑器(简)(TEXT)',
    'datetime' => '日期时间(VARCHAR)',
  ),
  'extra_fieldtypes' => 
  array (
    'file' => '文件上传(VARCHAR)',
  ),
  'validation' => 
  array (
    'required' => '必填',
    'valid_email' => 'E-mail格式',
  ),
);