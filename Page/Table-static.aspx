<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Table-static.aspx.cs" Inherits="CodeCheck.Page.Table_static" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/images/favicon.png" type="image/png">
    <title></title>
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
                        <li><a href="Table-static.aspx">Basic Table</a></li>
                        <li><a href="Table-responsive.aspx">Responsive Table</a></li>
                        <li><a href="Table-datatable.aspx">Data Tables</a></li>
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
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
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
                <h4 class="page-title">Basic Table</h4>
                <ol class="breadcrumb">
                    <li>
                        <a href="#">Dashboard</a>
                    </li>
                    <li>
                        <a href="#">Table</a>
                    </li>
                    <li class="active">Basic Table
                    </li>
                </ol>
                <div class="clearfix"></div>
            </div>
            <!--End Page Title-->


            <!--Start row-->
            <div class="row">

                <!-- Start Basic Table-->
                <div class="col-md-6">
                    <div class="white-box">
                        <h2 class="header-title">Basic Table</h2>
                        <div class="table-wrap">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Firstname</th>
                                        <th>Lastname</th>
                                        <th>Email</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Mark</td>
                                        <td>Doe</td>
                                        <td>Mark@example.com</td>
                                    </tr>
                                    <tr>
                                        <td>Mark</td>
                                        <td>Doe</td>
                                        <td>Mark@example.com</td>
                                    </tr>
                                    <tr>
                                        <td>Mark</td>
                                        <td>Doe</td>
                                        <td>Mark@example.com</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- End Basic Table-->

                <!-- Start  Striped  Table-->
                <div class="col-md-6">
                    <div class="white-box">
                        <h2 class="header-title">Striped Table</h2>
                        <div class="table-wrap">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Firstname</th>
                                        <th>Lastname</th>
                                        <th>Email</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Mark</td>
                                        <td>Doe</td>
                                        <td>Mark@example.com</td>
                                    </tr>
                                    <tr>
                                        <td>Mark</td>
                                        <td>Doe</td>
                                        <td>Mark@example.com</td>
                                    </tr>
                                    <tr>
                                        <td>Mark</td>
                                        <td>Doe</td>
                                        <td>Mark@example.com</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- End  Striped Table-->

            </div>
            <!--/row-->

            <div class="row">
                <!-- Start  Bordered  Table-->
                <div class="col-md-6">
                    <div class="white-box">
                        <h2 class="header-title">Bordered Table</h2>
                        <div class="table-wrap">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Username</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- End  Bordered Table-->

                <!-- Start  hover  Table-->
                <div class="col-md-6">
                    <div class="white-box">
                        <h2 class="header-title">Hover Table</h2>
                        <div class="table-wrap">
                            <table class="table table table-hover m-0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Username</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- End  hover Table-->

            </div>
            <!--/row-->

            <div class="row">
                <!-- Start  hover  Table-->
                <div class="col-md-6">
                    <div class="white-box">
                        <h2 class="header-title">Condensed Table</h2>
                        <div class="table-wrap">
                            <table class="table table-condensed">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Username</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- End  hover Table-->

                <!-- Start  hover  Table-->
                <div class="col-md-6">
                    <div class="white-box">
                        <h2 class="header-title">Contextual Table</h2>
                        <div class="table-wrap">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Column heading</th>
                                        <th>Column heading</th>
                                        <th>Column heading</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="active">
                                        <th scope="row">1</th>
                                        <td>Jacob</td>
                                        <td>Jacob</td>
                                        <td>Jacob</td>
                                    </tr>

                                    <tr class="success">
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Jacob</td>
                                        <td>Jacob</td>
                                    </tr>

                                    <tr class="info">
                                        <th scope="row">3</th>
                                        <td>Jacob</td>
                                        <td>Jacob</td>
                                        <td>Jacob</td>
                                    </tr>

                                    <tr class="warning">
                                        <th scope="row">4</th>
                                        <td>Jacob</td>
                                        <td>Jacob</td>
                                        <td>Jacob</td>
                                    </tr>

                                    <tr class="danger">
                                        <th scope="row">5</th>
                                        <td>Jacob</td>
                                        <td>Jacob</td>
                                        <td>Jacob</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- End  hover Table-->

            </div>
            <!--/row-->

        </div>
        <!-- End Wrapper-->


        <!--Start  Footer -->
        <footer class="footer-main">Copyright &copy; 2019.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></footer>
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

</body>

</html>
