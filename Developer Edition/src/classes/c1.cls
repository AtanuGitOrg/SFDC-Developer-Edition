public class c1{
    String hello ='Hello Atanu, CONGRATULATION!, You have created a NEW Class';
    List<Account> acts = [select Name, Type, Industry, Phone from Account where Industry='Energy'];
    
    public String gethello(){
    return hello;
    }
    
    public List<Account> getacts(){
    return acts;
    }    
}