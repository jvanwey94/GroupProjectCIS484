using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Program
/// </summary>
public class Program
{
    private String organizationName = "";
    private String onOffSite = "";
    private String programStatus = "";
    private String programAddress = "";
    private String city = "";
    private String county = "";
    private String programMonth = "";
    private String programDate = "";
    private int numberOfKids = 0;
    private int numberOfAdults = 0;
    private String birds = "";
    private String mammals = "";
    private String reptiles = "";
    private String payStatus = "";
    private String invoiceID = "";
    private String lastUpdatedBy = "";
    private String lastUpdated = "";

    public Program()
    {
        
    }

    public String getOrganizationName()
    {
        return this.organizationName;
    }

    public String getOnOffSite()
    {
        return this.onOffSite;
    }
    
    public String getProgramStatus()
    {
        return this.programStatus;
    }

    public String getProgramAddress()
    {
        return this.programAddress;
    }

    public String getCity()
    {
        return this.city;
    }

    public String getCounty()
    {
        return this.county;
    }

    public String getProgramMonth()
    {
        return this.programMonth;
    }

    public String getProgramDate()
    {
        return this.programDate;
    }

    public int getNumberOfKids()
    {
        return this.numberOfKids;
    }

    public int getNumberOfAdults()
    {
        return this.numberOfAdults;
    }

    public String getBirds()
    {
        return this.birds;
    }

    public String getMammals()
    {
        return this.mammals;
    }

    public String getReptiles()
    {
        return this.reptiles;
    }

    public String getPayStatus()
    {
        return this.payStatus;
    }

    public String getInvoiceID()
    {
        return this.invoiceID;
    }

    public String getLastUpdatedBy()
    {
        return this.lastUpdatedBy;
    }

    public String getLastUpdated()
    {
        return this.lastUpdated;
    }
}