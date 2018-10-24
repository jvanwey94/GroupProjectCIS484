<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="FinancialReport.aspx.cs" Inherits="FinancialReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
       <asp:Label ID="lblTitle" runat="server" Text="Financial report" Font-Size="X-Large" ForeColor="Blue"></asp:Label><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        <br />
                  
                <asp:Label ID="lblInvoice" runat="server" Text="Invoice #:" Font-Size="Large" ForeColor="Blue"></asp:Label>
                <asp:TextBox ID="txtInvoice" runat="server"></asp:TextBox><br />
        <br />
        <br />
                 <asp:Label ID="lblProgram" runat="server" Text="Program Name:"  ></asp:Label>
                <asp:DropDownList ID="dpProgram" runat="server">
                    </asp:DropDownList>
       <br />
        <br />
                <asp:Label ID="lblOrganization" runat="server" Text="Organization Title:"  Font-Size="Large" ForeColor="Blue"></asp:Label>
                <asp:TextBox ID="txtOrganization" runat="server"></asp:TextBox>
        <br />
        <br />
               <asp:Label ID="lblPayType" runat="server" Text="PayType"  Font-Size="Large" ForeColor="Blue"></asp:Label>
            
                    

            
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem >
                Check
            </asp:ListItem>
            <asp:ListItem >
                Cash
            </asp:ListItem>
            <asp:ListItem >
                Credit/Debit Card
            </asp:ListItem>
       </asp:DropDownList>
            
                    

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
                    

                <asp:Label ID="lblCheckNumber" runat="server" Text="Check Number:"  Font-Size="Large" ForeColor="Blue"></asp:Label>
                <asp:TextBox ID="txtCheckNumber" runat="server"></asp:TextBox>
   
        <br />
        <br />
                <asp:Label ID="lblAmount" runat="server" Text="Amount:"  Font-Size="Large" ForeColor="BLue"></asp:Label>
                <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
        <br />
        <br />
                
       
               <asp:Button ID="btnInsert" class="btn btn-primary" runat="server" Text="Insert" Width="150" OnClick="btn1_Select" />
        <br />
       
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
        <br />
        <br />
         <br />
                <asp:Label ID="lblSearch" runat="server" Text="Search for Invoice Number:"  Font-Size="X-Large" ForeColor="Blue"></asp:Label>
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
       <br />
        <asp:Button ID="btnSearch" class="btn btn-primary" runat="server" Text="Search" Width="150" OnClick="btn1_Select" />
        <br />
         <br />
        <asp:GridView ID="dbInvoice" runat="server" AutoGenerateColumns="False" DataKeyNames="Invoice#" OnRowEditing="dbSkill_RowEditing" 
                OnRowCancelingEdit="dbSkill_RowCancelingEdit" OnRowUpdating="dbSkill_RowUpdating"  >
                
                <Columns>
                    <asp:TemplateField HeaderText ="Invoice Number">
                        <ItemTemplate>
                            <div class="text-center">
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </div>
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText ="Organization Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_OrganizationName" Text ='<%# Eval("OrganizationName") %>' runat ="server" />
                        </ItemTemplate>
                         </asp:TemplateField>
                    <asp:TemplateField HeaderText ="Program">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Program" Text ='<%# Eval("Program") %>' runat ="server" />
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText ="Payment Type">
                        <ItemTemplate>
                            <asp:Label ID="lbl_PaymentType" Text ='<%# Eval("PaymentType") %>' runat ="server" />
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText ="Check Number">
                        <ItemTemplate>
                            <asp:Label ID="lbl_CheckNumber" Text ='<%# Eval("CheckNumber") %>' runat ="server" />
                     .   </ItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText ="Amount">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Amount" Text ='<%# Eval("Amount") %>' runat ="server" />
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText ="Payment Collect">
                        <ItemTemplate>
                            <asp:Label ID="lbl_PaymentCollect" Text ='<%# Eval("PaymentCollect") %>' runat ="server" />
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText ="Status">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Status" Text ='<%# Eval("Status") %>' runat ="server" />
                        </ItemTemplate>
                        
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
                </Columns>
        <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
        <RowStyle BackColor="#e7ceb6"/>  
        </asp:GridView>
      
</asp:Content>

