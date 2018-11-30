using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Organization : System.Web.UI.Page
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
        OrgGridView.DataBind();
    }

    protected override void Render(HtmlTextWriter writer)
    {
        foreach (GridViewRow r in OrgGridView.Rows)
        {
            if (r.RowType == DataControlRowType.DataRow)
            {
                r.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                r.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                r.ToolTip = "Click to select row";
                r.Cells[0].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.OrgGridView, "Select$" + r.RowIndex, true);
                r.Cells[1].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.OrgGridView, "Select$" + r.RowIndex, true);
                r.Cells[2].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.OrgGridView, "Select$" + r.RowIndex, true);
                r.Cells[3].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.OrgGridView, "Select$" + r.RowIndex, true);
                r.Cells[4].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.OrgGridView, "Select$" + r.RowIndex, true);
                r.Cells[5].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.OrgGridView, "Select$" + r.RowIndex, true);
                r.Cells[6].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.OrgGridView, "Select$" + r.RowIndex, true);
                r.Cells[7].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.OrgGridView, "Select$" + r.RowIndex, true);
                r.Cells[8].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.OrgGridView, "Select$" + r.RowIndex, true);
                
            }
        }

        base.Render(writer);
    }

    protected void UserGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "openModal()", true);
        GridViewRow organizationName = OrgGridView.SelectedRow;
        EditOrgName.Text = OrgGridView.SelectedRow.Cells[0].Text;
        EditOrgAddress.Text = OrgGridView.SelectedRow.Cells[1].Text;
        EditProgramCity.SelectedItem.Text = OrgGridView.SelectedRow.Cells[2].Text;
        EditCounty.SelectedItem.Text = OrgGridView.SelectedRow.Cells[3].Text;
        EditPerson.Text = OrgGridView.SelectedRow.Cells[5].Text;
        EditPhone.Text = OrgGridView.SelectedRow.Cells[6].Text;
        EditEmail.Text = OrgGridView.SelectedRow.Cells[7].Text;
       
        
    }

    protected void insertButton_Click(object sender, EventArgs e)
    {
        sc.Open();
        string addOrg = "insert into [dbo].[Organization] values (@OrgAddress, @OrgCity, @OrgCounty, @OrgCountry, @PrimaryContactPerson, @OrgPhone, @OrgEmail, @LastUpdatedBy, @LastUpdated, @OrganizationName)";
        SqlCommand addOrgcmd = new SqlCommand(addOrg, sc);
        addOrgcmd.Parameters.AddWithValue("@OrgAddress", HttpUtility.HtmlEncode(addOrgAddress.Text));
        addOrgcmd.Parameters.AddWithValue("@OrgCity", addCity.SelectedItem.Text);
        addOrgcmd.Parameters.AddWithValue("@OrgCounty", addCounty.SelectedItem.Text);
        addOrgcmd.Parameters.AddWithValue("@OrgCountry", "US");
        addOrgcmd.Parameters.AddWithValue("@PrimaryContactPerson", HttpUtility.HtmlEncode(addPerson.Text));
        addOrgcmd.Parameters.AddWithValue("@OrgPhone", HttpUtility.HtmlEncode(addPhone.Text));
        addOrgcmd.Parameters.AddWithValue("@OrgEmail", HttpUtility.HtmlEncode(addEmail.Text));
        addOrgcmd.Parameters.AddWithValue("@LastUpdatedBy", "Judy");
        addOrgcmd.Parameters.AddWithValue("@LastUpdated", DateTime.Today);
        addOrgcmd.Parameters.AddWithValue("@OrganizationName", HttpUtility.HtmlEncode(addOrgName.Text));
        
        addOrgcmd.ExecuteNonQuery();
        OrgGridView.DataBind();
        sc.Close();
    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        sc.Open();
        string updateOrg = "Update [dbo].[Organization] set OrgAddress = @OrgAddress, OrgCity = @OrgCity, OrgCounty = @OrgCounty, PrimaryContactPerson =@ContactPerson, OrgPhone=@OrgPhone, OrgEmail=@OrgEmail, OrganizationName = @OrganizationName where OrganizationID=@OrganizationID";
        SqlCommand updateOrgcmd = new SqlCommand(updateOrg, sc);
        updateOrgcmd.Parameters.AddWithValue("@OrgAddress", HttpUtility.HtmlEncode(EditOrgAddress.Text));
        updateOrgcmd.Parameters.AddWithValue("@OrgCity", EditProgramCity.SelectedItem.Text);
        updateOrgcmd.Parameters.AddWithValue("@OrgCounty", EditCounty.SelectedItem.Text);
        updateOrgcmd.Parameters.AddWithValue("@ContactPerson", HttpUtility.HtmlEncode(EditPerson.Text));
        updateOrgcmd.Parameters.AddWithValue("@OrgPhone", HttpUtility.HtmlEncode(EditPhone.Text));
        updateOrgcmd.Parameters.AddWithValue("@OrgEmail", HttpUtility.HtmlEncode(EditEmail.Text));
        updateOrgcmd.Parameters.AddWithValue("@OrganizationName", HttpUtility.HtmlEncode(EditOrgName.Text));
        updateOrgcmd.Parameters.AddWithValue("@OrganizationID", OrgGridView.SelectedRow.Cells[8].Text);
        updateOrgcmd.ExecuteNonQuery();
        OrgGridView.DataBind();
        sc.Close();
    }

    protected void DeleteButtonModal_Click(object sender, EventArgs e)
    {

    }
}