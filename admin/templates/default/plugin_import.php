<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<div class="content_box">
	<div class="content form_content">
        <?php echo form_open('plugin/import'); ?>
			<table class="form_table"  >
				<col width="150px" />
				<col />
				<tr>
					<th> 安装文件URL：</th>
					<td><input name="plugin" class="form-control" /><label>*安装文件的XML文件地址!</label></td>
				</tr>
				<tr>
					<th></th>
					<td>
						<button class="btn btn-sm btn-primary" type='submit'><span>导入插件</span></button>
					</td>
				</tr>
			</table>
		<?php echo form_close(); ?>
	</div>
</div>