@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    
    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setBody('{"animal":{"id":99,"name":"trailhead","eats":"burritos","says":"more badgers"}}');
        response.setStatusCode(200);
        return response; 
    }
    
}