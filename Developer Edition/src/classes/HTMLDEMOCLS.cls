public class HTMLDEMOCLS
{
    public string inputData{get;set;}
    public string outputData{get;set;}
    public HTMLDEMOCLS()
    {
    
    }
    public void doGenerate()
    {
        HTMLCONVERTER.inputString = inputData;
        outputData = HTMLCONVERTER.GenerateTextFromHtml();
    }
   
}