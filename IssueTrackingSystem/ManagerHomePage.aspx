<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ManagerHomePage.aspx.cs" Inherits="IssueTrackingSystem.ManagerHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 266px;
        }
        .style4
        {
            width: 165px;
        }
        .style5
        {
            width: 439px;
        }
        .style6
        {
            width: 251px;
        }
        .style7
        {
            width: 343px;
        }
        .style8
        {
            width: 159px;
        }
        .style9
        {
            width: 343px;
            height: 26px;
        }
        .style10
        {
            width: 159px;
            height: 26px;
        }
        .style11
        {
            height: 26px;
        }
        .style12
        {
            width: 208px;
        }
        .style13
        {
            width: 181px;
        }
        .style14
        {
            width: 192px;
        }
        .style17
        {
            width: 290px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Height="2274px">
        <asp:Button ID="Button1" runat="server" Text="Home" onclick="Button1_Click1" 
            CausesValidation="False" />
        <asp:Button ID="Button2" runat="server" Text="Add Employee" 
            onclick="Button2_Click" CausesValidation="False" />
        <asp:Button ID="Button3" runat="server" Text="Add Project" 
            onclick="Button3_Click" CausesValidation="False" />
        <asp:Button ID="Button4" runat="server" Text="Assign Task" 
            onclick="Button4_Click" CausesValidation="False" />
        <asp:Button ID="Button5" runat="server" Text="Edit Profile" 
            onclick="Button5_Click" CausesValidation="False" />
        <asp:Button ID="Button9" runat="server" Text="Change password" 
            onclick="Button9_Click" />
        <asp:Button ID="Button12" runat="server" Text="Discussion Forrum" 
            onclick="Button12_Click1" />
        <br />
        Welcome&nbsp;&nbsp;<asp:Label ID="LblManName" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LoginStatus ID="LoginStatus1" runat="server" 
            onloggingout="LoginStatus1_LoggingOut" />
        <br />
        <br />
        <br />
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <br />
                <br />
                <asp:GridView ID="GridView5" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
                <br />
                <br />
                <br />
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style6">
                EmployeeName</td>
            <td class="style5">
                <asp:TextBox ID="TxtEmpName" runat="server" ValidationGroup="A"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="TxtEmpName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                Designation</td>
            <td class="style5">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="161px" 
                    ValidationGroup="A">
                    <asp:ListItem>None</asp:ListItem>
                    <asp:ListItem>Developer</asp:ListItem>
                    <asp:ListItem>Tester</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="DropDownList1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                login</td>
            <td class="style5">
                <asp:TextBox ID="Txtlogin" runat="server" ValidationGroup="A"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="Txtlogin" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="LblPwd" runat="server" Text="Password"></asp:Label>
            </td>
            <td class="style5">
                <asp:TextBox ID="TxtPwd" runat="server" ValidationGroup="A"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="TxtPwd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style5">
                <asp:Button ID="Button6" runat="server" onclick="Button6_Click" Text="Save" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
            <asp:BoundField DataField="Designation" HeaderText="Designation" />
            <asp:BoundField DataField="login" HeaderText="UserId" />

           <asp:TemplateField HeaderText="Edit">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("EmployeeId") %>' onclick="lnkEmpEdit_Click">Edit</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
           

            <asp:TemplateField HeaderText="Delete">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("EmployeeId") %>' onclick="lnkEmpDelete_Click">Delete</asp:LinkButton>
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
            </asp:View>
            <asp:View ID="View3" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style4">
                ProjectName</td>
            <td class="style1">
                <asp:TextBox ID="TxtProjectName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TxtProjectName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                ProjectDescription</td>
            <td class="style1">
                <asp:TextBox ID="TxtProjDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style1">
                <asp:Button ID="Button7" runat="server" onclick="Button7_Click" Text="Save" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField HeaderText="ProjectName" DataField="ProjectName" />
                        <asp:BoundField HeaderText="ProjectDescription" 
                            DataField="ProjectDescription" />
                        <asp:TemplateField HeaderText="Edit">
                        <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("ProjectId") %>' onclick="lnkProjEdit_Click">Edit</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                        <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("ProjectId") %>' onclick="lnkProjDelete_Click">Delete</asp:LinkButton>
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
                <br />
                <asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="~/ManagerHomePage.aspx">Back</asp:HyperLink>
            </asp:View>
            <asp:View ID="View4" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style7">
                TaskName</td>
            <td class="style8">
                <asp:TextBox ID="TxtTaskName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TxtTaskName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                TestEngineerEmployeeId</td>
            <td class="style8">
                <asp:TextBox ID="TxtTEEId" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TxtTEEId" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                ImplementationEngineerEmployeeId</td>
            <td class="style8">
                <asp:TextBox ID="TxtIEEId" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="TxtIEEId" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style9">
                Status</td>
            <td class="style10">
                <asp:TextBox ID="TxtStatus" runat="server"></asp:TextBox>
            </td>
            <td class="style11">
                </td>
        </tr>
        <tr>
            <td class="style7">
                ProjectId</td>
            <td class="style8">
                <asp:TextBox ID="TxtProjectId" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="TxtProjectId" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style7">
                Duration</td>
            <td class="style8">
                <asp:TextBox ID="TxtDuration" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style8">
                <asp:Button ID="Button8" runat="server" Text="Save" onclick="Button8_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
                <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" 
                    GridLines="None" AutoGenerateColumns="False" AllowPaging="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="TaskName" HeaderText="TaskName" />
                        <asp:BoundField DataField="TestEngineerEmployeeId" HeaderText="TestEngEmpId" />
                        <asp:BoundField DataField="ImplementationEngineerEmployeeId" 
                            HeaderText="ImpEngEmpId" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:BoundField DataField="ProjectId" HeaderText="ProjectId" />
                        <asp:BoundField DataField="Duration" HeaderText="Duration" />
                        <asp:TemplateField HeaderText="Edit">
                          <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("TaskId") %>' onclick="lnkTaskEdit_Click">Edit</asp:LinkButton>
                            </ItemTemplate>
                         </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                        <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("TaskId") %>' onclick="lnkTaskDelete_Click">Delete</asp:LinkButton>
                            </ItemTemplate>
                        
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Add Material">
                        <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEditMat" runat="server" CausesValidation ="false"
                                CommandArgument='<%# Eval("TaskId") %>' onclick="lnkMaterial_Click">AddMaterial</asp:LinkButton>
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
                <br />
                <asp:HyperLink ID="HyperLink3" runat="server" 
                    NavigateUrl="~/ManagerHomePage.aspx">Back</asp:HyperLink>
            </asp:View>
            <asp:View ID="View5" runat="server">
                <table style="width:100%;">
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td class="style12">
                            Profile</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style13">
                            EmpId</td>
                        <td class="style12">
                            <asp:TextBox ID="TxtEmpId" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style13">
                            Name</td>
                        <td class="style12">
                            <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style13">
                            Email</td>
                        <td class="style12">
                            <asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style13">
                            &nbsp;</td>
                        <td class="style12">
                            <asp:Button ID="Button11" runat="server" onclick="Button11_Click" Text="Save" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style13">
                            <asp:HyperLink ID="HyperLink4" runat="server" 
                                NavigateUrl="~/ManagerHomePage.aspx">Back</asp:HyperLink>
                        </td>
                        <td class="style12">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
            </asp:View>
         <asp:View ID ="View6" runat = "server">
             <table style="width:100%;">
                 <tr>
                     <td class="style14">
                         &nbsp;</td>
                     <td class="style17">
                         Change Password</td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style14">
                         Pasword</td>
                     <td class="style17">
                         <asp:TextBox ID="TxtMail" runat="server"></asp:TextBox>
                     </td>
                     <td>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                             ControlToValidate="TxtMail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                     </td>
                 </tr>
                 <tr>
                     <td class="style14">
                         New Password</td>
                     <td class="style17">
                         <asp:TextBox ID="TxtOldPwd" runat="server"></asp:TextBox>
                     </td>
                     <td>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                             ControlToValidate="TxtNewPwd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                     </td>
                 </tr>
                 <tr>
                     <td class="style14">
                         Confirm Password</td>
                     <td class="style17">
                         <asp:TextBox ID="TxtNewPwd" runat="server" 
                             ontextchanged="TxtNewPwd_TextChanged"></asp:TextBox>
                     </td>
                     <td>
                         <asp:CompareValidator ID="CompareValidator1" runat="server" 
                             ControlToCompare="TxtOldPwd" ControlToValidate="TxtNewPwd" 
                             ErrorMessage="Password Mismatch" ForeColor="Red"></asp:CompareValidator>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                             ControlToValidate="TxtNewPwd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                         <asp:Label ID="Lblerr" runat="server"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td class="style14">
                         &nbsp;</td>
                     <td class="style17">
                         <asp:Button ID="Button10" runat="server" onclick="Button10_Click" 
                             Text="Change" />
                     </td>
                     <td>
                         &nbsp;</td>
                 </tr>
                 <tr>
                     <td class="style14">
                         <asp:HyperLink ID="HyperLink5" runat="server" 
                             NavigateUrl="~/ManagerHomePage.aspx">Back</asp:HyperLink>
                     </td>
                     <td class="style17">
                         &nbsp;</td>
                     <td>
                         &nbsp;</td>
                 </tr>
             </table>
         </asp:View>
            <asp:View ID="View7" runat="server">

                <asp:Panel ID="Panel2" runat="server" Height="434px">
                <br />
                <br />
                <br />
                    <asp:Table ID="Table1" runat="server">
                    </asp:Table>
                </asp:Panel>

            </asp:View>
        </asp:MultiView>
        <br />
    </asp:Panel>
</asp:Content>
