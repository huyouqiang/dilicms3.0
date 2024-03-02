<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['models']['templateLog']=array (
  'id' => '170',
  'name' => 'templateLog',
  'description' => '模板消息日志',
  'perpage' => '50',
  'hasattach' => '1',
  'built_in' => '0',
  'thumb_preferences' => '{"enabled":[],"default":"original"}',
  'belong_group' => '24',
  'model_sort' => '0',
  'fields' => 
  array (
    818 => 
    array (
      'id' => '818',
      'name' => 'notice_id',
      'description' => '通知/课次/报告/课表/预习id',
      'model' => '170',
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
    813 => 
    array (
      'id' => '813',
      'name' => 'openid',
      'description' => 'openid',
      'model' => '170',
      'type' => 'input',
      'length' => '30',
      'values' => '',
      'width' => '240',
      'height' => '0',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '2',
      'editable' => '1',
    ),
    817 => 
    array (
      'id' => '817',
      'name' => 'student_id',
      'description' => '学员id',
      'model' => '170',
      'type' => 'input',
      'length' => '10',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '3',
      'editable' => '1',
    ),
    814 => 
    array (
      'id' => '814',
      'name' => 'message',
      'description' => '模板消息内容',
      'model' => '170',
      'type' => 'textarea',
      'length' => '255',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '4',
      'editable' => '1',
    ),
    893 => 
    array (
      'id' => '893',
      'name' => 'message_type',
      'description' => '模板消息类型',
      'model' => '170',
      'type' => 'radio',
      'length' => '10',
      'values' => 
      array (
        '' => '通知消息',
        1 => '学员课次评价',
        2 => '学员期中/末报告',
        3 => '课表信息',
        4 => '课前预习',
      ),
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '5',
      'editable' => '1',
    ),
    815 => 
    array (
      'id' => '815',
      'name' => 'sendStatus',
      'description' => '推送状态',
      'model' => '170',
      'type' => 'radio',
      'length' => '10',
      'values' => 
      array (
        0 => '失败',
        1 => '成功',
      ),
      'width' => '0',
      'height' => '0',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '6',
      'editable' => '1',
    ),
    816 => 
    array (
      'id' => '816',
      'name' => 'fail_reason',
      'description' => '失败原因',
      'model' => '170',
      'type' => 'textarea',
      'length' => '100',
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
  ),
  'listable' => 
  array (
    0 => '818',
    1 => '813',
    2 => '817',
    3 => '814',
    4 => '893',
    5 => '815',
    6 => '816',
  ),
  'searchable' => 
  array (
    0 => '818',
    1 => '813',
    2 => '817',
    3 => '814',
    4 => '893',
    5 => '815',
    6 => '816',
  ),
);