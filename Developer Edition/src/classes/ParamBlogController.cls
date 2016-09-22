public class ParamBlogController 
{
 private ApexPages.StandardController stdCtrl {get; set;}
  
 public List<Contact> conts {get; set;}
 public String contIdChosen {get; set;}
  
 public ParamBlogController(ApexPages.StandardController std)
 {
  stdCtrl=std;
  setupContacts();
 }
  
 private void setupContacts()
 {
  conts=[select id, Name, Email, Phone from Contact where AccountId=:stdCtrl.getId()];
 }
 public PageReference delCont()
{
 Contact toDel=new Contact(id=contIdChosen);
  
 delete todel;
  
 setupContacts();
   
 return null;
}

}