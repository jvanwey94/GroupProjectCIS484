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
 
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.13/js/jQuery.dataTables.min.js"></script>
    <link href="https://cdn.datatable.net/1.10.13/css/jquery.dataTables.min.css" rel="stylesheet" />

    
    <div id="page-wrapper">
    <!--Page header -->
    <div class="row">
        <div class="col-lg-12">
            <asp:Label ID="lblTitle" runat="server" Text="Financial report" Font-Size="XX-Large" class="page-header" ></asp:Label><br />
        </div>
    </div>
        
     <div class="row">
         <div class="col-lg-12">
             <div class="panel panel-default">
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
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AWSConnection %>" SelectCommand="SELECT [ProgName] FROM [RegularProgram]"></asp:SqlDataSource>
            </div>
           
            <div class="col-lg-4">
                <asp:Label ID="lblOrganization" runat="server" Text="Organization Name:"  Font-Size="Large" class="form-control-label"></asp:Label>
                <asp:DropDownList ID="txtOrganization" runat="server" class="custom-select form-control" DataSourceID="SqlDataSource4" DataTextField="OrganizationName" DataValueField="OrganizationName">
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
        <div class="row">
        <div class="col-lg-5" style="padding-top:1em;">
            
                  <asp:Label ID="lblAddress" runat="server" Text="Billing Address:"  Font-Size="Large" class="form-control-label"></asp:Label>
                   
                  <asp:TextBox ID="txtAddress" required="required" runat="server" class="form-control"></asp:TextBox><br />
         </div>
        </div>
        <div class="col-3" style="padding-top:1em;">
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

     

     <%--           <asp:Label ID="lblLastUpdatedBy" runat="server" Text="UpdatedBy:"  Font-Size="Large" ></asp:Label>
                <asp:TextBox ID="txtLastUpdatedBy" runat="server"></asp:TextBox>
        <br />
        <br />
                 <asp:Label ID="lblLastUpdated" runat="server" Text="Updated:"  Font-Size="Large" ></asp:Label>
                <asp:TextBox ID="txtLastUpdated" runat="server"></asp:TextBox>--%>
       
                
       
               <asp:Button ID="btnInsert" class="btn btn-lg btn-success btn-block" runat="server" Text="Insert" Width="150" OnClick="btn1_Insert" />
        <br />
       
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
        <br />
     <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
        <br />
         <br />
        </div>
        <!--close "panel-body"-->
        </div>
        <!--close "panel"-->
    </div>
    <!--close "col-lg-12"-->
</div>
<!--close "row"-->
                <asp:Label ID="lblSearch" runat="server" Text="Search for Invoice Number:"  Font-Size="X-Large" ></asp:Label>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
       <br />
        <br />
    <%--<asp:Button ID="ButtonExport" class="btn btn-lg btn-success btn-block" runat="server" formNoValidate="formNoValidate" onClick="Export" Text="Export to Excel" />--%>
         <br /><%--OnSelectedIndexChanged="dbInvoice_SelectedIndexChanged"--%>
    <div class="panel-body">
        <asp:GridView ID="dbInvoice" class="table table-hover table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceID"   OnRowEditing="dbInvoice_RowEditing" 
                OnRowCancelingEdit="dbInvoice_RowCancelingEdit" OnRowUpdating="dbInvoice_RowUpdating"   >
          
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
                            <asp:Label ID="lbl_Amount" Text ='<%# Eval("Amount") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridAmount" Text ='<%#Eval("Amount") %>' runat ="server" Width="100"/>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Payment Collect">
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
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Status">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Status" Text ='<%# Eval("PaymentStatus") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
        
                            <asp:TextBox ID ="GridStatus" Text ='<%#Eval("PaymentStatus") %>' runat ="server" Width="90"/>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="LastUpdatedBy">
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
                    </asp:TemplateField>
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
        <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
        <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView>
        </div>
      <asp:Label ID="lblComplete" runat="server" Text="Complete"  Font-Size="Large" ForeColor="Green"></asp:Label>
       <asp:Label ID="lblIncomplete" runat="server" Text="Incomplete"  Font-Size="Large" ForeColor="Red"></asp:Label>
    <div class="row">
        <div class="panel panel-default">
            <div class="panel-heading">
                Financial Reports
            </div>
            <div class="panel-body">
        <asp:GridView ID="GridViewTest" class="table table-hover table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceID">
          
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
                            <asp:Label ID="lbl_Amount" Text ='<%# Eval("Amount") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridAmount" Text ='<%#Eval("Amount") %>' runat ="server" Width="100"/>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Payment Collect">
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
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Status">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Status" Text ='<%# Eval("PaymentStatus") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
        
                            <asp:TextBox ID ="GridStatus" Text ='<%#Eval("PaymentStatus") %>' runat ="server" Width="90"/>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="LastUpdatedBy">
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
                    </asp:TemplateField>
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
        <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
        <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView>
        </div>
            <!-- ends panel-body-->
        </div>
        <!--ends panel-->
    </div>
    </div>
    </div>
    <!--ends row-->
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WildLifeCenterConnectionString %>" SelectCommand="SELECT * FROM [Payment]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
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

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#GridView1').DataTable({
            //responsive: true,
            paging: true,
            ordering: true,
            searching: true

        });
        $("#GridView1").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
       
    });
    </script>
    <script>
        
    </script>
</asp:Content>

