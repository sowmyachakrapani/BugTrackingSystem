using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace IssueTrackingSystem
{
    public partial class CommentsManager : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                TableDisplay();
            }
        }
        

        protected void TableDisplay()
        {
            Db obj = new Db();
                
            int topicid = int.Parse(Request.QueryString["q"].ToString());
            string sql = string.Format("Select count(*) from Comments");
            DataTable tab = obj.fetch(sql);
            if (tab.Rows.Count > 0)
            {
                string joinquery = string.Format("select Comments.CommentId,Comments.Comment,Employee.EmployeeName,Employee.Designation from Comments inner join Employee on Comments.EmployeeId=Employee.EmployeeId where Comments.TopicId ={0}", topicid);
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
                    TableCell dellcell = new TableCell();
                    ImageButton btn = new ImageButton();
                    btn.ImageUrl = "images/delete.png";
                    btn.CommandArgument = commentid;
                    btn.Click += new ImageClickEventHandler(btn_Click);
                    dellcell.Controls.Add(btn);
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
                    row1.Controls.Add(dellcell);
                    Table1.Controls.Add(row1);
                    Table1.Controls.Add(row2);

                }

            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            ImageButton btn = (ImageButton)sender;
            string commentid = btn.CommandArgument;
            string query = string.Format("delete from Comments where CommentId={0}", commentid);
            TableDisplay();
            
        }


    }
}