public class ClosedOpportunityTriggerHandler {

    public static void createFollowUpTask(List<Opportunity> oppList){

        List<Task> tList = new List<Task>();

        for(Opportunity opp : oppList){

            Task addTask = new Task();
            addTask.WhatId = opp.Id;
            addTask.Subject = 'Follow Up Test Task';
            tList.add(addTask);

        }

        if(tList.size() > 0){

            insert tList;

        }

    }

}