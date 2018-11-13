<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="LoginContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #nava{
            display:none;
        }
        
   </style>
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Sign in to Wildlife Center</h3>
                    </div>
                    <div class="panel-body">
                            <div style="margin: 0 0 0 7.5%;">
                                <div class="form-group">
                                    <asp:Label ID="lblUserName" runat="server">Username</asp:Label>
                                    <asp:TextBox ID="txtUserName" class="form-control" runat="server" />
                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblPassword" runat="server">Password</asp:Label>
                                    <asp:TextBox ID="txtPassword" class="form-control" type="password" value="" runat="server" />
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                
                                <asp:Button ID="btnLogin" class="btn btn-lg btn-success btn-block" Text="Login" OnClick="btn_Login" runat="server" />
                                
                         </div>       
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblCreateUser" class="form-control" style="height: 50px; text-align: center; padding-top:1em; background-color:none;" runat="server"><a href="CreateUser.aspx">Create New User Account</a></asp:Label>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>


</asp:Content>
