/**
 * Handle incoming webhook events from Chargify relating to a billing subscription.
 * 
 * @author  Luke
 * @date    Oct 2013
 */
@RestResource(urlMapping='/subscriptionhandler') 
global class APIResource_ChargifySubscription {

    // @HttpPost
    // global static void handlePostWithoutAuthentication() {
    //     RestRequest req = RestContext.request;
    //     RestResponse res = RestContext.response;

    //     String event = req.params.get('event');
    //     if(event == 'payment_failure') {
    //         String subscriptionId = req.params.get('payload[subscription][id]');
    //         Subscription__c sfSubscription = [
    //             SELECT Id, Name
    //             FROM Subscription__c
    //             WHERE Chargify_ID__c = :subscriptionId
    //         ];
    //         sfSubscription.Status__c = 'Inactive';
    //         update sfSubscription;
    //     }
    //     res.statusCode = 200;
        
    // }

      
    @HttpPost
    global static void handlePostWithAuthentication() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        if(verifyChargifyHook(req)) {

            // ********** ORIGINAL WORK BEGINS ************ //
            String event = req.params.get('event');
            if(event == 'payment_failure') {
                String subscriptionId = req.params.get('payload[subscription][id]');
                Subscription__c sfSubscription = [
                    SELECT Id, Name
                    FROM Subscription__c
                    WHERE Chargify_ID__c = :subscriptionId
                ];
                sfSubscription.Status__c = 'Inactive';
                update sfSubscription;
            }
            // ********** ORIGINAL WORK ENDS ************** //

            res.statusCode = 200; //Accepted
        }
        else {
            res.statusCode = 401;//Unauthorized
        }
    }
     



    // ************* AUTHENTICATION SECTION BEGINS  ******************** //
    
    public class ChargifyWebhookException extends Exception {}

    private static final String site = 'vcg-demo';
    private static final String api_key = 'uuZcb3H1fpVz5OhRBv7H'; //Note: for prod, should be a Custom Setting
    private static final String site_shared_key = 'x7x82snTo7lCgy7DhsI'; //Note: for prod, should be a Custom Setting


    private static boolean verifyChargifyHook(RestRequest req) {  
        String sigReceived = req.headers.get('X-Chargify-Webhook-Signature-Hmac-Sha-256');

        ChargifyBody bodyObj = new ChargifyBody(req.params);
        
        String calcSignature = bodyObj.calculateSignature(site_shared_key);

        if(calcSignature != sigReceived) {
            System.debug('Invalid - signature mismatch: Calculated: \"' + calcSignature +'\" ; Received: \"' + sigReceived + '\"');
            return false;
        }
        return true;
    }

    

}