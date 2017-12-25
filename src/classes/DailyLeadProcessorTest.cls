@isTest
public class DailyLeadProcessorTest {

    @isTest
    static void test001() {

        List<Lead> leadList = new List<Lead>();
        for(Integer i=0;i<200;i++) {
            Lead l = new Lead(LastName = 'Lname', Company = 'Cname');
            leadList.add(l);
        }
        insert leadList;

        Datetime now = System.Datetime.now();
        Datetime afterTenSec = now.addSeconds(10);
        Integer second = afterTenSec.second();
        Integer minute = afterTenSec.minute();
        Integer hour = afterTenSec.hour();
        Integer day = afterTenSec.day();
        Integer month = afterTenSec.month();
        String sch = second + ' ' + minute + ' ' + hour + ' ' + day + ' ' + month + ' ?';
        
        Test.startTest();
        DailyLeadProcessor dailyLeadProcessor = new DailyLeadProcessor();
        System.schedule('DailyLeadProcessor ' + sch, sch, dailyLeadProcessor);
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