using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Category : System.Web.UI.Page
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
        CategoryGridView.DataBind();
    }

    protected override void Render(HtmlTextWriter writer)
    {
        foreach (GridViewRow r in CategoryGridView.Rows)
        {
            if (r.RowType == DataControlRowType.DataRow)
            {
                r.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                r.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                r.ToolTip = "Click to select row";
                
                r.Cells[1].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.CategoryGridView, "Select$" + r.RowIndex, true);
                r.Cells[2].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.CategoryGridView, "Select$" + r.RowIndex, true);
                
                
            }
        }

        base.Render(writer);
    }

    protected void CategoryGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "openModal()", true);
        GridViewRow organizationName = CategoryGridView.SelectedRow;

        EditType.SelectedItem.Text = CategoryGridView.SelectedRow.Cells[0].Text;
        EditName.Text = CategoryGridView.SelectedRow.Cells[1].Text;
    }

    protected void insertButton_Click(object sender, EventArgs e)
    {
        sc.Open();
        string insertcat = "insert into [dbo].[Category] values (@ProgramType, @ProgramName, @LastUpdatedBy, @LastUpdated)";
        SqlCommand insertCatcmd = new SqlCommand(insertcat, sc);
        insertCatcmd.Parameters.AddWithValue("@ProgramType", addType.SelectedItem.Value);
        insertCatcmd.Parameters.AddWithValue("@ProgramName", addCategoryName.Text);
        insertCatcmd.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
        insertCatcmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

        insertCatcmd.ExecuteNonQuery();
        CategoryGridView.DataBind();
        sc.Close();
    }

    protected void EditButton_Click(object sender, EventArgs e)
    {
        sc.Open();
        string editCat = "Update [dbo].[Category] set ProgramType = @ProgramType, ProgramName = @ProgramName, LastUpdatedBy = @LastUpdatedBy, LastUpdated = @LastUpdated where CategoryID = @CategoryID";
        SqlCommand editCatcmd = new SqlCommand(editCat, sc);
        editCatcmd.Parameters.AddWithValue("@ProgramType", EditType.SelectedItem.Value);
        editCatcmd.Parameters.AddWithValue("@ProgramName", EditName.Text);
        editCatcmd.Parameters.AddWithValue("@CategoryID", CategoryGridView.SelectedRow.Cells[2].Text);
        editCatcmd.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
        editCatcmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

        editCatcmd.ExecuteNonQuery();
        CategoryGridView.DataBind();
        sc.Close();
    }
}