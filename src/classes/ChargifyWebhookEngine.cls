/**
 * Retrieve list of webhooks that have been sent from Chargify via the 
 * API.
 *
 * Chargify doc:
 * http://docs.chargify.com/api-webhooks
 * 
 * @author  Luke
 * @date    Oct 2013
 */
public with sharing class ChargifyWebhookEngine {
    public class ChargifyWebhookEngine_Exception extends Exception {}

    private static final String site = 'vcg-demo';
    private static final String key = 'uuZcb3H1fpVz5OhRBv7H';

    public static List<ChargifyWebhook> getList() {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://' + ChargifyWebhookEngine.site + '.chargify.com/webhooks.json');
        req.setMethod('GET');
        String authString = ChargifyWebhookEngine.key + ':x';
        String encodedAuth = EncodingUtil.base64encode(Blob.valueOf(authString));
        req.setHeader('Authorization', encodedAuth);
        HttpResponse res = (new Http()).send(req);

        List<ChargifyWebhook> webhooks;
        if(res.getStatusCode() == 200) { // success
            webhooks = (List<ChargifyWebhook>)JSON.deserialize(res.getBody(), List<ChargifyWebhook>.class);
        } else {
            throw new ChargifyWebhookEngine_Exception('Failed to retrieve webhooks from Chargify: ' + res.getStatus());
        }

        return webhooks;
    }
}