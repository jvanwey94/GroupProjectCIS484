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
            fillStatusList();
            fillMonthList();
            populateAnimals("'" + "Bird" +"'", DropDownList2);
            populateAnimals("'" + "Mammal" + "'", DropDownList3);
            populateAnimals("'" + "Reptile" + "'", DropDownList4);
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


    public void fillStatusList()
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

    protected void fillMonthList()
    {
        ListItem info = new ListItem();
        info.Value = "0";
        info.Text = "Choose Month";

        ListItem jan = new ListItem();
        jan.Value = "1";
        jan.Text = "January";

        ListItem feb = new ListItem();
        feb.Value = "2";
        feb.Text = "February";

        ListItem mar = new ListItem();
        mar.Value = "3";
        mar.Text = "March";

        ListItem apr = new ListItem();
        apr.Value = "4";
        apr.Text = "April";

        ListItem may = new ListItem();
        may.Value = "5";
        may.Text = "May";

        ListItem jun = new ListItem();
        jun.Value = "6";
        jun.Text = "June";

        ListItem jul = new ListItem();
        jul.Value = "7";
        jul.Text = "July";

        ListItem aug = new ListItem();
        aug.Value = "8";
        aug.Text = "August";

        ListItem sept = new ListItem();
        sept.Value = "9";
        sept.Text = "September";

        ListItem oct = new ListItem();
        oct.Value = "10";
        oct.Text = "October";

        ListItem nov = new ListItem();
        nov.Value = "11";
        nov.Text = "November";

        ListItem dec = new ListItem();
        dec.Value = "12";
        dec.Text = "December";

        DropDownList5.Items.Add(info);
        DropDownList5.Items.Add(jan);
        DropDownList5.Items.Add(feb);
        DropDownList5.Items.Add(mar);
        DropDownList5.Items.Add(apr);
        DropDownList5.Items.Add(may);
        DropDownList5.Items.Add(jun);
        DropDownList5.Items.Add(jul);
        DropDownList5.Items.Add(aug);
        DropDownList5.Items.Add(sept);
        DropDownList5.Items.Add(oct);
        DropDownList5.Items.Add(nov);
        DropDownList5.Items.Add(dec);
    }


    protected void populateAnimals(String condition, DropDownList list)
    {
        SqlDataReader reader;
        ListItem newItem = new ListItem();
        String animalQuery = "Select AnimalID, AnimalName from Animal where AnimalType = " + condition;
        SqlCommand filler = new SqlCommand(animalQuery, sc);

        newItem.Value = "0";
        newItem.Text = "Select " + condition;
        list.Items.Add(newItem);
        sc.Open();

        reader = filler.ExecuteReader();

        while (reader.Read())
        {
            newItem = new ListItem();
            newItem.Value = reader["AnimalID"].ToString();
            newItem.Text = reader["AnimalName"].ToString();
            list.Items.Add(newItem);
        }
        list.DataBind();
        reader.Close();
        sc.Close();

    }
}