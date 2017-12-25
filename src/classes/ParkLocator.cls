public class ParkLocator {

    public static List<String> country(String countryName) {

        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        return parks.byCountry(countryName);

    }

}