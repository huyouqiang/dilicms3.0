<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<!DOCTYPE html>
<html>
<head>
<title><?php echo setting('backend_title'); ?></title>
<base href="<?php echo base_url().'templates/'.setting('backend_theme').'/'; ?>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="images/admin.css" />
<link rel="stylesheet" href="images/font-ux/css.css" />
<script language="javascript" src="js/jquery.js"></script>
<script language="javascript" src="js/admin.js"></script>
<link rel="stylesheet" href="images/bootstrap-icons.css"  type="text/css" />
<!-- Bootstrap JS -->
<script src="images/bootstrap.bundle.min.js"></script>
<style>
body{
	min-height:100vh;
	min-height:-webkit-fill-available;
	/* 加载背景图 */
    background-image: url(images/bg.jpg);
    /* 背景图垂直、水平均居中 */
    background-position: center center;
    /* 背景图不平铺 */
    background-repeat: no-repeat;
    /* 当内容高度大于图片高度时，背景图像的位置相对于viewport固定 */
    background-attachment: fixed;
    /* 让背景图基于容器大小伸缩 */
    background-size: cover;
	font-size: 14px;
	}
html{height:-webkit-fill-available}main{display:flex;flex-wrap:nowrap;height:100vh;height:-webkit-fill-available;max-height:100vh;overflow-x:auto;overflow-y:auto}.b-example-divider{flex-shrink:0;width:1.5rem;height:100vh;background-color:rgba(0,0,0,.1);border:solid rgba(0,0,0,.15);border-width:1px 0;box-shadow:inset 0 .5em 1.5em rgba(0,0,0,.1),inset 0 .125em .5em rgba(0,0,0,.15)}.bi{vertical-align:-.125em;pointer-events:none;fill:currentColor}.dropdown-toggle{outline:0}.nav-flush .nav-link{border-radius:0}.btn-toggle{display:inline-flex;align-items:center;padding:.25rem .5rem;font-weight:600;color:rgba(0,0,0,.65);background-color:transparent;border:0}.btn-toggle:hover,.btn-toggle:focus{color:rgba(0,0,0,.85);background-color:#9ec5fe}.btn-toggle::before{width:1.25em;line-height:0;content:url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");transition:transform .35s ease;transform-origin:.5em 50%}.btn-toggle[aria-expanded="true"]{color:rgba(0,0,0,.85)}.btn-toggle[aria-expanded="true"]::before{transform:rotate(90deg)}.btn-toggle-nav a{display:inline-flex;padding:.1875rem .5rem;margin-top:.125rem;margin-left:1.25rem;text-decoration:none}.btn-toggle-nav a:hover,.btn-toggle-nav a:focus{background-color:#9ec5fe}.scrollarea{overflow-y:auto}.fw-semibold{font-weight:600}.lh-tight{line-height:1.25}.bd-placeholder-img{font-size:1.125rem;text-anchor:middle;-webkit-user-select:none;-moz-user-select:none;user-select:none}@media (min-width:768px){.bd-placeholder-img-lg{font-size:3.5rem}}</style>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="bootstrap" viewBox="0 0 118 94">
    <title>Bootstrap</title>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
  </symbol>
</svg>
</head>
<body>
<div class="container-fluid">

	<!-- =======================
Header START -->
	<header class="navbar-light fixed-top header-static bg-mode">

	<!-- Logo Nav START -->
	<nav class="navbar navbar-expand-lg">
	<div class="container-fluid">
		<!-- Logo START -->
		<a class="navbar-brand" href="/admin/index.php/system/home">
		
		<!-- <img class="light-mode-item navbar-brand-item" src="/public/logo.svg" alt="logo">
		<img class="dark-mode-item navbar-brand-item" src="/public/logo.svg" alt="logo"> -->

		
		<img src="<?php echo setting('backend_logo');  ?>" style="height: 40px;">
		
		</a>
		<b><?php echo setting('backend_title');  ?></b>
		<!-- Logo END -->

		<!-- Responsive navbar toggler -->
		<button class="navbar-toggler ms-auto icon-md btn btn-light p-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-animation">
			<span></span>
			<span></span>
			<span></span>
		</span>
		</button>

		<!-- Main navbar START -->
		<div class="collapse navbar-collapse" id="navbarCollapse">

		<!-- Nav Search START -->
		<div class="nav mt-3 mt-lg-0 flex-nowrap align-items-center px-4 px-lg-0">
			<div class="nav-item w-100">
			
			</div>
		</div>
		<!-- Nav Search END -->

		<ul class="navbar-nav navbar-nav-scroll ms-auto">
			<!-- <li class="nav-item">
			<a class="nav-link" href="/fire" target="_blank">
				<img src="/public/bianpao.gif" style="height:50px;" title="去放炮">
			</a>
			</li> -->
			<!-- Nav item 4 Mega menu -->
					<!-- <li class="nav-item">
			<a class="nav-link " href="/?n=dev">开发</a>
			</li>
					<li class="nav-item">
			<a class="nav-link " href="/?n=microchip">硬件</a>
			</li>
					<li class="nav-item">
			<a class="nav-link " href="/?n=soft">软件</a>
			</li>
					<li class="nav-item">
			<a class="nav-link " href="/?n=photo">摄影</a>
			</li> -->
			
		</ul>
		</div>
		<!-- Main navbar END -->

		<!-- Nav right START -->
		<ul class="nav flex-nowrap align-items-center ms-sm-3 list-unstyled">
		<li class="nav-item ms-2">
			<a class="nav-link icon-md btn btn-light p-0" href="/admin/login">
			<i class="bi bi-gear-fill fs-6"> </i>
			</a>
		</li>
		<li class="nav-item ms-2">
			<a class="nav-link icon-md btn btn-light p-0" href="/admin/index.php/content/view">
			<i class="bi bi-database-fill fs-6"> </i>
			</a>
		</li>
		<li class="nav-item dropdown ms-2">
			<a class="nav-link icon-md btn btn-light p-0" href="#" id="notifDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
			<span class="badge-notif animation-blink"></span>
			<i class="bi bi-bell-fill fs-6"> </i>
			</a>
			<div class="dropdown-menu dropdown-animation dropdown-menu-end dropdown-menu-size-md p-0 shadow-lg border-0" aria-labelledby="notifDropdown">
			<div class="card">
				<div class="card-header d-flex justify-content-between align-items-center">
				<h6 class="m-0">消息 <span class="badge bg-danger bg-opacity-10 text-danger ms-1">1</span></h6>
				</div>
				<div class="card-body p-0">
				<ul class="list-group list-group-flush list-unstyled p-2">
					<li>
					<a href="#" class="list-group-item list-group-item-action rounded d-flex border-0 p-3 mb-1">
						<div class="avatar text-center d-none d-sm-inline-block">
						<img class="avatar-img rounded-circle" src="<?php echo setting('backend_logo');  ?>" alt="">
						</div>
						<div class="ms-sm-3 d-flex">
						<p class="small mb-2"><b>DEV</b> 系统用户消息推送功能，正在集成中</p>
						<p class="small ms-3 text-nowrap">03-01</p>
						</div>
					</a>
					</li>				
				</ul>
				</div>
				<!-- <div class="card-footer text-center">
				<a href="#" class="btn btn-sm btn-primary-soft">所有消息</a>
				</div> -->
			</div>
			</div>
		</li>
		<!-- Notification dropdown END -->

		<li class="nav-item ms-2 dropdown">
			<a class="nav-link btn icon-md p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
			<img class="avatar-img rounded-2" src="<?php echo setting('backend_logo');  ?>" alt="">
			</a>
			<ul class="dropdown-menu dropdown-animation dropdown-menu-end pt-3 small me-md-n3" aria-labelledby="profileDropdown">
			<!-- Profile info -->
			<li class="px-3">
				<div class="d-flex align-items-center position-relative">
				<!-- Avatar -->
				<div class="avatar me-3">
					<img class="avatar-img rounded-circle" src="<?php echo setting('backend_logo');  ?>" alt="avatar">
				</div>
				<div>
					<a class="h6 stretched-link" href="#"><?php echo $this->_admin->username; ?></a>
					<p class="small m-0"><?php echo $this->_admin->name; ?></p>
				</div>
				</div>
								<a class="dropdown-item btn btn-success-soft btn-sm my-2 text-center" href="/admin/login">已登录</a>
							</li>
			<!-- Links -->
			<!-- <li><a class="dropdown-item" href="<?php echo backend_url('login/quit'); ?>"><i class="bi bi-github fa-fw me-2"></i>退出管理</a></li> -->
			<li> 
				<a class="dropdown-item" href="<?php echo backend_url('system/home'); ?>">
				<i class="fa-fw bi bi-gear-fill me-2"></i>后台首页
				</a> 
			</li>
			<li> 
				<a class="dropdown-item" href="<?php echo base_url().'../'; ?>" target='_blank'>
				<i class="fa-fw bi bi-house me-2"></i>站点首页
				</a> 
			</li>
			<li class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="<?php echo backend_url('login/quit'); ?>"><i class="bi bi-door-open fa-fw me-2"></i>退出管理</a></li>
						</ul>
		</li>
		<!-- Profile START -->
		
		</ul>
		<!-- Nav right END -->
	</div>
	</nav>
	<!-- Logo Nav END -->
	</header>
	<!-- =======================
	Header END -->

	<!-- **************** MAIN CONTENT START **************** -->
    <!-- <main> -->
      
		<!-- LEFT START -->
		<div class="container-fluid" style="margin-top: 80px;">
			<div class="row g-4">
			<!-- Main content START -->
			<div class="col-lg-2" style="margin-bottom: 80px;">
				<div class="bg-mode p-4 card" style="padding: 0px;overflow: auto;height: calc(85vh);">
				<!-- <h3 class="h5 mb-4" style="font-size: 16px;">&nbsp;&nbsp;&nbsp;系统菜单</h3> -->
				<a href="javascript:void(0)" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
				<svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
				<span class="fs-6 fw-semibold">系统菜单</span>
				</a>
				
				<div class="list-group list-group-flush" style="border: 0px;">
	

		<ul class="list-unstyled ps-0" id="submenu">
			<?php if(!strpos($_SERVER['REQUEST_URI'],'content')): ?>
				<?php $this->acl->show_left_menus(); ?>
			<?php else: ?>

			

			<?php endif; ?>
        </ul>

	</div>
				</div>
			</div>
			<!-- Main content END -->

			<!-- Right sidebar START -->
			<div class="col-lg-10" style="margin-bottom: 80px;">
				<div class="row g-4">
				<!-- Card News START -->
				<div class="col-sm-6 col-lg-12">
					<div class="card" style="padding: 0px;overflow: auto;height: calc(85vh);">
					<!-- Card header START -->
					<div class="card-header pb-0 border-0">
						<h5 class="card-title mb-0" style="font-size: 16px;">
						<!-- 数据平台 -->
						</h5>
						<a href="javascript:void(0)" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
						<svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
						<span class="fs-6 fw-semibold">数据平台</span>
						</a>
					</div>
					<!-- Card header END -->
					<!-- Card body START -->
					<div class="card-body" style="padding-left: 20px;margin-top: 0px;padding-top:0px;">
						

						<?php if($this->uri->rsegment(1) != 'module'): ?>
						<?php $this->load->view(isset($tpl) && $tpl ? $tpl : 'sys_default'); ?>
						<?php else: ?>
						<?php if(!isset($msg)){echo $content;}else{$this->load->view($tpl);} ?>
						<?php endif; ?>


					</div>
					<!-- Card body END -->
					</div>
				</div>
				<!-- Card News END -->

				</div>
				
			</div> <!-- Row END -->
			</div>
		</div>
		<!-- Container END -->

	<!-- </main> -->
	<!-- **************** MAIN CONTENT END **************** -->



	<div id="info_bar">
	    <?php if (setting('plugin_dev_mode')): ?>
	    <label class="navindex" >
    	    <a href="#" target="_blank">插件模式已开启</a>
        </label>
        <?php endif; ?>
        <span class="nav_sec">    	
             <?php //$this->plugin_manager->trigger_navigation(); ?>
	    </span>
	</div>

	

	
	<div id="separator"></div>
</div>

<!-- footer -->
	<!-- footer START -->
	<footer class="bg-mode py-3 fixed-bottom">
	<div class="container">
		<div class="row">
		<div class="col-md-6">
			<!-- Footer nav START -->
			<ul class="nav justify-content-center justify-content-md-start lh-1">
			<li class="nav-item">
				<a class="nav-link" href="javascript:void(0);">关于</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="javascript:void(0);">支持 </a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="javascript:void(0);">文档 </a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="javascript:void(0);">隐私 & 协议</a>
			</li>
			</ul>
			<!-- Footer nav START -->
		</div>
		<div class="col-md-6">
			<!-- Copyright START -->
			<p class="text-center text-md-end mb-0"><a class="text-body" target="_blank" href="https://beian.miit.gov.cn/#/Integrated/index"> <?php echo setting('site_icp'); ?> </a></p>
			<!-- Copyright END -->
		</div>
		</div>
	</div>
	</footer>
<!-- footer END --> 
<script type='text/javascript'>

	// 左侧菜单栏
	var str = "<?php echo $_SERVER['REQUEST_URI']; ?>";

	if(str.indexOf("content") != -1){
		$.ajax({
			url:"<?php echo $_SERVER['SCRIPT_NAME']; ?>/content/menuLeft?tab=<?php if(isset($_GET['model'])){echo $_GET['model'];}else{echo '';}?>",
			success:function(result){
				// console.log(result);
				$("#submenu").html("");
        		$("#submenu").append(result);
        	}
        });
		
	}

</script>
</body>
</html>
