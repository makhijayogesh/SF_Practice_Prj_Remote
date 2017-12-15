//Resource https://www.youtube.com/watch?v=gqb6-LAujQ8
//Wizard Programe for learning wizard

Public Class Wizard_Demo
{
    //defining three Standard Object
    Account a=new Account();
    Contact c=new Contact();
    Opportunity o=new Opportunity();
    //defining get Method for each Sobject
    Public Account geta()
    {
    return a;
    }
    
    Public Contact getc()
    {
    return c;
    }
    
    Public Opportunity geto()
    {
    return o;
    }
    //Navigation Methods
    public pagereference goto_Page1_Wizard_Account()
    {
    return Page.Page1_Wizard_Account;
    }

    public pagereference goto_Page2_Wizard_Contact()
    {
    return Page.Page2_Wizard_Contact;
    }
    public pagereference goto_Page2_Wizard_Opportunity()
    {
    return Page.Page2_Wizard_Opportunity;
    }
    public pagereference goto_Page2_Wizard_Review()
    {
    return Page.Page2_Wizard_Review;
    }
    //Saving the data
    public pagereference Save_Now()
    {
    insert a;
    c.AccountID=a.ID;
    insert c;
    o.AccountID=a.ID;
    insert o;
    return Page.Page2_Wizard_Status;
    }
    
    


}