public class AnimalLocator {

    public static String getAnimalNameById(Integer AnimalId){

        String AnimalName;

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+ AnimalId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {

            Map<String, Object> deserializeMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug('*** ' + deserializeMap);
            System.debug('*** ' + deserializeMap.get('animal'));

            Map<String, Object> animalMap = (Map<String, Object>)deserializeMap.get('animal');
            System.debug('*** ' + animalMap.get('id'));
            System.debug('*** ' + animalMap.get('name'));
            System.debug('*** ' + animalMap.get('eats'));
            System.debug('*** ' + animalMap.get('says'));

            AnimalName = String.valueOf(animalMap.get('name'));

        }

        return AnimalName;

    }

}