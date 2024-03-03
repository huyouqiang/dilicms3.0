<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<div class="content_box" style="border:none">
	<div class="content">
		
		<table class="table table-bordered">
			<tbody>
			<tr>
				<td><b>网站名称</b></td>
				<td><?php echo setting('site_name'); ?></td>
			</tr>
			<tr>
				<td><b>平台版本</b></td>
				<td><?php echo DILICMS_VERSION; ?>(CI:<?php echo CI_VERSION; ?>)</td>
			</tr>
			<tr>
				<td><b>脚本语言</b></td>
				<td><?php echo 'PHP'.PHP_VERSION; ?></td>
			</tr>
			<tr>
				<td><b>数据库</b></td>
				<td><?php echo 'MySQL'.$this->db->version();  ?></td>
			</tr>
			<tr>
				<td><b>当前帐号</b></td>
				<td><?php echo $this->_admin->username; ?></td>
			</tr>
			<tr>
				<td><b>所属用户组</b></td>
				<td><?php echo $this->_admin->name; ?></td>
			</tr>
			<tr>
				<td><b>登录IP</b></td>
				<td><?php echo $this->input->ip_address(); ?></td>
			</tr>
			<tr>
				<td><b>用户密码</b></td>
				<td><a href="<?php echo backend_url('system/password'); ?>">修改密码</a></td>
			</tr>
			<tr>
				<td><b>网站域名</b></td>
				<td><?php echo $_SERVER['SERVER_NAME']; ?></td>
			</tr>
			<tr>
				<td><b>网站IP</b></td>
				<td><?php echo getHostByName(php_uname('n')).':'.$_SERVER['SERVER_PORT']; ?></td>
			</tr>
			<tr>
				<td><b>当前编码</b></td>
				<td>UTF-8</td>
			</tr>
			<tr>
				<td><b>当前时区</b></td>
				<td><?php echo date_default_timezone_get(); ?></td>
			</tr>
			<tr>
				<td><b>上传上限</b></td>
				<td><?php echo @ini_get('upload_max_filesize'); ?></td>
			</tr>
			<tr>
				<td><b>SimpleXMLElement支持</b></td>
				<td><?php echo (class_exists('SimpleXMLElement')) ? '支持' : '不支持'; ?></td>
			</tr>
			
			</tbody>
		</table>
	  
    </div>
</div>
<script language="javascript">
// if ( $.browser.msie && parseInt($.browser.version) < 8 ) {
// 		$('#lower_ie').show();
// 	}
</script>
