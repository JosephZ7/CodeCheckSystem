<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CodeCheck.Page.Home" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/images/favicon.png" type="image/png">
    <title>Home</title>

    <!--Begin  Page Level  CSS -->
    <link href="assets/plugins/morris-chart/morris.css" rel="stylesheet">
    <link href="assets/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <!--End  Page Level  CSS -->
    <link href="assets/css/icons.css" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
          <script src="js/html5shiv.min.js"></script>
          <script src="js/respond.min.js"></script>
    <![endif]-->

</head>

<body class="sticky-header">

    <!--Start left side Menu-->
    <div class="left-side sticky-left-side">

        <!--logo-->
        <div class="logo">
            <a href="Home.aspx">
                <img src="assets/images/logo.png" alt=""></a>
        </div>

        <div class="logo-icon text-center">
            <a href="Home.aspx">
                <img src="assets/images/logo-icon.png" alt=""></a>
        </div>
        <!--logo-->

        <div class="left-side-inner">
            <!--Sidebar nav-->
            <ul class="nav nav-pills nav-stacked custom-nav">
                <li class="menu-list nav-active"><a href="Home.aspx"><i class="icon-home"></i><span>Dashboard</span></a>
                    <ul class="sub-menu-list">
                        <li class="active"><a href="Home.aspx">Dashboard 1</a></li>
                        <li><a href="dashboard2.html">Dashboard 2</a></li>
                    </ul>
                </li>

                <li class="menu-list"><a href="#"><i class="icon-grid"></i><span>Tables</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="table-static.html">Basic Table</a></li>
                        <li><a href="table-responsive.html">Responsive Table</a></li>
                        <li><a href="table-datatable.html">Data Tables</a></li>
                    </ul>
                </li>

                <li class="menu-list"><a href="#"><i class="icon-lock"></i><span>Login</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="Login.aspx">Login </a></li>
                        <li><a href="ForgotPassword.aspx">Forgot Password </a></li>
                        <li><a href="Register.aspx">Registration </a></li>
                        <li><a href="LockScreen.aspx">Lockscreen </a></li>
                    </ul>
                </li>

            </ul>
            <!--End sidebar nav-->

        </div>
    </div>
    <!--End left side menu-->


    <!-- main content start-->
    <div class="main-content">

        <!-- header section start-->
        <div class="header-section">

            <a class="toggle-btn"><i class="fa fa-bars"></i></a>

            <form class="searchform">
                <input type="text" class="form-control" name="keyword" placeholder="Search here..." />
            </form>

            <!--notification menu start -->
            <div class="menu-right">
                <ul class="notification-menu">

                    <li>
                        <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <img src="assets/images/users/avatar-6.jpg" alt="" />
                            Zhou Lei
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                            <li><a href="#"><i class="fa fa-wrench"></i>Settings </a></li>
                            <li><a href="#"><i class="fa fa-user"></i>Profile </a></li>
                            <li><a href="#"><i class="fa fa-info"></i>Help </a></li>
                            <li><a href="#"><i class="fa fa-lock"></i>Logout </a></li>
                        </ul>
                    </li>

                </ul>
            </div>
            <!--notification menu end -->

        </div>
        <!-- header section end-->


        <!--body wrapper start-->
        <div class="wrapper">

            <!--Start Page Title-->
            <div class="page-title-box">
                <h4 class="page-title">Dashboard1 </h4>
                <ol class="breadcrumb">
                    <li>
                        <a href="#">Dashboard</a>
                    </li>

                    <li class="active">Dashboard 1
                    </li>
                </ol>
                <div class="clearfix"></div>
            </div>
            <!--End Page Title-->

            <!--Start row-->
            <div class="row">
                <div class="container">
                    <div class="analytics-box">
                    </div>
                </div>
            </div>
            <!--End row-->

            <!--Start row-->
            <div class="row">
                <!--Start info box-->
                <div class="col-md-3 col-sm-6">
                    <div class="info-box-main">
                        <div class="info-stats">
                            <p>1250</p>
                            <span>Total Sales </span>
                        </div>
                        <div class="info-icon text-primary ">
                            <i class="mdi mdi-cart"></i>
                        </div>
                        <div class="info-box-progress">
                            <div class="progress">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="48" aria-valuemin="0" aria-valuemax="100" style="width: 48%;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End info box-->

                <!--Start info box-->
                <div class="col-md-3 col-sm-6">
                    <div class="info-box-main">
                        <div class="info-stats">
                            <p>2300</p>
                            <span>Daily visitors</span>
                        </div>
                        <div class="info-icon text-info">
                            <i class="mdi mdi-account-multiple"></i>
                        </div>
                        <div class="info-box-progress">
                            <div class="progress">
                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="48" aria-valuemin="0" aria-valuemax="100" style="width: 48%;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End info box-->

                <!--Start info box-->
                <div class="col-md-3 col-sm-6">
                    <div class="info-box-main">
                        <div class="info-stats">
                            <p>5320</p>
                            <span>Total Earning</span>
                        </div>
                        <div class="info-icon text-warning">
                            <i class="fa fa-dollar"></i>
                        </div>
                        <div class="info-box-progress">
                            <div class="progress">
                                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="48" aria-valuemin="0" aria-valuemax="100" style="width: 48%;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End info box-->

                <!--Start info box-->
                <div class="col-md-3 col-sm-6">
                    <div class="info-box-main">
                        <div class="info-stats">
                            <p>65</p>
                            <span>Pending Orders</span>
                        </div>
                        <div class="info-icon text-danger">
                            <i class="mdi mdi-weight"></i>
                        </div>
                        <div class="info-box-progress">
                            <div class="progress">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="48" aria-valuemin="0" aria-valuemax="100" style="width: 48%;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--End info box-->

            </div>
            <!--End row-->



            <!--Start row-->
            <div class="row">
                <div class="col-md-6">
                    <div class="white-box">
                        <h2 class="header-title">Sales Analytics</h2>
                        <ul class="list-inline text-center m-t-10">
                            <li>
                                <h5><i class="fa fa-circle m-r-5" style="color: #98C1D1;"></i>Iphone</h5>
                            </li>
                            <li>
                                <h5><i class="fa fa-circle m-r-5" style="color: #23DBDE;"></i>Ipad</h5>
                            </li>
                            <li>
                                <h5><i class="fa fa-circle m-r-5" style="color: #F6DDA0;"></i>Itouch</h5>
                            </li>
                        </ul>
                        <div id="morris-area-chart" style="height: 250px;"></div>
                    </div>
                </div>


                <div class="col-md-6">
                    <div class="white-box">
                        <h2 class="header-title">Total Revenue </h2>
                        <ul class="list-inline text-center m-t-10">
                            <li>
                                <h5><i class="fa fa-circle m-r-5" style="color: #03A9F3;"></i>Section A</h5>
                            </li>
                            <li>
                                <h5><i class="fa fa-circle m-r-5" style="color: #FFAA00;"></i>Section B</h5>
                            </li>
                        </ul>
                        <div id="morris2" style="height: 250px;"></div>

                    </div>
                </div>
                <!-- /col-md-6-->


            </div>
            <!--End row-->
        </div>
        <!-- End Wrapper-->


        <!--Start  Footer -->
        <footer class="footer-main">Copyright &copy; 2018.Company name All rights reserved.</footer>
        <!--End footer -->

    </div>
    <!--End main content -->



    <!--Begin core plugin -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/moment/moment.js"></script>
    <script src="assets/js/jquery.slimscroll.js "></script>
    <script src="assets/js/jquery.nicescroll.js"></script>
    <script src="assets/js/functions.js"></script>
    <!-- End core plugin -->

    <!--Begin Page Level Plugin-->
    <script src="assets/plugins/morris-chart/morris.js"></script>
    <script src="assets/plugins/morris-chart/raphael-min.js"></script>
    <script src="assets/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>
    <script src="assets/pages/dashboard.js"></script>
    <!--End Page Level Plugin-->


</body>

</html>
