/*
    GLOBAL CLASS WHICH CAN BE INVOKED FOR 
    CREATING RECORD UNDER ANY OBJECT.
    
    

*/



global class DATACREATOR
{
    
    static List<SObject> objList = new List<SObject>() ;
    static Map<String,Schema.SObjectType> gd =null;
    
    //Using Specific Field Set under Object
    
    public static void creatObjectData(string objectName,integer nor)
    {
        Map<String,Schema.FieldSet> fMap = null;
        Schema.SObjectType sobjType;
        List<Schema.FieldSetMember> fieldMem = new List<Schema.FieldSetMember>();
        string fieldNames = '';
       
        
        gd = Schema.getGlobalDescribe();
        
        sobjType = gd.get(objectName);
        Schema.DescribeSObjectResult DescribeSObjectResultObj = sobjType.getDescribe();
        fMap = DescribeSObjectResultObj.FieldSets.getMap();
        
        Sobject newObj = sobjType.newSObject();
        Schema.FieldSet fs = null;
        
            for(String sf :fMap.KeySet())
            { 
                fs = fMap.get(sf);
            }        
            fieldMem = fs.getFields();
            if(nor == 0 || nor == null)
            {
                nor = 1;
            }
            for(integer x=0;x<nor;x++)
            {
                for(Schema.FieldSetMember fmem:fieldMem)
                {
                    
                   
                   // fieldNames += fmem.getFieldPath() + '=' ;
                    if(fmem.getType() == Schema.DisplayType.String || fmem.getType() == Schema.DisplayType.TextArea)
                    {
                        newObj.put(fmem.getFieldPath(),'ACCTEST'+ x + String.valueOf(Math.Random()).substring(0,3));
                        
                    }
                    if(fmem.getType() == Schema.DisplayType.Email)
                    {
                        newObj.put(fmem.getFieldPath(),'a@a.com');
                    }
                    if(fmem.getType() == Schema.DisplayType.Integer|| fmem.getType() == Schema.DisplayType.Double ||
                    fmem.getType() == Schema.DisplayType.Currency)
                    {
                       newObj.put(fmem.getFieldPath(),85);
                    }
                    if(fmem.getType() == Schema.DisplayType.pickList || fmem.getType() == Schema.DisplayType.MultipickList)
                    {
                        newObj.put(fmem.getFieldPath(),'ACCTEST'+ x + String.valueOf(Math.Random()).substring(0,3));
                    }
                    if(fmem.getType() == Schema.DisplayType.Date || fmem.getType() == Schema.DisplayType.DateTime)
                    {
                        newObj.put(fmem.getFieldPath(),System.Today());
                    }
                   
                    
                    
                }
            
         }
        System.Debug('Field Names' + ' ' + newObj);
        insert newObj;
        
        
      
      }
      //Without Using the fieldset and adding only mandatory fields and without any relationship
     public static Sobject creatObjectDataWithAllButNoRelationship(string objectName,integer nor)
     {
        Map<String,Schema.SobjectField> fMap = null;
        Schema.SObjectType sobjType;
        Sobject newObj ;   
        
        Schema.FieldSet fs = null;
        gd = Schema.getGlobalDescribe();
        if(objectName !='RecordType')
        {
            sobjType = gd.get(objectName);
            newObj = sobjType.newSObject();
            Schema.DescribeSObjectResult DescribeSObjectResultObj = sobjType.getDescribe();
            fMap = DescribeSObjectResultObj.Fields.getMap();
            
           
            if(nor == 0 || nor == null)
            {
                nor = 1;
            }
            for(integer x=0;x<nor;x++)
            {  
             
                for(Schema.SobjectField fmem:fMap.Values())
                {
                        Schema.DescribeFieldResult F = fmem.getDescribe();
                        if(!F.isNillable() && F.isCreateable() && !F.isRestrictedPicklist() && F.isUpdateable() && F.getName() !='OwnerId' )
                        {
                           
                          
                            if(F.getType() == Schema.DisplayType.String || F.getType() == Schema.DisplayType.TextArea)
                            {
                                newObj.put(fmem,'ACCTEST'+ x + String.valueOf(Math.Random()).substring(0,3).substring(0,1));
                                
                            }
                            if(F.getType() == Schema.DisplayType.Email)
                            {
                                newObj.put(fmem,'a@a.com');
                            }
                            if(F.getType() == Schema.DisplayType.Integer|| F.getType() == Schema.DisplayType.Double ||
                            F.getType() == Schema.DisplayType.Currency)
                            {
                               newObj.put(fmem,85);
                            }
                            if(F.getType() == Schema.DisplayType.pickList || F.getType() == Schema.DisplayType.MultipickList)
                            {
                                newObj.put(fmem,'ACCTEST'+ x + String.valueOf(Math.Random()).substring(0,3));
                            }
                            if(F.getType() == Schema.DisplayType.Date || F.getType() == Schema.DisplayType.DateTime)
                            {
                                newObj.put(fmem,System.Today());
                            }
                           
                        }
                        
                }
            }
        } 
        else
        {
            newObj = null;
        }   
        System.Debug('Field Names' + ' ' + newObj);
        insert newObj;
        return newObj;
        
        
      
      }
      
        //Without Using the fieldset and adding only mandatory fields and without any relationship
     public static Sobject creatObjectDataWithAll(string objectName,integer nor)
     {
        Map<String,Schema.SobjectField> fMap = null;
     
        gd = Schema.getGlobalDescribe();
        System.Debug('SCHEMA IS:' + gd);
        System.Debug('SCHEMA IS:' + objectName);
        Schema.SObjectType sobjType = gd.get(objectName);
        Schema.DescribeSObjectResult DescribeSObjectResultObj = sobjType.getDescribe();
        fMap = DescribeSObjectResultObj.Fields.getMap();
        
        Sobject newObj ;
        Schema.FieldSet fs = null;
        List<Schema.SobjectType> mainObjList = new List<Schema.SobjectType>();
        Sobject mainObj ;  
        if(nor == 0 || nor == null)
        {
            nor = 1;
        }
        for(integer x=0;x<nor;x++)
        {
            newObj =  sobjType.newSObject();
            for(Schema.SobjectField fmem:fMap.Values())
            {
                    Schema.DescribeFieldResult F = fmem.getDescribe();
                    System.Debug('Partner Field:' + F.getName());
                    System.Debug('Editable:' + F.isUpdateable());
                    if(!F.isNillable() && F.isCreateable() && !F.isRestrictedPicklist() && F.isUpdateable() && F.isAccessible() && F.getName()!='OwnerId' )
                    {
                      
                       // fieldNames += F.getFieldPath() + '=' ;
                        if(F.getType() == Schema.DisplayType.String || F.getType() == Schema.DisplayType.TextArea)
                        {
                            newObj.put(fmem,'ACCTEST'+ x + String.valueOf(Math.Random()).substring(0,3));
                            
                        }
                        if(F.getType() == Schema.DisplayType.Email)
                        {
                            newObj.put(fmem,'a@a.com');
                        }
                        if(F.getType() == Schema.DisplayType.Integer|| F.getType() == Schema.DisplayType.Double ||
                        F.getType() == Schema.DisplayType.Currency)
                        {
                           newObj.put(fmem,85);
                        }
                        if(F.getType() == Schema.DisplayType.pickList || F.getType() == Schema.DisplayType.MultipickList)
                        {
                            newObj.put(fmem,'ACCTEST'+ x + String.valueOf(Math.Random()).substring(0,3));
                        }
                        if(F.getType() == Schema.DisplayType.Date || F.getType() == Schema.DisplayType.DateTime)
                        {
                            newObj.put(fmem,System.Today());
                        }
                        if(F.getType() == Schema.DisplayType.Reference)
                        {
                            mainObjList = F.getReferenceTo();
                            for(Schema.SobjectType m:mainObjList )
                            {
                               if(m.getDescribe().getName() !='User' && m.getDescribe().getName() !='RecordType')
                               {
                                   if(creatObjectDataWithAllButNoRelationship(m.getDescribe().getName(),nor) !=null)
                                   {
                                       mainObj = creatObjectDataWithAllButNoRelationship(m.getDescribe().getName(),nor);
                                   }    
                               }    
                            }
                            if(mainObj !=null)
                            {
                                newObj.put(fmem,mainObj.Id);
                            }    
                        }
                    }
                   
                    
                    
                }
            objList.add(newObj);    
        }
        System.Debug('Field Names' + ' ' + newObj);
        System.Debug('Object List:' + ' ' + objList);
        insert objList;
        objList.clear();
        return newObj;
        
        
      
      }
      
      
      
      
      
       
      
      
      

}