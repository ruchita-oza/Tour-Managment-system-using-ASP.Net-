using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tourism
{
    public partial class packages : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           if (!IsPostBack)
            {
                string category = Request.QueryString["category"];

                if (category != null)
                    SqlDataSource1.SelectCommand = "SELECT * FROM [package_management_tbl] WHERE ([package_category] = '" + category + "');";

                BindPackageRepeater();
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
                       // Repeater1.DataBind();
                    }
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "SELECT * FROM [package_management_tbl] WHERE ([package_category] = '" + DropDownList1.SelectedValue + "');";
            BindPackageRepeater();

        }
    }
}