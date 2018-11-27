<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="panel-heading panel-heading-custom">Users <i class="fa fa-user icon"></i></h1>
            </div>
        </div>
         <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            User Information
                             <div class="pull-right">
                                
                            
                        </div>
                        </div>
                   
            
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">

                        <!--Panel Heading-->
                        <div class="panel-body">
                            
                           
                            <asp:GridView ID="UserGridView" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" RowStyle-CssClass="alert-info"  OnSelectedIndexChanged="UserGridView_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" /> 
                                    <asp:BoundField DataField="PersonEmail" HeaderText="Email" SortExpression="PersonEmail" />
                                    <asp:BoundField DataField="PersonPhone" HeaderText="Phone Number" SortExpression="PersonPhone" />
                                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                    <asp:BoundField DataField="JobLevel" HeaderText="Job Level" SortExpression="JobLevel" />
                                    <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
                                    <asp:BoundField DataField="Permission" HeaderText="Permission" SortExpression="Permission" />
                                    <asp:TemplateField HeaderText="Grant Permission?" SortExpression="[Permission]" >
                                        <ItemTemplate>
                                                <asp:Button ID="PermissionButton" OnClick="PermissionButton_Click" runat="server" Text='<%# Bind("[Permission]") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                </Columns>
                                
                            </asp:GridView>
                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select UserID, FirstName, LastName, PersonEmail, PersonPhone, Gender, JobLevel, UserName, Permission from [WildLifeCenter].[dbo].[User]"></asp:SqlDataSource>
                               
                            
                        </div>
                        </div>
                    </div>

                            </div>
                                </div>
                            </div>
        </div>
 </div>
    </div>

    <div class="modal fade" id="editUser" tabindex="1" role="dialog" aria-labelledby="editUser" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                        <h5 class="modal-title" id="editUserModel">
                            Edit User
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
                                <asp:TextBox ID="txtFirstName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Last Name</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtLastName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Permission</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txtPermission" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="editUserButton" runat="server" class="btn btn-primary" Text="Add Animal" />
                    <asp:Button ID="exitAnimalButton" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close" />
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
       

    <script type="text/javascript">
        $(function () {
            $("[id*=UserGridView]").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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
            $('[id*=editUser]').modal();
        }
    </script>
    <script type="text/javascript">
        function closeModal() {
            $('[id=editUser]').modal().closeModal();
        }
    </script>

</asp:Content>

