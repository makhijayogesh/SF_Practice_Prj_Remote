public class Bucketing_Ac_Opp_HelperClass_V2 {

   /* public void afterDeleteRecords(List<Opportunity> newOpportunities,List<Opportunity> oldOpportunities,map<Id,list<Opportunity>> mapAccountWithOpportunity){
    
      
       for(Opportunity opp : oldOpportunities){
    
    //get method returns the value of map but as Map i.e. mapAccountWithOpportunity is empty 
      // initially therefore while passing Account ID , it will return null 
     
       
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
       set<Id> AccountIds=mapAccountWithOpportunity.keySet();
        System.debug('Account Ids against Opp. deleted -->'+AccountIds);
        List<Opportunity> List_Opp_rec;
        for(Id AccId : AccountIds){
            List_Opp_rec=mapAccountWithOpportunity.get(AccId);
            if(List_Opp_rec!=null && !List_Opp_rec.isEmpty()){
                for(Opportunity op_rec:List_Opp_rec){
                    if(op_rec.StageName!='Closed Won' && op_rec.StageName!='Closed Lost' ){
                        system.debug('Deleted Opp. Stage - Not Closed Won--> '+op_rec.StageName);
                        //Account Account_rec=[select Account_Status__c from Account where ID=:op_rec.AccountId limit 1];
                        Account Account_rec=new Account();
                        Account_rec.ID=op_rec.AccountId;
                        if(Account_rec!=null){
                            Account_rec.Account_Status__c='Closed';
                            update Account_rec; 
                            break;
                        }
                    }
                    else{
                system.debug('Deleted Opp. Stage - Closed Won--> '+op_rec.StageName);
                        Integer flag=0;
                        List<Opportunity> op_record=[select AccountID,StageName from Opportunity where AccountID=:op_rec.AccountId];
                        if(op_record!=null){
                            for(opportunity op:op_record){
                                if(op.StageName=='Closed Won' || op.StageName=='Closed Lost'){
                                    
                                    flag=0;
                                       
                                }
                                else{
                                    flag=1;
                                     
                                }
                               
                            }
                             if(flag==0){
                                 
                                //Account Account_rec=[select Account_Status__c from Account where ID=:op_rec.AccountId limit 1];
                                system.debug('Flag 0 --> '+op_rec.StageName);
                                 Account Account_rec=new Account();
                                 Account_rec.ID=op_rec.AccountId;
                                 if(Account_rec!=null){
                                    Account_rec.Account_Status__c='Open';
                                    update Account_rec; 
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
    
    } */
    
    public void afterDeleteRecords(List<Opportunity> newOpportunities,List<Opportunity> oldOpportunities,map<Id,list<Opportunity>> mapAccountWithOpportunity){
         Integer deletedOpp_Stage_Not_Closed=0;
         Integer deletedOpp_Stage_Closed=0;
         List<Opportunity> list_All_Opp=[select id from opportunity where AccountID=:oldOpportunities[0].AccountId];
         
         
      
        for(Opportunity opp : oldOpportunities){
    
            List<Opportunity> tempListOpp = mapAccountWithOpportunity.get(opp.AccountID);

            if(tempListOpp==null){
                tempListOpp = new List<Opportunity>();
                tempListOpp.add(opp);
            }
            else{
                // This will append an opportunity after previous opportunity
                 tempListOpp.add(opp);
            }
            mapAccountWithOpportunity.put(opp.AccountID,tempListOpp);
        }
       
        set<Id> AccountIds = mapAccountWithOpportunity.keySet();
        List<Account> list_temp_Account=new List<Account>();
        System.debug('Account Ids against Opp. deleted -->'+AccountIds);
        
        List<Opportunity> List_Opp_rec;
        
        for(Id AccId : AccountIds){
            
            List_Opp_rec = mapAccountWithOpportunity.get(AccId);
            
            if(List_Opp_rec != null && !List_Opp_rec.isEmpty()){
            
                for(Opportunity op_rec:List_Opp_rec){
                
                    if(op_rec.StageName != 'Closed Won' && op_rec.StageName != 'Closed Lost' ){
                    
                        system.debug('Deleted Opp. Stage - Not Closed Won--> '+op_rec.StageName);

                        deletedOpp_Stage_Not_Closed+=1;
                                                
                    }
                    else{
                    
                        system.debug('Deleted Opp. Stage - Closed Won--> '+op_rec.StageName);
                        deletedOpp_Stage_Closed+=1;
                    }
                }
                
            }
            
            if(List_Opp_rec != null && !List_Opp_rec.isEmpty()){
                Integer total_Deleted_Opp=deletedOpp_Stage_Not_Closed+deletedOpp_Stage_Closed;
                if(List_Opp_rec.size()==total_Deleted_Opp){
                   Account ac=new Account();
                   ac.Id=List_Opp_rec[0].AccountId;
                   ac.Account_Status__c='Open';
                   list_temp_Account.add(ac);
                }
            }
        }
        update list_temp_Account;
    }
    public void afterInsertRecords(List<Opportunity> newOpportunities,List<Opportunity> oldOpportunities){
    
    }
    
    public void afterUpdateRecords(List<Opportunity> newOpportunities,List<Opportunity> oldOpportunities){
    
    }
    
}