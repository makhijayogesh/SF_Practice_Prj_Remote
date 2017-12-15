public with sharing class CustomerSearchController
{
    public List<Contact> results{get;set;}
    public string searchStr{get;set;}
    public CustomerSearchController()
    {
      results=new List<contact>();  
    }
    
        public pageReference doSearch()
        {
        
       String CustomerName='%'+string.escapeSingleQuotes(searchStr)+'%';
        System.debug('Customer Name='+CustomerName);
       results=[select id,Firstname,Lastname,Email,Phone from Contact where name like :CustomerName];
       //system.debug('Result='+results + ' '+ 'Customer Name='+CustomerName);
       return null;
        }
        public boolean getresultsAvailable()
    {
        return (results.size()>0);
    }
}