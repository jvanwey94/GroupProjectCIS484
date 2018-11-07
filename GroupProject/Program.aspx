<%@ Page Title="Program" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Program.aspx.cs" Inherits="Program" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   
    <div id="wrapper">

        <!-- Navigation -->
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
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Programs</h1>
            </div>
        </div>
         <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Past Events
                             <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="createEvent.html">Create an Event</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Edit Events</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Delete Event</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">

                        <!--Panel Heading-->
                        <div class="panel-body">
                            
                           
                            <asp:GridView ID="gvRegularProgram" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource1">

                                <Columns>
                                    <asp:BoundField DataField="OrganizationName" HeaderText="OrganizationName" SortExpression="OrganizationName" />
                                    <asp:BoundField DataField="ProgName" HeaderText="ProgName" SortExpression="ProgName" />
                                    <asp:BoundField DataField="SiteType" HeaderText="SiteType" SortExpression="SiteType" />
                                    <asp:BoundField DataField="ProgStatus" HeaderText="ProgStatus" SortExpression="ProgStatus" />
                                    <asp:BoundField DataField="ProgAddress" HeaderText="ProgAddress" SortExpression="ProgAddress" />
                                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                    <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                                    <asp:BoundField DataField="NumberOfChildren" HeaderText="NumberOfChildren" SortExpression="NumberOfChildren" />
                                    <asp:BoundField DataField="NumberOfAdults" HeaderText="NumberOfAdults" SortExpression="NumberOfAdults" />

                                </Columns>
                                
                            </asp:GridView>
                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select P.OrganizationName, R.ProgName, R.SiteType, R.ProgStatus, R.ProgAddress, R.City, R.County, P.NumberOfChildren, P.NumberOfAdults from dbo.Program P, dbo.RegularProgram R where P.ProgramID = R.ProgramID"></asp:SqlDataSource>
                               <%--<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">--%>                           
                        </div>
                    </div>
                </div>
            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            </div>

        </div>

            

    <%--<div>
        
        <br />
        <asp:Label ID="lblTitle" runat="server" Text="Programs" Font-Size="XX-Large" ></asp:Label><br />
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-6" >
                <asp:Label ID="Label1" runat="server" line-height="20px" Text="*On/Off Site: "></asp:Label><br />
                <asp:Label ID="Label2" runat="server" line-height="200%" Text="*Status: "></asp:Label><br />
                <asp:Label ID="Label3" runat="server" line-height="200%" Text="Organization Name: "></asp:Label><br />
                <asp:Label ID="Label4" runat="server" height="20px" Text="Program Street Address: "></asp:Label><br />
                <asp:Label ID="Label5" runat="server" line-height="200%" Text="City: "></asp:Label><br />
                <asp:Label ID="Label6" runat="server" line-height="200%" Text="County: "></asp:Label><br />
            </div>
            <div class="col-md-6" >
                <asp:RadioButton ID="RadioButton1" runat="server" Text="ON" />
                <asp:RadioButton ID="RadioButton2" runat="server" Text="OFF" /><br />
                <asp:DropDownList ID="statusDropDown" runat="server"></asp:DropDownList><br />
                <asp:TextBox ID="organizationTxt" runat="server" required="required" Height="23px"></asp:TextBox><br />
                <asp:TextBox ID="streetTxt" runat="server" required="required" Width="149px" Height="25px"></asp:TextBox><br />
                <asp:TextBox ID="cityTxt" runat="server" Height="21px"></asp:TextBox><br />
                <asp:TextBox ID="countyTxt" runat="server" Height="19px"></asp:TextBox><br />
                
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-6" >
                <asp:Label ID="Label7" runat="server" Text="State: "></asp:Label><br />
                <asp:Label ID="Label8" runat="server" Text="Report Month: "></asp:Label><br />
                <asp:Label ID="Label9" runat="server" Text="Date: "></asp:Label><br />
                <asp:Label ID="Label10" runat="server" Text="Program: "></asp:Label><br />
                <asp:Label ID="Label11" runat="server" Text="Educators: "></asp:Label><br />
            </div>
            <div class="col-md-6" >
                <asp:TextBox ID="TextBox3" runat="server" Height="22px"></asp:TextBox><br />
                <asp:DropDownList ID="DropDownList5" runat="server"></asp:DropDownList><br />
                <asp:TextBox ID="TextBox4" runat="server" required="required" Height="16px"></asp:TextBox><br />
                <asp:TextBox ID="TextBox5" runat="server" Height="16px"></asp:TextBox><br />
                <asp:TextBox ID="TextBox6" runat="server" Height="16px"></asp:TextBox><br />
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-6" >
                <asp:Label ID="Label12" runat="server" Text="Birds:"></asp:Label><br />
                <asp:Label ID="Label13" runat="server" Text="Mammals"></asp:Label><br />
                <asp:Label ID="Label14" runat="server" Text="Reptiles"></asp:Label><br />
                <asp:Label ID="Label15" runat="server" Text="Number of children:"></asp:Label><br />
                <asp:Label ID="Label16" runat="server" Text="Number of adults:"></asp:Label><br />
                <asp:Label ID="Label17" runat="server" Text="Waiting for payment?"></asp:Label><br />
            </div>
            <div class="col-md-6" >
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
            <div class="col-md-6"> stuff
                <asp:Button ID="Button1" runat="server" class="btn btn-primary" onClick="Button1_Click" Text="Add to Database" />
                <asp:Button ID="Button2" runat="server" class="btn btn-secondary" formNoValidate="formNoValidate" onClick="Button2_Click" Text="Exit" /><br />
                <asp:Label ID="Label18" runat="server" Text=""></asp:Label>    
            </div>
            
        </div>
    </div>--%>
        <div class="modal fade" id="addProgram" tabindex="1" role="dialog" aria-labelledby="addProgram" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                        <h5 class="modal-title" id="addProgramModal">
                            Create Program
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Organization Name</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtOrganizationName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Address</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtOrganizationAddress" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>City</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtCity" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>County</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtCounty" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Site Type</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtProgramName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Program Name</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtSiteType" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Status</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtStatus" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Date</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtDate" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Animal</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="ddAnimal" class="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnCreateProgram" runat="server" onClick="CreateProgram" class="btn btn-primary" Text="Create" />
                    <asp:Button ID="btnClose" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close" />
                </div>
            </div>
        </div>
    </div>
         <div class="modal fade" id="editProgram" tabindex="1" role="dialog" aria-labelledby="editProgram" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
@@ -238,6 +334,8 @@
        </div>
    </div>

    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/responsive/1.0.7/css/responsive.bootstrap.min.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[id*=gvRegularProgram]").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                responsive: true,
                paging: true,
                lengthChange: false,
                searching: true,
                ordering: true,
                info: true,
                autoWidth: false
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("tr").click(function() {
                $(".row-button", this).click();
          });
        });
    </script>
</asp:Content>

