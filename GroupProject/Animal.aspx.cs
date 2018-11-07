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

    }

    protected void addAnimalToDataBaseButton(object sender, EventArgs e)
    {
        String insertAnimalQuery = "INSERT INTO Animal VALUES (@AnimalType, @AnimalName, @AnimalStatus, @NumberOfEvents, @NumberOfChildrenMet, @NumberOfAdultsMet, @TotalPeopleMet)";
        sc.Open();

        SqlCommand insertAnimalcmd = new SqlCommand(insertAnimalQuery, sc);
        insertAnimalcmd.Parameters.AddWithValue("@AnimalType", AnimalTypeTxt.Text);
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




}
