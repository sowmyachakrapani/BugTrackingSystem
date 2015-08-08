using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IssueTrackingSystem
{
    public partial class TestViewArea : System.Web.UI.Page
    {
        public static int AreaId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
           // int TaskId = int.Parse(Request.QueryString["arg1"]); 
            
            Db obj = new Db();
            if (this.IsPostBack == false)
            {
                TxtTestCaseAreaName.Text = "";
                DropDownList1.DataSource = obj.FetchTaskName();
                DropDownList1.DataTextField = "TaskName";
               DropDownList1.DataValueField = "TaskId";
                DropDownList1.DataBind();
                TestCaseAreaRefresh();

            }

        }

        protected void lnkTestViewAreaDelete_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            int AreaId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            string query = string.Format("Delete from TestCaseArea where AreaId={0}",AreaId);
            if (obj.DoTransaction(query))
            {
               Response.Write("<script language='javaScript'>alert('Deleted Values Successfully');</script>");
            }
         }


        protected void lnkTestViewAreaEdit_Click(object sender , EventArgs e)
        {
            AreaId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            GridViewRow EditRow = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            TxtTestCaseAreaName.Text = EditRow.Cells[0].Text;
            DropDownList1.SelectedItem.Text = EditRow.Cells[1].Text;
            Button1.Text = "Update";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Button1.Text == "Add")
            {
                Db obj = new Db();
                obj.FillTestCaseArea(TxtTestCaseAreaName.Text, int.Parse(DropDownList1.SelectedItem.Value));
                Response.Write("<script>alert('TestCaseArea saved successfully')</script>");
                TestCaseAreaRefresh();
                if (this.IsPostBack == true)
                {
                    TxtTestCaseAreaName.Text = "";
                    DropDownList1.DataSource = obj.FetchTaskName();
                    DropDownList1.DataTextField = "TaskName";
                    DropDownList1.DataValueField = "TaskId";
                    DropDownList1.DataBind();

                }
            }
            else if (Button1.Text == "Update")
            {
                Db obj = new Db();
                obj.FillUpdatedTestCaseArea(TxtTestCaseAreaName.Text, int.Parse(DropDownList1.SelectedValue),AreaId);
                Response.Write("<script>alert('TestCaseArea updated successfully')</script>");
                TestCaseAreaRefresh();
                TxtTestCaseAreaName.Text = "";
                DropDownList1.DataSource = obj.FetchTaskName();
                DropDownList1.DataTextField = "TaskName";
                DropDownList1.DataValueField = "TaskId";
                DropDownList1.DataBind();


            }
         
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
                Db obj = new Db();
                TxtTestCaseAreaName.Text = "";
                DropDownList1.DataSource = obj.FetchTaskName();
                DropDownList1.DataTextField = "TaskName";
                DropDownList1.DataValueField = "TaskId";
                DropDownList1.DataBind();
        }
        protected void TestCaseAreaRefresh()
        {
            Db obj = new Db();
            string sql = string.Format("SELECT TestCaseArea.AreaId ,TestCaseArea.AreaName, Task.TaskName FROM TestCaseArea INNER JOIN Task ON TestCaseArea.TaskId = Task.TaskId");
            GridView2.DataSource = obj.GetProjects(sql);
            GridView2.DataBind();
        }
        protected void lnkViewTestCases_Click(object sender, EventArgs e)
        {


        }
        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Db obj = new Db();
            GridView2.PageIndex = e.NewPageIndex;
            string sql = string.Format("SELECT TestCaseArea.AreaId ,TestCaseArea.AreaName, Task.TaskName FROM TestCaseArea INNER JOIN Task ON TestCaseArea.TaskId = Task.TaskId");
            GridView2.DataSource = obj.GetProjects(sql);
            GridView2.DataBind();


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    

    }
}