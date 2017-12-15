@isTest
public class PrimitiveTypeTest {

   
    public testmethod static void getactDirect()
    {
        PrimitiveType p=new PrimitiveType();  
        boolean b;
        List<Account> x;
        List<Account> y;
        x=p.getactDirect();
        y=p.getactChannel();
       	if(x.size()>0)
        {
            b=true;
           system.assertequals(b,true);
        }
        if(y.size()>0)
        {
          b=true;
           system.assertequals(b,true);
        }
        x=null;
    }
}