public with sharing class wrapperHelp
{
    // Region Class Members
    List<mainWrapper> mainWrapp = new List<mainWrapper>(); // Initialize collection with Null
    
    //End
    
    //Main class constructor
    public wrapperHelp(ApexPages.StandardController cont)
    {
    
    }
    //End
    //Core Method Zone
    //Populate Account Data as collection of wrapperClass Object
    public List<mainWrapper> getAllAccounts()
    {
        List<Account> acList = new List<Account>(); //Initialize collection with Null
        acList = [select id,name from account limit 10];
        //Null checking of collection
        if(!acList.isEmpty())
        {
            for(Account acM:acList)
            {
                mainWrapp.add(new mainWrapper(acM));
            }
        } 
        return mainWrapp;
    }
    
    public List<Account> getAllAccount()
    {
        List<Account> acList = new List<Account>(); //Initialize collection with Null
        acList = [select id,name from account limit 10];
        return acList;
    }
    
    //End
    //Wrapper class Zone begins
    public class mainWrapper
    {
        //Inner wrapper Class parameters
        public Account acMain{get;set;}
        public boolean isSelected{get;set;}
        //End
        //Wrapper Class Constructor
        public mainWrapper(Account ac)
        {
            acMain = ac;
            isSelected = false;
        }
        //End
        
    }
    //End   
}