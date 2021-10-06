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
        string global_filepath;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                fillCategoryValues();
            }            
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
            if (checkIfPackageExists())
            {
                //Response.Write("<script>alert('Package with this ID already Exist. You cannot add another Package with the same Package ID & Package Category.');</script>");
                updatePackage();
            }
            else
            {
                Response.Write("<script>alert('Package with this ID doesn't Exist.');</script>");
            }
        }

        //delete package
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkIfPackageExists())
            {
                //Response.Write("<script>alert('Package with this ID already Exist. You cannot add another Package with the same Package ID & Package Category.');</script>");
               deletePackage();
            }
            else
            {
                Response.Write("<script>alert('Package with this ID doesn't Exist.');</script>");
            }
        }

        //go button click
        protected void Button4_Click(object sender, EventArgs e)
        {
            getPackageById();
        }

        //user defined functions
        void getPackageById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM package_management_tbl WHERE package_id='"+ TextBox1.Text.Trim() +"';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                
                if(dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["package_name"].ToString();
                    TextBox3.Text = dt.Rows[0]["price"].ToString();
                    DropDownList1.SelectedValue = dt.Rows[0]["package_category"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["description"].ToString();
                    global_filepath = dt.Rows[0]["images"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Ivalid Package Id');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
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

                SqlCommand cmd = new SqlCommand("SELECT * from package_management_tbl where package_id='" + TextBox1.Text.Trim() + "' OR package_name='"+ TextBox2.Text.Trim() + "';", con);
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

        void deletePackage()
        {
            if(checkIfPackageExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from package_management_tbl WHERE package_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Package Deleted Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Ivalid Package Id');</script>");
            }
        }
        
        void updatePackage()
        {
            if(checkIfPackageExists())
            {
                try
                {
                    string filepath = "~/All_Packages/package.png";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if(filename == "" || filename == null)
                    {
                        filepath = global_filepath;
                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("All_Packages/" + filename));
                        filepath = "~/All_Packages/" + filename;
                    }
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE package_management_tbl SET package_name=@package_name, package_category=@package_category, price=@price, description=@description, images=@images WHERE package_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@package_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@package_category", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@price", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@description", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@images", filepath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Package Updated Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Ivalid Package Id');</script>"); 
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