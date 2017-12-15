public class Account_Search_WrapperEx {

    public String AccountName { get;set;}
    public String Acnm{get;set;}
    public List<Contact> listContactRecords{get;set;}
    public String accountIDStr {get;set;}
    public string message{get;set;}
    Public List<Account> Acid{get;set;}
    public boolean pgbSectionContactDetailID_flag{get;set;}
    public boolean enableContactMessage{get;set;}
    public List<SearchResultWrapper> listSearchResultWrapper {get;set;}
    public boolean saveAccounts_btn_flg{get;set;}
    public boolean chkValue{get;set;}
    public boolean deSelectAll_chkbox{get;set;}
    public boolean deSelectAll_chkbox_flag{get;set;}
     
    public Account_Search_WrapperEx (){
        Acid = new List<Account>();
        listSearchResultWrapper = new List<SearchResultWrapper>();
        saveAccounts_btn_flg=false;
    }
    
    
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
      
    
    
    public void selectAllCheckBox(){
         
        if(chkValue==true){
            /*
            if(Acid != null && !Acid.isEmpty()) {
                listSearchResultWrapper=null;
                listSearchResultWrapper = new List<SearchResultWrapper>();
                for(Account accountRec : Acid){
                
                    SearchResultWrapper searchResultWrapper_Record = new SearchResultWrapper(true,accountRec);
                    listSearchResultWrapper.add(searchResultWrapper_Record);
                
                }
            }
            */
            
            for(SearchResultWrapper wrapperRecord : listSearchResultWrapper) {
                wrapperRecord.selectCheckBox1 = true;
            }
            
            
        }
        else if(chkValue==false){
            for(SearchResultWrapper wrapperRecord : listSearchResultWrapper) {
                wrapperRecord.selectCheckBox1 = false;
            }
            
            /*
            if(Acid != null && !Acid.isEmpty()) {
                    listSearchResultWrapper=null;
                    listSearchResultWrapper = new List<SearchResultWrapper>();
                for(Account accountRec : Acid){
                
                    SearchResultWrapper searchResultWrapper_Record = new SearchResultWrapper(false,accountRec);
                    listSearchResultWrapper.add(searchResultWrapper_Record);
                
                }
            }
            */
        }
                
                
                system.debug('listSearchResultWrapper in SaveAllCheckBox method >>>>'+listSearchResultWrapper);
                
    }
    public void deSelectAll_fun(){
        if(deSelectAll_chkbox==false)
            deSelectAll_chkbox_flag=false;
    }
    
    public void cleanList()
    {
        listContactRecords=null;
    }
    
    public void searchAccount(){

        listContactRecords=null;
        String searchText = '%' + AccountName + '%';
        Acid = [select id,name,site,phone,Industry from account where name like : searchText];
        
        if(Acid != null && !Acid.isEmpty()) {
            saveAccounts_btn_flg=true;
            for(Account accountRec : Acid) {
                
                SearchResultWrapper searchResultWrapper_Record = new SearchResultWrapper(false,accountRec);
                listSearchResultWrapper.add(searchResultWrapper_Record);
                
                //system.debug('listSearchResultWrapper >>>>'+listSearchResultWrapper);
            }
        
        }
        
        
        System.debug('Acid Value -> '+Acid);
        if(Acid != null && Acid.isEmpty()) {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Account is not present'));
            pgbSectionContactDetailID_flag = false;
            enableContactMessage = false;
        }      
    }
    
    Public PageReference saveAccounts(){
           
        System.debug('listSearchResultWrapper>>>'+listSearchResultWrapper);
        List<Account> listAccountForUpdate = new List<Account>();
        for(SearchResultWrapper wrapperRecord : listSearchResultWrapper) {
            if(wrapperRecord.selectCheckBox1 == true) {
                listAccountForUpdate.add(wrapperRecord.accountRecord);
            }
        }
        //update Acid;
        
        if(listAccountForUpdate != null && !listAccountForUpdate.isEmpty()) {
            System.debug('listAccountForUpdate>>>'+listAccountForUpdate);
            update listAccountForUpdate;
        }
        return ApexPages.CurrentPage();
    }
    
    
    public class SearchResultWrapper {
    
        public boolean selectCheckBox1 {get;set;}
        /*
        public boolean getselectCheckBox1() {
            return false;
        
        }
        
        public void setselectCheckbox1(Boolean xyz) {
            if(xyz==null) {
                this.selectCheckBox1 = false;
            }
            else {
                this.selectCheckBox1 = xyz;
            }
        }
        */
        public Account accountRecord {get;set;}
        
        
            
        public SearchResultWrapper() {
        
        }
        
        public SearchResultWrapper(boolean param_SelectCheckBox, Account param_AccountRecord) {
            selectCheckBox1 = param_SelectCheckBox;
            accountRecord = param_AccountRecord;
        }
    
    }
    
}