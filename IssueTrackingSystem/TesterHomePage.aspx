<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="TesterHomePage.aspx.cs" Inherits="IssueTrackingSystem.TesterHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="790px">
        <asp:Button ID="Button1" runat="server" Text="Home" onclick="Button1_Click" 
            style="height: 26px" />
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
            Text="Assigned Tasks" />
        <asp:Button ID="Button3" runat="server" Text="Discussion Forum" 
            onclick="Button3_Click1" />
        <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="TaskName" HeaderText="TaskName" />
                        <asp:BoundField DataField="ProjectName" HeaderText="ProjectName" />
                        <asp:BoundField DataField="TestEngineer" HeaderText="TestEngineer" />
                        <asp:BoundField DataField="Developer" HeaderText="Developer" />
                        <asp:HyperLinkField HeaderText="ViewArea" Text="ViewArea" 
                            NavigateUrl="~/TestViewArea.aspx" />
                        <asp:HyperLinkField HeaderText="ViewMaterials" Text="ViewMaterials" 
                            NavigateUrl="~/ViewMaterials.aspx" />
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
                    SelectCommand="SELECT Task.TaskName, Project.ProjectName, Employee.EmployeeName, Task.TestEngineerEmployeeId, Task.ImplementationEngineerEmployeeId FROM Task INNER JOIN Project ON Task.ProjectId = Project.ProjectId INNER JOIN Employee ON Task.ImplementationEngineerEmployeeId = Employee.EmployeeId AND Task.TestEngineerEmployeeId = Employee.EmployeeId">
                </asp:SqlDataSource>
                <br />
                <br />
                <br />
                <br />
                <br />
            </asp:View>
            <asp:View ID="View3" runat="server">
            </asp:View>
        </asp:MultiView>
    </asp:Panel>
</asp:Content>
