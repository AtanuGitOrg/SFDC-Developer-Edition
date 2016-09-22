public class PRCls {
    public List<M_Patient__c> pt{get;set;}

    public PRCls(ApexPages.StandardController controller) {

    }
     public ApexPages.StandardSetController cont {
     get{
            if(cont == null)
            {
            cont = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT ID,Name__c,Mobile__c FROM M_Patient__c ORDER BY Name__c'));
            cont.setPageSize(15);
            }
            return cont;    
        
        }
        set;
    
        
    }
    public List<M_Patient__c> getPatientList()
    {
     pt = cont.getrecords();
     return pt;
    }
    
     public boolean hasNext
    {
        get{
            return cont.gethasNext();
            }
        set;
    }
    public boolean hasPrevious
    {
        get{return cont.getHasPrevious();}
        set;
    }
    
    //navigation methods
    public void next()
    {
        cont.next();
    }
    public void first()
    {
        cont.first();
    }
    public void last()
    {
        cont.last();
    }
    public void previous()
    {
        cont.previous();
    }
   
}