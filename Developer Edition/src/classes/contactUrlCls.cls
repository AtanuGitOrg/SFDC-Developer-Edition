public with sharing class contactUrlCls 
{
    //Variable section
    string id = '';    
    //end
    
    public contactUrlCls()
    {
        //ApexPages.CurrentPage().getParameters() -- basically the collection
        //of Key Value pairs for Parameters and Value -- related to the URL
        //for the custorm page. /apex/abc?id=a001&name=abc
        
        if(ApexPages.currentPage().getParameters().get('id') !=null)
        {
            id=ApexPages.currentPage().getParameters().get('id');
        }
    }
    public PageReference prepareURL()
    {
        string URL = '';
        PageReference pg = null;
        List<Account> acList = new List<Account>();
        acList = [SELECT PHONE,FAX FROM ACCOUNT WHERE ID=:id LIMIT 1];
        
        if(!acList.isEmpty())
        {
            URL += '/003/e?retURL=' + id + '&con4_lkid=' + id +'&nooverride=1';
            URL += '&con10=' + acList[0].Phone != null ? acList[0].Phone : '' + '&con11=' + acList[0].Fax;
            
        }
        pg = new PageReference(URL);
        return pg;
        
        
    }
}