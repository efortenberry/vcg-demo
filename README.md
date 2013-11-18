#Vertigo Consulting Group

This repo contains code used for live demo in the presentation "Integrating with Force.com using Webhook Handlers" presented at Dreamforce 2013 by Luke McFarlane & James Hill.

Demonstrates basic intregration with Chargify & JIRA via webhook handlers built using Apex REST in Force.com.

## The Entire Process

### In Picture Form

![The Entire Webhooks Process](images/DF13_Webhooks_Process.png "Diagram of the Entire Webhooks Process")

### In Words

#### Set up a Force.com Site

Follow the instructions at http://wiki.developerforce.com/page/An_Introduction_to_Force.com_Sites, customising as desired, until you reach "Assigning a Visualforce Page", at which point you should stop and ensure you have activated your Force.com Site.

#### Create the endpoint for the external service to call with webhooks

Create a new Apex Class for your resource, named `APIResource_[YourResourceName]`. For example, if we want an external service to be able to send JIRA Issues to us, we could call the class `APIResource_JIRAIssue`.

Copy the following stub class in, and note carefully the explanations in the comments

~~~ java
    //Fill in the RestResource urlMapping with the desired path to your endpoint
    // In this example, the endpoint will be 
    //  https://[your-force-sitename].force.com/services/apexrest/jira/issue
    @RestResource(urlMapping='/path/to/endpoint/*') 
    global class APIResource_YourResourceName {

        //When designing an API, a given endpoint can respond to these http 
        // request methods (there are others, which salesforce REST does not
        // support). They are indicated in Apex with the @Http[Method] 
        // annotation, where [Method] is one of the following.
        //  - DELETE    : used for deleting an item at the specified endpoint
        //  - POST      : used for creating a new item at the endpoint
        //  - PUT       : used to create OR modify an item (essentially upsert)        
        //  - PATCH     : modify an item
        //  - GET       : retrieve an item
        //
        //NOTE: There can only be one of each of these annotations per endpoint
        //
        //Here we're annotating our class as consuming HTTP POST requests,
        // indicating that we will create something in Salesforce from the 
        // payload sent.
        @HttpPost
        global static void postIssue() {
            //The RestRequest object contains useful information about the
            // request received from the outside world
            RestRequest req = RestContext.request;

            //The RestResponse object encapsulates your response to the outside
            // world. You don't need to explicitly return it, just modify it as
            // appropriate
            RestResponse res = RestContext.response;

            //As a general rule, if something unexpected could go wrong (which
            // can always happen), then you need to return an appropriate error
            // code. The catch-all returns a 500 error code; you could make
            // other branches that return more specific error codes
            try {
                
                res.statusCode = 200;
            }
            catch (Exception e) {
                
                res.statusCode = 500;
            }
        }
     
    }
~~~



