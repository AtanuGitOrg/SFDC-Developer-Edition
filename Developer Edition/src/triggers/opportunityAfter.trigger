trigger opportunityAfter on Opportunity (after insert,after update,after delete) 
{
    //Variable
    public List<Opportunity> opMainList = new List<Opportunity>();
    public List<Opportunity> opHistoryList = new List<Opportunity>();
   
  // FOR INSERT
    if(trigger.IsInsert) // i.e. if the trigger is invoked while creating new record
    {
        
              
        
            for(Opportunity op:Trigger.New) 
            // Trigger.New -- environment variable 
            // representing collection of records you are cuurently trying to insert
            {
                //Filteration for trigger execution
                if(op.Type == 'New Customer')
                {
                   opMainList.add(op);
                }
                opHistoryList.add(op);        
            }
            
    }
    //FOR UPDATE
    if(trigger.IsUpdate) // Environment variable to identify the update operation
    {
        for(Opportunity op:Trigger.New) // Collection of New Set of Values which would be updated
        {
            for(Opportunity opOld: Trigger.Old) // Collection of Old Set of values which is to be updated
            {
                if((op.OwnerId != opOld.OwnerId) && (op.Type !=null) 
                && (op.Type == 'New Customer')) 
                {
                     opMainList.add(op);
                }
                else if((op.Type !=null) 
                && (op.Type == 'New Customer')) 
                {
                    opMainList.add(op);
                }
                opHistoryList.add(op);
                
            }
        
        }
    }
   
    
    
    
    //FINALLY CREATE OPPORTUNITY DATA
    //AND OPPORTUNITY HISTORY DATA
    if(!opMainList.isEmpty())
    {
      //  OpportunityTriggerCls.doCreateOpportunityData(opMainList);
    }
    
    if(!opHistoryList.isEmpty())
    {
     //   OpportunityTriggerCls.doCreateOpportunityHistory(opHistoryList);
    }
    
    
    
}