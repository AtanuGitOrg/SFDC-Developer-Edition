public  class AccSearch 
{
    //Variable section
    public string searchAcc{get;set;}
    public boolean blshowDetails{get;set;}
    public boolean contshowDetails{get;set;}
    public string Accid{get;set;}
    public List<Account> accList = new List<Account>();
    //end
    //Constructor
    public AccSearch(ApexPages.StandardController controller) 
    {
        blshowDetails = false;
        contshowDetails = false;
    }
    //Utility Methods
    public void doSearch()
    {
        if(searchAcc !='')
        {
            blShowDetails = true;
            contShowDetails = false;
            getSearchedAccounts();
            
        }    
    }
    public void doContSearch()
    {
        contShowDetails = true;
        getSearchedContacts();
    
    }
    //Get searched accounts
    public List<Account> getSearchedAccounts()
    {
        accList = new List<Account>();
        accList = [SELECT ID,NAME FROM ACCOUNT WHERE NAME LIKE:searchAcc + '%'];
        return accList;
        
    }
    
    public List<Contact> getSearchedContacts() {
        List<Contact> cntList = new List<Contact>();
        if(apexpages.currentPage().getParameters().get('AccId')!=null)
        {
            AccId = ApexPages.currentPage().getParameters().get('AccId');
            cntList = [SELECT ID,FirstName,LastName FROM CONTACT WHERE AccountId=:Accid];
        }
        return cntList;
    }    

}