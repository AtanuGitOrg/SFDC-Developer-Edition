/*
  AUTHOR:Atanu Shaw
  DATE: 01/20/2014
  DESCRIPTION: TEST CLASS FOR CONTROLLER CLASS
 
  
*/
@isTest
public class LeadGeneratorClsTest
{
    static Lead lNew = new Lead();
    static List<Lead> mainList = new List<Lead>();
    //test data creation
    public static void doCreateTestData()
    {
        //Create Lead
        
        for(integer x=0;x<15;x++)
        {
        lNew = new lead(FIRSTNAME='FETO',LASTNAME='TREST',COMPANY='TRIST',
        status = 'Open - Not Contacted');
        mainList.add(lNew);
        }
        
    }
    //end
    
    //test method
    public static testMethod void doTest()
    {
   //     test.startTest();
        doCreateTestData();
        insert mainList;
        ApexPages.StandardController scon = new ApexPages.StandardController(lnew);
        LeadGenerator lgen = new LeadGenerator(scon);
        List<LeadGenerator.LeadWrapper> leadlist = new List<LeadGenerator.LeadWrapper>();
        leadList = lgen.getLeadList();
        boolean bl = lgen.hasPrevious;
        boolean bln = lgen.hasNext;
        lgen.next();
        lgen.first();
        lgen.last();
        lgen.previous();
        for(LeadGenerator.LeadWrapper lw:leadList)
        {
            lw.IsSelected = true;
        } 
        lgen.doSelect();
        
    //    test.stopTest();
    
    }

    //end

}