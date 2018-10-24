<%@ Page Title="Program" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Program.aspx.cs" Inherits="Program" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <h1>PROGRAM</h1>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-6" style="background-color:aqua">
                <asp:Label ID="Label1" runat="server" line-height="20px" Text="*On/Off Site: "></asp:Label><br />
                <asp:Label ID="Label2" runat="server" line-height="200%" Text="*Status: "></asp:Label><br />
                <asp:Label ID="Label3" runat="server" line-height="200%" Text="Organization Name: "></asp:Label><br />
                <asp:Label ID="Label4" runat="server" height="20px" Text="Program Street Address: "></asp:Label><br />
                <asp:Label ID="Label5" runat="server" line-height="200%" Text="City: "></asp:Label><br />
                <asp:Label ID="Label6" runat="server" line-height="200%" Text="County: "></asp:Label><br />
            </div>
            <div class="col-md-6" style="background-color:cadetblue">
                <asp:RadioButton ID="RadioButton1" runat="server" Text="ON" />
                <asp:RadioButton ID="RadioButton2" runat="server" Text="OFF" /><br />
                <asp:DropDownList ID="statusDropDown" runat="server" Height="16px"></asp:DropDownList><br />
                <asp:TextBox ID="organizationTxt" runat="server" required="required" Height="23px"></asp:TextBox><br />
                <asp:TextBox ID="streetTxt" runat="server" required="required" Width="149px" Height="25px"></asp:TextBox><br />
                <asp:TextBox ID="cityTxt" runat="server" Height="21px"></asp:TextBox><br />
                <asp:TextBox ID="countyTxt" runat="server" Height="19px"></asp:TextBox><br />
                
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-6" style="background-color:darkviolet">
                <asp:Label ID="Label7" runat="server" Text="State: "></asp:Label><br />
                <asp:Label ID="Label8" runat="server" Text="Report Month: "></asp:Label><br />
                <asp:Label ID="Label9" runat="server" Text="Date: "></asp:Label><br />
                <asp:Label ID="Label10" runat="server" Text="Program: "></asp:Label><br />
                <asp:Label ID="Label11" runat="server" Text="Educators: "></asp:Label><br />
            </div>
            <div class="col-md-6" style="background-color:gold">
                <asp:TextBox ID="TextBox3" runat="server" Height="22px"></asp:TextBox><br />
                <asp:DropDownList ID="DropDownList5" runat="server"></asp:DropDownList><br />
                <asp:TextBox ID="TextBox4" runat="server" required="required" Height="16px"></asp:TextBox><br />
                <asp:TextBox ID="TextBox5" runat="server" Height="16px"></asp:TextBox><br />
                <asp:TextBox ID="TextBox6" runat="server" Height="16px"></asp:TextBox><br />
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-6" style="background-color:fuchsia">
                <asp:Label ID="Label12" runat="server" Text="Birds:"></asp:Label><br />
                <asp:Label ID="Label13" runat="server" Text="Mammals"></asp:Label><br />
                <asp:Label ID="Label14" runat="server" Text="Reptiles"></asp:Label><br />
                <asp:Label ID="Label15" runat="server" Text="Number of children:"></asp:Label><br />
                <asp:Label ID="Label16" runat="server" Text="Number of adults:"></asp:Label><br />
                <asp:Label ID="Label17" runat="server" Text="Waiting for payment?"></asp:Label><br />
            </div>
            <div class="col-md-6" style="background-color:lawngreen">
                <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList><br />
                <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList><br />
                <asp:DropDownList ID="DropDownList4" runat="server"></asp:DropDownList><br />
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
                <asp:RadioButton ID="RadioButton3" runat="server" Text="Yes" />
                <asp:RadioButton ID="RadioButton4" runat="server" Text="No"/><br />
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <asp:Button ID="Button1" runat="server" class="btn btn-primary" onClick="Button1_Click" Text="Add to Database" />
                <asp:Button ID="Button2" runat="server" class="btn btn-secondary" formNoValidate="formNoValidate" onClick="Button2_Click" Text="Exit" /><br />
                <asp:Label ID="Label18" runat="server" Text=""></asp:Label>    
            </div>
            
        </div>
    </div>
</asp:Content>

