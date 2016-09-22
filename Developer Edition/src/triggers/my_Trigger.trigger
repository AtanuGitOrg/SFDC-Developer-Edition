trigger my_Trigger on Opportunity (before Insert) {
    trigger_example.Opps_check(Trigger.New);
}