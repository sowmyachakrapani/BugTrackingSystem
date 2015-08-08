<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="IssueTrackingSystem.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <asp:Panel ID="Panel2" runat="server">
         <table style="width:100%; height: 468px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td style="font-family: 'Times New Roman', Times, serif; font-size: medium">
                    CloudTech Software is a leading provider of business software solutions<br /> 
                    &nbsp;headquartered in India. With its ambitious plans, CloudTech Software has<br /> 
                    &nbsp;diversified into niche sectors of Cloud Consulting Services, SmartPhone 
                    Applications Development, Enterprise Applications, Web Applications and Data 
                    Integration Services. Decades of expertise in the areas of technology based 
                    solutions, for customers in the healthcare, financial, educational and 
                    engineering disciplines, has enabled our specialization.</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="font-size: medium; font-family: 'Times New Roman', Times, serif">
                    What we do ? CloudTech Software can cater to a variety of your technology 
                    needs,from management consulting services to development and deployment of 
                    your... Read More</td>
                <td style="font-size: medium; font-family: 'Times New Roman', Times, serif">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Our Process CloudTech Software offers flexible
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; methodologies to changing
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; client requirements. We adhere to dynamic<br /> 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; implementations... Read More</td>
                <td style="font-family: 'Times New Roman', Times, serif; font-size: medium">
                    Why Choose Us ? CloudTech Software is a leading provider of business software 
                    solutions worldwide... Read More</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="45px" 
                        ImageUrl="~/images/social_8-128.png" onclick="ImageButton2_Click" />
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="42px" 
                        ImageUrl="~/images/facebook_right-128.png" onclick="ImageButton1_Click" 
                        Width="48px" />
                </td>
                <td>
                    <asp:ImageButton ID="ImageButton3" runat="server" Height="36px" 
                        ImageUrl="~/images/Flurry_Google_Gmail_Alt.png" 
                        onclick="ImageButton3_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        </asp:Panel>
</asp:Panel>
</asp:Content>
