using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Text;
using System.Drawing;

public partial class Animal : System.Web.UI.Page
{
    string cs = "Data Source=.;Initial Catalog=WildLifeCenter;Integrated Security=true;";
    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);
    private static int animalID;
    SqlConnection con;
    SqlDataAdapter adapt;
    DataTable dt = new DataTable();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {

            Response.Write("<script>alert('Please login first!'); window.location='Login.aspx';</script>");
        }
        if (!IsPostBack)
        {
            populateAnimalStatus(AnimalStatusDDL);
            populateAnimals(DeleteDDL);
            populateAnimalType(AnimalTypeDDL);
            populateAnimalType(AddAnimalStatusDDL);
        }

        GridView1.DataBind();

    }

    protected void addAnimalToDataBaseButton(object sender, EventArgs e)
    {
        try
        {


            String insertAnimalQuery = "INSERT INTO Animal VALUES (@AnimalType, @AnimalName, @AnimalStatus, @NumberOfEvents, @NumberOfChildrenMet, @NumberOfAdultsMet, @TotalPeopleMet, @LastUpdatedBy, @LastUpdated)";
            sc.Open();

            SqlCommand insertAnimalcmd = new SqlCommand(insertAnimalQuery, sc);
            insertAnimalcmd.Parameters.AddWithValue("@AnimalType", AddAnimalStatusDDL.SelectedItem.Text);
            insertAnimalcmd.Parameters.AddWithValue("@AnimalName", HttpUtility.HtmlEncode(AnimalNameTxt.Text));
            insertAnimalcmd.Parameters.AddWithValue("@AnimalStatus", "Inactive");
            insertAnimalcmd.Parameters.AddWithValue("@NumberOfEvents", 0);
            insertAnimalcmd.Parameters.AddWithValue("@NumberOfChildrenMet", 0);
            insertAnimalcmd.Parameters.AddWithValue("@NumberOfAdultsMet", 0);
            insertAnimalcmd.Parameters.AddWithValue("@TotalPeopleMet", 0);
            insertAnimalcmd.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
            insertAnimalcmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

            insertAnimalcmd.ExecuteNonQuery();
            GridView1.DataBind();
            sc.Close();
        }
        catch
        {
            Response.Write("<script>alert('Error adding animal to database. Make sure data entered matches the corresponding fields.')</script>");
        }
    }

    protected void ExitButton(object sender, EventArgs e)
    {
        System.Environment.Exit(0);
    }

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        try
        {


            //String deleteQuery = "Delete from Animal where AnimalID = @AnimalID";
            String deactivateQuery = "Update Animal set AnimalStatus = 'Inactive' where AnimalID = @AnimalID";
            sc.Open();
            SqlCommand deletecmd = new SqlCommand(deactivateQuery, sc);
            deletecmd.Parameters.AddWithValue("@AnimalID", DeleteDDL.SelectedItem.Value);

            deletecmd.ExecuteNonQuery();
            sc.Close();
        }
        catch
        {
            Response.Write("<script>alert('Error deactivating animal. Please try again.')</script>");
        }
    }

    protected void UpdateAnimal(object sender, EventArgs e)
    {
        try
        {


            String updateAnimalQuery = "Update [dbo].[Animal] set AnimalType = @AnimalType, AnimalName = @AnimalName, AnimalStatus = @AnimalStatus, NumberOfEvents = @NumberOfEvents, " +
                "NumberOfAdultsMet = @NumberOfAdultsMet, NumberOfChildrenMet = @NumberOfChildrenMet, LastUpdatedBy = @LastUpdatedBy, LastUpdated = @LastUpdated where AnimalID = @AnimalID";
            sc.Open();
            SqlCommand updateAnimalcmd = new SqlCommand(updateAnimalQuery, sc);
            updateAnimalcmd.Parameters.AddWithValue("@AnimalType", AnimalTypeDDL.SelectedItem.Text);
            updateAnimalcmd.Parameters.AddWithValue("@AnimalName", HttpUtility.HtmlEncode(AnimalNameEditTXT.Text));
            updateAnimalcmd.Parameters.AddWithValue("@AnimalStatus", AnimalStatusDDL.SelectedItem.Text);
            updateAnimalcmd.Parameters.AddWithValue("@NumberOfEvents", HttpUtility.HtmlEncode(AnimalEditEventsTXT.Text));
            updateAnimalcmd.Parameters.AddWithValue("@NumberOfAdultsMet", HttpUtility.HtmlEncode(AnimalAdultsMetTXT.Text));
            updateAnimalcmd.Parameters.AddWithValue("@NumberOfChildrenMet", HttpUtility.HtmlEncode(AnimalKidsMetTXT.Text));
            updateAnimalcmd.Parameters.AddWithValue("@LastUpdatedBy", Session["User"]);
            updateAnimalcmd.Parameters.AddWithValue("@LastUpdated", DateTime.Now);
            updateAnimalcmd.Parameters.AddWithValue("@AnimalID", GridView1.SelectedRow.Cells[7].Text);
            updateAnimalcmd.ExecuteNonQuery();
            GridView1.DataBind();
            sc.Close();
        }
        catch
        {
            Response.Write("<script>alert('Error updating animal. Make sure data entered matches the corresponding fields.')</script>");
        }
        
    }
    
    protected void DeleteAnimal(object sender, EventArgs e)
    {
        try
        {
            //String deleteAnimalQuery = "Delete from [dbo].[Animal] where AnimalID = @AnimalID";
            String deactivateQuery = "Update Animal set AnimalStatus = 'Inactive' where AnimalID = @AnimalID";
            sc.Open();
            SqlCommand delcmd = new SqlCommand(deactivateQuery, sc);
            delcmd.Parameters.AddWithValue("@AnimalID", GridView1.SelectedRow.Cells[7].Text);

            delcmd.ExecuteNonQuery();
            GridView1.DataBind();
            sc.Close();
        }
        catch
        {
            Response.Write("<script>alert('Error deactivating animal. Please try again.')</script>");
        }
    }

    protected void populateAnimals(DropDownList list)
    {
        SqlDataReader reader;
        ListItem newItem = new ListItem();
        String animalQuery = "Select AnimalID, AnimalName from Animal order by AnimalName";
        SqlCommand filler = new SqlCommand(animalQuery, sc);

        newItem.Value = "0";
        newItem.Text = "Select Animal";
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

    protected void populateAnimalType(DropDownList list)
    {
        ListItem newItem = new ListItem();
        newItem.Value = "0";
        newItem.Text = "Select Animal Type";
        list.Items.Add(newItem);

        ListItem birdItem = new ListItem();
        birdItem.Value = "1";
        birdItem.Text = "Bird";
        list.Items.Add(birdItem);

        ListItem mamItem = new ListItem();
        mamItem.Value = "2";
        mamItem.Text = "Mammal";
        list.Items.Add(mamItem);

        ListItem repItem = new ListItem();
        repItem.Value = "3";
        repItem.Text = "Reptile";
        list.Items.Add(repItem);
    }

    protected void populateAnimalStatus(DropDownList list)
    {
        ListItem newItem = new ListItem();
        newItem.Value = "0";
        newItem.Text = "Select Animal Status";
        list.Items.Add(newItem);

        ListItem activeItem = new ListItem();
        activeItem.Value = "1";
        activeItem.Text = "Active";
        list.Items.Add(activeItem);

        ListItem inactiveItem = new ListItem();
        inactiveItem.Value = "2";
        inactiveItem.Text = "Inactive";
        list.Items.Add(inactiveItem);
    }

    private void bindAnimalData()
    {
        GridView1.DataBind();
    }

    protected override void Render(HtmlTextWriter writer)
    {
        foreach(GridViewRow r in GridView1.Rows)
        {
            if(r.RowType == DataControlRowType.DataRow)
            {
                r.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                r.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                r.ToolTip = "Click to edit Animal";
                r.Cells[0].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + r.RowIndex, true);
                r.Cells[1].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + r.RowIndex, true);
                r.Cells[2].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + r.RowIndex, true);
                r.Cells[3].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + r.RowIndex, true);
                r.Cells[4].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + r.RowIndex, true);
                r.Cells[5].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + r.RowIndex, true);
                r.Cells[6].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + r.RowIndex, true);
                r.Cells[7].Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + r.RowIndex, true);
            }
        }
        base.Render(writer);
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "openModal()", true);
        
        //this is probably wrong, im not sure
        GridViewRow organizationName = GridView1.SelectedRow;

        AnimalTypeDDL.SelectedItem.Text = GridView1.SelectedRow.Cells[1].Text;
        AnimalNameEditTXT.Text = GridView1.SelectedRow.Cells[0].Text;
        AnimalStatusDDL.SelectedItem.Text = GridView1.SelectedRow.Cells[2].Text;
        AnimalEditEventsTXT.Text = GridView1.SelectedRow.Cells[3].Text;
        AnimalAdultsMetTXT.Text = GridView1.SelectedRow.Cells[4].Text;
        AnimalKidsMetTXT.Text = GridView1.SelectedRow.Cells[5].Text;
    }

}
