<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['artrainingmode']=array (
  'id' => '22',
  'name' => 'artrainingmode',
  'description' => '体感交换（ar训练模式记录）',
  'perpage' => '99',
  'hasattach' => '0',
  'built_in' => '0',
  'thumb_preferences' => NULL,
  'fields' => 
  array (
    122 => 
    array (
      'id' => '122',
      'name' => 'uid',
      'description' => '用户id',
      'model' => '22',
      'type' => 'int',
      'length' => '15',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '0',
      'editable' => '1',
    ),
    123 => 
    array (
      'id' => '123',
      'name' => 'gamename',
      'description' => '游戏名称',
      'model' => '22',
      'type' => 'input',
      'length' => '50',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '0',
      'editable' => '1',
    ),
    124 => 
    array (
      'id' => '124',
      'name' => 'difficulty',
      'description' => '难度系数',
      'model' => '22',
      'type' => 'input',
      'length' => '20',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '0',
      'editable' => '1',
    ),
  ),
  'listable' => 
  array (
    0 => '122',
    1 => '123',
    2 => '124',
  ),
  'searchable' => 
  array (
    0 => '122',
    1 => '123',
    2 => '124',
  ),
);