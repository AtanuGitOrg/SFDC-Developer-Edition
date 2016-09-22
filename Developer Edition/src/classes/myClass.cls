public with sharing class myClass
{
    public myClass(ApexPages.StandardController con)
    {
        
    }
    
    public PageReference OpportunityRedirect()
    {
        PageReference pf = null;
        string acId = '';
        if(ApexPages.currentPage().getParameters().get('acId') !=null)
        {
            acId = ApexPages.currentPage().getParameters().get('acId');
        }
        if(acId !='')
        {
            pf = new PageReference('/apex/testPage?Id=' + acId);
        }
        return pf;
        
    }

}