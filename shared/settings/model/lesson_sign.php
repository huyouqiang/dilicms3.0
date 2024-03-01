<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['lesson_sign']=array (
  'id' => '181',
  'name' => 'lesson_sign',
  'description' => '课次出勤',
  'perpage' => '50',
  'hasattach' => '1',
  'built_in' => '0',
  'thumb_preferences' => '{"enabled":[],"default":"original"}',
  'belong_group' => '18',
  'model_sort' => '0',
  'fields' => 
  array (
    962 => 
    array (
      'id' => '962',
      'name' => 'lesson_id',
      'description' => '课次id',
      'model' => '181',
      'type' => 'input',
      'length' => '10',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '1',
      'editable' => '1',
    ),
    963 => 
    array (
      'id' => '963',
      'name' => 'student_id',
      'description' => '学生id',
      'model' => '181',
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
    964 => 
    array (
      'id' => '964',
      'name' => 'is_sign',
      'description' => '是否出勤',
      'model' => '181',
      'type' => 'radio',
      'length' => '10',
      'values' => 
      array (
        0 => '未出勤',
        1 => '已出勤',
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
    0 => '962',
    1 => '963',
    2 => '964',
  ),
  'searchable' => 
  array (
    0 => '962',
    1 => '963',
    2 => '964',
  ),
);