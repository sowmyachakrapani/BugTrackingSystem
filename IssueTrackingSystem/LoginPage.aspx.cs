using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;

namespace IssueTrackingSystem
 {
    class LoginError : Exception
    {
        private string msg;
        public LoginError(string _msg)
        {
            msg = _msg;
        }

        public override string ToString()
        {
            return msg;
        }


    }
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["username"] = Txtuser.Text;
            Session["password"] = Txtpwd.Text;
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
        //    string designation = obj.Fetchdesig(Txtuser.Text, Txtpwd.Text);
            DataTable tab = obj.FetchEmployeeDetails(Txtuser.Text, Txtpwd.Text);
            if (tab.Rows.Count > 0)
            {
                //try
                //{
                Session["EmployeeId"] = tab.Rows[0][0].ToString();
                Session["EmployeeName"] = tab.Rows[0][1].ToString();
                string designation = tab.Rows[0][2].ToString();

                // string employeeid = obj.FetchEmployeeId(Txtuser.Text, Txtpwd.Text);
                //  Session["EmployeeId"] = employeeid;
                if (designation == "Manager")
                {
                    Response.Redirect("ManagerHomePage.aspx");
                }
                else if (designation == "Developer")
                {
                    Response.Redirect("DeveloperHomePage.aspx");
                }
                else
                {
                    Response.Redirect("TesterHomePage.aspx");

                }
            }
            else
            {
                //Response.Write("Login Failed, try again");
                msg.InnerText= "login failed try again";
            }
    

             }
            //catch (LoginError err)
            //{
            //    Response.Write(err);
            //}
        }
    }
