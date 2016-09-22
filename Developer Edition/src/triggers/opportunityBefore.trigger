trigger opportunityBefore on Opportunity (before insert,before update,before Delete) 
{
    //Variable
    public List<Opportunity> opMainList = new List<Opportunity>();
    //Get the Id for User whose name is Madhabi Kotha
        List<User> usList = new List<User>();
    //End
  // FOR INSERT
    if(trigger.IsInsert) // i.e. if the trigger is invoked while creating new record
    {
        
        usList = [SELECT ID FROM USER WHERE NAME='Madhavi Kotha' Limit 1];
        
        if(!usList.isEmpty()) // Null checking to validate whether this user is existed or Not
        {
            for(Opportunity op:Trigger.New) 
            // Trigger.New -- environment variable 
            // representing collection of records you are cuurently trying to insert
            {
                //New Requirement - Validation Check to be done before inserting new Opportunity record that's being created.
                System.Debug('Close Date:' + op.CloseDate);
                System.Debug('Created Date:' + op.CreatedDate);
                
                if(op.CloseDate > System.Today())
                {
                
                    //Filteration for trigger execution
                    if(op.Type == 'New Customer')
                    {
                      op.OwnerId = usList[0].Id; // Update the Ownership of Opportunity
                    }    
                } 
                
                   
            }
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
                     op.OwnerId = usList[0].Id;
                     opMainList.add(op);
                     System.Debug('Main List:' + ' ' + opMainList.Size());
                }
                
                else
                {
                    if(op.Type !=null && op.Type !='New Customer')
                    {
                        // userInfo.getUserId() --> basically returns the name of the current logged in 
                        //user
                        if(op.OwnerId != null)
                        {
                            if(op.OwnerId != userInfo.getUserId())
                            {
                                op.OwnerId = userInfo.getUserId();
                            }
                        }
                        
                    }
                }
            }
        
        }
        if(trigger.IsDelete)
        {
            for(Opportunity op:Trigger.Old)
            {
                opMainList.add(op);
            }
        }
        
        //Finally create the history for the Opportunity
        if(!opMainList.isEmpty())
        {
           // OpportunityTriggerCls.doCreateOpportunityHistory(opMainList);
        }
        
    
    
    }
 }