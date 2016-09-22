trigger AfterTriggerOppRenewal on Opportunity (after insert, after update, after delete)
{
    public static List<Opportunity> oppListWithUpdatedType = new List<Opportunity>();
    
    if(Trigger.IsAfter && Trigger.IsInsert)
    {
        //If an opportunity record has just been created/inserted in the DB, then an associated OpportunityHistoryRecord should be created/inserted. 
        //So, we just pass the newly created opportunity record list to an apex class's method that takes care of insertion of new OpportunityHistory records.
        // The newly created Opportunity records are present in Trigger.New, so we pass this list as an argument to the associated Apex class' method that inserts OpportunityHistory records.
        if(Trigger.New.size() > 0)
        {
      //      TriggerClsToUpsertOpportunityHistory.doInsertOpportunityHistory(Trigger.New);
        }
        
    }// End of check on After Trigger's After Insert event on Opportunity Object.  
    
    if(Trigger.IsAfter && Trigger.IsUpdate)
    {
        //Only if the Opportunity object's value of the field, OopportunityType is updated, then only we need to update the OpportunityHistory object's OpportunityType.
        //Compare old records of Opportunity that are already existing in the DB with new records of Opportunity that are updated, in order to check if an update has indeed occurred or not.
        
        if(Trigger.New.size() > 0)
        {
            for(Opportunity oppNew: Trigger.New)
            {
                //Fetch the old Opportunity record corresponding to the Id of the claimed updated Opportunity Record.
                Opportunity oppOld = Trigger.OldMap.get(oppNew.Id);
            
                //Check if the old Opportunity record's value of the field, OpportunityType is same as New Opportunity Record's value of the field OpportunityType
                // If they are not the same, then it implies an UPDATE of the field has occurred
                // Therefore, corresponding OpportunityHistory record of the updated Opportunity record needs to be updated too.
                if(oppOld.Type != oppNew.Type)
                {
                    /*If there was an update on the OpportunityType field value of Opportunity record,
                      then add that newly updated Opportunity record to
                      the list of Opportunity records that have their OpportunityType field updated.
                      This list shall then be passed over to an Apex class' method, 
                      in order to perform the update on the corresponding OpportunityHistory object's record's 'Type' field.
                    */
                    oppListWithUpdatedType.add(oppNew);               
                    
                }
        
            }// end of for loop
        }// End of Size check on Trigger.New
        
        //Null Check on the list of Opportunity records that have updated values of the field, OppotunityType.
        if(oppListWithUpdatedType.size() > 0)
        {
        //    TriggerClsToUpsertOpportunityHistory.doUpdateOpportunityHistory(oppListWithUpdatedType);            
        }//end of null check on updatedOppList
        
    }//end of check on After Trigger's After Update event  
      
  
}// End of check on After Trigger's After Update event on Opportunity Object.