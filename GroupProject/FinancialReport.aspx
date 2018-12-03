<%@ Page Title="FinancialReport" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FinancialReport.aspx.cs" Inherits="FinancialReport" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--    <script type="text/javascript">
    function OnPaymentSelection() {
        var PaymentType = document.getElementsByName("txtPaymentType").value;
        if (PaymentType == "Check") {
            document.getElementById("lblCheckNumber").style.diaplay = 'b';
        }
    }
</script> 


<%--<script type = "text/javascript">
function Calculation(){
    var id = document.getElementsByClassName("<%= dbInvoice.InvoiceID%>");

</script>--%>

    <style type="text/css">
        .hidden
        {
            display:none;
        }
        .panel-heading-custom {
            background: #ffbb33; 
            color: #bf360c;
        }
    </style>
 
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jQuery.dataTables.min.js"></script>
    <link href="https://cdn.datatable.net/1.10.13/css/jquery.dataTables.min.css" rel="stylesheet" />

    
    <div id="page-wrapper">
    <!--Page header -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="panel-heading panel-heading-custom">Financial Reports <i class="fa fa-dollar icon"></i></h1>
        </div>
    </div>
        
     <div class="row">
         <div class="col-lg-12">
             <div class="panel panel-warning">
                 <div class="panel-heading">
                     Enter Information Here
                 </div>
                <div class="panel-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-row">
                <div class="col-lg-4">
                    <asp:Label ID="lblInvoice" runat="server" Text="Invoice #:" Font-Size="Large" class="form-control-label"></asp:Label>
                <asp:TextBox ID="txtInvoice" runat="server" class="form-control"></asp:TextBox>
                </div>
            <div class="col-lg-4">
                 <asp:Label ID="lblProgram" runat="server" Text="Program Name:"  Font-Size="Large" class="form-control-label"></asp:Label>
                <asp:DropDownList ID="txtProgram" runat="server" class="custom-select form-control" DataSourceID="SqlDataSource3" DataTextField="ProgName" DataValueField="ProgName">
                   
                 </asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT DISTINCT[ProgName] FROM [RegularProgram]"></asp:SqlDataSource>
            </div>
           
            <div class="col-lg-4">
                <asp:Label ID="lblOrganization" runat="server" Text="Organization Name:"  Font-Size="Large" class="form-control-label"></asp:Label>
                <asp:DropDownList ID="txtOrganization" runat="server" class="custom-select form-control" DataSourceID="SqlDataSource4" DataTextField="OrganizationName" DataValueField="OrganizationName"  AutoPostBack="true" OnSelectedIndexChanged="txtOrganization_SelectedIndexChanged">
                    <asp:ListItem >     </asp:ListItem>
                    
                 </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [OrganizationName] FROM [Organization]"></asp:SqlDataSource>
            </div>
           
                    </div> 
                    <!-- closes form-row -->
               </div>
                <!-- closes col-lg-12 -->
            </div>
            <!--closes row -->
       <div class="row">
           <div class="col-lg-12">
               <div class="form-row">
               <div class="col-lg-4" style="padding-top:1em;">
                <asp:Label ID="lblPayType" runat="server" Text="PayType"  Font-Size="Large" class="form-control-label"></asp:Label>
               
                    

            
        <asp:DropDownList ID="txtPaymentType" AutoPostBack="true" runat="server" OnSelectedIndexChanged="OnPaymentSelection" class="custom-select form-control">
            
             <asp:ListItem >     </asp:ListItem>
            <asp:ListItem >Check</asp:ListItem>
            <asp:ListItem >Cash</asp:ListItem>
            <asp:ListItem >Credit/Debit Card</asp:ListItem>
       </asp:DropDownList><br />
      
            
                    

          

                <asp:Label ID="lblCheckNumber" runat="server" Text="Check Number:"  Font-Size="Large" Visible="false" class="form-control-label"></asp:Label>
                <asp:TextBox ID="txtCheckNumber" runat="server" Visible="false" class="form-control"></asp:TextBox> 
                <asp:Label ID="lblCheckNumberNote" runat="server" Text="NOTE(Please add a check number only if the payment type is 'Check')"  Font-Size="small" ForeColor="gray" class="text-muted"></asp:Label>
        </div>
        <div class="col-lg-3" style="padding-top:1em;">
                <asp:Label ID="lblAmount" runat="server" Text="Amount:"  Font-Size="Large" class="form-control-label"></asp:Label>
                <asp:TextBox ID="txtAmount" runat="server" class="form-control"></asp:TextBox>
        </div>
        <div class="col-lg-4" style="padding-top:1em;">
            
                  <asp:Label ID="lblAddress" runat="server" Text="Billing Address:"  Font-Size="Large" class="form-control-label"></asp:Label>
                   
                  <asp:TextBox ID="txtAddress" runat="server" class="form-control"></asp:TextBox><br />
         </div>
         <div class="row">
         <div class="col-lg-3">
               <asp:Label ID="lblContactPerson" runat="server" Text="Primary Contact Person:"  Font-Size="Large" class="form-control-label"></asp:Label>
                   
                  <asp:TextBox ID="txtContactPerson" runat="server" class="form-control"></asp:TextBox><br />
          </div>
        </div>
        <div class="col-lg-3" style="padding-top:1em;">
                <asp:Label ID="lblPaymentCollect" runat="server" Text="Payment Collect"  Font-Size="Large" class="form-control-label" ></asp:Label>
                <asp:TextBox ID="txtPaymentCollect" runat="server" class="form-control"></asp:TextBox>
        
                <asp:Label ID="lblPaymentLeft" runat="server" Text="Payment Left:"  Font-Size="Large" class="form-control-label"></asp:Label>
                <asp:TextBox ID="txtPaymentLeft" runat="server" class="form-control"></asp:TextBox>
         </div>     
            </div>
               <!--closes form-row-->
            </div>
            <!-- closes col-lg-12-->
        </div>
        <!-- closes row -->
           <br />

     

    
       
                
       
               <asp:Button ID="btnInsert" class="btn btn-lg btn-warning btn-block" runat="server" Text="Insert" Width="150" OnClick="btn1_Insert" />
        <br />
       
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
        <br />

        <br />
         <br />
       
        <!--close "panel-body"-->
        </div>
        <!--close "panel"-->
    </div>
    <!--close "col-lg-12"-->
</div>
<!--close "row"-->
                <asp:Label ID="lblSearch" runat="server" Text="Search for Invoice Number:"  Font-Size="X-Large" ></asp:Label>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" class="btn btn-lg btn-warning btn-block" runat="server" Text="Search" formNoValidate="formNoValidate"  OnClick="btn1_Search" />
        <br />
         <br />

                   
               
        
        </div>
      <asp:Label ID="lblComplete" runat="server" Text="Complete"  Font-Size="Large" ForeColor="Green"></asp:Label>
       <asp:Label ID="lblIncomplete" runat="server" Text="Incomplete"  Font-Size="Large" ForeColor="Red"></asp:Label>
  
            <div class="panel-body">
<%--        <asp:GridView ID="FinancialGridView" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource11" showHeader="true" RowStyle-CssClass="alert-info" OnRowEditing="dbInvoice_RowEditing" 
                OnRowCancelingEdit="dbInvoice_RowCancelingEdit" OnRowUpdating="dbInvoice_RowUpdating"   > 
                                <Columns>
                                    <asp:BoundField DataField="InvoiceID" HeaderText="Invoice Number" SortExpression="InvoiceID" />
                                    <asp:BoundField DataField="OrganizationName" HeaderText="Organization Name" SortExpression="OrganizationName" /> 
                                    <asp:BoundField DataField="Program" HeaderText="Program" SortExpression="Program" />
                                    <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" SortExpression="PaymentType" />
                                    <asp:BoundField DataField="CheckNumber" HeaderText="Check Number" SortExpression="CheckNumber" />
                                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                                    <asp:BoundField DataField="PaymentCollect" HeaderText="Payment Collect" SortExpression="PaymentCollect" />
                                    <asp:BoundField DataField="PaymentLeft" HeaderText="Payment Left" SortExpression="PaymentLeft" />
                              
                                    <asp:TemplateField HeaderText="Edit" SortExpression="Edit" >
                                        <ItemTemplate>
                            <asp:Button ID="btn_Edit" Onclick="btn1_Search" runat  ="server" CommandName="Edit" Text="Edit" ToolTip="Edit" Width =" 65px" Height =" 30px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btn_Upload" runat ="server" CommandName="Update" Text="Update" ToolTip="Update" Width =" 65px" Height =" 30px" />
                            <asp:Button ID="btn_Cancel"  runat ="server" CommandName="Cancel" Text="Cancel" ToolTip="Cancel" Width =" 65px" Height =" 30px" />
                        </EditItemTemplate>

                                    </asp:TemplateField>
                                    
                                </Columns>
                                
                            </asp:GridView>
                               <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="select InvoiceID, OrganizationName, Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft from [WildLifeCenter].[dbo].[Payment]"></asp:SqlDataSource>
        
   
    
     <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:WildLifeCenterConnectionString %>" SelectCommand="SELECT * FROM [Payment]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server"></asp:SqlDataSource>--%>
                 <asp:GridView ID="dbInvoice" class="table table-hover table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceID"   OnRowEditing="dbInvoice_RowEditing" 
                OnRowCancelingEdit="dbInvoice_RowCancelingEdit" OnRowUpdating="dbInvoice_RowUpdating" ShowFooter="false" ShowHeaderWhenEmpty="True"   AlternatingRowStyle-CssClass="alert-warning" ForeColor="#E65100">
          
                <Columns>
                    <asp:TemplateField HeaderText ="InvoiceID">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ID" Text ='<%# Eval("InvoiceID") %>' runat ="server" Width="80"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridInvoiceID" Text ='<%#Eval("InvoiceID") %>' runat ="server"  Width="90" />
                        </EditItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText ="Organization Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_OrganizationName" Text ='<%# Eval("OrganizationName") %>' runat ="server" Width="150"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridOrganization" Text ='<%#Eval("OrganizationName") %>' runat ="server"  Width="150"/>
                        </EditItemTemplate>
                         </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Program">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Program" Text ='<%# Eval("Program") %>' runat ="server" Width="150"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridProgram" Text ='<%#Eval("Program") %>' runat ="server" Width="150"/>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Payment Type">
                        <ItemTemplate>
                            <asp:Label ID="lbl_PaymentType" Text ='<%# Eval("PaymentType") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridPaymentType" Text ='<%#Eval("PaymentType") %>' runat ="server" Width="100"/>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Check Number">
                        <ItemTemplate>
                            <asp:Label ID="lbl_CheckNumber" Text ='<%# Eval("CheckNumber") %>' runat ="server" />
                     .   </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridCheckNumber" Text ='<%#Eval("CheckNumber") %>' runat ="server" Width="90"/>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Amount">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Amount" Text ='<%# Eval("PaymentAmount") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridAmount" Text ='<%#Eval("Amount") %>' runat ="server" Width="100"/>
                        </EditItemTemplate>
                    </asp:TemplateField>

<%--                    <asp:TemplateField HeaderText ="Payment Collect">
                        <ItemTemplate>
                            <asp:Label ID="lbl_PaymentCollect" Text ='<%# Eval("PaymentCollect") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridPaymentCollect" Text ='<%#Eval("PaymentCollect") %>' runat ="server" Width="100"/>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    
                    <asp:TemplateField HeaderText ="Payment Left">
                        <ItemTemplate>
                            <asp:Label ID="lbl_PaymentLeft" Text ='<%# Eval("PaymentLeft") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridPaymentLeft" Text ='<%#Eval("PaymentLeft") %>' runat ="server" Width="100"/>
                        </EditItemTemplate>
                    </asp:TemplateField>--%>

<%--                    <asp:TemplateField HeaderText ="Status">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Status" Text ='<%# Eval("PaymentStatus") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
        
                            <asp:TextBox ID ="GridStatus" Text ='<%#Eval("PaymentStatus") %>' runat ="server" Width="90"/>
                        </EditItemTemplate>
                    </asp:TemplateField>--%>

                   <%-- <asp:TemplateField HeaderText ="LastUpdatedBy">
                        <ItemTemplate>
                            <asp:Label ID="lbl_LastUpdatedBy" Text ='<%# Eval("LastUpdatedBy") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID ="GridLastUpdatedBy" Text ='<%#Eval("LastUpdatedBy") %>' readonly="true" runat ="server" Width="80"/>
                    </EditItemTemplate>
                            </asp:TemplateField>

                    <asp:TemplateField HeaderText ="LastUpdated">
                        <ItemTemplate>
                            <asp:Label ID="lbl_LastUpdated" Text ='<%# Eval("LastUpdated") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                        <asp:TextBox ID ="GridLastUpdated" Text ='<%#Eval("LastUpdated") %>' readonly="true" runat ="server" Width="160"/>
                    </EditItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText ="Edit">
                        <ItemTemplate>
                            <asp:Button ID="btn_Edit" runat ="server" CommandName="Edit" Text="Edit" ToolTip="Edit" Width =" 65px" Height =" 30px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btn_Upload" runat ="server" CommandName="Update" Text="Update" ToolTip="Update" Width =" 65px" Height =" 30px" />
                            <asp:Button ID="btn_Cancel"  runat ="server" CommandName="Cancel" Text="Cancel" ToolTip="Cancel" Width =" 65px" Height =" 30px" />
                        </EditItemTemplate>

              
                    </asp:TemplateField>
                </Columns>
        <HeaderStyle BackColor="White" ForeColor="#f57f17 "/>  
        <RowStyle BackColor="#fffde7 "/>  
        </asp:GridView>
                </div>
    <asp:Button ID="ButtonExport" class="btn btn-lg btn-warning btn-block" runat="server" formNoValidate="formNoValidate" onClick="ExportExcelBTN" Text="Export to Excel" />
         <br /><%--OnSelectedIndexChanged="dbInvoice_SelectedIndexChanged"--%>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WildLifeCenterConnectionString %>" SelectCommand=" select InvoiceID, OrganizationName, Program, PaymentType, CheckNumber, convert(numeric(10,2), Amount) as PaymentAmount from [Payment]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>                       
        </div>
          
        
       
   
    </div>
    <!-- jQuery -->
    <script src="/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/vendor/datatables-responsive/dataTables.responsive.js"></script>



  <!-- Custom Theme JavaScript -->
    <script src="/dist/js/sb-admin-2.js"></script>
    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/responsive/1.0.7/css/responsive.bootstrap.min.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
        $(document).ready(function () {
            $("[id*=dbInvoice]").DataTable({
                //responsive: true,
                responsive: true,
                paging: true,
                lengthChange: false,
                searching: true,
                ordering: true,
                info: true,
                autoWidth: false

            });
            $("#GridView1").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();

        });
    </script>
    <script>
        
    </script>
</asp:Content>

