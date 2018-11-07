using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void btn1_NewUser(object sender, EventArgs e)
    {

    }
    protected void btn_Login(object sender, EventArgs e)
    {
        // connect to database to retrieve stored password string
        //try
        //{
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);

        //lblStatus.Text = "Database Connection Successful";

        sc.Open();
        System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
        findPass.Connection = sc;
        // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
        findPass.CommandText = "select PasswordHash from Passwd where Username = @Username";
        findPass.Parameters.Add(new SqlParameter("@Username", txtUserName.Text));

        SqlDataReader reader = findPass.ExecuteReader(); // create a reader

        if (reader.HasRows) // if the username exists, it will continue
        {
            while (reader.Read()) // this will read the single record that matches the entered username
            {
                string storedHash = reader["PasswordHash"].ToString(); // store the database password into this variable

                if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash)) // if the entered password matches what is stored, it will show success
                {
                   
                    //lblStatus.Text = "Success!";
                    btnLogin.Enabled = false;
                    txtUserName.Enabled = false;
                    txtPassword.Enabled = false;
                    Response.Redirect("Home.aspx");
                     // change this later (Program
                    
                }
                //else
                    //lblStatus.Text = "Password is wrong.";
            }
        }
        sc.Close();

        sc.Open();
        string seelevel = "select JobLevel from [dbo].[User] where Username = @Username";
        System.Data.SqlClient.SqlCommand emlevel = new System.Data.SqlClient.SqlCommand(seelevel, sc);
        emlevel.Parameters.Add(new SqlParameter("@Username", txtUserName.Text));
        string level = Convert.ToString(emlevel.ExecuteScalar());
        Session["userLevel"] = level;
        
        //else // if the username doesn't exist, it will show failure
        //lblStatus.Text = "Login failed.";

        sc.Close();
        //}
        //catch
        //{
        //    lblStatus.Text = "Database Error.";
        //}
    }

    protected void lnkCreate_Click(object sender, EventArgs e)
    {
        Response.Redirect("createUser.aspx", false);
    }
}
