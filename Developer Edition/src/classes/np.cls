public class np{
string search;

public void setsearch(string search){
this.search = search;
}

Public string getsearch(){
return search;
}

 List<Account> acts;
    
    public List<Account> getacts(){
    return acts;
    }

public list<SelectOption> getitems(){
list<SelectOption> option = new list<SelectOption>();
option.add(new selectoption('--None--','--None--'));
for(Account a:[SELECT Name from Account Limit 10]){
option.add(new selectoption(a.Name,a.Name));
}
return option;
}

public PageReference search_now(){
    acts = (List<Account>)[FIND :search IN ALL FIELDS RETURNING Account(Name, Type, Industry)][0];
    return null;
   
    }

}