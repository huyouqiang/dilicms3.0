<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['user']=array (
  'id' => '187',
  'name' => 'user',
  'description' => '用户信息',
  'perpage' => '50',
  'hasattach' => '1',
  'built_in' => '0',
  'thumb_preferences' => '{"enabled":[],"default":"original"}',
  'belong_group' => '28',
  'model_sort' => '0',
  'fields' => 
  array (
    1006 => 
    array (
      'id' => '1006',
      'name' => 'user_name',
      'description' => '用户名称',
      'model' => '187',
      'type' => 'input',
      'length' => '30',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '1',
      'editable' => '1',
    ),
  ),
  'listable' => 
  array (
    0 => '1006',
  ),
  'searchable' => 
  array (
    0 => '1006',
  ),
);