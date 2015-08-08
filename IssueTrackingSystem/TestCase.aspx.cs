using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IssueTrackingSystem
{
    public partial class TestCase : System.Web.UI.Page
    {
        public static int TestCaseId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Db obj = new Db();
            if (this.IsPostBack == false)
            {
                DrpTestCaseArea.DataSource = obj.FetchAreaName();
                DrpTestCaseArea.DataTextField = "AreaName";
                DrpTestCaseArea.DataValueField = "AreaId";
                DrpTestCaseArea.DataBind();
                TestCaseRefresh();
          

            }

        }

        protected void lnkTestCaseEdit_Click(object sender, EventArgs e)
        {
            TestCaseId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            GridViewRow EditRow = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            TxtTestCaseDesc.Text = EditRow.Cells[0].Text;
            TxtExpectedOp.Text = EditRow.Cells[1].Text;
            TxtActualOp.Text = EditRow.Cells[2].Text;
            DrpStatus.SelectedItem.Text = EditRow.Cells[3].Text;
            DrpSeverity.SelectedItem.Text= EditRow.Cells[4].Text;
            DrpVisibility.SelectedItem.Text= EditRow.Cells[5].Text;
            DrpTestCaseArea.SelectedItem.Text = EditRow.Cells[6].Text;
            Button1.Text = "Update";
        }


        

        protected void lnkTestCaseDelete_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            int TestCaseId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            string query = string.Format("delete TestCase where TestCaseId= {0}", TestCaseId);
           
            if (obj.DoTransaction(query))
            {
                Response.Write("<script language='javaScript'>alert('Deleted TestCase Successfully');</script>");
            }
            TestCaseRefresh();

        }
        protected void TestCaseRefresh()
        {
            Db obj = new Db();
            TxtActualOp.Text = "";
            TxtExpectedOp.Text = "";
            TxtTestCaseDesc.Text = "";
            DrpSearchStatus.SelectedItem.Text = "None";
            DrpSeverity.SelectedItem.Text = "None";
            DrpStatus.SelectedItem.Text = "None";
            DrpTestCaseArea.SelectedItem.Text = "None";
            DrpVisibility.SelectedItem.Text = "None";
            string sql = string.Format("select TestCaseId,TestCaseDescription,ExpectedOutput,ActualOutput,Status,Severity,Visibility,(Select AreaName from TestCaseArea where AreaId=TestCase.AreaId) as TestCaseAreaName from TestCase");
            GridView1.DataSource = obj.GetProjects(sql);
            GridView1.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "Save")
            {
                Db obj = new Db();
                obj.FillTestCase(TxtTestCaseDesc.Text, TxtActualOp.Text, TxtExpectedOp.Text, DrpStatus.SelectedItem.Value, DrpSeverity.SelectedItem.Value, DrpVisibility.SelectedItem.Text, DrpTestCaseArea.SelectedItem.Value);
                TestCaseRefresh();
            }
            else if (Button1.Text == "Update")
            {
                Db obj = new Db();
                obj.FillUpdatedTestCase(TxtTestCaseDesc.Text, TxtActualOp.Text, TxtExpectedOp.Text, DrpStatus.SelectedItem.Value, DrpSeverity.SelectedItem.Value, DrpVisibility.SelectedItem.Text, int.Parse(DrpTestCaseArea.SelectedItem.Value),TestCaseId);
                TestCaseRefresh();
    

            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            string sql = string.Format("select TestCaseId,TestCaseDescription,ExpectedOutput,ActualOutput,Status,Severity,Visibility,(Select AreaName from TestCaseArea where AreaId=TestCase.AreaId) as TestCaseAreaName from TestCase where Status ='{0}'",DrpSearchStatus.SelectedValue);
            GridView1.DataSource = obj.GetProjects(sql);
            GridView1.DataBind();
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TestCaseRefresh();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Db obj = new Db();
            GridView1.PageIndex = e.NewPageIndex;
            string sql = string.Format("select TestCaseId,TestCaseDescription,ExpectedOutput,ActualOutput,Status,Severity,Visibility,(Select AreaName from TestCaseArea where AreaId=TestCase.AreaId) as TestCaseAreaName from TestCase");
            GridView1.DataSource = obj.GetProjects(sql);
            GridView1.DataBind();


        }
    }
}