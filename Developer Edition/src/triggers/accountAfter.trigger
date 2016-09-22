trigger accountAfter on Account (after insert,after update) 
{
    List<account> acMainList = new List<account>();
    List<account> acUpdateList = new List<Account>();
    // INSERT BLOCK
    if(trigger.isInsert) // Trigger.IsInsert is used to mark that trigger code block 
                         // would be executed only when we are inserting new record
    {
       for(Account ac:trigger.new) // Trigger.New - basically represents the 
                                   // collection  of current record or current records
                                   // which is being inserted.
       {
        //IF Active then update 
        //update the date

        if(ac.Active__c == 'Yes')
        {
           acMainList.add(ac); 
           
        }
        if(ac.Newly_created__c == 'Y')
        {
          acUpdateList.add(ac);
        }

       }
    
    }   

    // UPDATE BLOCK
    if(trigger.isUpdate) // Same as above, but to mark the scenario when we are
                         // updating the existing record
    {
        
       for(Account ac:trigger.new) // Get the new records collection 
                                   // which are replacing old records value
       {

          for(Account aco: trigger.old) // get the collection of old records
                                        // which are being updated
          {

                    //check whether new data is different from old data
                    //and new data is not blank or null
                    //new data value is Yes
                    if(ac.Active__C != aco.Active__c && ac.active__c !=null 
                    && ac.active__c == 'Yes')
                    {
                        acMainList.add(ac);
                    }               
          }           
     }
    
    
    
    }
    //Do send the actual account list for creating the Opportunity Record
    if(acMainList.size() > 0)
    {
        AccountTrigger.doCreateOpportunity(acMainList);
    }
    
    // Create the Account Information
    if(acUpdateList.size() > 0)
    {
        AccountTrigger.doCreateAccountInformation(acUpdateList);
    }
  }