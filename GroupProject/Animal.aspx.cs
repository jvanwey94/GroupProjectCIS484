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

        if(!IsPostBack)
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
        String insertAnimalQuery = "INSERT INTO Animal VALUES (@AnimalType, @AnimalName, @AnimalStatus, @NumberOfEvents, @NumberOfChildrenMet, @NumberOfAdultsMet, @TotalPeopleMet)";
        sc.Open();

        SqlCommand insertAnimalcmd = new SqlCommand(insertAnimalQuery, sc);
        insertAnimalcmd.Parameters.AddWithValue("@AnimalType", AddAnimalStatusDDL.SelectedItem.Text);
        insertAnimalcmd.Parameters.AddWithValue("@AnimalName", AnimalNameTxt.Text);
        insertAnimalcmd.Parameters.AddWithValue("@AnimalStatus", "Inactive");
        insertAnimalcmd.Parameters.AddWithValue("@NumberOfEvents", 0);
        insertAnimalcmd.Parameters.AddWithValue("@NumberOfChildrenMet", 0);
        insertAnimalcmd.Parameters.AddWithValue("@NumberOfAdultsMet", 0);
        insertAnimalcmd.Parameters.AddWithValue("@TotalPeopleMet", 0);

        insertAnimalcmd.ExecuteNonQuery();
        GridView1.DataBind();
        sc.Close();
    }

    //protected void btn1_Search(object sender, EventArgs e)
    //{

    //    if (TextBox1.Text != string.Empty)
    //    {
    //        PopulateGridview();
    //        GridView1.Visible = true;
    //    }
    //    else
    //    {
    //        GridView1.Visible = false;
    //        Response.Write("<script>alert('No matching records are found! Please enter a Payment Number!')</script>");

    //    }


    //}

    //void PopulateGridview()
    //{
    //    sc.Open();
    //    String getAnimalID = TextBox1.Text;

    //    String sqlDA = "SELECT * FROM [dbo].[Animal]  where animalName = @animalName";
    //    System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand(sqlDA, sc);
    //    insert.Parameters.AddWithValue("@animalName", TextBox1.Text);
    //    SqlDataAdapter getsqlDA = new SqlDataAdapter(insert);

    //    getsqlDA.Fill(dt);

    //    //if no matching records found, the system populate error message!
    //    if (dt.Rows.Count == 0)
    //    {
    //        GridView1.Visible = false;
    //        Response.Write("<script>alert('No matching records are found')</script>");
    //        return;
    //    }
    //    else
    //    {
    //        //check the textbox validation (no empty string input
    //        if (TextBox1.Text != string.Empty)
    //        {
    //            if (dt.Rows.Count > 0)
    //            {
    //                GridView1.DataSourceID = null;
    //                GridView1.DataSource = dt;
    //                GridView1.DataBind();
    //            }
    //            GridView1.Visible = true;
    //        }
    //    }
    //    sc.Close();

    //}

    protected void ExitButton(object sender, EventArgs e)
    {
        System.Environment.Exit(0);
    }

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        //String deleteQuery = "Delete from Animal where AnimalID = @AnimalID";
        String deactivateQuery = "Update Animal set AnimalStatus = 'Inactive' where AnimalID = @AnimalID";
        sc.Open();
        SqlCommand deletecmd = new SqlCommand(deactivateQuery, sc);
        deletecmd.Parameters.AddWithValue("@AnimalID", DeleteDDL.SelectedItem.Value);

        deletecmd.ExecuteNonQuery();
        sc.Close();
    }

    protected void UpdateAnimal(object sender, EventArgs e)
    {
        String updateAnimalQuery = "Update [dbo].[Animal] set AnimalType = @AnimalType, AnimalName = @AnimalName, AnimalStatus = @AnimalStatus, NumberOfEvents = @NumberOfEvents, " +
            "NumberOfAdultsMet = @NumberOfAdultsMet, NumberOfChildrenMet = @NumberOfChildrenMet where AnimalID = @AnimalID";
        sc.Open();
        SqlCommand updateAnimalcmd = new SqlCommand(updateAnimalQuery, sc);
        updateAnimalcmd.Parameters.AddWithValue("@AnimalType", AnimalTypeDDL.SelectedItem.Text);
        updateAnimalcmd.Parameters.AddWithValue("@AnimalName", AnimalNameEditTXT.Text);
        updateAnimalcmd.Parameters.AddWithValue("@AnimalStatus", AnimalStatusDDL.SelectedItem.Text);
        updateAnimalcmd.Parameters.AddWithValue("@NumberOfEvents", AnimalEditEventsTXT.Text);
        updateAnimalcmd.Parameters.AddWithValue("@NumberOfAdultsMet", AnimalAdultsMetTXT.Text);
        updateAnimalcmd.Parameters.AddWithValue("@NumberOfChildrenMet", AnimalKidsMetTXT.Text);
        updateAnimalcmd.Parameters.AddWithValue("@AnimalID", GridView1.SelectedRow.Cells[7].Text);

        updateAnimalcmd.ExecuteNonQuery();
        GridView1.DataBind();
        sc.Close();
        
    }
    
    protected void DeleteAnimal(object sender, EventArgs e)
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

    //protected void clickInsertButton(object sender, EventArgs e)
    //{
    //    int pkpk = 0;
    //    Int32 primaryKey = 0;
    //    Int32 coco = 0;
    //    int recordCount = 0;
    //    SqlCommand insert = new SqlCommand();



    //    sc.Open();
    //    insert.Connection = sc;


    //    String select = "Select max(animalID) from dbo.Animal";
    //    String recordCheck = "Select count(*) from dbo.Animal";




    //    SqlCommand check = new SqlCommand(recordCheck, sc);
    //    coco = (Int32)check.ExecuteScalar();
    //    recordCount = (int)coco;

    //    if (recordCount == 0)
    //    {
    //        pkpk = 0;
    //    }
    //    else
    //    {
    //        SqlCommand statement = new SqlCommand(select, sc);
    //        primaryKey = (Int32)statement.ExecuteScalar();
    //        pkpk = (int)primaryKey;
    //    }




    //    SqlCommand cmd = new SqlCommand("insert into [Animal] values (@animalType, @animalName, @animalStatus, @lastUpdatedBy, @lastUpdated)", sc);

    //    cmd.Parameters.AddWithValue("@animalType", TextBox2.Text);
    //    cmd.Parameters.AddWithValue("@animalName", TextBox1.Text);
    //    cmd.Parameters.AddWithValue("@animalStatus", TextBox3.Text);
    //    cmd.Parameters.AddWithValue("@lastUpdatedBy", TextBox6.Text);
    //    cmd.Parameters.AddWithValue("@lastUpdated", TextBox7.Text);



    //    cmd.ExecuteNonQuery();




    //}

    //protected void clickViewButton(object sender, EventArgs e)
    //{
    //    ShowData();
    //}



    //protected void ShowData()
    //{
    //    dt = new DataTable();

    //    sc.Open();
    //    adapt = new SqlDataAdapter("Select * from animal", sc);
    //    adapt.Fill(dt);
    //    if (dt.Rows.Count > 0)
    //    {
    //        GridView1.DataSource = dt;
    //        GridView1.DataBind();
    //    }
    //    sc.Close();
    //}

    //protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    //{

    //    //NewEditIndex property used to determine the index of the row being edited.  
    //    GridView1.EditIndex = e.NewEditIndex;
    //    if (searchBox.Text == "")
    //    {

    //        ShowData();
    //    }

    //}
    //protected void GridView1_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    //{
    //    //Finding the controls from Gridview for the row which is going to update  
    //    Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
    //    TextBox name = GridView1.Rows[e.RowIndex].FindControl("txt_Name") as TextBox;
    //    TextBox type = GridView1.Rows[e.RowIndex].FindControl("txt_Type") as TextBox;
    //    TextBox status = GridView1.Rows[e.RowIndex].FindControl("txt_Status") as TextBox;
    //    TextBox lub = GridView1.Rows[e.RowIndex].FindControl("txt_LUB") as TextBox;
    //    TextBox lu = GridView1.Rows[e.RowIndex].FindControl("txt_LU") as TextBox;


    //    sc.Open();
    //    //updating the record  
    //    SqlCommand cmd = new SqlCommand("Update animal set animalName='" + name.Text + "',animalType='" + type.Text + "',animalStatus='" + status.Text + "',lastUpdatedBy='" + lub.Text + "',lastUpdated='" + lu.Text + "' where animalID=" + Convert.ToInt32(id.Text), sc);
    //    cmd.ExecuteNonQuery();
    //    sc.Close();
    //    //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
    //    GridView1.EditIndex = -1;
    //    //Call ShowData method for displaying updated data  
    //    ShowData();
    //}
    //protected void GridView1_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    //{
    //    //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
    //    GridView1.EditIndex = -1;
    //    ShowData();
    //}



    //protected void clickSearchButton(object sender, EventArgs e)
    //{

    //    if (searchBox.Text == "")
    //    {
    //        searchBox.Text = "Please enter a name";
    //    }

    //    else
    //    {
    //        sc.Open();
    //        DataSet ds = new DataSet();
    //        String sqlDA = "SELECT * FROM [dbo].[Animal]  where animalName = @animalName";
    //        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand(sqlDA, sc);
    //        insert.Parameters.AddWithValue("@animalName", searchBox.Text);
    //        SqlDataAdapter getsqlDA = new SqlDataAdapter(insert);
    //        getsqlDA.Fill(ds);
    //        GridView1.DataSource = ds;
    //        GridView1.DataBind();
    //        sc.Close();

    //        //con = new SqlConnection(cs);
    //        //con.Open();
    //        //adapt = new SqlDataAdapter("select * from animal where animalName like '" + searchBox.Text + "%'", con);
    //        //DataSet ds = new DataSet();
    //        //adapt.Fill(ds);
    //        //GridView1.DataSource = ds;
    //        //GridView1.DataBind();
    //        //con.Close();
    //    }
    //}

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


    //protected void OnSelectedIndexChanged(object sender, EventArgs e)
    //{

    //    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "openModal()", true);
    //    GridViewRow organizationName = gvRegularProgram.SelectedRow;
    //    //txtOrganizationName.Text = (string)gvRegularProgram.DataKeys[organizationName.RowIndex]["Column1"];

    //    txtOrganizationName.Text = gvRegularProgram.SelectedRow.Cells[0].Text;
    //    txtOrganizationAddress.Text = gvRegularProgram.SelectedRow.Cells[5].Text;
    //    txtCity.Text = gvRegularProgram.SelectedRow.Cells[6].Text;
    //    txtCounty.Text = gvRegularProgram.SelectedRow.Cells[7].Text;
    //    txtProgramName.Text = gvRegularProgram.SelectedRow.Cells[2].Text;
    //    txtSiteType.Text = gvRegularProgram.SelectedRow.Cells[3].Text;
    //    txtStatus.Text = gvRegularProgram.SelectedRow.Cells[4].Text;
    //    txtDate.Text = gvRegularProgram.SelectedRow.Cells[1].Text;
    //    txtNumberOfChildren.Text = gvRegularProgram.SelectedRow.Cells[8].Text;
    //    txtNumberOfAdults.Text = gvRegularProgram.SelectedRow.Cells[9].Text;
    //    //CheckBoxAnimal.SelectedIndex = gvRegularProgram.SelectedRow.Cells[10];
    //    DropDownEducator.SelectedItem.Text = gvRegularProgram.SelectedRow.Cells[11].Text;
    //}

}
