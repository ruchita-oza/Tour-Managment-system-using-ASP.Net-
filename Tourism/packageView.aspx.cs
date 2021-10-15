using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tourism
{
    public partial class packageView : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["package_id"]);
            if (id != 0)
            {
                if (!IsPostBack)
                {
                    SqlDataSource1.SelectCommand = "SELECT * FROM [package_management_tbl] WHERE ([package_id] = '" + id + "');";

                    BindPackageRepeater();
                }
            }
            else
            {
                Response.Redirect("homepage.aspx");
            }
        }

        private void BindPackageRepeater()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand("BindAllPackages", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        //Repeater1.DataSource = dt;
                        //Repeater1.DataBind();
                    }
                }
            }
        }       
    }
}