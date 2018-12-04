<%@ Page Title="Organization" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Organization.aspx.cs" Inherits="Organization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">



    
    <style type="text/css">
        .hidden
        {
            display:none;
        }
        .panel-heading-custom {
            background: #795548 ; 
            color: #fff;
        }
        .modal-header {
            background: #795548; 
            color: #fff;
        }
        .bold
        {
            font-weight:bold;
        }

    </style>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="panel-heading panel-heading-custom">Organizations <img src="leaflet/images/notebook.png" style="width:70px; height:70px;" /></h1>
            </div>
        </div>
         <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading" style="background-color:#eeeeee">
                            Organization Information
                           <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary" style="float:right;margin-bottom:1px;height:3.5%;background: #795548;" data-toggle="modal" data-target="#addOrg"> Add Organization </button>
                                </div>
                            </div> 
                        </div>
                        <asp:Image ID="Image1" runat="server" />
                   
            
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            
                <div class="col-lg-12">
                    <div class="panel panel-default">

                        <!--Panel Heading-->
                       
                            
                           
                            <asp:GridView ID="OrgGridView" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"   OnSelectedIndexChanged="UserGridView_SelectedIndexChanged" BackColor="#EEEEEE">
                                <Columns>
                                    <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" />
                                    <asp:BoundField DataField="OrgAddress" HeaderText="Address" SortExpression="OrgAddress" /> 
                                    <asp:BoundField DataField="OrgCity" HeaderText="City" SortExpression="OrgCity" />
                                    <asp:BoundField DataField="OrgCounty" HeaderText="County" SortExpression="OrgCounty" />
                                    <asp:BoundField DataField="OrgCountry" HeaderText="Country" SortExpression="OrgCountry" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                    <asp:BoundField DataField="PrimaryContactPerson" HeaderText="Primary Contact Person" SortExpression="PrimaryContactPerson" />
                                    <asp:BoundField DataField="OrgPhone" HeaderText="Phone Number" SortExpression="OrgPhone" />
                                    <asp:BoundField DataField="OrgEmail" HeaderText="Email" SortExpression="OrgEmail" />
                                    <asp:BoundField DataField="OrganizationID" HeaderText="OrganizationID" SortExpression="OrganizationID" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                </Columns>
                                
                            </asp:GridView>
                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>"
                                   SelectCommand="select OrganizationID, OrganizationName, OrgAddress, OrgCity, OrgCounty, OrgCountry, PrimaryContactPerson, OrgPhone, OrgEmail from [WildLifeCenter].[dbo].[Organization]"></asp:SqlDataSource>
                               
                            
                       
                        </div>
                    </div>

                           
                                </div>
                            </div>
        </div>
 </div>
    </div>

    <div class="modal fade" id="EditOrganization" tabindex="1" role="dialog" aria-labelledby="EditOrganization" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                        <h5 class="modal-title" id="addOrganizationModal">
                            Edit An Organization
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <label>Organization Name</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="EditOrgName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Organization Address</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="EditOrgAddress" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>City</label>
                            </div>
                            <div class="col-sm-3">
                                
                                  <asp:DropDownList id="EditProgramCity" class="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="CityName" DataValueField="CityName" >
                                    
                                    
                                  </asp:DropDownList>
                                
                           </div>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select [CityName] from [CityInVA] order by CityName"></asp:SqlDataSource>
                          
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>County</label>
                            </div>
                            <div class="col-sm-3">
                                
                                  <asp:DropDownList id="EditCounty" class="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="CountyName" DataValueField="CountyName" >
                                    
                                    
                                  </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select [CountyName] from [CountyInVA] order by CountyName"></asp:SqlDataSource>
                           </div>
                        </div><br />
                         <div class="row">
                            <div class="col-md-3">
                                <label>Primary Contact Person</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="EditPerson" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Phone</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="EditPhone" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Email</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="EditEmail" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="insertAnimalButton" runat="server" onClick="UpdateButton_Click" class="btn btn-primary" Text="Edit Organization" />
                    <asp:Button ID="exitAnimalButton" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close" />
                </div>
            </div>
        </div>
    </div>

     <!-- Add Modal -->
    <div class="modal fade" id="addOrg" tabindex="1" role="dialog" aria-labelledby="addOrg" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                        <h3 class="modal-title" id="addOrgModal">
                            Create Organization
                        </h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <label>Organization Name</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="addOrgName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Organization Address</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="addOrgAddress" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>City</label>
                            </div>
                            <div class="col-sm-3">
                                
                                  <asp:DropDownList id="addCity" class="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="CityName" DataValueField="CityName" >
                                    
                                    
                                  </asp:DropDownList>
                                
                           </div>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select [CityName] from [CityInVA] order by CityName"></asp:SqlDataSource>
                          
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>County</label>
                            </div>
                            <div class="col-sm-3">
                                
                                  <asp:DropDownList id="addCounty" class="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="CountyName" DataValueField="CountyName" >
                                    
                                    
                                  </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select [CountyName] from [CountyInVA] order by CountyName"></asp:SqlDataSource>
                           </div>
                        </div><br />
                         <div class="row">
                            <div class="col-md-3">
                                <label>Primary Contact Person</label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="addPerson" class="form-control" runat="server"></asp:TextBox>
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
                                <asp:Label ID="secondContactLBL" runat="server" Visible="true" class="bold" Text="Secondary Contact Person"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="secondContactTXT" runat="server" Visible="true" class="form-control"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="secondPhoneLBL" runat="server" Visible="true" class="bold" Text="Secondary Contact Phone"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="secondPhoneTXT" runat="server" Visible="true" class="form-control"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="secondEmailLBL" runat="server" Visible="true" class="bold" Text="Secondary Contact Email"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="secondEmailTXT" runat="server" Visible="true" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="AddContactButton" runat="server" class="btn btn-primary" Visible="false" OnClick="addSecondaryContact" OnClientClick="refreshModal()" Text="Add Additional Contact" />
                    <asp:Button ID="Button1" runat="server" onClick="insertButton_Click" class="btn btn-primary" Text="Add Organization" />
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
            $("[id*=OrgGridView]").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                responsive: true,
                paging: true,
                lengthChange: false,
                searching: true,
                ordering: true,
                info: true,
                autoWidth: false
            });
        });
        function openModal() {
            $('[id*=EditOrganization]').modal();
        }
   
        function closeModal() {
            $('[id=AddOrganization]').modal('hide');
        }
        </script>
        <script type="text/javascript">
            function refreshModal() {
                modal.location.reload(true);
            }
        </script>

</asp:Content>

