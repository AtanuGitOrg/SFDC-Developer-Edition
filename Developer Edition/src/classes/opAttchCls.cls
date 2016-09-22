public with sharing class opAttchCls 
{
   public Opportunity op{get;set;}
    
   public opAttchCls(ApexPages.StandardController controller)
   {
       op = (Opportunity) controller.getRecord();
   
   }
   public List<Sobject> getAllNotesAndAttachment()
   {
        Map<String, Schema.SObjectField> ObjectFieldMap = Schema.getGlobalDescribe().get('NotesAndAttachments').getDescribe().fields.getMap();
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
        soql += ' FROM ' + 'NotesAndAttachments';
        soql += ' Where ParentId IN (' + '\''  + op.Id +  '\'' + ')';
        List<Sobject> objList = new List<Sobject>();
        objList = Database.Query(soql);
        return objList;
        
        
   }
 

}