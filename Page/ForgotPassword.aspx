<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="CodeCheck.Page.ForgotPassword" %>

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

<body class="sticky-header">

 <!--Start login Section-->
  <section class="login-section">
       <div class="container">
           <div class="row">
               <div class="login-wrapper">
                   <div class="login-inner">
                       <form runat="server">
                         <label class="text-center m-b-25">Enter your email address below to reset your password</label>
                           <div class="form-group">
                               <asp:TextBox runat="server" type="text" name="Email" id="Email" class="form-control" />
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="Email" runat="server" ErrorMessage="Email 格式不对！" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                           </div>
                           
                           <div class="form-group">
                               <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-primary btn-block" OnClick="Button1_Click" />
                           </div>
                           
                       </form>
                    
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
