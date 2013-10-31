/**
 * Handle incoming webhook events from Chargify relating to a billing subscription.
 * 
 * @author  Luke
 * @date    Oct 2013
 */
@RestResource(urlMapping='/subscriptionhandler') 
global class APIResource_ChargifySubscription {

    @HttpPost
    global static void handlePostWithoutAuthentication() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

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


  



        res.statusCode = 200;
    }

    


    // ************* AUTHENTICATION SECTION BEGINS  ******************** //
    
    public class ChargifyWebhookException extends Exception {}

    private static final String site = 'vcg-demo';
    private static final String api_key = 'uuZcb3H1fpVz5OhRBv7H'; //Note: for prod, should be a Custom Setting
    private static final String site_shared_key = 'x7x82snTo7lCgy7DhsI'; //Note: for prod, should be a Custom Setting

    
    private static List<ChargifyWebhook> getListFromChargify() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://' + site + '.chargify.com/webhooks.json');
        req.setMethod('GET');
        String authString = api_key + ':x';
        String encodedAuth = EncodingUtil.base64encode(Blob.valueOf(authString));
        req.setHeader('Authorization', encodedAuth);
        HttpResponse res = (new Http()).send(req);

        List<ChargifyWebhook> webhooks;
        if(res.getStatusCode() == 200) { // success
            webhooks = (List<ChargifyWebhook>)JSON.deserialize(res.getBody(), List<ChargifyWebhook>.class);
        } else {
            throw new ChargifyWebhookException('Failed to retrieve webhooks from Chargify: ' + res.getStatus());
        }

        return webhooks;
    }

    private static Map<String,ChargifyWebhook> getMapFromChargify() {
        Map<String,ChargifyWebhook> hookMap = new Map<String,ChargifyWebhook>();
        for(ChargifyWebhook hook : getListFromChargify()) {
            hookMap.put(hook.webhook.id,hook);
        }
        return hookMap;
    }

    private static boolean verifyChargifyHook(RestRequest req) {  
        ChargifyWebhook hookFromServer = getMapFromChargify().get(req.params.get('id'));
        String sigReceived = req.headers.get('X-Chargify-Webhook-Signature-Hmac-Sha-256');

        if(hookFromServer == null) {
            System.debug('Invalid - no hooks');
            return false;
        }
        if(hookFromServer.webhook.signature_hmac_sha_256 != sigReceived) {
            System.debug('Invalid - signature mismatch: Server: \"' + hookFromServer.webhook.signature_hmac_sha_256 +'\" ; Received: \"' + sigReceived + '\"');
            return false;
        }
        return true;
    }

    /*  
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
     */

}