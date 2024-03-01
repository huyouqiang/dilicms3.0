<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['h5_default_template']=array (
  'id' => '192',
  'name' => 'h5_default_template',
  'description' => '课次默认模板',
  'perpage' => '50',
  'hasattach' => '1',
  'built_in' => '0',
  'thumb_preferences' => '{"enabled":[],"default":"original"}',
  'belong_group' => '18',
  'model_sort' => '0',
  'fields' => 
  array (
    1100 => 
    array (
      'id' => '1100',
      'name' => 'default_template',
      'description' => '默认模板',
      'model' => '192',
      'type' => 'radio',
      'length' => '10',
      'values' => 
      array (
        '' => '默认',
        1 => '秋季模板',
        2 => '万圣节',
        3 => '感恩节',
        4 => '圣诞节',
        5 => '寒假',
        6 => '春季T4',
      ),
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
    0 => '1100',
  ),
  'searchable' => 
  array (
    0 => '1100',
  ),
);