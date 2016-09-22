@isTest
public class htmlModifier {

    
    public static string myDescription{get;set;}
    public static string plainText{get;set;}
    public static testMethod void testgenerate() 
    {
 //     Test.StartTest();
       myDescription = '<P>This is Test</p>';
       HTMLCONVERTER.inputString = myDescription;
       plainText = HTMLCONVERTER.GenerateTextFromHtml();
  //     Test.StopTest();
    }


    
   
     
    

}