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
        string insertcat = "insert into [dbo].[Category] values (@ProgramType, @ProgramName)";
        SqlCommand insertCatcmd = new SqlCommand(insertcat, sc);
        insertCatcmd.Parameters.AddWithValue("@ProgramType", addType.SelectedItem.Value);
        insertCatcmd.Parameters.AddWithValue("@ProgramName", addCategoryName.Text);

        insertCatcmd.ExecuteNonQuery();
        CategoryGridView.DataBind();
        sc.Close();
    }

    protected void EditButton_Click(object sender, EventArgs e)
    {
        sc.Open();
        string editCat = "Update [dbo].[Category] set ProgramType = @ProgramType, ProgramName = @ProgramName where CategoryID = @CategoryID";
        SqlCommand editCatcmd = new SqlCommand(editCat, sc);
        editCatcmd.Parameters.AddWithValue("@ProgramType", EditType.SelectedItem.Value);
        editCatcmd.Parameters.AddWithValue("@ProgramName", EditName.Text);
        editCatcmd.Parameters.AddWithValue("@CategoryID", CategoryGridView.SelectedRow.Cells[2].Text);

        editCatcmd.ExecuteNonQuery();
        CategoryGridView.DataBind();
        sc.Close();
    }
}