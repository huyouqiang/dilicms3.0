<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<div class="headbar">
    <div class="btn-group btn-group-sm">
        <a href="javascript:void(0)" onclick="selectAll('file[]');" class="btn btn-sm btn-primary" type="button"><span class="sel_all"><i class="bi bi-list-check fs-6"></i></span></a>
        <a href="javascript:void(0)" onclick="multi_delete();" class="btn btn-sm btn-primary" type="button"><span class="delete"><i class="bi bi-trash fs-6"></i></span></a>
    </div>
    <div class="red_box" style="margin-bottom: 10px;"><b>说明：</b>本功能在恢复备份数据的同时，将全部覆盖原有数据，<span style="color:red">请谨慎操作</span>。</div>
    <!-- <div class="field">
        <table class="table">
            <thead>
                <tr>
                    <th width="70px">&nbsp;</th>
                    <th width="300px">文件名</th>
                    <th width="70px">卷号</th>
                    <th width="100px">文件大小</th>
                    <th width="100px">类型</th>
                    <th width="150px">创建时间</th>
                    <th>操作选项</th>
                </tr>
            </thead>
        </table>
    </div> -->
</div>
<style>
table tbody {
	display: block;
	height: calc(100vh - 150px);
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
    <?php echo form_open('database/files'); ?>
    <table id="list_table" class="table">
            <thead>
                <tr>
                    <th width="70px">&nbsp;</th>
                    <th width="300px">文件名</th>
                    <th width="70px">卷号</th>
                    <th width="100px">文件大小</th>
                    <th width="100px">类型</th>
                    <th width="150px">创建时间</th>
                    <th>操作选项</th>
                </tr>
            </thead>
        <?php foreach ($files as $file): ?>
            <tr>
                <td width="70px"><input type="checkbox" name="file[]" value="<?php echo $file['name']; ?>" class="form-check-input"></td>
                <td width="300px" style="padding-left:0"><?php echo $file['name']; ?></td>
                <td width="70px" style="padding-left:0"><?php echo $file['volume']; ?></td>
                <td width="100px" style="padding-left:0"><?php echo $file['size']; ?> KB</td>
                <td width="100px" style="padding-left:0"><?php echo $file['extension']; ?></td>
                <td width="150px" style="padding-left:0"><?php echo $file['date']; ?></td>
                <td style="padding-left:0">
                  <div class="btn-group btn-group-sm">
                    <a href="javascript:void(0);"
                       onclick="if(confirm('是否确定要导入该文件到数据库？')){window.location='<?php echo site_url('database/files/import/'.urlencode($file['name']));?>'}" class="btn btn-sm btn-primary"><i class="bi bi-arrow-down-left fs-6"></i></a>
                     <a href="javascript:void(0);" onclick="if(confirm('是否确定要删除该文件？')){window.location='<?php echo site_url('database/files/delete/'.urlencode($file['name']));?>'}" class="btn btn-sm btn-primary"><i class="bi bi-trash fs-6"></i></a>
                     <a href="javascript:void(0);" onclick="if(confirm('是否要下载该文件？')){window.location='<?php echo site_url('database/files/download/'.urlencode($file['name']));?>'}" class="btn btn-sm btn-primary"><i class="bi bi-download fs-6"></i></a>
                  </div>
                </td>
            </tr>
        <?php endforeach; ?>
    </table>
    <?php echo form_close(); ?>
</div>
<script>
    function multi_delete()
    {
        if($(":checkbox[name='file[]']:checked").length  <= 0)
        {
            alert('请先选择要删除的信息!');
            return false;
        }
        else
        {
            if (confirm('是否确定要删除选中的文件?')) {
                $('form').submit();
            }
            return false;
        }
    }
</script>
