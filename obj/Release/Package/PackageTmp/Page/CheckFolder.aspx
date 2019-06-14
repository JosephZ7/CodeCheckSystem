<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckFolder.aspx.cs" Inherits="CodeCheck.Page.CheckFolder" %>

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

    <link type="text/css" rel="stylesheet" href="highlight/Styles/SyntaxHighlighter.css" />

</head>

<body class="sticky-header">

    <!--Start left side Menu-->
    <div class="left-side sticky-left-side">


        <div class="left-side-inner">
            <!--Sidebar nav-->
            <ul class="nav nav-pills nav-stacked custom-nav">
                <li class="menu-list nav-active"><a href="Home.aspx"><i class="icon-home"></i><span>CodeCheck</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="Home.aspx">CheckFile</a></li>
                        <li class="active"><a href="CheckFolder.aspx">CheckFolder</a></li>
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
                            <li><a href="Index.aspx"><i class="fa fa-info"></i>Help </a></li>
                            <li><a href="Login.aspx"><i class="fa fa-lock"></i>Logout </a></li>
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
                        <h2 class="header-title">Multi Files Check（对文件夹里的所有文件对比）</h2>
                        <div class="fallback">
                            <table>
                                <tr>
                                    <td>
                                        <asp:FileUpload ID="FileUpload1" runat="server" webkitdirectory=""  />
                                    </td>
                                    <td>
                                        <asp:Button ID="Button1" class="btn btn-info" runat="server" OnClick="Bt_upload_Click2" Text="上传" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Width="300px"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />

                        <h4>输入最低的相似度（0-100之间）来过滤结果</h4>

                        <asp:TextBox id="RangeText" runat="server" />
                        <br />
                        <asp:RangeValidator ControlToValidate="RangeText" MinimumValue="0" MaximumValue="100" Type="Double" EnableClientScript="false" Text="The Value must be between 0 and 100!" runat="server" />

                        <h4>Run Program</h4>
                        <div class="button-wrap">
                             
                            <asp:Button ID="Button2" class="btn btn-purple" runat="server" OnClick="Bt_excute_Click2" Text="运行" />
                            <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-success" OnClick="LinkButton1_Click">下载结果</asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <!-- end row -->

            <!--Start row-->
            <div class="row">
                <div class="col-md-12">
                    <div class="white-box">
                    <h2 class="header-title">下面是文件夹中相似度最高的两个文件</h2>
                    <div class="col-md-6">
                        <div class="white-box">
                            <h2 class="header-title">
                                <asp:Label ID="Label3" runat="server" Text="FileName"></asp:Label>
                            </h2>
                            <textarea name="code" class="c" rows="15" cols="100"> 
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            </textarea>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="white-box">
                            <h2 class="header-title">
                                <asp:Label ID="Label4" runat="server" Text="FileName"></asp:Label>
                            </h2>
                            <textarea name="code" class="c" rows="15" cols="100"> 
                                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                            </textarea>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            <!--End row-->

            <div class="row">
                <div class="col-md-12">
                    <div class="white-box">
                        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                    </div>
                </div>
            </div>
            </form>
        </div>
        <!-- End Wrapper-->


        <!--Start  Footer -->
        <footer class="footer-main">Copyright &copy; 2019.CUIT All rights reserved.</footer>
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

    <script class="javascript" src="highlight/Scripts/shCore.js"></script> 
    <script class="javascript" src="highlight/Scripts/shBrushCSharp.js"></script> 
    <script class="javascript" src="highlight/Scripts/shBrushPhp.js"></script> 
    <script class="javascript" src="highlight/Scripts/shBrushJScript.js"></script> 
    <script class="javascript" src="highlight/Scripts/shBrushJava.js"></script> 
    <script class="javascript" src="highlight/Scripts/shBrushVb.js"></script> 
    <script class="javascript" src="highlight/Scripts/shBrushSql.js"></script> 
    <script class="javascript" src="highlight/Scripts/shBrushXml.js"></script> 
    <script class="javascript" src="highlight/Scripts/shBrushDelphi.js"></script> 
    <script class="javascript" src="highlight/Scripts/shBrushPython.js"></script> 
    <script class="javascript" src="highlight/Scripts/shBrushRuby.js"></script> 
    <script class="javascript" src="highlight/Scripts/shBrushCss.js"></script> 
    <script class="javascript" src="highlight/Scripts/shBrushCpp.js"></script> 
    <script class="javascript"> 
    dp.SyntaxHighlighter.HighlightAll('code'); 
    </script>


</body>

</html>
