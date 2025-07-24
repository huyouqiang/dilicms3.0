<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<div class="headbar">
	<div class="row">
        
		<form name="serachuser" action="<?php echo backend_url('user/view'); ?>" method="get" class="rol">
      <div class="btn-group btn-group-sm">
			<a class="btn btn-primary btn-sm" href="<?php echo backend_url('user/add'); ?>"><span class="addition"><i class="bi bi-plus fs-6"></i></span></a>
			<select class="form-control btn btn-primary btn-sm"  name="role" onchange="location='<?php echo backend_url('user/view'); ?>/'+this.value;">
				<option value="">选择用户组</option>
				<?php foreach($roles as $k=>$r): ?>
                <option <?php echo $role == $k ? 'selected="selected"' : '' ?> value="<?php echo $k; ?>"><?php echo $r; ?></option>
                <?php endforeach; ?>
			</select>
      </div>
		</form>
		
	</div>
	<!-- <div class="field">
		<table class="table">
			<col width="40px" />
			<col />
			<thead>
				<tr>
                	<th></th>
					<th>用户名称</th>
                    <th>用户EMAIL</th>
                    <th>用户组</th>
                    <th>帐号状态</th>
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
					<th>用户名称</th>
                    <th>用户EMAIL</th>
                    <th>用户组</th>
                    <th>帐号状态</th>
                    <th>操作选项</th>
				</tr>
			</thead>
			<tbody>
            <?php foreach($list as $v) : ?>
            	<tr>
                	<td><?php echo $v->username; ?></td>
                    <td><?php echo $v->email; ?></td>
                    <td><?php echo $v->name; ?></td>
                    <td><?php echo $v->status == 1 ? '正常' : '冻结'; ?></td>
                    <td>
                      <div class="btn-group btn-group-sm">
                    	<a href="<?php echo backend_url('user/edit/'.$v->uid); ?>" class="btn btn-sm btn-primary"><i class="bi bi-pencil fs-6"></i></a>
                        <a href="<?php echo backend_url('user/del/'.$v->uid); ?>" class="confirm_delete btn btn-sm btn-primary"><i class="bi bi-trash fs-6"></i></a>
                      </div>
                    </td>
                </tr>
            <?php endforeach; ?>
			</tbody>
		</table>
</div>
<div class="pages_bar pagination"><?php echo $pagination; ?></div>
<script language="javascript">
	$('a.confirm_delete').click(function(){
		return confirm('是否要删除所选用户？');	
	});
</script>
