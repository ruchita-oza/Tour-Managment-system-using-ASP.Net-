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
    public partial class package_management : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //add button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfPackageExists())
            {
                Response.Write("<script>alert('Package with this Name, Category and Price Already Exists...! Please add another package...!');</script>");
            }
            else
            {
                addNewPackage();
            }
        }

        //update button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkIfPackageExists() == true)
            {
                updatePackage();
            }
            else
            {
                Response.Write("<script>alert('Package Doesn't Exists...! Please add another package...!');</script>");
            }
        }

        //delete button click
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfPackageExists() == true)
            {
                deletePackage();
            }
            else
            {
                Response.Write("<script>alert('Package with this Name, Category and Price Doesn't Exists...! Please add another package...!');</script>");
            }
        }
        
        void addNewPackage()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO package_management_tbl(package_name,package_category,price,description,images) values(@package_name,@package_category,@price,@description,@images)", con);

                cmd.Parameters.AddWithValue("@package_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@package_category", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@price", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@description", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@images", SqlDbType.Image);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Package Added Successfully...!');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void updatePackage()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE package_management_tbl SET package_category=@package_category where package_name='" + TextBox2.Text.Trim() + "' or price='" + TextBox3.Text.Trim() + "'", con);

                //cmd.Parameters.AddWithValue("@package_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@package_category", DropDownList1.SelectedItem.Value);
                /*cmd.Parameters.AddWithValue("@price", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@description", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@images", SqlDbType.Image);*/

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Package Updated Successfully...!');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void deletePackage()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM package_management_tbl WHERE package_name='" + TextBox2.Text.Trim() + "' AND package_category='" + DropDownList1.SelectedItem.Value + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Package Deleted Successfully...!');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        bool checkIfPackageExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from package_management_tbl where package_name='" + TextBox2.Text.Trim() + "' AND package_category='" + DropDownList1.SelectedItem.Value + "' AND price='" + TextBox3.Text.Trim() + "'; ", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void clearForm()
        {
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";

        }
    }
}
