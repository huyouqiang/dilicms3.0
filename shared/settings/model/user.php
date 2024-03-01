<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['user']=array (
  'id' => '187',
  'name' => 'user',
  'description' => '用户信息',
  'perpage' => '2',
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
    1007 => 
    array (
      'id' => '1007',
      'name' => 'user_gender',
      'description' => '性别',
      'model' => '187',
      'type' => 'radio',
      'length' => '10',
      'values' => 
      array (
        1 => '男',
        2 => '女',
      ),
      'width' => '0',
      'height' => '0',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '2',
      'editable' => '1',
    ),
    1008 => 
    array (
      'id' => '1008',
      'name' => 'user_address',
      'description' => '地址',
      'model' => '187',
      'type' => 'textarea',
      'length' => '300',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '3',
      'editable' => '1',
    ),
  ),
  'listable' => 
  array (
    0 => '1006',
    1 => '1007',
    2 => '1008',
  ),
  'searchable' => 
  array (
    0 => '1006',
    1 => '1007',
    2 => '1008',
  ),
);