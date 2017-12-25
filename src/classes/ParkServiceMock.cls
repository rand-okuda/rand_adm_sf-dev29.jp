@isTest
global class ParkServiceMock implements WebServiceMock {

    List<String> responseList = new String[]{'Park01', 'Park02', 'Park03'};

    global void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType){
            ParkService.byCountryResponse response_x = new parkService.byCountryResponse();
            response_x.return_x = responseList;
            response.put('response_x', response_x);
        }

}