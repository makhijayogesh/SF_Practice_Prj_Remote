public class MyController {

    Account account;
    PageReference pageRef;

    public PageReference save() {
        update account;
        pageRef = new PageReference('http://www.google.com');
        pageRef.setRedirect(true);
        return pageRef;
    }

    public String getName() {
        return 'MyController';
    }

    public Account getAccount() {
        if(account == null) 
            account = [select id, name, site from Account 
                       where id = :ApexPages.currentPage().getParameters().get('id')];
        return account; 
    } 
}