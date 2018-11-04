<%@ Page Title="Create User" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="container">
        <div class="row">
            <h3>Create User</h3>
            <div class="col-lg-4 col-md-6" style="margin: 1% 0 1% 0;">
                <div class="form-group">
                    <asp:Label ID="lblFirstName" runat="server" >First Name:</asp:Label>
                    <asp:TextBox ID="txtFirstName" class="form-control" runat="server" />
                </div>
            </div>
            <div class="col-lg-4 col-md-6" style="margin: 1% 0 1% 0;">
                <asp:Label ID="lblLastName" runat="server">Last Name</asp:Label>
                <asp:TextBox ID="txtLastName" class="form-control" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6" style="margin: 1% 0 1% 0;">
                <div class="form-group">
                    <asp:Label ID="lblEmail" runat="server">Email Address</asp:Label>
                    <asp:TextBox ID="txtEmail" class="form-control" runat="server" />
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <asp:Label ID="lblPhone" runat="server">Phone Number</asp:Label>
                <asp:TextBox ID="txtPN" class="form-control" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="lblGender" runat="server">Gender</div>
                <asp:DropDownList ID="txtGender" class="form-control" runat="server">
                    <asp:ListItem >Male</asp:ListItem>
                    <asp:ListItem >Female</asp:ListItem>
            </asp:DropDownList>
            </div>
            <div class="col-lg-4 col-md-6">
                <asp:Label ID="lblJob" runat="server">Job Level</asp:Label>
                <asp:DropDownList ID="txtJobLevel" class="form-control" runat="server">
                    <asp:ListItem >Full-time Staff</asp:ListItem>
                    <asp:ListItem >Volunteer/Internship</asp:ListItem>
         
                </asp:DropDownList>
            </div>
        </div>

       <div  style="margin: 5% 0 1% 17.5%;">
        <div class="row">
            <div class="col-lg-4 col-md-2" style="margin: 0 0 1% 0;">
                <asp:Label ID="lblUserName" runat="server">User Name</asp:Label>
                <asp:TextBox ID="txtUsername" class="form-control" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-2">
                <asp:Label ID="lblPassword" runat="server">Password</asp:Label>
                <asp:TextBox ID="txtPassword" type="password" class="form-control" runat="server" />
            <asp:Label ID="lblReminder" runat="server" Text="(Password must be at least 8 characters, no more than 16 characters, and must include at least one upper case letter, lower case letter, and numeric digit.)"
                Font-Size="small" ForeColor="gray"></asp:Label>
            </div>
         </div>
        <div class="row">
            <div class="col-lg-4 col-md-2 m-2" style="margin: 1% 0 0 0;">
                <asp:Label ID="lblConfirm" runat="server">Confirm Password</asp:Label>
                <asp:TextBox ID="txtConfirm" type="password" class="form-control" runat="server"></asp:TextBox>
            </div>
         </div>
        <div class="row" style=" padding-top:1em; " >
            <div class="col-lg-4 col-md-2">
                
                <asp:Button ID="btnSubmit" class="btn btn-lg btn-success btn-block" Text="Create" OnClick="btnSubmit_Click" runat="server"  Width="150" />
            </div>
        </div>
    </div>
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
            <asp:LinkButton ID="lnkAnother" runat="server" OnClick="lnkAnother_Click" Visible="False">Create Another</asp:LinkButton>
              <asp:LinkButton ID="lnkLogin" runat="server" OnClick="lnkLogin_Click">Login</asp:LinkButton> 
        </div>
    


</asp:Content>


