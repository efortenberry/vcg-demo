/**
 * Define a GET endpoint that attendees can ping with their name during the presentation.
 * First in gets a prize!
 *
 * Hint: relative endpoint is /services/apexrest/{urlMapping}
 * 
 * @author  Luke
 * @date    Oct 2013
 */
@RestResource(urlMapping='/hitme') 
global class APIResource_Competition {
    @HttpGet
    global static void doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        res.addHeader('Content-Type', 'application/json');
        String resBody = '';
        try {
            String firstName = req.params.get('firstname');
            String lastName = req.params.get('lastname');

            DF13_Attendee__c att = new DF13_Attendee__c(
                First_Name__c = firstName,
                Name = lastName
            );
            insert att;
            
            res.statusCode = 200;
            resBody = '{ "success": true }';
        } catch(Exception e) {
            res.statusCode = 500;
            resBody = '{ "success": false }';
        }
        res.responseBody = Blob.valueOf(resBody);
    }
}