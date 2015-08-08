<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TaskAssigned.aspx.cs" Inherits="IssueTrackingSystem.TaskAssigned" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="162px">
        <asp:GridView ID="GridView1" runat="server" 
    AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" 
            DataSourceID="SqlDataSource1" DataKeyNames="TaskId" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="TaskName" HeaderText="TaskName" 
                    SortExpression="TaskName" />
                <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" 
                    SortExpression="ProjectName" />
                <asp:BoundField DataField="TestEngineerEmployeeId" HeaderText="TestEngineerEmployeeId" 
                    SortExpression="TestEngineerEmployeeId" />
                <asp:BoundField DataField="Status" 
                    HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="TaskId" HeaderText="TaskId" 
                    SortExpression="TaskId" InsertVisible="False" ReadOnly="True" />
                <asp:TemplateField HeaderText="ViewArea">
                        <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewArea" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("TaskId") %>' onclick="lnkViewArea_Click">ViewArea</asp:LinkButton>
                            </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ViewMaterials">
                        <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkViewMaterial" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("TaskId") %>' onclick="lnkViewMaterials_Click">ViewMaterials</asp:LinkButton>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:IssuetrackingConnectionString3 %>" 
            
            SelectCommand="SELECT Task.TaskName, Project.ProjectName, Task.TestEngineerEmployeeId, Task.Status, Task.TaskId FROM Task INNER JOIN Project ON Task.ProjectId = Project.ProjectId">
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
