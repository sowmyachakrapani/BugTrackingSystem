using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace IssueTrackingSystem
{
    public class Db
    {
        SqlConnection con = null;
        SqlCommand cmd = null;

        public Db()
        {
            con = new SqlConnection(@"Data Source=JAYA-CHAKRAPANI;Initial Catalog=Issuetracking;Integrated Security=True");
            con.Open();
            cmd = new SqlCommand();
            cmd.Connection = con;
        }

        public bool DoTransaction(string query)
        {
            SqlCommand cmds = new SqlCommand(query, con);
            int count = cmds.ExecuteNonQuery();
            if (count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public DataTable FetchEmployeeDetails(string username, string password)
        {
            string sql = string.Format("Select EmployeeId,EmployeeName,Designation from Employee where login = '{0}' and password = '{1}'", username, password);
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable tab = new DataTable();
            adap.Fill(tab);
            return tab;
            //return tab.Rows[0][0].ToString();
        }

        public string Fetchdesig(string username, string password)
        {

            //try
            //{
            string sql = string.Format("Select Designation from Employee where login = '{0}' and password = '{1}'", username, password);
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable tab = new DataTable();
            //adap.SelectCommand.Connection = con;
            adap.Fill(tab);
          
            return tab.Rows[0][0].ToString();
          // }
           //catch (Exception ex)
           //{

               
           //}
         
            //return (cmd.Parameters["@desig"].Value.ToString());
        }
        public string FetchEmpId(string sql)
        {
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable tab = new DataTable();
            adap.Fill(tab);
            return tab.Rows[0][0].ToString();
        }

        public DataTable FetchProjectName()
        {
            string sql = string.Format("select ProjectName,ProjectId from Project");
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable buffer = new DataTable();
            adap.Fill(buffer);
            return buffer;
        }
        
        public DataTable FetchTaskName()
        {
            string sql = string.Format("select TaskName,TaskId from Task");
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable buffer = new DataTable();
            adap.Fill(buffer);
            return buffer;
         }

        public DataTable FetchAreaName()
        {
            string sql = string.Format("select AreaName,AreaId from TestCaseArea");
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable buffer = new DataTable();
            adap.Fill(buffer);
            return buffer;
        }
        public DataTable GetEmployees(string sql)
        {
          SqlDataAdapter adap = new SqlDataAdapter(sql, con);
          DataTable tab = new DataTable();
          adap.Fill(tab);
          return tab;
        }

        public DataTable GetProjects(string sql)
        {
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable tab = new DataTable();
            adap.Fill(tab);
            return tab;
        }

        public void FillTopic( string topicname,int empid,string date,int ProjectId)
        {
            cmd.CommandText = "StoreTopic";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@topicname", topicname);
            cmd.Parameters.Add("@empid", empid);
            cmd.Parameters.Add("@date", date);
            cmd.Parameters.Add("@projectid", ProjectId);
            cmd.ExecuteNonQuery();
          }

        public void FillComment(string comment, int empid, string date,int topicid, int ProjectId)
        {
            cmd.CommandText = "StoreComment";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@comment", comment);
            cmd.Parameters.Add("@empid", empid);
            cmd.Parameters.Add("@date", date);
            cmd.Parameters.Add("@topicid", topicid);
            cmd.Parameters.Add("@projectid", ProjectId);
            cmd.ExecuteNonQuery();
        }

        public void FillEmp(string ename,string desig,string login, string password)
        {
            cmd.CommandText="StoreEmployee";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@empname",ename);
            cmd.Parameters.AddWithValue("@desig",desig);
            cmd.Parameters.AddWithValue("@login",login);
            cmd.Parameters.AddWithValue("@password",password);
            cmd.ExecuteNonQuery();
        }
        public void FillUpdatedEmp(string ename, string desig, string login, string password, int empid)
        {
            string sql = string.Format("update Employee set EmployeeName='{0}',Designation = '{1}',login ='{2}',password = '{3}' where EmployeeId={4}", ename, desig, login, password, empid);
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();

        }
        public void FillUpdatedProj(string projname, string projdesc, int projid)
        {
            string sql = string.Format("update Project set ProjectName='{0}',ProjectDescription = '{1}' where ProjectId={2}", projname, projdesc, projid);
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();

        }
        public void FillUpdatedTask(string taskname, string testengempid, string impengempid, string status, int projectid, string duration, int taskid)
        {
            string sql = string.Format("update Task set TaskName='{0}',TestEngineerEmployeeId = '{1}',ImplementationEngineerEmployeeId ='{2}',Status = '{3}',ProjectId ={4},Duration ='{5}' where TaskId={6}", taskname,testengempid,impengempid,status,projectid,duration,taskid);
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();

        }

        public void FillUpdatedMaterial(string matname,string matdesc, int taskid, string filepath,int matid)
        {
              string sql = string.Format("update Material set MaterialName='{0}',Description = '{1}',Filepath = '{2}' where TaskId={3} and MaterialId = {4}", matname,matdesc,filepath,taskid,matid);
              cmd.CommandText = sql;
              cmd.ExecuteNonQuery();
        }

        public void FillUpdatedMaterialwithoutFileName(string matname, string matdesc, int taskid, int matid)
        {
            string sql = string.Format("update Material set MaterialName='{0}',Description = '{1}' where TaskId={2} and MaterialId = {3}", matname, matdesc, taskid, matid);
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();
        }
        public void FillUpdatedEmpProfile(string empname,string email,int empid)
        {
            string sql = string.Format("update Employee set EmployeeName='{0}',login ='{1}' where EmployeeId={2}", empname,email,empid);
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();

        }
        public void FillUpdatedPassword(string pwd, string login)
        {
            string sql = string.Format("update Employee set Password = '{0}' where login ='{1}'", pwd,login);
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();

        }
        public void FillUpdatedTestCaseArea(string areaname, int taskid,int areaid)
        {
         string sql = string.Format("Update TestCaseArea set AreaName = '{0}',TaskId ={1}  where AreaId ={2}",areaname,taskid,areaid);
         cmd.CommandText = sql;
         cmd.ExecuteNonQuery();
        }
        public void FillUpdatedTestCase(string testcasedesc, string expop, string actop, string status, string severity, string visibility, int areaid,int testcaseid)
        {
            string sql = string.Format("Update TestCase set TestCaseDescription ='{0}',ExpectedOutput='{1}',ActualOutput='{2}',Status='{3}',Severity='{4}',Visibility='{5}',AreaId ={6} where TestCaseId={7}",testcasedesc,expop,actop,status,severity,visibility,areaid,testcaseid);
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();
        }
        public void FillProject(string projectname, string projdesc)
        {
            cmd.CommandText = "StoreProject";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@projectname", projectname);
            cmd.Parameters.AddWithValue("@projectdesc", projdesc);
            cmd.ExecuteNonQuery();
        }

        public void FillTestCaseArea(string areaname, int taskid)
        {

            cmd.CommandText = "StoreTestCaseArea";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@areaname", areaname);
            cmd.Parameters.AddWithValue("@taskid", taskid);
            cmd.ExecuteNonQuery();
         }


        public DataTable fetch(string sql)
        {
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable buffer = new DataTable();
            adap.Fill(buffer);
            return buffer;
        }
        public int findtaskid(string sql)
        {
            SqlDataAdapter adap = new SqlDataAdapter(sql, con);
            DataTable buffer = new DataTable();
            adap.Fill(buffer);
            return int.Parse(buffer.Rows[0][0].ToString());
        }

        public void FillTestCase(string testcasedesc,string expop,string actop,string status,string severity,string visibility,string areaid)
        {
            cmd.CommandText = "StoreTestCase";
            cmd.CommandType= CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@testcasedesc",testcasedesc);
            cmd.Parameters.AddWithValue("@expop",expop);
            cmd.Parameters.AddWithValue("@actop",actop);
            cmd.Parameters.AddWithValue("@status",status);
            cmd.Parameters.AddWithValue("@severity",severity);
            cmd.Parameters.AddWithValue("@visibility",visibility);
            cmd.Parameters.AddWithValue("@areaid", areaid);
            cmd.ExecuteNonQuery();
        }

   
        public void FillTask(string taskname,string testengempid,string impengempid,string status,int projectid,string duration)
        {
            cmd.CommandText = "StoreTask";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@taskname",taskname);
            cmd.Parameters.AddWithValue("@testengempid",testengempid);
            cmd.Parameters.AddWithValue("@impengempid",impengempid);
            cmd.Parameters.AddWithValue("@status",status);
            cmd.Parameters.AddWithValue("@projectid",projectid);
            cmd.Parameters.AddWithValue("@duration",duration);
            cmd.ExecuteNonQuery();

        }
        public void FillMaterial(string materialname,string desc,int taskid,string filepath)
        {
            cmd.CommandText = "StoreMaterial";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@materialname",materialname);
            cmd.Parameters.AddWithValue("@desc",desc);
            cmd.Parameters.AddWithValue("@taskid",taskid);
            cmd.Parameters.AddWithValue("@filepath",filepath);
            cmd.ExecuteNonQuery();

        }

    }
}