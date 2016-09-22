@isTest
public class HTMLDEMOCLS_Test
{
    static HTMLDEMOCLS hdc = new HTMLDEMOCLS();
    public static testMethod void doTest()
    {
       hdc.inputData = '<p>THIS IS TEST</p>';
       hdc.doGenerate();
    }

}