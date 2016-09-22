public class c4{

    public String Name { get; set; }

    Account Accts;

    public String Account { get; set; }
    String search_string;
    List<Account> acts;
    Public string pickval{ get; set;}
    
    public List<Account> getacts(){
    return acts;
    }
    
    public String getsearch_string(){
    return search_string;
    }
    
    public void setsearch_string(string str){
    search_string = str;
    }
    
    public List<SelectOption> getanswers() 
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('','--None--'));
        
        for(Account s:[SELECT Name FROM Account LIMIT 10])
        {
            options.add(new SelectOption(s.Name,s.Name));
        }        
        return options;
    }
    
    public PageReference search_now(){
    
    acts = (List<Account>)[Select Name,Type,Industry from Account where Name=:Apexpages.currentpage().getparameters().get('pick')];
    return null;
   
    }
}