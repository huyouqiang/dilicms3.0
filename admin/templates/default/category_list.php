<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<div class="headbar">
	<div class="alert alert-primary"><?=$bread?></div>
	<div class="operating">
		<a href="<?php echo backend_url('category/add'); ?>" class="hack_ie"><button class="btn btn-sm btn-primary" type="button"><span class="addition">添加新分类模型</span></button></a>
	</div>
	<!-- <div class="field">
		<table class="table">
			<col width="40px" />
			<col />
			<thead>
				<tr>
                	<th></th>
					<th>分类模型标识</th>
					<th>分类模型名称</th>
                    <th>分类模型层级</th>
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
					<th>分类模型标识</th>
					<th>分类模型名称</th>
                    <th>分类模型层级</th>
                    <th>操作选项</th>
				</tr>
			</thead>
			<tbody>
            <?php foreach($list as $v) : ?>
            	<tr>
                	<td><?php echo $v->name; ?></td>
                    <td><?php echo $v->description; ?></td>
                    <td><?php echo $v->level; ?></td>
                    <td>
                    	<a href="<?php echo backend_url('category/edit/'.$v->id); ?>" class="btn btn-sm btn-primary">修改</a>
                        <a class="confirm_delete btn btn-sm btn-primary" href="<?php echo backend_url('category/del/'.$v->id); ?>">删除</a>
                        <!-- <a href="<?php echo backend_url('category/fields/'.$v->id); ?>">字段管理</a>
                        <a href="<?php echo backend_url('category_content/view','model='.$v->name); ?>">列表</a> -->
                    </td>
                </tr>
            <?php endforeach; ?>
			</tbody>
		</table>
</div>
<script language="javascript">
	$('a.confirm_delete').click(function(){
		return confirm('是否要删除所选分类模型？');	
	});
</script>