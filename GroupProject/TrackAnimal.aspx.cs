using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TrackAnimal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected override void Render(HtmlTextWriter writer)
    {
        foreach (GridViewRow r in gvRegularProgram.Rows)
        {
            if (r.RowType == DataControlRowType.DataRow)
            {
                r.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                r.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                r.ToolTip = "Click to select row";
                r.Cells[1].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);

            }
        }

        base.Render(writer);
    }
    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gvRegularProgram.SelectedRow;
       
        string city= row.Cells[1].Text;
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "passcity("+city+")", true);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "codeAddress()", true);
        
        
       
    }

}