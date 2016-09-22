Public Class ReportClass{
public Opportunity[] getOpportunityList() {
Opportunity[] opps = [SELECT 
name, 
account.name, 
amount, 
owner.name 
FROM 
Opportunity 
LIMIT 5
];
return opps;
}
 

public pageReference generateReport() {
return Page.secondPage;
}
}