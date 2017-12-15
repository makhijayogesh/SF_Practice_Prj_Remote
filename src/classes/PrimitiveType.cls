public class PrimitiveType {
 	public string s='getting primitive type value';
   	Account a=new Account(name='Yogesh',Site='Pune');
    List<Account> x;
    List<Account> actChannel;
  /*  public string gets()
    {
        return s;
    }
    public Account geta()
    {
        return a;
    } */
    public List<Account> getactDirect()
    {
        x=[select name,site,phone,type from account where type='Customer - Direct'];
        return x;
    }
     public List<Account> getactChannel()
    {
        x=[select name,site,phone,type from account where type='Customer - Channel'];
        return x;
    }
}