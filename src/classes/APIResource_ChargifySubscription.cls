/**
 * Handle incoming webhook events from Chargify relating to a billing subscription.
 * 
 * @author  Luke
 * @date    Oct 2013
 */
@RestResource(urlMapping='/subscriptionhandler/*') 
global class APIResource_ChargifySubscription {
    @HttpPost
    global static void handlePost() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        // Verify body:
        String sigReceived = req.headers.get('X-Chargify-Webhook-Signature-Hmac-Sha-256');
        String key = 'x7x82snTo7lCgy7DhsI';
        Blob sigCalculated = Crypto.generateMac('hmacSHA256', req.requestBody, Blob.valueOf(key));

        System.debug('## Request body raw: ' + req.requestBody.toString());
        System.debug('## Request URI: ' + req.requestURI);
        // System.debug('## Params: ' + req.params);
        System.debug('## Signature from Chargify: ' + sigReceived);
        System.debug('## Site key: ' + key);
        System.debug('## Calculated signature: ' + EncodingUtil.convertToHex(sigCalculated));

        // if(true || sigReceived == EncodingUtil.convertToHex(sigCalculated)) {
        //     String resBody = '';
        //     // String event = req.params.get('event');
        //     if(event == 'payment_failure') {
        //         // String subscriptionId = req.params.get('payload[subscription][id]');
        //         Subscription__c sfSubscription = [
        //             SELECT Id, Name
        //             FROM Subscription__c
        //             WHERE Chargify_ID__c = :subscriptionId
        //         ];
        //         sfSubscription.Status__c = 'Inactive';
        //         update sfSubscription;
        //     }
        // } 
    }


}