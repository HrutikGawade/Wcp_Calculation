using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WCP_Calculation
{
    public partial class Exc_popuppage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strConnection = "Data Source=DESKTOP-951VNPM;Initial Catalog=Hrut;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection con = new SqlConnection(strConnection);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from SignUpDtls", con);            
            DataSet ds = new DataSet();            
            SqlDataAdapter da = new SqlDataAdapter(cmd);            
            da.Fill(ds);            
            GridView2.DataSource = ds;
            GridView2.DataBind();            

            SqlConnection con1 = new SqlConnection(strConnection);                        
            SqlCommand cmd1 = new SqlCommand("Select * from Batch_Run_TBL", con1);            
            DataSet ds1 = new DataSet();            
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);            
            da1.Fill(ds1);            
            GridView1.DataSource = ds1;
            GridView1.DataBind();
            
            SqlConnection con2 = new SqlConnection(strConnection);
            SqlCommand cmd2 = new SqlCommand("Select * from Error_log_show", con2);
            DataSet ds2 = new DataSet();
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
            da2.Fill(ds2);
            GridView3.DataSource = ds2;
            GridView3.DataBind();
            con.Close();
        }
        protected void ChkOne_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (ChkOne.Checked == true)
                {
                    div4.Attributes.Add("style", "display:block");
                    //fillddl(ddlPrevExcelFle);
                }
                else
                {
                    div4.Attributes.Add("style", "display:none");
                }
            }
            catch (Exception ex)
            {
                string currentFile = new System.Diagnostics.StackTrace(true).GetFrame(0).GetFileName();
                System.IO.FileInfo oInfo = new System.IO.FileInfo(currentFile);
                string sRet = oInfo.Name;
                System.Reflection.MethodBase method = System.Reflection.MethodBase.GetCurrentMethod();
                String LogClassName = method.ReflectedType.Name;
                //objErr.LogErr("I-Sys SAIM", sRet, method.Name.ToString(), ex.Message.ToString(), HttpContext.Current.Session["UserID"].ToString().Trim());

            }
        }

    }
}