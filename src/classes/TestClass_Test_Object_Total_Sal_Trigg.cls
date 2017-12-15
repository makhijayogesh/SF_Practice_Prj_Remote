@isTest
public class TestClass_Test_Object_Total_Sal_Trigg
{
    public testmethod static void test_calculate_sal()
    {
      Test_Object__c obj=new Test_Object__c(Employee_Salary__c=3000);
      // Before executing of Trigger and Class , New salary
      System.debug('Employee ID='+obj.Employee_ID__c);
      // Accessing Trigger Class and Trigger on Total Salary
      insert obj;
      //Test_Object_Total_Sal_Trigg.calculate_sal(obj);
      // Before executing of Trigger and Class , New salary
      System.debug('Employee ID='+obj.Employee_ID__c);    
      System.assertequals(3000,obj.Employee_Salary__c);
      
    }    
    
 }