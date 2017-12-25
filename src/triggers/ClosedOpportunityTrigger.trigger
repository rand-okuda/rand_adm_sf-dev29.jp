trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    if(Trigger.isInsert && Trigger.isAfter || Trigger.isUpdate && Trigger.isAfter){

        List<Opportunity> oppList = new List<Opportunity>();

        for(Opportunity opp : Trigger.New){

            if(opp.StageName == 'Closed Won'){

                oppList.add(opp);

            }

        }

        ClosedOpportunityTriggerHandler.createFollowUpTask(oppList);

    }

}