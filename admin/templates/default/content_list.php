<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<script src="js/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="js/colorPicker/colorpicker.js" type="text/javascript"></script>
<script src="js/dili_utility/jquery.ld.js" type="text/javascript"></script>
<link rel="stylesheet" media="screen" type="text/css" href="js/colorPicker/css/colorpicker.css" />
<!-- <style>

table tbody {
		display: block;
		height: calc(100vh - 80px);
		overflow-y: auto;
	}
		
	table thead,
	tbody tr {
		display: table;
		width: 100%;
		height: 20px;
		table-layout: fixed;/*重要  表格固定算法*/
	}
		
	table thead {/*留出滚动条的位置*/
		width: calc(100%)
	}

	.table-hover tbody tr:hover{
		background-color: #f8f9fa;
	}
	
/* .card-body img {
	width: 100%;
	height: 100%;
} */

</style> -->
<div class="headbar">
	<div class="alert alert-primary"><?=$bread?>(<?php echo $provider['total_rows']; ?>)</div>
	<div class="operating" style="position:relative; overflow:visible;margin:10px 20px 0px 0px;">
    	<a href="javascript:void(0)" onclick="selectAll('id[]');"><button class="btn btn-sm btn-primary" type="button"><span class="sel_all">全选</span></button></a>
		<a class="hack_ie" href="<?php echo backend_url('content/form','model='.$model['name']); ?>"><button class="btn btn-sm btn-primary" type="button"><span class="addition">添加</span></button></a>
        <a href="javascript:void(0)" onclick="multi_delete();"><button class="btn btn-sm btn-primary" type="button"><span class="delete">批量删除</span></button></a>
        <?php
        $provider['where']['model'] = $model['name'];
        $s =  json_encode($provider['where'],JSON_UNESCAPED_UNICODE);
        $s =  urlencode($s);
        ?>
        <a href="<?php echo backend_url('excel/exportExcel','model='.$s);?>;"><button class="btn btn-sm btn-primary" type="button"><span class="export">导出EXCEL</span></button></a>
        <?php if($model['searchable']) : ?>
            <a href="javascript:void(0)" onclick="$('#content_search_form').slideToggle('slow');" ><button class="btn btn-sm btn-primary" type="button"><span class="remove">筛选</span></button></a>
            <div id="content_search_form" style="display: none;background-color: #eeeeee;margin:10px 0px;padding:10px 10px;max-height:300px;overflow-y: auto;" class="card">
                <?php echo form_open('content/view?model='.$model['name']); ?>
                    <table class="form_table">
                        <colgroup><col width="150px"><col></colgroup><tbody>
						<tr>
							<td>ID</td>
							<td> <?php $this->field_behavior->on_search(array('type'=>'input','name'=>'id','width'=>'0'),''); ?></td>
						</tr>
                        <?php foreach($model['searchable'] as $v): ?>
                        <tr>
                            <td><?php echo $model['fields'][$v]['description']; ?></td>
                            <td>
                                <?php $this->field_behavior->on_search($model['fields'][$v],(isset($provider['where'][$model['fields'][$v]['name']]) ? $provider['where'][$model['fields'][$v]['name']] : '' )); ?>
                            </td>
                        </tr>
                        <?php endforeach; ?>
                        <tr>
                            <td></td>
                            <td><button class="btn btn-sm btn-primary" type="submit"><span>搜索</span></button></td>
                        </tr>
                    </tbody></table>
                <?php echo form_close(); ?>
            </div>
        <?php endif; ?>
		<?php $this->plugin_manager->trigger('buttons'); ?>
	</div>
	<!-- <div class="field">
		<table class="table">
			<thead>
				<tr>
                	<th></th>
                    <th>序号</th>
                	<th>ID</th>
                	<th>创建时间</th>
					<?php foreach($model['listable'] as $v): ?>
        			<th><?php echo $model['fields'][$v]['description']; ?></th>
    				<?php endforeach; ?>
                    <th>操作选项</th>
				</tr>
			</thead>
		</table>
	</div> -->
</div>

<div class="content" style="margin: 10px 0px;">
    <?php echo form_open('content/del?model='.$model['name'], array('id' => 'content_list_form')); ?>
		<table id="list_table" class="table table-sm table-bordered table-hover table-striped" style="display: block;width:100%;
		height: calc(100vh - 280px);overflow-y: auto;">
			<thead style="display: table;
		width: calc(100%);
		height: 20px;
		table-layout: fixed;/*重要  表格固定算法*/">
				<tr>
                	<th></th>
                    <th>序号</th>
                	<th>ID</th>
                	<th>创建时间</th>
					<?php foreach($model['listable'] as $v): ?>
        			<th><?php echo $model['fields'][$v]['description']; ?></th>
    				<?php endforeach; ?>
                    <th>操作选项</th>
				</tr>
			</thead>
			<tbody style="display: table;
		width: 100%;
		height: 20px;
		table-layout: fixed;/*重要  表格固定算法*/">
            <?php foreach($provider['list'] as $key => $v) : ?>
            	<tr>
                	<td><input type="checkbox" class="form-check-input" name="id[]" value="<?php echo $v->id; ?>" /></td>
                    <td>
                        <?php
                            echo round(substr($_SERVER['REQUEST_URI'],strrpos($_SERVER['REQUEST_URI'],"/")+1))+$key+1; 
                        ?>    
                    </td>
                	<td><?php echo $v->id; ?></td>
                	<td><?php echo date('Y-m-d H:i:s', $v->create_time); ?></td>
					<?php foreach($model['listable'] as $vt): ?>
                    <td>
                    <?php   
					$this->field_behavior->on_list($model['fields'][$vt],$v);
					?>
<!--                        urldecode()-->
                    </td>
                 <?php endforeach; ?>
                    <td>
                    	<a href="<?php echo backend_url('content/form/','model='.$model['name'].'&id='.$v->id); ?>" type="button" class="btn btn-sm btn-primary">修改</a>
                        <a href="<?php echo backend_url('content/del','model='.$model['name'].'&id='.$v->id); ?>" type="button" class="btn btn-sm btn-primary">删除</a>
                        <?php $this->plugin_manager->trigger('row_buttons', $v); ?>
                    </td>
                </tr>
            <?php endforeach; ?>
			</tbody>
		</table>
    <?php echo form_close(); ?>
</div>

<div class="mt-4">
<nav aria-label="navigation">
	<ul class="pagination pagination-light d-inline-block d-md-flex justify-content-center">
		<?php echo $provider['pagination']; ?>
		<!-- <li class="page-item active"><a class="page-link"  href="/admin/bloglist?p=1">1</a></li>
		<li class="page-item"><a class="page-link"  href="/admin/bloglist?p=2">2</a></li>
		<li class="page-item"><a class="page-link"  href="/admin/bloglist?p=3">3</a></li>
		<li class="page-item"><a class="page-link"  href="/admin/bloglist?p=4">4</a></li>
		<li class="page-item"><a class="page-link"  href="/admin/bloglist?p=5">尾页</a></li>					               -->
	</ul>
</nav>
</div>

<script language="javascript">
	var confirm_str = '是否要删除所选信息？\n此操作还会删除附件等关联信息!';
	$('a.confirm_delete').click(function(){
		return confirm(confirm_str);	
	});
	function multi_delete()
	{
		if($(":checkbox[name='id[]']:checked").length  <= 0)
		{
				alert('请先选择要删除的信息!');
				return false;
		}
		else
		{
			if(confirm(confirm_str))
			{
				$('#content_list_form').submit();
			}
			else
			{
				return false;	
			}
		}
	}

</script>
<script src="js/dili_utility/content_form.js" type="text/javascript"></script>
<?php $this->plugin_manager->trigger('listed', $provider['list']); ?>
