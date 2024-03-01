<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['notice_read_record']=array (
  'id' => '166',
  'name' => 'notice_read_record',
  'description' => '通知阅读记录',
  'perpage' => '50',
  'hasattach' => '1',
  'built_in' => '0',
  'thumb_preferences' => '{"enabled":[],"default":"original"}',
  'belong_group' => '23',
  'model_sort' => '0',
  'fields' => 
  array (
    796 => 
    array (
      'id' => '796',
      'name' => 'wx_user_id',
      'description' => '微信用户id',
      'model' => '166',
      'type' => 'input',
      'length' => '10',
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
    797 => 
    array (
      'id' => '797',
      'name' => 'notice_id',
      'description' => '通知id',
      'model' => '166',
      'type' => 'input',
      'length' => '10',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '2',
      'editable' => '1',
    ),
  ),
  'listable' => 
  array (
    0 => '796',
    1 => '797',
  ),
  'searchable' => 
  array (
    0 => '796',
    1 => '797',
  ),
);