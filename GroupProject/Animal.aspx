<%@ Page Title="Animal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Animal.aspx.cs" Inherits="Animal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <br />
        <asp:Label ID="lblTitle" runat="server" Text="Animal" Font-Size="XX-Large" ></asp:Label><br />
        
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Text="Name: "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" required="required"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label3" runat="server" Text="Animal Type: "></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" required="required"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label4" runat="server" Text="Status: "></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" required="required" Width="97px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label7" runat="server" Text="Last Updated By: "></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server" required="required"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="Label8" runat="server" Text="Last Updated: "></asp:Label>
        <asp:TextBox ID="TextBox7" runat="server" required="required"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Button2" runat="server" Text="Search" formNoValidate="formNoValidate" OnClick="clickSearchButton"/>
&nbsp;<asp:TextBox ID="searchBox" runat="server"></asp:TextBox>
    </p>
    
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" OnRowCancelingEdit="GridView1_RowCancelingEdit"   
  
OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">  
            <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" ToolTip="Edit" formNoValidate="FormNoValidate"/>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" ToolTip="Cancel" formNoValidate="FormNoValidate"/>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                <asp:TemplateField HeaderText="ID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("animalID") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  

                <asp:TemplateField HeaderText="Name">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("animalName") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("animalName") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                <asp:TemplateField HeaderText="Type">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_Type" runat="server" Text='<%#Eval("animalType") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_Type" runat="server" Text='<%#Eval("animalType") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                <asp:TemplateField HeaderText="Status">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_sex" runat="server" Text='<%#Eval("animalStatus") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_sex" runat="server" Text='<%#Eval("animalStatus") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

                 <asp:TemplateField HeaderText="Last Updated By">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_weight" runat="server" Text='<%#Eval("lastUpdatedBy") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_weight" runat="server" Text='<%#Eval("lastUpdatedBy") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

               <asp:TemplateField HeaderText="Last Updated">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_height" runat="server" Text='<%#Eval("lastUpdated") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_height" runat="server" Text='<%#Eval("lastUpdated") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                </asp:TemplateField>  

            



            </Columns>  
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff"/>  
            <RowStyle BackColor="#e7ceb6"/>  
 
        </asp:GridView>  
       
    <br />
    

    <p>
        <asp:Button ID="insertBtn" runat="server" Text="Insert" formNoValidate="formNoValidate" OnClick="clickInsertButton" />
    &nbsp;<asp:Button ID="viewBtn" runat="server" Text="View" formNoValidate="formNoValidate" OnClick="clickViewButton"/>
    &nbsp;&nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
