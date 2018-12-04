using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Text;
using System.Drawing;

public partial class Users : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            BindData();
        }
    }

    private void BindData()
    {
        UserGridView.DataBind();
    }



    protected override void Render(HtmlTextWriter writer)
    {
        foreach (GridViewRow r in UserGridView.Rows)
        {
            if (r.RowType == DataControlRowType.DataRow)
            {
                r.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                r.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                r.ToolTip = "Click to edit user";
                r.Cells[0].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.UserGridView, "Select$" + r.RowIndex, true);
                r.Cells[1].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.UserGridView, "Select$" + r.RowIndex, true);
                r.Cells[2].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.UserGridView, "Select$" + r.RowIndex, true);
                r.Cells[3].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.UserGridView, "Select$" + r.RowIndex, true);
                r.Cells[4].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.UserGridView, "Select$" + r.RowIndex, true);
                r.Cells[5].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.UserGridView, "Select$" + r.RowIndex, true);
                r.Cells[6].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.UserGridView, "Select$" + r.RowIndex, true);
          
            }
        }

        base.Render(writer);
    }
    protected void UserGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "openModal()", true);
        GridViewRow User = UserGridView.SelectedRow;

        txtFirstName.Text = UserGridView.SelectedRow.Cells[0].Text;
        txtLastName.Text = UserGridView.SelectedRow.Cells[1].Text;
        txtEmail.Text = UserGridView.SelectedRow.Cells[2].Text;
        txtPhone.Text = UserGridView.SelectedRow.Cells[3].Text;
        txtJobLevel.Text = UserGridView.SelectedRow.Cells[5].Text;
        txtPermission.Text = UserGridView.SelectedRow.Cells[7].Text;

    }



    protected void editUserButton_Click(object sender, EventArgs e)
    {

        string edit = "Update [dbo].[User] set FirstName = @FirstName, LastName = @LastName, PersonEmail = @Email, PersonPhone=@Phone, JobLevel = @JobLevel, Permission = @Permission, LastUpdatedBy = @LastUpdatedBy, LastUpdated = @LastUpdated where UserID = @user";
        sc.Open();
        SqlCommand edituser = new SqlCommand(edit, sc);
        edituser.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
        edituser.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
        edituser.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(txtEmail.Text));
        edituser.Parameters.AddWithValue("@Phone", HttpUtility.HtmlEncode(txtPhone.Text));
        edituser.Parameters.AddWithValue("@JobLevel", txtJobLevel.SelectedItem.Text);
        edituser.Parameters.AddWithValue("@Permission", txtPermission.SelectedItem.Text);
        edituser.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
        edituser.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        edituser.Parameters.AddWithValue("@user", UserGridView.SelectedRow.Cells[8].Text);

        edituser.ExecuteNonQuery();
        UserGridView.DataBind();
        sc.Close();




    }
}