/*
    Author:Amitava Dutta
    Created On: 06/02/2014
    Description: Business Logic class designed to handle all B/L for triggers designed
    on Contact
    
    ## Change History ##
    
    
*/

public class contactTriggerCls
{
    //global class member
    static List<Contact> cnUpdtList = new List<Contact>();
    //Utility method to update Account Owner 
    public static void doUpdateOwner(List<Contact> contList,Map<Id,String> accInfo)
    {
        if(!contList.isEmpty())
        {
            for(Contact cMain:contList)
            {
                //check whether contact's associated Account is there or not
                if(accInfo.get(cMain.ACCOUNTID) !=null)
                {
                    cMain.ACCOUNTOWNERNAME__C = accInfo.get(cMain.ACCOUNTID);
                    cnUpdtList.add(cMain);
                }
            } 
        }
        //HANDLE DML EXCEPTIONS
        Database.SaveResult[] dsList = Database.Update(cnUpdtList,false);
        //Write the error log
        for(Database.SaveResult ds:dsList)
        {
            if(!ds.IsSuccess())
            {
                System.Debug('Error Occured ...');
            }
        }
    
    }
  }