@isTest
public class AddPrimaryContactTest {

    @isTest
    static void test001() {

        String state_Abbreviation = 'CA';

        List<Account> aList = new List<Account>();
        for(Integer i=0;i<50;i++) {
            Account a = new Account(Name = 'Aname', BillingState = 'NY');
            aList.add(a);
        }
        for(Integer i=0;i<50;i++) {
            Account a = new Account(Name = 'Aname', BillingState = state_Abbreviation);
            aList.add(a);
        }
        insert aList;

        Test.startTest();
        Contact con = new Contact(LastName = 'PrimaryContact' + state_Abbreviation);
        AddPrimaryContact addPrimaryContact = new AddPrimaryContact(con, state_Abbreviation);
        System.enqueueJob(addPrimaryContact);
        Test.stopTest();

        List<Account> accsWithConts = [Select Id, BillingState, (SELECT Id FROM Contacts) from Account];
        for(Account awc :accsWithConts){
            Contact[] relatedConts = awc.Contacts;
            if(awc.BillingState == state_Abbreviation){
                System.assertEquals(relatedConts.size(), 1);
            }else{
                System.assertEquals(relatedConts.size(), 0);
            }
        }

    }

}