<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TTTestCaseArea.aspx.cs" Inherits="IssueTrackingSystem.TestCaseArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 94px;
        }
        .style3
        {
            width: 189px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style2">
                AreaName</td>
            <td class="style3">
                <asp:TextBox ID="TxtAreaName" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                TaskId</td>
            <td class="style3">
                <asp:TextBox ID="TxtTaskId" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="Button1" runat="server" Text="Save" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
