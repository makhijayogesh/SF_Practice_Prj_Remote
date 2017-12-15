public class Trigger_Class {
 public static void check_opp(List<opportunity> ops)
 {
     double total_amount=0;
     for(opportunity opt1:[select amount from opportunity where createdbyID=:userInfo.getUserId()])
     {
         total_amount += opt1.amount;
         
     }
     for(opportunity opt2:ops)
     {
         total_amount += opt2.amount;
         if(total_amount > 10000000)
         {
             opt2.adderror('You have exceeded limit of Opp. amount');
         }
     }
 }
}