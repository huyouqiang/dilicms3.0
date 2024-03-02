<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<div class="headbar">
	<div class="alert alert-primary"><?=$bread?></div>
	<div class="operating">
		<a class="hack_ie" href="<?php echo backend_url($this->uri->rsegment(1).'/add_field/'.$model->id); ?>"><button class="btn btn-sm btn-primary" type="button"><span class="addition">添加新字段</span></button></a>
	</div>
	<!-- <div class="field">
		<table class="table">
			<col width="40px" />
			<col />
			<thead>
				<tr>
                	<th></th>
					<th>显示顺序</th>
					<th>字段标识</th>
                    <th>字段名称</th>
                    <th>字段类型</th>
                    <th>管理选项</th>
				</tr>
			</thead>
		</table>
	</div> -->
</div>

<div class="content">
		<table id="list_table" class="table">
			<col width="40px" />
			<col />
			<thead>
				<tr>
                	<th></th>
					<th>显示顺序</th>
					<th>字段标识</th>
                    <th>字段名称</th>
                    <th>字段类型</th>
                    <th>管理选项</th>
				</tr>
			</thead>
			<tbody>
            <?php $fieldtypes = array_merge(setting('fieldtypes'),setting('extra_fieldtypes')); ?>
            <?php foreach($list as $v) : ?>
            	<tr>
                	<td></td>
                	<td><?php echo $v->order; ?></td>
                    <td><?php echo $v->name; ?></td>
                    <td><?php echo $v->description; ?></td>
                    <td><?php echo isset($fieldtypes[$v->type]) ? $fieldtypes[$v->type] : '未知';?></td>
                    <td>
                    	<a href="<?php echo backend_url($this->uri->rsegment(1).'/edit_field/'.$v->id); ?>" class="btn btn-sm btn-primary">修改</a>
                        <a class="confirm_delete btn btn-sm btn-primary" href="<?php echo backend_url($this->uri->rsegment(1).'/del_field/'.$v->id); ?>">删除</a>
                    </td>
                </tr>
            <?php endforeach; ?>
			</tbody>
		</table>
</div>
<script language="javascript">
	$('a.confirm_delete').click(function(){
		return confirm('是否要删除所选字段？');	
	});
</script>