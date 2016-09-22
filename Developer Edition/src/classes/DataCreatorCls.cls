public class DataCreatorCls
{
    public string objName = '';
    public integer totRecords{get;set;}
    public string selectedObjects{get;set;}
    public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    List<SelectOption> objNames = new List<SelectOption>();
    public string confirmMessage{get;set;}
    public DataCreatorCls()
    {
               
    }
    
    //Get the list of Objects
     public List<SelectOption> getinitObjNames() 
     {
        List<String> entities = new List<String>(schemaMap.keySet());
        entities.sort();
        for(String name : entities){
         if(name == 'account' || name == 'opportunity' 
         || name == 'contact')
         {
            objNames.add(new SelectOption(name,name));
         }   
        }
        System.Debug('Names:' + ' ' + objNames);
        return objNames;
     }
    
     public void doCreate()
     {
       List<Sobject> objLists = new List<Sobject>();
       string soql = '';
       
       System.Debug('Names:' + ' ' + objNames);
      
       Sobject obj = DATACREATOR.creatObjectDataWithAll(selectedObjects, totRecords);
       objLists.add(obj);
        
       for(Sobject ob: objLists)
       {
           soql += String.valueOf(ob) + ',';
       }
       soql = soql.substring(0,soql.length() -1);
       confirmMessage = 'Dummy Data Created for the Objects' + ' ' + soql;
       
     }
    
     
}