<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ViewMaterials.aspx.cs" Inherits="IssueTrackingSystem.ViewMaterials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="262px">
        <asp:GridView ID="GridView1" runat="server" 
    CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" 
            DataKeyNames="filePath" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="MaterialName" HeaderText="MaterialName" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="TaskName" HeaderText="TaskName" />
                <asp:BoundField DataField="FilePath" HeaderText="FilePath" />
                <asp:BoundField DataField="MaterialId" HeaderText="MaterialId" />
                <asp:TemplateField HeaderText="Download">
                 <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("MaterialId") %>' onclick="lnkDownload_Click">Download</asp:LinkButton>
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
