trigger T1 on Account (before Insert, Before Update) {
    for(Account a: Trigger.New)
    if(a.Industry =='Energy' && Trigger.isInsert){
        a.addError('There are too many records with Energy Industry. Please choose a different Industry');
    }
    else if(Trigger.isUpdate){
    for(Account a1: Trigger.old)
        if(a1.Industry=='Consulting'){
        a.addError('No records can be updated from Consulting');
    }
    }
}