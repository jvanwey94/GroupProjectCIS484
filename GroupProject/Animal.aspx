<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Animal.aspx.cs" Inherits="Animal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    

        <div id="page-wrapper">
            <div class="row ">
                <div class="col-lg-12">
                    <h1 class="page-header">Manage Animals</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-red">
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
                                        <li><a href="#DeleteModal" data-toggle="modal" data-target="#DeleteModal">Delete an Animal</a>
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
                        <asp:BoundField DataField="AnimalName" HeaderText="AnimalName" SortExpression="AnimalName" />
                        <asp:BoundField DataField="AnimalType" HeaderText="AnimalType" SortExpression="AnimalType" />
                        <asp:BoundField DataField="AnimalStatus" HeaderText="AnimalStatus" SortExpression="AnimalStatus" />
                        <asp:BoundField DataField="NumberOfEvents" HeaderText="NumberOfEvents" SortExpression="NumberOfEvents" />
                        <asp:BoundField DataField="NumberOfAdultsMet" HeaderText="NumberOfAdultsMet" SortExpression="NumberOfAdultsMet" />
                        <asp:BoundField DataField="NumberOfChildrenMet" HeaderText="NumberOfChildrenMet" SortExpression="NumberOfChildrenMet" />
                        <asp:BoundField DataField="TotalNumberOfPeopleMet" HeaderText="TotalNumberOfPeopleMet" SortExpression="TotalNumberOfPeopleMet" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [AnimalName], [AnimalType], [AnimalStatus], [NumberOfEvents], [NumberOfAdultsMet], [NumberOfChildrenMet], [TotalNumberOfPeopleMet] FROM [Animal]"></asp:SqlDataSource>
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
                            <div class="col-sm-3">
                                <label>Animal Name</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="AnimalNameTxt" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Type of Animal</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="AnimalTypeTxt" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="insertAnimalButton" runat="server" onClick="addAnimalToDataBaseButton" class="btn btn-primary" Text="Insert" />
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
                    <h3 class="modal-title" id="deleteModalTitle">Delete Animal</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    <span aria-hidden="true"></span>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="Label2" runat="server" Text="Choose and Animal to Delete"></asp:Label>
                            </div>
                            <div class="col-md-6">
                                <asp:DropDownList ID="DeleteDDL" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="DeleteButton" class="btn btn-primary" runat="server" Text="Delete" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Exit</button>
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

