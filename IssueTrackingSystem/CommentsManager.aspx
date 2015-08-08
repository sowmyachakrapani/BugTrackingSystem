<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CommentsManager.aspx.cs" Inherits="IssueTrackingSystem.CommentsManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="268px">
        
        <asp:Table ID="Table1" runat="server" Caption="List of Comments" 
            CellPadding="5" CellSpacing="5" Width="234px">
        </asp:Table>
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/ManagerHomePage.aspx">Back to Topics Page</asp:HyperLink>
    </asp:Panel>
</asp:Content>
