global class DYNAMICCLONE
{
    public static List<SObject> opCurrentList = new List<SObject>();
    public static List<SelectOption> optList = new List<SelectOption>();
    public static List<SObject> opCloneList = new List<Sobject>();
    public static List<SObject> postCloneOpList = new List<SObject>();

    public static String[] allChildObjects = new String[]{};
    public static Map<String,Schema.SObjectType> gd =null;
    //Core function to invoke from custom button from Opportunity Details Page
    global static integer cloneChildRelatedData(id currentRecordId,string currentInputObject,integer noOfCopy)
    {
        List<Schema.SObjectType> allChildList = new List<Schema.SobjectType>();
        List<Sobject> objResultList = new List<Sobject>();
        integer totCount = 0;
        //Populate list of all child objects for the Opportunity
        allChildList =  getAllChildObjectList(currentInputObject);
        if(allChildList.size() > 0)
        {
        for(Schema.SObjectType sot:allChildList)
        {
            allChildObjects.add(sot.getDescribe().getName()); // prepare the collection of all child objects for Opportunity
        
        }
        }
        //Finally clone Base Opportunity and its related data
        //Only when the clone is successful
        postCloneOpList = cloneMaster(currentRecordId,currentInputObject,noOfCopy);
        
        //Validate Cloning Of opportunity Details
        if(postCloneOpList.size() > 0)
        {
            objResultList=cloneObjects(allChildObjects,postCloneOpList,currentRecordId);
        }    
        if(objResultList.size() > 0)
        {
            totCount = objResultList.size();
        }
        return totCount;
    }

    
    public static List<Schema.SobjectType> getAllChildObjectList(string strObjectName)
    {
        gd = Schema.getGlobalDescribe();
        Schema.SObjectType sObjType  = gd.get(strObjectName);
        Schema.DescribeSObjectResult sObjResult =  sObjType.getDescribe();
        List<Schema.ChildRelationship> lstChildR = sObjResult.getChildRelationships();
        List<Schema.SObjectType> allChilds = new List<Schema.SObjectType>();
        for(Schema.ChildRelationship cr : lstChildR )
        {
            allChilds.add(cr.getChildSObject());
        }    
        return allChilds;
        
    }
    //Clone Opportunity and return cloned Opportunity List
    static List<Sobject> cloneMaster(id recIds,String objectName,integer noOfClone)
    {
        List<Schema.FieldSetMember> flds = new List<Schema.FieldSetMember>();       
        Map<String,Schema.FieldSet> fMap = null;
        Map<String,Schema.SObjectField> fldMaps = new Map<String,Schema.SObjectField>();
        Schema.FieldSet fs = null;
        Schema.SObjectType sobjType;
        
        //Get all the fields available under the Opportunity Page Layout for selection in SOQL
        gd = Schema.getGlobalDescribe();
        
        sobjType = gd.get(objectName);
        Schema.DescribeSObjectResult DescribeSObjectResultObj = sobjType.getDescribe();
        fMap = DescribeSObjectResultObj.FieldSets.getMap();
        
        for(String sf :fMap.KeySet())
        { 
                fs = fMap.get(sf);
        }        
        flds = fs.getFields();
        
        //Prepare the Source Data Selection
        String query = 'SELECT ';
        for(Schema.FieldSetMember f : flds) 
        {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id FROM';
        query += objectName + ' ' + 'WHERE ID IN(';
        query += '\'' + recIds + '\'' + ')';
        
        //Get the details for the Base Opportunity
         opCurrentList = Database.query(query);                          
        if(noOfClone == null || noOfClone == 0)
        {
            noOfClone = 1;
        } 
        //Clone the Opportunity Details to cloned Opportunity
        if(opCurrentList.size() > 0)
        {
            
            for(integer x=0;x<noOfClone;x++)
            {
                for(Sobject op:opCurrentList)
                {
                    
                    fldMaps = DescribeSObjectResultObj.Fields.getMap();
                    Sobject cloneOp = op.Clone(false,true);
                    cloneOp.put('Name', fldMaps.get('Name')  + '_' +  x);
                    //cloneOp.CloseDate = op.CloseDate.addDays(120);
                    opCloneList.add(cloneOp);
                }
            }    
            insert opCloneList;
        }
        gd = null;
        return opCloneList;
        
    }
        
    static List<Sobject> cloneObjects(string[] currentObject,List<Sobject> cloneOppLists,string curOpId)
    {
        string soqlST = '';
        List<Sobject> objList = new List<Sobject>();
        List<Sobject> objUpdateList = new List<Sobject>();
        Schema.SObjectType sobjcType;
        Map<String,Schema.SObjectField> flds = new Map<String,Schema.SObjectField>();
        Schema.DescribeSObjectResult DestResultObj = null;
        for(String objnames:currentObject)
        {
            gd = Schema.getGlobalDescribe();
            sobjcType = gd.get(objnames);
            DestResultObj =sobjcType.getDescribe();
            flds = DestResultObj.Fields.getMap();
            objList = Database.Query(getObjectInfo(objnames,curOpId));
            for(Sobject opActual: cloneOppLists)
            {
                for(Sobject ob:objList)
                {
                  Sobject obInner = ob.Clone(false,true);
                  if(objnames.indexOf('__c') > 0 && flds.containsKey(objnames + 'Id' + '__c'))
                  {
                      obInner.put(objnames + 'Id' + '__c',opActual.Id);
                  }
                  else if(flds.containsKey(objnames + 'Id'))
                  {
                      obInner.put(objnames + 'Id',opActual.Id);
                  }
                  else if(flds.containsKey('ParentId'))
                  {
                      obInner.put('ParentId',opActual.Id);
                  }    
                               
                  objUpdateList.add(obInner); 
         
                }
            }   
        } 
        if(objUpdateList.size() > 0)
        {
            insert objUpdateList;
        }
        return objUpdateList;
    
    }
    
    static String getObjectInfo(String ObjectName, string baseRecordId)
    {
        
        Map<String, Schema.SObjectField> ObjectFieldMap = Schema.getGlobalDescribe().get( ObjectName ).getDescribe().fields.getMap();
        Schema.DescribeSObjectResult objResults = null;
        Map<String,Schema.SObjectField> curFlds  = new Map<String,Schema.SObjectField>();
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
        if(ObjectName.indexOf('__C') > 0)
        {
            soql += ' ' + 'WHERE OpportunityId__C in (' + '\''  + baseRecordId +  '\'' + ')';
        }
        else
        {
            soql += ' ' + 'where OpportunityId in (' + '\''  + baseRecordId +  '\'' + ')';
        }
       return soql;
       
   }

}