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
        String resBody = '';
        String event = req.params.get('event');
        if(event == 'payment_success') {
            String subscriptionId = req.params.get('payload[subscription][id]');
            Subscription__c sfSubscription = [
                SELECT Id, Name
                FROM Subscription__c
                WHERE Chargify_ID__c = :subscriptionId
            ];
            sfSubscription.Status__c = 'Inactive';
            update sfSubscription;
        }
    }
}