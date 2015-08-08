using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IssueTrackingSystem
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack == false)
             {
                 Db obj = new Db();
                 string sql = string.Format("Select EmployeeId,EmployeeName,Designation,login from Employee where Designation in ('Tester','Developer')");
                 GridView1.DataSource = obj.GetEmployees(sql);
                 GridView1.DataBind();
                 

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            obj.FillEmp(TxtEmpName.Text, DropDownList1.SelectedItem.Value, Txtlogin.Text, TxtPwd.Text);
            Response.Write("<script>alert('Employee saved successfully')</script>");
             if (this.IsPostBack == true)
            {
                TxtEmpName.Text = "";
                Txtlogin.Text = "";
                TxtPwd.Text = "";

            }
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            int EditId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            GridViewRow EditRow = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            TxtEmpName.Text = EditRow.Cells[1].Text;
            DropDownList1.SelectedItem.Value = EditRow.Cells[2].Text;
            Txtlogin.Text = EditRow.Cells[3].Text;
            TxtPwd.Text = EditRow.Cells[4].Text;
            Button1.Text = "Update";              
        }
        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            int DeleteId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            string query = string.Format("delete Employee where EmployeeId= {0}",DeleteId);
            if (obj.DoTransaction(query))
            {
                Response.Write("<script language='javaScript'>alert('Deleted Values Successfully');</script>");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}