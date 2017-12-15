public class Map_Understandingcls{

    public List<Account> listAccRecord;
    public List<Account> maplistAccRecord{get;set;}
    map<id,account> mapAccountRecord;

    
    public PageReference DisplayAccountRecords(){
    
    listAccRecord=new List<Account>([select id,name,phone,site from Account limit 10]);
    mapAccountRecord=new map<id,account>();
    maplistAccRecord=new List<Account>();
    if(listAccRecord!=null && !listAccRecord.isEmpty()){
        for (Account accRec:listAccRecord){
                mapAccountRecord.put(accRec.ID,accRec);
            }
        for (Account accRecID:listAccRecord){
                Account accRecord=(mapAccountRecord.get(accRecID.ID));
                maplistAccRecord.add(accRecord);
            }
       }
     return null;    
   }
    
}