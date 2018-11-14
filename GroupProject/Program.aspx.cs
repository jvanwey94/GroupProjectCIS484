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
                r.Cells[0].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[1].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[2].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[3].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[4].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[5].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[6].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[7].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[8].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
            }
        }

        base.Render(writer);
    }

    protected void DeleteProgram(object sender, EventArgs e)
    {
        List<ListItem> pklist = new List<ListItem>();
        String regProgPkQuery = "Select ProgramID, ProgName from [dbo].[RegularProgram]";
        String deleteQuery = "Delete from [dbo].[RegularProgram] rp inner join [dbo].[Program] p on rp.ProgramID = p.ProgramID inner join [dbo].[EducatorProgram] ep on p.ProgramID = ep.ProgramID where rp.ProgName = @ProgName " +
            "AND rp.SiteType = @SiteType AND rp.ProgStatus = @ProgStatus AND rp.ProgAddress = @ProgAddress AND rp.City = @City AND rp.County = @County AND p.ProgDate = @ProgDate AND " +
            "p.NumberOfChildren = @NumberOfChildren AND p.NumberOfAdults = @NumberOfAdults AND p.OrganizationName = @OrganizationName AND p.ProgramName = @ProgamName AND ep.EducatorName = @EducatorName AND ep.ProgramName = @ProgramName";
        String pkdelete = "Delete from [dbo].[Program] where ProgramID = @ProgramID";

        sc.Open();

        String delQuery = "Delete from [dbo].[RegularProgram] rp inner join [dbo].[Program] p on rp.ProgramID = p.ProgramID inner join [dbo].[EducatorProgram] ep on p.programID = ep.ProgramID where rp.ProgName = @ProgName " +
            "AND rp.SiteType = @SiteType AND rp.ProgStatus = @ProgStatus AND rp.ProgAddress = @ProgAddress AND rp.City = @City AND rp.County = @County AND p.progDate = @ProgDate AND " +
            "p.NumberOfChildren = @NumberOfChildren AND p.NumberOfAdults = @NumberOfAdults AND p.OrganizationName = @OrganizationName AND p.ProgramName = @ProgramName AND ep.EducatorName = @EducatorName AND ep.ProgramName = @ProgramName";
        //fix this 
        String delete = "DELETE FROM [dbo].[RegularProgram] r inner join ";
        // select scope_identity() - gets latest inserted value

        SqlCommand delcmd = new SqlCommand(pkdelete, sc);
        delcmd.Parameters.AddWithValue("@ProgramID", gvRegularProgram.SelectedRow.Cells[12].Text);

        delcmd.ExecuteNonQuery();

        //SqlCommand delcmd = new SqlCommand(delQuery, sc);
        //delcmd.Parameters.AddWithValue("@ProgName", txtProgramName.Text);
        //delcmd.Parameters.AddWithValue("@SiteType", txtSiteType.Text);
        //delcmd.Parameters.AddWithValue("@ProgStatus", txtStatus.Text);
        //delcmd.Parameters.AddWithValue("@ProgAddress", txtOrganizationAddress.Text);
        //delcmd.Parameters.AddWithValue("@City", txtCity.Text);
        //delcmd.Parameters.AddWithValue("@County", txtCounty.Text);
        //delcmd.Parameters.AddWithValue("@ProgDate", txtDate.Text);
        //delcmd.Parameters.AddWithValue("@NumberOfChildren", txtNumberOfChildren.Text);
        //delcmd.Parameters.AddWithValue("@NumberOfAdults", txtNumberOfAdults.Text);
        //delcmd.Parameters.AddWithValue("@OrganizationName", txtOrganizationName.Text);
        //delcmd.Parameters.AddWithValue("@ProgamName", txtProgramName.Text);
        //delcmd.Parameters.AddWithValue("@EducatorName", DropDownEducator.SelectedItem.Value);
        //delcmd.Parameters.AddWithValue("@ProgramName", txtProgramName.Text);
    

        //delcmd.ExecuteNonQuery();
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {

        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "openModal()", true);
        GridViewRow organizationName = gvRegularProgram.SelectedRow;
        //txtOrganizationName.Text = (string)gvRegularProgram.DataKeys[organizationName.RowIndex]["Column1"];

        txtOrganizationName.Text = gvRegularProgram.SelectedRow.Cells[0].Text;
        txtOrganizationAddress.Text = gvRegularProgram.SelectedRow.Cells[5].Text;
        DropDownCityEdit.SelectedItem.Text = gvRegularProgram.SelectedRow.Cells[6].Text;
        DropDownCountyEdit.SelectedItem.Text = gvRegularProgram.SelectedRow.Cells[7].Text;
        txtProgramName.Text = gvRegularProgram.SelectedRow.Cells[2].Text;
        txtSiteType.Text = gvRegularProgram.SelectedRow.Cells[3].Text;
        txtStatus.Text = gvRegularProgram.SelectedRow.Cells[4].Text;
        txtDate.Text = gvRegularProgram.SelectedRow.Cells[1].Text;
        txtNumberOfChildren.Text = gvRegularProgram.SelectedRow.Cells[8].Text;
        txtNumberOfAdults.Text = gvRegularProgram.SelectedRow.Cells[9].Text;
        //CheckBoxAnimal.SelectedIndex = gvRegularProgram.SelectedRow.Cells[10];
        DropDownEducator.SelectedItem.Text = gvRegularProgram.SelectedRow.Cells[11].Text;
        Commentstxt.Text = gvRegularProgram.SelectedRow.Cells[12].Text;
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

        //Once a user creates a program: Program, RegularProgram, Organization, ProgramOrganization, ProgramAnimal, Animal, Educator, and EducatorProgram Tables must be inserted and updated to
       
        String insertProgramQuery = "INSERT INTO Program VALUES (@ProgDate, @NumberOfChildren, @NumberOfAdults, @PaymentStatus, @LastUpdatedBy, @LastUpdated, @OrganizationName, @ProgramName,@Comments)";
        String insertRegularProgramQuery = "INSERT INTO RegularProgram VALUES ((Select MAX(ProgramID) from dbo.Program),@ProgName, @SiteType, @ProgStatus, @ProgAddress, @City, @County)";
       
        String updateAnimalQuery = "Update Animal set NumberOfEvents = @NumberOfEvents, NumberOfAdultsMet = @NumberOfAdultsMet, NumberOfChildrenMet = @NumberOfChildrenMet";
        sc.Open();
        //Inserting into Program table -- maybe have the trigger run to update ProgramID after inserting?
        SqlCommand insertProgramcmd = new SqlCommand(insertProgramQuery, sc);
        insertProgramcmd.Parameters.AddWithValue("@ProgDate", txtAddDate.Text);
        insertProgramcmd.Parameters.AddWithValue("@NumberOfChildren", txtAddChildren.Text);
        insertProgramcmd.Parameters.AddWithValue("@NumberOfAdults", txtAddAdults.Text);
        insertProgramcmd.Parameters.AddWithValue("@PaymentStatus", txtPaymentStatus.SelectedValue);
        insertProgramcmd.Parameters.AddWithValue("@LastUpdatedBy", "Kevin");
        insertProgramcmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        insertProgramcmd.Parameters.AddWithValue("@OrganizationName", txtAddOrg.Text);
        insertProgramcmd.Parameters.AddWithValue("@ProgramName", DropDownProgram.SelectedValue);
        insertProgramcmd.Parameters.AddWithValue("@Comments", txtComments.Text);

        insertProgramcmd.ExecuteNonQuery();
        //Inserting into RegularProgram table
        SqlCommand insertRegularProgramCmd = new SqlCommand(insertRegularProgramQuery, sc);
        insertRegularProgramCmd.Parameters.AddWithValue("@ProgName", DropDownProgram.SelectedValue);
        insertRegularProgramCmd.Parameters.AddWithValue("@SiteType", DropDownSite.SelectedValue);
        insertRegularProgramCmd.Parameters.AddWithValue("@ProgStatus", CheckBoxStatus.Checked);
        insertRegularProgramCmd.Parameters.AddWithValue("@ProgAddress", txtAddProgAddress.Text);
        insertRegularProgramCmd.Parameters.AddWithValue("@City", DropDownCityEdit.SelectedItem.Text);
        insertRegularProgramCmd.Parameters.AddWithValue("@County", DropDownCityEdit.SelectedItem.Text);

        insertRegularProgramCmd.ExecuteNonQuery();


        //Inserting into EducatorProgram table
        string callEducator = "select * from [dbo].[Educator] where FirstName = '" + DropDownEducator.SelectedItem.Text + "';";
        SqlCommand cmdDatabase3 = new SqlCommand(callEducator, sc);
        SqlDataReader reader;

        reader = cmdDatabase3.ExecuteReader();

        reader.Read();
        
        string insertEducatorProgramQuery = "INSERT INTO EducatorProgram VALUES (@EducatorID, (Select MAX(ProgramID) from dbo.Program), @EducatorName, @ProgramName)";

        int EducatorID = reader.GetInt32(0);
        SqlCommand insertEducatorProgramCmd = new SqlCommand(insertEducatorProgramQuery, sc);
        insertEducatorProgramCmd.Parameters.AddWithValue("@EducatorID", EducatorID);
        insertEducatorProgramCmd.Parameters.AddWithValue("@EducatorName", DropDownEducator.SelectedItem.Text);
        insertEducatorProgramCmd.Parameters.AddWithValue("@ProgramName", DropDownProgram.SelectedValue);

        reader.Close();
        insertEducatorProgramCmd.ExecuteNonQuery();

        //Insert into programAnimal table
        string AnimalNameString = "";
        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected)
            {
                AnimalNameString = CheckBoxList1.Items[i].Text;


                string getAnimal = "select * from [dbo].[Animal] where AnimalName = '" + CheckBoxList1.Items[i].Text + "';";
                SqlCommand cmdDatabase1 = new SqlCommand(getAnimal, sc);
                SqlDataReader myreader;
                
                myreader = cmdDatabase1.ExecuteReader();
                myreader.Read();

                int animalID = myreader.GetInt32(0);
                String insertProAnimalQuery = "INSERT INTO ProgramAnimal VALUES ((Select MAX(ProgramID) from dbo.Program), @AnimalID,@ProgramName,@AnimalName,@NumberOfAdultsMet,@NumberOfChildrenMet)";
                SqlCommand cmd2 = new SqlCommand(insertProAnimalQuery, sc);
                cmd2.Parameters.AddWithValue("@AnimalID", animalID); // add drop down list to describe types of viewing
                cmd2.Parameters.AddWithValue("@ProgramName", DropDownProgram.SelectedValue); //
                cmd2.Parameters.AddWithValue("@AnimalName", CheckBoxList1.Items[i].Text); //
                cmd2.Parameters.AddWithValue("@NumberOfAdultsMet", txtAddChildren.Text);
                cmd2.Parameters.AddWithValue("@NumberOfChildrenMet", txtAddAdults.Text);
                
                myreader.Close();
                cmd2.ExecuteNonQuery();
                
            }
        }

        gvRegularProgram.DataBind();
        sc.Close();

    }


    protected void UpdateProgram(object sender, EventArgs e)
    {
        String updateRegProgQuery = "Update [dbo].[RegularProgram] set ProgName = @ProgName, SiteType = @SiteType, ProgStatus = @ProgStatus, ProgAddress = @ProgAddress, " +
            "City = @City, County = @County where ProgramID = @ProgramID";
        String updateProgQuery = "Update [dbo].[Program] set ProgDate = @ProgDate, NumberOfChildren = @NumberOfChildren, NumberOfAdults = @NumberOfAdults, PaymentStatus = @PaymentStatus, " +
            "LastUpdatedBy = @LastUpdatedBy, LastUpdated = @LastUpdated, OrganizationName = @OrganizationName, ProgramName = @ProgramName, Comments = @Comments where ProgramID = @ProgramID";
        String updateProgAnimalQuery = "Update [dbo].[ProgramAnimal] set ProgramName = @ProgramName, AnimalName = @AnimalName, NumberOfAdultsMet = @NumberOfAdultsMet, NumberOfChildrenMet = @NumberOfChildrenMet " +
            "where ProgramID = @ProgramID and AnimalID = @AnimalID";
        String educatorProgQuery = "Update [dbo].[EducatorProgram] set EducatorName = @EducatorName, ProgramName = @ProgramName " +
            "where EducatorID = @EducatorID and ProgramName = @ProgramName";

        SqlCommand regProgUpdate = new SqlCommand(updateRegProgQuery, sc);
        regProgUpdate.Parameters.AddWithValue("@ProgName", "");
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

    protected void cityDropdown_SelectedIndexChanged(object sender, EventArgs e)
    {
        //txtCity.Text = cityDropdown.SelectedValue;
    }
}
