<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="DeveloperHomePage.aspx.cs" Inherits="IssueTrackingSystem.DeveloperHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="265px">
        <asp:Button ID="Button1" runat="server" Text="Home" />
        <asp:Button ID="Button2" runat="server" Text="Task Assigned" 
            onclick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" Text="Edit Profile" 
            onclick="Button3_Click" />
        <asp:Button ID="Button4" runat="server" Text="Change Password" 
            onclick="Button4_Click" />
        <asp:Button ID="Button5" runat="server" onclick="Button5_Click" 
            Text="DiscussionForum" />
    </asp:Panel>
</asp:Content>
