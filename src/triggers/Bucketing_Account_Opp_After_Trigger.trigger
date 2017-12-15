trigger Bucketing_Account_Opp_After_Trigger on Opportunity (After insert,After Update) {

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
    
    if(Trigger.isInsert || Trigger.IsUpdate){
        set<Id> AccountIds=mapAccountWithOpportunity.keySet();
        List<Opportunity> List_Opp_rec;
        for(Id AccId : AccountIds){
            List_Opp_rec=mapAccountWithOpportunity.get(AccId);
            if(List_Opp_rec!=null && !List_Opp_rec.isEmpty()){
                for(Opportunity op_rec:List_Opp_rec){
                    if(op_rec.StageName!='Closed Won' && op_rec.StageName!='Closed Lost' ){
                        
                        //Account Account_rec=[select Account_Status__c from Account where ID=:op_rec.AccountId limit 1];
                        Account Account_rec=new Account();
                        Account_rec.ID=op_rec.AccountId;
                        if(Account_rec!=null){
                            
                            Account_rec.Account_Status__c='Open';
                            update Account_rec; 
                            break;
                        }
                    }
                    else{
                    System.debug('In else block');
                        Integer flag=0;
                        List<Opportunity> op_record=[select AccountID,StageName from Opportunity where AccountID=:op_rec.AccountId];
                        if(op_record!=null){
                            for(opportunity op:op_record){
                                if(op.StageName=='Closed Won' || op.StageName=='Closed Lost'){
                                    
                                    flag=0;
                                     System.debug('Flag Closed Won --'+flag);    
                                }
                                else{
                                    flag=1;
                                     System.debug('Flag No --'+flag);  
                                }
                               
                            }
                             if(flag==0){
                                //Account Account_rec=[select Account_Status__c from Account where ID=:op_rec.AccountId limit 1];
                                
                                 Account Account_rec=new Account();
                                 Account_rec.ID=op_rec.AccountId;
                                 if(Account_rec!=null){
                                    Account_rec.Account_Status__c='Closed';
                                    update Account_rec; 
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}