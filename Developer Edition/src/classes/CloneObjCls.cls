public with sharing class CloneObjCls 
{

    public CloneObjCls(ApexPages.StandardController controller) {

    }

    public string specificObject{get;set;}
    public string[] selectedObjects{get;set;}
    List<SelectOption> optList = new List<SelectOption>();
    string objectId = '';
    //Constuctor
    public CloneObjCls()
    {
        
       // getAllRelatedObjects();
     }
    //Get the Object Type
    public static Schema.SObjectType getSobjectTypeByPrefix( String SObjectPrefix ){
    for( Schema.SObjectType ot : Schema.getGlobalDescribe().values() ){
        String keyPrefix = (String)ot.getDescribe().getKeyPrefix();
        if( keyPrefix != null && keyPrefix.equals( SObjectPrefix ) ){
            return ot;
        }
        System.Debug('OT IS:' + ' ' + ot);
    }
    return null;
    }
    public void doPoupalate(string objName)
    {
        
    }
     //Get all child items for the specific Object
    public List<SelectOption> getallObjects()
    {
          //Get the Id for the Record for an Object
        if(ApexPages.currentPage().getParameters().get('name') !=null)
        {
            objectId = ApexPages.currentPage().getParameters().get('name');
        }
        
        if(objectId !=null)
        {
            specificObject = objectId;
        }
        System.Debug('Specific Object:' + ' ' + specificObject);  
    
          List<Schema.SObjectType> allChildList = new List<Schema.SobjectType>();
    //      allChildList =  DYNAMICCLONE.getAllChildObjectList(specificObject);
          System.Debug('All Childs:' + ' ' + allChildList);
          String allOB = '';
          String [] objs = new String[]{};
          for(Schema.SObjectType sot:allChildList)
          {
              if(sot.getDescribe().getName() !='' && sot.getDescribe().getName() !=null)
              {
                  allOB += sot.getDescribe().getName() + ',';
              }    
                           
              System.Debug('All Objects:' + ' ' + allOB);
          }
          System.Debug('All Objects:' + ' ' + allOB);
          allOB = allOB.substring(0,((allOB.Length()-1)));
          objs = allOB.Split(',');
          for(String s:objs)
          {
              optList.add(new SelectOption(s,s));
          }
          
          return optList; 
          
    }
    
   


    
}