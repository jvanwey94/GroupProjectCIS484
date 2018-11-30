<%@ Page Title="Manage Animal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Animal.aspx.cs" Inherits="Animal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <style type="text/css">
        .hidden
        {
            display:none;
        }
        .panel-heading-custom {
            background: #43a047; 
            color: #fff;
        }
        .modal-header {
            background: #43a047; 
            color: #fff;
        }

    </style>

        <div id="page-wrapper">
            <div class="row ">
                <div class="col-lg-12">
                    <h1 class="panel-heading panel-heading-custom">Manage Animals <img src="leaflet/images/icon.png" style="width:50px; height: 50px;"/> </h1> 
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            Animals
                            <button type="button" class="btn btn-success" style="float:right;margin-bottom:1px;height:3.5%" data-toggle="modal" data-target="#addAnimals"> Add Animal </button>
                             
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered table-hover" OnSelectedIndexChanged="OnSelectedIndexChanged" DataSourceID="SqlDataSource1" RowStyle-CssClass="alert-success">
                    <Columns>
                        <asp:BoundField DataField="AnimalName" HeaderText="Name" SortExpression="AnimalName" />
                        <asp:BoundField DataField="AnimalType" HeaderText="Type" SortExpression="AnimalType" />
                        <asp:BoundField DataField="AnimalStatus" HeaderText="Status" SortExpression="AnimalStatus" />
                        <asp:BoundField DataField="NumberOfEvents" HeaderText="Number of Events" SortExpression="NumberOfEvents" />
                        <asp:BoundField DataField="NumberOfAdultsMet" HeaderText="Number of Adults Met" SortExpression="NumberOfAdultsMet" />
                        <asp:BoundField DataField="NumberOfChildrenMet" HeaderText="Number of Children Met" SortExpression="NumberOfChildrenMet" />
                        <asp:BoundField DataField="TotalNumberOfPeopleMet" HeaderText="Total Number of People Met" SortExpression="TotalNumberOfPeopleMet" />
                        <asp:BoundField DataField="AnimalID" HeaderText="AnimalID" SortExpression="AnimalID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [AnimalName], [AnimalType], [AnimalStatus], [NumberOfEvents], [NumberOfAdultsMet], [NumberOfChildrenMet], [TotalNumberOfPeopleMet], [AnimalID] FROM [Animal]"></asp:SqlDataSource>
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
                            <div class="col-md-3">
                                <label>Animal Name</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AnimalNameTxt" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Type of Animal</label>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="AddAnimalStatusDDL" class="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div><br />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="insertAnimalButton" runat="server" onClick="addAnimalToDataBaseButton" class="btn btn-primary" Text="Add Animal" />
                    <asp:Button ID="exitAnimalButton" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close" />
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="DeleteModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="deleteModalTitle">Deactivate Animal</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    <span aria-hidden="true"></span>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="Label2" runat="server" Text="Choose an Animal to Deactivate"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="DeleteDDL" class="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="DeleteButton" class="btn btn-primary" runat="server" onClick="DeleteButton_Click" Text="Deactivate Animal" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="EditModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="editModalTitle">Edit Animal</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    <span aria-hidden="true"></span>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="AnimalTypeEditLBL" runat="server" Text="Animal Type"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="AnimalTypeDDL" class="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="AnimalNameEditLBL" runat="server" Text="Animal Name"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AnimalNameEditTXT" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="AnimalStatusLBL" runat="server" Text="Animal Status"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="AnimalStatusDDL" class="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="AnimalEventsLBL" runat="server" Text="Number of Events"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AnimalEditEventsTXT" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="AnimalAdultsMetLBL" runat="server" Text="Number of Adults Met"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AnimalAdultsMetTXT" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="AnimalKidsMetLBL" runat="server" Text="Number of Children Met"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="AnimalKidsMetTXT" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="UpdateButton" runat="server" class="btn btn-primary" onClick="UpdateAnimal" Text="Update Animal" />
                    <asp:Button ID="DeleteButtonModal" runat="server" class="btn btn-danger" onClick="DeleteAnimal" Text="Deactivate Animal" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

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
<script type='text/javascript'>
        function openModal() {
            $('[id*=EditModal]').modal();
        }
    </script>
    <script type="text/javascript">
        function closeModal() {
            $('[id=EditModal]').modal().hide();
        }
    </script>

  
</asp:Content>

