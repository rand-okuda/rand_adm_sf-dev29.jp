public class AccountProcessor {

    @future
    public static void countContacts(List<Id> aIds){

        List<Account> accsWithConts = [Select Id, Name, (SELECT Id FROM Contacts) from Account Where Id IN :aIds];

        for(Account awc :accsWithConts){
            Contact[] relatedConts = awc.Contacts;
            awc.Number_of_Contacts__c = relatedConts.size();
        }

        update accsWithConts;

    }

}