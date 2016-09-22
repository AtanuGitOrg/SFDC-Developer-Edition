public with sharing class release_management 
{ /*
    //Variable
    public Acc_PMO_BC__Release__c relObj{get;set;} // direct initialization of variable
    public ApexPages.StandardController sCon;
    public string selectedId = ''; // initialization with null
    public boolean blShow{get;set;} // direct initialization of variable
    public boolean blShowBelow{get;set;}
    public List<Acc_PMO_BC__Release__c> relList = new List<Acc_PMO_BC__Release__c>();
    public static boolean forTest = false;
    //End

    //Class constructor
    public release_management(ApexPages.StandardController madhavi) 
    {
        //Initialize Standard Controller class
        //by passing the SOBJECT NAME as parameter for constructor
        
        sCon = madhavi;
        
        //Add the field collection for the Standard Controller to bind
        //all fields from release object which is being used as standard
        //controller 
        string[] fieldNames = new string[]{'Name','Acc_PMO_BC__Release_Start_Date__c',
        'Acc_PMO_BC__Release_Actual_End_Date__c'};
        if(forTest == false) // If not called from test class
        {
            sCon.addFields(fieldNames); // Adding the field collection to the Controller
        }
        
        //to refer these fields to the vf page via controller.getRecord()
        //method
        
        relObj = (Acc_PMO_BC__Release__c) sCon.getRecord(); // Converting the 
        if(forTest == true) // If called from test method
        {
            relObj.Name = null;
            relObj.Acc_PMO_BC__Release_Start_Date__C = null;
            relObj.Acc_PMO_BC__Release_Actual_End_Date__C = null;
            
            
            
        }
        
        //the sCon as Release Object variable
        blShow = true;
        blShowBelow = false;
                
    }
   
    // Utility methods
    //Populate all releases
    public List<Acc_PMO_BC__Release__c> getAllReleases()
    {
        relList = [SELECT ID,NAME,
        Acc_PMO_BC__Release_Start_Date__c,
        Acc_PMO_BC__Release_Actual_End_Date__c
        from Acc_PMO_BC__Release__c];
        
        return relList;
    }
    //Utility Method to create new Release
    public PageReference doCreate()
    {
        //USE DML Statemnt 
        //to create the new Release Record
        if(relObj !=null)
        {
            insert relObj;
        }
        //call below methods for visibility control
        return new PageReference('/' + relObj.Id);
    }
    
    public void doCreateRelease()
    {
        insert relObj;
        showPanel('list');
    }
    
    public void showPanel(string mode)
    {
        if(mode == 'new')
        {
            blShow = true;
            blShowBelow = false;
        }
        else
        {
            blShow = false;
            blShowBelow = true;
        }
    }
    //Utility method to display new Release pane
    public void createNewRelease()
    {
        showPanel('new');
        relObj.Name = null;
        relObj.Acc_PMO_BC__Release_Start_Date__c = null;
        relObj.Acc_PMO_BC__Release_Actual_End_Date__c = null;
    }
    //Utility method to create new Release and redirect user to same page
    public PageReference doSaveAndNew()
    {
        PageReference pg = null;
        if(relObj !=null)
        {
            insert relObj;
        }
        pg = ApexPages.currentPage(); // Get the reference for the current page
        pg.setRedirect(true); // Redirect the user to the current page
        return pg;
        
        
    }
    //Utility Method to cancel editing and display the All releases section
    public void doCancel()
    {
        showPanel('list');
    }
    
    //Test Method
    
    public static testMethod void dotTest()
    {
        test.startTest();
        //Create test release record
        Acc_PMO_BC__Release__c relTestObj = new Acc_PMO_BC__Release__c();
        relTestObj.Name = 'RELTEST1';
        relTestObj.Acc_PMO_BC__Release_Start_Date__c = System.Today().addDays(-10);
        relTestObj.Acc_PMO_BC__Release_Actual_End_Date__c = system.today();
        //insert relTestObj;
        //create controller to refer Release Object as standard controller
        ApexPages.StandardController controller = new ApexPages.StandardController(relTestObj);
        
        //Main Class is initialized
        forTest = true;
        
        release_management rm = new release_management(controller);
        
        
        //Now call each methods
        List<Acc_PMO_BC__Release__c> releaseList = rm.getAllReleases();
        //do Create
         
        rm.doCreateRelease();
        rm.CreateNewRelease();
        rm.doCancel();
            
        //do Create 1
        rm.doSaveAndNew();
        
        
        
        
        
        
        
        //end
        test.stopTest();
    
    } 
    
  */  

}