﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//dsdsd

public partial class OnlineProgram : System.Web.UI.Page
{
    //System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);

    //protected void Page_Load(object sender, EventArgs e)
    //{
       
    //    if (!IsPostBack)
    //    {
    //        fillGradeList();
    //    }
        
    //}

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    sc.Open();
    //    String payment = "delete later";
       

    //    String insertOnlineProgramQuery = "INSERT INTO OnlineProgram (Type, Country, State, Grade, Email, Theme) " +
    //        "VALUES (@Type, @Country, @State, @Grade, @Email, @Theme)";
    //    String insertProgramQuery = "Insert into Program (OrganizationName, ProgDate, NumberOfKids, NumberOfAdult, PayStatus, InvoiceID) " +
    //        "VALUES (@OrganizationName, @ProgDate, @NumberOfKids, @NumberOfAdult, @PayStatus, @InvoiceID)";

        
    //    SqlCommand programcmd = new SqlCommand(insertProgramQuery, sc);
    //    //programcmd.Parameters.AddWithValue("@ProgMonth", TextBox12.Text);
    //    programcmd.Parameters.AddWithValue("@OrganizationName", txtOrganizationName.Text);
    //    programcmd.Parameters.AddWithValue("@ProgDate", txtDate.Text);
    //    programcmd.Parameters.AddWithValue("@NumberOfKids", txtNK.Text);
    //    programcmd.Parameters.AddWithValue("@NumberOfAdult", txtNumberOFAdults.Text);
    //    programcmd.Parameters.AddWithValue("@PayStatus", payment);
    //    programcmd.Parameters.AddWithValue("@InvoiceID", "1");
    //    //programcmd.Parameters.AddWithValue("@LastUpdatedBy", "Stosh");
    //    //programcmd.Parameters.AddWithValue("@LastUpdated", DateTime.Today.ToString());

    //    SqlCommand cmd = new SqlCommand(insertOnlineProgramQuery, sc);
    //    cmd.Parameters.AddWithValue("@Type", txtType.Text); // add drop down list to describe types of viewing
    //    cmd.Parameters.AddWithValue("@Country", txtCountry.Text); //
    //    cmd.Parameters.AddWithValue("@State", txtState.Text); //
    //    cmd.Parameters.AddWithValue("@Grade", DropDownList1.SelectedValue.ToString()); //
    //    cmd.Parameters.AddWithValue("@Email", txtEmail.Text); //
    //    cmd.Parameters.AddWithValue("@Theme", txtTheme.Text); // 
    //    //cmd.Parameters.AddWithValue("@AnimalsUsed", TextBox21.Text); used for proganimal table

    //    programcmd.ExecuteNonQuery();
    //    cmd.ExecuteNonQuery();

    //    sc.Close();
    //}
    //protected void fillGradeList()
    //{
    //    ListItem gradeBlank = new ListItem();
    //    gradeBlank.Value = "0";
    //    gradeBlank.Text = "Choose Grade Level";

    //    ListItem gradeK = new ListItem();
    //    gradeK.Value = "1";
    //    gradeK.Text = "K";

    //    ListItem grade1 = new ListItem();
    //    grade1.Value = "2";
    //    grade1.Text = "1";

    //    ListItem grade2 = new ListItem();
    //    grade2.Value = "3";
    //    grade2.Text = "2";

    //    ListItem grade3 = new ListItem();
    //    grade3.Value = "4";
    //    grade3.Text = "3";

    //    ListItem grade4 = new ListItem();
    //    grade4.Value = "5";
    //    grade4.Text = "4";

    //    ListItem grade5 = new ListItem();
    //    grade5.Value = "6";
    //    grade5.Text = "5";

    //    ListItem grade6 = new ListItem();
    //    grade6.Value = "7";
    //    grade6.Text = "6";

    //    ListItem grade7 = new ListItem();
    //    grade7.Value = "8";
    //    grade7.Text = "7";

    //    ListItem grade8 = new ListItem();
    //    grade8.Value = "9";
    //    grade8.Text = "8";

    //    ListItem grade9 = new ListItem();
    //    grade9.Value = "10";
    //    grade9.Text = "9";

    //    ListItem grade10 = new ListItem();
    //    grade10.Value = "11";
    //    grade10.Text = "10";

    //    ListItem grade11 = new ListItem();
    //    grade11.Value = "12";
    //    grade11.Text = "11";

    //    ListItem grade12 = new ListItem();
    //    grade12.Value = "13";
    //    grade12.Text = "12";

    //    DropDownList1.Items.Add(gradeBlank);
    //    DropDownList1.Items.Add(gradeK);
    //    DropDownList1.Items.Add(grade1);
    //    DropDownList1.Items.Add(grade2);
    //    DropDownList1.Items.Add(grade3);
    //    DropDownList1.Items.Add(grade4);
    //    DropDownList1.Items.Add(grade5);
    //    DropDownList1.Items.Add(grade6);
    //    DropDownList1.Items.Add(grade7);
    //    DropDownList1.Items.Add(grade8);
    //    DropDownList1.Items.Add(grade9);
    //    DropDownList1.Items.Add(grade10);
    //    DropDownList1.Items.Add(grade11);
    //    DropDownList1.Items.Add(grade12);
    //}


    ////EXIT METHOD another thing
    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    System.Environment.Exit(0);
    //}


    //protected void txtOrganizationName_TextChanged(object sender, EventArgs e)
    //{
       
    //    System.Data.SqlClient.SqlConnection connect = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);

    //    string callState = "select * from [dbo].[OnlineProgram] where OrganizationName = '" + txtOrganizationName.Text + "';";
    //    SqlCommand cmdDatabase1 = new SqlCommand(callState, connect);

    //    SqlDataReader myreader ;

    //    try
    //    {
    //        connect.Open();
    //        myreader = cmdDatabase1.ExecuteReader();
    //        //myreader = cmdDatabase2.ExecuteReader();
      

    //        while (myreader.Read())
    //        {
    //            //string country = "Usa";
    //            //string state = "Va";
    //            string country = myreader.GetString(2);
    //            string state = myreader.GetString(3);
    //            txtState.Text = country;
    //            txtCountry.Text = state;
    //            //txtState.AutoComplteCUstomerSource = country;
    //        }
    //    }
    //    catch(Exception ex)
    //    {
            
    //    }
    //    connect.Close();

    //}
}

public class autocompletestringcollection
{
    public autocompletestringcollection()
    {
    }
}