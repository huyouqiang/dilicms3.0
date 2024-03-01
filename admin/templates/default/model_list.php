<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<div class="headbar">
	<div class="alert alert-primary"><?=$bread?></div>
	<div class="operating">
		<a class="hack_ie" href="<?php echo backend_url('model/add'); ?>"><button class="btn btn-sm btn-primary" type="button"><span class="addition">添加新内容模型</span></button></a>
	</div>
	<!-- <div class="field">
		<table class="table">
			<col width="40px" />
			<col />
			<thead>
				<tr>
                	<th></th>
					<th>内容模型标识</th>
					<th>内容模型名称</th>
					<th>分类模型名称</th>
					<th>排序</th>
                    <th>操作选项</th>
				</tr>
			</thead>
		</table>
	</div> -->
</div>
<style>
table tbody {
	display: block;
	height: calc(100vh - 80px);;
	overflow-y: scroll;
}
table thead,
tbody tr {
	display: table;
	width: 100%;
	table-layout: fixed;/*重要  表格固定算法*/
}
table thead {/*留出滚动条的位置*/
	width: calc(100% - 1em);
}
.content{
	margin-top: 10px;
}
</style>

<div class="content">
		<table id="list_table" class="table">
			<col width="40px" />
			<col />
			<thead>
				<tr>
					<th>内容模型标识</th>
					<th>内容模型名称</th>
					<th>分类模型名称</th>
					<th>排序</th>
                    <th>操作选项</th>
				</tr>
			</thead>
			<tbody style="display: inline-block;width: 100%;overflow: auto;max-height: 500px;">
            <?php foreach($list as $v) : ?>
            	<tr>
                	<td><?php echo $v->name; ?></td>
                    <td><?php echo $v->description; ?></td>
                    <td><?php echo $v->modelGroupName; ?></td>
                    <td><?php echo $v->model_sort; ?></td>
                    <td>
						<div class="btn-group btn-group-sm">
							<a type="button" class="btn btn-sm btn-primary" href="<?php echo backend_url('model/edit/'.$v->id); ?>">修改</a>
							<a type="button" class="btn btn-sm btn-primary confirm_delete" href="<?php echo backend_url('model/del/'.$v->id); ?>">删除</a>
							<a type="button" class="btn btn-sm btn-primary" href="<?php echo backend_url('model/fields/'.$v->id); ?>">字段</a>
							<a type="button" class="btn btn-sm btn-primary" href="<?php echo backend_url('content/view/','model='.$v->name); ?>">列表</a>
						</div>
                    	<!-- <a href="<?php echo backend_url('model/edit/'.$v->id); ?>"><img class="operator" src="images/icon_edit.gif" alt="修改" title="修改"></a>
                        <a class="btn btn-sm btn-primary" href="<?php echo backend_url('model/del/'.$v->id); ?>">删除</a>
                        <a href="<?php echo backend_url('model/fields/'.$v->id); ?>">字段管理</a>
                        <a href="<?php echo backend_url('content/view/','model='.$v->name); ?>">列表</a> -->
                    </td>
                </tr>
            <?php endforeach; ?>
			</tbody>
		</table>
</div>
<script language="javascript">
	$('a.confirm_delete').click(function(){
		return confirm('是否要删除所选内容模型？');	
	});
</script>