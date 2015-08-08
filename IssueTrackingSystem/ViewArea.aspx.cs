using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IssueTrackingSystem
{
    public partial class ViewArea : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            int taskid = int.Parse(Request.QueryString["arg1"]); 
            
            if (this.IsPostBack == false)
            {
                ViewAreaRefresh(taskid);
            }
        }

        protected void ViewAreaRefresh(int taskid)
        {
            Db obj = new Db();
            string sql = string.Format("SELECT TestCaseArea.AreaId, TestCaseArea.AreaName, Task.TaskName FROM Task INNER JOIN TestCaseArea ON Task.TaskId = TestCaseArea.TaskId where Task.TaskId = {0} ", taskid);
            GvViewArea.DataSource = obj.fetch(sql);
            GvViewArea.DataBind();
        }

        protected void lnkViewTestCases_Click(object sender, EventArgs e)
        {
            int AreaId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            //GridViewRow EditRow = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            string url = string.Format("ViewTestCase.aspx?arg1={0}", AreaId);
            Response.Redirect(url);
        }


    }
}