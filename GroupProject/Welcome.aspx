<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <style>
        #nava{
            display:none;
        }
        
   </style>
    <h1>Welcome to  Wildlife Center</h1>
    <h3>No Permissions Granted</h3>
    <a href="Login.aspx" runat="server">Login</a>
</asp:Content>

