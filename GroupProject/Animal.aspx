<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Animal.aspx.cs" Inherits="Animal" %>

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
                            <a href="Program.aspx"><i class="fa fa-calendar-o fa-fw"></i> Events </a>
                        </li>
                        <li>
                            <a href="Animal.aspx"><i class="fa fa-paw fa-fw"></i> Animals<span class="fa arrow"></span></a>
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
                    <h1 class="page-header">Manage Animals</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Animals
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
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Kind of Animal</th>
                                        <th>Specific Kind of Animal</th>
                              <%--          <th>Age</th>--%>
                                        <th class="col-lg-1">Available for an Event?</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd gradeX">
                                        <td>Eugene</td>
                                        <td>Bird</td>
                                        <td>Falcon</td>
                                        <%--<td>2</td>--%>
                                        <td><i class="fa  fa-check"></i></td>
                                    </tr>
                                      <tr class="even GradeC">
                                        <td>Kyle</td>
                                        <td>Bird</td>
                                        <td>Falcon</td>
                                  <%--      <td>1</td>--%>
                                        <td><i class="fa  fa-check"></i></td>
                                    </tr>
                                    <tr class="odd gradeA">
                                        <td>Porter</td>
                                        <td>Bird</td>
                                        <td>Owl</td>
                                      <%--  <td>4</td>--%>
                                        <td><i class="fa fa-times"></i></td>
                                    </tr>
                                    <tr class="even gradeA">
                                        <td style="height: 39px">Hector</td>
                                        <td style="height: 39px">Bird</td>
                                        <td style="height: 39px">Owl</td>
                           <%--             <td>5</td>--%>
                                        <td style="height: 39px"><i class="fa fa-check"></i></td>
                                    </tr>
                                    <tr class="odd gradeA">
                                        <td>Ursala</td>
                                        <td>Bird</td>
                                        <td>Owl</td>
                                     <%--   <td>2</td>--%>
                                        <td><i class="fa fa-times"></i></td>
                                    </tr>
                                    <tr class="even gradaA">
                                        <td>Lucy</td>
                                        <td>Mammal</td>
                                        <td>Oppossum</td>
                               <%--         <td>3</td>--%>
                                        <td><i class="fa fa-times"></i></td>
                                    </tr>
                                    <tr class="odd gradeA">
                                        <td>Stevie</td>
                                        <td>Reptile</td>
                                        <td>Snake</td>
                                <%--        <td>4</td>--%>
                                        <td><i class="fa fa-times"></i></td>
                                    </tr>
                                    <tr class="even gradeA">
                                        <td>Mairin</td>
                                        <td>Reptile</td>
                                        <td>Snake</td>
                                  <%--      <td>2</td>--%>
                                        <td><i class="fa fa-check"></i></td>
                                    </tr>
                                    <tr class="odd gradeA">
                                        <td>Ethan</td>
                                        <td>Reptile</td>
                                        <td>Snake</td>
<%--                                        <td>1</td>--%>
                                        <td><i class="fa fa-check"></i></td>
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [AnimalID], [AnimalName] FROM [Animal]"></asp:SqlDataSource>
                &nbsp;<asp:Button ID="Button1" runat="server" Text="Search" class="btn btn-primary" onClick ="btn1_Search" Width="98px"/>
                <asp:TextBox ID="TextBox1" class="form-control" runat="server" Width="99px"></asp:TextBox>
                &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered table-hover" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="AnimalType" HeaderText="AnimalType" SortExpression="AnimalType" />
                        <asp:BoundField DataField="AnimalName" HeaderText="AnimalName" SortExpression="AnimalName" />
                        <asp:BoundField DataField="AnimalStatus" HeaderText="AnimalStatus" SortExpression="AnimalStatus" />
                        <asp:BoundField DataField="NumberOfEvents" HeaderText="NumberOfEvents" SortExpression="NumberOfEvents" />
                        <asp:BoundField DataField="NumberOfPeopleMet" HeaderText="NumberOfPeopleMet" SortExpression="NumberOfPeopleMet" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [AnimalType], [AnimalName], [AnimalStatus], [NumberOfEvents], [NumberOfPeopleMet] FROM [Animal]"></asp:SqlDataSource>
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>

    <div class="modal fade" id="addAnimals" tabindex="1" role="dialog" aria-labelledby="addAnimals" aria-hidden="true">
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
                                <label>Number of People Met</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="AnimalPeopleMetTxt" runat="server" Text="0"></asp:TextBox>
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
    </div>
    <!-- /#wrapper -->

          <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="../vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>

    <%--<p>
        <br />
        <asp:Label ID="lblTitle" runat="server" Text="Animal" Font-Size="XX-Large" ></asp:Label><br />
        
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Text="Name: "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" required="required"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label3" runat="server" Text="Animal Type: "></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" required="required"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label4" runat="server" Text="Status: "></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" required="required" Width="97px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label7" runat="server" Text="Last Updated By: "></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server" required="required"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label8" runat="server" Text="Last Updated: "></asp:Label>
        <asp:TextBox ID="TextBox7" runat="server" required="required"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Button2" runat="server" Text="Search" formNoValidate="formNoValidate" OnClick="clickSearchButton"/>
&nbsp;<asp:TextBox ID="searchBox" runat="server"></asp:TextBox>
    </p>
    
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit"   
  
OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">  
            <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" ToolTip="Edit" formNoValidate="FormNoValidate"/>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" ToolTip="Cancel" formNoValidate="FormNoValidate"/>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                <asp:TemplateField HeaderText="ID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("animalID") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  

                <asp:TemplateField HeaderText="Name">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("animalName") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("animalName") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                <asp:TemplateField HeaderText="Type">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Type" runat="server" Text='<%#Eval("animalType") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Type" runat="server" Text='<%#Eval("animalType") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                <asp:TemplateField HeaderText="Status">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_sex" runat="server" Text='<%#Eval("animalStatus") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_sex" runat="server" Text='<%#Eval("animalStatus") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                 <asp:TemplateField HeaderText="Last Updated By">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_weight" runat="server" Text='<%#Eval("lastUpdatedBy") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_weight" runat="server" Text='<%#Eval("lastUpdatedBy") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

               <asp:TemplateField HeaderText="Last Updated">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_height" runat="server" Text='<%#Eval("lastUpdated") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_height" runat="server" Text='<%#Eval("lastUpdated") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

            



            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
 
        </asp:GridView>  
       
    <br />
    

    <p>
        <asp:Button ID="insertBtn" runat="server" Text="Insert" formNoValidate="formNoValidate" OnClick="clickInsertButton" />
    &nbsp;<asp:Button ID="viewBtn" runat="server" Text="View" formNoValidate="formNoValidate" OnClick="clickViewButton"/>
    &nbsp;&nbsp;</p>
    <p>
        &nbsp;</p>--%>
</asp:Content>
