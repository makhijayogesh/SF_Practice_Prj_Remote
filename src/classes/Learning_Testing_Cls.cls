public class Learning_Testing_Cls {
    List<Account> listAccount;
    Account accRecord;
    
    public void insertAccount(){
        accRecord=new Account();
        listAccount=new List<Account>();
        accRecord.name='Test Account';
        listAccount.add(accRecord);
    	Database.saveresult[] result_Insert=Database.insert(listAccount);
    	System.debug('Result of Insert -- >'+result_Insert);    
    }

}