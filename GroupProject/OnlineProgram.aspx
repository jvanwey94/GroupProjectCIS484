<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OnlineProgram.aspx.cs" Inherits="OnlineProgram" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
        <div>
       
            <br />
        <asp:Label ID="lblTitle" runat="server" Text="Online Programs" Font-Size="XX-Large" ></asp:Label><br />
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <asp:Label ID="lblOrganizationName" runat="server" Text="Organization Name: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtOrganizationName" required="required" runat="server" AutoPostBack="True" OnTextChanged="txtOrganizationName_TextChanged"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <asp:Label ID="lblDate" runat="server" Text="Date: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtDate" type="Date"  runat="server"></asp:TextBox><br />
                <br />
            </div>
        </div>
       <%-- <div class="row">
            <div class="col-md-2">
                <asp:Label ID="Label2" runat="server" Text="Month: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="TextBox12" required="required" runat="server"></asp:TextBox><br />
            </div>
        </div>--%>
        <div class="row">
            <div class="col-md-2">
                <asp:Label ID="lblType" runat="server" Text="Type: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtType" required="required" runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <asp:Label ID="lblState" runat="server" Text="State: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtState" required="required" runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <asp:Label ID="lblCountry" runat="server" Text="Country: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtCountry" required="required" runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">  <%--required="required"--%>
            <div class="col-md-2">
                <asp:Label ID="lblNK" runat="server" Text="Number of Kids: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtNK" runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row"> <%--required="required" --%>
            <div class="col-md-2">
                <asp:Label ID="lblNA" runat="server" Text="Number of Adults: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtNumberOFAdults" runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <asp:Label ID="Label7" runat="server" Text="Grade Level: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList><br />
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <asp:Label ID="lblTeacherName" runat="server" Text="Teacher Name: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtTeacherName" required="required" runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row"> <%--required="required" --%>
            <div class="col-md-2">
                <asp:Label ID="lblTeacher" runat="server" Text="Educator: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtTeacher"  runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row"> <%--required="required" --%>
            <div class="col-md-2">
                <asp:Label ID="lblTheme" runat="server" Text="Theme: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtTheme" runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <asp:Label ID="lblAnimalUsed" runat="server" Text="Animals Used: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtAnimalUsed" required="required" runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <asp:Label ID="lblPayment" runat="server" Text="Waiting for payment? "></asp:Label><br />
            </div>
            <div class="col-md-2">
                <asp:RadioButton ID="txtPayment1" runat="server" Text="Yes" />
                <asp:RadioButton ID="txtPayment2" runat="server" Text="No"/><br />
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <asp:Button ID="btnCreate" runat="server" onClick="Button1_Click"  Text="Create" />

            </div>
        </div>
    </div>

</asp:Content>

