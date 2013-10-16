@RestResource(urlMapping='/jira/issue/*') 
//Endpoint is therefore https://[instance].salesforce.com/[path]/services/apexrest/jira/issue
// => https://vcgdev1-developer-edition.ap1.force.com/services/apexrest/jira/issue
global class APIResource_JIRAIssue {

    @HttpPost
    global static void postIssue() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        try {
            //System.debug(req.requestBody.toString());
            JIRAIssue newIssue = JIRAIssue.parse(req.requestBody.toString());
            
            // FeedItem post = new FeedItem();
            // post.Body = 'New Issue : ' + newIssue.issue.fields.summary + ' - ' + newIssue.issue.fields.description;
            // insert post;

            Case newCase = new Case(
                    Origin = 'Web - JIRA',
                    Status = 'New',
                    Subject = newIssue.issue.fields.summary,
                    Description = newIssue.issue.fields.description
                );
            insert newCase;

            res.statusCode = 200;
        }
        catch (Exception e) {
            //System.debug(e.getMessage());
            res.statusCode = 500;
        }
    }

    @HttpGet
    global static void simpleGet() {
        RestResponse res = RestContext.response;
        res.statusCode = 200;
    }
 
    // @IsTest
    // static void test1() {
    //     RestRequest req = new RestRequest();
    //     RestResponse res = new RestResponse();
    //     req.params.put('param1', 'test');
 
    //     RestContext.request = req;
    //     RestContext.response = res;
 
    //     JIRANewIssueHandler.doGet();
    // }
 
}