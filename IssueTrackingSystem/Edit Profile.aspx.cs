using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IssueTrackingSystem
{
    public partial class Edit_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Db obj = new Db();
            string username = Session["username"].ToString();
            string sql = string.Format("select EmployeeId from Employee where login = '{0}'", username);
            TxtEmpId.Text = obj.FetchEmpId(sql);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            obj.FillUpdatedEmpProfile(TxtName.Text, TxtEmail.Text, int.Parse(TxtEmpId.Text));
            Response.Write("<script>alert('Profile updated successfully')</script>");
            TxtName.Text = "";
            TxtEmail.Text = "";
        }
    }
}