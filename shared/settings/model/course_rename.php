<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['course_rename']=array (
  'id' => '171',
  'name' => 'course_rename',
  'description' => '课程备注',
  'perpage' => '50',
  'hasattach' => '1',
  'built_in' => '0',
  'thumb_preferences' => '{"enabled":[],"default":"original"}',
  'belong_group' => '18',
  'model_sort' => '0',
  'fields' => 
  array (
    820 => 
    array (
      'id' => '820',
      'name' => 'course_rename',
      'description' => '课程备注名称',
      'model' => '171',
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
    0 => '820',
  ),
  'searchable' => 
  array (
    0 => '820',
  ),
);