public class SOQL_Using_Relationship_CLS {

 public list<employee__c> empl_Records{get;set;}
 public list<employee__c> empl_Records2{get;set;}
 public list<department__c> dept_Records{get;set;}
 public boolean pgbSection1{get;set;}
 public boolean pgbSection2{get;set;}
 public SOQL_Using_Relationship_CLS(){
    pgbSection1=false;
    pgbSection2=false;

 }
 
 
 public pageReference display_Employees(){
 
 /* Traverse from child to Parent object , Salesforce always have one parent object for a child object*/
 empl_Records=new list<employee__c>([select id,name,Department_Master__c,Department_Master__r.name from employee__c]);
     if(empl_Records!=null){
          pgbSection1=true;
          pgbSection2=false;
      }
 return null;
 
 }

    public pageReference display_Departments(){
    
     /* Traverse from parent to child object , Salesforce parent object can have multiple child object*/
    
         dept_Records=new list<department__c>([select id,name,(select id,name from employees__r) from department__c]);

         if(dept_Records!=null){
             empl_Records2 = dept_Records[0].employees__r;
          pgbSection2=true;
           pgbSection1=false;
        }
       return null;
 
 }

}