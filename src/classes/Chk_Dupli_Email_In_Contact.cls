/* This class is checking the duplicate Email on Contact while insertion. 
   The comparison of email will be with earlier inserted emails  
   This code is checking email for only one record insertion and NOT work while multi record insertion.
*/


public class Chk_Dupli_Email_In_Contact{
 public void Create_Contact(List<Contact> lst_Cont_Rec_Parameter){
    
    List<Contact> list_Contact_Records;
    
    string cont_Email;
    string cont_LastName;
    cont_Email=lst_Cont_Rec_Parameter[0].email;
    cont_LastName=lst_Cont_Rec_Parameter[0].lastname;
    
    list_Contact_Records=[select lastname,email from contact where email = :cont_Email];
    if(list_Contact_Records!=Null && !list_Contact_Records.isEmpty()) {
        for(contact con_rec:list_Contact_Records){
            if(cont_Email==con_rec.email){
               lst_Cont_Rec_Parameter[0].email.adderror('This email already exist');
                break;
            }
          }
    }
    else if(list_Contact_Records==Null && list_Contact_Records.isEmpty()){
            Contact cont_New_Record=new Contact(lastname=lst_Cont_Rec_Parameter[0].lastname,email=lst_Cont_Rec_Parameter[0].email);
            insert cont_New_Record;
    }
   }
  }