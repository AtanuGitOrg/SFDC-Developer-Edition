public class exceptionHandlingCls
{
    public exceptionHandlingCls()
    {
        List<Account> acList ;
        List<Account> acList1 = new List<Account>();
        acList1 = [SELECT ID FROM ACCOUNT WHERE ID=:ApexPages.currentPage().getParameters().get('id')];
        
     
    }

}