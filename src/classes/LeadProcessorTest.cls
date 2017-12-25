@isTest
public class LeadProcessorTest {

    @isTest
    static void test001() {

        List<Lead> leadList = new List<Lead>();
        for(Integer i=0;i<200;i++) {
            Lead l = new Lead(LastName = 'Lname', Company = 'Cname');
            leadList.add(l);
        }
        insert leadList;

        Test.startTest();
        LeadProcessor leadProcessor = new LeadProcessor(); 
        Id batchId = Database.executeBatch(leadProcessor);
        Test.stopTest();

        Set<Id> assetLeadIds = new Set<Id>();
        for(Lead l : leadList){
            assetLeadIds.add(l.Id);
        }
        List<Lead> assetLeadList = [SELECT Id, LeadSource FROM Lead WHERE Id = :assetLeadIds];
        for(Lead assetLead : assetLeadList){
            System.assertEquals(assetLead.LeadSource , 'Dreamforce');
        }

    }

}