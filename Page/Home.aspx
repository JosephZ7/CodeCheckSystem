<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CodeCheck.Page.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Online Ablum</title>
    <style>
        #page_header {
            height: 20px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <form runat="server">
        <asp:LinkButton runat="server" OnClick="Unnamed2_Click" ID="btnToReg">注册</asp:LinkButton>

        <asp:LinkButton runat="server" OnClick="Unnamed1_Click" ID="btnToLog">登录</asp:LinkButton>
    </form>
</body>
</html>
