global class ClinicalDataPopulator implements schedulable
{
    
    global void execute(SchedulableContext sc)
    {
        clinicalTrial cl = new ClinicalTrial();
        cl.Operate();
        
    }
}