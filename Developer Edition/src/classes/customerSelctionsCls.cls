public with sharing class customerSelctionsCls 
{
    public Lead myLead{get;set;}
    
    public customerSelctionsCls(ApexPages.StandardController controller) 
    {
        //Add specific field to the controller.
        string[] fieldLists = new string[]{'Buyer__c','Seller__C'};
        controller.addFields(fieldLists);
        
        //Get the reference for single Lead Records fetched via 
        //Salesforc Object mentioned as visual force page standard controller
           
        myLead = (Lead) controller.getRecord(); 
        
        
    }
    
    public boolean editSection {get;set;}
    
    public PageReference doEdit()
    {
      editSection=true;
      return null;
    
    }
    

    //Save the selections
    public PageReference doSave()
    {
       PageReference pg = null;
       update myLead;
       pg= ApexPages.currentPage();
       pg.setRedirect(true);
       return pg;
        
    }

}