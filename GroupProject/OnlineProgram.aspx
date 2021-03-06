<%@ Page Title="Online Programs" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="OnlineProgram.aspx.cs" Inherits="OnlineProgram" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <style type="text/css">
        .hidden
        {
            display:none;
        }
        .panel-heading-custom{
            background:#428bca;
            color: #fff;
        }
        .modal-header{
            background: #428bca;
            color: #fff;
        }
        .modal-body {
            padding: 20px;
        }
        .panel > .panel-heading {
            background-color: #388be9;
        }
    </style>

        <div id="page-wrapper">
         <div class="row">
            <div class="col-lg-12">
                <h1 class="panel-heading panel-heading-custom">Online Programs <i class="fa fa-wifi icon"></i></h1>
            </div>
        </div>
         <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <asp:DropDownList ID="ddlProgram" AutoPostBack="true" OnSelectedIndexChanged="ddl_SelectedIndexChanged" runat="server">
                                <asp:ListItem Value="OnlineProgram.aspx">Online Program</asp:ListItem>
                                <asp:ListItem Value="Program.aspx">Live Program</asp:ListItem>
                            </asp:DropDownList>
                             <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary" style="float:right;margin-bottom:1px;height:3.5%" data-toggle="modal" data-target="#addOnlineProgram"> Add Online Program </button>
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
            <asp:GridView ID="GridViewOnlineProgram" class="table table-striped table-bordered table-hover" runat="server" OnSelectedIndexChanged="OnSelectedIndexChanged" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EditRowStyle-CssClass="alert-warning" SelectedRowStyle-CssClass="alert-warning" RowStyle-BorderStyle="NotSet" BackColor="#BBD3ED" ForeColor="#2E456D">
                <Columns>
                    <asp:BoundField DataField="ProgramName" HeaderText="Program" SortExpression="ProgramName" />
                    <asp:BoundField DataField="OrganizationName" HeaderText="Organization" SortExpression="OrganizationName" />
                    <asp:BoundField DataField="ProgDate" HeaderText="Date" SortExpression="ProgDate" dataformatstring="{0:MM/d/yyyy}"/>
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Theme" HeaderText="Theme" SortExpression="Theme" />
                    <asp:BoundField DataField="NumberOfChildren" HeaderText="Number of Children" SortExpression="NumberOfChildren" />
                    <asp:BoundField DataField="NumberOfAdults" HeaderText="Number of Adults" SortExpression="NumberOfAdults" />
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" />
                    <asp:BoundField DataField="ProgStatus" HeaderText="Program Status" SortExpression="Program Status" />
                    <asp:BoundField DataField="ProgramID" HeaderText="ProgramID" SortExpression="ProgramID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden"/>
                </Columns>
            </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="
                        <%$ ConnectionStrings:AWSConnection %>" SelectCommand="select P.Comments, P.ProgramName, P.OrganizationName, P.ProgDate, O.Type, O.Country, O.State, O.Grade, O.Email, O.Theme, P.NumberOfChildren, P.NumberOfAdults, P.ProgStatus, O.ProgramID from dbo.OnlineProgram O, dbo.Program P where O.ProgramID = P.ProgramID"></asp:SqlDataSource>
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
       
            <br />

        <div class="modal fade" id="addOnlineProgram" tabindex="1" role="dialog" aria-labelledby="addOnlineProgram" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addOnlineProgramModal">
                            Create OnlineProgram
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lblOrganizationName" runat="server" Text="Organization Name: "></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtOrganizationName" class="form-control" required="required" runat="server" ></asp:TextBox><br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lblProgramName" runat="server" Text="Program Name: "></asp:Label>
                                </div>
                                <div class="col-md-3">
                                  <asp:DropDownList id="DropDownOnline2" class="form-control" runat="server" DataSourceID="SqlDataSource8" DataTextField="ProgramName" DataValueField="ProgramName" >
                                 </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select ProgramName from Category where ProgramType='Online'"></asp:SqlDataSource>
                           </div>
                            </div><br />
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lblDate" runat="server" Text="Date: "></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtDate" type="Date" class="form-control" runat="server"></asp:TextBox>
                                    <br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lblType" runat="server" Text="Type: "></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtType" class="form-control" required="required" runat="server"></asp:TextBox><br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lblState" runat="server" Text="State: "></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtState" class="form-control" required="required" runat="server"></asp:TextBox><br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lblCountry" runat="server" Text="Country: "></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtCountry" class="form-control" required="required" runat="server"></asp:TextBox><br />
                                </div>
                            </div>
                            <div class="row"> <%--required="required"--%>
                                <div class="col-md-3">
                                    <asp:Label ID="lblNK" runat="server" Text="Number of Kids: "></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtNK" class="form-control" runat="server"></asp:TextBox><br />
                                </div>
                            </div>
                            <div class="row"><%--required="required" --%>
                                <div class="col-md-3">
                                    <asp:Label ID="lblNA" runat="server" Text="Number of Adults: "></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtNumberOFAdults" class="form-control" runat="server"></asp:TextBox><br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="Label7" runat="server" Text="Grade Level: "></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server"></asp:DropDownList><br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lblTeacherName" runat="server" Text="Teacher Name: "></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtTeacherName" class="form-control" required="required" runat="server"></asp:TextBox><br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox><br />
                                </div>
                            </div>
                            <div class="row"> <%--required="required" --%>
                                <div class="col-md-3">
                                    <asp:Label ID="lblTeacher" runat="server" Text="Educator: "></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtTeacher" class="form-control" runat="server"></asp:TextBox><br />
                                </div>
                            </div>
                            <div class="row"><%--required="required" --%>
                                <div class="col-md-3">
                                    <asp:Label ID="lblTheme" runat="server" Text="Theme: "></asp:Label>
                                </div>
                                <div class="col-md-3">
                                    <asp:TextBox ID="txtTheme" class="form-control" runat="server"></asp:TextBox><br />
                                </div>
                            </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="lblAnimalUsed" runat="server" Text="Animals Used: "></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="250px" Width="250px" >
                                        <asp:CheckBoxList ID="CheckBoxList1" class="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="AnimalName" DataValueField="AnimalID" ></asp:CheckBoxList>
                                        </asp:Panel>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [AnimalName], [AnimalID], [AnimalType] FROM [Animal] where AnimalStatus = 'Active'"></asp:SqlDataSource>
                                    </div>
                                </div><br />
                                <div class="row">
                                    <div class="col-sm-3">
                                        <label>Comments:</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txtComments" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="ProgStatusLBL" runat="server" Text="Program Status"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Complete"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                <br />
                <div class="modal-footer">
                    <asp:Button ID="btnCreateProgram" runat="server" onClick="CreateProgram" class="btn btn-primary" Text="Add Online Program" />
                    <asp:Button ID="btnClose" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close" />
                </div>
            </div>
        </div>
    </div>

    <!--EDIT/DELETE MODAL-->
            <div class="modal fade" id="editdeletemodal" tabindex="-1" role="dialog" aria-labelledby="editdeletemodal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="OPtitle"> Edit Online Program </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="lblProgName" runat="server" Text="Program Name"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="DropDownOnline" class="form-control" runat="server" DataSourceID="SqlDataSource8" DataTextField="ProgramName" DataValueField="ProgramName" >
                                            
                                        </asp:DropDownList>
                                    </div>
                                </div><br />
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="OrgNameLBL" runat="server" Text="Organization Name"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="OrgNameTXT" class="form-control" runat="server"></asp:TextBox><br />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="ProgDateLBL" runat="server" Text="Program Date"></asp:Label>
                                    </div>
                                    <div class="col-md-3"><!-- make date input type-->
                                        <asp:TextBox ID="ProgDateTXT" class="form-control" runat="server"></asp:TextBox><br />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="TypeLBL" runat="server" Text="Type of Program"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="TypeTXT" class="form-control" runat="server"></asp:TextBox><br />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="CountryLBL" runat="server" Text="Country"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="CountryTXT" class="form-control" runat="server"></asp:TextBox><br />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="StateLBL" runat="server" Text="State"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="StateTXT" class="form-control" runat="server"></asp:TextBox><br />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="GradeLBL" runat="server" Text="Grade Level"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="GradeTXT" class="form-control" runat="server"></asp:TextBox><br />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="EmailLBL" runat="server" Text="Email Address"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="EmailTXT" class="form-control" runat="server"></asp:TextBox><br />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="ThemeLBL" runat="server" Text="Theme"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="ThemeTXT" class="form-control" runat="server"></asp:TextBox><br />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="NumberOfChildrenLBL" runat="server" Text="Number Of Children"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="NumberOfChildrenTXT" class="form-control" runat="server"></asp:TextBox><br />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="NumberOfAdultsLBL" runat="server" Text="Number Of Adults"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="NumberOfAdultsTXT" class="form-control" runat="server"></asp:TextBox><br />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <asp:Label ID="CommentsLBL" runat="server" Text="Comments:"></asp:Label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="CommentsTXT" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="updateBTN" runat="server" onClick="updateOnlineProgram" class="btn btn-primary" useSubmitBehavior="false" Text="Update Online Program" />
                            <asp:Button ID="deleteBTN" runat="server" OnClick="DeleteOnlineProgram" class="btn btn-danger" useSubmitBehavior="false" data-dismiss="modal" Text="Deactivate Online Program" />
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
    

<%--    </asp:UpdatePanel>--%>

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
            $("[id*=GridViewOnlineProgram]").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
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
            $('[id*=editdeletemodal]').modal();
        }
    </script>
    <script type="text/javascript">
        function closeModal() {
            $('[id=editdeletemodal]').modal().hide();
        }
    </script>
    <script type="text/javascript">
    function pageLoad()
    {
        $addHandler($get('deleteBTN') , 'click' , onClick);
    }
    function onClick() // this onclick event is for cleint side input button
    {
        $get('deleteBTN').click(); // here i am calling the server side click event of asp:button with id 'btn'
    }
    </script>
    <script type="text/javascript">
        $(function () {
            $('#deleteBTN').on('click', function (event) {
                alert();
                event.preventDefault();
            });
        });
    </script>
    <script type="text/javascript">
        function buttonModal() {
            $("div.modalForm").appendTo($("form:first"));
        }
    </script>


            
</asp:Content>

