using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Program : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);
    ////SqlConnection sc = new SqlConnection(@"server =Localhost;Database=WildLifeCenter;Trusted_Connection=True");

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
                //r.Cells[0].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[1].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[2].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[3].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[4].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[5].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[6].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[7].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[8].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
                r.Cells[9].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvRegularProgram, "Select$" + r.RowIndex, true);
            }
        }

        base.Render(writer);
    }

    protected void DeleteProgram(object sender, EventArgs e)
    {
        try
        {
            String deactivateQuery = "Update Program set ProgStatus = 'Inactive' where ProgramID = @ProgramID";
            sc.Open();
            SqlCommand deletecmd = new SqlCommand(deactivateQuery, sc);
            deletecmd.Parameters.AddWithValue("@ProgramID", int.Parse(gvRegularProgram.SelectedRow.Cells[15].Text));
            deletecmd.ExecuteNonQuery();
            gvRegularProgram.DataBind();
            sc.Close();
        }
        catch
        {
            Response.Write("<script>alert('Error in deactivating program. Please try again.')</script>");
        }
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {

        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "openModal()", true);
        GridViewRow organizationName = gvRegularProgram.SelectedRow;

        EditOrganizationName.Text = gvRegularProgram.SelectedRow.Cells[0].Text;
        EditDate.Text = gvRegularProgram.SelectedRow.Cells[1].Text;
        EditTime.Text = gvRegularProgram.SelectedRow.Cells[2].Text;
        EditProgramName.SelectedItem.Text = gvRegularProgram.SelectedRow.Cells[3].Text;
        EditSiteType.SelectedItem.Text = gvRegularProgram.SelectedRow.Cells[4].Text;
        EditStatus.Text = gvRegularProgram.SelectedRow.Cells[5].Text;
        EditAddress.Text = gvRegularProgram.SelectedRow.Cells[6].Text;
        EditCity.SelectedItem.Text = gvRegularProgram.SelectedRow.Cells[7].Text;
        EditCounty.SelectedItem.Text = gvRegularProgram.SelectedRow.Cells[8].Text;
        EditNBchildren.Text = gvRegularProgram.SelectedRow.Cells[9].Text;
        EditNBAdults.Text = gvRegularProgram.SelectedRow.Cells[10].Text;
        EditComment.Text = gvRegularProgram.SelectedRow.Cells[13].Text;


    }

    protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect(ddlProgram.SelectedValue);
    }


    protected void CreateProgram(object sender, EventArgs e)
    {
        try
        {
            string selection = "";
            foreach (ListItem item in CheckBoxList1.Items)
            {
                selection += item.Selected + ", ";
            }

            //Once a user creates a program: Program, RegularProgram, Organization, ProgramOrganization, ProgramAnimal, Animal, Educator, and EducatorProgram Tables must be inserted and updated to
            String Status = "";
            if (CheckBoxStatus.Checked)
            {
                Status = "Complete";
            }
            else
            {
                Status = "Incomplete";
            }

            string ProgramName = "";
            if (DropDownProgram.SelectedIndex > -1)
            {

                ProgramName = txtProgramName.Text;
            }
            else
            {
                ProgramName = DropDownProgram.SelectedValue;
            }

            String insertProgramQuery = "INSERT INTO Program VALUES (@ProgDate, @NumberOfChildren, @NumberOfAdults, @PaymentStatus, @LastUpdatedBy, @LastUpdated, @OrganizationName, @ProgramName,@Comments,@ProgStatus,@ProgTime)";
            String insertRegularProgramQuery = "INSERT INTO RegularProgram VALUES ((Select MAX(ProgramID) from dbo.Program),@ProgName, @SiteType, @ProgStatus, @ProgAddress, @City, @County)";

            String updateAnimalQuery = "Update Animal set NumberOfEvents = @NumberOfEvents, NumberOfAdultsMet = @NumberOfAdultsMet, NumberOfChildrenMet = @NumberOfChildrenMet";
            sc.Open();
            //Inserting into Program table -- maybe have the trigger run to update ProgramID after inserting?
            SqlCommand insertProgramcmd = new SqlCommand(insertProgramQuery, sc);
            insertProgramcmd.Parameters.AddWithValue("@ProgDate", HttpUtility.HtmlEncode(txtAddDate.Text));
            insertProgramcmd.Parameters.AddWithValue("@NumberOfChildren", HttpUtility.HtmlEncode(txtAddChildren.Text));
            insertProgramcmd.Parameters.AddWithValue("@NumberOfAdults", HttpUtility.HtmlEncode(txtAddAdults.Text));
            insertProgramcmd.Parameters.AddWithValue("@PaymentStatus", txtPaymentStatus.SelectedValue);
            insertProgramcmd.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
            insertProgramcmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
            insertProgramcmd.Parameters.AddWithValue("@OrganizationName", HttpUtility.HtmlEncode(txtAddOrg.Text));
            insertProgramcmd.Parameters.AddWithValue("@ProgramName", DropDownProgram.SelectedValue);
            insertProgramcmd.Parameters.AddWithValue("@Comments", HttpUtility.HtmlEncode(txtComments.Text));
            insertProgramcmd.Parameters.AddWithValue("@ProgStatus", Status);
            insertProgramcmd.Parameters.AddWithValue("@ProgTime", HttpUtility.HtmlEncode(txtAddTime.Text));

            insertProgramcmd.ExecuteNonQuery();
            //Inserting into RegularProgram table
            SqlCommand insertRegularProgramCmd = new SqlCommand(insertRegularProgramQuery, sc);
            insertRegularProgramCmd.Parameters.AddWithValue("@ProgName", ProgramName);
            insertRegularProgramCmd.Parameters.AddWithValue("@SiteType", DropDownSite.SelectedValue);
            //insertRegularProgramCmd.Parameters.AddWithValue("@ProgStatus", CheckBoxStatus.Checked);
            insertRegularProgramCmd.Parameters.AddWithValue("@ProgStatus", Status);
            insertRegularProgramCmd.Parameters.AddWithValue("@ProgAddress", HttpUtility.HtmlEncode(txtAddProgAddress.Text));
            //insertRegularProgramCmd.Parameters.AddWithValue("@City", DropDownCityEdit.SelectedItem.Text);
            //insertRegularProgramCmd.Parameters.AddWithValue("@County", DropDownCityEdit.SelectedItem.Text);
            insertRegularProgramCmd.Parameters.AddWithValue("@City", DropDownList2.SelectedItem.Text);
            insertRegularProgramCmd.Parameters.AddWithValue("@County", DropDownList3.SelectedItem.Text);
            insertRegularProgramCmd.ExecuteNonQuery();


            //Inserting into EducatorProgram table
            string EducatorNameString = "";
            for (int i = 0; i < CheckBoxList2.Items.Count; i++)
            {
                if (CheckBoxList2.Items[i].Selected)
                {
                    EducatorNameString = CheckBoxList2.Items[i].Text;

                    string callEducator = "select * from [dbo].[Educator] where FirstName = '" + CheckBoxList2.Items[i].Text + "';";
                    SqlCommand cmdDatabase3 = new SqlCommand(callEducator, sc);
                    SqlDataReader reader;

                    reader = cmdDatabase3.ExecuteReader();

                    reader.Read();

                    string insertEducatorProgramQuery = "INSERT INTO EducatorProgram VALUES (@EducatorID, (Select MAX(ProgramID) from dbo.Program), @EducatorName, @ProgramName, @LastUpdatedBy, @LastUpdated)";

                    int EducatorID = reader.GetInt32(0);
                    SqlCommand insertEducatorProgramCmd = new SqlCommand(insertEducatorProgramQuery, sc);
                    insertEducatorProgramCmd.Parameters.AddWithValue("@EducatorID", EducatorID);
                    insertEducatorProgramCmd.Parameters.AddWithValue("@EducatorName", CheckBoxList1.Items[i].Text);
                    insertEducatorProgramCmd.Parameters.AddWithValue("@ProgramName", ProgramName);
                    insertEducatorProgramCmd.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
                    insertEducatorProgramCmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

                    reader.Close();
                    insertEducatorProgramCmd.ExecuteNonQuery();
                }
            }

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
                    String insertProAnimalQuery = "INSERT INTO ProgramAnimal VALUES ((Select MAX(ProgramID) from dbo.Program), @AnimalID,@ProgramName,@AnimalName,@NumberOfAdultsMet,@NumberOfChildrenMet,@LastUpdatedBy,@LastUpdated)";
                    SqlCommand cmd2 = new SqlCommand(insertProAnimalQuery, sc);
                    cmd2.Parameters.AddWithValue("@AnimalID", animalID); // add drop down list to describe types of viewing
                    cmd2.Parameters.AddWithValue("@ProgramName", ProgramName); //
                    cmd2.Parameters.AddWithValue("@AnimalName", CheckBoxList1.Items[i].Text); //
                    cmd2.Parameters.AddWithValue("@NumberOfAdultsMet", HttpUtility.HtmlEncode(txtAddChildren.Text));
                    cmd2.Parameters.AddWithValue("@NumberOfChildrenMet", HttpUtility.HtmlEncode(txtAddAdults.Text));
                    cmd2.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
                    cmd2.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

                    myreader.Close();
                    cmd2.ExecuteNonQuery();

                }
            }

            gvRegularProgram.DataBind();
            sc.Close();
        }
        catch
        {
            Response.Write("<script>alert('Error creating program. Make sure data entered matches the corresponding fields.')</script>");
        }
    }


    protected void UpdateProgram(object sender, EventArgs e)
    {

        sc.Open();
        String updateRegProgQuery = "Update [dbo].[RegularProgram] set ProgName = @ProgName, SiteType = @SiteType, ProgStatus = @ProgStatus, ProgAddress = @ProgAddress, " +
            "City = @City, County = @County, LastUpdatedBy = @LastUpdatedBy, LastUpdated = @LastUpdated where ProgramID =@ProgramID";

        String updateProgQuery = "Update [dbo].[Program] set ProgDate = @ProgDate, NumberOfChildren = @NumberOfChildren, NumberOfAdults = @NumberOfAdults, PaymentStatus = @PaymentStatus, " +
            "LastUpdatedBy = @LastUpdatedBy, LastUpdated = @LastUpdated, OrganizationName = @OrganizationName, ProgramName = @ProgramName, Comments = @Comments, ProgStatus = @ProgStatus, ProgTime = @ProgTime where ProgramID =@ProgramID";


        try
        {

            //update program
            SqlCommand insertProgramcmd = new SqlCommand(updateProgQuery, sc);
        //insertProgramcmd.Parameters.AddWithValue("@ProgDate",. txtDate.Text);
        //insertProgramcmd.Parameters.AddWithValue("@NumberOfChildren", txtNumberOfChildren.Text);
        //insertProgramcmd.Parameters.AddWithValue("@NumberOfAdults", txtNumberOfAdults.Text);
        //insertProgramcmd.Parameters.AddWithValue("@PaymentStatus", txtPaymentStatus.SelectedValue);
        insertProgramcmd.Parameters.AddWithValue("@ProgDate", HttpUtility.HtmlEncode(EditDate.Text));
        insertProgramcmd.Parameters.AddWithValue("@NumberOfChildren", HttpUtility.HtmlEncode(EditNBchildren.Text));
        insertProgramcmd.Parameters.AddWithValue("@NumberOfAdults", HttpUtility.HtmlEncode(EditNBAdults.Text));
        insertProgramcmd.Parameters.AddWithValue("@PaymentStatus", EditPaymentSatus.SelectedValue);
        insertProgramcmd.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
        insertProgramcmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        //insertProgramcmd.Parameters.AddWithValue("@OrganizationName", txtOrganizationName.Text);
        //insertProgramcmd.Parameters.AddWithValue("@ProgramName", DropDownProgram.SelectedValue);
        //insertProgramcmd.Parameters.AddWithValue("@Comments", Commentstxt.Text);
        //insertProgramcmd.Parameters.AddWithValue("@ProgramID", int.Parse(gvRegularProgram.SelectedRow.Cells[13].Text));
        insertProgramcmd.Parameters.AddWithValue("@OrganizationName", HttpUtility.HtmlEncode(EditOrganizationName.Text));
        insertProgramcmd.Parameters.AddWithValue("@ProgramName", EditProgramName.SelectedValue);
        insertProgramcmd.Parameters.AddWithValue("@Comments", HttpUtility.HtmlEncode(EditComment.Text));
        insertProgramcmd.Parameters.AddWithValue("@ProgStatus", HttpUtility.HtmlEncode(EditStatus.Text));
        insertProgramcmd.Parameters.AddWithValue("@ProgTime", HttpUtility.HtmlEncode(EditTime.Text));
        insertProgramcmd.Parameters.AddWithValue("@ProgramID", int.Parse(gvRegularProgram.SelectedRow.Cells[15].Text));
        insertProgramcmd.ExecuteNonQuery();
        //update regular program
        String Status = "";
        if (CheckBoxStatus.Checked)
        {
            Status = "Complete";
        }
        else
        {
            Status = "Incomplete";
        }
        SqlCommand insertRegularProgramCmd = new SqlCommand(updateRegProgQuery, sc);

        insertRegularProgramCmd.Parameters.AddWithValue("@ProgName", EditProgramName.SelectedValue);
        insertRegularProgramCmd.Parameters.AddWithValue("@SiteType", EditSiteType.SelectedValue);
        insertRegularProgramCmd.Parameters.AddWithValue("@ProgStatus", Status);
        insertRegularProgramCmd.Parameters.AddWithValue("@ProgAddress", HttpUtility.HtmlEncode(EditProgramAddres.Text));
        insertRegularProgramCmd.Parameters.AddWithValue("@City", EditCity.SelectedItem.Text);
        insertRegularProgramCmd.Parameters.AddWithValue("@County", EditCounty.SelectedItem.Text);
        insertRegularProgramCmd.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
        insertRegularProgramCmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
        insertRegularProgramCmd.Parameters.AddWithValue("@ProgramID", int.Parse(gvRegularProgram.SelectedRow.Cells[15].Text));

        insertRegularProgramCmd.ExecuteNonQuery();

        string EducatorNameString = "";
        for (int i = 0; i < CheckBoxList3.Items.Count; i++)
        {
            if (CheckBoxList3.Items[i].Selected)
            {
                EducatorNameString = CheckBoxList3.Items[i].Text;

                string callEducator = "select * from [dbo].[Educator] where FirstName = '" + CheckBoxList3.Items[i].Text + "';";
                SqlCommand cmdDatabase3 = new SqlCommand(callEducator, sc);
                SqlDataReader reader;

                reader = cmdDatabase3.ExecuteReader();

                reader.Read();

                String updateProgAnimalQuery = "Update [dbo].[EducatorProgram] set EducatorName = @EducatorName, ProgramName = @ProgramName, LastUpdatedBy = @LastUpdatedBy, LastUpdated = @LastUpdated " +
                "where ProgramID = @ProgramID and EducatorID = @EducatorID";



                int EducatorID = reader.GetInt32(0);
                SqlCommand EditEducator = new SqlCommand(updateProgAnimalQuery, sc);
                EditEducator.Parameters.AddWithValue("@EducatorID", EducatorID);
                EditEducator.Parameters.AddWithValue("@EducatorName", CheckBoxList3.Items[i].Text);
                EditEducator.Parameters.AddWithValue("@ProgramName", DropDownProgram.SelectedValue);
                EditEducator.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
                EditEducator.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
                EditEducator.Parameters.AddWithValue("@ProgramID", int.Parse(gvRegularProgram.SelectedRow.Cells[15].Text));
                

                reader.Close();
                EditEducator.ExecuteNonQuery();
            }
        }

        //update into programAnimal table
        string AnimalNameString = "";
        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected)
            {
                AnimalNameString = CheckBoxList1.Items[i].Text;


                //string getAnimal = "select * from [dbo].[Animal] where AnimalName = '" + CheckBoxAnimal.Items[i].Text + "';";
                string getAnimal = "select * from [dbo].[Animal] where AnimalName = '" + EditAnimal.Items[i].Text + "';";
                SqlCommand cmdDatabase1 = new SqlCommand(getAnimal, sc);
                SqlDataReader myreader;

                myreader = cmdDatabase1.ExecuteReader();
                myreader.Read();

                int animalID = myreader.GetInt32(0);
                //String insertProAnimalQuery = "INSERT INTO ProgramAnimal VALUES ((Select MAX(ProgramID) from dbo.Program), @AnimalID,@ProgramName,@AnimalName,@NumberOfAdultsMet,@NumberOfChildrenMet)";
                String updateProgAnimalQuery = "Update [dbo].[ProgramAnimal] set ProgramName = @ProgramName, AnimalName = @AnimalName, NumberOfAdultsMet = @NumberOfAdultsMet, NumberOfChildrenMet = @NumberOfChildrenMet, " +
            "LastUpdatedBy = @LastUpdatedBy, LastUpdated = @LastUpdated where ProgramID = @ProgramID and AnimalID = @AnimalID";
                SqlCommand cmd2 = new SqlCommand(updateProgAnimalQuery, sc);
                cmd2.Parameters.AddWithValue("@AnimalID", animalID); // add drop down list to describe types of viewing                                            
                cmd2.Parameters.AddWithValue("@ProgramName", EditProgramName.SelectedItem.Text); //
                cmd2.Parameters.AddWithValue("@AnimalName", EditAnimal.Items[i].Text); //
                cmd2.Parameters.AddWithValue("@NumberOfAdultsMet", HttpUtility.HtmlEncode(EditNBAdults.Text));
                cmd2.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
                cmd2.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
                cmd2.Parameters.AddWithValue("@NumberOfChildrenMet", HttpUtility.HtmlEncode(EditNBchildren.Text));
                myreader.Close();
                cmd2.ExecuteNonQuery();

            }
        }
        gvRegularProgram.DataBind();
        }
        catch
        {
            Response.Write("<script>alert(' Invalid data type entered into database. Make sure data entered matches the corresponding fields. ')</script>");
        }
        sc.Close();
    }


    protected void cityDropdown_SelectedIndexChanged(object sender, EventArgs e)
    {
        //txtCity.Text = cityDropdown.SelectedValue;
    }

    protected void btnLoad_Click(object sender, EventArgs e)
    {


        sc.Open();
        string sqlQuery = "select P.Comments, E.EducatorName, P.OrganizationName, P.ProgDate, P.ProgTime, R.ProgName, R.SiteType, R.ProgStatus, R.ProgAddress, R.City, R.County, P.NumberOfChildren, P.NumberOfAdults, A.AnimalName, P.ProgramID, A.AnimalID, E.EducatorID, P.ProgStatus from dbo.ProgramAnimal A, dbo.Program P, dbo.RegularProgram R, dbo.EducatorProgram E where P.ProgramID = R.ProgramID and A.ProgramID = P.ProgramID and E.ProgramID=P.ProgramID and P.ProgDate between '" + txtStart.Text + "' and '" + txtEnd.Text + "'";

        SqlDataSource1.SelectCommand = sqlQuery;
        gvRegularProgram.DataBind();


        sc.Close();
        
    }

    protected void undo_Click(object sender, EventArgs e)
    {
        sc.Open();
        string sqlQuery = "select P.Comments, E.EducatorName, P.OrganizationName, P.ProgDate, P.ProgTime, R.ProgName, R.SiteType, R.ProgStatus, R.ProgAddress, R.City, R.County, P.NumberOfChildren, P.NumberOfAdults, A.AnimalName, P.ProgramID, A.AnimalID, E.EducatorID, P.ProgStatus from dbo.ProgramAnimal A, dbo.Program P, dbo.RegularProgram R, dbo.EducatorProgram E where P.ProgramID = R.ProgramID and A.ProgramID = P.ProgramID and E.ProgramID=P.ProgramID";
        SqlDataSource1.SelectCommand = sqlQuery;
        gvRegularProgram.DataBind();
        sc.Close();
    }
}
