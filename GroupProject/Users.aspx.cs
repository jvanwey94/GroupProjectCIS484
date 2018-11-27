using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users : System.Web.UI.Page
{
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
        //txtUserName.Text = UserGridView.SelectedRow.Cells[6].Text;
        txtPermission.Text = UserGridView.SelectedRow.Cells[7].Text;

    }

    protected void PermissionButton_Click(object sender, EventArgs e)
    {

    }
}