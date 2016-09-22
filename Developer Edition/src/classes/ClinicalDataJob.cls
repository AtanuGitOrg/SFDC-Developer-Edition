global class ClinicalDataJob
{
    global void start()
    {
        ClinicalDataPopulator cp = new ClinicalDataPopulator();
        Datetime sysTime = System.now().addMinutes(5);
        String chronExpression = '0 10 12 *';
        System.schedule('ClinicalDataLoaderJob','0 0 * 1/1 * ? *',new ClinicalDataPopulator());
    }
}