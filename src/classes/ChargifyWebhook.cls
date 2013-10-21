/**
 * Represent a Chargify webhook retrieve by the API.
 *
 * @author  Luke
 * @date    Oct 2013
 */
public with sharing class ChargifyWebhook {
    public class webhook {
        public String last_error_at;
        public String accepted_at;
        public String last_sent_at;
        public String created_at;
        public String body;
        public String signature;
        public Boolean successful;
        public String last_error;
        public String id;
        public String event;
        public String last_sent_url;
    }
}