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
    <link rel="stylesheet" href="assets/css/layui.css"  media="all">
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
                <li class="menu-list nav-active"><a href="Home.aspx"><i class="icon-home"></i><span>CodeCheck</span></a>
                    <ul class="sub-menu-list">
                        <li class="active"><a href="Home.aspx">CodeSimilarity</a></li>
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
                <h4 class="page-title">CodeSimilarity </h4>
                <ol class="breadcrumb">
                    <li>
                        <a href="#">CodeCheck</a>
                    </li>
                </ol>
                <div class="clearfix"></div>
            </div>
            <!--End Page Title-->

            <form action="#" id="Form1" enctype="multipart/form-data" runat="server" method="post">


            <!--Start row-->
            <div class="row">
                <div class="col-md-12">
                    <div class="white-box">
                        
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <!-- end row -->


            <!--Start row-->
            <div class="row">
                <div class="col-md-6">
                    <div class="white-box">
                        <h2 class="header-title">Single File Check</h2>
                        <div class="fallback">
                            
                            <input id="UpLoad" type="file" name="file" multiple="multiple"/>
                            <asp:Button ID="bt_upload" class="btn btn-info" runat="server" OnClick="Bt_upload_Click" Text="上传" />
                            <asp:Label ID="Upload_info" runat="server" ForeColor="Red" Width="300px"></asp:Label>
                        </div>
                        <br />
                        <!-- /.checkbox -->

                        <div class="checkbox primary">
                            <input type="checkbox" checked id="checkbox-2">
                            <label for="checkbox-2">Primary</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox success">
                            <input type="checkbox" checked id="checkbox-3">
                            <label for="checkbox-3">Success</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox info">
                            <input type="checkbox" id="checkbox-4">
                            <label for="checkbox-4">Info</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox warning">
                            <input type="checkbox" id="checkbox-5">
                            <label for="checkbox-5">Warning</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox pink">
                            <input type="checkbox" id="checkbox-8">
                            <label for="checkbox-8">Pink</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox danger">
                            <input type="checkbox" checked id="checkbox-6">
                            <label for="checkbox-6">Danger</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox purple">
                            <input type="checkbox" id="checkbox-7">
                            <label for="checkbox-7">Purple</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox inverse">
                            <input type="checkbox" checked id="checkbox-9">
                            <label for="checkbox-9">Inverse</label>
                        </div>

                        
                        <h4 class="header-title">Run Program</h4>
                        <div class="button-wrap">
                             
                            <asp:Button ID="bt_excute" class="btn btn-primary" runat="server" OnClick="Bt_excute_Click" Text="运行" />

                            <asp:Label ID="Excute_info" runat="server" ForeColor="Red" Width="183px"></asp:Label>
                        </div>
                    </div>
                </div>


                <div class="col-md-6">
                    <div class="white-box">
                        <h2 class="header-title">Multi Files Check</h2>
                        <div class="fallback">
                            <input id="UpLoad1" type="file" name="file" />
                            <asp:Button ID="Button1" class="btn btn-info" runat="server" OnClick="Bt_upload_Click2" Text="上传" />
                            <asp:Label ID="Label2" runat="server" ForeColor="Red" Width="300px"></asp:Label>
                        </div>
                        <br />
                        <div id="slideTest9" class="demo-slider"></div>
                        <br />
                        <div id="test-slider-tips2" style="position:relative; left: 30px; margin-top: -10px;"></div>
                        <br />
                        <!-- /.checkbox -->

                        <div class="checkbox circled primary">
                            <input type="checkbox" checked id="checkbox-circled-2">
                            <label for="checkbox-circled-2">Primary</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox circled success">
                            <input type="checkbox" checked id="checkbox-circled-3">
                            <label for="checkbox-circled-3">Success</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox circled info">
                            <input type="checkbox" id="checkbox-circled-4">
                            <label for="checkbox-circled-4">Info</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox circled warning">
                            <input type="checkbox" id="checkbox-circled-5">
                            <label for="checkbox-circled-5">Warning</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox circled danger">
                            <input type="checkbox" checked id="checkbox-circled-6">
                            <label for="checkbox-circled-6">Danger</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox circled purple">
                            <input type="checkbox" id="checkbox-circled-7">
                            <label for="checkbox-circled-7">Purple</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox circled pink">
                            <input type="checkbox" id="checkbox-circled-8">
                            <label for="checkbox-circled-8">Pink</label>
                        </div>
                        <!-- /.checkbox -->

                        <div class="checkbox circled inverse">
                            <input type="checkbox" checked id="checkbox-circled-9">
                            <label for="checkbox-circled-9">Inverse</label>
                        </div>
                        <!-- /.checkbox -->

                        <h4 class="header-title">Run Program</h4>
                        <div class="button-wrap">
                             
                            <asp:Button ID="Button2" class="btn btn-purple" runat="server" OnClick="Bt_excute_Click2" Text="运行" />

                            <asp:Label ID="Label3" runat="server" ForeColor="Red" Width="183px"></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <!-- end row -->
            
            </form>
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

    <script src="assets/layui.js" charset="utf-8"></script>
    <script>
          //开启范围选择
        layui.use('slider', function () {
            var $ = layui.$
                , slider = layui.slider;
            slider.render({
                elem: '#slideTest9'
                , value: 40 //初始值
                , range: true //范围选择
                , change: function (vals) {
                    $('#test-slider-tips2').html('开始值：' + vals[0] + '、结尾值：' + vals[1]);
                }
            });
        });
        
    </script>

</body>

</html>
