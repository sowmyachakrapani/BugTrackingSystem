using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace IssueTrackingSystem
{
    public partial class Topics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Db obj = new Db();
            if(this.IsPostBack==false)
            {
                TxtTopicName.Text = "";
                DrpProjectName.DataSource = obj.FetchProjectName();
                DrpProjectName.DataTextField = "ProjectName";
                DrpProjectName.DataValueField = "ProjectId";
                DrpProjectName.DataBind();
                TableDisplay();
               
             }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            int empid = int.Parse(Session["EmployeeId"].ToString());
            obj.FillTopic(TxtTopicName.Text,empid,DateTime.Now.ToString(),int.Parse(DrpProjectName.SelectedItem.Value));
            
            Response.Write("<script>alert('Topic saved successfully')</script>");
            if (this.IsPostBack == true)
            {
                TxtTopicName.Text = "";
                
            }
            TableDisplay();
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
                    TableRow row1 = new TableRow();
                    TableRow row2 = new TableRow();
                    c1.Text = topicid;
                    c2.Text = "<a href=Comments.aspx?q=" + topicid + ">" + topicname + "</a>";
                    c3.Text = "EmployeeName:" + empname;
                    c4.Text = "Designation:" + designation;

                    row1.Controls.Add(c1);
                    row1.Controls.Add(c2);
                    row2.Controls.Add(c3);
                    row2.Controls.Add(c4);
                    Table1.Controls.Add(row1);
                    Table1.Controls.Add(row2);
                }

            }
        }
    }
}