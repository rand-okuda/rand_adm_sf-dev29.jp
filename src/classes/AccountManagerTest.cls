@IsTest
private class AccountManagerTest {

    @isTest
    static void test001() {

        Account acc = new Account(Name = 'TEST001');
        insert acc;
        Contact cont = new Contact(LastName = 'TEST001', AccountId = acc.Id);
        insert cont;

        RestRequest request = new RestRequest();
        request.requestUri = 'https://ap5.salesforce.com/services/apexrest/Accounts/' + acc.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        Account assertAcc = AccountManager.getAccount();

        System.assert(assertAcc != null);

    }

}