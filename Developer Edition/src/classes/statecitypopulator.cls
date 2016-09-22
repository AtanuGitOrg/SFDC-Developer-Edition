public class statecitypopulator 
{

    public String citySelectList { get; set; }

    public String stateSelectList { get; set; }

    public PageReference doPopulate() {
        return null;
    }


    public String stateSelect { get; set; }
  /*  // Variables to store state and city selected by user
    public String stateSelect { get; set; }
    public String city {get; set;}   
    public string selectedCity{get;set;}
    

    // Generates state dropdown from state settings
    public List<SelectOption> getStateSelectList() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('', '-- Select One --'));        

        // Find all the states  in the custom setting
        Map<String, StateMaster__c> states = StateMaster__c.getAll();
        
        // Sort them by name
        List<String> statenames= new List<String>();
        statenames.addAll(states.keySet());
        statenames.sort();
        
        // Create the Select Options.
        for (String stateName: statenames) {
            StateMaster__c state = states.get(stateName);
            options.add(new SelectOption(state.State_name__c, state.State_Name__C));
        }
        return options;
    }

   public void doPopulate()
   {
      
          getCitySelectList(); 
      
   } 

   // To generate the city picklist based on the state selected by user.
    public List<SelectOption> getCitySelectList() {
        List<SelectOption> options = new List<SelectOption>();
        
        // Find all the cities we have in custom settings.
        Map<String, StateCityRecord__c> allstates = StateCityRecord__c.getAll();
        System.Debug('Selected State:' + ' ' + ApexPages.currentPage().getParameters().get('keyVal'));
        
        // Filter city that belong to the selected state
        Map<String, StateCityRecord__c> states = new Map<String, StateCityRecord__c>();
        for(StateCityRecord__c state : allstates.values()) {
            if (state.state_name__c == this.stateSelect) {
                states.put(state.name, state);
            }
        }
        
        // Sort the states based on their names
        List<String> stateNames = new List<String>();
        stateNames.addAll(states.keySet());
        stateNames.sort();
        
        // Generate the Select Options based on the final sorted list
        for (String stateName : stateNames) {
            StateCityRecord__c state = states.get(stateName);
            options.add(new SelectOption(state.city_name__c, state.city_name__c));
        }
        
        // If no cities are found, just say not required in the dropdown.
        if (options.size() > 0) {
            options.add(0, new SelectOption('', '-- Select One --'));
        } else {
            options.add(new SelectOption('', '-- Not Required --'));
        }
        return options;
    }
*/
}