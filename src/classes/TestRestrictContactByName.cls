@isTest
public class TestRestrictContactByName {

    @isTest
    static void test001() {

        Contact c = new Contact();
        c.LastName = 'INVALIDNAME';

        try{

            insert c;

        }catch (System.DmlException e){

            for (Integer i = 0; i < e.getNumDml(); i++) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getDmlMessage(i)));
                System.assertEquals(e.getDmlMessage(i), 'The Last Name "'+c.LastName+'" is not allowed for DML');
            }            

        }

    }

}