public class objectCls 
{
    public string[] selectedObjects{get;set;}
    public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    public objectCls()
    {
    
    }
    //Get the list of Objects
     private List<SelectOption> initObjNames() 
     {
        List<SelectOption> objNames = new List<SelectOption>();
        List<String> entities = new List<String>(schemaMap.keySet());
        entities.sort();
        for(String name : entities)
        objNames.add(new SelectOption(name,name));
        return objNames;
        }
    
}