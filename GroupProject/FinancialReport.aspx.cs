using System;
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
//using ClosedXML.Excel;
using System.Drawing;
using System.ComponentModel;
using System.Windows.Forms;
using System.Text;



public partial class FinancialReport : System.Web.UI.Page
{
    //SqlConnection connect = new SqlConnection(@"Server =localhost; Database = Payment4; Trusted_Connection = Yes;");
    System.Data.SqlClient.SqlConnection connect = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);

    //create data table variable ti display gridview
    DataTable dtbl = new DataTable();
    //XLWorkbook wb = new XLWorkbook();
    
    protected void Page_Load(object sender, EventArgs e)
    {
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
        String getInvoiceNumber = HttpUtility.HtmlEncode(txtSearch.Text);
        //lblStatus.Text = getInvoiceNumber + "succseessfully connect to database!  ";
        String sqlDA = "SELECT * FROM [dbo].[Payment]  where InvoiceID = @InvoiceID";
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand(sqlDA, connect);
        insert.Parameters.AddWithValue("@InvoiceID", txtSearch.Text);
        SqlDataAdapter getsqlDA = new SqlDataAdapter(insert);
        //lblStatus.Text = "Loading";
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
        try
        {
        Int32 InputCheckNumber;
        String InputInvoiceNumber = HttpUtility.HtmlEncode(txtInvoice.Text);
        if (txtCheckNumber.Text == String.Empty)
        {
            InputCheckNumber = 0;
        }
        else
        {
            InputCheckNumber = Convert.ToInt32(HttpUtility.HtmlEncode(txtCheckNumber.Text));
        }

        //edit the datatype
        Decimal InputAmount = Convert.ToDecimal(HttpUtility.HtmlEncode(txtAmount.Text));
        Decimal InputPaymentCollect = 0;
        Decimal InputPaymenLeft = 0;
        //String InputLastUpdatedBy = "Kevin";
        //DateTime InputLastUpdated = DateTime.Now.Date;
        String InputProgram = txtProgram.SelectedItem.ToString();
        String InputOrganization = txtOrganization.SelectedItem.ToString();
        String InputPaymentType = txtPaymentType.SelectedItem.ToString();
        String InputStatus = HttpUtility.HtmlEncode(lblIncomplete.Text);


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

        string primaryContact = "select * from [dbo].[Organization] where OrganizationName = '" + txtOrganization.SelectedItem.ToString() + "';";
        SqlCommand cmdDatabase1 = new SqlCommand(primaryContact, connect);

        SqlDataReader myreader;

        //try
        //{

            myreader = cmdDatabase1.ExecuteReader();
            //myreader = cmdDatabase2.ExecuteReader();


            while (myreader.Read())
            {

                string ContactPerson = myreader.GetString(5);
                txtContactPerson.Text = ContactPerson;

            }
        //}
        //catch (Exception ex)
        //{

        //}
        myreader.Close();
        
        
        //@PaymentCollect,@PaymentLeft,,@Amount
        //@OrganizationName" +
        //    "@Program,@PaymentType,@CheckNumber,@PaymentStatus," +
        //insert data to Bird table if text box is qualified
        if ((txtInvoice.Text != "") && (txtAmount.Text != string.Empty))
        {
            //Insert into programAnimal table
            string AnimalNameString = "";
            
                    


            //        string getOrganizationID = "select * from [dbo].[Organization] where OrganizationName = '" + txtOrganization.SelectedItem.Text + "';";
            //        string getProgramID = "select * from [dbo].[Program] where ProgramName = '" + txtProgram.SelectedItem.Text + "';";
            //        SqlCommand cmdDatabase3 = new SqlCommand(getOrganizationID, connect);
            ////SqlCommand cmdDatabase4 = new SqlCommand(getProgramID, connect);
            ////SqlDataReader myreader3;
            //SqlDataReader myreader4;

            //myreader3 = cmdDatabase3.ExecuteReader();
            
            
            //myreader3.Read();
            //int organizationID = myreader3.GetInt32(0);
            //myreader3.Close();

            
            //myreader4 = cmdDatabase4.ExecuteReader();
            //myreader4.Read();

            //int programID = myreader3.GetInt32(0);
            
            //myreader4.Close();

           
            
            //BirdClass bird = new BirdClass(InputBirdName, InputBirdType, InputLastUpdatedBy, InputLastUpdated, InputBirdAct);
            String query1 = "insert into [dbo].[Payment] values (@InvoiceID,@OrganizationName,@Program,@PaymentType,@CheckNumber,@Amount,@PaymentStatus,@LastUpdatedBy,@LastUpdated,@ProgramID,@OrganizationID,@BillAddress,@ContactPerson)";
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand(query1, connect);
            insert.Connection = connect;
            insert.Parameters.AddWithValue("@InvoiceID", InputInvoiceNumber);
            insert.Parameters.AddWithValue("@OrganizationName", InputOrganization);
            insert.Parameters.AddWithValue("@Program", InputProgram);
            insert.Parameters.AddWithValue("@PaymentType", InputPaymentType);
            insert.Parameters.AddWithValue("@CheckNumber", InputCheckNumber);
            insert.Parameters.AddWithValue("@Amount", InputAmount);
            //insert.Parameters.AddWithValue("@PaymentCollect", InputPaymentCollect);
            //insert.Parameters.AddWithValue("@PaymentLeft", InputPaymenLeft);
            insert.Parameters.AddWithValue("@PaymentStatus", InputStatus);
            insert.Parameters.AddWithValue("@LastUpdatedBy", "Kevin");
            insert.Parameters.AddWithValue("@LastUpdated", DateTime.Now.Date);
            insert.Parameters.AddWithValue("@ProgramID", 23);
            insert.Parameters.AddWithValue("@OrganizationID", 18);
            insert.Parameters.AddWithValue("@BillAddress", HttpUtility.HtmlEncode(txtAddress.Text));
            insert.Parameters.AddWithValue("@ContactPerson", HttpUtility.HtmlEncode(txtContactPerson.Text));

            insert.ExecuteNonQuery();
            //lblStatus.Text = "succseessful to add this payment to database!";
            //txtTest.Text = InputStatus;

            txtAmount.Text = string.Empty;
            txtCheckNumber.Text = string.Empty;
            txtInvoice.Text = string.Empty;
            //txtLastUpdatedBy.Text = string.Empty;
            //txtLastUpdated.Text = string.Empty;
            txtSearch.Text = string.Empty;

        }
        
        connect.Close();
        }
        catch (Exception)
        {
            Response.Write("<script>alert('user must fill required fileds!)</script>");
            return;
        }
    }//commit button done

    protected void btn1_Search(object sender, EventArgs e)
    {
        try
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
        }
        catch
        {
            Response.Write("<script>alert('Error searching for invoice. Please try again.')</script>");
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
        //try
        //{

        connect.Open();
        String query = "Update [dbo].[Payment] set InvoiceID=@InvoiceID, OrganizationName=@OrganizationName, Program=@Program, " +
            "PaymentType=@PaymentType, CheckNumber=@CheckNumber,Amount=@Amount where InvoiceID=@InvoiceID";
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand(query, connect);
        insert.Connection = connect;
        insert.Parameters.AddWithValue("@InvoiceID", (dbInvoice.Rows[e.RowIndex].FindControl("GridInvoiceID") as System.Web.UI.WebControls.TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@OrganizationName", (dbInvoice.Rows[e.RowIndex].FindControl("GridOrganization") as System.Web.UI.WebControls.TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@Program", (dbInvoice.Rows[e.RowIndex].FindControl("GridProgram") as  System.Web.UI.WebControls.TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@PaymentType", (dbInvoice.Rows[e.RowIndex].FindControl("GridPaymentType") as System.Web.UI.WebControls.TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@CheckNumber", (dbInvoice.Rows[e.RowIndex].FindControl("GridCheckNumber") as System.Web.UI.WebControls.TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@Amount", (dbInvoice.Rows[e.RowIndex].FindControl("GridAmount") as System.Web.UI.WebControls.TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@PaymentCollect", (dbInvoice.Rows[e.RowIndex].FindControl("GridPaymentCollect") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@PaymentLeft", (dbInvoice.Rows[e.RowIndex].FindControl("GridPaymentLeft") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@PaymentStatus", (dbInvoice.Rows[e.RowIndex].FindControl("GridStatus") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@LastUpdatedBy", (dbInvoice.Rows[e.RowIndex].FindControl("GridLastUpdatedBy") as TextBox).Text.Trim());

        //insert.Parameters.AddWithValue("@LastUpdated", (dbInvoice.Rows[e.RowIndex].FindControl("GridLastUpdated") as TextBox).Text.Trim());



        //insert.Parameters.AddWithValue("@InvoiceID", Convert.ToInt32(dbInvoice.DataKeys[e.RowIndex].Value.ToString()));
        insert.ExecuteNonQuery();
        dbInvoice.EditIndex = -1;
        connect.Close();
        PopulateGridview();

        lblStatus.Text = "Successfully updated";

        //}
        //catch (Exception ex)
        //{
        //    txtTest.Text = "";
        //    txtTest.Text = ex.Message;
        //}
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

    protected void dbInvoice_DataBound(object sender, EventArgs eventArgs)
    {
        
    } 

    protected void dbInvoice_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    void dbInvoice_CellValueChanged(object sender, EventArgs e)
    {

    }


    // Test generateMonthlyReport()
    //if not working try:
    // tools -> nuget package manager -> Manage nuget package for solution -> reinstall ClosedXML
    // if still not working try:
    // tools -> nuget package manager console -> Install-Package DocumentFormat.OpenXml -Version 2.5.0
    // if that doesn't work, then just give up.
    //public void ExportToExcel()
    //{
    //    DataTable dt = new DataTable();
    //    String sqlDA = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //        " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID";
    //    SqlCommand filltable = new SqlCommand(sqlDA, connect);
    //    SqlDataAdapter adapt = new SqlDataAdapter(filltable);
    //    adapt.Fill(dt);


    //    String folderPath = "C:\\Users\\labpatron\\Documents";
    //    if (!Directory.Exists(folderPath))
    //    {
    //        Directory.CreateDirectory(folderPath);
    //    }
    //    using (XLWorkbook wb = new XLWorkbook())
    //    {
    //        wb.Worksheets.Add(dt, "Financial Reports");
    //        String myName = Server.UrlEncode("Test1" + "_" +
    //            DateTime.Now.ToShortDateString() + ".xlsx");
    //        MemoryStream stream = GetStream(wb);
    //        Response.Clear();
    //        Response.AddHeader("content-disposition", "attachment; filename=" + myName);
    //        Response.ContentType = "application/vnd.ms-excel";
    //        Response.BinaryWrite(stream.ToArray());
    //        Response.End();
    //    }
    //}

    ////try to add each table to a separate worksheet
    //public void ExportMonthlyToExcel()
    //{
    //    connect.Open();
    //    String[] monthsTxt = new string[] { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
    //    String[] monthsNum = new String[] { "01", "02", "03", "04", "04", "06", "07", "08", "09", "10", "11", "12" };
    //    int monthlyDays = 0;
    //    String year = DateTime.Now.Year.ToString();
    //    String folderPath = "C:\\Users\\labpatron\\Documents";

    //    DataTable yearlydt = new DataTable();
    //    String sqlDA = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //        " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID";
    //    SqlCommand tablefiller = new SqlCommand(sqlDA, connect);
    //    SqlDataAdapter adapter = new SqlDataAdapter(tablefiller);
    //    adapter.Fill(yearlydt);

    //    if (!Directory.Exists(folderPath))
    //    {
    //        Directory.CreateDirectory(folderPath);
    //    }

    //    wb.Worksheets.Add(yearlydt, "Annual Report");


    //    //add a sheet for each month in the year
    //    //for (int i = 0; i < monthsNum.Length; i++)
    //    //    {
    //    //        monthlyDays = DateTime.DaysInMonth(int.Parse(year), int.Parse(monthsNum[i]));
    //    //        generateReports(year + "/" + monthsNum[i] + "/01", year + "/" + monthsNum[i] + "/" + monthlyDays.ToString(), monthsTxt[i]);
    //    //    }

    //    generateMonthlyReports();

    //    String myName = Server.UrlEncode("Test1" + "_" +
    //            DateTime.Now.ToShortDateString() + ".xlsx");
    //    MemoryStream stream = GetStream(wb);
    //    Response.Clear();
    //    Response.AddHeader("content-disposition", "attachment; filename=" + myName);
    //    Response.ContentType = "application/vnd.ms-excel";
    //    Response.BinaryWrite(stream.ToArray());
    //    Response.End();

    //    connect.Close();

    //}

    //public MemoryStream GetStream(XLWorkbook excelWorkbook)
    //{
    //    MemoryStream fs = new MemoryStream();
    //    excelWorkbook.SaveAs(fs);
    //    fs.Position = 0;
    //    return fs;
    //}

    //protected void Export(object sender, EventArgs e)
    //{
    //    generateMonthlyReports();
    //}


    //protected void generateMonthlyReports()
    //{
    //    connect.Open();
    //    String[] monthsTxt = new string[] { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
    //    String[] monthsNum = new String[] { "01", "02", "03", "04", "04", "06", "07", "08", "09", "10", "11", "12" };
    //    int monthlyDays = 0;
    //    String year = DateTime.Now.Year.ToString();

    //    //Annual
    //    DataTable yearlydt = new DataTable();
    //    String sqlDA = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //        " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID";
    //    SqlCommand tablefiller = new SqlCommand(sqlDA, connect);
    //    SqlDataAdapter adapter = new SqlDataAdapter(tablefiller);
    //    adapter.Fill(yearlydt);
    //    wb.Worksheets.Add(yearlydt, "Annual Report");

    //    //January
    //    DataTable jandt = new DataTable();
    //    String janQuery = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //                " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID where prog.ProgDate between '2018/01/01' and '2018/01/31'";
    //    SqlCommand jancmd = new SqlCommand(janQuery, connect);
    //    SqlDataAdapter janadapt = new SqlDataAdapter(jancmd);
    //    janadapt.Fill(jandt);
    //    wb.Worksheets.Add(jandt, "January Report");

    //    //February
    //    DataTable febdt = new DataTable();
    //    String febQuery = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //                " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID where prog.ProgDate between '2018/02/01' and '2018/02/28'";
    //    SqlCommand febcmd = new SqlCommand(febQuery, connect);
    //    SqlDataAdapter febadapt = new SqlDataAdapter(febcmd);
    //    febadapt.Fill(febdt);
    //    wb.Worksheets.Add(febdt, "February Report");

    //    //March
    //    DataTable mardt = new DataTable();
    //    String marQuery = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //                " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID where prog.ProgDate between '2018/03/01' and '2018/03/31'";
    //    SqlCommand marcmd = new SqlCommand(marQuery, connect);
    //    SqlDataAdapter maradapt = new SqlDataAdapter(marcmd);
    //    maradapt.Fill(mardt);
    //    wb.Worksheets.Add(mardt, "March Report");

    //    //April
    //    DataTable aprdt = new DataTable();
    //    String aprQuery = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //                " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID where prog.ProgDate between '2018/04/01' and '2018/04/30'";
    //    SqlCommand aprcmd = new SqlCommand(aprQuery, connect);
    //    SqlDataAdapter apradapt = new SqlDataAdapter(aprcmd);
    //    apradapt.Fill(aprdt);
    //    wb.Worksheets.Add(aprdt, "April Report");

    //    //June
    //    DataTable jundt = new DataTable();
    //    String junQuery = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //                " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID where prog.ProgDate between '2018/06/01' and '2018/06/30'";
    //    SqlCommand juncmd = new SqlCommand(junQuery, connect);
    //    SqlDataAdapter junadapt = new SqlDataAdapter(juncmd);
    //    junadapt.Fill(jundt);
    //    wb.Worksheets.Add(jundt, "June Report");

    //    //July
    //    DataTable juldt = new DataTable();
    //    String julQuery = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //                " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID where prog.ProgDate between '2018/07/01' and '2018/07/31'";
    //    SqlCommand julcmd = new SqlCommand(julQuery, connect);
    //    SqlDataAdapter juladapt = new SqlDataAdapter(julcmd);
    //    juladapt.Fill(juldt);
    //    wb.Worksheets.Add(juldt, "July Report");

    //    //August
    //    DataTable augdt = new DataTable();
    //    String augQuery = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //                " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID where prog.ProgDate between '2018/08/01' and '2018/08/31'";
    //    SqlCommand augcmd = new SqlCommand(augQuery, connect);
    //    SqlDataAdapter augadapt = new SqlDataAdapter(augcmd);
    //    augadapt.Fill(augdt);
    //    wb.Worksheets.Add(augdt, "August Report");

    //    //September
    //    DataTable septdt = new DataTable();
    //    String septQuery = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //                " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID where prog.ProgDate between '2018/09/01' and '2018/09/30'";
    //    SqlCommand septcmd = new SqlCommand(septQuery, connect);
    //    SqlDataAdapter septadapt = new SqlDataAdapter(septcmd);
    //    septadapt.Fill(septdt);
    //    wb.Worksheets.Add(septdt, "September Report");

    //    //October
    //    DataTable octdt = new DataTable();
    //    String octQuery = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //                " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID where prog.ProgDate between '2018/10/01' and '2018/10/31'";
    //    SqlCommand octcmd = new SqlCommand(octQuery, connect);
    //    SqlDataAdapter octadapt = new SqlDataAdapter(octcmd);
    //    octadapt.Fill(octdt);
    //    wb.Worksheets.Add(octdt, "October Report");

    //    //November
    //    DataTable novdt = new DataTable();
    //    String novQuery = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //                " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID where prog.ProgDate between '2018/11/01' and '2018/11/30'";
    //    SqlCommand novcmd = new SqlCommand(novQuery, connect);
    //    SqlDataAdapter novadapt = new SqlDataAdapter(novcmd);
    //    novadapt.Fill(novdt);
    //    wb.Worksheets.Add(novdt, "November Report");

    //    //December
    //    DataTable decdt = new DataTable();
    //    String decQuery = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //                " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID where prog.ProgDate between '2018/12/01' and '2018/12/31'";
    //    SqlCommand deccmd = new SqlCommand(decQuery, connect);
    //    SqlDataAdapter decadapt = new SqlDataAdapter(deccmd);
    //    decadapt.Fill(decdt);
    //    wb.Worksheets.Add(decdt, "December Report");
    //    String myName = Server.UrlEncode("Test1" + "_" +
    //            DateTime.Now.ToShortDateString() + ".xlsx");
    //    MemoryStream stream = GetStream(wb);
    //    Response.Clear();
    //    Response.AddHeader("content-disposition", "attachment; filename=" + myName);
    //    Response.ContentType = "application/vnd.ms-excel";
    //    Response.BinaryWrite(stream.ToArray());
    //    Response.End();

    //    connect.Close();



    //}

    //protected void generateReports(String beginDate, String endDate, String month)
    //{
    //    DataTable dt = new DataTable();
    //    String sqlMonthlyToExcel = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //                " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID where prog.ProgDate between '" + beginDate + "' and '" + endDate + "'";
    //    SqlCommand cmd = new SqlCommand(sqlMonthlyToExcel, connect);
    //    SqlDataAdapter adpt = new SqlDataAdapter(cmd);
    //    adpt.Fill(dt);
    //    wb.Worksheets.Add(dt, month + " Report");
    //}

    // file permission problems
    //protected void ExportToExcel(object sender, EventArgs e)
    //{

    //    DataTable dt = new DataTable();
    //    String sqlDA = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //        " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID";
    //    connect.Open();
    //    SqlCommand filltable = new SqlCommand(sqlDA, connect);
    //    SqlDataAdapter adapt = new SqlDataAdapter(filltable);
    //    adapt.Fill(dt);

    //    var lines = new List<String>();
    //    string[] columnNames = dt.Columns.Cast<DataColumn>().Select(column => column.ColumnName).ToArray();
    //    var header = string.Join(",", columnNames);
    //    lines.Add(header);

    //    var valueLines = dt.AsEnumerable().Select(row => string.Join(",", row.ItemArray));
    //    lines.AddRange(valueLines);


    //    File.WriteAllLines("excel.csv", lines);
    //    File.SetAttributes("excel.csv", FileAttributes.Normal);
    //    connect.Close();
    //}

    // semi working :)
    //protected void ExportBTN(object sender, EventArgs e)
    //{
    //    DataTable dt = new DataTable();
    //    String sqlDA = "Select ProgDate, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, PaymentCollect, PaymentLeft, pay.PaymentStatus" +
    //        " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID";
    //    String sqlQuery = "Select * from [dbo].[Payment]";
    //    connect.Open();
    //    SqlCommand filltable = new SqlCommand(sqlQuery, connect);
    //    SqlDataAdapter adapt = new SqlDataAdapter(filltable);
    //    adapt.Fill(dt);

    //    StringBuilder sb = new StringBuilder();

    //    foreach (var col in dt.Columns)
    //    {
    //        sb.Append(col.ToString() + ",");
    //    }

    //    sb.Replace(",", System.Environment.NewLine, sb.Length - 1, 1);

    //    foreach (DataRow dr in dt.Rows)
    //    {
    //        foreach (var column in dr.ItemArray)
    //        {
    //            sb.Replace(",", System.Environment.NewLine, sb.Length - 1, 1);
    //        }
    //    }
    //    System.IO.File.WriteAllText("C:\\Users\\labpatron\\Downloads\\FinancialReport.csv", sb.ToString());
    //    connect.Close();
    //}


    // fully working :)
    protected void ExportExcelBTN(object sender, EventArgs e)
    {
            DataTable dt = new DataTable();
            String sqlDA = "Select Format(ProgDate, 'd') as ProgramDate, pay.InvoiceID, pay.OrganizationName, pay.Program, PaymentType, CheckNumber, Amount, pay.PaymentStatus" +
                " FROM [dbo].[Program] prog inner join [dbo].[Payment] pay on prog.ProgramID = pay.ProgramID";
            connect.Open();
            SqlCommand filltable = new SqlCommand(sqlDA, connect);
            SqlDataAdapter adapt = new SqlDataAdapter(filltable);
            adapt.Fill(dt);

            string attachment = "attachment; filename=FinancialReport.xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.ms-excel";
            string tab = "";
            foreach (DataColumn dc in dt.Columns)
            {
                Response.Write(tab + dc.ColumnName);
                tab = "\t";
            }
            Response.Write("\n");
            int i;
            foreach (DataRow dr in dt.Rows)
            {
                tab = "";
                for (i = 0; i < dt.Columns.Count; i++)
                {
                    Response.Write(tab + dr[i].ToString());
                    tab = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
    }

    protected void txtOrganization_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection connect = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["AWSConnection"].ConnectionString);

        string callState = "select * from [dbo].[Organization] where OrganizationName = '" + txtOrganization.SelectedItem.ToString() + "';";
        SqlCommand cmdDatabase1 = new SqlCommand(callState, connect);

        SqlDataReader myreader;

        try
        {
            connect.Open();
            myreader = cmdDatabase1.ExecuteReader();



            while (myreader.Read())
            {
                //string country = "Usa";
                //string state = "Va";
                string address = myreader.GetString(1);
                string city = myreader.GetString(2);
                string county = myreader.GetString(3);
                string country = myreader.GetString(4);
                string primaryPerson = myreader.GetString(5);
                txtAddress.Text = address + ", " + county + ", " + city + ", " + country;
                txtContactPerson.Text = primaryPerson;
                //txtState.AutoComplteCUstomerSource = country;
            }
        }
        catch (Exception ex)
        {

        }
        connect.Close();
    }

    //protected void dbInvoice_DataBound1(object sender, EventArgs e)
    //{
    //    double restPayment = 0.00;
    //    foreach (GridViewRow row in dbInvoice.Rows)
    //    {
    //        string test = row.Cells[5].Text;
    //        double amount = Double.Parse(test);
    //        double Collect = Double.Parse(row.Cells[6].Text);
    //        restPayment = amount - Collect;
    //    }
    //    GridViewRow footer = dbInvoice.FooterRow;
    //    footer.Cells[0].ColumnSpan = 7;
    //    footer.Cells[0].HorizontalAlign = HorizontalAlign.Right;
    //    footer.Cells[0].Text = "Rest Payment is " + restPayment;
    //}
}
