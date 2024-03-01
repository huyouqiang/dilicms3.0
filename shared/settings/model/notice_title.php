<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['notice_title']=array (
  'id' => '179',
  'name' => 'notice_title',
  'description' => '通知标题列表',
  'perpage' => '50',
  'hasattach' => '1',
  'built_in' => '0',
  'thumb_preferences' => '{"enabled":[],"default":"original"}',
  'belong_group' => '23',
  'model_sort' => '0',
  'fields' => 
  array (
    916 => 
    array (
      'id' => '916',
      'name' => 'headmaster_id',
      'description' => '班主任id',
      'model' => '179',
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
    917 => 
    array (
      'id' => '917',
      'name' => 'notice_title',
      'description' => '通知标题',
      'model' => '179',
      'type' => 'input',
      'length' => '30',
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
    0 => '916',
    1 => '917',
  ),
  'searchable' => 
  array (
    0 => '916',
    1 => '917',
  ),
);