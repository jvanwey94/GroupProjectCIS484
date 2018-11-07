using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class CreateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtFirstName.Text != "" && txtLastName.Text != "" && txtPassword.Text != "" && txtUsername.Text != ""
            && txtEmail.Text != "" && txtPN.Text != "" && txtConfirm.Text != "") // all fields must be filled out
        {
            //COMMIT VALUES
            //try
            //{
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);



            sc.Open();


            System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();
            createUser.Connection = sc;

            //find the personID
            String countdata = "select count(*) From [dbo].[Person]";
            createUser = new SqlCommand(countdata, sc);
            Int32 countItem = (Int32)createUser.ExecuteScalar();
            int readcount = (int)countItem + 1;

            //validation email & Phone Number

            Boolean validationEmail = emailIsValid(txtEmail.Text);





            // Validate password
            String passwd = txtPassword.Text;
            Boolean response;
            response = ValidatePw(passwd);
            if (validationEmail == true /*&& validationPhone == true*/)
            {
                if (txtPassword.Text == txtConfirm.Text)
                {
                    if (response == true)
                    {
                        // INSERT USER RECORD
                        createUser.CommandText = "insert into[dbo].[Person] values(@FName, @LName,@Email,@Phone,@Gender,@JobLevel,@LastUpdatedBy,@LastUpdated,@Username)";
                        createUser.Parameters.Add(new SqlParameter("@FName", txtFirstName.Text));
                        createUser.Parameters.Add(new SqlParameter("@LName", txtLastName.Text));
                        createUser.Parameters.Add(new SqlParameter("@Email", txtEmail.Text));
                        createUser.Parameters.Add(new SqlParameter("@Phone", txtPN.Text));
                        createUser.Parameters.Add(new SqlParameter("@Gender", txtGender.SelectedItem.ToString()));
                        createUser.Parameters.Add(new SqlParameter("@JobLevel", txtJobLevel.SelectedItem.ToString()));
                        createUser.Parameters.Add(new SqlParameter("@LastUpdatedBy", "Kevin"));
                        createUser.Parameters.Add(new SqlParameter("@LastUpdated", DateTime.Now));
                        createUser.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));


                        createUser.ExecuteNonQuery();


                        System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
                        setPass.Connection = sc;
                        // INSERT PASSWORD RECORD AND CONNECT TO USER
                        setPass.CommandText = "insert into[dbo].[Passwd] values(@PersonID, @Username, @Password,@LastUpdatedBy,@LastUpdated)";
                        setPass.Parameters.Add(new SqlParameter("@PersonID", readcount));
                        setPass.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));
                        setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(txtPassword.Text))); // hash entered password
                        setPass.Parameters.Add(new SqlParameter("@LastUpdatedBy", "Kevin"));
                        setPass.Parameters.Add(new SqlParameter("@LastUpdated", DateTime.Now));
                        setPass.ExecuteNonQuery();

                        sc.Close();

                        lblStatus.Text = "User committed!";
                        txtFirstName.Enabled = false;
                        txtLastName.Enabled = false;
                        txtUsername.Enabled = false;
                        txtPassword.Enabled = false;
                        btnSubmit.Enabled = false;
                        lnkAnother.Visible = true;
                    }
                    else
                    {
                        Response.Write("<script>alert(' Password must be at least 8 characters, no more than 16 characters, and must include at least one upper case letter, one lower case letter, and one numeric digit." +
                            "Please Try again')</script>");

                    }
                }
                else
                {
                    Response.Write("<script>alert(' Password you entered is not match! ')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert(' Invalid Phone number or Email Address')</script>");
            }
            //}
            //    catch
            //{
            //    lblStatus.Text = "Database Error - User not committed.";
            //}
        }
        else
            lblStatus.Text = "Fill all fields.";
    }

    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx", false);
    }

    protected void lnkAnother_Click(object sender, EventArgs e)
    {
        txtFirstName.Enabled = true;
        txtLastName.Enabled = true;
        txtUsername.Enabled = true;
        txtPassword.Enabled = true;
        btnSubmit.Enabled = true;
        lnkAnother.Visible = false;
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtUsername.Text = "";
        txtPassword.Text = "";
    }

    protected Boolean ValidatePw(string pw)
    {
        Boolean response;
        string patternPassword = @"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$";
        if (!string.IsNullOrEmpty(pw))
        {
            if (!Regex.IsMatch(pw, patternPassword))
            {
                response = false;
                //Response.Write(" Password must be at least 8 characters, no more than 16 characters, and must include at least one upper case letter, one lower case letter, and one numeric digit.");
            }
            else
                response = true;
        }
        else
        {
            response = false;
        }
        return response;
    }

    public static bool emailIsValid(string email)
    {
        string expresion;
        expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
        if (Regex.IsMatch(email, expresion))
        {
            if (Regex.Replace(email, expresion, string.Empty).Length == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }

    //public static bool phoneISValid(String phone)
    //{

    //    Regex phoneNumpattern = new Regex(@"\+[0-9]{3}\s+[0-9]{3}\s+[0-9]{5}\s+[0-9]{3}");
    //    if (phoneNumpattern.IsMatch(phone))
    //    {
    //        return true;
    //    }
    //    else
    //    {
    //        return false;
    //    }
    //}

    //    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    //    {
    //        inputgender = "Male";
    //        if (txtGender1.Checked == true)
    //        {
    //            txtGender2.Checked = true;
    //            txtGender1.Checked = false;

    //        }

    //    }

    //    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    //    {
    //        inputgender = "Female";
    //        if (txtGender2.Checked == true)
    //        {
    //            txtGender1.Checked = true;
    //            txtGender2.Checked = false;

    //        }
    //    }
}