﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tourism
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* When Nobody Logged In */
            try
            {                
                if (Session["role"] == null)
                {
                    LinkButton1.Visible = true;     //user login link button
                    LinkButton4.Visible = true;     //sign up link button

                    LinkButton2.Visible = false;     //logout link button
                    LinkButton3.Visible = false;     //hello user link button

                    LinkButton6.Visible = true;     //admin link button
                    LinkButton8.Visible = false;    //author management link button
                    LinkButton9.Visible = false;    //publisher management button
                    LinkButton10.Visible = false;   //book inventory link button
                    LinkButton11.Visible = false;   //booling issue link button
                    LinkButton12.Visible = false;   //member management link button
                }
                else if(Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false;     //user login link button
                    LinkButton4.Visible = false;     //sign up link button

                    LinkButton2.Visible = true;     //logout link button
                    LinkButton3.Visible = true;     //hello user link button
                    LinkButton3.Text = "Hello " + Session["fullname"].ToString();

                    LinkButton6.Visible = true;     //admin link button
                    LinkButton8.Visible = false;    //author management link button
                    LinkButton9.Visible = false;    //publisher management button
                    LinkButton10.Visible = false;   //book inventory link button
                    LinkButton11.Visible = false;   //booling issue link button
                    LinkButton12.Visible = false;   //member management link button
                }
                else if(Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false;     //user login link button
                    LinkButton4.Visible = false;     //sign up link button

                    LinkButton2.Visible = true;     //logout link button
                    LinkButton3.Visible = true;     //hello user link button
                    LinkButton3.Text = "Hello " + Session["username"].ToString();

                    LinkButton6.Visible = false;     //admin link button
                    LinkButton8.Visible = true;    //author management link button
                    LinkButton9.Visible = true;    //publisher management button
                    LinkButton10.Visible = true;   //book inventory link button
                    LinkButton11.Visible = true;   //booling issue link button
                    LinkButton12.Visible = true;   //member management link button
                }
            }
            catch(Exception ex)
            {

            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton1.Visible = true;     //user login link button
            LinkButton4.Visible = true;     //sign up link button

            LinkButton2.Visible = false;     //logout link button
            LinkButton3.Visible = false;     //hello user link button

            LinkButton6.Visible = true;     //admin link button
            LinkButton8.Visible = false;    //author management link button
            LinkButton9.Visible = false;    //publisher management button
            LinkButton10.Visible = false;   //book inventory link button
            LinkButton11.Visible = false;   //booling issue link button
            LinkButton12.Visible = false;   //member management link button
        }
    }
}