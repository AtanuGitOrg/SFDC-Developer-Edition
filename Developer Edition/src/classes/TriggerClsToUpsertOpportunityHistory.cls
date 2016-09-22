/*
    Author: Atanu Shaw
    Date of Creation: 04/09/2013
    Description: Business Logic class for Opportunity Trigger - where DML operations need to be performed on OpportunityHistory object.
    
    
    Modification History:
    *********************
    1.Modified by Amitava on 13.04.2013
    2.
    3.
    
    *****************

*/

public class TriggerClsToUpsertOpportunityHistory
{
 /*       
    public static void doInsertOpportunityHistory(List<Opportunity> OpportunityList)
    {
        //Create a List Container for containing the list of all OpportunityHistory records that need to be inserted.
        List<OpportunityHistory__c> oppHistToBeInsertedList = new List<OpportunityHistory__c>();
                
        //For every newly created Opportunity record, an associated OpportunityHistory record must be created.
        OpportunityHistory__c oppHistToBeInsertedRecord = new OpportunityHistory__c();
        
        for(Opportunity opp: OpportunityList)
        {
           
           //Setting values to the fields of the yet to be inserted OpportunityHistory record
           oppHistToBeInsertedRecord.Opportunity__c = opp.Id; //Lookup field setting
           oppHistToBeInsertedRecord.OwnerId = opp.OwnerId;
           //oppHist.OpportunityCreationDate__c = System.CurrentDate();
           
           //Filteration check: If Opportunity record's type is renewal then its corresponding OpportunityHistory record's type must also be updated to renewal
           if(opp.Type == 'Renewal')
           {
                oppHistToBeInsertedRecord.OpportunityType__c = opp.Type;
           }      
           else
           {
                oppHistToBeInsertedRecord.OpportunityType__c = ' ';   
           }
           
           
           //Add the newly created oppHist record to the list of yet to be inserted OpportunityHistory records.
           oppHistToBeInsertedList.add(oppHistToBeInsertedRecord);
           
         }// end of For Loop
        
        
          //Perform INSERT DML operation on the Opportunity History object's recordList.
          //One DML call for INSERTING to entire list.
          insert oppHistToBeInsertedList;

      }// End of doInsertOpportunityHistory method
      
      //Method to perform UPDATE on OpportunityHistory object
      public static void doUpdateOpportunityHistory(List<Opportunity> oppListWithUpdatedType)
      {
          //Create a temporary List Container for containing the list of all OpportunityHistory records that are used for filtering.
          List<OpportunityHistory__c> oppHistList = new List<OpportunityHistory__c>();
          
          //Create a List Container for containing the list of all OpportunityHistory records that need to be updated.
          List<OpportunityHistory__c> oppHistToBeUpdatedList = new List<OpportunityHistory__c>();
          
          Map<Id,String> oppTypeIdMap = new Map<Id,String>() ;// ADDED BY AMIT 13.04.2013
                 
          //NULL CHECK on oppListWithUpdatedType list
          if(!oppListWithUpdatedType.IsEmpty())
          {
              for(Opportunity oppUpdated:oppListWithUpdatedType)
              {
                  /* Populate the collection of ID AND TYPE FOR ALL OPPORTUNITIES
                     WHERE TYPE IS RENEWAL AS UPDATED TYPE
                  */ 
                  //   oppTypeIdMap.put(oppUpdated.Id,oppUpdated.Type);
                  
             }//End of For Loop on Updated Opportunity records.*/
              
       //    }//End of Null check.*/

           
/*
           oppHistList = [SELECT Id, OpportunityType__c, Opportunity__r.Id, Opportunity__r.Type
                                            FROM OpportunityHistory__c
                                            WHERE Opportunity__c IN :oppTypeIdMap.keySet()];
                 
          if(!oppHistList.IsEmpty())
          {
              for(OpportunityHistory__c oppHistToBeUpdatedRec: oppHistList)
              {
              
                  //FILTRATION CHECK
                  if(oppHistToBeUpdatedRec.OpportunityType__c == 'Renewal')
                  {
                     if(oppTypeIdMap.get(oppHistToBeUpdatedRec.OpportunityType__c) != 'Renewal')
                     {
                          oppHistToBeUpdatedRec.put('OpportunityType__c', '');
                     }
                      
                  }//End of check on Renewal Type OppHist records that need to be updated.
                  else
                  {
                     if(oppTypeIdMap.get(oppHistToBeUpdatedRec.OpportunityType__c) == 'Renewal')
                     {
                          oppHistToBeUpdatedRec.put('OpportunityType__c', 'Renewal');
                     }
                     else
                     {
                         oppHistToBeUpdatedRec.put('OpportunityType__c', '');
                     }
                  }
                 
                  //Add the yet to be Updated Opportunity History record to the List of OppHist records that need to be updated.
                  oppHistToBeUpdatedList.add(oppHistToBeUpdatedRec);
                  
              }//End of for loop on oppHistList
              
              
           }//End of oppHistList size check
          
          //UPDATE THE List of Opportunity Records with updated values of the field corresponding to OpportunityType.
          update oppHistToBeUpdatedList;
              
          
      }//End of Update Method
        */
 //}// End of Class