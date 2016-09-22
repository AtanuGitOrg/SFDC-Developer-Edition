public with sharing class optransactionCls {

    public opportunity opMain{get;set;}
    public boolean blShowDet{get;set;}
    public boolean blShowEdit{get;set;}
    public optransactionCls(ApexPages.StandardController controller) 
    {
        string[] fields = new string[]{'Average_Transaction_Value__C','Average_Transaction_Volume__C','Average_Total_Transaction_Value__c'};
        controller.addFields(fields);
        opMain = (Opportunity) controller.getRecord();
        blShowDet = true;
        blShowEdit = false;
    }
    public boolean showPanel(string mode)
    {
        if(mode == 'Edit')
        {
            blShowDet = false;
            blShowEdit = true;
        }
        return blShowEdit;
        
       
    }
    public PageReference doSave()
    {
        PageReference pg = null;
        update opMain;
        pg = ApexPages.currentPage();
        pg.setRedirect(true);
        return pg;
        
    }
    
    public void doEdit()
    {
        showPanel('Edit');
    }   

}