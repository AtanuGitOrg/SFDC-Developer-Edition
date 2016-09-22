public with sharing class MyConverter 
{
    public string myInput{get;set;}
    public string myOutPut{get;set;}
    public MyConverter()
    {
        
        
    }
    public void doGenerate()
    {
        HTMLCONVERTER.inputString = myInput;
        myOutPut = HTMLCONVERTER.GenerateTextFromHtml();
        System.Debug('Output:' + ' ' + myOutPut);
    }
}