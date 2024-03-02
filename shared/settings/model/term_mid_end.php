<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['term_mid_end']=array (
  'id' => '184',
  'name' => 'term_mid_end',
  'description' => '期中/末/学情报告',
  'perpage' => '50',
  'hasattach' => '1',
  'built_in' => '0',
  'thumb_preferences' => '{"enabled":[],"default":"original"}',
  'belong_group' => '26',
  'model_sort' => '0',
  'fields' => 
  array (
    984 => 
    array (
      'id' => '984',
      'name' => 'report_name',
      'description' => '报告名称',
      'model' => '184',
      'type' => 'input',
      'length' => '50',
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
    985 => 
    array (
      'id' => '985',
      'name' => 'report_type',
      'description' => '报告类型',
      'model' => '184',
      'type' => 'radio',
      'length' => '10',
      'values' => 
      array (
        1 => '期中报告',
        2 => '期末报告',
        3 => '学情报告',
        4 => '新年成绩单',
      ),
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '1',
      'editable' => '1',
    ),
    986 => 
    array (
      'id' => '986',
      'name' => 'headmaster_id',
      'description' => '班主任id',
      'model' => '184',
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
    989 => 
    array (
      'id' => '989',
      'name' => 'belong_class_id',
      'description' => '所属班级id',
      'model' => '184',
      'type' => 'input',
      'length' => '10',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '5',
      'editable' => '1',
    ),
    990 => 
    array (
      'id' => '990',
      'name' => 'belong_curriculum_id',
      'description' => '所属课程id',
      'model' => '184',
      'type' => 'input',
      'length' => '10',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '6',
      'editable' => '1',
    ),
    987 => 
    array (
      'id' => '987',
      'name' => 'release_status',
      'description' => '发布状态',
      'model' => '184',
      'type' => 'radio',
      'length' => '10',
      'values' => 
      array (
        0 => '未发布',
        1 => '已发布',
      ),
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '7',
      'editable' => '1',
    ),
    988 => 
    array (
      'id' => '988',
      'name' => 'release_time',
      'description' => '发布时间',
      'model' => '184',
      'type' => 'input',
      'length' => '30',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '8',
      'editable' => '1',
    ),
  ),
  'listable' => 
  array (
    0 => '984',
    1 => '985',
    2 => '986',
    3 => '989',
    4 => '990',
    5 => '987',
    6 => '988',
  ),
  'searchable' => 
  array (
    0 => '984',
    1 => '985',
    2 => '986',
    3 => '989',
    4 => '990',
    5 => '987',
    6 => '988',
  ),
);