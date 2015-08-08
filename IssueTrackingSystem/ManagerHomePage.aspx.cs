using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Xml;

namespace IssueTrackingSystem
{
    public partial class ManagerHomePage : System.Web.UI.Page
    {
        static int EditId = 0, ProjId = 0, TasId = 0, MaterialId = 0;


        protected void Page_Load(object sender, EventArgs e)
        {
            LblManName.Text = Session["username"].ToString();
        
        
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View2);
            if (this.IsPostBack == true)
            {
                Db obj = new Db();
                string sql = string.Format("Select EmployeeId,EmployeeName,Designation,login from Employee where Designation in ('Tester','Developer')");
                GridView1.DataSource = obj.GetEmployees(sql);
                GridView1.DataBind();
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View3);
            if (this.IsPostBack == true)
            {
                Db obj = new Db();
                string sql = string.Format("Select * from Project");
                GridView2.DataSource = obj.GetProjects(sql);
                GridView2.DataBind();

            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View4);
            if (this.IsPostBack == true)
            {
                Db obj = new Db();
                string sql = string.Format("Select * from Task");
                GridView3.DataSource = obj.GetProjects(sql);
                GridView3.DataBind();
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View5);
            Db obj = new Db();
            string username = Session["username"].ToString();
            string sql = string.Format("select EmployeeId from Employee where login = '{0}'", username);
            TxtEmpId.Text = obj.FetchEmpId(sql);

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (Button6.Text == "Save")
            {

                Db obj = new Db();
                obj.FillEmp(TxtEmpName.Text, DropDownList1.SelectedItem.Value, Txtlogin.Text, TxtPwd.Text);
                Response.Write("<script>alert('Employee saved successfully')</script>");
                Refresh();
                if (this.IsPostBack == true)
                {

                    TxtEmpName.Text = "";
                    DropDownList1.SelectedIndex = 0;
                    Txtlogin.Text = "";
                    TxtPwd.Text = "";


                }
            }
            else if (Button6.Text == "Update")
            {

                Db obj = new Db();
                //                EditId = Convert.ToInt32((Button)sender);
                obj.FillUpdatedEmp(TxtEmpName.Text, DropDownList1.SelectedItem.Value, Txtlogin.Text, TxtPwd.Text, EditId);
                Response.Write("<script>alert('Employee updated successfully')</script>");
                Refresh();
                //TxtEmpId.Text = "";
                TxtEmpName.Text = "";
                DropDownList1.SelectedIndex = 0;
                Txtlogin.Text = "";
                TxtPwd.Text = "";


            }
        }




        protected void Button1_Click1(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View1);
            DataSet ds = new DataSet();
            ds.ReadXml("http://projectmanagement.ittoolbox.com/rss/29/white_papers");
            GridView5.DataSource = ds.Tables[3];
            GridView5.DataBind();

        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            if (Button7.Text == "Save")
            {
                Db obj = new Db();
                obj.FillProject(TxtProjectName.Text, TxtProjDesc.Text);
                Response.Write("<script>alert('Project saved successfully')</script>");
                ProjRefresh();
                if (this.IsPostBack == true)
                {
                    TxtProjectName.Text = "";
                    TxtProjDesc.Text = "";

                }
            }
            else if (Button7.Text == "Update")
            {
                Db obj = new Db();
                obj.FillUpdatedProj(TxtProjectName.Text, TxtProjDesc.Text, ProjId);
                Response.Write("<script>alert('Project updated successfully')</script>");
                ProjRefresh();
                TxtProjectName.Text = "";
                TxtProjDesc.Text = "";


            }


        }

        protected void lnkEmpEdit_Click(object sender, EventArgs e)
        {
            EditId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            GridViewRow EditRow = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            //  TxtEmpId.Text = EditRow.Cells[0].Text;
            TxtEmpName.Text = EditRow.Cells[0].Text;
            if (EditRow.Cells[1].Text == "Developer")
            {
                DropDownList1.SelectedIndex = 1;
            }
            else
            {
                DropDownList1.SelectedIndex = 2;
            }
            Txtlogin.Text = EditRow.Cells[2].Text;
            TxtPwd.Visible = Convert.ToBoolean("false");
            LblPwd.Visible = Convert.ToBoolean("false");
            Button6.Text = "Update";

        }
        protected void lnkProjEdit_Click(object sender, EventArgs e)
        {
            ProjId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            GridViewRow EditRow = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            TxtProjectName.Text = EditRow.Cells[0].Text;
            TxtProjDesc.Text = EditRow.Cells[1].Text;
            Button7.Text = "Update";

        }
        protected void lnkTaskEdit_Click(object sender, EventArgs e)
        {
            TasId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            GridViewRow EditRow = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            TxtTaskName.Text = EditRow.Cells[0].Text;
            TxtTEEId.Text = EditRow.Cells[1].Text;
            TxtIEEId.Text = EditRow.Cells[2].Text;
            TxtStatus.Text = EditRow.Cells[3].Text;
            TxtProjectId.Text = EditRow.Cells[4].Text;
            TxtDuration.Text = EditRow.Cells[5].Text;
            Button8.Text = "Update";

        }
        protected void lnkMaterial_Click(object sender, EventArgs e)
        {
            MaterialId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            //GridViewRow EditRow = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            string url = string.Format("Material.aspx?arg1={0}", MaterialId);
            Response.Redirect(url);
        }

        protected void lnkEmpDelete_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            int DeleteId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            string query = string.Format("delete Employee where EmployeeId= {0}", DeleteId);
            if (obj.DoTransaction(query))
            {
                Response.Write("<script language='javaScript'>alert('Deleted Values Successfully');</script>");
            }
            Refresh();
        }

        protected void lnkProjDelete_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            int DeleteId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            string query = string.Format("delete Project where ProjectId= {0}", DeleteId);
            if (obj.DoTransaction(query))
            {
                Response.Write("<script language='javaScript'>alert('Deleted Values Successfully');</script>");
            }
            ProjRefresh();
        }

        protected void lnkTaskDelete_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            int DeleteId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            string query = string.Format("delete Task where TaskId= {0}", DeleteId);
            if (obj.DoTransaction(query))
            {
                Response.Write("<script language='javaScript'>alert('Deleted Values Successfully');</script>");
            }
            TaskRefresh();
        }
        protected void Button8_Click(object sender, EventArgs e)
        {
            if (Button8.Text == "Save")
            {
                Db obj = new Db();
                obj.FillTask(TxtTaskName.Text, TxtTEEId.Text, TxtIEEId.Text, TxtStatus.Text, int.Parse(TxtProjectId.Text), TxtDuration.Text);
                Response.Write("<script>alert('Task saved successfully')</script>");
                TaskRefresh();
                if (this.IsPostBack == true)
                {
                    TxtTaskName.Text = "";
                    TxtTEEId.Text = "";
                    TxtIEEId.Text = "";
                    TxtStatus.Text = "";
                    TxtProjectId.Text = "";
                    TxtDuration.Text = "";

                }
            }
            else if (Button8.Text == "Update")
            {
                Db obj = new Db();
                obj.FillUpdatedTask(TxtTaskName.Text, TxtTEEId.Text, TxtIEEId.Text, TxtStatus.Text, int.Parse(TxtProjectId.Text), TxtDuration.Text, TasId);
                Response.Write("<script>alert('Task updated successfully')</script>");
                TaskRefresh();
                TxtTaskName.Text = "";
                TxtTEEId.Text = "";
                TxtIEEId.Text = "";
                TxtStatus.Text = "";
                TxtProjectId.Text = "";
                TxtDuration.Text = "";

            }
        }
        protected void Refresh()
        {
            Db obj = new Db();
            string sql = string.Format("Select EmployeeId,EmployeeName,Designation,login from Employee where Designation in ('Tester','Developer')");
            GridView1.DataSource = obj.GetEmployees(sql);
            GridView1.DataBind();
        }
        protected void ProjRefresh()
        {
            Db obj = new Db();
            string sql = string.Format("Select * from Project");
            GridView2.DataSource = obj.GetProjects(sql);
            GridView2.DataBind();
        }
        protected void TaskRefresh()
        {
            Db obj = new Db();
            string sql = string.Format("Select * from Task");
            GridView3.DataSource = obj.GetProjects(sql);
            GridView3.DataBind();

        }



        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Response.Write("<script>Windows.top.Navigate('LoginPage.aspx')</script>");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View6);
        }

        protected void TxtNewPwd_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            obj.FillUpdatedEmpProfile(TxtName.Text, TxtEmail.Text, int.Parse(TxtEmpId.Text));
            Response.Write("<script>alert('Profile updated successfully')</script>");
            TxtName.Text = "";
            TxtEmail.Text = "";

        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            if (TxtMail.Text == Session["password"].ToString())
            {
                string username = Session["username"].ToString();
                obj.FillUpdatedPassword(TxtOldPwd.Text,username);
                TxtMail.Text = "";
                TxtOldPwd.Text = "";
                TxtNewPwd.Text = "";

            }
            else
            {
                Lblerr.Text = "Password does not match with the existing record's password";
            }
        }

        protected void Button12_Click1(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(View7);
            Db obj = new Db();
            if (this.IsPostBack == true)
            {
                TableDisplay();
            }
        }

        protected void TableDisplay()
        {
            Db obj = new Db();
            string sql = string.Format("Select count(*) from Topics");
            DataTable tab = obj.fetch(sql);
            if (tab.Rows.Count > 0)
            {
                string joinquery = string.Format("select Topics.TopicId,Topics.TopicName,Employee.EmployeeName,Employee.Designation from Topics inner join Employee on Topics.PostedBy=Employee.EmployeeId");
                // string sql = string.Format("select * from Topics");
                //   string query = string.Format("select EmployeeName,Designation from Employee where EmployeeId={0}", int.Parse(Session["EmployeeId"].ToString()));
                //  DataTable tab = obj.fetch(query);
                DataTable buffer = obj.fetch(joinquery);
                for (int i = 0; i < buffer.Rows.Count; i++)
                {
                    string topicid = buffer.Rows[i][0].ToString();
                    string topicname = buffer.Rows[i][1].ToString();
                    string empname = buffer.Rows[i][2].ToString();
                    string designation = buffer.Rows[i][3].ToString();
                    TableCell c1 = new TableCell();
                    TableCell c2 = new TableCell();
                    TableCell c3 = new TableCell();
                    TableCell c4 = new TableCell();
                    TableCell dellcell = new TableCell();
                    TableRow row1 = new TableRow();
                    TableRow row2 = new TableRow();
                    ImageButton btn = new ImageButton();
                    btn.ImageUrl = "images/delete.png";
                    btn.CommandArgument = topicid;
                    btn.Click += new ImageClickEventHandler(btn_Click);
                    dellcell.Controls.Add(btn);
                    c1.Text = topicid;
                    c2.Text = "<a href=CommentsManager.aspx?q=" + topicid + ">" + topicname + "</a>";
                    c3.Text = "EmployeeName:" + empname;
                    c4.Text = "Designation:" + designation;

                    row1.Controls.Add(c1);
                    row1.Controls.Add(c2);
                    row2.Controls.Add(c3);
                    row2.Controls.Add(c4);
                    row1.Controls.Add(dellcell);
                    Table1.Controls.Add(row1);
                    Table1.Controls.Add(row2);
                  
                }

            }
        }

          private void btn_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            ImageButton btn = (ImageButton)sender;
            string topicid = btn.CommandArgument;
            string query = string.Format("delete from Comments where TopicId={0}", topicid);
            if (obj.DoTransaction(query))
            {
                string sql = string.Format("delete from Topics where TopicId={0}",topicid);
                Response.Write("<script language='javaScript'>alert('Deleted Values Successfully');</script>");
            }
            TableDisplay();
        }
    }
}