<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');?>
<!DOCTYPE html>
<html>
<head>
<base href="<?php echo base_url().'templates/'.setting('backend_theme').'/'; ?>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo setting('backend_title');  ?></title>
<link rel="stylesheet" href="images/admin.css"  type="text/css" />
<link rel="stylesheet" href="images/bootstrap-icons.css"  type="text/css" />
<!-- Bootstrap JS -->
<script src="images/bootstrap.bundle.min.js"></script>
</head>
<style>
body {
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
    /* 设置背景颜色，背景图加载过程中会显示背景色 */
    /* background-color: #eeeeee; */
}
</style>
<body id="login">
	<div class="container">
		
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
				<!-- <form class="rounded position-relative">
					<input class="form-control ps-5 bg-light" type="search" name="headerSearch" placeholder="搜索..." aria-label="Search" value="">
					<input class="form-control ps-5 bg-light" type="search" placeholder="搜索..." aria-label="Search" value="" style="display: none;">
					<button class="btn bg-transparent px-2 py-0 position-absolute top-50 start-0 translate-middle-y" type="button"><i class="bi bi-search fs-5"> </i></button>
				</form> -->
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
				<a class="nav-link icon-md btn btn-light p-0" href="/blog/feedback">
				<i class="bi bi-chat-left-text-fill fs-6"> </i>
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
						<a class="h6 stretched-link" href="#">未知用户</a>
						<p class="small m-0">未知身份</p>
					</div>
					</div>
									<a class="dropdown-item btn btn-danger-soft btn-sm my-2 text-center" href="/admin/login">未登录</a>
								</li>
				<!-- Links -->
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

		<div class="container">
			<div class="row justify-content-center align-items-center py-5" style="height: calc(100vh - 0px);">
				<div class="col-sm-10 col-md-8 col-lg-7 col-xl-6 col-xxl-5">

					<div id="wrapper" class="card card-body text-center p-4 p-sm-5">
						<div class="login_box">
							<h2 class="mb-2">登 录</h2>
							<div class="login_cont">
								<b style="color:red"><?php echo $this->session->flashdata('error'); ?></b>
								<?php echo form_open('login/do'); ?>
								<div class="mb-3 input-group-lg">
									<input autocomplete="off" class="form-control" type="text" name="username" placeholder="请填写账号" />
								</div>
								<div class="mb-3 position-relative">
									<!-- Password -->
									<div class="input-group input-group-lg">
										<input class="form-control fakepassword" type="password" id="psw-input" placeholder="请填写密码" id="pwd" name="password">
										<!-- <span class="input-group-text p-0">
										<i class="fakepasswordicon fa-solid fa-eye-slash cursor-pointer p-2 w-40px"></i>
										</span> -->
									</div>
								</div>
								<!-- Button -->
								<div class="d-grid"><input class="btn btn-lg btn-primary" type="submit" value="登录" /></div>
									
								<?php echo form_close(); ?>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		
		
	</div>

	<!-- footer -->
	<!-- footer START -->
	<footer class="bg-mode py-3">
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
			<p class="text-center text-md-end mb-0">©2024 <a class="text-body" target="_blank" href="https://beian.miit.gov.cn/#/Integrated/index"> 皖ICP备XXXXXX号-X </a></p>
			<!-- Copyright END -->
		</div>
		</div>
	</div>
	</footer>
	<!-- footer END --> 
</body>
</html>
