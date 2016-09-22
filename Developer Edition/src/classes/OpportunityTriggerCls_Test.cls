/*
    Author:Atanu Shaw
    Date: 01/14/2014
    Description: Test Class Preparation For Opportunity Trigger
    
*/
@IsTest(seeAllData = true)
public class OpportunityTriggerCls_Test
{
    //Variable Section
    public static Opportunity op1 = null;
    public static Opportunity op2 = null;
    public static string adminProfileId = '';
    public static List<Opportunity> opList = new List<Opportunity>();
    public static List<Opportunity> opList1 = new List<Opportunity>();
    
    //end
    //utility method
    public static void createDummyData()
    {
        //create first opportunity List
        for(integer x=0;x<10;x++)
        {
            op1 = new Opportunity();
            op1.name = 'test1' + String.valueOf(x);
            //op1.startdate = system.today(); // Returns current date
            op1.closedate = System.today().addDays(15); // addDays / addMonths / addYears etc adds
            // days / months / years to your current data
            op1.stagename = 'Prospective';
            op1.Type = 'New Customer';
            opList.add(op1);
        }
        //Create second opportunity List
        for(integer y=0;y<10;y++)
        {
            op2 = new Opportunity();
            op2.Name = 'Opp' + String.valueOf(y);
            //op2.startdate = system.today();
            op2.closedate = system.today().addDays(15);
            op2.stagename ='Prospective';
            op2.type = 'Other';
            opList1.add(op2);
        }
    
    }
    //Test Method
    public static testMethod void doTestData()
    {
        //starting testing
      //  test.startTest();
            List<Profile> profList = [SELECT ID FROM PROFILE WHERE NAME='SYSTEM ADMINISTRATOR' LIMIT 1];
            adminProfileId = profList[0].Id;
            createDummyData();
            insert opList;
            insert opList1;
            
            //Update existing record
            for(Opportunity opMain:opList)
            {
                opMain.Type = 'Other';
            }
            update opList;
            for(Opportunity opNon: opList1)
            {
                opNon.Type = 'New Customer';
            }
            update opList1;
        
     //   test.stopTest();
    
    }

}