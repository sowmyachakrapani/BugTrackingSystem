using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IssueTrackingSystem
{
    public partial class ViewTestCase : System.Web.UI.Page
    {
        public static int Id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            int AreaId = int.Parse(Request.QueryString["arg1"]);
            Id = AreaId;
            
            if (this.IsPostBack == false)
            {
                ViewTestCaseRefresh(AreaId);
            }
        }

        protected void ViewTestCaseRefresh(int AreaId)
        {
            Db obj = new Db();
            string sql = string.Format("SELECT TestCase.TestCaseId, TestCase.TestCaseDescription, TestCase.ExpectedOutput, TestCase.ActualOutput,TestCase.Status,TestCase.Severity,TestCase.Visibility,TestCaseArea.AreaName FROM TestCase INNER JOIN TestCaseArea ON TestCase.AreaId = TestCaseArea.AreaId where TestCaseArea.AreaId = {0} ", AreaId);
           // SELECT TestCase.TestCaseDescription, TestCase.ExpectedOutput, TestCase.ActualOutput, TestCase.Status, TestCase.Severity, TestCase.Visibility, TestCaseArea.AreaName FROM TestCase INNER JOIN TestCaseArea ON TestCase.AreaId = TestCaseArea.AreaId
            GvViewTestCase.DataSource = obj.fetch(sql);
            GvViewTestCase.DataBind();
        }

        protected void lnkTestCaseFix_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            int TestCaseId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            string sql = string.Format("update Testcase set Status='fixed' where TestCaseId={0}", TestCaseId);
            if (obj.DoTransaction(sql))
            {
                Response.Write("<script language='javascript'>alert('updated successfully')</script>");

            }
            string query = string.Format("select TestCase.TestCaseId,TestCase.TestCaseDescription, TestCase.ExpectedOutput, TestCase.ActualOutput,TestCase.Status,TestCase.Severity,TestCase.Visibility,TestCaseArea.AreaName FROM TestCase INNER JOIN TestCaseArea ON TestCase.AreaId = TestCaseArea.AreaId where TestCaseArea.AreaId = {0} and Status<>'Fixed'", Id);
            GvViewTestCase.DataSource = obj.fetch(query);
            GvViewTestCase.DataBind();
        }
        }
    }

