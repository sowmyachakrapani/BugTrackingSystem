using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IssueTrackingSystem
{
    public partial class TaskAssigned : System.Web.UI.Page
    {
        private static int TaskId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack == false)
            {
                //TaskAssignedRefresh(Taskid);
            }

        }

        protected void lnkViewArea_Click(object sender, EventArgs e)
        {
            TaskId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            //GridViewRow EditRow = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            string url = string.Format("ViewArea.aspx?arg1={0}", TaskId);
            Response.Redirect(url);

        }

        protected void lnkViewMaterials_Click(object sender, EventArgs e)
        {
            TaskId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            //GridViewRow EditRow = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            string url = string.Format("ViewMaterials.aspx?arg1={0}", TaskId);
            Response.Redirect(url);

        }
    }
}