@isTest
public class AnimalLocatorTest {

    @isTest
    static void test001() {

        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        String assertName = AnimalLocator.getAnimalNameById(99);
        System.assertEquals(assertName, 'trailhead');

    }

}