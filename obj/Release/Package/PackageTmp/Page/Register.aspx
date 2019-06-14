<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CodeCheck.Page.Register" %>

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

                        <h2 class="header-title text-center">Sign Up</h2>

                        <form runat="server">
                            <div class="form-group">
                                <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox3" runat="server" ErrorMessage="Email 格式不对！" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TextBox1" runat="server" ErrorMessage="只能中英文，数字，下划线，减号" ValidationExpression="^[\u4e00-\u9fa5A-Za-z0-9-_]*"></asp:RegularExpressionValidator>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Password" UseSystemPasswordChar="true" TextMode="Password"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="TextBox2" runat="server" ErrorMessage="以字母开头，长度在6-18之间，只能包含字符、数字和下划线。" ValidationExpression="^[a-zA-Z]\w{5,17}"></asp:RegularExpressionValidator>
                            </div>

                            <div class="form-group">
                                <asp:Button ID="Button1" runat="server" Text="Sign Up" class="btn btn-primary btn-block" OnClick="Button1_Click" />
                            </div>

                            <div class="form-group text-center">
                                Already have an account?  <a href="Login.aspx">Sign In </a>
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
