public class AddPrimaryContact implements Queueable {

    private Contact cont;
    private String state_Abbreviation;

    public AddPrimaryContact(Contact cont, String state_Abbreviation){
        this.cont = cont;
        this.state_Abbreviation = state_Abbreviation;
    }

    public void execute(QueueableContext context) {
        List<Contact> contList = new List<Contact>();
        List<Account> aList = [SELECT Id, BillingState FROM Account WHERE BillingState = :state_Abbreviation LIMIT 200];
        for(Account a : aList){
            Contact clonedCont = cont.clone(false, true, false, false);
            clonedCont.AccountId = a.Id;
            contList.add(clonedCont);
        }
        insert contList;
    }

}