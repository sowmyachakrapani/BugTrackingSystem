using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IssueTrackingSystem
{
    public partial class ViewMaterials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int taskid = int.Parse(Request.QueryString["arg1"]); 
            
            if (this.IsPostBack == false)
            {
                ViewMaterialsRefresh(taskid);
            }
        }

        protected void ViewMaterialsRefresh(int taskid)
        {
            Db obj = new Db();
            string sql = string.Format("SELECT Material.MaterialName, Material.Description, Material.Filepath, Task.TaskName, Material.MaterialId FROM Material INNER JOIN Task ON Material.TaskId = Task.TaskId where Task.TaskId = {0} ", taskid);
            GridView1.DataSource = obj.fetch(sql);
            GridView1.DataBind();
        }

        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            LinkButton lnkDownload = sender as LinkButton;
            GridViewRow gvrow = lnkDownload.NamingContainer as GridViewRow;
            string filePath = GridView1.DataKeys[gvrow.RowIndex].Value.ToString();
            Response.Redirect("download.aspx?file=" + filePath);

        }

        }
    }
