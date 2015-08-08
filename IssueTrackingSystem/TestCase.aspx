<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TestCase.aspx.cs" Inherits="IssueTrackingSystem.TestCase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 278px;
        }
        .style3
        {
            width: 171px;
        }
        .style4
        {
            width: 278px;
            height: 22px;
        }
        .style5
        {
            width: 171px;
            height: 22px;
        }
        .style6
        {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style2">
                TestCaseDescription</td>
            <td class="style3">
                <asp:TextBox ID="TxtTestCaseDesc" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Expected Output</td>
            <td class="style3">
                <asp:TextBox ID="TxtExpectedOp" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Actual Output</td>
            <td class="style3">
                <asp:TextBox ID="TxtActualOp" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Status</td>
            <td class="style3">
                <asp:DropDownList ID="DrpStatus" runat="server">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>Open</asp:ListItem>
                    <asp:ListItem>Reopen</asp:ListItem>
                    <asp:ListItem>Fixed</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Severity</td>
            <td class="style3">
                <asp:DropDownList ID="DrpSeverity" runat="server">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>Verylow</asp:ListItem>
                    <asp:ListItem>Low</asp:ListItem>
                    <asp:ListItem>Medium</asp:ListItem>
                    <asp:ListItem>High</asp:ListItem>
                    <asp:ListItem>VeryHigh</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Visibility</td>
            <td class="style3">
                <asp:DropDownList ID="DrpVisibility" runat="server">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>Verylow</asp:ListItem>
                    <asp:ListItem>low</asp:ListItem>
                    <asp:ListItem>Medium</asp:ListItem>
                    <asp:ListItem>High</asp:ListItem>
                    <asp:ListItem>VeryHigh</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                TestCaseArea</td>
            <td class="style3">
                <asp:DropDownList ID="DrpTestCaseArea" runat="server" AutoPostBack="True">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="Button1" runat="server" Text="Save" onclick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Clear" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                </td>
            <td class="style5">
            </td>
            <td class="style6">
                </td>
        </tr>
        <tr>
            <td class="style4">
                Search Based on Status</td>
            <td class="style5">
                <asp:DropDownList ID="DrpSearchStatus" runat="server">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>Open</asp:ListItem>
                    <asp:ListItem>Close</asp:ListItem>
                    <asp:ListItem>Reopen</asp:ListItem>
                    <asp:ListItem>Fixed</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style6">
                <asp:Button ID="Search" runat="server" onclick="Search_Click" Text="Search" />
                </td>
        </tr>
        <tr>
            <td class="style4">
                </td>
            <td class="style5">
                </td>
            <td class="style6">
                </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
<asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" AutoGenerateColumns="False" AllowPaging="True" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:BoundField DataField="TestCaseDescription" 
            HeaderText="TestCaseDescription" />
        <asp:BoundField DataField="ExpectedOutput" HeaderText="ExpectedOutput" />
        <asp:BoundField DataField="ActualOutput" HeaderText="ActualOutput" />
        <asp:BoundField DataField="Status" HeaderText="Status" />
        <asp:BoundField DataField="Severity" HeaderText="Severity" />
        <asp:BoundField DataField="Visibility" HeaderText="Visibility" />
        <asp:BoundField DataField="TestCaseAreaName" HeaderText="TestCaseAreaName" />
        <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkTestEdit" runat="server" CausesValidation ="false"
                    CommandArgument='<%# Eval("TestCaseId") %>' onclick="lnkTestCaseEdit_Click">Edit</asp:LinkButton>
                </ItemTemplate>
             </asp:TemplateField>
        <asp:TemplateField HeaderText="Delete">
                   <ItemTemplate>
                   <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation ="false"
                    CommandArgument='<%# Eval("TestCaseId") %>' onclick="lnkTestCaseDelete_Click">Delete</asp:LinkButton>
                   </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>

    <asp:HyperLink ID="HyperLink1" runat="server" 
    NavigateUrl="~/TestViewArea.aspx">Back</asp:HyperLink>
</asp:Content>

