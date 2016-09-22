public class sample
{

    public PageReference search() {
        return null;
    }


    public String Account { get; set; }
  
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
        
   
}