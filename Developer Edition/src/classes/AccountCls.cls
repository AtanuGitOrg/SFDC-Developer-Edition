/*
     Author: Atanu Shaw
     Description: 
         1. Create a custom Controller Extension class called AccountCls to associate it with a VF page
         2. The custom VF page displays Details and Edit section related to Account opportunity, along with a search criteria section within detail section, that is used to query Account Name in order to retrieve accounts with the name used for search.
         3. The AccountCls class needs to be shared only with certain profiles, security constraint exists, hence public with sharing class.
     Date: June 26, 2014
*/


public with sharing class AccountCls
{
    public boolean ShowDetailPage{get;set;}
    public boolean ShowEditPage{get;set;}
    public boolean acctSearchListExists{get;set;}
    public Account objAcct{get;set;}
    public List<Account> acList = new List<Account>();
    String acctRecordStatus =' ';
    
    List<Account> acctSearchList;
        
    
    //Post Binding SearchString on Account Name field from the VF Page
      public string searchString{get;set;}
        
    
            /*Pre Binding via Constructor and controller: 
              Input field values entered by user from the UI, via the VF page
              need to be bound to the respective custom fields on the Account Object
            */
            //Constructor for the AccountCls Class
            public AccountCls(ApexPages.StandardController controller)
            {
                ShowEditPage = true; // Default landing section of the VF page is Edit Section of the AccountEntry page.
                ShowDetailPage = false;
                acctSearchListExists = false;
                        
                //Below lines of code are written in order to access those fields of an Account record, that are to be displayed on the custom VF Page.
                
              /*  //Create a custom page field list, containing all the fields you want to be shown on your VF Page.
                String[] acctCustomPageFieldList = new String[]{'Name','accountNumber','Type', 'Phone', 'BankAccountNumber__c'};
                
                //Add the custom field list to your standard controller reference variable
                controller.addFields(acctCustomPageFieldList);
                
                /*Retrieve an account record with the custom fields in it, 
                  from the standard controller (collection) class' reference, namely, controller
                  and initialize the Account instance (objAcct) with the record containing the custom fields
                */
                //Type casting: controller needs to be of type Account so as to have objAcct initialized with the returning Account record
               // objAcct = (Account) controller.getrecord(); 
                // Note that getrecord() returns by default only the record id, so in order to have all the fields to be displayed on VF page returned, we need to add those fields to a fieldset via the addfieldlist() method. 
                
                
                if(ApexPages.currentPage().getParameters().get('id') !=null)
                {
                    
                    acList = [SELECT ID,NAME,ACCOUNTNUMBER,TYPE,PHONE,BANKACCOUNTNUMBER__c from account WHERE
                    ID=:ApexPages.currentPage().getParameters().get('id')];
                    if(!acList.isEmpty())
                    {
                        for(Account ac:acList)
                        {
                            objAcct = ac;
                        }
                    }
                }
                
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
    
    
    // doSave method explains the behavior that is expected when the SAVE button from VF page is clicked
    public void doSave()
    {
        if( acctRecordStatus == ' ' )
        {
           //Perform the DML operation of 'INSERT'
           insert acList ;
           acctRecordStatus = 'Record Inserted';
        }
        else
           update acList ;
           
        //Display the details page of the Account object.
        doShowDetails();
        
        //Below lines of code is used for post binding check:
        //Store the value of the name of the account that has been saved with details from the VF page. 
        //The name of the account is useful for searching accounts with similar name, under the search criteria section on the VF page.
        /*
        List<Account> accList = [SELECT name FROM Account WHERE id=:objAcct.Id]; 
        
        if(accList.size()>0) //Null check
        {
            for(Account ac:accList)
            {
                //Post Binding: Input data entered from the VF Page gets stored to Apex Controller Class' getter&setter member variables.
                //Post Binding is often used in cases of query purpose or search criteria match. 
                  searchString = ac.name;
            }
        }
        */
        
    }//end of doSave() method.
    
    
    public void searchForAcctNames()
    {
        //Perform Search using SOQL: Check if any accounts can be found whose names match the search string entered from VF Page.
        acctSearchList = [SELECT name,accountNumber,bankAccountNumber__c
                          FROM Account WHERE name LIKE :searchString + '%' LIMIT 30];
        
        if(acctSearchList.size() > 0)
        {
            acctSearchListExists = true;
        }                           
                         
    }
    
     
           
    // Get all accounts with account names, account numbers and types that match the search string criteria entered from the VF Page.       
    public List<Account> getAcctsAfterNameSearch() 
    {
        if(searchString == NULL) 
            return null;
        else
            return acctSearchList;
    }
    
        
    //Get all Address Information for All Accounts
    public List<Account> getAllAddress()
    {
        List<Account> acList = new List<Account>();
        acList = [SELECT Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, CreatedDate
        FROM Account WHERE BillingCity <> NULL ORDER BY CreatedDate ASC  LIMIT 15  ];
        return acList;
        
    }
    
    
    
} // end of the class