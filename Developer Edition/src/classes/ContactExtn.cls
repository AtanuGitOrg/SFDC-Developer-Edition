Public class ContactExtn {

    public ContactExtn(ApexPages.StandardController controller) {

    }
    
        Public String cid;    
        Public string selectedEMs{get;set;}                                           // Stroes Campaign Id
        Public List<cContact> contactList {get; set;}                                 // Wrapper class which stores contact data and a boolean flag.
        public Boolean selectAllCheckbox {get; set;}                                  // Stores checkbox data.
        public boolean errormsg=false;                                                // Error msg. When no contact has been selected.
        String userinput;                                                             // Contact Email
        String userinp; 
        Public List<Contact> cl{get;set;}  
        Public List<String> emId {get;set;}                                                           // Contact Name
        
        Public boolean displayboxes;
        
        Public List<Contact> results = new List<Contact>();                                     // Contact search results.
        Public List<Contact> selectedContactsstep2 = new List<Contact>();             // Selcted Contacts
        
        
        /* End of Variable declarations */
        
        /* Getter and setter methods for getting the user input ie. Contact name and email from the UI */
        
        public String getuserinput(){return userinput;}
        public void setuserinput(String userinp){this.userinput=userinp;}
        public String getuserinp(){return userinp;}
        public void setuserinp(String userinp){this.userinp=userinp;}
        
        
        /*End of Getter and Setter methods */
        
        
        
        /* Method to Search the contact database to fetch the query results */
        public List<Contact> contactsearch()
        {
             displayPopup = true;
             errormsg=false;
             contactList = new List<cContact>();
             for(Contact c : [select Account.Name,Name,FirstName,LastName,Email,title,Id,Phone from Contact Limit 1000])
             {
                 contactList.add(new cContact(c));
             }
        
         return null;
        }
        /* End of method */
        
        
         public boolean displayPopup {get; set;}     
    
         public void closePopup() {        
                displayPopup = false;    
         }     
         public void showPopup() {        
                displayPopup = true;    
         }
        
        
        /* Method for returning the contact search results to the UI */
        public List<cContact> getresults()
        {
         contactList = new List<cContact>();
         for(Contact c : [select Account.Name,Name,FirstName,LastName,Email,title,Id,Phone from Contact Limit 1000])
          {
              contactList.add(new cContact(c));
          }
         return contactList;
        
        }
        /* End of Method */
        
        public List<Contact> getmainresults()
        {
         List<String> parts;
         system.debug('--Id--'+selectedEMs);
         if(!string.isblank(selectedEMs))
         parts = selectedEMs.split(';');
         system.debug('parts -->'+parts);
         if(parts!=null)
         cl =[Select id, name,FirstName,LastName,Account.Name,Title,Phone from contact where Id IN: parts];
         return cl;
        
        }
        
        /* Wrapper class to contain contact record and a boolean flag */
        public class cContact
        {
         public Contact con {get; set;}
         public Boolean selected {get; set;}
        
         /*This is the contructor method. When we create a new cContact object we pass a
         Contact that is set to the con property. We also set the selected value to false*/
         public cContact(Contact c)
         {
             con = c;
             selected = false;
         }
        }
        /* end of Wrapper class */
        
        
        /* Method to fetch the selected records and send email to them */
        
        Public void processSelected()
        {
        getmainresults();
         system.debug('--In Process Slected Method--');
          List<Contact> selectedContacts = new List<Contact>();
          if (contactList!= null)
          {
             for(cContact cCon : getresults()){
                if(cCon.selected == true){
                     selectedContacts.add(cCon.con);
                    system.debug('in block'); 
                 }
             }
             system.debug('--selected rec0--'+selectedContacts);
          //  List<Contact> cl = [select Id, Name, Fisrt
             selectedContactsstep2=selectedContacts;
             system.debug('--selected rec1--'+selectedContactsstep2);
          }
         /* return error message if no contact is selected */
         if (selectedcontacts.size()==0)
         {
             errormsg=true;
           //  return null;
         }
         else
         {
             errormsg=false;
             String id=System.currentpagereference().getparameters().get('id');
             Pagereference p=new Pagereference ('/apex/MassEmailFromCampaignStep2');
             
             
           //  return p;
         }
        // cl =[Select id, name,Account.Name,Title from contact where Id =: selectedEMs];
         
        system.debug('--selected rec2--'+cl + '---'+selectedEMs);
        }
        public List<SelectOption> getItems()
        {
         List<SelectOption> options = new List<SelectOption>();
         options.add(new SelectOption('YES','YES'));
         options.add(new SelectOption('NO','NO'));
         return options;
        }
        
        
        /* return error message if no contact is selected */
        public boolean geterrormsg()
        {
         return errormsg;
        }
        
        
        /* Method to cancel the entire process */
        public Pagereference Cancel()
        {
                Pagereference p =new Pagereference('/'+cid);
                return p;
        }
               
        
        
        
}