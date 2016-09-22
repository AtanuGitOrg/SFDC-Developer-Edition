trigger NoDeleteonTask on Task (before delete)
{
   String ProfileId = UserInfo.getProfileId();  
   List<Profile> profiles=[select id from Profile where name='SA_Clone'];

   if (1!=profiles.size())
   {
      // unable to get the profiles - handle error
   }
   else
   {
       for (Task a : Trigger.old)      
       {            
          if(profileId==profiles[0].id)
          {
             a.addError('You cannot delete this record');
          }
       }            
   }
}