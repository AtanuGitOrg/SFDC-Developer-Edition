public class c5{
    public c5(ApexPages.standardcontroller con){}
    
    List<Campaign> campaigns = [select Name from Campaign];
    
    public List<Campaign> getcampaigns(){
    return campaigns;
    }
}