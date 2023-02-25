<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['scenepeople']=array (
  'id' => '17',
  'name' => 'scenepeople',
  'description' => '情景赛成员',
  'perpage' => '99',
  'hasattach' => '0',
  'built_in' => '0',
  'thumb_preferences' => NULL,
  'fields' => 
  array (
    99 => 
    array (
      'id' => '99',
      'name' => 'match_id',
      'description' => '比赛ID',
      'model' => '17',
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
    100 => 
    array (
      'id' => '100',
      'name' => 'uid',
      'description' => '成员ID',
      'model' => '17',
      'type' => 'int',
      'length' => '15',
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
    0 => '99',
    1 => '100',
  ),
  'searchable' => 
  array (
    0 => '99',
    1 => '100',
  ),
);