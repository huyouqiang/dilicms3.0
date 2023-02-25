<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['tab2']=array (
  'id' => '129',
  'name' => 'tab2',
  'description' => '表单2',
  'perpage' => '10',
  'hasattach' => '1',
  'built_in' => '0',
  'thumb_preferences' => '{"enabled":[],"default":"original"}',
  'belong_group' => '6',
  'fields' => 
  array (
    599 => 
    array (
      'id' => '599',
      'name' => 'name',
      'description' => '名称',
      'model' => '129',
      'type' => 'input',
      'length' => '20',
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
    600 => 
    array (
      'id' => '600',
      'name' => 'address',
      'description' => '地址',
      'model' => '129',
      'type' => 'textarea',
      'length' => '255',
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
    0 => '599',
    1 => '600',
  ),
  'searchable' => 
  array (
    0 => '599',
    1 => '600',
  ),
);