<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Topics.aspx.cs" Inherits="IssueTrackingSystem.Topics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 71px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="511px" BorderColor="#3399FF">
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    Project</td>
                <td>
                    <asp:DropDownList ID="DrpProjectName" runat="server" Width="149px">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Topic</td>
                <td>
                    <asp:TextBox ID="TxtTopicName" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Add" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Table ID="Table1" runat="server" BorderColor="#000099" BorderStyle="Solid" 
            BorderWidth="1px" Caption="List of Topics" CellPadding="5" CellSpacing="5">
        </asp:Table>
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/DeveloperHomePage.aspx">Back</asp:HyperLink>
    </asp:Panel>
</asp:Content>
