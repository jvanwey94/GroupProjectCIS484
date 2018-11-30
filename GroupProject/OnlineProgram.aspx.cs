using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//dsdsd

public partial class OnlineProgram : System.Web.UI.Page
{
    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            fillGradeList();
            //addOnlineProgram.Visible = true;
        }

    }


    protected void updateOnlineProgram(object sender, EventArgs e)
    {
        try
        {
            String updateOPQuery = "Update [dbo].[OnlineProgram] set Type = @Type, Country = @Country, State = @State, Grade = @Grade, " +
                "Email = @Email, Theme = @Theme, organizationName = @organizationName where ProgramID = @ProgramID";
            String updatePQuery = "Update [dbo].[Program] set ProgramName = @ProgramName, ProgDate = @ProgDate, NumberOfChildren = @NumberOfChildren, NumberOfAdults = @NumberOfAdults, Comments = @Comments " +
                "where ProgramID = @ProgramID";
            sc.Open();
            SqlCommand opcmd = new SqlCommand(updateOPQuery, sc);
            opcmd.Parameters.AddWithValue("@Type", HttpUtility.HtmlEncode(TypeTXT.Text));
            opcmd.Parameters.AddWithValue("@Country", HttpUtility.HtmlEncode(CountryTXT.Text));
            opcmd.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode(StateTXT.Text));
            opcmd.Parameters.AddWithValue("@Grade", HttpUtility.HtmlEncode(GradeTXT.Text));
            opcmd.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(EmailTXT.Text));
            opcmd.Parameters.AddWithValue("@Theme", HttpUtility.HtmlEncode(ThemeTXT.Text));
            opcmd.Parameters.AddWithValue("@organizationName", HttpUtility.HtmlEncode(OrgNameTXT.Text));
            opcmd.Parameters.AddWithValue("@ProgramID", int.Parse(GridViewOnlineProgram.SelectedRow.Cells[13].Text));


            SqlCommand pcmd = new SqlCommand(updatePQuery, sc);
            pcmd.Parameters.AddWithValue("@ProgramName", DropDownOnline.SelectedItem.Text);
            pcmd.Parameters.AddWithValue("@ProgDate", HttpUtility.HtmlEncode(ProgDateTXT.Text));
            pcmd.Parameters.AddWithValue("@NumberOfChildren", HttpUtility.HtmlEncode(NumberOfChildrenTXT.Text));
            pcmd.Parameters.AddWithValue("@NumberOfAdults", HttpUtility.HtmlEncode(NumberOfAdultsTXT.Text));
            pcmd.Parameters.AddWithValue("@Comments", HttpUtility.HtmlEncode(CommentsTXT.Text));
            pcmd.Parameters.AddWithValue("@ProgramID", int.Parse(GridViewOnlineProgram.SelectedRow.Cells[13].Text));

            opcmd.ExecuteNonQuery();
            pcmd.ExecuteNonQuery();
            sc.Close();
    }
        catch
        {
            Response.Write("<script>alert('Error updating online program. Make sure data entered matches the corresponding fields.')</script>");
        }
    }

    protected void CreateProgram(object sender, EventArgs e)
    {
         try
         {
        String stat = ""; 
            if (CheckBox1.Checked)
            {
                stat = "Complete";
            }
            else
            {
                stat = "Incomplete";
            }
            sc.Open();
            String payment = "Free";


            String insertOnlineProgramQuery = "INSERT INTO OnlineProgram (ProgramID,Type,Country,State,Grade,Email,Theme) " +
                "VALUES ((Select MAX(ProgramID) from dbo.Program), @Type, @Country, @State, @Grade, @Email, @Theme)";
            String insertProgramQuery = "Insert into Program (ProgDate, NumberOfChildren, NumberOfAdults, PaymentStatus, LastUpdatedBy, LastUpdated, OrganizationName,ProgramName,Comments,ProgStatus,ProgTime) " +
                "VALUES (@ProgDate, @NumberOfChildren, @NumberOfAdults, @PaymentStatus, @LastUpdatedBy, @LastUpdated, @OrganizationName, @ProgramName, @Comments, @ProgStatus, @ProgTime)";



            SqlCommand programcmd = new SqlCommand(insertProgramQuery, sc);
            //programcmd.Parameters.AddWithValue("@ProgMonth", TextBox12.Text);
            programcmd.Parameters.AddWithValue("@ProgDate", HttpUtility.HtmlEncode(txtDate.Text));
            programcmd.Parameters.AddWithValue("@NumberOfChildren", HttpUtility.HtmlEncode(txtNK.Text));
            programcmd.Parameters.AddWithValue("@NumberOfAdults", HttpUtility.HtmlEncode(txtNumberOFAdults.Text));
            programcmd.Parameters.AddWithValue("@PaymentStatus", payment);
            programcmd.Parameters.AddWithValue("@LastUpdatedBy", "Kevin");
            programcmd.Parameters.AddWithValue("@LastUpdated", DateTime.Today.ToString());
            programcmd.Parameters.AddWithValue("@OrganizationName", HttpUtility.HtmlEncode(txtOrganizationName.Text));
            programcmd.Parameters.AddWithValue("@ProgramName", DropDownOnline2.SelectedItem.Text);
            programcmd.Parameters.AddWithValue("@Comments", HttpUtility.HtmlEncode(txtComments.Text));
            programcmd.Parameters.AddWithValue("@ProgStatus", stat);
            programcmd.Parameters.AddWithValue("@ProgTime", "14:30:00");

        
            


            SqlCommand cmd = new SqlCommand(insertOnlineProgramQuery, sc);
            cmd.Parameters.AddWithValue("@Type", HttpUtility.HtmlEncode(txtType.Text)); // add drop down list to describe types of viewing
            cmd.Parameters.AddWithValue("@Country", HttpUtility.HtmlEncode(txtCountry.Text)); //
            cmd.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode(txtState.Text)); //
            cmd.Parameters.AddWithValue("@Grade", DropDownList1.SelectedValue.ToString()); //
            cmd.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(txtEmail.Text)); //
            cmd.Parameters.AddWithValue("@Theme", HttpUtility.HtmlEncode(txtTheme.Text)); // 

            programcmd.ExecuteNonQuery();
            GridViewOnlineProgram.DataBind();
            cmd.ExecuteNonQuery();



            string AnimalNameString = "";
            //foreach (ListItem item in CheckBoxList1.Items)
            //{
            //    AnimalNameString += item.Selected + ", ";
            //}
            //txtCountry.Text = AnimalNameString;

            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    AnimalNameString = CheckBoxList1.Items[i].Text + "  ";


                    string getAnimalID = "select * from [dbo].[Animal] where AnimalName = '" + CheckBoxList1.Items[i].Text + "';";
                    SqlCommand cmdDatabase1 = new SqlCommand(getAnimalID, sc);

                    SqlDataReader myreader;


                    myreader = cmdDatabase1.ExecuteReader();

                    //while (myreader.Read())
                    myreader.Read();


                    int animalID = myreader.GetInt32(0);
                    String insertProAnimalQuery = "INSERT INTO ProgramAnimal VALUES ((Select MAX(ProgramID) from dbo.Program), @AnimalID,@ProgramName,@AnimalName,@NumberOfAdultsMet,@NumberOfChildrenMet)";
                    SqlCommand cmd1 = new SqlCommand(insertProAnimalQuery, sc);
                    cmd1.Parameters.AddWithValue("@AnimalID", animalID); // add drop down list to describe types of viewing
                    cmd1.Parameters.AddWithValue("@ProgramName", DropDownOnline.SelectedItem.Text); //
                    cmd1.Parameters.AddWithValue("@AnimalName", AnimalNameString); //
                    cmd1.Parameters.AddWithValue("@NumberOfAdultsMet", HttpUtility.HtmlEncode(txtNumberOFAdults.Text));
                    cmd1.Parameters.AddWithValue("@NumberOfChildrenMet", HttpUtility.HtmlEncode(txtNK.Text));


                    myreader.Close();
                    cmd1.ExecuteNonQuery();

                    //}

                }
            }

            //SqlCommand cmd1 = new SqlCommand(insertProAnimalQuery, sc);
            //cmd1.Parameters.AddWithValue("@AnimalID", "1"); // add drop down list to describe types of viewing
            //cmd1.Parameters.AddWithValue("@ProgramName", txtProgramName.Text); //
            //cmd1.Parameters.AddWithValue("@AnimalName", finalAnimalNameString); //
            //cmd1.Parameters.AddWithValue("@NumberOfAdultsMet", txtNumberOFAdults.Text);
            //cmd1.Parameters.AddWithValue("@NumberOfChildrenMet", txtNK.Text);



            sc.Close();
        }
        catch
        {
           // Response.Write("<script>alert('Error creating online program. Make sure data entered matches the corresponding fields.')</script>");
        }
    }

    protected void DeleteOnlineProgram(object sender, EventArgs e)
    {
        try
        {


            String deactivateQuery = "Update Program set ProgStatus = 'Inactive' where ProgramID = @ProgramID";

            sc.Open();
            SqlCommand delcmd = new SqlCommand(deactivateQuery, sc);
            delcmd.Parameters.AddWithValue("@ProgramID", int.Parse(GridViewOnlineProgram.SelectedRow.Cells[13].Text));
            delcmd.ExecuteNonQuery();
            sc.Close();
        }
        catch
        {
            Response.Write("<script>alert('Error deactivating online program. Please try again.')</script>");
        }
    }


    protected void fillGradeList()
    {
        ListItem gradeBlank = new ListItem();
        gradeBlank.Value = "0";
        gradeBlank.Text = "Choose Grade Level";

        ListItem gradeK = new ListItem();
        gradeK.Value = "1";
        gradeK.Text = "K";

        ListItem grade1 = new ListItem();
        grade1.Value = "2";
        grade1.Text = "1";

        ListItem grade2 = new ListItem();
        grade2.Value = "3";
        grade2.Text = "2";

        ListItem grade3 = new ListItem();
        grade3.Value = "4";
        grade3.Text = "3";

        ListItem grade4 = new ListItem();
        grade4.Value = "5";
        grade4.Text = "4";

        ListItem grade5 = new ListItem();
        grade5.Value = "6";
        grade5.Text = "5";

        ListItem grade6 = new ListItem();
        grade6.Value = "7";
        grade6.Text = "6";

        ListItem grade7 = new ListItem();
        grade7.Value = "8";
        grade7.Text = "7";

        ListItem grade8 = new ListItem();
        grade8.Value = "9";
        grade8.Text = "8";

        ListItem grade9 = new ListItem();
        grade9.Value = "10";
        grade9.Text = "9";

        ListItem grade10 = new ListItem();
        grade10.Value = "11";
        grade10.Text = "10";

        ListItem grade11 = new ListItem();
        grade11.Value = "12";
        grade11.Text = "11";

        ListItem grade12 = new ListItem();
        grade12.Value = "13";
        grade12.Text = "12";

        DropDownList1.Items.Add(gradeBlank);
        DropDownList1.Items.Add(gradeK);
        DropDownList1.Items.Add(grade1);
        DropDownList1.Items.Add(grade2);
        DropDownList1.Items.Add(grade3);
        DropDownList1.Items.Add(grade4);
        DropDownList1.Items.Add(grade5);
        DropDownList1.Items.Add(grade6);
        DropDownList1.Items.Add(grade7);
        DropDownList1.Items.Add(grade8);
        DropDownList1.Items.Add(grade9);
        DropDownList1.Items.Add(grade10);
        DropDownList1.Items.Add(grade11);
        DropDownList1.Items.Add(grade12);
    }


    //EXIT METHOD another thing
    protected void Button2_Click(object sender, EventArgs e)
    {
        System.Environment.Exit(0);
    }

    protected override void Render(HtmlTextWriter writer)
    {
        foreach (GridViewRow r in GridViewOnlineProgram.Rows)
        {
            if (r.RowType == DataControlRowType.DataRow)
            {
                r.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                r.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                r.ToolTip = "Click to edit Animal";
                r.Cells[1].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridViewOnlineProgram, "Select$" + r.RowIndex, true);
                r.Cells[2].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridViewOnlineProgram, "Select$" + r.RowIndex, true);
                r.Cells[3].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridViewOnlineProgram, "Select$" + r.RowIndex, true);
                r.Cells[4].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridViewOnlineProgram, "Select$" + r.RowIndex, true);
                r.Cells[5].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridViewOnlineProgram, "Select$" + r.RowIndex, true);
                r.Cells[6].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridViewOnlineProgram, "Select$" + r.RowIndex, true);
                r.Cells[7].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridViewOnlineProgram, "Select$" + r.RowIndex, true);
                r.Cells[8].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridViewOnlineProgram, "Select$" + r.RowIndex, true);
            }
        }
        base.Render(writer);
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "openModal()", true);

        //this is probably wrong, im not sure
        GridViewRow organizationName = GridViewOnlineProgram.SelectedRow;
        DropDownOnline.SelectedItem.Text = GridViewOnlineProgram.SelectedRow.Cells[0].Text;
        OrgNameTXT.Text = GridViewOnlineProgram.SelectedRow.Cells[1].Text;
        ProgDateTXT.Text = GridViewOnlineProgram.SelectedRow.Cells[2].Text;
        TypeTXT.Text = GridViewOnlineProgram.SelectedRow.Cells[3].Text;
        CountryTXT.Text = GridViewOnlineProgram.SelectedRow.Cells[4].Text;
        StateTXT.Text = GridViewOnlineProgram.SelectedRow.Cells[5].Text;
        GradeTXT.Text = GridViewOnlineProgram.SelectedRow.Cells[6].Text;
        EmailTXT.Text = GridViewOnlineProgram.SelectedRow.Cells[7].Text;
        ThemeTXT.Text = GridViewOnlineProgram.SelectedRow.Cells[8].Text;
        NumberOfChildrenTXT.Text = GridViewOnlineProgram.SelectedRow.Cells[9].Text;
        NumberOfAdultsTXT.Text = GridViewOnlineProgram.SelectedRow.Cells[10].Text;
    }

    protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect(ddlProgram.SelectedValue);
    }

    protected void txtOrganizationName_TextChanged(object sender, EventArgs e)
    {

        System.Data.SqlClient.SqlConnection connect = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);

        string callState = "select * from [dbo].[OnlineProgram] where OrganizationName = '" + HttpUtility.HtmlEncode(txtOrganizationName.Text) + "';";
        SqlCommand cmdDatabase1 = new SqlCommand(callState, connect);

        SqlDataReader myreader;

        try
        {
            connect.Open();
            myreader = cmdDatabase1.ExecuteReader();
            //myreader = cmdDatabase2.ExecuteReader();


            while (myreader.Read())
            {
                //string country = "Usa";
                //string state = "Va";
                string country = myreader.GetString(2);
                string state = myreader.GetString(3);
                txtState.Text = country;
                txtCountry.Text = state;
                //txtState.AutoComplteCUstomerSource = country;
            }
        }
        catch (Exception ex)
        {

        }
        connect.Close();

    }
}

public class autocompletestringcollection
{
    public autocompletestringcollection()
    {
    }
}