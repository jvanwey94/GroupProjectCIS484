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
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String insertOnlineProgramQuery = "INSERT INTO OnlineProgram (Type, Month, Date, Country, State, NumberOfKids, NumberOfPeople, Grade, Email, Theme, InvoiceID, LastUpdatedBy, LastUpdated, AnimalsUsed) " +
            "VALUES (@Type, @Month, @Date, @Country, @State, @NumberOfKids, @NumberOfPeople, @Grade, @Email, @Theme, @InvoiceID, @LastUpdatedBy, @LastUpdated, @AnimalsUsed)";

        SqlCommand cmd = new SqlCommand(insertOnlineProgramQuery, sc);
        cmd.Parameters.AddWithValue("@Type", TextBox13.Text);
        cmd.Parameters.AddWithValue("@Month", TextBox12.Text);
        cmd.Parameters.AddWithValue("@Date", TextBox11.Text);
        cmd.Parameters.AddWithValue("@Country", TextBox16.Text);
        cmd.Parameters.AddWithValue("@State", TextBox15.Text);
        cmd.Parameters.AddWithValue("@NumberOfKids", TextBox1.Text);
        cmd.Parameters.AddWithValue("@NumberOfPeople", TextBox2.Text);
        cmd.Parameters.AddWithValue("@Grade", DropDownList1.SelectedValue);
        cmd.Parameters.AddWithValue("@Email", TextBox18.Text);
        cmd.Parameters.AddWithValue("@Theme", TextBox20.Text);
        cmd.Parameters.AddWithValue("@InvoiceID", "1");
        cmd.Parameters.AddWithValue("@LastUpdatedBy", "Stosh");
        cmd.Parameters.AddWithValue("@LastUpdated", DateTime.Today.ToString());
        cmd.Parameters.AddWithValue("@AnimalsUsed", TextBox21.Text);

        cmd.ExecuteNonQuery();

    }
    protected void fillGradeList()
    {
        ListItem gradeBlank = new ListItem();
        gradeBlank.Value = "0";
        gradeBlank.Text = "Choose";

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
}