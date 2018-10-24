using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
        String insertOnlineProgramQuery = "INSERT INTO OnlineProgram (Type, Month, Date, Country, State, NumberOfKids, NumberOfAdults, Grade, Email, Theme, InvoiceID, AnimalsUsed, LastUpdatedBy, LastUpdated) " +
            "VALUES (@Type, @Month, @Date, @Country, @State, @NumberOfKids, @NumberOfAdults, @Grade, @Email, @Theme, @InvoiceID, @AnimalsUsed, @LastUpdatedBy, @LastUpdated)";

        SqlCommand cmd = new SqlCommand(insertOnlineProgramQuery, sc);
        cmd.Parameters.AddWithValue("@Type", TextBox13.Text);
        cmd.Parameters.AddWithValue("@Month", TextBox12.Text);
        cmd.Parameters.AddWithValue("@Date", TextBox11.Text);
        cmd.Parameters.AddWithValue("@Country", TextBox16.Text);
        cmd.Parameters.AddWithValue("@State", TextBox15.Text);
        cmd.Parameters.AddWithValue("@NumberOfKids", TextBox1.Text);
        cmd.Parameters.AddWithValue("@NumberOfAdults", TextBox2.Text);
        cmd.Parameters.AddWithValue("@Grade", DropDownList1.SelectedValue);
        cmd.Parameters.AddWithValue("@Email", TextBox18.Text);
        cmd.Parameters.AddWithValue("@Theme", TextBox20.Text);
        cmd.Parameters.AddWithValue("@InvoiceID", "1");
        cmd.Parameters.AddWithValue("@AnimalsUsed", TextBox21.Text);
        cmd.Parameters.AddWithValue("@LastUpdatedBy", "Stosh");
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Today.ToString());

        cmd.ExecuteNonQuery();

    }


    //EXIT METHOD
    protected void Button2_Click(object sender, EventArgs e)
    {
        System.Environment.Exit(0);
    }
}