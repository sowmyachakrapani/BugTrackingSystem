using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace IssueTrackingSystem
{
    public partial class Material : System.Web.UI.Page
    {
        public static int MaterialId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            int taskid = int.Parse(Request.QueryString["arg1"]);  
           if (this.IsPostBack == false)
           {
               MaterialRefresh(taskid);
           }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            if (Button1.Text == "Save")
            {
               
                Db obj = new Db();
               
                //obj.FillMaterial(TxtMaterialName.Text, TxtDesc.Text, int.Parse(TxtTaskId.Text), TxtFilePath.Text);
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("Files/" + filename));
                string file = "Files/" + filename;
                obj.FillMaterial(TxtMaterialName.Text, TxtDesc.Text, int.Parse(TxtTaskId.Text), file);
                Response.Write("<script>alert('Material saved successfully')</script>");
                MaterialRefresh(int.Parse(TxtTaskId.Text));
                if (this.IsPostBack == true)
                {
                    clear();
                }
            }
            else if (Button1.Text == "Update")
            {
                Db obj = new Db();
                //int MaterialId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (filename == "")
                {
                    obj.FillUpdatedMaterialwithoutFileName(TxtMaterialName.Text, TxtDesc.Text, int.Parse(TxtTaskId.Text), MaterialId);
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("Files/" + filename));
                    string file = "Files/" + filename;
                    // obj.FillUpdatedMaterial(TxtMaterialName.Text, TxtDesc.Text, int.Parse(TxtTaskId.Text), TxtFilePath.Text);
                    obj.FillUpdatedMaterial(TxtMaterialName.Text, TxtDesc.Text, int.Parse(TxtTaskId.Text), file, MaterialId);
                }
                    Response.Write("<script>alert('Material updated successfully')</script>");
                    MaterialRefresh(int.Parse(TxtTaskId.Text));
                    if (this.IsPostBack == true)
                    {
                        clear();

                    }
                }
            }
        
        protected void lnkMaterialEdit_Click(object sender, EventArgs e)
        {
            MaterialId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            GridViewRow EditRow = (GridViewRow)(((LinkButton)sender).Parent.Parent);
            TxtMaterialName.Text = EditRow.Cells[0].Text;
            TxtDesc.Text = EditRow.Cells[1].Text;
            TxtTaskId.Text = EditRow.Cells[2].Text;
        //  TxtFilePath.Text = EditRow.Cells[3].Text;
            Button1.Text = "Update";

        }
        protected void lnkMaterialDelete_Click(object sender, EventArgs e)
        {
            Db obj = new Db();
            int DeleteId = Convert.ToInt32(((LinkButton)sender).CommandArgument);
            string query = string.Format("delete Material where MaterialId= {0}", DeleteId);
            string taskidquery = string.Format("Select TaskId from Material where MaterialId = {0}", DeleteId);
            int tasksid = obj.findtaskid(taskidquery);
            
            if (obj.DoTransaction(query))
            {
                Response.Write("<script language='javaScript'>alert('Deleted Material Successfully');</script>");
            }
            MaterialRefresh(tasksid);
        }

        protected void lnkMaterialDownload_Click(object sender, EventArgs e)
        {
            LinkButton lnkDownload = sender as LinkButton;
            GridViewRow gvrow = lnkDownload.NamingContainer as GridViewRow;
            string filePath = GridView1.DataKeys[gvrow.RowIndex].Value.ToString();
            Response.Redirect("download.aspx?file=" + filePath);//here the filepath is redirected to a new page because only then it will prompt for downloads. http header are written afresh when a new page is loaded which is needed for the download prompt to appear.Else if it is not redirected then the downloaded document would get displayed in the same material.aspx page.
                      
        }                                                                                 
        

        protected void MaterialRefresh(int taskid)
        {
            Db obj = new Db();
            string sql = string.Format("Select * from Material where TaskId ={0}", taskid);
            GridView1.DataSource = obj.fetch(sql);
            GridView1.DataBind();
        }
        public void clear()
        {
            TxtMaterialName.Text = "";
            TxtDesc.Text = "";
            TxtTaskId.Text = "";
            //TxtFilePath.Text="";
            FileUpload1.Dispose();

        }
        
    }
}