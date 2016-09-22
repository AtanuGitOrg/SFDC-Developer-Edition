Public class picklist{

    public String Account { get; set; }
 
     public string search {get;set;}
     public string selectedAccount{get;set;}
     List<Account> Acts = new List<Account>();
     
     Public List<Account> getActs(){
     Return Acts;
     } 
 
  Public List<SelectOption> getoption()
  {
  List<SelectOption> Opt= new List<SelectOption>();
  opt.add(new selectoption('','--None--'));
  for( Account a:[Select Name from Account Limit 10])
   {
   opt.add(new selectOption(a.ID,a.Name));
   }
   return opt;
  }
  
  Public pagereference Search()
  {
  System.debug(ApexPages.currentPage().getParameters().get('Pick'));
  If(ApexPages.currentPage().getParameters().get('Pick')!=null)
  {
  selectedAccount = ApexPages.currentPage().getParameters().get('Pick');
  Acts = (List<Account>)[FIND:selectedAccount in all fields returning Account(Name,Type,Industry)][0];
  
  }
  return null;
  }
}