global class LeadProcessor implements Database.Batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, LeadSource from Lead');
    }

    global void execute(Database.BatchableContext bc, List<Lead> Scope){
        for(Lead l : Scope){
            l.LeadSource = 'Dreamforce';
        }
        update Scope;
    }    

    global void finish(Database.BatchableContext bc){
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems
                            FROM AsyncApexJob
                            WHERE Id = :bc.getJobId()];
        System.debug('***' + job);
    }   

}