<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CodeCheck.Index" %>

<!DOCTYPE html>
<html lang="en">
<head>

<!-- Page title -->
<title>Home</title>
<!-- /Page title -->

<!-- Meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- /Meta -->

<!-- SEO Meta -->
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">
<!-- /SEO Meta -->

<!-- OpenGraph meta -->
<meta property="og:image" content="icon-180x180.png">
<meta property="og:title" content="">
<meta property="og:description" content="">
<!-- /OpenGraph meta -->

<!-- Favicon -->
<link rel="shortcut icon" href="assets/img/favicon.png">
<!-- /Favicon -->

<!-- Styles -->
<link rel="stylesheet" href="assets/components/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/components/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="assets/components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/components/elegant-font/style.css">
<link rel="stylesheet" href="assets/components/owl-carousel/assets/owl.carousel.min.css">
<link rel="stylesheet" href="assets/components/owl-carousel/assets/owl.theme.default.min.css">
<link rel="stylesheet" href="assets/components/sweetalert/sweetalert.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/theme.css" title="theme-default">
<!-- /Styles -->

<!-- TODO: select one of the presented -->
<!-- Predefined Schemes -->
<link rel="alternate stylesheet" href="assets/css/theme-dulllavender-light.css" title="theme-dulllavender-light">
<link rel="alternate stylesheet" href="assets/css/theme-dulllavender.css"       title="theme-dulllavender">
<link rel="alternate stylesheet" href="assets/css/theme-dulllavender-dark.css"  title="theme-dulllavender-dark">
<link rel="alternate stylesheet" href="assets/css/theme-nepal-light.css"        title="theme-nepal-light">
<link rel="alternate stylesheet" href="assets/css/theme-nepal.css"              title="theme-nepal">
<link rel="alternate stylesheet" href="assets/css/theme-nepal-dark.css"         title="theme-nepal-dark">
<link rel="alternate stylesheet" href="assets/css/theme-tradewind-light.css"    title="theme-tradewind-light">
<link rel="alternate stylesheet" href="assets/css/theme-tradewind.css"          title="theme-tradewind">
<link rel="alternate stylesheet" href="assets/css/theme-tradewind-dark.css"     title="theme-tradewind-dark">
<link rel="alternate stylesheet" href="assets/css/theme-tanhide-light.css"      title="theme-tanhide-light">
<link rel="alternate stylesheet" href="assets/css/theme-tanhide.css"            title="theme-tanhide">
<link rel="alternate stylesheet" href="assets/css/theme-tanhide-dark.css"       title="theme-tanhide-dark">
<link rel="alternate stylesheet" href="assets/css/theme-burntsienna-light.css"  title="theme-burntsienna-light">
<link rel="alternate stylesheet" href="assets/css/theme-burntsienna.css"        title="theme-burntsienna">
<link rel="alternate stylesheet" href="assets/css/theme-burntsienna-dark.css"   title="theme-burntsienna-dark">
<!-- /Predefined Schemes --> 

</head>
<body>

<!-- PRELOADER -->
<div id="preloader" class="preloader">
<div class="loader">Loading...</div>
</div>
<!-- /PRELOADER -->

<!-- MAIN CONTAINER -->
<main class="main-container">

<!-- SECTION > HERO: Home -->
<section id="home" class="section hero">

	<!-- CAROUSEL -->
	<div class="owl-carousel owl-theme owl-navigation owl-autoplay owl-no-mousedrag owl-reveal"
		 data-owl-autoplay-timeout="6500"
		 data-owl-items="1"
		 data-owl-animate-in="heroCarouselIn"
		 data-owl-animate-out="heroCarouselOut">

		<!-- CAROUSEL SLIDE -->
		<div class="slide fullscreen bg-cover mask mask-black"
			 style="background-image: url(assets/images/default/bg-carousel-01.jpg)">

			<!-- Vertical Middle Block -->
			<div class="vertical-middle mask-after">
				<div class="container">

					<!-- Hero Heading -->
					<div class="row hero-heading">
						<div class="col-xs-12 text-center">

							<div class="hero-title text-white reveal"
								 data-reveal-distance="-30px"
								 data-reveal-duration="500"
								 data-reveal-reset="1">

								欢迎来到代码查重网站

							</div>

							<div class="hero-subtitle text-white reveal"
								 data-reveal-distance="30px"
								 data-reveal-duration="800"
								 data-reveal-delay="150"
								 data-reveal-reset="1">

								这里可以对代码进行对比得到代码相似度，以Excel文件形式返回

							</div>

						</div>
					</div>
					<!-- /Hero Heading -->

					<!-- Hero Buttons -->
					<div class="row reveal"
						 data-reveal-duration="800"
						 data-reveal-delay="350"
						 data-reveal-reset="1">

						<div class="col-xs-6 text-right">
							<a href="#features" class="btn btn-lg btn-squared btn-white btn-o text-uppercase smooth-scroll">特性</a>
						</div>
						<div class="col-xs-6">
							<a href="#CodeCheck" class="btn btn-lg btn-squared btn-base text-uppercase smooth-scroll">开始对比</a>
						</div>

					</div>
					<!-- /Hero Buttons -->

				</div>
			</div>
			<!-- /Vertical Middle Block -->
		</div>
		<!-- /CAROUSEL SLIDE -->
	</div>
	<!-- /CAROUSEL -->

</section>

<!-- SECTION: Features -->
<section id="features" class="section">
	<div class="container">

		<!-- Section Content -->
		<div class="row">

			<!-- ICON BOX: Clean Design -->
			<div class="col-xs-12 col-sm-4 icon-box reveal"
				 data-reveal-duration="600">

				<span class="icon icon_link_alt"></span>
				<div class="title text-dark">支持C/C++和Java文件的代码查重</div>
				<div class="description">
					可能在未来会加入更多不同的格式
				</div>
				<a href="#" class="btn btn-base">了解更多</a>

			</div>
			<!-- /ICON BOX: Clean Design -->

			<!-- ICON BOX: Mobile Friendly -->
			<div class="col-xs-12 col-sm-4 icon-box reveal"
				 data-reveal-duration="600"
				 data-reveal-delay="250">

				<span class="icon icon_mobile"></span>
				<div class="title text-dark">查重算法求解</div>
				<div class="description">
					使用快速高效SIM算法查重
				</div>
				<a href="#" class="btn btn-base">了解更多</a>

			</div>
			<!-- /ICON BOX: Mobile Friendly -->

			<!-- ICON BOX: Well Documented -->
			<div class="col-xs-12 col-sm-4 icon-box reveal"
				 data-reveal-duration="600">

				<span class="icon icon_pens"></span>
				<div class="title text-dark">针对多个文件同时查重</div>
				<div class="description">
					选择一个文件夹，然后程序自动获取后缀为.cpp和.java的文件然后两两对应格式进行查重
				</div>
				<a href="#" class="btn btn-base">了解更多</a>

			</div>
			<!-- /ICON BOX: Well Documented -->

		</div>
		<!-- /Section Content -->

	</div>
</section>
<!-- /SECTION: Features -->

<!-- SECTION: Code Check -->
<section id="CodeCheck" class="section text-white bg-center-top bg-fixed mask mask-black xs-text-center"
		 style="background-image: url(assets/images/default/bg-video.jpg)">
	<div class="container mask-after">

		<!-- Section Content -->
		<div class="row">

			<div class="col-xs-12 col-sm-8 col-md-5 xs-mb reveal"
				 data-reveal-duration="700"
				 data-reveal-distance="30px">

				<div class="h2 text-center pt no-margin text-white">选择文件或者文件夹进行查重</div>
			</div>
            <form id="form1" runat="server" method="post" enctype="multipart/form-data">
                <table style="width: 343px">
                    <tr>
                        <td style="width: 100px">单文件上传</td>
                        <td style="width: 100px"></td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="475px" />
                        </td>
                        <td style="width: 100px">
                            <asp:Button ID="bt_upload" class="btn btn-lg btn-squared btn-base" runat="server" OnClick="bt_upload_Click" Text="上传" />

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; height: 21px;">
                            
                            <asp:Button ID="bt_excute" class="btn btn-lg btn-squared btn-base" runat="server" OnClick="bt_excute_Click" Text="运行" />
                        </td>
                        <td style="width: 100px; height: 21px">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lb_info" runat="server" ForeColor="Red" Width="183px"></asp:Label>
                        </td>
                    </tr>
                </table>
            </form>
		</div>
		<!-- /Section Content -->

	</div>
</section>
<!-- /SECTION: Code Check -->

<!-- SECTION: More BEST features -->
<section id="additional" class="section">
	<div class="container" style="">

		<!-- Section Header -->
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-8 col-md-offset-2">
				<header class="section-header text-center">
					<div class="section-title text-uppercase">更多的特性</div>
					<div class="title-separator"></div>
					<div class="section-subtitle">
						以下是更详细的说明
					</div>
				</header>
			</div>  
		</div>
		<!-- /Section Header -->

		<!-- Section Content -->
		<div class="row section-content">

			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="icon-box-horizontal reveal">
					<i class="icon icon_link_alt"></i>
					<div class="title">C++ & Java</div>
					<p class="description">
						注意在查重的时候将后缀相同的放在一个文件夹
					</p>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="icon-box-horizontal reveal">
					<i class="icon icon_easel"></i>
					<div class="title">及时查看数据</div>
					<p class="description">
						可以在用户界面及时查看查重的结果
					</p>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="icon-box-horizontal reveal">
					<i class="icon icon_puzzle"></i>
					<div class="title">自定义查重结果</div>
					<p class="description">
                        自定义查重的过滤配置
					</p>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="icon-box-horizontal reveal">
					<i class="icon icon_download"></i>
					<div class="title">下载结果文件</div>
					<p class="description">
                        在用户界面下载生成的查重结果文件
					</p>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="icon-box-horizontal reveal">
					<i class="icon icon_heart_alt"></i>
					<div class="title">简洁高效</div>
					<p class="description">
						这会让你的工作更高效
					</p>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-4">
				<div class="icon-box-horizontal reveal">
					<i class="icon icon_cogs"></i>
					<div class="title">选择自己查重的配置信息</div>
					<p class="description">
                        在网页上选择结果过滤的选项
					</p>
				</div>
			</div>

		</div>
		<!-- /Section Content -->

	</div>
</section>
<!-- /SECTION: More BEST features -->

<!-- SECTION: Contact -->
<section id="contact" class="section bg-center-top mask mask-black text-white"
		 style="background-image: url(assets/images/default/bg-contact.jpg)" data-stellar-background-ratio="0.4">
	<div class="container mask-after">

		<!-- Section Header -->
		<div class="row">
			<div class="col-xs-12 text-center">
				<header class="section-header">
					<div class="section-title text-uppercase text-white">Contact Us</div>
				</header>
			</div>
		</div>
		<!-- /Section Header -->

		<!-- Section Content -->
		<div class="row section-content">

			<!-- Office Information Column -->
			<div class="col-xs-12 col-sm-6 col-md-5">

				<div class="h4 strong text-uppercase text-white">Website Information</div>

				<!-- ADDRESS -->
				<address>
					<strong class="text-uppercase">Chengdu University of Information Technology</strong><br>
				</address>
				<address>
					<strong class="text-uppercase">Zhou Lei</strong><br>
					<a href="mailto:#">1072920311@qq.com</a>
				</address>
				<!-- /ADDRESS -->

				<!-- Social Media -->
				<p class="strong text-uppercase">Follow us in social</p>
				<ul class="inline-icons mb">
					<li><a href="#"><i class="icon-theme icon-o icon-brand-facebook fa fa-facebook"></i></a></li>
					<li><a href="#"><i class="icon-theme icon-o icon-brand-twitter fa fa-twitter"></i></a></li>
					<li><a href="#"><i class="icon-theme icon-o icon-brand-linkedin fa fa-linkedin"></i></a></li>
					<li><a href="#"><i class="icon-theme icon-o icon-brand-instagram fa fa-instagram"></i></a></li>
					<li><a href="#"><i class="icon-theme icon-o icon-brand-googleplus fa fa-google-plus"></i></a></li>
				</ul>
				<!-- /Social Media -->

				<p class="small">
					&copy; Copyright 2019 ZhouLei. All Rights Reserved <br>
				</p>

			</div>
			<!-- /Office Information Column -->

			<!-- Contact Form Column -->
			<div class="col-xs-12 col-sm-6 col-md-7 reveal"
				 data-reveal-scale=".97"
				 data-reveal-duration="500">

				<!-- FORM: Contact Us -->
				<form class="form-ajax" method="post">
					<input type="hidden" name="pfvt[form]" value="Agency Landing">
					<div class="row">
						<div class="form-group col-md-6">
							<input type="text" name="pfvt[name]" class="form-control input-lg form-control-o" placeholder="Your Name... *" required>
						</div>
						<div class="form-group col-md-6">
							<input type="email" name="pfvt[email]" class="form-control input-lg form-control-o" placeholder="E-mail address... *" required>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<textarea name="pfvt[message]" class="form-control input-lg form-control-o vertical-resize-only" placeholder="Message... " style="min-height: 200px;"></textarea>
						</div>
					</div>
					<div class="row text-center">
						<button type="submit" class="btn btn-lg btn-squared btn-white btn-o" data-loading-text="<i class='fa fa-spinner fa-spin'></i> Please wait">Send Message</button>
					</div>
				</form>
				<!-- /FORM: Contact Us -->

			</div>
			<!-- /Contact Form Column -->

		</div>
		<!-- /Section Content -->

	</div>
</section>
<!-- /SECTION: Contact -->

</main>
<!-- /MAIN CONTAINER -->

<!-- SCRIPTS -->
<script src="assets/js/jquery-2.2.0.min.js"></script>
<script src="assets/components/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/components/owl-carousel/owl.carousel.min.js"></script>
<script src="assets/components/sweetalert/sweetalert.min.js"></script>
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script src="assets/js/jquery.stellar.min.js"></script>
<script src="assets/js/jquery.appear.js"></script>
<script src="assets/js/jquery.animateNumber.min.js"></script>
<script src="assets/js/circle-progress.min.js"></script>
<script src="assets/js/jquery.validate.min.js"></script>
<script src="assets/js/masonry.pkgd.min.js"></script>
<script src="assets/js/scrollreveal.js"></script>
<script src="assets/js/general.js"></script>
<!-- /SCRIPTS -->

<!-- TODO: Remove this block, DEMO only -->
<!-- STYLESWITCHER -->
<div id="styleswitcher" class="styleswitcher">

<a href="#" class="toggle-styleswitcher"><i class="icon fa fa-gear"></i></a>

<div class="styleswitcher-body">

	<ul class="colors-list">
		<li><a class="btn-switch-style" href="#" style="background: #b1ade5;" title="DullLavender-Light" data-title="theme-dulllavender-light"></a></li>
		<li><a class="btn-switch-style" href="#" style="background: #9abec5;" title="Nepal-Light"        data-title="theme-nepal-light"></a></li>
		<li><a class="btn-switch-style" href="#" style="background: #79caaf;" title="Tradewind-Light"    data-title="theme-tradewind-light"></a></li>
		<li><a class="btn-switch-style" href="#" style="background: #f8a964;" title="TanHide-Light"      data-title="theme-tanhide-light"></a></li>
		<li><a class="btn-switch-style" href="#" style="background: #ee7767;" title="BurntSienna-Light"  data-title="theme-burntsienna-light"></a></li>
	</ul>

	<ul class="colors-list">
		<li><a class="btn-switch-style" href="#" style="background: #a49fe1;" title="DullLavender"       data-title="theme-dulllavender"></a></li>
		<li><a class="btn-switch-style" href="#" style="background: #8fb7bf;" title="Nepal"              data-title="theme-nepal"></a></li>
		<li><a class="btn-switch-style" href="#" style="background: #6cc5a7;" title="Tradewind"          data-title="theme-tradewind"></a></li>
		<li><a class="btn-switch-style" href="#" style="background: #f7a053;" title="TanHide"            data-title="theme-tanhide"></a></li>
		<li><a class="btn-switch-style" href="#" style="background: #ec6957;" title="BurntSienna"        data-title="theme-burntsienna"></a></li>
	</ul>

	<ul class="colors-list">
		<li><a class="btn-switch-style" href="#" style="background: #9791dd;" title="DullLavender-Dark"  data-title="theme-dulllavender-dark"></a></li>
		<li><a class="btn-switch-style" href="#" style="background: #84b0b9;" title="Nepal-Dark"         data-title="theme-nepal-dark"></a></li>
		<li><a class="btn-switch-style" href="#" style="background: #5fc09f;" title="Tradewind-Dark"     data-title="theme-tradewind-dark"></a></li>
		<li><a class="btn-switch-style" href="#" style="background: #f69742;" title="TanHide-Dark"       data-title="theme-tanhide-dark"></a></li>
		<li><a class="btn-switch-style" href="#" style="background: #ea5b47;" title="BurntSienna-Dark"   data-title="theme-burntsienna-dark"></a></li>
	</ul>

</div>

</div>

</body>
</html>
