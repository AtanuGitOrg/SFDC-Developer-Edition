trigger contactAfter on Contact (before insert,After update) 
{
    //Global trigger members
    List<Contact> contUpdateList = new List<Contact>();
    set<id> accIds = new set<id>();
    
    Map<Id,String> accOwnerMap = new Map<Id,String>();
    
    
    //Insert block - Process Filter
    if(trigger.isInsert)
    {    
        //Get all Account Id for Contacto
        for(Contact cm:trigger.new)
        {
            accIds.add(cm.ACCOUNTID);
            
        }
              
        //gET all Account Owner Name in collection
        List<ACCOUNT> acMainList = new List<ACCOUNT>();
        acMainList = [SELECT ID,ACCOUNTOWNERNAME__C  FROM ACCOUNT WHERE ID IN:(accIds)];
        for(Account acM:acMainList)
        {
            accOwnerMap.put(acM.Id,acM.ACCOUNTOWNERNAME__C);
        }  
        
        for(Contact cMain:trigger.new)
        {
        //    contUpdateList.add(cMain);
            cMain.ACCOUNTOWNERNAME__C = accOwnerMap.get(cMain.ACCOUNTID);
        }
        
   /*     //Pass the Control to B/L Class to do update Operation
        if(!contUpdateList.isEmpty())
        {
            contactTriggerCls.doUpdateOwner(contUpdateList,accOwnerMap);
            
        }
  */      
        
              
    }
    //Update block - Process filter
 /*   if(trigger.isUpdate)
    {
        //Get all Account Id for Contacto
        for(Contact cm:trigger.new)
        {
            accIds.add(cm.ACCOUNTID);
            
        }
              
        //gET all Account Owner Name in collection
        List<ACCOUNT> acMainList = new List<ACCOUNT>();
        acMainList = [SELECT ID,ACCOUNTOWNERNAME__C  FROM ACCOUNT WHERE ID IN:(accIds)];
        for(Account acM:acMainList)
        {
            accOwnerMap.put(acM.Id,acM.ACCOUNTOWNERNAME__C);
        }  
        
        for(Contact cMain:trigger.new)
        {
            contUpdateList.add(cMain);
        }
        
        //Pass the Control to B/L Class to do update Operation
        if(!contUpdateList.isEmpty())
        {
            contactTriggerCls.doUpdateOwner(contUpdateList,accOwnerMap);
            
        }
    }
    */

}