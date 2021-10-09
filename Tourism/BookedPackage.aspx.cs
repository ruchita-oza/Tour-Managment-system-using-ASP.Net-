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
    public partial class BookedPackage : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["package_id"]);
            if (id != 0)
            {
                if (!IsPostBack)
                {
                    SqlDataSource1.SelectCommand = "SELECT [package_id], [package_name], [package_category], [price], [images] FROM [package_management_tbl] WHERE ([package_id] = '" + id + "');";

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
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO booking_contact_details_tbl(name,email,phone,total_days,total_member,special_request) values(@name,@email,@phone,@total_days,@total_member,@special_request)", con);

                cmd.Parameters.AddWithValue("@name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@total_days", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@total_member", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@special_request", TextBox6.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Details submitted..! Please Proceed to make Payment');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}