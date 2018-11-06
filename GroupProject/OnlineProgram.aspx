<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OnlineProgram.aspx.cs" Inherits="OnlineProgram" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="wrapper">
       <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Home.aspx"></a>
                <asp:Label ID="Header" runat="server" Text="Wildlife Center Of Virginia" Font-Bold="True" Font-Italic="True" Font-Size="XX-Large" ForeColor="#006600"></asp:Label>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
      
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="Userprofile.aspx"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
             
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="Home.aspx"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="Program.aspx"><i class="fa fa-calendar-o fa-fw"></i> Events </a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-paw fa-fw"></i> Animals<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<li>
                            		<a href="manageAnimal.html">Manage Animals</a>
                            	</li>
                            	<li>
                            		<a href="trackAnimal.html">Track Animals</a>
                            	</li>
                            </ul>
                        </li>
                        <li>
                            <a href="reports.html"><i class="fa fa-files-o fa-fw"></i> Reports </a>
                            <ul class="nav nav-second-level">
                            	<li>
                            		<a href="financialReport.aspx">Financial Report</a>
                            	</li>
                            	<li>
                            		<a href="ProgramReport.aspx">Program Report</a>
                            	</li>
                                <li>
                            		<a href="AnimalReport.aspx">Animal Report</a>
                            	</li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
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
                <asp:Label ID="lblProgramName" runat="server" Text="Program Name: "></asp:Label>
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="txtProgramName" required="required" runat="server" ></asp:TextBox><br />
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
                <asp:TextBox ID="txtTheme" runat="server" ></asp:TextBox><br />
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
        </div>
    </div>
        

</asp:Content>

