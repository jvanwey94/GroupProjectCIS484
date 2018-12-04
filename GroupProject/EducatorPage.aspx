<%@ Page Title="Educator" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="EducatorPage.aspx.cs" Inherits="EducatorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <style type="text/css">
        .hidden
        {
            display:none;
        }
        .panel-heading-custom {
            background: #9e9d24; 
            color: #fff;
        }
        .modal-header {
            background: #9e9d24; 
            color: #fff;
        }

    </style>

        <div id="page-wrapper">
            <div class="row ">
                <div class="col-lg-12">
                    <h1 class="panel-heading panel-heading-custom">Manage Educators  <img src="leaflet/images/class.png" style="width:70px; height:70px;"/></h1> 
                </div>
                <!-- /.col-lg-12 -->
            </div>
           <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            Educator
                            <button type="button" class="btn btn-success" style="float:right;margin-bottom:1px;height:3.5%;background: #9e9d24;  " data-toggle="modal"  data-target="#addEducator"> Add Educator </button>
                             
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <asp:GridView ID="EducatorGridView" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered table-hover" OnSelectedIndexChanged="EducatorGridView_SelectedIndexChanged" DataSourceID="SqlDataSource1" BackColor="#E6EE9C" ForeColor="#5D4037" DataKeyNames="EducatorID">
                    <Columns>
                        
                       
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                        <asp:BoundField DataField="eduEmail" HeaderText="eduEmail" SortExpression="eduEmail" />
                        <asp:BoundField DataField="eduPhone" HeaderText="eduPhone" SortExpression="eduPhone" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:BoundField DataField="EducatorID" HeaderText="EducatorID" ReadOnly="True" SortExpression="EducatorID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"/>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [FirstName], [LastName], [eduEmail], [eduPhone], [Status], [EducatorID] FROM [Educator]"></asp:SqlDataSource>
                            <!-- /.table-responsive -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
             

            </div>
        </div>

    <div class="modal fade" id="addEducator" tabindex="1" role="dialog" aria-labelledby="addEducator" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                        <h5 class="modal-title" id="addAnimalsModal">
                            Add Educator
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <label>First Name</label>
                            </div>
                           <div class="col-md-3">
                                <asp:TextBox ID="addFN" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Last Name</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="addLN" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Email</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="addEmail" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Phone</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="addPhone" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="insertEducatorButton" runat="server" onClick="insertButton_Click" class="btn btn-primary" Text="Add Educator" />
                    <asp:Button ID="exitEducatorButton" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close" />
                </div>
            </div>
        </div>
    </div>

     <div class="modal fade" id="editEducator" tabindex="1" role="dialog" aria-labelledby="editEducator" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                        <h5 class="modal-title" id="editAnimalsModal">
                            Edit Educator
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <div class="modal-body">
                   
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <label>First Name</label>
                            </div>
                           <div class="col-md-3">
                                <asp:TextBox ID="editFN" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Last Name</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="editLN" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Email</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="editEM" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Phone</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="editPH" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Status</label>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlStatus" class="form-control" runat="server">
                                    <asp:ListItem>Active</asp:ListItem>
                                    <asp:ListItem>Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div><br />
                    </div>
                
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" runat="server" onClick="EditButton_Click" class="btn btn-primary" Text="Edit Educator" />
                    <asp:Button ID="DeleteButton" class="btn btn-danger" runat="server" onClick="DeactivateButton_Click" Text="Deactivate Educator" />
                    <asp:Button ID="Button2" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close" />
                </div>
            </div>
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
            $("[id*=EducatorGridView]").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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
            $('[id*=editEducator]').modal();
        }
    </script>
    <script type="text/javascript">
        function closeModal() {
            $('[id=editEducator]').modal().hide();
        }
    </script>

</asp:Content>

