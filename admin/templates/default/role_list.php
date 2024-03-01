<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<div class="headbar">
	<div class="alert alert-primary"><span>系统</span><span>></span><span>权限管理</span><span>></span><span>用户组管理</span></div>
	<div class="operating">
		<a class="hack_ie" href="<?php echo backend_url('role/add'); ?>"><button class="btn btn-sm btn-primary" type="button"><span class="addition">添加新用户组</span></button></a>
	</div>
	<!-- <div class="field">
		<table class="table">
			<col width="40px" />
			<col />
			<thead>
				<tr>
                	<th></th>
					<th>用户组名称</th>
                    <th>操作选项</th>
				</tr>
			</thead>
		</table>
	</div> -->
</div>

<div class="content" style="margin-top: 10px;">
		<table id="list_table" class="table">
			<thead>
				<tr>
					<th>用户组名称</th>
                    <th>操作选项</th>
				</tr>
			</thead>
			<tbody>
            <?php foreach($list as $v) : ?>
            	<tr>
                	<td><?php echo $v->name; ?></td>
                    <td>
                    	<a href="<?php echo backend_url('role/edit/'.$v->id); ?>" class="btn btn-sm btn-primary">修改</a>
                        <a class="confirm_delete btn btn-sm btn-primary" href="<?php echo backend_url('role/del/'.$v->id); ?>">删除</a>
                    </td>
                </tr>
            <?php endforeach; ?>
			</tbody>
		</table>
</div>
<script language="javascript">
	$('a.confirm_delete').click(function(){
		return confirm('是否要删除所选用户组？');	
	});
</script>