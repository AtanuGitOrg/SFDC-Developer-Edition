public with sharing class relRequest 
{ /*
    public Acc_PMO_BC__Release__c relObj{get;set;}    
    string sOQL = '';
    set<String> recIds = new set<String>();

    public relRequest(ApexPages.StandardController controller) 
    {
        string[] fieldNames = new string[]{'Name'};
        controller.addFields(fieldNames);
        relObj = (Acc_PMO_BC__Release__c) controller.getRecord();
        
    }
    //Gettter method to return Set Controller for returning values
    public ApexPages.StandardSetController setCon
    {
        //List<Acc_PMO_BC__Request__c reqList = new List<Acc_PMO_BC__Request__c>();
       
        get
        {
            //Get the release Id from search text
            string searchString = relObj.Name + '%' ;
            string sqlString = 'SELECT ID,FROM Acc_PMO_BC__Release__c WHERE NAME LIKE' + searchString ;
            List<Acc_pmo_BC__Release__C> relMain = new List<Acc_PMO_BC__Release__C>();
            relMain = DataBase.Query(sqlString);
           
            if(!relMain.isEmpty())
            {
                for(Acc_pmo_BC__Release__C rObj:relMain)
                {
                    recIds.add('\'' + String.valueOf(rObj.id)  + '\'' + ',' );
                }
                
            }
        
        
            sOQL += 'SELECT ID,NAME,Acc_PMO_BC__Business_Benefit__c,Acc_PMO_BC__CompletedDate__c' ; 
            sOQL += 'From Acc_PMO_BC__Request__C WHERE Acc_PMO_BC__Release__c IN' + recIds;
            
            if(Database.getQueryLocator(sOQL) !=null)
            {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(sOQL));
                //set the page Size
                setCon.setPageSize(5);
            }
            else
            {
                setCon = null;
            }
            return setCon;
            
        }
        set;
    
    }
    //Get list of related Requests
    public List<Acc_PMO_BC__Request__C> getAllRequests()
    {
        List<Acc_PMO_BC__Request__C> reqFinalList = new List<Acc_PMO_BC__Request__C>();
        if(setCon !=null)
        {
            reqFinalList = setCon.getRecords(); // Assign more than one record to final Request List
        }
        return reqFinalList;
    }
    //Pagination Section
    public boolean gethadNext()
    {
        return setCon.gethasNext();
    }
    public boolean gethasPrevious()
    {
        return setCon.getHasPrevious();
    }
    
    //Pagination Method
    public void first()
    {
        setCon.first();
    }
 */   

}