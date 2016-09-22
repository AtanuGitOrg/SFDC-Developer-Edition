public with sharing class opCloneCls {
    public Opportunity opMain{get;set;}
    List<Opportunity> opList = new List<Opportunity>();
    public string[] selectedObject{get;set;}
    List<SelectOption> optList = new List<SelectOption>();
    string recordIds = '';
    public string productName{get;set;}
    public opCloneCls(ApexPages.StandardController controller) 
    {
        opMain = (Opportunity)controller.getRecord();
        opList.add(opMain);
        if(ApexPages.currentPage().getParameters().get('id') !=null)
        {
               recordIds = ApexPages.currentPage().getParameters().get('id');
        }
      
        
    }
    public List<SelectOption> getAllRelatedObjects()
    {
          List<Schema.SObjectType> allChildList = new List<Schema.SobjectType>();
          allChildList =  getAllChildObjectList();
          for(Schema.SObjectType sot:allChildList)
          {
              optList.add(new SelectOption(sot.getDescribe().getName(),sot.getDescribe().getName()));
          }
          return optList; 
    }
    private List<Schema.SobjectType> getAllChildObjectList()
    {
        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe();
        Schema.SObjectType sObjType  = gd.get('Opportunity');
        Schema.DescribeSObjectResult sObjResult =  sObjType.getDescribe();
        List<Schema.ChildRelationship> lstChildR = sObjResult.getChildRelationships();
        List<Schema.SObjectType> allChilds = new List<Schema.SObjectType>();
        for(Schema.ChildRelationship cr : lstChildR )
        {
            allChilds.add(cr.getChildSObject());
        }    
        return allChilds;
        
    }
    
    public PageReference cloneObjects()
    {
        List<Opportunity> opMain = [SELECT ID,NAME,ACCOUNTID,STAGENAME,TYPE,CLOSEDATE FROM OPPORTUNITY WHERE ID=:recordIds];
        List<Opportunity> opCloneList = new List<Opportunity>();
        if(opMain.size() > 0)
        {
            for(Opportunity op:opMain)
            {
                Opportunity cloneOp = op.Clone(false,true);
                cloneOp.Name = op.Name + '1';
                cloneOp.CloseDate = op.CloseDate.addDays(120);
                opCloneList.add(cloneOp);
            }
            insert opCloneList;
        }
        
        
        List<Sobject> objList = new List<Sobject>();
        List<Sobject> objUpdateList = new List<Sobject>();
        objUpdateList.clear();
        try
        {
        for(String obj : selectedObject)
        {
             objList.clear();
            
           
            
            
                objList = Database.Query(getObjectInfo(obj,recordIds));
                for(Opportunity opActual: opCloneList)
                {
                    
                    
                    for(Sobject ob:objList)
                    {
                      
                      Sobject obInner = ob.Clone(false,true);
                      SobjectField fld ;
                      Schema.DescribeFieldResult F;
                      Map<String, Schema.SObjectField> ObjectFieldMap = Schema.getGlobalDescribe().get(obj).getDescribe().fields.getMap();
                      
                      if(obj.indexOf('__C') > 0 && ObjectFieldMap.containsKey('OpportunityId__C') )
                      {
                          fld = ObjectFieldMap.get('OpportunityId__C');
                          F = fld.getDescribe();
                          if(F.isCreateable())
                          { 
                              obInner.put('OpportunityId__c',opActual.Id);
                          }    
                      }
                      
                      else if(ObjectFieldMap.containsKey('OpportunityId')  )
                      {
                          fld = ObjectFieldMap.get('OpportunityId');
                          F = fld.getDescribe();
                          if(F.isCreateable())
                          {
                              obInner.put('OpportunityId',opActual.Id);
                          }
                      } 
                      else if(ObjectFieldMap.containsKey('ParentId') )
                      {
                          fld = ObjectFieldMap.get('ParentId');
                          F = fld.getDescribe();
                          if(F.isCreateable())
                          {
                              obInner.put('ParentId',opActual.Id);
                          }    
                      }   
                      System.Debug('Actual Id:' + ' ' + opActual.Id);
                     
                      objUpdateList.add(obInner); 
                      
                    }
                    System.Debug('Actual List:' + ' ' + objUpdateList);
                }
        }
              
        
       if(objUpdateList.size() > 0)
       {
            Database.SaveResult[] dsr = Database.Insert(objUpdateList,false);
       }
       }
       catch(Exception ex)
       {
             
       } 
       return new PageReference('/006/o');
    }
    
    public String getObjectInfo(String ObjectName, string baseRecordId)
    {
        Map<String, Schema.SObjectField> ObjectFieldMap = Schema.getGlobalDescribe().get( ObjectName ).getDescribe().fields.getMap();
        string soql = '';
        soql = 'SELECT' + ' ' ;
        for (Schema.SObjectField SObjectF : ObjectFieldMap.values())
        {
           Schema.DescribeFieldResult field = SObjectF.getDescribe();
           if(field.getName() !='UnitPrice')
           {
               soql += field.getName() + ',';
           }    
        }
        soql = soql.substring(0,(soql.length() - 1));
        soql += ' FROM ' + ObjectName;
        if(soql.indexOf('OpportunityId') > 0)
        {
            if(ObjectName.indexOf('__C') > 0)
            {
                soql += ' ' + 'WHERE OpportunityId__C in (' + '\''  + baseRecordId +  '\'' + ')';
            }
            else
            {
                soql += ' ' + 'where OpportunityId in (' + '\''  + baseRecordId +  '\'' + ')';
            }
        }
        else if(soql.indexOf('ParentId') > 0)
        {
            soql += ' ' + ' where ParentId in (' + '\''  + baseRecordId +  '\'' + ')';
        }    
        System.Debug('SOQL IS:' + ' ' + soql);
        return soql;
    }

}