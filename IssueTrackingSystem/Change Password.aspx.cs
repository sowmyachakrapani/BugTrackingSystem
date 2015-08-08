using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IssueTrackingSystem
{
    public partial class Change_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            if (TxtMail.Text == Session["password"].ToString())
            {
                obj.FillUpdatedPassword(TxtOldPwd.Text, Session["username"].ToString());
                TxtMail.Text = "";
                TxtOldPwd.Text = "";
                TxtNewPwd.Text = "";

            }
            else
            {
                Lblerr.Text = "Password does not match with the existing record's password";
            }
        }
    }
}