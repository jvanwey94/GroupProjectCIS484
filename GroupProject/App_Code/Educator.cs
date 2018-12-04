using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Educator
{
    string FirstName;
    string LastName;
    string email;
    string phone;
    string Status;

    public Educator(string fn, string ls, string em, string ph, string status)
    {
        setFN(fn);
        setLN(ls);
        setEM(em);
        setPH(ph);
        setStatus(status);
        

    }

    public void setFN(string fn)
    {
        this.FirstName = fn;
    }
    public void setLN(string ls)
    {
        this.LastName = ls;
    }
    public void setEM(string em)
    {
        this.email = em;
    }
    public void setPH(string ph)
    {
        this.phone = ph;
    }
    public void setStatus(string status)
    {
        this.Status = status;
    }
    public string getFN()
    {
        return this.FirstName;
    }
    public string getLN()
    {
        return this.LastName;
    }
    public string getEM()
    {
        return this.email;
    }
    public string getPH()
    {
        return this.phone;
    }
    public string getStatus()
    {
        return this.Status;
    }
}