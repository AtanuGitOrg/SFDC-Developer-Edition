@isTest
 public class DataCreatorClsTest
 {
     static DataCreatorCls dcs = new DataCreatorCls();
     public static testMethod  void doTestCreate()
     {
        // test.StartTest();
         
         dcs.getinitObjNames();
         dcs.selectedObjects = 'Account';
         dcs.totRecords = 10;
         dcs.doCreate();
        // test.StopTest();
     }
 }