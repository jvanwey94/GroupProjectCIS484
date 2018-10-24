using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OnlineProgram : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String insertOnlineProgramQuery = "INSERT INTO OnlineProgram (Type, Month, Date, Country, State, NumberOfKids, NumberOfAdults, Grade, Email, Theme, InvoiceID, LastUpdatedBy, LastUpdated) " +
            "VALUES (@Type, @Month, @Date, @Country, @State, @NumberOfKids, @NumberOfAdults, @Grade, @Email, @Theme, @InvoiceID, @LastUpdatedBy, @LastUpdated)";

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        System.Environment.Exit(0);
    }
}