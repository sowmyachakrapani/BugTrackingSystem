<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TestViewArea.aspx.cs" Inherits="IssueTrackingSystem.TestViewArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 257px;
        }
        .style3
        {
            width: 134px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" style="margin-bottom: 111px" 
        Height="294px">
        <table style="width:100%;">
            <tr>
                <td class="style2">
                    TestCaseAreaName</td>
                <td class="style3">
                    <asp:TextBox ID="TxtTestCaseAreaName" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    TaskName</td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click" />
                    <asp:Button ID="Button2" runat="server" Text="Clear" onclick="Button2_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" ForeColor="#333333" 
                        GridLines="None" DataKeyNames="AreaId" AllowPaging="True" 
                        OnPageIndexChanging="GridView2_PageIndexChanging" PageSize="2">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="AreaName" HeaderText="AreaName" 
                                SortExpression="AreaName" />
                            <asp:BoundField DataField="TaskName" HeaderText="TaskName" 
                                SortExpression="TaskName" />
                            <asp:TemplateField HeaderText="Edit">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkTestEdit" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("AreaId") %>' onclick="lnkTestViewAreaEdit_Click">Edit</asp:LinkButton>
                            </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("AreaId") %>' onclick="lnkTestViewAreaDelete_Click">Delete</asp:LinkButton>
                            </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:HyperLinkField HeaderText="ViewTestCases" NavigateUrl="~/TestCase.aspx" 
                                Text="ViewTestCases" />
                           
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:IssuetrackingConnectionString4 %>" 
                        
                        SelectCommand="SELECT TestCaseArea.AreaId ,TestCaseArea.AreaName, Task.TaskName FROM TestCaseArea INNER JOIN Task ON TestCaseArea.TaskId = Task.TaskId">
                    </asp:SqlDataSource>
                </td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
         

        </table>
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/TesterHomePage.aspx">Back</asp:HyperLink>

    </asp:Panel>
</asp:Content>
