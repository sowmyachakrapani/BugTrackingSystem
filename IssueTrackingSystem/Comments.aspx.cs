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
    public partial class Comments : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            Db obj = new Db();
          if(this.IsPostBack==false)
          {
              string sql = string.Format("select TopicName from Topics where TopicId={0}",int.Parse(Request.QueryString["q"].ToString()));
              DataTable tab = obj.fetch(sql);
              lblTopic.Text = tab.Rows[0][0].ToString();
              TxtComment.Text="";
              TableDisplay();
          }
        }

     
        protected void TableDisplay()
        {
            Db obj = new Db();
            int topicid = int.Parse(Request.QueryString["q"].ToString());
            string sql = string.Format("Select count(*) from Comments");
            DataTable tab = obj.fetch(sql);
            if(tab.Rows.Count>0)
            {
            string joinquery = string.Format("select Comments.CommentId,Comments.Comment,Employee.EmployeeName,Employee.Designation from Comments inner join Employee on Comments.EmployeeId=Employee.EmployeeId where Comments.TopicId ={0}",topicid);
            DataTable buffer = obj.fetch(joinquery);
            for (int i = 0; i < buffer.Rows.Count; i++)
            {
                string commentid = buffer.Rows[i][0].ToString();
                string comment = buffer.Rows[i][1].ToString();
                string empname = buffer.Rows[i][2].ToString();
                string designation = buffer.Rows[i][3].ToString();
                TableCell c1 = new TableCell();
                TableCell c2 = new TableCell();
                TableCell c3 = new TableCell();
                TableCell c4 = new TableCell();
                TableRow row1 = new TableRow();
                TableRow row2 = new TableRow();
                c1.Text = commentid;
                c2.Text = comment;
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

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Db obj = new Db();
            int empid = int.Parse(Session["EmployeeId"].ToString());
            int topicid = int.Parse(Request.QueryString["q"].ToString());
            string query = string.Format("Select ProjectId from Topics where TopicId={0}", topicid);
            DataTable buffer = obj.fetch(query);
            int projectid = int.Parse(buffer.Rows[0][0].ToString());
            obj.FillComment(TxtComment.Text, empid, DateTime.Now.ToString(), topicid, projectid);
            Response.Write("<script>alert('Comment saved successfully')</script>");
            if (this.IsPostBack == true)
            {
                TxtComment.Text = "";
                TableDisplay();
            }

        }
    }
}