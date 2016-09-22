public with sharing class acremotecls {

    public acremotecls(ApexPages.StandardController controller) {

    }
    @RemoteAction
    public static Account getAccount(string AccId)
    {
        List<Account> accLists = new List<Account>();
        accLists = [SELECT ID,NAME FROM ACCOUNT WHERE ID=:AccId LIMIT 1];
        return accLists[0];
    }
    public List<Account> getAllAccounts()
    {
        List<Account> mainList = new List<Account>();
        mainList = [SELECT ID,NAME FROM ACCOUNT LIMIT 20];
        return mainList;
    }
}