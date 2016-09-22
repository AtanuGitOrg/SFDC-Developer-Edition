public with sharing class OpportunityDataCls
{

    public OpportunityDataCls(ApexPages.StandardController controller) {

    }

  /*  //variable 
    public Opportunity odata {get;set;}
    public List<OpportunityData__c> opData = new List<OpportunityData__c>();
    public OpportunityData__c odt{get;set;}
    public OpportunityData__c odtNew {get;set;}
    public boolean blShowDet{get;set;}
    public boolean blShowEdit{get;set;}                       
    public boolean blShowAdd{get;set;}
           
    //end
    public OpportunityDataCls(ApexPages.StandardController controller)
    {
        odata = (Opportunity)controller.getRecord();
        System.Debug('Main Id:' + ' ' + odata.Id);
        blShowDet = true;
        blShowEdit = false;
        blShowAdd = false;
    }
    //Populate List of Opportunity Data
    public List<OpportunityData__c> getAllOpportunityData()
    {
        opData.clear();
        opData = [SELECT AccountassociatedOn__c ,OPPORTUNITY__c,Opportunity_Owner__C FROM OpportunityData__c
        WHERE OPPORTUNITY__c =:odata.Id ];
        
        System.Debug('OP DATA:' + ' ' + opData);
        if(opData.size() > 0)
        {
            for(OpportunityData__c opdt:opData)
            {
                odt = new OpportunityData__c();
                odt = opdt;
                
            }
            
        }
        odtNew = new OpportunityData__c();
        odtNew.AccountassociatedOn__c = null;
        odtNew.Opportunity__c = odata.Id;
            
        return opData;
        
    }
    //Add new input row
    public void doAdd()
    {
        blShowEdit = false;
        blShowAdd = true;
    }
     //Edit input row
    public void doEdit()
    {
        blShowEdit = true;
        blShowAdd = false;
    }
    //Save the record
    public pageReference doSave()
    {
        if(blShowAdd == true) // If new record
        {
            insert odtNew;
        }
        PageReference pg = ApexPages.currentPage();
        pg.setRedirect(true);
        return pg;
    }*/

}