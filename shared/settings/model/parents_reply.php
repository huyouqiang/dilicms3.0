<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['parents_reply']=array (
  'id' => '177',
  'name' => 'parents_reply',
  'description' => '通知家长回复',
  'perpage' => '50',
  'hasattach' => '1',
  'built_in' => '0',
  'thumb_preferences' => '{"enabled":[],"default":"original"}',
  'belong_group' => '23',
  'model_sort' => '0',
  'fields' => 
  array (
    889 => 
    array (
      'id' => '889',
      'name' => 'wx_user_id',
      'description' => '微信用户id',
      'model' => '177',
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
    890 => 
    array (
      'id' => '890',
      'name' => 'notice_id',
      'description' => '通知id',
      'model' => '177',
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
    891 => 
    array (
      'id' => '891',
      'name' => 'reply',
      'description' => '家长回复',
      'model' => '177',
      'type' => 'radio',
      'length' => '10',
      'values' => 
      array (
        0 => '取消',
        1 => '确认',
      ),
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
    0 => '889',
    1 => '890',
    2 => '891',
  ),
  'searchable' => 
  array (
    0 => '889',
    1 => '890',
    2 => '891',
  ),
);