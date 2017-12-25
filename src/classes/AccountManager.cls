@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String accId = request.requestURI.replace('/contacts', '').substring(request.requestURI.replace('/contacts', '').lastIndexOf('/')+1);
        System.debug('*** '+ request.requestURI);
        System.debug('*** '+ accId);
        Account result = [SELECT Id, Name, (SELECT Id, Name FROM contacts) FROM Account WHERE Id = :accId];
        return result;
    }

}