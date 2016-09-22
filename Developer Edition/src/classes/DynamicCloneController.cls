public with sharing class DynamicCloneController 
{
    public string SobjectName{get;set;}
    List<SelectOption> optList = new List<SelectOption>();
    public string[] selectedObjects{get;set;}
    
    public DynamicCloneController()
    {
       
    }
    
    
    //Get all child items for the specific Object
    public List<SelectOption> getAllRelatedObjects()
    {
          List<Schema.SObjectType> allChildList = new List<Schema.SobjectType>();
          allChildList =  DYNAMICCLONE.getAllChildObjectList(SobjectName);
          System.Debug('All Childs:' + ' ' + allChildList);
          for(Schema.SObjectType sot:allChildList)
          {
              optList.add(new SelectOption(sot.getDescribe().getName(),sot.getDescribe().getName()));
              System.Debug('All Objects:' + ' ' + optList);
          }
          System.Debug('All Objects:' + ' ' + optList);
          return optList; 
          
    }
    
 
}