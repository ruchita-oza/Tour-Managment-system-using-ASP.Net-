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
        //static int total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["package_id"]);
            if (id != 0)
            {
             
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                    string query = "SELECT [package_id], [package_name], [package_category], [price], [images] FROM [package_management_tbl] WHERE ([package_id] = '" + id + "');";
              

                SqlCommand cmd = new SqlCommand(query, con);
                    
                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if(reader.Read())
                        {
                            Package_name.Text = String.Format("{0}", reader["package_name"]);
                            Package_category.Text = String.Format("{0}", reader["package_category"]);
                            Price.Text = String.Format("{0}", reader["price"]);
                            Image1.ImageUrl = String.Format("{0}", reader["images"]);
                        }
                    }



            }
            else
            {
                Response.Redirect("homepage.aspx");
            }
        }
       

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strcon);

            try
            {
                
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO booking_contact_details_tbl(name,email,phone,total_days,total_member,total_price,special_request) values(@name,@email,@phone,@total_days,@total_member,@total_price,@special_request)", con);

                cmd.Parameters.AddWithValue("@name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@total_days", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@total_member", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@total_price", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@special_request", TextBox6.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Your Package is BOOKED...! Thanks For visiting our website..:)');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            // Response.Write("<script>alert('Testing');</script>");
        }

      

        
    }
}