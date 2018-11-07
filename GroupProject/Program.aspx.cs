using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Program : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);
    ////SqlConnection sc = new SqlConnection(@"server =Localhost;Database=WildLifeCenter;Trusted_Connection=True");
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //        fillStatusList();
            //        fillMonthList();
            //        populateAnimals("'" + "Bird" +"'", DropDownList2);
            //        populateAnimals("'" + "Mammal" + "'", DropDownList3);
            //        populateAnimals("'" + "Reptile" + "'", DropDownList4);
            BindData();
        }

        
    }

    private void BindData()
    {
        gvRegularProgram.DataBind();
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
                r.Cells[2].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[3].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[4].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[5].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[6].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[7].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
            }
        }

        base.Render(writer);
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {

        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "openModal()", true);
        GridViewRow organizationName = gvRegularProgram.SelectedRow;
        //txtOrganizationName.Text = (string)gvRegularProgram.DataKeys[organizationName.RowIndex]["Column1"];

        txtOrganizationName.Text = gvRegularProgram.SelectedRow.Cells[0].Text;
        txtOrganizationAddress.Text = gvRegularProgram.SelectedRow.Cells[5].Text;
        txtCity.Text = gvRegularProgram.SelectedRow.Cells[6].Text;
        txtCounty.Text = gvRegularProgram.SelectedRow.Cells[7].Text;
        txtProgramName.Text = gvRegularProgram.SelectedRow.Cells[2].Text;
        txtSiteType.Text = gvRegularProgram.SelectedRow.Cells[3].Text;
        txtStatus.Text = gvRegularProgram.SelectedRow.Cells[4].Text;
        txtDate.Text = gvRegularProgram.SelectedRow.Cells[1].Text;
        txtNumberOfChildren.Text = gvRegularProgram.SelectedRow.Cells[8].Text;
        txtNumberOfAdults.Text = gvRegularProgram.SelectedRow.Cells[9].Text;
        //CheckBoxAnimal.SelectedIndex = gvRegularProgram.SelectedRow.Cells[10];
        DropDownEducator.SelectedItem.Text = gvRegularProgram.SelectedRow.Cells[11].Text;
    }



    protected void CreateProgram(object sender, EventArgs e)
    {
        //Get multiple selections from Animal CheckBoxList and concatenate into 1 string to insert into database?
        //Need a way to input multiple animals -> in database, had to manually input the different animalID and animal names separately
        //^^basically added the same program and programID multiple times with its own different animal in ProgramAnimal table
        //Maybe have a foreach loop to insert the animals separately into each row with the corresponding ProgramID
        string selection = "";
        foreach (ListItem item in CheckBoxList1.Items)
        {
            selection += item.Selected + ", ";
        }
        //String id = "Select scope_identity from Program";
        String getID = "select max(ProgramID) as ProgramID from Program";

        //Once a user creates a program: Program, RegularProgram, Organization, ProgramOrganization, ProgramAnimal, Animal, Educator, and EducatorProgram Tables must be inserted and updated to

        String insertProgramQuery = "INSERT INTO Program VALUES (@ProgDate, @NumberOfChildren, @NumberOfAdults, @PaymentStatus, @LastUpdatedBy, @LastUpdated, @OrganizationName, @ProgramName)";
        String insertRegularProgramQuery = "INSERT INTO RegularProgram VALUES (@ProgramID, @ProgName, @SiteType, @ProgStatus, @ProgAddress, @City, @County)";
        sc.Open();
        //Inserting into Program table -- maybe have the trigger run to update ProgramID after inserting?
        SqlCommand insertProgramcmd = new SqlCommand(insertProgramQuery, sc);
        insertProgramcmd.Parameters.AddWithValue("@ProgDate", txtAddDate.Text);
        insertProgramcmd.Parameters.AddWithValue("@NumberOfChildren", txtAddChildren.Text);
        insertProgramcmd.Parameters.AddWithValue("@NumberOfAdults", txtAddAdults.Text);
        insertProgramcmd.Parameters.AddWithValue("@PaymentStatus", txtAddPaymentStatus.Text);
        insertProgramcmd.Parameters.AddWithValue("@LastUpdatedBy", "jlieu96");
        insertProgramcmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        insertProgramcmd.Parameters.AddWithValue("@OrganizationName", txtAddOrg.Text);
        insertProgramcmd.Parameters.AddWithValue("@ProgramName", DropDownProgram.SelectedValue);

        insertProgramcmd.ExecuteNonQuery();
        //Inserting into RegularProgram table
        SqlCommand insertRegularProgramCmd = new SqlCommand(insertRegularProgramQuery, sc);
        insertRegularProgramCmd.Parameters.AddWithValue("@ProgramID", Int32.Parse(getID));
        insertRegularProgramCmd.Parameters.AddWithValue("@ProgName", DropDownProgram.SelectedValue);
        insertRegularProgramCmd.Parameters.AddWithValue("@SiteType", DropDownSite.SelectedValue);
        insertRegularProgramCmd.Parameters.AddWithValue("@ProgStatus", CheckBoxStatus.Checked);
        insertRegularProgramCmd.Parameters.AddWithValue("@ProgAddress", txtAddProgAddress.Text);
        insertRegularProgramCmd.Parameters.AddWithValue("@City", txtAddProgCity.Text);
        insertRegularProgramCmd.Parameters.AddWithValue("@County", txtAddProgCounty.Text);

        insertRegularProgramCmd.ExecuteNonQuery();

        gvRegularProgram.DataBind();
        sc.Close();

    }

    
    //// Insert into database
    //protected void Button1_Click(object sender, EventArgs e)
    //{

    //    sc.Open();
    //    String site = "";
    //    if (RadioButton1.Checked)
    //    {
    //        site = "OnSite";
    //    }
    //    else
    //    {
    //        site = "OffSite";
    //    }

    //    String payment = "";
    //    if (RadioButton3.Checked)
    //    {
    //        payment = "Waiting for payment";
    //    }
    //    else
    //    {
    //        payment = "Payment received";
    //    }
    //    Programs prog = new Programs(organizationTxt.Text, site, statusDropDown.SelectedValue, streetTxt.Text, cityTxt.Text, countyTxt.Text, TextBox6.Text, DropDownList5.SelectedValue, TextBox4.Text, int.Parse(TextBox1.Text),
    //        int.Parse(TextBox2.Text), DropDownList2.SelectedValue, DropDownList3.SelectedValue, DropDownList4.SelectedValue, payment, "foreign key", "Stosh", DateTime.Today.ToString("d"), TextBox5.Text);
    //   String insertProgramQuery = "Insert into Program (ProgMonth, ProgDate, NumberOfKids, NumberOfAdult, PayStatus, InvoiceID, LastUpdatedBy, LastUpdated) " +
    //        "VALUES (@ProgMonth, @ProgDate, @NumberOfKids, @NumberOfAdult, @PayStatus, @InvoiceID, @LastUpdatedBy, @LastUpdated)";
    //    String regularProgramQuery = "INSERT INTO RegularProgram (ProgName, SiteType, ProgStatus, ProgAddress, City, County) " +
    //        "VALUES (@ProgName, @SiteType, @ProgStatus, @ProgAddress, @City, @County)";


    //    SqlCommand cmd = new SqlCommand(regularProgramQuery, sc);
    //    SqlCommand programcmd = new SqlCommand(insertProgramQuery, sc);

    //    cmd.Parameters.AddWithValue("@ProgName", prog.getProgramName()); //
    //    cmd.Parameters.AddWithValue("@SiteType", site); //
    //    cmd.Parameters.AddWithValue("@ProgStatus", statusDropDown.SelectedItem.Text); //
    //    cmd.Parameters.AddWithValue("@ProgAddress", prog.getProgramAddress()); //
    //    cmd.Parameters.AddWithValue("@City", prog.getCity()); //
    //    cmd.Parameters.AddWithValue("@County", prog.getCounty()); //




    //    programcmd.Parameters.AddWithValue("@ProgMonth", prog.getProgramMonth());
    //    programcmd.Parameters.AddWithValue("@ProgDate", prog.getProgramDate());
    //    programcmd.Parameters.AddWithValue("@NumberOfKids", prog.getNumberOfKids());
    //    programcmd.Parameters.AddWithValue("@NumberOfAdult", prog.getNumberOfAdults());
    //    programcmd.Parameters.AddWithValue("@PayStatus", payment);
    //    programcmd.Parameters.AddWithValue("@InvoiceID", "1");
    //    programcmd.Parameters.AddWithValue("@LastUpdatedBy", "Stosh");
    //    programcmd.Parameters.AddWithValue("@LastUpdated", DateTime.Today.ToString());




    //    cmd.ExecuteNonQuery();
    //    programcmd.ExecuteNonQuery();

    //    sc.Close();
    //}

    ////Yoooooooooooooooooooooooooooooooooooooo dogggggggg

    protected void UpdateProgram(object sender, EventArgs e)
    {

    }


    //public void fillStatusList()
    //{
    //    //not started
    //    ListItem statusNotStarted = new ListItem();
    //    statusNotStarted.Value = "0";
    //    statusNotStarted.Text = "Not Started";

    //    //incomplete
    //    ListItem statusIncomplete = new ListItem();
    //    statusIncomplete.Value = "1";
    //    statusIncomplete.Text = "Incomplete";

    //    //completed
    //    ListItem statusComplete = new ListItem();
    //    statusComplete.Value = "2";
    //    statusComplete.Text = "Completed";


    //    //adding to drop down list
    //    statusDropDown.Items.Add(statusNotStarted);
    //    statusDropDown.Items.Add(statusIncomplete);
    //    statusDropDown.Items.Add(statusComplete);
    //}

    //protected void fillMonthList()
    //{
    //    ListItem info = new ListItem();
    //    info.Value = "0";
    //    info.Text = "Choose Month";

    //    ListItem jan = new ListItem();
    //    jan.Value = "1";
    //    jan.Text = "January";

    //    ListItem feb = new ListItem();
    //    feb.Value = "2";
    //    feb.Text = "February";

    //    ListItem mar = new ListItem();
    //    mar.Value = "3";
    //    mar.Text = "March";

    //    ListItem apr = new ListItem();
    //    apr.Value = "4";
    //    apr.Text = "April";

    //    ListItem may = new ListItem();
    //    may.Value = "5";
    //    may.Text = "May";

    //    ListItem jun = new ListItem();
    //    jun.Value = "6";
    //    jun.Text = "June";

    //    ListItem jul = new ListItem();
    //    jul.Value = "7";
    //    jul.Text = "July";

    //    ListItem aug = new ListItem();
    //    aug.Value = "8";
    //    aug.Text = "August";

    //    ListItem sept = new ListItem();
    //    sept.Value = "9";
    //    sept.Text = "September";

    //    ListItem oct = new ListItem();
    //    oct.Value = "10";
    //    oct.Text = "October";

    //    ListItem nov = new ListItem();
    //    nov.Value = "11";
    //    nov.Text = "November";

    //    ListItem dec = new ListItem();
    //    dec.Value = "12";
    //    dec.Text = "December";

    //    DropDownList5.Items.Add(info);
    //    DropDownList5.Items.Add(jan);
    //    DropDownList5.Items.Add(feb);
    //    DropDownList5.Items.Add(mar);
    //    DropDownList5.Items.Add(apr);
    //    DropDownList5.Items.Add(may);
    //    DropDownList5.Items.Add(jun);
    //    DropDownList5.Items.Add(jul);
    //    DropDownList5.Items.Add(aug);
    //    DropDownList5.Items.Add(sept);
    //    DropDownList5.Items.Add(oct);
    //    DropDownList5.Items.Add(nov);
    //    DropDownList5.Items.Add(dec);
    //}


    //protected void populateAnimals(String condition, DropDownList list)
    //{
    //    SqlDataReader reader;
    //    ListItem newItem = new ListItem();
    //    String animalQuery = "Select AnimalID, AnimalName from Animal where AnimalType = " + condition;
    //    SqlCommand filler = new SqlCommand(animalQuery, sc);

    //    newItem.Value = "0";
    //    newItem.Text = "Select " + condition;
    //    list.Items.Add(newItem);
    //    sc.Open();

    //    reader = filler.ExecuteReader();

    //    while (reader.Read())
    //    {
    //        newItem = new ListItem();
    //        newItem.Value = reader["AnimalID"].ToString();
    //        newItem.Text = reader["AnimalName"].ToString();
    //        list.Items.Add(newItem);
    //    }
    //    list.DataBind();
    //    reader.Close();
    //    sc.Close();

    //}
}
