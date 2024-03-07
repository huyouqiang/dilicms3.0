<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['menus']=array (
  0 => 
  array (
    'menu_id' => '1',
    'class_name' => 'system',
    'method_name' => 'home',
    'menu_name' => '系统',
    'sub_menus' => 
    array (
      0 => 
      array (
        'menu_id' => '2',
        'class_name' => 'system',
        'method_name' => 'home',
        'menu_name' => '后台首页',
        'sub_menus' => 
        array (
          0 => 
          array (
            'menu_id' => '3',
            'class_name' => 'system',
            'method_name' => 'home',
            'menu_name' => '后台首页',
          ),
        ),
      ),
      1 => 
      array (
        'menu_id' => '4',
        'class_name' => 'setting',
        'method_name' => 'site',
        'menu_name' => '系统设置',
        'sub_menus' => 
        array (
          0 => 
          array (
            'menu_id' => '5',
            'class_name' => 'setting',
            'method_name' => 'site',
            'menu_name' => '站点设置',
          ),
          1 => 
          array (
            'menu_id' => '6',
            'class_name' => 'setting',
            'method_name' => 'backend',
            'menu_name' => '后台设置',
          ),
          2 => 
          array (
            'menu_id' => '7',
            'class_name' => 'system',
            'method_name' => 'password',
            'menu_name' => '修改密码',
          ),
          3 => 
          array (
            'menu_id' => '8',
            'class_name' => 'system',
            'method_name' => 'cache',
            'menu_name' => '更新缓存',
          ),
        ),
      ),
      2 => 
      array (
        'menu_id' => '9',
        'class_name' => 'model',
        'method_name' => 'view',
        'menu_name' => '模型管理',
        'sub_menus' => 
        array (
          0 => 
          array (
            'menu_id' => '10',
            'class_name' => 'model',
            'method_name' => 'view',
            'menu_name' => '内容模型管理',
          ),
          1 => 
          array (
            'menu_id' => '11',
            'class_name' => 'category',
            'method_name' => 'view',
            'menu_name' => '分类模型管理',
          ),
        ),
      ),
      3 => 
      array (
        'menu_id' => '12',
        'class_name' => 'plugin',
        'method_name' => 'view',
        'menu_name' => '扩展管理',
        'sub_menus' => 
        array (
          0 => 
          array (
            'menu_id' => '13',
            'class_name' => 'plugin',
            'method_name' => 'view',
            'menu_name' => '插件管理',
          ),
        ),
      ),
      4 => 
      array (
        'menu_id' => '14',
        'class_name' => 'role',
        'method_name' => 'view',
        'menu_name' => '权限管理',
        'sub_menus' => 
        array (
          0 => 
          array (
            'menu_id' => '15',
            'class_name' => 'role',
            'method_name' => 'view',
            'menu_name' => '用户组管理',
          ),
          1 => 
          array (
            'menu_id' => '16',
            'class_name' => 'user',
            'method_name' => 'view',
            'menu_name' => '用户管理',
          ),
        ),
      ),
      5 => 
      array (
        'menu_id' => '21',
        'class_name' => 'database',
        'method_name' => 'index',
        'menu_name' => '数据库管理',
        'sub_menus' => 
        array (
          0 => 
          array (
            'menu_id' => '22',
            'class_name' => 'database',
            'method_name' => 'index',
            'menu_name' => '数据库备份',
          ),
          1 => 
          array (
            'menu_id' => '23',
            'class_name' => 'database',
            'method_name' => 'recover',
            'menu_name' => '数据库还原',
          ),
          2 => 
          array (
            'menu_id' => '24',
            'class_name' => 'database',
            'method_name' => 'optimize',
            'menu_name' => '数据库优化',
          ),
        ),
      ),
    ),
  ),
  1 => 
  array (
    'menu_id' => '17',
    'class_name' => 'content',
    'method_name' => 'view',
    'menu_name' => '内容管理',
    'sub_menus' => 
    array (
      0 => 
      array (
        'menu_id' => '18',
        'class_name' => 'content',
        'method_name' => 'view',
        'menu_name' => '内容管理',
        'sub_menus' => 
        array (
          0 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'notice_read_record',
            'menu_name' => '通知阅读记录',
          ),
          1 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'class',
            'menu_name' => '班级列表',
          ),
          2 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'course',
            'menu_name' => '课程产品列表',
          ),
          3 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'school',
            'menu_name' => '学校列表',
          ),
          4 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'headmaster',
            'menu_name' => '后台账户信息',
          ),
          5 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'student',
            'menu_name' => '学员信息',
          ),
          6 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'notice',
            'menu_name' => '通知消息',
          ),
          7 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'school_district',
            'menu_name' => '校区列表',
          ),
          8 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'class_performance',
            'menu_name' => '学员课堂表现',
          ),
          9 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'notice_img',
            'menu_name' => '通知图片',
          ),
          10 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'templateLog',
            'menu_name' => '模板消息日志',
          ),
          11 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'course_rename',
            'menu_name' => '课程备注',
          ),
          12 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'class_times',
            'menu_name' => '班级课次库',
          ),
          13 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'class_time',
            'menu_name' => '班级课次',
          ),
          14 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'student_evaluate',
            'menu_name' => '学员评价',
          ),
          15 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'wonderful_moment',
            'menu_name' => '学员精彩瞬间',
          ),
          16 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'parent_comments',
            'menu_name' => '家长点评',
          ),
          17 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'parents_reply',
            'menu_name' => '通知家长回复',
          ),
          18 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'notice_title',
            'menu_name' => '通知标题列表',
          ),
          19 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'curriculum',
            'menu_name' => '课程列表',
          ),
          20 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'lesson_sign',
            'menu_name' => '课次出勤',
          ),
          21 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'edit_lesson_record',
            'menu_name' => '编辑课次记录',
          ),
          22 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'lesson_access_record',
            'menu_name' => '课次访问记录',
          ),
          23 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'term_mid_end',
            'menu_name' => '期中/末/学情报告',
          ),
          24 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'report_comment',
            'menu_name' => '学员报告评价',
          ),
          25 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'enclosure',
            'menu_name' => '学员附件',
          ),
          26 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'qrcode_statistics',
            'menu_name' => '小助手统计',
          ),
          27 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'timetable',
            'menu_name' => '课表信息',
          ),
          28 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'class_remind',
            'menu_name' => '课前提醒',
          ),
          29 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'class_preview',
            'menu_name' => '课前预习',
          ),
          30 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'h5_default_template',
            'menu_name' => '课次默认模板',
          ),
        ),
      ),
      1 => 
      array (
        'menu_id' => '19',
        'class_name' => 'category_content',
        'method_name' => 'view',
        'menu_name' => '分类管理',
        'sub_menus' => 
        array (
        ),
      ),
    ),
  ),
  2 => 
  array (
    'menu_id' => '20',
    'class_name' => 'module',
    'method_name' => 'run',
    'menu_name' => '插件',
    'sub_menus' => 
    array (
    ),
  ),
);