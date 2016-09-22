trigger contactBefore on Contact (before insert,before update) 
{
    //Global member for trigger
    
    set<Id> acIds = new set<Id>();
    Map<Id,String> acIdEmail = new Map<Id,String>();
    //end
    //checking data while inserting -- process filter
    if(trigger.isInsert)
    {
    
        // B/L Filter
        //Get all Account Ids
        for(Contact cc:trigger.new)
        {
            acIds.add(cc.AccountId);
        }
        //End
        
        // Get Email Id from Account and populate
        // id collection
        List<Account> acList = new List<Account>();
        acList = [SELECT ID,AccountEmail__c FROM ACCOUNT
        WHERE ID IN:(acIds)];
        for(ACCOUNT AC:acList)
        {
            if(AC.AccountEmail__C !=null && AC.AccountEmail__C !='')
            {
                acIdEMail.put(AC.ID,AC.AccountEmail__c);
            }    
        }
        //Business Logic fiter setting
        for(Contact cMain:Trigger.New)
        {
            //check whether AccountEmail is blank
            // FILTER 1
            if(acIdEmail.get(cMain.AccountId) !=null && acIdEmail.get(cMain.AccountId) !='')
            {
                //Check whether contact email is 
                //different from account email
                //FILTER 2
                if(cMain.Email !=acIdEmail.get(cMain.AccountId))
                {
                    cMain.addError(Label.ErrorMessage1);
                }
            
            }
        }
        
        
        
    }
    //checking when updating record
    if(trigger.isUpdate)
    {
     // B/L Filter
        //Get all Account Ids
        for(Contact cc:trigger.new)
        {
            acIds.add(cc.AccountId);
        }
        //End
     // Get Email Id from Account and populate
        // id collection
        List<Account> acList = new List<Account>();
        acList = [SELECT ID,AccountEmail__c FROM ACCOUNT
        WHERE ID IN:(acIds)];
        for(ACCOUNT AC:acList)
        {
            if(AC.AccountEmail__C !=null && AC.AccountEmail__C !='')
            {
                acIdEMail.put(AC.ID,AC.AccountEmail__c);
            }    
        }
        for(Contact cMainOld:Trigger.Old)
        {
            for(Contact cMain:Trigger.New)
            {
            //check whether AccountEmail is blank
            // FILTER 1
            if(acIdEmail.get(cMain.AccountId) !=null && acIdEmail.get(cMain.AccountId) !='')
            {
                //Check whether contact email is 
                //different from account email on update
                //FILTER 2

                if(cMainOld.Email !=cMain.Email  )
                {
                 cMain.addError('Email not matched on update');
                }
                //Check whether contact email is 
                //different from account email
                //FILTER 2
                            
            }
           }
         }
        
    }
    
}