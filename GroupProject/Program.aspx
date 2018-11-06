<%@ Page Title="Program" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Program.aspx.cs" Inherits="Program" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
   
    
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
                                        <li><a href="#addProgram" data-toggle="modal" data-target="#addProgram">Create a Program</a>
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
                            
                           
                            <asp:GridView ID="gvRegularProgram" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="OnSelectedIndexChanged" DataSourceID="SqlDataSource1">

                                <Columns>
                                    <asp:BoundField DataField="OrganizationName" HeaderText="Organization" SortExpression="OrganizationName" />
                                    <asp:BoundField DataField="ProgDate" HeaderText="Date" SortExpression="ProgDate" />
                                    <asp:BoundField DataField="ProgName" HeaderText="Program" SortExpression="ProgName" />
                                    <asp:BoundField DataField="SiteType" HeaderText="Site Type" SortExpression="SiteType" />
                                    <asp:BoundField DataField="ProgStatus" HeaderText="Status" SortExpression="ProgStatus" />
                                    <asp:BoundField DataField="ProgAddress" HeaderText="Address" SortExpression="ProgAddress" />
                                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                    <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                                    <asp:BoundField DataField="NumberOfChildren" HeaderText="Number Of Children" SortExpression="NumberOfChildren" />
                                    <asp:BoundField DataField="NumberOfAdults" HeaderText="Number Of Adults" SortExpression="NumberOfAdults" />
                                    <asp:BoundField DataField="AnimalName" HeaderText="Animal Name" SortExpression="AnimalName" />
                                </Columns>
                                
                            </asp:GridView>
                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select P.OrganizationName, P.ProgDate, R.ProgName, R.SiteType, R.ProgStatus, R.ProgAddress, R.City, R.County, P.NumberOfChildren, P.NumberOfAdults, A.AnimalName from dbo.ProgramAnimal A, dbo.Program P, dbo.RegularProgram R where P.ProgramID = R.ProgramID and A.ProgramID = P.ProgramID"></asp:SqlDataSource>
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
            <div class="col-md-6">
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
                                <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Address</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="TextBox2" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>City</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="TextBox3" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>County</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="TextBox4" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Site Type</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="TextBox5" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Program Name</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="DropDownList1" class="form-control" runat="server">
                                    <asp:ListItem>Display</asp:ListItem>
                                    <asp:ListItem>Special Request</asp:ListItem>
                                    <asp:ListItem>Open House</asp:ListItem>
                                    <asp:ListItem>Tour</asp:ListItem>
                                    <asp:ListItem>Whoo's Awake in the Night</asp:ListItem>
                                    <asp:ListItem>Wild Winter Worlds</asp:ListItem>
                                    <asp:ListItem>Home Sweet Habitat</asp:ListItem>
                                    <asp:ListItem>You Are What You Eat</asp:ListItem>
                                    <asp:ListItem>Critters Don't Need Litter</asp:ListItem>
                                    <asp:ListItem>For Goodness Snakes</asp:ListItem>
                                    <asp:ListItem>Birds Of Prey</asp:ListItem>
                                    <asp:ListItem>Treat to Release</asp:ListItem>
                                    <asp:ListItem>Classroom Visit: Owls</asp:ListItem>
                                    <asp:ListItem>Classroom Visit: Turtles</asp:ListItem>
                                    <asp:ListItem>Classroom Visit: Snakes</asp:ListItem>
                                    <asp:ListItem>Classroom Visit: Falcons</asp:ListItem>
                                    <asp:ListItem>Classroom Visit: Oppossums</asp:ListItem>
                                    <asp:ListItem>Classroom Visit: Special</asp:ListItem>
                                </asp:DropDownList>
                                    
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Status</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="TextBox7" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Date</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="TextBox8" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Animal</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="ddAnimal" class="form-control" runat="server"></asp:DropDownList>
                                <asp:SqlDataSource ID="AnimalDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="Select AnimalName from dbo.Animal"></asp:SqlDataSource>
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
                <div class="modal-header">
                        <h5 class="modal-title" id="editProgramModal">
                            Edit Program
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
                                <asp:TextBox ID="txtSiteType" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Program Name</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtProgramName" class="form-control" runat="server"></asp:TextBox>
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
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnUpdateProgram" runat="server" onClick="UpdateProgram" class="btn btn-primary" Text="Save" />
                    <asp:Button ID="btnExit" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close" />
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
<script type='text/javascript'>
        function openModal() {
            $('[id*=editProgram]').modal();
        }
    </script>
</asp:Content>

