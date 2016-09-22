public with sharing class AccountData 
{
    //member variables
    public List<Account> acList = new List<Account>();
    public Account ac {get;set;} 
    //end
    //Constructor
    
    public AccountData(ApexPages.StandardController controller) 
    {
       //get the fields collection
       string[] nagraj = new string[]{'name','industry','BankAccountNumber__c'};
       controller.addFields(nagraj);
       //end
       
       ac = (Account)controller.getRecord();     
    }
    //End
    
   
    //end
    //Utility Method
    public List<Account> getAccountDetails()
    {
        acList = [SELECT NAME,INDUSTRY FROM ACCOUNT WHERE ID=:ac.Id LIMIT 1];
        return acList;
    } 
    //Create a New Account
    public pagereference doCreateAccount()
    {
        insert ac;
        return new PageReference('/' + ac.Id);
    }
    
    

}