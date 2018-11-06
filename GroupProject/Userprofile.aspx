<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Userprofile.aspx.cs" Inherits="Userprofile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
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
                    <h1 class="page-header">User Management</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            User Information
                             <div class="pull-right">
                                <div class="btn-group">
                                   <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        Actions
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#addAnimals" data-toggle="modal" data-target="#addAnimals">Add an Animal</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Delete an Animal</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#">Edit an Animal</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered table-hover" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                        <asp:BoundField DataField="PersonEmail" HeaderText="PersonEmail" SortExpression="PersonEmail" />
                        <asp:BoundField DataField="PersonPhone" HeaderText="PersonPhone" SortExpression="PersonPhone" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                        <asp:BoundField DataField="JobLevel" HeaderText="JobLevel" SortExpression="JobLevel" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />

                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" 
                    SelectCommand="SELECT [FirstName], [LastName], [PersonEmail], [PersonPhone], [Gender],[JobLevel],[UserName] FROM [User]"></asp:SqlDataSource>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
<%--                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [AnimalID], [AnimalName] FROM [Animal]"></asp:SqlDataSource>
                &nbsp;<asp:Button ID="Button1" runat="server" Text="Search" class="btn btn-primary" onClick ="btn1_Search" Width="98px"/>
                <asp:TextBox ID="TextBox1" class="form-control" runat="server" Width="99px"></asp:TextBox>--%>

            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>

   <%-- <div class="modal fade" id="addAnimals" tabindex="1" role="dialog" aria-labelledby="addAnimals" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                        <h5 class="modal-title" id="addAnimalsModal">
                            Add An Animal
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Animal Name</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="AnimalNameTxt" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Type of Animal</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="AnimalTypeTxt" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Age</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="AnimalAgeTxt" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Number of Events</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="AnimalEventsTxt" runat="server" Text="0"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Number of Adults Met</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="AnimalAdultMetTxt" runat="server" Text="0"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Number of Children Met</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="AnimalChildrenMetTxt" runat="server" Text="0"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="insertAnimalButton" runat="server" onClick="addAnimalToDataBaseButton" class="btn btn-primary" Text="Insert" />
                    <asp:Button ID="exitAnimalButton" class="btn btn-secondary" OnClick="ExitButton" runat="server" Text="Button" />
                </div>
            </div>
        </div>
    </div>--%>
    <!-- /#wrapper -->

          <!-- jQuery -->
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
            $("[id*=GridView1]").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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


</asp:Content>

   
