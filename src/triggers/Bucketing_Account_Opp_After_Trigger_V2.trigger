trigger Bucketing_Account_Opp_After_Trigger_V2 on Opportunity (After insert,After Update,After Delete) {

    Bucketing_Ac_Opp_EventHandlerClass_V2 Bucketing_EventHandlerClass_Obj;
    map<Id,list<Opportunity>> mapAccountWithOpportunity = new map<Id,list<Opportunity>>();

    if(Trigger.isDelete){
    
        Bucketing_EventHandlerClass_Obj = new Bucketing_Ac_Opp_EventHandlerClass_V2();
        Bucketing_EventHandlerClass_Obj.afterDelete(Trigger.new,Trigger.Old,mapAccountWithOpportunity ); 
    }
}