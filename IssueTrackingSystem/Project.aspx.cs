using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IssueTrackingSystem
{
    public partial class Project : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            obj.FillProject(TxtProjectName.Text,TxtProjDesc.Text);
            Response.Write("<script>alert('Project saved successfully')</script>");
            if (this.IsPostBack == true)
            {
                TxtProjectName.Text = "";

            }
        }
    }
}