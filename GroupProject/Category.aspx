<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

      <style type="text/css">
        .hidden
        {
            display:none;
        }
        .panel-heading-custom {
            background: #26a69a; 
            color: #fff;
        }
        .modal-header {
            background: #26a69a; 
            color: #fff;
        }

    </style>

        <div id="page-wrapper">
            <div class="row ">
                <div class="col-lg-12">
                    <h1 class="panel-heading panel-heading-custom">Manage Category  <img src="leaflet/images/list.png" style="width:70px; height:70px;"/></h1> 
                </div>
                <!-- /.col-lg-12 -->
            </div>
           <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            Category
                            <button type="button" class="btn btn-success" style="float:right;margin-bottom:1px;height:3.5%;background: #26a69a;  " data-toggle="modal"  data-target="#addCategory"> Add Category </button>
                             
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <asp:GridView ID="CategoryGridView" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered table-hover" OnSelectedIndexChanged="CategoryGridView_SelectedIndexChanged" DataSourceID="SqlDataSource1" RowStyle-CssClass="alert-success">
                    <Columns>
                        
                       
                        <asp:BoundField DataField="ProgramType" HeaderText="Category Type" SortExpression="ProgramType" />
                        <asp:BoundField DataField="ProgramName" HeaderText="Category Name" SortExpression="ProgramName" />
                        <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT * FROM [Category] order by ProgramType"></asp:SqlDataSource>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
             

            </div>
        </div>

      <div class="modal fade" id="addCategory" tabindex="1" role="dialog" aria-labelledby="addCategory" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                        <h5 class="modal-title" id="addAnimalsModal">
                            Add Category
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <label>Category Type</label>
                            </div>
                           <asp:DropDownList ID="addType" class="form-control" runat="server">
                                    <asp:ListItem>Live</asp:ListItem>
                                    <asp:ListItem>Online</asp:ListItem>
                                </asp:DropDownList>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Category Name</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="addCategoryName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="insertAnimalButton" runat="server" onClick="insertButton_Click" class="btn btn-primary" Text="Add Category" />
                    <asp:Button ID="exitAnimalButton" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close" />
                </div>
            </div>
        </div>
    </div>

     <div class="modal fade" id="editCategory" tabindex="1" role="dialog" aria-labelledby="editCategory" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                        <h5 class="modal-title" id="editAnimalsModal">
                            Edit Category
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <label>Category Type</label>
                            </div>
                           <asp:DropDownList ID="EditType" class="form-control" runat="server">
                                    <asp:ListItem>Live</asp:ListItem>
                                    <asp:ListItem>Online</asp:ListItem>
                                </asp:DropDownList>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Category Name</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="EditName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" runat="server" onClick="EditButton_Click" class="btn btn-primary" Text="Edit Category" />
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
            $("[id*=CategoryGridView]").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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
            $('[id*=editCategory]').modal();
        }
    </script>
    <script type="text/javascript">
        function closeModal() {
            $('[id=editCategory]').modal().hide();
        }
    </script>


</asp:Content>

