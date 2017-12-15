global class AccountService{

    webservice static string CreateCustomer(String Name,String Phone,String City)
    {
        Account ObjA=new Account();
        ObjA.name=Name;
        ObjA.phone=phone;
        ObjA.BillingCity=city;
        
        Insert ObjA;
        
        if(ObjA.ID !=Null)
            return 'Success';
        else
            return 'Failure';
        
    }


}