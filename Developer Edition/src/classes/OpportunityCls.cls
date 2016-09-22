/*
     Author: Atanu Shaw
     Description: 
         1. Create a custom Controller Extension class called OpportunityCls to associate it with a VF page
         2. The custom VF page displays Opportunity Revenue Amount Details
         3. The OpportunityCls class needs to be shared only with certain profiles, security constraint exists, hence public with sharing class.
     Date: Feb 25, 2014
*/


public with sharing class OpportunityCls
{
    public boolean ShowDetailPage{get;set;}
    public boolean ShowEditPage{get;set;}
    public Opportunity objOpp{get;set;}
    
    //Constructor for the OpportunityCls Class
    public OpportunityCls(ApexPages.StandardController controller)
    {
        ShowDetailPage = true;
        ShowEditPage = false;
        //To access the custom fields of an Opportunity record
        
        //Create a custom field list, containing all the fields you want to be shown on your VF Page.
        String[] oppCustomFieldList = new String[]{'CHECKING__Probable_Revenue_Amount__c','CHECKING__Actual_Revenue_Amount__c','CHECKING__Revenue_Amount_Difference__c'};
        
        //Add the custom field list to your standard controller reference variable
        controller.addFields(oppCustomFieldList);
        
        /*Retrieve an opportunity record with the custom fields in it, 
          from the standard controller (collection) class' reference, namely, controller
          and initialize the Opportunity instance (objOpp) with the record containing the custom fields
        */
        //Type casting: controller needs to be of type Opportunity so as to have objOpp initialized with the returning opportunity record
        objOpp = (Opportunity) controller.getrecord();
        
    }
    
    //Navigation Methods - treated as Utility methods
    
    public void doShowEdit()
    {
        ShowEditPage = true;
        ShowDetailPage = false;
    }
    
    public void doShowDetails()
    {
        ShowDetailPage = true;
        ShowEditPage = false;
    }
    
    /*Pre Binding: 
      Input field values entered by user from the UI, via the VF page
      need to be bound to the respective custom fields on the Opportunity Object
    */
    
    // doSave method explains the behavior that is expected when the SAVE button from VF page is clicked
    public PageReference doSave()
    {
        //Perform the DML operation of 'UPDATE'
        //update the respective custom fields of Opportunity object with the user entered values from the VF page.
        update objOpp;
        
        /* The following three lines of code will result in entire opportunity details or view page
           to be populated within the custom visual force page.
           
          PageReference pg = null;
          pg = new PageReference('/' + objOpp.Id);
          pg.setRedirect(true);
          
        */
        
        /*The line below will result in a new or fresh page containing the opportunity details page i.e. view page,
          along with custom visual force page showing only detail section with updated values displayed.
        */
        return new PageReference('/' + objOpp.Id);
                
    } 
} // end of the class