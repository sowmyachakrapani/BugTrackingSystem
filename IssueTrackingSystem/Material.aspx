<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Material.aspx.cs" Inherits="IssueTrackingSystem.Material" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style2">
                MaterialName</td>
            <td class="style1">
                <asp:TextBox ID="TxtMaterialName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TxtMaterialName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Description</td>
            <td class="style1">
                <asp:TextBox ID="TxtDesc" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                TaskId</td>
            <td class="style1">
                <asp:TextBox ID="TxtTaskId" runat="server" Height="22px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TxtTaskId" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                FilePath</td>
            <td class="style1">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style1">
                <asp:Button ID="Button1" runat="server" Text="Save" onclick="Button1_Click" 
                    style="height: 26px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        DataKeyNames="filePath" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="MaterialName" HeaderText="MaterialName" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:BoundField DataField="TaskId" HeaderText="TaskId" />
            <asp:BoundField DataField="FilePath" HeaderText="FilePath" />
            <asp:TemplateField HeaderText="Edit">
              <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("MaterialId") %>' onclick="lnkMaterialEdit_Click">Edit</asp:LinkButton>
                            </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Delete">
            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("MaterialId") %>' onclick="lnkMaterialDelete_Click">Delete</asp:LinkButton>
                            </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Dowload">
                        <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("MaterialId") %>' onclick="lnkMaterialDownload_Click">Download</asp:LinkButton>
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
        NavigateUrl="~/ManagerHomePage.aspx">Back</asp:HyperLink>
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            width: 173px;
        }
        .style2
        {
            width: 139px;
        }
    </style>
</asp:Content>

