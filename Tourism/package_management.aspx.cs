using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Tourism
{
    public partial class package_management : System.Web.UI.Page
    {
        string filename;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            fillCategoryValues();
            GridView1.DataBind();
        }

        // add new package
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfPackageExists())
            {
                Response.Write("<script>alert('Package with this ID already Exist. You cannot add another Package with the same Package ID & Package Category.');</script>");
            }
            else
            {
                addNewPackge();
            }
        }

        //update package
        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        //delete package
        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {

        }

        //user defined functions
        void fillCategoryValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT category_name FROM category_management_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList1.DataSource = dt;
                DropDownList1.DataValueField = "category_name";
                DropDownList1.DataBind();
            }
            catch(Exception ex)
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

                SqlCommand cmd = new SqlCommand("SELECT * from package_management_tbl where package_id='" + TextBox1.Text.Trim() + "' OR package_category='"+ DropDownList1.SelectedItem.Value + "';", con);
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
        void addNewPackge()
        {
            string filepath = "~/AllPackages/package.png";
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("All_Packages/" + filename));
            filepath = "~/All_Packages/" + filename;
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO package_management_tbl(package_id,package_name,package_category,price,description,images) values(@package_id,@package_name,@package_category,@price,@description,@images)", con);

                cmd.Parameters.AddWithValue("@package_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@package_name", TextBox2.Text.Trim());                
                cmd.Parameters.AddWithValue("@package_category", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@price", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@description", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@images", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Package added Successfully');</script>");
                clearForm();
                GridView1.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox6.Text = "";
        }
    }
}