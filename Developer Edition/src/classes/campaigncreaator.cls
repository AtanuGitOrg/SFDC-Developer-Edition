public with sharing class campaigncreaator {

    public campaigncreaator(ApexPages.StandardController controller) {

    }
    public PageReference reloadPage()
    {
        PageReference pr = null;
        string URL ='';
        string opId = '';
        string opName='';
        if(ApexPages.currentPage().getParameters().get('id') !=null)
        {
            opId = ApexPages.currentPage().getParameters().get('id');
            opName = ApexPages.currentPage().getParameters().get('name');
            URL += '/701/e?retUrl=' + opId;
            URL += '&CF00N90000004f8gs_LKID=' + opId;
            URL += '&CF00N90000004f8gs=' + opName + '&nooverride=1';
        }  
        pr = new PageReference(URL);
        pr.setRedirect(true);
        return pr;
        
    }
    

}