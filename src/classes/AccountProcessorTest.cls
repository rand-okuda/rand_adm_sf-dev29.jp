@isTest
public class AccountProcessorTest {

    @IsTest
    private static void test001() {

        Account a = new Account(Name = 'AccName', Match_Billing_Address__c = TRUE, BillingPostalCode = '541-0052');
        insert a;
        Integer numCont = 5;
        List<Contact> contList = RandomContactFactory.generateRandomContacts(numCont, 'ContName');
        for(Contact c :contList){
            c.AccountId = a.Id;
        }
        insert contList;

        List<Id> aIds = new List<Id>();
        aIds.add(a.Id);

        Test.startTest();
        AccountProcessor.countContacts(aIds);
        Test.stopTest();

        Account assertAcc = [SELECT Id,Number_of_Contacts__c FROM Account WHERE Id = :a.Id];
        System.assertEquals(assertAcc.Number_of_Contacts__c, numCont);

    }

}