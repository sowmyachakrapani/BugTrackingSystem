<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ViewTestCase.aspx.cs" Inherits="IssueTrackingSystem.ViewTestCase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="365px" Width="989px">
        <asp:GridView ID="GvViewTestCase" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="TestCaseDescription" 
                    HeaderText="TestCaseDescription" />
                <asp:BoundField DataField="ExpectedOutput" HeaderText="ExpectedOutput" />
                <asp:BoundField DataField="ActualOutput" HeaderText="ActualOutput" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="Severity" HeaderText="Severity" />
                <asp:BoundField DataField="Visibility" HeaderText="Visibility" />
                <asp:BoundField DataField="AreaName" HeaderText="AreaName" />
                <asp:TemplateField HeaderText="Fix">
                <ItemTemplate>
                   <asp:LinkButton ID="lnkFix" runat="server" CausesValidation ="false"
                    CommandArgument='<%# Eval("TestCaseId") %>' onclick="lnkTestCaseFix_Click">Fix</asp:LinkButton>
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

        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ViewArea.aspx">Back</asp:HyperLink>
    </asp:Panel>
</asp:Content>
