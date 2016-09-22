public class trigger_example{
        
    public static void Opps_check(Opportunity[] Ops){
        Double total_amount = 0;
        String this_user = UserInfo.getUserID();
    for(Opportunity o1:[select Amount from Opportunity where CloseDate = TODAY AND Amount != null AND createdBYID =:this_user]){
            total_amount += o1.Amount;
    }
    
    for(Opportunity o2:ops){
        total_amount += o2.Amount;
        if(total_Amount > 1000000){
            o2.AddError('You have already exceede your daily limit for Amount');
        }
    }                   
}
}