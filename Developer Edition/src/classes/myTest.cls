@isTest
public class myTest
{
    public static testMethod void createData()
    {
        DATACREATOR.creatObjectDataWithAllButNoRelationship('Account',2);
        DATACREATOR.creatObjectData('Account',2);
        DATACREATOR.creatObjectDataWithAll('Contact',2);
        
    }
    
    

}