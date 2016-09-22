public class Example1{

    public Example1() {

    }


    public Example1(ApexPages.StandardSetController controller) {

    }


    public Example1(ApexPages.StandardController controller) {

    }

    String search_string;
    List<Account> acts = new List<Account>();
    
    public List<Account> getacts(){
    return acts;
    }
    
    public String getsearch_string(){
    return search_string;
    }
    
    public void setsearch_string(String str){
    search_string = str;
    }
    
    public PageReference search_now(){
    if(search_string.length()>0){
    acts = (List<Account>)[FIND :search_string IN ALL FIELDS RETURNING Account(ID,Name, Type, Industry, Phone, Fax)][0];
    }
    return null;
    
   
    }
}