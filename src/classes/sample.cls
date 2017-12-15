// This is sample Class
public class sample
{
    public Boolean Abool {get;set;}
    public Boolean Bbool {get;set;} 
    
    public sample()
    {
        Abool = false;
        Bbool = false;    
    }   
    public void callA()
    {
        Abool = true;
        Bbool = false;
    }   
    public void callB()
    {
        Abool = false;
        Bbool = true;    
    }     
}