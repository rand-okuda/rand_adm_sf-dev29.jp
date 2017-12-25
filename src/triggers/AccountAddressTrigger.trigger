trigger AccountAddressTrigger on Account (before insert, before update) {

    if(Trigger.isInsert && Trigger.isBefore || Trigger.isUpdate && Trigger.isBefore){

        List<Account> aList = new List<Account>();
        
        for(Account a : Trigger.New){
            if (a.BillingPostalCode != NULL && a.ShippingPostalCode == NULL && a.Match_Billing_Address__c == TRUE){
                aList.add(a);
            }
        }

        AccountAddressTriggerHandler.matchBillingAddressTrue(aList);

    }

}