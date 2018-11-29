<%@ Page Title="Program" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Program.aspx.cs" Inherits="Program" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <style type="text/css">
        .hidden
        {
            display:none;
        }
        .panel-heading-custom {
            background: #428bca; 
            color: #fff;
        }
        .modal-header {
            background: #428bca; 
            color: #fff;
        }
        #modalcloser {
            display:none;
        }
    </style>
   <script >
    function filterFunction() {
    var input, filter, ul, li, a, i;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    div = document.getElementById("myDropdown");
    a = div.getElementsByTagName("a");
    for (i = 0; i < a.length; i++) {
        if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
            a[i].style.display = "";
        } else {
            a[i].style.display = "none";
        }
    }
}
  </script>  
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="panel-heading panel-heading-custom">Programs <i class="fa fa-calendar icon"></i></h1>
            </div>
        </div>
         <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <asp:DropDownList ID="ddlProgram" AutoPostBack="true" OnSelectedIndexChanged="ddl_SelectedIndexChanged" runat="server">
                                <asp:ListItem Value="Program.aspx">Live Program</asp:ListItem>
                                <asp:ListItem Value="OnlineProgram.aspx">Online Program</asp:ListItem>
                            </asp:DropDownList>
                             <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary" style="float:right;margin-bottom:1px;height:3.5%" data-toggle="modal" data-target="#addProgram"> Add Program </button>
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
                            
                           
                            <asp:GridView ID="gvRegularProgram" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="OnSelectedIndexChanged" DataSourceID="SqlDataSource1" RowStyle-CssClass="alert-info" RowStyle-ForeColor="#1259A9">

                                <Columns>
                                    <asp:BoundField DataField="OrganizationName" HeaderText="Organization" SortExpression="OrganizationName" />
                                    <asp:BoundField DataField="ProgDate" HeaderText="Date" SortExpression="ProgDate" dataformatstring="{0:MM/d/yyyy}" /> 
                                     <asp:BoundField DataField="ProgTime" HeaderText="Program Time" SortExpression="Time" />
                                    <asp:BoundField DataField="ProgName" HeaderText="Program" SortExpression="ProgName" />
                                    <asp:BoundField DataField="SiteType" HeaderText="Site Type" SortExpression="SiteType" />
                                    <asp:BoundField DataField="ProgStatus" HeaderText="Status" SortExpression="ProgStatus" />
                                    <asp:BoundField DataField="ProgAddress" HeaderText="Address" SortExpression="ProgAddress" />
                                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                                    <asp:BoundField DataField="County" HeaderText="County" SortExpression="County" />
                                    <asp:BoundField DataField="NumberOfChildren" HeaderText="Number Of Children" SortExpression="NumberOfChildren" />
                                    <asp:BoundField DataField="NumberOfAdults" HeaderText="Number Of Adults" SortExpression="NumberOfAdults" />
                                    <asp:BoundField DataField="AnimalName" HeaderText="Animal Name" SortExpression="AnimalName" />
                                    <asp:BoundField DataField="EducatorName" HeaderText="Educator Name" SortExpression="EducatorName" />
                                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" />
                                    <asp:BoundField DataField="ProgStatus1" HeaderText="Program Status" SortExpression="ProgStatus1" />
                                    <asp:BoundField DataField="ProgramID" HeaderText="ProgramID" SortExpression="ProgramID" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                    <asp:BoundField DataField="AnimalID" HeaderText="AnimalID" SortExpression="AnimalID" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                    <asp:BoundField DataField="EducatorID" HeaderText="EducatorID" SortExpression="EducatorID" HeaderStyle-CssClass="hidden" ItemStyle-CssClass="hidden" />
                                </Columns>
                                
                            </asp:GridView>
                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" 
                                   SelectCommand="select P.Comments, E.EducatorName, P.OrganizationName, P.ProgDate, P.ProgTime, R.ProgName, R.SiteType, R.ProgStatus, R.ProgAddress, R.City, R.County, P.NumberOfChildren, P.NumberOfAdults, A.AnimalName, P.ProgramID, A.AnimalID, E.EducatorID, P.ProgStatus from dbo.ProgramAnimal A, dbo.Program P, dbo.RegularProgram R, dbo.EducatorProgram E where P.ProgramID = R.ProgramID and A.ProgramID = P.ProgramID and E.ProgramID=P.ProgramID "></asp:SqlDataSource>
                               <%--<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">--%> <%-- and P.ProgStatus = 'Active'--%>
                            
                        </div>
                    </div>
                </div>

                               <%--<asp:DropDownList ID="DropDownEducator" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="EducatorID"></asp:DropDownList>              --%>

                                <%--<asp:
                                    List ID="CheckBoxList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="AnimalName" DataValueField="AnimalID">
                                </asp:CheckBoxList>--%>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [AnimalID], [AnimalName] FROM [Animal] where AnimalStatus = 'Active'"></asp:SqlDataSource>

            </div>
                            <%--<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Column1" DataValueField="EducatorID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [EducatorID], [FirstName] + ' ' + [LastName] FROM [Educator]"></asp:SqlDataSource>--%>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            </div>

        

    <div class="modal fade" id="addProgram" tabindex="1" role="dialog" aria-labelledby="addProgram" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                        <h3 class="modal-title" id="addProgramModal">
                            Create Program
                        </h3>
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
                                <asp:TextBox ID="txtAddOrg" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Address</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtAddOrgAddr" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>City</label>
                            </div>
                            <div class="col-sm-3">
                                
                                  <asp:DropDownList id="cityDropdownCreate" class="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="CityName" DataValueField="CityName" >
                                    
                                    
                                  </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select [CityName] from [CityInVA] order by CityName"></asp:SqlDataSource>
                           </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>County</label>
                            </div>
                            <div class="col-sm-3">
                                
                                  <asp:DropDownList id="CountydropdownCreate" class="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="CountyName" DataValueField="CountyName" >
                                    
                                    
                                  </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select [CountyName] from [CountyInVA] order by CountyName"></asp:SqlDataSource>
                           </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Site Type</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="DropDownSite" class="form-control" runat="server">
                                    <asp:ListItem>Onsite</asp:ListItem>
                                    <asp:ListItem>Offsite</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Program Name</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="DropDownProgram" AppendDataBoundItems="true" class="form-control" runat="server">
                                    <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
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
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Program Address</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtAddProgAddress" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>City</label>
                            </div>
                            <div class="col-sm-3">
                                
                                  <asp:DropDownList id="DropDownList2" class="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="CityName" DataValueField="CityName" >
                                    
                                    
                                  </asp:DropDownList>
                                
                           </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>County</label>
                            </div>
                            <div class="col-sm-3">
                                
                                  <asp:DropDownList id="DropDownList3" class="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="CountyName" DataValueField="CountyName" >
                                    
                                    
                                  </asp:DropDownList>
                                
                           </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Number Of Children</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtAddChildren" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Number Of Adults</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtAddAdults" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Status</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:CheckBox ID="CheckBoxStatus" Text="Completed" runat="server" />
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Date</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtAddDate" type="date" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Time</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtAddTime" placeholder="00:00:00" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Payment Status</label>
                            </div>
                            <div class="col-sm-3">
                               <asp:DropDownList ID="txtPaymentStatus" class="form-control" runat="server">
                                    <asp:ListItem>Complete</asp:ListItem>
                                    <asp:ListItem>Incomplete</asp:ListItem>
                             
                                </asp:DropDownList>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Animal</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="250px" Width="250px" >
                                <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="AnimalName" DataValueField="AnimalID" ></asp:CheckBoxList>
                            </asp:Panel>
                            
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Educator</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:Panel ID="Panel3" runat="server" ScrollBars="Auto" Height="250px" Width="250px" >
                                     <asp:CheckBoxList ID="CheckBoxList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="EducatorID" ></asp:CheckBoxList>
                             <%--   <asp:DropDownList ID="DropDownEducator" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="EducatorID"></asp:DropDownList>              --%>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [FirstName], [EducatorID] FROM [Educator]"></asp:SqlDataSource>
                                     </asp:Panel>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Comments:</label>
                            </div>
                             <div class="col-sm-3">
                                <asp:TextBox ID="txtComments" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnCreateProgram" runat="server" onClick="CreateProgram" class="btn btn-primary" Text="Add Program" />
                    
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"  aria-label="Close">Close</button>
                   
                </div>
            </div>
        </div>
    </div>

        <div class="modal fade" id="editProgram" tabindex="-1" role="dialog" aria-labelledby="editProgram" aria-hidden="true" >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                        <h3 class="modal-title" id="editProgramModal">
                            Edit Program
                        </h3>
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
                                <asp:TextBox ID="EditOrganizationName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Address</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="EditAddress" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>City</label>
                            </div>
                            <div class="col-sm-3">
                                
                                  <asp:DropDownList id="EditCity" class="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="CityName" DataValueField="CityName" >
                                    
                                    
                                  </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select [CityName] from [CityInVA] order by CityName"></asp:SqlDataSource>
                           </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>County</label>
                            </div>
                            <div class="col-sm-3">
                                
                                  <asp:DropDownList id="EditCounty" class="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="CountyName" DataValueField="CountyName" >
                                    
                                    
                                  </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select [CountyName] from [CountyInVA] order by CountyName"></asp:SqlDataSource>
                           </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Site Type</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="EditSiteType" class="form-control" runat="server">
                                    <asp:ListItem>Onsite</asp:ListItem>
                                    <asp:ListItem>Offsite</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Program Name</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="EditProgramName" class="form-control" runat="server">
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
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Program Address</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="EditProgramAddres" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>City</label>
                            </div>
                            <div class="col-sm-3">
                                
                                  <asp:DropDownList id="EditProgramCity" class="form-control" runat="server" DataSourceID="SqlDataSource4" DataTextField="CityName" DataValueField="CityName" >
                                    
                                    
                                  </asp:DropDownList>
                                
                           </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>County</label>
                            </div>
                            <div class="col-sm-3">
                                
                                  <asp:DropDownList id="EditProgramCounty" class="form-control" runat="server" DataSourceID="SqlDataSource5" DataTextField="CountyName" DataValueField="CountyName" >
                                    
                                    
                                  </asp:DropDownList>
                                
                           </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Number Of Children</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="EditNBchildren" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Number Of Adults</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="EditNBAdults" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Status</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:CheckBox ID="EditStatus" Text="Completed" runat="server" />
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Date</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="EditDate" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Time</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="EditTime" placeholder="00:00:00" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Payment Status</label>
                            </div>
                            <div class="col-sm-3">
                               <asp:DropDownList ID="EditPaymentSatus" class="form-control" runat="server">
                                    <asp:ListItem>Complete</asp:ListItem>
                                    <asp:ListItem>Incomplete</asp:ListItem>
                             
                                </asp:DropDownList>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Animal</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" Height="250px" Width="250px" >
                                <asp:CheckBoxList ID="EditAnimal" runat="server" DataSourceID="SqlDataSource3" DataTextField="AnimalName" DataValueField="AnimalID" ></asp:CheckBoxList>
                            </asp:Panel>
                            
                            </div>
                        </div><br />
                        <div class="row">
                           <%-- <div class="col-sm-3">
                                <label>Educator</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="EditEducator" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="EducatorID"></asp:DropDownList>              
                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [FirstName], [EducatorID] FROM [Educator]"></asp:SqlDataSource>
                            </div>--%>
                            <div class="col-sm-3">
                                <label>Educator</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:Panel ID="Panel4" runat="server" ScrollBars="Auto" Height="250px" Width="250px" >
                                     <asp:CheckBoxList ID="CheckBoxList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="EducatorID" ></asp:CheckBoxList>
                             <%--   <asp:DropDownList ID="DropDownEducator" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="EducatorID"></asp:DropDownList>              --%>
                                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [FirstName], [EducatorID] FROM [Educator]"></asp:SqlDataSource>
                                     </asp:Panel>
                            </div>
                        </div><br />
                        <div class="row">
                            <div class="col-sm-3">
                                <label>Comments:</label>
                            </div>
                             <div class="col-sm-3">
                                <asp:TextBox ID="EditComment" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div><br />
                        <a id="modalcloser" class="custom-close"></a>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnUpdateProgram" runat="server" onClick="UpdateProgram" class="btn btn-primary" Text="Update Program" />
                    <asp:Button ID="btnDeletProgram" class="btn btn-danger" runat="server" onClick="DeleteProgram" Text="Deactivate Program" />
                    <asp:Button ID="btnExit" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close" />
                    
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div class="modal fade" id="DeleteModal" tabindex="-1" data-toggle="modal" data-target="#DeleteModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="DeleteModalTitle">Deactivate a Progam</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
                    <<asp:Button ID="DeleteProgramBTN" class="btn btn-primary" runat="server" Text="Deactivate Program" />
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
    <script type="text/javascript">
        function closeModal() {
            $('#editProgram').modal('hide');
            $('#editProgram').modal({
                backdrop: false
            });
        }
    </script>
    <script type="text/javascript">
        function modalScreenClose() {
            $('.modal-backdrop').remove();
        }
    </script>
    <script type="text/javascript">
        $(function () {
            $(".custom-close").on('click',
                function () {
                    $('#editProgam').modal('hide');
                });
        });
    </script>
</asp:Content>

