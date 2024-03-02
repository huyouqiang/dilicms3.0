<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['school']=array (
  'id' => '155',
  'name' => 'school',
  'description' => '学校列表',
  'perpage' => '50',
  'hasattach' => '1',
  'built_in' => '0',
  'thumb_preferences' => '{"enabled":[],"default":"original"}',
  'belong_group' => '18',
  'model_sort' => '0',
  'fields' => 
  array (
    745 => 
    array (
      'id' => '745',
      'name' => 'school_id',
      'description' => '学校id(业务系统)',
      'model' => '155',
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
    718 => 
    array (
      'id' => '718',
      'name' => 'school_name',
      'description' => '学校名称',
      'model' => '155',
      'type' => 'input',
      'length' => '20',
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
    767 => 
    array (
      'id' => '767',
      'name' => 'city_name',
      'description' => '城市名称',
      'model' => '155',
      'type' => 'input',
      'length' => '20',
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
    0 => '745',
    1 => '718',
    2 => '767',
  ),
  'searchable' => 
  array (
    0 => '745',
    1 => '718',
    2 => '767',
  ),
);