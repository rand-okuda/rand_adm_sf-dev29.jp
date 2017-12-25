global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {

        List<Lead> leadList = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
        for(Lead l : leadList){
            l.LeadSource = 'Dreamforce';
        }
        update leadList;

    }

}