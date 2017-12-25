public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer numCont, String nameCont){

        List<Contact> returnContList = new List<Contact>();

        for(Integer i=0;i<numCont;i++) {

            Contact addCont = new Contact();
            addCont.LastName = nameCont;
            addCont.FirstName = nameCont + i;
            returnContList.add(addCont);

        }

        return returnContList;

    }

}