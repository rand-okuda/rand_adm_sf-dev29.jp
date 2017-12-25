@isTest
public class ParkLocatorTest {
    @isTest
    static void test001() {

        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        List<String> parkList;
        parkList = ParkLocator.country('Japan');

        System.assertEquals(parkList[0], 'Park01');
        System.assertEquals(parkList[1], 'Park02');
        System.assertEquals(parkList[2], 'Park03');

    }
}