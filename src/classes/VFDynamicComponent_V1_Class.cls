public class VFDynamicComponent_V1_Class {

    public  Account Account_Rec{get;set;}
    public List<WrapperClass> listWrapper{get;set;}
    public Account AccRec{get;set;}
    public VFDynamicComponent_V1_Class() {
        Account_Rec = new Account();
        WrapperClass wrapperRecord = new WrapperClass(Account_Rec);
        listWrapper = new List<WrapperClass>();
        listWrapper.add(wrapperRecord);
    }
    
    public void addAccountSection(){
        
        WrapperClass wrapperRecord = new WrapperClass(new Account());
        listWrapper.add(wrapperRecord);
    }
       
    public void removeAccountSection(){
        if(listWrapper!=null && !listWrapper.isEmpty()){
            Integer indexToBeRemoved = listWrapper.size()-1;
            listWrapper.remove(indexToBeRemoved);
        }
         
    }
   public void SaveAccount(){
               System.debug('AccRec-->'+AccRec);
               //Account ac=new Account();
              // ac.name=AccRec.name;
               
               
               // insert ac;
   }
 
    public class WrapperClass {
            
        public  Account accountRecord{get;set;}
            
        public WrapperClass(Account ac){
             accountRecord=ac;
             
        }
    
    }

  
}