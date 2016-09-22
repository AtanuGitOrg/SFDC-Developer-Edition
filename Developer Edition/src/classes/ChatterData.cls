public class ChatterData
{
    public string outPutVal{get;set;}
    public void populate()
    {
        List<ChatterActivity> caList = new List<ChatterActivity>();
        caList = [SELECT ID FROM CHATTERACTIVITY LIMIT 1];
        if(caList.size() > 0)
        {
            outPutVal = caList[0].Id;
        }
        
    }
}