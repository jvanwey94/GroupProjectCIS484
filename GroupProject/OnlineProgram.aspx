<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OnlineProgram.aspx.cs" Inherits="OnlineProgram" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <div>
        <h1>Online Programs</h1>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <asp:Label ID="Label1" runat="server" Text="Date"></asp:Label><br />
                <asp:Label ID="Label2" runat="server" Text="Month"></asp:Label><br />
                <asp:Label ID="Label3" runat="server" Text="Type"></asp:Label><br />
                <asp:Label ID="Label5" runat="server" Text="State"></asp:Label><br />
                <asp:Label ID="Label14" runat="server" Text="Country"></asp:Label><br />
                <asp:Label ID="Label6" runat="server" Text="Number of Kids"></asp:Label><br />
                <asp:Label ID="Label13" runat="server" Text="Number of Adults"></asp:Label><br />
                <asp:Label ID="Label7" runat="server" Text="Grade Level"></asp:Label><br />
                <asp:Label ID="Label8" runat="server" Text="Teacher Name"></asp:Label><br />
                <asp:Label ID="Label9" runat="server" Text="Email"></asp:Label><br />
                <asp:Label ID="Label10" runat="server" Text="Educator"></asp:Label><br />
                <asp:Label ID="Label11" runat="server" Text="Theme"></asp:Label><br />
                <asp:Label ID="Label12" runat="server" Text="Animals Used"></asp:Label><br />
            </div>
            <div class="col-md-6">
                <asp:TextBox ID="TextBox11" required="required" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TextBox12" required="required" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TextBox13" required="required" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TextBox15" required="required" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TextBox16" required="required" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TextBox1" required="required" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TextBox2" required="required" runat="server"></asp:TextBox><br />
                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList><br />
                <asp:TextBox ID="TextBox17" required="required" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TextBox18" required="required" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TextBox19" required="required" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TextBox20" required="required" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TextBox21" required="required" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>

</asp:Content>

