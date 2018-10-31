<%@ Page Title="Financial Report" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FinancialReport.aspx.cs" Inherits="FinancialReport" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <%--    <script type="text/javascript">
    function OnPaymentSelection() {
        var PaymentType = document.getElementsByName("txtPaymentType").value;
        if (PaymentType == "Check") {
            document.getElementById("lblCheckNumber").style.diaplay = 'b';
        }
    }
</script>   --%>

<%--<script type = "text/javascript">
function Calculation(){
    var id = document.getElementsByClassName("<%= dbInvoice.InvoiceID%>");

</script>--%>
    <br />

        <asp:Label ID="lblTitle" runat="server" Text="Financial report" Font-Size="XX-Large" ></asp:Label><br />
    
          
                  
                <asp:Label ID="lblInvoice" runat="server" Text="Invoice #:" Font-Size="Large" ></asp:Label>
                <asp:TextBox ID="txtInvoice" runat="server"></asp:TextBox>
        <br />
        <br />
                 <asp:Label ID="lblProgram" runat="server" Text="Program Name:"  Font-Size="Large" ></asp:Label>
                <asp:DropDownList ID="txtProgram" runat="server">
                    <asp:ListItem >     </asp:ListItem>
                    <asp:ListItem >Program1</asp:ListItem>
                    <asp:ListItem >Program2</asp:ListItem>
                    <asp:ListItem >Program3</asp:ListItem>
                 </asp:DropDownList>
       <br />
        <br />
                <asp:Label ID="lblOrganization" runat="server" Text="Organization Title:"  Font-Size="Large" ></asp:Label>
                <asp:DropDownList ID="txtOrganization" runat="server">
                    <asp:ListItem >     </asp:ListItem>
                    <asp:ListItem >Organiztion1</asp:ListItem>
                    <asp:ListItem >Organiztion2</asp:ListItem>
                    <asp:ListItem >Organiztion3 </asp:ListItem>
                 </asp:DropDownList>
        <br />
        <br />
               <asp:Label ID="lblPayType" runat="server" Text="PayType"  Font-Size="Large" ></asp:Label>
            
                    

            
        <asp:DropDownList ID="txtPaymentType" AutoPostBack="true" runat="server" OnSelectedIndexChanged="OnPaymentSelection">
            
             <asp:ListItem >     </asp:ListItem>
            <asp:ListItem >Check</asp:ListItem>
            <asp:ListItem >Cash</asp:ListItem>
            <asp:ListItem >Credit/Debit Card</asp:ListItem>
       </asp:DropDownList><br />
            
                    

          

                <asp:Label ID="lblCheckNumber" runat="server" Text="Check Number:"  Font-Size="Large" Visible="false"></asp:Label>
                <asp:TextBox ID="txtCheckNumber" runat="server" Visible="false"></asp:TextBox> 
                <asp:Label ID="lblCheckNumberNote" runat="server" Text="NOTE(Please add a check number only if the payment type is 'Check')"  Font-Size="small" ForeColor="gray"></asp:Label>
   
        <br />
        <br />
                <asp:Label ID="lblAmount" runat="server" Text="Amount:"  Font-Size="Large" ></asp:Label>
                <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
        <br />
        <br />
                <asp:Label ID="lblPaymentCollect" runat="server" Text="Payment Collect"  Font-Size="Large" ></asp:Label>
                <asp:TextBox ID="txtPaymentCollect" runat="server"></asp:TextBox>
        
                <asp:Label ID="lblPaymentLeft" runat="server" Text="Payment Left:"  Font-Size="Large" ></asp:Label>
                <asp:TextBox ID="txtPaymentLeft" runat="server"></asp:TextBox>
        <br />
        <br />
                <asp:Label ID="lblLastUpdatedBy" runat="server" Text="UpdatedBy:"  Font-Size="Large" ></asp:Label>
                <asp:TextBox ID="txtLastUpdatedBy" runat="server"></asp:TextBox>
        <br />
        <br />
                 <asp:Label ID="lblLastUpdated" runat="server" Text="Updated:"  Font-Size="Large" ></asp:Label>
                <asp:TextBox ID="txtLastUpdated" runat="server"></asp:TextBox>
        <br />
        <br />
                
       
               <asp:Button ID="btnInsert" class="btn btn-primary" runat="server" Text="Insert" Width="150" OnClick="btn1_Insert" />
        <br />
       
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
        <br />
     <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
        <br />
         <br />
                <asp:Label ID="lblSearch" runat="server" Text="Search for Invoice Number:"  Font-Size="X-Large" ></asp:Label>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
       <br />
        <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" Width="150" OnClick="btn1_Search" />
        <br />
         <br /><%--OnSelectedIndexChanged="dbInvoice_SelectedIndexChanged"--%>
        <asp:GridView ID="dbInvoice" runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceID"   OnRowEditing="dbInvoice_RowEditing" 
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
      <asp:Label ID="lblComplete" runat="server" Text="Complete"  Font-Size="Large" ForeColor="Green"></asp:Label>
       <asp:Label ID="lblIncomplete" runat="server" Text="Incomplete"  Font-Size="Large" ForeColor="Red"></asp:Label>
    
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="InvoiceID" HeaderText="InvoiceID" ReadOnly="True" SortExpression="InvoiceID" />
            <asp:BoundField DataField="OrganizationName" HeaderText="OrganizationName" SortExpression="OrganizationName" />
            <asp:BoundField DataField="Program" HeaderText="Program" SortExpression="Program" />
            <asp:BoundField DataField="PaymentType" HeaderText="PaymentType" SortExpression="PaymentType" />
            <asp:BoundField DataField="CheckNumber" HeaderText="CheckNumber" SortExpression="CheckNumber" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            <asp:BoundField DataField="PaymentCollect" HeaderText="PaymentCollect" SortExpression="PaymentCollect" />
            <asp:BoundField DataField="PaymentLeft" HeaderText="PaymentLeft" SortExpression="PaymentLeft" />
            <asp:BoundField DataField="PaymentStatus" HeaderText="PaymentStatus" SortExpression="PaymentStatus" />
            <asp:BoundField DataField="LastUpdatedBy" HeaderText="LastUpdatedBy" SortExpression="LastUpdatedBy" />
            <asp:BoundField DataField="LastUpdated" HeaderText="LastUpdated" SortExpression="LastUpdated" />
        </Columns>
        <HeaderStyle BackColor="#33cc33" />  
<%--        <RowStyle BackColor="#339933"/> --%>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WildLifeCenterConnectionString %>" SelectCommand="SELECT * FROM [Payment]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    
</asp:Content>

