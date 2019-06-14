<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="CodeCheck.Page.ResetPassword" %>

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
</head>

<body>


    <!--Start login Section-->
    <section class="login-section">
        <div class="container">
            <div class="row">
                <div class="login-wrapper">
                    <div class="login-inner">

                        <h2 class="header-title text-center">Reset Password </h2>

                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                                ×
                            </button>
                            Enter your <b>New Password</b>!
                        </div>

                        <form runat="server">
                            <div class="form-group">
                                <asp:TextBox runat="server" type="text" name="Password" id="Password" class="form-control" placeholder="Enter New Password" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="Password" runat="server" ErrorMessage="以字母开头，长度在6-18之间，只能包含字符、数字和下划线。" ValidationExpression="^[a-zA-Z]\w{5,17}"></asp:RegularExpressionValidator>
                            </div>


                            <div class="form-group">
                                <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-primary btn-block" OnClick="Button1_Click" />
                            </div>

                        </form>

                        <div class="copy-text">
                            <p class="m-0">2019 &copy; ZhouLei admin</p>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </section>
    <!--End login Section-->


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
