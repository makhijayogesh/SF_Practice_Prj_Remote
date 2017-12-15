public class Account_Search_Wrapper_Example_Cls {

    public String AccountName { get;set;}
    public String Acnm{get;set;}
    public List<Contact> listContactRecords{get;set;}
    public String accountIDStr {get;set;}
    public string message{get;set;}
    Public List<Account> Acid{get;set;}
    public boolean pgbSectionContactDetailID_flag{get;set;}
    public boolean enableContactMessage{get;set;}
    public List<Wrapper_Contact> contactList{get;set;}
    
   public Account_Search_Wrapper_Example_Cls(){
        Acid = new List<Account>();
        listContactRecords = new List<Contact>();
        contactList=null; 
        pgbSectionContactDetailID_flag = false;  
        enableContactMessage = false;
   }
    
    /*
    public List<Wrapper_Contact> getContactRecords() {

        contactList=null; 
        //listContactRecords = [select firstname,lastname,phone,email from contact where AccountID=:accountIDStr];
        //if(listContactRecords.Size()<=0)
         //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Contact is not present')); 
        
             
        contactList = new List<Wrapper_Contact>();
        System.debug('accountIDStr-->'+accountIDStr);
        
        if (accountIDStr!=null) {            
            for(Contact c: [select name,email from contact where AccountID=:accountIDStr]) {
                // As each contact is processed we create a new cContact object and add it to the contactList

                contactList.add(new Wrapper_Contact(c));
            }
        }                   
        return contactList;
                
    }
    */
    
    public void getContactRecords() {
        if(accountIDStr != null) {
            listContactRecords = [select firstname,lastname,phone,email from contact where AccountID=:accountIDStr];
        }
        
        if(listContactRecords != null && listContactRecords.isEmpty()) {
           
            pgbSectionContactDetailID_flag = false;
            enableContactMessage = true;

            System.debug('pgbSectionContactDetailID_flag >>>>>>'+pgbSectionContactDetailID_flag);
            System.debug('enableContactMessage >>>>>>'+enableContactMessage );
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Contact is not present')); 
        }
        else {
            pgbSectionContactDetailID_flag = true;
            enableContactMessage = false;
            System.debug('pgbSectionContactDetailID_flag >>>>>>'+pgbSectionContactDetailID_flag);
        }
    }
    
    
    public void searchAccount(){

        listContactRecords=null;
        String searchText = '%' + AccountName + '%';
                      
        Acid = [select id,name,site,phone,Industry from account where name like : searchText];
        System.debug('Acid Value -> '+Acid);
        if(Acid != null && Acid.isEmpty()) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Account is not present'));
            pgbSectionContactDetailID_flag = false;
            enableContactMessage = false;
        }      
     }
    
      public class Wrapper_Contact{
         public Contact con{get;set;}
         public boolean Selected{get;set;}
         public Wrapper_Contact(Contact c){
             con=c;
             Selected=false;
         }
         
         
     }
}