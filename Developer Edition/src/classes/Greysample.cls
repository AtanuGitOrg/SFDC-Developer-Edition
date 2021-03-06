public class Greysample
{
    public String state {get;set;}
    public String city {get;set;}
    public Boolean bool {get;set;}
    
    public Greysample()
    {
        bool = false;
    }

    public List<SelectOption> getStates()
    {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('None','--- None ---'));        
        options.add(new SelectOption('TN','Tamil Nadu'));
        options.add(new SelectOption('KL','Kerala'));
        return options;
    } 
    
    public List<SelectOption> getCities()
    {
        List<SelectOption> options = new List<SelectOption>();
        if(state == 'TN')
        {       
            options.add(new SelectOption('CHE','Chennai'));
            options.add(new SelectOption('CBE','Coimbatore'));
            bool = true;
        }
        else if(state == 'KL')
        {       
            options.add(new SelectOption('COA','Coachin'));
            options.add(new SelectOption('MVL','Mavelikara'));
            bool = false;
        }
        else
        {
            options.add(new SelectOption('None','--- None ---'));
        }      
        return options;
    }       
}