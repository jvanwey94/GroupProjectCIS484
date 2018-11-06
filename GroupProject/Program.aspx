﻿<%@ Page Title="Program" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Program.aspx.cs" Inherits="Program" %>

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
                            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">

                        <!--Panel Heading-->
                        <div class="panel-body">
                            
                           
                            <asp:GridView ID="GridView1" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource1">

                                <Columns>
                                    <%-- %><asp:TemplateField HeaderText="Organization Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOrganizationName" Text='<%# Eval("OrganizationName") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProgDate" Text='<%# Eval("ProgDate") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProgName" Text='<%# Eval("ProgName") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Site Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSiteType" Text='<%# Eval("SiteType") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProgStatus" Text='<%# Eval("ProgStatus") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProgAddress" Text='<%# Eval("ProgAddress") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="City">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCity" Text='<%# Eval("City") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="County">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCounty" Text='<%# Eval("County") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Number of Children">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNumberOfChildren" Text='<%# Eval("NumberOfChildren") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Number of Adults">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNumberOfAdults" Text='<%# Eval("NumberOfAdults") %>' runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" />
                                    <asp:BoundField DataField="ProgDate" HeaderText="Date" SortExpression="ProgDate" />
                                    <asp:BoundField DataField="ProgName" HeaderText="Name" SortExpression="ProgName" />
                                    <asp:BoundField DataField="SiteType" HeaderText="Site Type" SortExpression="SiteType" />
                                    <asp:BoundField DataField="ProgStatus" HeaderText="Status" SortExpression="ProgStatus" />
                                    <asp:BoundField DataField="ProgAddress" HeaderText="Address" SortExpression="ProgAddress" />
                                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                    <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                                    <asp:BoundField DataField="NumberOfChildren" HeaderText="Number Of Children" SortExpression="NumberOfChildren" />
                                    <asp:BoundField DataField="NumberOfAdults" HeaderText="Number Of Adults" SortExpression="NumberOfAdults" />
                                    
                                    <asp:HyperLinkField />
                                    
                                </Columns>
                                
                            </asp:GridView>
                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select P.OrganizationName, P.ProgDate, R.ProgName, R.SiteType, R.ProgStatus, R.ProgAddress, R.City, R.County, P.NumberOfChildren, P.NumberOfAdults from dbo.Program P, dbo.RegularProgram R where P.ProgramID = R.ProgramID"></asp:SqlDataSource>
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
<%--                        <div class="row">
                            <div class="col-sm-3">
                                <label>Number of Events</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="AnimalEventsTxt" class="form-control" runat="server" Text="0"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Number of Children Met</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="AnimalChildrenMetTxt" class="form-control" runat="server" Text="0"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Number of Adults Met</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="AnimalAdultMetTxt" class="form-control" runat="server" Text="0"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Total Number of People Met</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="AnimalTotalPeopleMetTxt" class="form-control" runat="server" Text="0"></asp:TextBox>
                            </div>
                        </div>--%>
                    </div>
                </div>
                <div class="modal-footer">

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
<%--    <script type="text/javascript">
        function openModal() {
        $("[id*=GridView1]").modal('show')
    };
    </script>--%>
</asp:Content>

