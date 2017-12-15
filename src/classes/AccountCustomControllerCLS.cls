public class AccountCustomControllerCLS {

    public PageReference Save() {
        update ac;
        return null;
    }

  
  
  public Account ac{get;set;}
// displayUpdateAccSec  variable is used to hide or display the section.
  public boolean displayUpdateAccSec{get;set;}

  
   
  
  
  public AccountCustomControllerCLS() {
  
  
    //Reading ID from URL     
   ID accountID = ApexPages.currentPage().getParameters().get('id');
   System.debug('>>>>accountID >>> '+accountID );
   ac=[select id,name,site,BillingAddress,BillingCity,Billingstate from account where ID=:accountID];
   System.debug('>>>>Reterived Information >>> '+ac );
       
    displayUpdateAccSec=false;
   
  }
    
    
     public void displayUpdateAccDetails()  {
                 
         displayUpdateAccSec=true;
         
     
    }
    
    
    
}