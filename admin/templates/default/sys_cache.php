<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<div class="headbar">
	<div class="alert alert-primary"><span>系统</span><span>></span><span>更新缓存</span></div>
	<div class="operating">
		<a href="javascript:void(0)" onclick="selectAll('cache[]');"><button class="btn btn-sm btn-primary" type="button"><span class="sel_all">全选</span></button></a>
		<a href="javascript:;" onclick="$('#cache_form').submit();"><button class="btn btn-sm btn-primary" type="button"><span class="remove">更新</span></button></a>
	</div>
	<div class="field">
		<table class="table">
			<col width="60px" />
			<col />
			<thead>
				<tr>
					<th>选择</th>
					<th>缓存名称</th>
				</tr>
			</thead>
		</table>
	</div>
</div>

<div class="content">
    <?php echo form_open('system/cache', array('id' => 'cache_form', 'name' => 'cache_form')); ?>
		<table id="list_table" class="table">
			<col width="60px" />
			<col />
			<tbody>
            	<tr>
                	<td><input type="checkbox" value="model" name="cache[]" class="form-check-input"/></td>
                    <td>内容模型缓存</td>
                </tr>
                <tr>
                	<td><input type="checkbox" value="category" name="cache[]" class="form-check-input"/></td>
                    <td>分类模型缓存</td>
                </tr>
                <tr>
                	<td><input type="checkbox" value="menu" name="cache[]" class="form-check-input"/></td>
                    <td>菜单缓存</td>
                </tr>
                <tr>
                	<td><input type="checkbox" value="role" name="cache[]" class="form-check-input"/></td>
                    <td>权限数据缓存</td>
                </tr>
                <tr>
                	<td><input type="checkbox" value="site" name="cache[]" class="form-check-input"/></td>
                    <td>站点设置缓存</td>
                </tr>
                <tr>
                	<td><input type="checkbox" value="backend" name="cache[]" class="form-check-input"/></td>
                    <td>后台设置缓存</td>
                </tr>
                <tr>
                	<td><input type="checkbox" value="plugin" name="cache[]" class="form-check-input"/></td>
                    <td>插件缓存</td>
                </tr>
                <tr>
                	<td><input type="checkbox" value="fieldtypes" name="cache[]" class="form-check-input"/></td>
                    <td>字段类型缓存</td>
                </tr>
                
			</tbody>
		</table>
	<?php echo form_close(); ?>
</div>
