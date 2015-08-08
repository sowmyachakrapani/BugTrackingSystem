<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ViewArea.aspx.cs" Inherits="IssueTrackingSystem.ViewArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="280px">
        <asp:GridView ID="GvViewArea" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="AreaId" HeaderText="AreaId" 
                    SortExpression="AreaId" />
                <asp:BoundField DataField="AreaName" HeaderText="AreaName" 
                    SortExpression="AreaName" />
                <asp:BoundField DataField="TaskName" HeaderText="TaskName" 
                    SortExpression="TaskName" />
                <asp:TemplateField HeaderText="ViewTestCases">
                             <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEditMat" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("AreaId") %>' onclick="lnkViewTestCases_Click">ViewTestCases</asp:LinkButton>
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
            NavigateUrl="~/DeveloperHomePage.aspx">Back</asp:HyperLink>
    </asp:Panel>
</asp:Content>
