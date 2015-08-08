<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="IssueTrackingSystem.Comments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style1
    {
        width: 115px;
    }
        .style2
        {
            width: 363px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="374px">
    <table style="width:98%; height: 126px;">
        <tr>
            <td class="style1">
             Topic:   
            </td>
           <td class="style2">
            <asp:Label ID="lblTopic" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Comments</td>
            <td class="style2">
                <asp:TextBox ID="TxtComment" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click1" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
        <asp:Table ID="Table1" runat="server" BorderColor="#000099" BorderStyle="Solid" 
            BorderWidth="1px" Caption="List of Comments" CellPadding="5" 
            CellSpacing="5" Width="168px">
                </asp:Table>
                <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/Topics.aspx">Back</asp:HyperLink>
</asp:Panel>
</asp:Content>
