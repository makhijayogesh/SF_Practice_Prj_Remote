public class Outputpanel_Apex {
    
    public boolean rend {get;set;}
    public boolean rend1{get;set;}

    public outputpanel_apex(ApexPages.StandardController controller)
    {
        rend=false;
    }
    public outputpanel_apex()
    {
        rend=true;
    }
    public void commandLinkAction()
    {
        rend=true;
        rend1=false;
    }
    public void commandLinkAction1()
    {
        rend=false;
        rend1=true;
    }
}