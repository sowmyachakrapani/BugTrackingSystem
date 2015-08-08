using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IssueTrackingSystem
{
    public partial class TesterHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View1);
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View2);
            Db obj = new Db();
            string sql = string.Format("select Task.TaskName,Project.ProjectName,(select EmployeeName from Employee where EmployeeId=Task.TestEngineerEmployeeId) as TestEngineer,(select EmployeeName from Employee where EmployeeId=Task.ImplementationEngineerEmployeeId) as Developer from Task INNER JOIN Project ON Task.ProjectId=Project.ProjectId");
            GridView1.DataSource = obj.GetEmployees(sql);
            GridView1.DataBind();
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View3);
        }
    }
}