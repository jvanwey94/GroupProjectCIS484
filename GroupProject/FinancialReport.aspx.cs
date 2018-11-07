﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Reflection;
using System.Data.Common;
using ClosedXML.Excel;
using System.Drawing;
using System.ComponentModel;
using System.Windows.Forms;


public partial class FinancialReport : System.Web.UI.Page
{
    //SqlConnection connect = new SqlConnection(@"Server =localhost; Database = Payment4; Trusted_Connection = Yes;");
    System.Data.SqlClient.SqlConnection connect = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);

    //create data table variable ti display gridview
    DataTable dtbl = new DataTable();
    XLWorkbook wb = new XLWorkbook();

    protected void Page_Load(object sender, EventArgs e)
    {
        String[] monthsTxt = new string[] { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
        String[] monthsNum = new String[] { "01", "02", "03", "04", "04", "06", "07", "08", "09", "10", "11", "12" };
        int monthlyDays = 0;
        String sqlMonthlyToExcel = "";
        String year = DateTime.Now.Year.ToString();

        monthlyDays = DateTime.DaysInMonth(int.Parse(year), int.Parse(monthsNum[0]));

        txtSearch.Text = "'" + year + "-" + monthsNum[0] + "-01' and '" + year + "-" + monthsNum[0] + "-" + monthlyDays + "'";

        //txtLastUpdatedBy.Text = "Kevin    ";
        //txtLastUpdated.Text = DateTime.Now.ToString();
        lblPaymentCollect.Visible = false;
        lblPaymentLeft.Visible = false;
        txtPaymentCollect.Visible = false;
        txtPaymentLeft.Visible = false;
        lblComplete.Visible = false;
        lblIncomplete.Visible = false;
        if (!Page.IsPostBack)
        {
            //txtLastUpdated.Text = DateTime.Now.ToString();
            if (txtPaymentType.SelectedItem.ToString() == "Check")
            {

            }
            //    dbInvoice.Visible = true;
        }

       
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.TableSection = TableRowSection.TableHeader;
        }
    }

    public static void MakeAccessible(GridView GridView1)
    {
        if (GridView1.Rows.Count <= 0) return;
        GridView1.UseAccessibleHeader = true;
        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        if (GridView1.ShowFooter)
            GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
    }

    protected override void OnPreRender(EventArgs e)
    {
       
        base.OnPreRender(e);
        //MakeAccessible(GridView1);
    }
    
    

    //populate gridview
    void PopulateGridview()
    {
        connect.Open();
        String getInvoiceNumber = txtSearch.Text;
        lblStatus.Text = getInvoiceNumber + "succseessfully connect to database!  ";
        String sqlDA = "SELECT * FROM [dbo].[Payment]  where InvoiceID = @InvoiceID";
        System.Data.SqlClient.SqlCommand insert= new System.Data.SqlClient.SqlCommand(sqlDA, connect);
        insert.Parameters.AddWithValue("@InvoiceID", txtSearch.Text);
        SqlDataAdapter getsqlDA = new SqlDataAdapter(insert);
        lblStatus.Text = "Loading";
        getsqlDA.Fill(dtbl);

        //if no matching records found, the system populate error message!
        if (dtbl.Rows.Count == 0)
        {
            dbInvoice.Visible = false;
            Response.Write("<script>alert('No matching records are found')</script>");
            return;
        }
        else
        {
            //check the textbox validation (no empty string input
            if (txtSearch.Text != string.Empty)
            {
                if (dtbl.Rows.Count > 0)
                {
                    dbInvoice.DataSource = dtbl;
                    dbInvoice.DataBind();
                }
                dbInvoice.Visible = true;
            }
        }
        connect.Close();

    }//gridview done 

    //commit button 
    protected void btn1_Insert(object sender, EventArgs e)
    {
        //try
        //{
        Int32 InputCheckNumber;
            String InputInvoiceNumber = txtInvoice.Text;
            if(txtCheckNumber.Text == String.Empty)
            {
            InputCheckNumber = 0;
            }
            else
            {
            InputCheckNumber = Convert.ToInt32(txtCheckNumber.Text);
            }
            
            Decimal InputAmount = Convert.ToDecimal(txtAmount.Text);
            Decimal InputPaymentCollect = 0;
            Decimal InputPaymenLeft = 0;
            String InputLastUpdatedBy = "Kevin";
            DateTime InputLastUpdated = DateTime.Now.Date;
            String InputProgram = txtProgram.SelectedItem.ToString();
            String InputOrganization = txtOrganization.SelectedItem.ToString();
            String InputPaymentType = txtPaymentType.SelectedItem.ToString();
            String InputStatus = lblIncomplete.Text;


            //check the validation for required field
            if (txtInvoice.Text == string.Empty)
            {
                Response.Write("<script>alert('user must fill Invoice Number')</script>");
                return;
            }
            if (txtAmount.Text == string.Empty)
            {
                Response.Write("<script>alert('user must fill Amount)</script>");
                return;
            }
            if (txtPaymentType.SelectedItem.ToString() != "Check" && txtCheckNumber.Text != string.Empty)
            {
                Response.Write("<script>alert('Invalid Check Number, User can not add check number if the payment type is not 'check'')</script>");
                return;
            }

            //Calculation
            InputPaymenLeft = (Convert.ToInt32(txtAmount.Text) - InputPaymenLeft);

            connect.Open();

            //@PaymentCollect,@PaymentLeft,,@Amount
            //@OrganizationName" +
            //    "@Program,@PaymentType,@CheckNumber,@PaymentStatus," +
            //insert data to Bird table if text box is qualified
            if ((txtInvoice.Text != "") && (txtAmount.Text != string.Empty))
            {

                //BirdClass bird = new BirdClass(InputBirdName, InputBirdType, InputLastUpdatedBy, InputLastUpdated, InputBirdAct);
                String query1 = "insert into [dbo].[Payment] values (@InvoiceID,@OrganizationName,@Program,@PaymentType,@CheckNumber,@Amount,@PaymentCollect,@PaymentLeft,@PaymentStatus,@LastUpdatedBy,@LastUpdated)";
                System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand(query1, connect);
                insert.Connection = connect;
                insert.Parameters.AddWithValue("@InvoiceID", InputInvoiceNumber);
                insert.Parameters.AddWithValue("@OrganizationName", InputOrganization);
                insert.Parameters.AddWithValue("@Program", InputProgram);
                insert.Parameters.AddWithValue("@PaymentType", InputPaymentType);
                insert.Parameters.AddWithValue("@CheckNumber", InputCheckNumber);
                insert.Parameters.AddWithValue("@Amount", InputAmount);
                insert.Parameters.AddWithValue("@PaymentCollect", InputPaymentCollect);
                insert.Parameters.AddWithValue("@PaymentLeft", InputPaymenLeft);
                insert.Parameters.AddWithValue("@PaymentStatus", InputStatus);
                insert.Parameters.AddWithValue("@LastUpdatedBy", "Kevin");
                insert.Parameters.AddWithValue("@LastUpdated", DateTime.Now.Date);

                insert.ExecuteNonQuery();
                lblStatus.Text = "succseessful to add this payment to database!";
                //txtTest.Text = InputStatus;

                txtAmount.Text = string.Empty;
                txtCheckNumber.Text = string.Empty;
                txtInvoice.Text = string.Empty;
                //txtLastUpdatedBy.Text = string.Empty;
                //txtLastUpdated.Text = string.Empty;
                txtSearch.Text = string.Empty;

            }
        connect.Close();
        //}
        //catch (Exception)
        //{
        //    Response.Write("<script>alert('user must fill required fileds!)</script>");
        //    return;
        //}
    }//commit button done

    protected void btn1_Search(object sender, EventArgs e)
    {

        if (txtSearch.Text != string.Empty)
        {
            PopulateGridview();
            dbInvoice.Visible = true;
        }
        else
        {
            dbInvoice.Visible = false;
            Response.Write("<script>alert('No matching records are found! Please enter a Payment Number!')</script>");

        }


    }//search done

    //gridview edit image control
    protected void dbInvoice_RowEditing(object sender, GridViewEditEventArgs e)
    {
        dbInvoice.EditIndex = e.NewEditIndex;
        PopulateGridview();
    }

    //gridview canceling image control
    protected void dbInvoice_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        dbInvoice.EditIndex = -1;
        PopulateGridview();
        //grindviewControl = true;
    }


    //gridview update control
    protected void dbInvoice_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ////try
        ////{

        //connect.Open();
        //String query = "Update [dbo].[Payment] set InvoiceID=@InvoiceID, OrganizationName=@OrganizationName, Program=@Program, " +
        //    "PaymentType=@PaymentType, CheckNumber=@CheckNumber,Amount=@Amount, PaymentCollect=@PaymentCollect, " +
        //    "PaymentLeft=@PaymentLeft, PaymentStatus=@PaymentStatus, LastUpdatedBy=@LastUpdatedBy, LastUpdated=@LastUpdated" +
        //    " where InvoiceID=@InvoiceID";
        //System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand(query, connect);
        //insert.Connection = connect;
        //insert.Parameters.AddWithValue("@InvoiceID", (dbInvoice.Rows[e.RowIndex].FindControl("GridInvoiceID") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@OrganizationName", (dbInvoice.Rows[e.RowIndex].FindControl("GridOrganization") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@Program", (dbInvoice.Rows[e.RowIndex].FindControl("GridProgram") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@PaymentType", (dbInvoice.Rows[e.RowIndex].FindControl("GridPaymentType") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@CheckNumber", (dbInvoice.Rows[e.RowIndex].FindControl("GridCheckNumber") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@Amount", (dbInvoice.Rows[e.RowIndex].FindControl("GridAmount") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@PaymentCollect", (dbInvoice.Rows[e.RowIndex].FindControl("GridPaymentCollect") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@PaymentLeft", (dbInvoice.Rows[e.RowIndex].FindControl("GridPaymentLeft") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@PaymentStatus", (dbInvoice.Rows[e.RowIndex].FindControl("GridStatus") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@LastUpdatedBy", (dbInvoice.Rows[e.RowIndex].FindControl("GridLastUpdatedBy") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@LastUpdated", (dbInvoice.Rows[e.RowIndex].FindControl("GridLastUpdated") as TextBox).Text.Trim());



        ////insert.Parameters.AddWithValue("@InvoiceID", Convert.ToInt32(dbInvoice.DataKeys[e.RowIndex].Value.ToString()));
        //insert.ExecuteNonQuery();
        //dbInvoice.EditIndex = -1;
        //connect.Close();
        //PopulateGridview();
       
        //lblStatus.Text = "Successfully updated";
       
        ////}
        ////catch (Exception ex)
        ////{
        ////    txtTest.Text = "";
        ////    txtTest.Text = ex.Message;
        ////}
    }

    protected void OnPaymentSelection(object sender, EventArgs e)
    {
        if (txtPaymentType.SelectedIndex == 1)
        {
            lblCheckNumber.Visible = true;
            txtCheckNumber.Visible = true;
        }
        else
        {
            lblCheckNumber.Visible = false;
            txtCheckNumber.Visible = false;
        }
    }


    protected void dbInvoice_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    void dbInvoice_CellValueChanged(object sender, EventArgs e)
    {

    }


    //if not working try:
    // tools -> nuget package manager -> Manage nuget package for solution -> reinstall ClosedXML
    // if still not working try:
    // tools -> nuget package manager console -> Install-Package DocumentFormat.OpenXml -Version 2.5.0
    // if that doesn't work, then just give up.
    public void ExportToExcel()
    {
        DataTable dt = new DataTable();
        String sqlDA = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
            " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID";
        SqlCommand filltable = new SqlCommand(sqlDA, connect);
        SqlDataAdapter adapt = new SqlDataAdapter(filltable);
        adapt.Fill(dt);


        String folderPath = "C:\\Users\\labpatron\\Documents";
        if (!Directory.Exists(folderPath))
        {
            Directory.CreateDirectory(folderPath);
        }
        using (XLWorkbook wb = new XLWorkbook())
        {
            wb.Worksheets.Add(dt, "Financial Reports");
            String myName = Server.UrlEncode("Test1" + "_" +
                DateTime.Now.ToShortDateString() + ".xlsx");
            MemoryStream stream = GetStream(wb);
            Response.Clear();
            Response.AddHeader("content-disposition", "attachment; filename=" + myName);
            Response.ContentType = "application/vnd.ms-excel";
            Response.BinaryWrite(stream.ToArray());
            Response.End();
        }
    }

    //try to add each table to a separate worksheet
    public void ExportMonthlyToExcel()
    {
        connect.Open();
        String[] monthsTxt = new string[] { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
        String[] monthsNum = new String[] {"01", "02", "03", "04", "04", "06", "07", "08", "09", "10", "11", "12"};
        int monthlyDays = 0;
        String year = DateTime.Now.Year.ToString();
        String folderPath = "C:\\Users\\labpatron\\Documents";

        DataTable yearlydt = new DataTable();
        String sqlDA = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
            " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID";
        SqlCommand tablefiller = new SqlCommand(sqlDA, connect);
        SqlDataAdapter adapter = new SqlDataAdapter(tablefiller);
        adapter.Fill(yearlydt);

        if (!Directory.Exists(folderPath))
        {
            Directory.CreateDirectory(folderPath);
        }

        wb.Worksheets.Add(yearlydt, "Annual Report");


        //add a sheet for each month in the year
        for (int i = 0; i < monthsNum.Length; i++)
            {
                monthlyDays = DateTime.DaysInMonth(int.Parse(year), int.Parse(monthsNum[i]));
                generateReports(year + "/" + monthsNum[i] + "/01", year + "/" + monthsNum[i] + "/" + monthlyDays.ToString(), monthsTxt[i]);
            }

        String myName = Server.UrlEncode("Test1" + "_" +
                DateTime.Now.ToShortDateString() + ".xlsx");
        MemoryStream stream = GetStream(wb);
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment; filename=" + myName);
        Response.ContentType = "application/vnd.ms-excel";
        Response.BinaryWrite(stream.ToArray());
        Response.End();

        connect.Close();

    }

    public MemoryStream GetStream(XLWorkbook excelWorkbook)
    {
        MemoryStream fs = new MemoryStream();
        excelWorkbook.SaveAs(fs);
        fs.Position = 0;
        return fs;
    }

    protected void Export(object sender, EventArgs e)
    {
        ExportMonthlyToExcel();
    }

    protected void generateReports(String beginDate, String endDate, String month)
    {
        DataTable dt = new DataTable();
        String sqlMonthlyToExcel = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
                    " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID where prog.ProgDate between '" + beginDate  + "' and '" + endDate +"'";
        SqlCommand cmd = new SqlCommand(sqlMonthlyToExcel, connect);
        SqlDataAdapter adpt = new SqlDataAdapter(cmd);
        adpt.Fill(dt);
        wb.Worksheets.Add(dt, month + " Report");
    }
}
