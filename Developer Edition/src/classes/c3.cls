public class c3{
    List<Account> acts;
    
    public List<Account> getacts(){
        return acts;
    }
    
    public PageReference direct(){
    acts = [select Name, Type, Industry, Phone, Fax from Account where Type ='Customer - Direct'];
    return null;
    }
    
    public PageReference channel(){
    acts = [select Name, Type, Industry, Phone, Fax from Account where Type ='Customer - Channel'];
    return null;
    }

}