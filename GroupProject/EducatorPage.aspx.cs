using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class EducatorPage : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {

            Response.Write("<script>alert('Please login first!'); window.location='Login.aspx';</script>");
        }
        if (!IsPostBack)
        {
            BindData();
        }


    }

    private void BindData()
    {
        EducatorGridView.DataBind();
    }
    protected override void Render(HtmlTextWriter writer)
    {
        foreach (GridViewRow r in EducatorGridView.Rows)
        {
            if (r.RowType == DataControlRowType.DataRow)
            {
                r.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                r.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                r.ToolTip = "Click to select row";
                r.Cells[0].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.EducatorGridView, "Select$" + r.RowIndex, true);
                r.Cells[1].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.EducatorGridView, "Select$" + r.RowIndex, true);
                r.Cells[2].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.EducatorGridView, "Select$" + r.RowIndex, true);
                r.Cells[3].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.EducatorGridView, "Select$" + r.RowIndex, true);

            }
        }

        base.Render(writer);
    }
    protected void EducatorGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "openModal()", true);
        GridViewRow organizationName = EducatorGridView.SelectedRow;

        editFN.Text = EducatorGridView.SelectedRow.Cells[0].Text;
        editLN.Text = EducatorGridView.SelectedRow.Cells[1].Text;
        editEM.Text = EducatorGridView.SelectedRow.Cells[2].Text;
        editPH.Text = EducatorGridView.SelectedRow.Cells[3].Text;
    }

    protected void insertButton_Click(object sender, EventArgs e)
    {
        Educator newEdu = new Educator(addFN.Text, addLN.Text, addEmail.Text, addPhone.Text,"Active");
        newEdu.setFN(addFN.Text);
        newEdu.setLN(addLN.Text);
        newEdu.setEM(addEmail.Text);
        newEdu.setPH(addPhone.Text);
        sc.Open();
        System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();
        createUser.Connection = sc;
        String countdata = "select count(*) From [dbo].[Educator]";
        createUser = new SqlCommand(countdata, sc);
        Int32 countItem = (Int32)createUser.ExecuteScalar();
        int readcount = (int)countItem + 1;
        string insert = "insert into [dbo].[Educator] values(@EducatorID, @FirstName, @LastName, @eduEmail, @eduPhone, @Status, @LastUpdatedBy, @LastUpdated)";
        SqlCommand insertcmd = new SqlCommand(insert, sc);
        insertcmd.Parameters.AddWithValue("@EducatorID", readcount);
        insertcmd.Parameters.AddWithValue("@FirstName", newEdu.getFN());
        insertcmd.Parameters.AddWithValue("@LastName", newEdu.getLN());
        insertcmd.Parameters.AddWithValue("@eduEmail", newEdu.getEM());
        insertcmd.Parameters.AddWithValue("@eduPhone", newEdu.getPH());
        insertcmd.Parameters.AddWithValue("@Status", newEdu.getStatus());
        insertcmd.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
        insertcmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        insertcmd.ExecuteNonQuery();
        EducatorGridView.DataBind();
        sc.Close();

    }

    protected void EditButton_Click(object sender, EventArgs e)
    {
        Educator editEdu = new Educator(editFN.Text, editLN.Text, editEM.Text, editPH.Text, ddlStatus.SelectedItem.Value);
        editEdu.setFN(editFN.Text);
        editEdu.setLN(editLN.Text);
        editEdu.setEM(editEM.Text);
        editEdu.setPH(editPH.Text);
        sc.Open();
        string update = "update [dbo].[Educator] set FirstName=@FirstName, LastName=@LastName, eduEmail=@eduEmail, eduPhone=@eduPhone, Status=@Status, LastUpdatedBy=@LastUpdatedBy, LastUpdated=@LastUpdated where EducatorID=@EducatorID";
        SqlCommand updatecmd = new SqlCommand(update, sc);
        updatecmd.Parameters.AddWithValue("@EducatorID", EducatorGridView.SelectedRow.Cells[5].Text);
        updatecmd.Parameters.AddWithValue("@FirstName", editEdu.getFN());
        updatecmd.Parameters.AddWithValue("@LastName", editEdu.getLN());
        updatecmd.Parameters.AddWithValue("@eduEmail", editEdu.getEM());
        updatecmd.Parameters.AddWithValue("@eduPhone", editEdu.getPH());
        updatecmd.Parameters.AddWithValue("@Status", editEdu.getStatus());
        updatecmd.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
        updatecmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        updatecmd.ExecuteNonQuery();
        EducatorGridView.DataBind();
        sc.Close();
    }

    protected void DeactivateButton_Click(object sender, EventArgs e)
    {
        Educator editEdu = new Educator(editFN.Text, editLN.Text, editEM.Text, editPH.Text, "Inactive");
        sc.Open();
        string update = "update [dbo].[Educator] set Status=@Status, LastUpdatedBy=@LastUpdatedBy, LastUpdated=@LastUpdated where EducatorID=@EducatorID";
        SqlCommand deactivatecmd = new SqlCommand(update, sc);
        deactivatecmd.Parameters.AddWithValue("@EducatorID", EducatorGridView.SelectedRow.Cells[5].Text);
        deactivatecmd.Parameters.AddWithValue("@Status", editEdu.getStatus());
        deactivatecmd.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
        deactivatecmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        deactivatecmd.ExecuteNonQuery();
        EducatorGridView.DataBind();
        sc.Close();
    }
}