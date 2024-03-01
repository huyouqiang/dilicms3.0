<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['notice_img']=array (
  'id' => '169',
  'name' => 'notice_img',
  'description' => '通知图片',
  'perpage' => '50',
  'hasattach' => '1',
  'built_in' => '0',
  'thumb_preferences' => '{"enabled":[],"default":"original"}',
  'belong_group' => '23',
  'model_sort' => '0',
  'fields' => 
  array (
    810 => 
    array (
      'id' => '810',
      'name' => 'notice_id',
      'description' => '通知消息id',
      'model' => '169',
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
    811 => 
    array (
      'id' => '811',
      'name' => 'notice_img',
      'description' => '通知图片',
      'model' => '169',
      'type' => 'file',
      'length' => '100',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '【图片前缀：http://www.npathway.com/jx】',
      'searchable' => '1',
      'listable' => '1',
      'order' => '2',
      'editable' => '1',
    ),
  ),
  'listable' => 
  array (
    0 => '810',
    1 => '811',
  ),
  'searchable' => 
  array (
    0 => '810',
    1 => '811',
  ),
);