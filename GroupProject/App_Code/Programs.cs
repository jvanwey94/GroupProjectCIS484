using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Program
/// </summary>
public class Programs
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
    private String educator = "";
    private String programName = "";

    public Programs(String organizationName, String onOffSite, String programStatus, String programAddress, String city, String county, String educator, String programMonth, String programDate, int numberOfKids,
        int numberOfAdults, String birds, String mammals, String reptiles, String payStatus, String invoiceID, String lastUpdatedBy, String lastUpdated, String programName)
    {
        setOrganizationName(organizationName);
        setOnOffSite(onOffSite);
        setProgramStatus(programStatus);
        setProgramAddress(programAddress);
        setCity(city);
        setCounty(county);
        setProgramMonth(programMonth);
        setProgramDate(programDate);
        setNumberOfKids(numberOfKids);
        setNumberOfAdults(numberOfAdults);
        setBirds(birds);
        setMammals(mammals);
        setReptiles(reptiles);
        setPayStatus(payStatus);
        setInvoiceID(invoiceID);
        setLastUpdatedBy(lastUpdatedBy);
        setLastUpdated(lastUpdated);
        setProgramName(programName);
        setEducator(educator);
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

    public String getProgramName()
    {
        return this.programName;
    }

    public String getCounty()
    {
        return this.county;
    }

    public String getEducator()
    {
        return this.educator;
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

    public void setOrganizationName(String organizationName)
    {
        this.organizationName = organizationName;
    }

    public void setOnOffSite(String onOffSite)
    {
        this.onOffSite = onOffSite;
    }

    public void setProgramName(String programName)
    {
        this.programName = programName;
    }

    public void setEducator(String educator)
    {
        this.educator = educator;
    }

    public void setProgramStatus(String programStatus)
    {
        this.programStatus = programStatus;
    }

    public void setProgramAddress(String programAddress)
    {
        this.programAddress = programAddress;
    }

    public void setCity(String city)
    {
        this.city = city;
    }

    public void setCounty(String county)
    {
        this.county = county;
    }

    public void setProgramMonth(String programMonth)
    {
        this.programMonth = programMonth;
    }

    public void setProgramDate(String programDate)
    {
        this.programDate = programDate;
    }

    public void setNumberOfKids(int numberOfKids)
    {
        this.numberOfKids = numberOfKids;
    }

    public void setNumberOfAdults(int numberOfAdults)
    {
        this.numberOfAdults = numberOfAdults;
    }

    public void setBirds(String birds)
    {
        this.birds = birds;
    }

    public void setMammals(String mammals)
    {
        this.mammals = mammals;
    }

    public void setReptiles(String reptiles)
    {
        this.reptiles = reptiles;
    }

    public void setPayStatus(String payStatus)
    {
        this.payStatus = payStatus;
    }

    public void setInvoiceID(String invoiceID)
    {
        this.invoiceID = invoiceID;
    }

    public void setLastUpdatedBy(String lastUpdatedBy)
    {
        this.lastUpdatedBy = lastUpdatedBy;
    }

    public void setLastUpdated(String lastUpdated)
    {
        this.lastUpdated = lastUpdated;
    }
}