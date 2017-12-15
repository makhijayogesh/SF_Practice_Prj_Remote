@isTest
private class AccountSearch_Test{
  static testMethod void test_getContactRecords_UseCase1(){
    AccountSearch obj01 = new AccountSearch();
    obj01.AccountName = 'test data';
    obj01.Acnm = 'test data';
    obj01.listContactRecords = new List<Contact>();
    obj01.accountIDStr = 'test data';
    obj01.message = 'test data';
    obj01.Acid = new List<Account>();
    obj01.pgbSectionContactDetailID_flag = false;
    obj01.enableContactMessage = false;
    obj01.contactList = new List<AccountSearch.Wrapper_Contact>();
    obj01.getContactRecords();
    
  }
  static testMethod void test_searchAccount_UseCase1(){
    AccountSearch obj01 = new AccountSearch();
    obj01.AccountName = 'test data';
    obj01.Acnm = 'test data';
    obj01.listContactRecords = new List<Contact>();
    obj01.accountIDStr = 'test data';
    obj01.message = 'test data';
    obj01.Acid = new List<Account>();
    obj01.pgbSectionContactDetailID_flag = false;
    obj01.enableContactMessage = false;
    obj01.contactList = new List<AccountSearch.Wrapper_Contact>();
    obj01.searchAccount();
  }
   static testMethod void test_AccountSearch(){
    AccountSearch obj01 = new AccountSearch();
    obj01.AccountName = 'test data';
    obj01.Acnm = 'test data';
    obj01.listContactRecords = new List<Contact>();
    obj01.accountIDStr = 'test data';
    obj01.message = 'test data';
    obj01.Acid = new List<Account>();
    obj01.pgbSectionContactDetailID_flag = false;
    obj01.enableContactMessage = false;
    obj01.contactList = new List<AccountSearch.Wrapper_Contact>();
    AccountSearch.Wrapper_Contact obj121 = new AccountSearch.Wrapper_Contact(new Contact());
  }
}