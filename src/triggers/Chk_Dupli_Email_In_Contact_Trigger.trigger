trigger Chk_Dupli_Email_In_Contact_Trigger on Contact (Before Insert,Before Update) {
    if(Trigger.IsInsert){
        If(Trigger.Isbefore){
            Chk_Dupli_Email_In_Contact_v2 cls_Obj=new Chk_Dupli_Email_In_Contact_v2();
            cls_Obj.Create_Contact(Trigger.new);
        }
    }
}