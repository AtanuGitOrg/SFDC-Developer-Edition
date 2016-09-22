public class testsobjectcls 
{
    public void createObject()
    {
        // Instantiate an sObject with the type passed in as an argument 
        Account objNew = (Account)createSFDCObject('Account');
        //  at run time. 
    }
     public sObject createSFDCObject(String typeName) {
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(typeName);
        if (targetType == null) {
            // throw an exception 
    
        }
        
       
    
        return targetType.newSObject(); 
    }
}