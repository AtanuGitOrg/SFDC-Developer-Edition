@isTest

private class ContactBeforeTrigger_Test{
/*
//Static Account accountObj;
Static  Boolean isChecked=false;


   Static testMethod void ContactBeforeTrigger_Test()
   {
      Test.StartTest();
   
      PrepareTestData();

      Test.StopTest();
   }
   static void PrepareTestData()
   {
      
       //Create Account to insert data into the account record    
       List<Account> acList=new List<Account>();
       for(integer i=0;i<10;i++)
       {
         Account ac= new Account();
         ac.Name='ACCTEST10.2';
         ac.CHECKING__BankAccountNumber__c='87';
         ac.CHECKING__No_of_Opportunities__c=85;
         ac.CHECKING__CustomerPriority__c='High';
         ac.CHECKING__AccountEmail__c='niladri.ghosh@wipro.com';
         acList.add(ac);
       }
         
       insert acList;
       
       //Create contact record to be inserted
       
       List<Contact> contList=new List<Contact>();
       for(Account acN:acList)
       {
         Contact con= new Contact();
         con.lastname='Niladri';
         con.AccountID=acN.Id;
         con.Email='niladri.gho@wipro.com';
         contList.add(con);
       } 
       if(isChecked) {
       contList[0].Email='niladri.gho@wipro.com';
       insert contList;
       System.debug('Email Not matching');
       }
       if(isChecked=true){
       contList[0].Email='niladri.ghosh@wipro.com';
       insert contList;
       }
      
       //System.debug('Email Not matching');
          
             
       //Update Contact record
       
       List<Contact> contUPDList=new List<Contact>();
       for(Account acH:acList)
       {
         Contact con= new Contact();
         con.lastname='Niladri';
         con.AccountId=acH.Id;
         con.Email='niladri.osh@wipro.com';
         contUPDList.add(con);
       }
       if(isChecked) {
       contUPDList[0].Email='niladri.gho@wipro.com';
       update contUPDList;
       System.debug('Email Not matching');
       }
       if(isChecked=true){
       contUPDList[0].Email='niladri.ghosh@wipro.com';
       update contUPDList;
       }
       //System.assert('Email not matching on update');


    }
   
        
 */  
}