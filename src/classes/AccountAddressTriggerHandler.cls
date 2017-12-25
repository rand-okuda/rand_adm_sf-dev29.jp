public class AccountAddressTriggerHandler {

    public static void matchBillingAddressTrue(List<Account> aList){

        for(Account a :aList){

            a.BillingPostalCode = a.ShippingPostalCode;
            
        }
        
    }

}