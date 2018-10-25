<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FinancialReport.aspx.cs" Inherits="FinancialReport" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">


<%--<script type = "text/javascript">
function Calculation(){
    var id = document.getElementsByClassName("<%= dbInvoice.InvoiceID%>");

</script>--%>


        <asp:Label ID="lblTitle" runat="server" Text="Financial report" Font-Size="X-Large" ForeColor="Blue"></asp:Label><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        <br />
                  
                <asp:Label ID="lblInvoice" runat="server" Text="Invoice #:" Font-Size="Large" ForeColor="Blue"></asp:Label>
                <asp:TextBox ID="txtInvoice" runat="server"></asp:TextBox>
        <br />
        <br />
                 <asp:Label ID="lblProgram" runat="server" Text="Program Name:"  Font-Size="Large" ForeColor="Blue"></asp:Label>
                <asp:DropDownList ID="txtProgram" runat="server">
                    <asp:ListItem >     </asp:ListItem>
                    <asp:ListItem >Program1</asp:ListItem>
                    <asp:ListItem >Program2</asp:ListItem>
                    <asp:ListItem >Program3</asp:ListItem>
                 </asp:DropDownList>
       <br />
        <br />
                <asp:Label ID="lblOrganization" runat="server" Text="Organization Title:"  Font-Size="Large" ForeColor="Blue"></asp:Label>
                <asp:DropDownList ID="txtOrganization" runat="server">
                    <asp:ListItem >     </asp:ListItem>
                    <asp:ListItem >Organiztion1</asp:ListItem>
                    <asp:ListItem >Organiztion2</asp:ListItem>
                    <asp:ListItem >Organiztion3 </asp:ListItem>
                 </asp:DropDownList>
        <br />
        <br />
               <asp:Label ID="lblPayType" runat="server" Text="PayType"  Font-Size="Large" ForeColor="Blue"></asp:Label>
            
                    

            
        <asp:DropDownList ID="txtPaymentType" AutoPostBack="true" runat="server" OnSelectedIndexChanged="OnPaymentSelection">
            
             <asp:ListItem >     </asp:ListItem>
            <asp:ListItem >Check</asp:ListItem>
            <asp:ListItem >Cash</asp:ListItem>
            <asp:ListItem >Credit/Debit Card</asp:ListItem>
       </asp:DropDownList><br />
            
                    

          

                <asp:Label ID="lblCheckNumber" runat="server" Text="Check Number:"  Font-Size="Large" ForeColor="Blue" Visible="false"></asp:Label>
                <asp:TextBox ID="txtCheckNumber" runat="server" Visible="false"></asp:TextBox> 
                <asp:Label ID="lblCheckNumberNote" runat="server" Text="NOTE(Please add a check number only if the payment type is 'Check')"  Font-Size="small" ForeColor="red"></asp:Label>
   
        <br />
        <br />
                <asp:Label ID="lblAmount" runat="server" Text="Amount:"  Font-Size="Large" ForeColor="BLue"></asp:Label>
                <asp:TextBox ID="txtAmount"  runat="server"></asp:TextBox>
        <br />
        <br />
                <asp:Label ID="lblPaymentCollect" runat="server" Text="Payment Collect"  Font-Size="Large" ForeColor="BLue"></asp:Label>
                <asp:TextBox ID="txtPaymentCollect" runat="server"></asp:TextBox>
        
                <asp:Label ID="lblPaymentLeft" runat="server" Text="Payment Left:"  Font-Size="Large" ForeColor="BLue"></asp:Label>
                <asp:TextBox ID="txtPaymentLeft" runat="server"></asp:TextBox>
        <br />
        <br />
                <asp:Label ID="lblLastUpdatedBy" runat="server" Text="UpdatedBy:"  Font-Size="Large" ForeColor="BLue"></asp:Label>
                <asp:TextBox ID="txtLastUpdatedBy" runat="server"></asp:TextBox>
        <br />
        <br />
                 <asp:Label ID="lblLastUpdated" runat="server" Text="Updated:"  Font-Size="Large" ForeColor="BLue"></asp:Label>
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
                <asp:Label ID="lblSearch" runat="server" Text="Search for Invoice Number:"  Font-Size="X-Large" ForeColor="Blue"></asp:Label>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
       <br />
        <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" Width="150" OnClick="btn1_Search" />
        <br />
         <br />
        <asp:GridView ID="dbInvoice" runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceID" OnSelectedIndexChanged="dbInvoice_SelectedIndexChanged"   OnRowEditing="dbSkill_RowEditing"  
                OnRowCancelingEdit="dbSkill_RowCancelingEdit" OnRowUpdating="dbSkill_RowUpdating"  >
          
                <Columns>
                    <asp:TemplateField HeaderText ="InvoiceID">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ID" Text ='<%# Eval("InvoiceID") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridInvoiceID" Text ='<%#Eval("InvoiceID") %>' runat ="server" />
                        </EditItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText ="Organization Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_OrganizationName" Text ='<%# Eval("OrganizationName") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridOrganization" Text ='<%#Eval("OrganizationName") %>' runat ="server" />
                        </EditItemTemplate>
                         </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Program">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Program" Text ='<%# Eval("Program") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridProgram" Text ='<%#Eval("Program") %>' runat ="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Payment Type">
                        <ItemTemplate>
                            <asp:Label ID="lbl_PaymentType" Text ='<%# Eval("PaymentType") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridPaymentType" Text ='<%#Eval("PaymentType") %>' runat ="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Check Number">
                        <ItemTemplate>
                            <asp:Label ID="lbl_CheckNumber" Text ='<%# Eval("CheckNumber") %>' runat ="server" />
                     .   </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridCheckNumber" Text ='<%#Eval("CheckNumber") %>' runat ="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Amount" runat ="server">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Amount" Text ='<%# Eval("Amount") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate runat ="server">
                            <asp:TextBox ID ="GridAmount" Text ='<%#Eval("Amount") %>' runat ="server"  />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Payment Collect" runat ="server">
                        <ItemTemplate>
                            <asp:Label ID="lbl_PaymentCollect" Text ='<%# Eval("PaymentCollect") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridPaymentCollect" Text ='<%#Eval("PaymentCollect") %>' runat ="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    
                    <asp:TemplateField HeaderText ="Payment Left" runat ="server">
                        <ItemTemplate>
                            <asp:Label ID="lbl_PaymentLeft" Text ='<%# Eval("PaymentLeft") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID ="GridPaymentLeft" Text ='<%#Eval("PaymentLeft") %>' runat ="server" Readonly ="true" AutoCompleteType="None" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="Status">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Status" Text ='<%# Eval("PaymentStatus") %>' runat ="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
        
                            <asp:TextBox ID ="GridStatus" Text ='<%#Eval("PaymentStatus") %>' runat ="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="LastUpdatedBy">
                        <ItemTemplate>
                            <asp:Label ID="lbl_LastUpdatedBy" Text ='<%# Eval("LastUpdatedBy") %>' runat ="server" />
                        </ItemTemplate>
                        
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText ="LastUpdated">
                        <ItemTemplate>
                            <asp:Label ID="lbl_LastUpdated" Text ='<%# Eval("LastUpdated") %>' runat ="server" />
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText ="Edit">
                        <ItemTemplate>
                            <asp:Button ID="btn_Edit" runat ="server" CommandName="Edit" Text="Edit" ToolTip="Edit" Width =" 20px" Height =" 20px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btn_Upload" runat ="server" CommandName="Upload" Text="Updoad" ToolTip="Edit" Width =" 20px" Height =" 20px" />
                            <asp:Button ID="btn_Cancel"  runat ="server" CommandName="Cancel" Text="Insert" ToolTip="Edit" Width =" 20px" Height =" 20px" />
                        </EditItemTemplate>

              
                    </asp:TemplateField>
                </Columns>
        <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
        <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView>
      <asp:Label ID="lblComplete" runat="server" Text="Complete"  Font-Size="Large" ForeColor="Green"></asp:Label>
       <asp:Label ID="lblIncomplete" runat="server" Text="Incomplete"  Font-Size="Large" ForeColor="Red"></asp:Label>
    
</asp:Content>

