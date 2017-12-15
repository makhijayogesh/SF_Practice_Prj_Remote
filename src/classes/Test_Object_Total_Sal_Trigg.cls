public class Test_Object_Total_Sal_Trigg
{ 
    public static void calculate_sal(Test_Object__c[] Test_Sal)
    {
       double y=0;
       List<Test_Object__c> tot_sal=[SELECT Employee_Salary__c FROM Test_Object__c];

       for(Test_Object__c a:tot_sal)
          y+=a.Employee_Salary__c;
          
       for(Test_Object__c b:Test_Sal)
       {
          y+=b.Employee_Salary__c;
       if(y>60000)
         b.adderror('Total salary can not be more then 80000');
        }
    }
    
}