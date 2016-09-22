public class AccountTrigger
{
    //VARIABLE SECTION
    
    static Map<ID,String> acStatusMap = new Map<Id,String>(); // Declare the Map collection
    //END
    public static void doUpdateContact(List<Account> acList)
    {
        if(acList.size() > 0)
        {
           for(Account ac: acList)
           {
             acStatusMap.Put(ac.Id,ac.Active__c);  // Populate the collection with 
                                                   //  Account Id with Active status
           } 
           List<Contact> contList = [SELECT Related_to_Active_Account__c FROM CONTACT
           where AccountID IN:(acStatusMap.keySet())];

           if(contList.size() > 0)
           {
               for(Contact cont:contList)
               {
                   if(acStatusMap.get(cont.AccountId) == 'Yes')
                   {
                       cont.Related_to_Active_Account__c = true;
                   }
               }
               //DML Statement
               update contList;
           }
           
        }
    }
    
    //Do create the Opportunity based on the Account
    public static void doCreateOpportunity(List<Account> acList)
    {
        List<Opportunity> opListUpdate = new List<Opportunity>();
        integer x = 0;
        if(!acList.isEmpty())
        {
            for(Account ac:acList)
            {
                for(x = 0; x<2;x++)
                {
                Opportunity op = new Opportunity();
                op.AccountId = ac.Id;
                op.Name = 'OP' + '_' + String.valueOf(x) + '_' + String.valueOf(ac.Id);
                op.StageName = 'Prospecting';
                op.CloseDate = System.Today().addMonths(3);
                opListUpdate.add(op);
                }
                x = 0;
            }
            //finally create new records
            //include exception catching for failed records
            //Get the result of successful records 
            //and also find out failed records
            List<Database.SaveResult> svr = Database.insert(opListUpdate,false);   
            string[] failedRecs = new string[]{};         
            for(Database.SaveResult dsr:svr)
            {
                if(!dsr.IsSuccess())
                {
                    failedRecs.add(dsr.getId());
                }
            }

            
        }
    
    }
    
    
    //End
    
    //Do create the Account Information Data based on new Account
    public static void doCreateAccountInformation(List<Account> accList)
    {
        List<Account_information__c> aiList = new List<Account_information__c>();
        if(!accList.isEmpty())
        {
          for(Account ac:accList)
          {
              Account_information__c AI = new Account_information__c();
              AI.Account__c = ac.Id;
              AI.NEWLY_CREATED__c = true;
              aiList.add(AI);
          }
          
          List<Database.SaveResult> dsList = Database.Insert(aiList,false);
          for(Database.SaveResult dr:dsList)
          {
              if(!dr.IsSuccess())
              {
                  System.Debug('Error Occurred in:' + dr.getId());
              }
          }
          
        }
    
    }
    
     
}