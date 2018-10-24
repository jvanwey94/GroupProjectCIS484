<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">



    
        <div>

          
            <br />
            <strong>Create Employee Account</strong><br />
            First Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            <br />
            Last Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            <br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <br />
            Phone-Number:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPN" runat="server"></asp:TextBox>
            <br />
            Gender:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtGender" runat="server"></asp:TextBox> 
            <asp:Label ID="Label1" runat="server" Text="(Male / Female)"
                Font-Size="small" ForeColor="black"></asp:Label>
            <br />
            Job Level:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtJL" runat="server"></asp:TextBox>
            <br />
            Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <br />
            Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPassword" type="password" runat="server"></asp:TextBox>
            &nbsp;<br />
            <asp:Label ID="lblReminder" runat="server" Text="(Password must be at least 8 characters, no more than 16 characters, and must include at least one upper case letter, lower case letter, and numeric digit.)"
                Font-Size="small" ForeColor="#ff3300"></asp:Label>
            <br />
            Confirm Password:
            <asp:TextBox ID="txtConfirm" type="password" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" OnClick="btnSubmit_Click" Text="Create" Width="150"  />
            <br />
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
            <br />
            <asp:LinkButton ID="lnkAnother" runat="server" OnClick="lnkAnother_Click" Visible="False">Create Another</asp:LinkButton>
              <asp:LinkButton ID="lnkLogin" runat="server" OnClick="lnkLogin_Click">Login</asp:LinkButton> 
        </div>



</asp:Content>


