<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
<%--    <h1>Welcome to</h1><br />
    <h2>Wild Animal center </h2><br />--%>
    <p>
               <%-- This is Title--%>
        <br />
                <asp:Label ID="lblTitle" runat="server" Text="Welcome to Wildlife Center" Font-Size="XX-Large" ></asp:Label><br />

               
      
                  
                <asp:Label ID="lblUserName" runat="server" Text="Username:" Font-Size="Large" ></asp:Label><br />
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><br />
        <br />
        <br />
                <asp:Label ID="lblPassWord" runat="server" Text="Password"  Font-Size="Large" ></asp:Label><br />
                <asp:TextBox ID="txtPassword" type="password" runat="server"></asp:TextBox>
    <p>
               <asp:CheckBox ID="CheckBox1" runat="server" />
                <asp:Label ID="Label1" runat="server" Text="Remember my Username"  Font-Size="small" ></asp:Label>
               <br />
       
               <asp:Button ID="btnLogin" class="btn btn-primary" runat="server" Text="Login" Width="150" OnClick="btn1_Login" />
        <br />
       
            <asp:Label ID="lblStatus" runat="server"></asp:Label> <br />
        <br />
               <%--<asp:Button ID="lnkCreate" class="btn btn-primary" runat="server" Text="Create"  OnClick="btn1_NewUser" />--%>
        <asp:LinkButton ID="lnkCreate" runat="server" OnClick="lnkCreate_Click">Create User</asp:LinkButton>
<%--        btnCreateUser {padding: 2px 5px;}
        btnLogin {padding: 32px 16px;}--%>
                  
              <%--    <asp:Button ID="btn2" class="btn btn-primary" runat="server" Text="Edit" Width="150" OnClick="btn2_Click"/>
              
              <asp:Button ID="Button2" class="btn btn-primary" runat="server" OnClick="Button2_Click" Text="Commit" />--%>
</asp:Content>



