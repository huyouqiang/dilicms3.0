<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<link rel="stylesheet" href="js/kindeditor/themes/default/default.css" />
<script charset="utf-8" src="js/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="js/kindeditor/lang/zh_CN.js"></script>
<script src="js/colorPicker/colorpicker.js" type="text/javascript"></script>
<script src="js/dili_utility/jquery.ld.js" type="text/javascript"></script>
<link rel="stylesheet" media="screen" type="text/css" href="js/colorPicker/css/colorpicker.css" />
<script src="js/dili_utility/content_form.js" type="text/javascript"></script>
<style>
ul {
    padding-left:0px;
}
</style>
<div class="headbar">
    <div class="alert alert-primary"><?=$bread?></div>
    <div class="operating" style="overflow:visible;display:none;">
        <?php if($model['hasattach']): ?>
        <div class="search f_r" style="position:relative">
            <button class="btn" type="button" hidefocus="true"  onclick="$('#dili_uploader').toggle('slow');"><span class="add">附件列表</span></button>
            <?php $this->load->view('sys_uploader'); ?>
        </div>
        <?php endif; ?>
        <a class="hack_ie" href="<?php echo backend_url('content/view','model='.$model['name']); ?>">
            <button class="btn btn-sm btn-primary" type="button">
                <span>返回列表</span>
            </button>
        </a>
    </div>
</div>
<div class="content_box">
    <div class="content form_content">
        <?php echo form_open_multipart('content/save?model='.$model['name'].'&id='.(isset($content['id']) ? $content['id'] : '')); ?>
            <table class="table">
                <col width="150px" />
                <col />
                <?php foreach( $model['fields'] as $v) :  ?>
                <?php if($v['editable']): ?>
                <tr>
                    <th style="width: 200px;"> <?php echo $v['description'];?>：</th>
                    <td>
                        <?php $this->field_behavior->on_form($v , isset($content[$v['name']]) ? $content[$v['name']] : '', TRUE, $model['hasattach']); ?>
                        <span style="color: red;font-weight: bold;"><?php echo form_error($v['name']); ?></span>
                    </td>
                </tr>
                <?php endif; ?>
                <?php endforeach; ?>
                <?php $this->plugin_manager->trigger('rendered', $content); ?>
                <tr>
                    <th></th>
                    <td>
                        <?php if($model['hasattach']): ?>
                        <?php $this->form->show_hidden('uploadedfile','0',true); ?>
                        <?php endif; ?>
                        <?php if ($model['name'] == 'referee_apply') : ?>
                            <p style="color:red">提示：编辑后系统自动向客户发送手机短信和电子邮件通知。</p>
                        <?php endif; ?>
                        <button class="btn btn-sm btn-primary" type='submit'><span><?php echo $button_name; ?></span></button>
                    </td>
                </tr>
            </table>
        <?php echo form_close(); ?>
    </div>
</div>

