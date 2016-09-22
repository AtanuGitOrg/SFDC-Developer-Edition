Public Class BookExampleForTrigger{
 Public Static Void Discount(Book__c[] bCol)
 {
     for(Book__c b:bcol)
     {
         b.AfterDiscountPrice__c = b.Price__c*0.9;
     }
 }
}