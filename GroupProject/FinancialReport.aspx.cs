using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class FinancialReport : System.Web.UI.Page
{
    SqlConnection connect = new SqlConnection(@"Server =localhost; Database = Payment4; Trusted_Connection = Yes;");

    protected void Page_Load(object sender, EventArgs e)
    {
        txtLastUpdatedBy.Text = "Kevin    ";
        txtLastUpdated.Text = DateTime.Now.ToString();
        lblPaymentCollect.Visible = false;
        lblPaymentLeft.Visible = false;
        txtPaymentCollect.Visible = false;
        txtPaymentLeft.Visible = false;
        lblComplete.Visible = false;
        lblIncomplete.Visible = false;
        if (!Page.IsPostBack)
        {
            txtLastUpdated.Text = DateTime.Now.ToString();
            if (txtPaymentType.SelectedItem.ToString() == "Check")
            {

            }
            //    dbInvoice.Visible = true;
        }
    }


    //create data table variable ti display gridview
    DataTable dtbl = new DataTable();

    //populate gridview
    void PopulateGridview()
    {
        //connect.Open();
        String getInvoiceNumber = txtSearch.Text;
        txtTest.Text = getInvoiceNumber + "succseessfully connect to database!  ";
        SqlDataAdapter sqlDA = new SqlDataAdapter("SELECT * FROM [Payment4] where InvoiceID like '" + txtSearch.Text + "%'", connect);
        lblStatus.Text = "Loading";
        sqlDA.Fill(dtbl);

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
            String InputInvoiceNumber = txtInvoice.Text;
            Int32 InputCheckNumber = Convert.ToInt32(txtCheckNumber.Text);
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
                String query1 = "insert into [dbo].[Payment4] values (@InvoiceID,@OrganizationName,@Program,@PaymentType,@CheckNumber,@Amount,@PaymentCollect,@PaymentLeft,@PaymentStatus,@LastUpdatedBy,@LastUpdated)";
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
                insert.Parameters.AddWithValue("@LastUpdatedBy", InputLastUpdatedBy);
                insert.Parameters.AddWithValue("@LastUpdated", InputLastUpdated);

                insert.ExecuteNonQuery();
                lblStatus.Text = "succseessful to add this payment to database!";
                txtTest.Text = InputStatus;

                txtAmount.Text = string.Empty;
                txtCheckNumber.Text = string.Empty;
                txtInvoice.Text = string.Empty;
                txtLastUpdatedBy.Text = string.Empty;
                txtLastUpdated.Text = string.Empty;
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

        if (txtSearch.Text != string.Empty)
        {
            PopulateGridview();
            dbInvoice.Visible = true;
        }
        else
        {
            dbInvoice.Visible = false;
            Response.Write("<script>alert('No matching records are found! Please enter a bird name!')</script>");

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
        String query = "Update [dbo].[Payment4] set InvoiceID=@InvoiceID, OrganizationName=@OrganizationName, Program=@Program, " +
            "PaymentType=@PaymentType, CheckNumber=@CheckNumber,Amount=@Amount, PaymentCollect=@PaymentCollect, " +
            "PaymentLeft=@PaymentLeft, PaymentStatus=@PaymentStatus, LastUpdatedBy=@LastUpdatedBy, LastUpdated=@LastUpdated" +
            " where InvoiceID=@InvoiceID";
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand(query, connect);
        insert.Connection = connect;
        insert.Parameters.AddWithValue("@InvoiceID", (dbInvoice.Rows[e.RowIndex].FindControl("GridInvoiceID") as TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@OrganizationName", (dbInvoice.Rows[e.RowIndex].FindControl("GridOrganization") as TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@Program", (dbInvoice.Rows[e.RowIndex].FindControl("GridProgram") as TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@PaymentType", (dbInvoice.Rows[e.RowIndex].FindControl("GridPaymentType") as TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@CheckNumber", (dbInvoice.Rows[e.RowIndex].FindControl("GridCheckNumber") as TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@Amount", (dbInvoice.Rows[e.RowIndex].FindControl("GridAmount") as TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@PaymentCollect", (dbInvoice.Rows[e.RowIndex].FindControl("GridPaymentCollect") as TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@PaymentLeft", (dbInvoice.Rows[e.RowIndex].FindControl("GridPaymentLeft") as TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@PaymentStatus", (dbInvoice.Rows[e.RowIndex].FindControl("GridStatus") as TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@LastUpdatedBy", (dbInvoice.Rows[e.RowIndex].FindControl("GridLastUpdatedBy") as TextBox).Text.Trim());

        insert.Parameters.AddWithValue("@LastUpdated", (dbInvoice.Rows[e.RowIndex].FindControl("GridLastUpdated") as TextBox).Text.Trim());



        //insert.Parameters.AddWithValue("@InvoiceID", Convert.ToInt32(dbInvoice.DataKeys[e.RowIndex].Value.ToString()));
        insert.ExecuteNonQuery();
        dbInvoice.EditIndex = -1;
        PopulateGridview();
        connect.Close();
        txtTest.Text = "Successfully updated";
        txtTest.Text = "";
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


    protected void dbInvoice_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    void dbInvoice_CellValueChanged(object sender, EventArgs e)
    {

    }
}
