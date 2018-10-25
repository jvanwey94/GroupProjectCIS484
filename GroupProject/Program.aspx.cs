using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Program : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);
    //SqlConnection sc = new SqlConnection(@"server =Localhost;Database=WildLifeCenter;Trusted_Connection=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //not started
            ListItem statusNotStarted = new ListItem();
            statusNotStarted.Value = "0";
            statusNotStarted.Text = "Not Started";

            //incomplete
            ListItem statusIncomplete = new ListItem();
            statusIncomplete.Value = "1";
            statusIncomplete.Text = "Incomplete";

            //completed
            ListItem statusComplete = new ListItem();
            statusComplete.Value = "2";
            statusComplete.Text = "Completed";


            //adding to drop down list
            statusDropDown.Items.Add(statusNotStarted);
            statusDropDown.Items.Add(statusIncomplete);
            statusDropDown.Items.Add(statusComplete);
        }
    }


    // Insert into database
    protected void Button1_Click(object sender, EventArgs e)
    {
        String site = "";
        if (RadioButton1.Checked)
        {
            site = "OnSite";
        }
        else
        {
            site = "OffSite";
        }

        String payment = "";
        if (RadioButton3.Checked)
        {
            payment = "Waiting for payment";
        }
        else
        {
            payment = "Payment received";
        }
        Programs prog = new Programs(organizationTxt.Text, site, statusDropDown.SelectedValue, streetTxt.Text, cityTxt.Text, countyTxt.Text, TextBox6.Text, DropDownList5.SelectedValue, TextBox4.Text, int.Parse(TextBox1.Text),
            int.Parse(TextBox2.Text), DropDownList2.SelectedValue, DropDownList3.SelectedValue, DropDownList4.SelectedValue, payment, "foreign key", "Stosh", DateTime.Today.ToString("d"), TextBox5.Text);
        String programInsertQuery = "INSERT INTO Program (ProgramName, OnOffSite, ProgramStatus, ProgAddress, City, County, " +
            "ProgMonth, ProgDate, NumberOfKids, NumberOfAdults, Birds, Mammals, Reptiles, PayStatus, InvoiceID, LastUpdatedBy, LastUpdated, OrganizationName, Educator)" +
            " Values (@ProgramName, @OnOffSite, @ProgramStatus, @ProgAddress, @City, @County, @ProgMonth, @ProgDate, @NumberOfKids, @NumberOfAdults, @Birds, @Mammals, @Reptiles, @PayStatus, @InvoiceID, @LastUpdatedBy, @LastUpdated, @OrganizationName, @Educator)";
        SqlCommand cmd = new SqlCommand(programInsertQuery, sc);
        cmd.Parameters.AddWithValue("@ProgramName", prog.getProgramName());
        cmd.Parameters.AddWithValue("@OnOffSite", prog.getOnOffSite());
        cmd.Parameters.AddWithValue("@ProgramStatus", prog.getProgramStatus());
        cmd.Parameters.AddWithValue("@ProgAddress", prog.getProgramAddress());
        cmd.Parameters.AddWithValue("@City", prog.getCity());
        cmd.Parameters.AddWithValue("County", prog.getCounty());
        cmd.Parameters.AddWithValue("@ProgMonth", prog.getProgramMonth());
        cmd.Parameters.AddWithValue("@ProgDate", prog.getProgramDate());
        cmd.Parameters.AddWithValue("@NumberOfKids", prog.getNumberOfKids());
        cmd.Parameters.AddWithValue("@NumberOfAdults", prog.getNumberOfAdults());
        cmd.Parameters.AddWithValue("@Birds", prog.getBirds());
        cmd.Parameters.AddWithValue("@Mammals", prog.getMammals());
        cmd.Parameters.AddWithValue("@Reptiles", prog.getReptiles());
        cmd.Parameters.AddWithValue("@PayStatus", prog.getPayStatus());
        cmd.Parameters.AddWithValue("@InvoiceID", prog.getInvoiceID());
        cmd.Parameters.AddWithValue("@LastUpdatedBy", prog.getLastUpdatedBy());
        cmd.Parameters.AddWithValue("@LastUpdated", prog.getLastUpdated());
        cmd.Parameters.AddWithValue("@OrganizationName", prog.getOrganizationName());

        cmd.ExecuteNonQuery();
    }

    //Yoooooooooooooooooooooooooooooooooooooo dogggggggg

    //Exit Button
    protected void Button2_Click(object sender, EventArgs e)
    {
        System.Environment.Exit(0);
    }
}