public class Bucketing_Ac_Opp_EventHandlerClass_V2 {

    Bucketing_Ac_Opp_HelperClass_V2 HelperClass_Obj;
    
    public void Bucketing_Ac_Opp_EventHandlerClass_V2(){
        
    }
    
    public void afterInsert(List<Opportunity> newOpportunities,List<Opportunity> oldOpportunities){
    
        HelperClass_Obj=new  Bucketing_Ac_Opp_HelperClass_V2();
        HelperClass_Obj.afterInsertRecords(newOpportunities,oldOpportunities);   
    
    }
    
    public void afterUpdate(List<Opportunity> newOpportunities,List<Opportunity> oldOpportunities){
    
        HelperClass_Obj=new  Bucketing_Ac_Opp_HelperClass_V2();
        HelperClass_Obj.afterUpdateRecords(newOpportunities,oldOpportunities);   
    }
    
    public void afterDelete(List<Opportunity> newOpportunities,List<Opportunity> oldOpportunities,map<Id,list<Opportunity>> mapAccountWithOpportunity){
    
        HelperClass_Obj=new  Bucketing_Ac_Opp_HelperClass_V2();
        HelperClass_Obj.afterDeleteRecords(newOpportunities,oldOpportunities,mapAccountWithOpportunity);
    }   
}