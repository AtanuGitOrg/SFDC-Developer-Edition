public class c2{
    List<Account> acts_direct = [select Name, Type, Industry, Phone, Fax from Account where Type ='Customer - Direct'];
    List<Account> acts_Channel = [select Name, Type, Industry, Phone, Fax from Account where Type ='Customer - Channel'];
    
    public List<Account> getacts_direct(){
    return acts_direct;
    }
    
    public List<Account> getacts_channel(){
    return acts_channel;
    }
}