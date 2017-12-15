trigger Bucketing_Account_Opp on Opportunity (before insert) {

    map<Id,list<Opportunity>> mapAccountWithOpportunity = new map<Id,list<Opportunity>>();
    // Trigger.new is a list and here in below loop , this will return list of opportunities
    for(Opportunity opp : Trigger.new){
    
    /* get method returns the value of map but as Map i.e. mapAccountWithOpportunity is empty 
       initially therefore while passing Account ID , it will return null */
     
       
        List<Opportunity> tempListOpp=mapAccountWithOpportunity.get(opp.AccountID);

        if(tempListOpp==null){
            tempListOpp=new List<Opportunity>();
            tempListOpp.add(opp);
        }
        else{
            // This will append an opportunity after previous opportunity
             tempListOpp.add(opp);
        }
        mapAccountWithOpportunity.put(opp.AccountID,tempListOpp);
    }
}