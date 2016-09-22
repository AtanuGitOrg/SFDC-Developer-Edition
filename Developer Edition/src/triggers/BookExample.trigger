trigger BookExample on Book__c (before insert) {
    
    Book__c[] books = Trigger.new;
    BookExampleForTrigger.Discount(books);

}