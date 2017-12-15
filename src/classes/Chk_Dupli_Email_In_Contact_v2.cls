/* This class is checking the duplicate Email on Contact while insertion. 
   The comparison of email will be with earlier inserted emails  
   This code is checking email for bulk inserted records and on GUI with single records also , however the comparison will work if any email is already is existing in Salesforce
*/

public class Chk_Dupli_Email_In_Contact_v2{
 public void Create_Contact(List<Contact> lst_Cont_Rec_Parameter){
    
    List<Contact> list_Contact_Records;
    list<string> duplicate_record_Log=new list<string>();
           
    list_Contact_Records=[select email from contact];
    if(list_Contact_Records!=Null && !list_Contact_Records.isEmpty()) {
        for(contact con_rec:list_Contact_Records){
            for(contact con_Rec_Param:lst_Cont_Rec_Parameter){
                  if(con_rec.email==con_Rec_Param.email){
                      con_Rec_Param.email.adderror('This email already exist');
                      duplicate_record_Log.add(con_Rec_Param.lastname+' '+con_Rec_Param.email);
                    }
                }
              }
              System.debug('Duplicate Records-->'+duplicate_record_Log);
        }

   }
 
  public void check_InFlight_Duplicate_Before_Insert(List<Contact> lst_Cont_Rec_Parameter){
             
         }
  }