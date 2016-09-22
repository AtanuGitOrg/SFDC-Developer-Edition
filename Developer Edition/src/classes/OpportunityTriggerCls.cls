/*
    Author: Atanu
    Date of Creation: 01/2/2014
    Description: Business Logic class for Opportunity Trigger
    
    Modification History:
    *********************
    1.
    2.
    3.
    
    *****************

*/
public class OpportunityTriggerCls
{
 /*   //variable declaration section
    public static List<CHECKING__OpportunityData__c> opDataList =
    new List<OpportunityData__c>(); //collection of Opportunity Data
    
    
    //end
    //Utility method for creating Opportunity Data Object Record
    public static void doCreateOpportunityData(List<Opportunity> currentList)
    {
        //null checking
        if(!currentList.isEmpty())
        {
            for(Opportunity op:currentList)
            {
                //Create instance of Opportunity Data Object
                OpportunityData__c opData = new CHECKING__OpportunityData__c();
                opData.CHECKING__Opportunity__c = op.Id;
                opData.CHECKING__Opportunity_Owner__c = op.OwnerId;
                //populating the collection of all records
                opDataList.add(opData);
                
            }
            //Finally create all records
            //as a complete batch
            if(!opDataList.isEmpty())
            {
                insert opDataList; // DML Operation
            }
        }
    }
    public static void doCreateOpportunityHistory(list<Opportunity> opMainList)
    {
        List<CHECKING__OpportunityHistory__C> opHistList = new List<CHECKING__OpportunityHistory__C>();
        System.Debug('Total Size of Opportunity:' + ' ' + opMainList.size());
         //null checking
        if(!opMainList.isEmpty())
        {
            for(Opportunity op:opMainList)
            {
                //Create instance of Opportunity Data Object
                CHECKING__OpportunityHistory__c opData = new CHECKING__OpportunityHistory__c();
                opData.CHECKING__Opportunity__c = op.Id;
                opData.CHECKING__Deleted__c = op.IsDeleted;
                //populating the collection of all records
                opHistList.add(opData);
                
            }
            System.Debug('History Data:' + ' ' + opHistList.size());
            //Finally create all records
            //as a complete batch
            if(!opHistList.isEmpty())
            {
                insert opHistList ; // DML Operation
            }
        }    
    
    }*/

}