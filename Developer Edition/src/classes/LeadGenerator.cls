public with sharing class LeadGenerator
{
    public List<Lead> acList = new List<Lead>();
    public List<LeadWrapper> lwrapList =  new List<LeadWrapper>();
    public List<Lead> lwrapListSelected =  new List<Lead>();
    public LeadGenerator(ApexPages.StandardController controller)
    {
        
    }
    public ApexPages.StandardSetController setCon
    {
        get{
            if(setCon == null)
            {
            setCon = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT ID,NAME,OWNERID FROM LEAD ORDER BY NAME'));
            setCon.setPageSize(8);
            }
            return setCon;    
        
        }
        set;
    
    
    }
    
    public boolean hasNext
    {
        get{
            return setCon.gethasNext();
            }
        set;
    }
    public boolean hasPrevious
    {
        get{return setCon.getHasPrevious();}
        set;
    }
    
    //navigation methods
    public void next()
    {
        setCon.next();
    }
    public void first()
    {
        setCon.first();
    }
    public void last()
    {
        setCon.last();
    }
    public void previous()
    {
        setCon.previous();
    }
    //end
    
    public List<LeadWrapper> getLeadList()
    {
        //acList.clear();
        acList = setCon.getRecords(); // Get records method returns the list of all records from Standard Set controller
        lwrapList.clear();
        for(Lead l:acList)
        {
            lwrapList.add(new LeadWrapper(l));
        }
        return lwrapList;
    }
    
    public void doSelect()
    {
        lwrapListSelected.clear();
        if(lwrapList.size() > 0)
        {
            for(LeadWrapper lw:lwrapList)
            {
                if(lw.isSelected == true)
                {
                    lwrapListSelected.add(lw.acLead);
                }
            }
        }
        System.Debug('Selected List:' + ' ' + lwrapListSelected);
    }
    
    
    public class LeadWrapper
    {
        public Lead acLead{get;set;}
        public boolean isSelected{get;set;}
        public LeadWrapper(Lead lmain)
        {
           acLead =  lmain;
           isSelected = false;
        }
    }
 
    
    
    

}