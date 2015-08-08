using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IssueTrackingSystem
{
    public partial class Task : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            obj.FillTask(TxtTaskName.Text, TxtTEEId.Text, TxtIEEId.Text, TxtStatus.Text, int.Parse(TxtProjectId.Text), TxtDuration.Text);
        }
    }
}