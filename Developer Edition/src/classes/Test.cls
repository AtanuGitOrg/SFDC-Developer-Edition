public class Test{
     private final Account a;
     
     public Test(ApexPages.StandardController stdController) {
        this.a = (Account)stdController.getRecord();
    }
     
     public List<selectOption> getacct(){
       List<selectOption> opt= new List<selectOption>();
      // opt.add(new selectOption('', '- None -'));
       for(Account Accounts : [SELECT Name FROM Account]){
       opt.add(new selectOption(Accounts.Name, Accounts.Name));
       }
       return opt;
        
     }
}