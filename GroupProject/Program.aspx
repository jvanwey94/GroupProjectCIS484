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
                <a class="navbar-brand" href="Home.aspx">Waynesboro Wildlife Refuge</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
      
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
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
                            <a href="events.html"><i class="fa fa-calendar-o fa-fw"></i> Events </a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-paw fa-fw"></i> Animals<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<li>
                            		<a href="manageAnimal.html">Manage Animals</a>
                            	</li>
                                <li>
                                    <a href="trackAnimal.html">Track Animals</a>
                                <li>
                            </ul>
                        </li>
                        <li>
                            <a href="reports.html"><i class="fa fa-files-o fa-fw"></i> Reports</a>
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
                <h1 class="page-header">Events</h1>
            </div>
        </div>
         <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Upcoming Events
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
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>Organization</th>
                                        <th>Address</th>
                                        <th>Date and Time</th>
                                        <th>Program</th>
                                        <th>Educators</th>
                                        <th>Birds</th>
                                        <th>Mammals</th>
                                        <th>Reptiles</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd gradeX">
                                        <td>James Madison University</td>
                                        <td>800 South Main Street Harrisonburg, VA 22801</td>
                                        <td>1/1/2018 4:00PM</td>
                                        <td>Legends</td>
                                        <td>Heath, Mary</td>
                                        <td>Eugene</td>
                                        <td></td>
                                        <td>Stevie</td>
                                    </tr>
                                      <tr class="even GradeC">
                                        <td>Harrisonburg Library</td>
                                        <td>Downtown</td>
                                        <td>1/17/2018 10:00AM</td>
                                        <td>Litter</td>
                                        <td>Heath</td>
                                        <td>Eugene, Porter</td>
                                        <td>Lucy</td>
                                        <td>Stevie</td>
                                    </tr>
                                    <tr class="odd gradeA">
                                        <td>Dylan's Birthday Party</td>
                                        <td>Small house</td>
                                        <td>2/2/2018 11:00AM </td>
                                        <td>Owls</td>
                                        <td>Bart</td>
                                        <td>Porter, Hector, Ursala</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr class="even gradeA">
                                        <td>Kappa Pi</td>
                                        <td>Madison Ballroom</td>
                                        <td>2/12/2018 12:00Pm</td>
                                        <td>Falcons</td>
                                        <td>Heath</td>
                                        <td>Eugene, Kyle</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr class="odd gradeA">
                                        <td>New and Improv'd</td>
                                        <td>Comedy House</td>
                                        <td>2/29/2018 4:00PM</td>
                                        <td>Snakes</td>
                                        <td>Mary</td>
                                        <td></td>
                                        <td></td>
                                        <td>Stevie, Mairin, Ethan</td>
                                    </tr>

                                </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Past Events
                        </div>
                        <!--Panel Heading-->
                        <div class="panel-body">
                               <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>Organization</th>
                                        <th>Address</th>
                                        <th>Date and Time</th>
                                        <th>Program</th>
                                        <th>Educators</th>
                                        <th>Birds</th>
                                        <th>Mammals</th>
                                        <th>Reptiles</th>
                                        <th>Payment Received?</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd gradeX">
                                        <td>Bridgett's Sweet Sixteen</td>
                                        <td>PaddleRidge Country Club</td>
                                        <td>11/17/2017 8:00PM</td>
                                        <td>For Goodness Snakes</td>
                                        <td>Heath</td>
                                        <td></td>
                                        <td></td>
                                        <td>Stevie, Mairin, Ethan</td>
                                        <td>Yes ($280)</td>
                                    </tr>
                                    <tr class="even GradeC">
                                        <td>Stonewall Elementary School</td>
                                        <td>Downtown Harrisonburg</td>
                                        <td>10/15/2017 10:00AM</td>
                                        <td>Special Request</td>
                                        <td>Mary</td>
                                        <td>Porter, Hector</td>
                                        <td>Lucy</td>
                                        <td>Ethan</td>
                                        <td>No (waiting)</td>
                                    </tr>
                                    <tr class="odd gradeA">
                                        <td>Beethoven High School</td>
                                        <td>Outside Downtown Harrisonburg</td>
                                        <td>10/10/2017 11:00AM</td>
                                        <td>Birds of Prey</td>
                                        <td>Heath</td>
                                        <td>Eugene, Kyle, Ursala</td>
                                        <td></td>
                                        <td></td>
                                        <td>Yes ($150)</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%--    <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Past Events
                        </div>
                        <!--Panel Heading-->
                        <div class="panel-body">
                            <asp:GridView ID="GridView1" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="AnimalID" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="AnimalID" HeaderText="AnimalID" InsertVisible="False" ReadOnly="True" SortExpression="AnimalID" />
                                    <asp:BoundField DataField="AnimalType" HeaderText="AnimalType" SortExpression="AnimalType" />
                                    <asp:BoundField DataField="AnimalName" HeaderText="AnimalName" SortExpression="AnimalName" />
                                    <asp:BoundField DataField="AnimalStatus" HeaderText="AnimalStatus" SortExpression="AnimalStatus" />
                                    <asp:BoundField DataField="NumberOfEvents" HeaderText="NumberOfEvents" SortExpression="NumberOfEvents" />
                                    <asp:BoundField DataField="NumberOfPeopleMet" HeaderText="NumberOfPeopleMet" SortExpression="NumberOfPeopleMet" />
                                </Columns>
                            </asp:GridView>
                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT * FROM [Animal]"></asp:SqlDataSource>
                               <%--<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">--%>
                                
                           
                        </div>
                    </div>
                </div>
            </div>--%>
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
            <div class="col-md-6">
                <asp:Button ID="Button1" runat="server" class="btn btn-primary" onClick="Button1_Click" Text="Add to Database" />
                <asp:Button ID="Button2" runat="server" class="btn btn-secondary" formNoValidate="formNoValidate" onClick="Button2_Click" Text="Exit" /><br />
                <asp:Label ID="Label18" runat="server" Text=""></asp:Label>    
            </div>
            
        </div>
    </div>--%>
</asp:Content>

