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
    public partial class File_Upld : System.Web.UI.Page
    {
        //Connection contest = new Connection();

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
            con.Close();
        }
       
    }
}