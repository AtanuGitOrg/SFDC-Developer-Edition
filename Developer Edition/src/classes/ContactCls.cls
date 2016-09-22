/*
    Author:Atanu Shaw
    Description: Controller class for creating the visual force page
    Date: 23/02/2014

*/

public with sharing class ContactCls 
{

    public ContactCls(ApexPages.StandardController controller) {

    }

  /*  //Variable section
    public boolean blShowEdit{get;set;}
    public boolean blShowDet {get;set;}
    public boolean blShowAdd {get;set;}
    //public boolean blShowDet{get;set;}
    public Contact objCon{get;set;}
    public Contact objConNew{get;set;}
    //End

    //Constructor
    public ContactCls(ApexPages.StandardController controller) 
    {
        blShowEdit = false;
        blShowAdd = false;
        setblShowDet(true);
        string[] fieldList = new String[]{'CHECKING__Contact_Choice__c',
        'CHECKING__Contact_Habbit__c'};
                
        controller.addFields(fieldList);
        objCon = (Contact) controller.getRecord();
        objConNew = (Contact) controller.getRecord();
        objConNew.CHECKING__Contact_Choice__c = null;
        objConNew.CHECKING__Contact_Habbit__c = null;
        
    } */
    public boolean getblShowDet()
    {
       // return blShowDet;
       return null;
    }
  /*  public void setblShowDet(boolean selVal)
    {
        blShowDet = selVal;
    }
    
    //Utility method
  */  //Navigation method
    public void doShowEdit()
    {
      //  blShowEdit = true;
      //  setblShowDet(false);
    }     
  /*      
    public void doShowDetails()
    {
        blShowEdit = false;
        setblShowDet(true);
    }
    public PageReference doSave()
    {
        update objCon;
        PageReference pg = null;
        pg = ApexPages.currentPage();
        pg.setRedirect(true);
        return pg;
        
    }
      public PageReference doSaveNew()
    {
        update objConNew;
        PageReference pg = null;
        pg = ApexPages.currentPage();
        pg.setRedirect(true);
        return pg;
        
    }
    public void doShowAdd()
    {
        blShowAdd = true;
    }
    
    //end
    
    
*/
}