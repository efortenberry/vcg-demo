/**
 * Handle incoming webhook events from JIRA relating to issues.
 * Reachable via: https://vcgdev1-developer-edition.ap1.force.com/services/apexrest/jira/issue
 * 
 * @author  James
 * @date    Oct 2013
 */
@RestResource(urlMapping='/jira/issue/*') 
global class APIResource_JIRAIssue {

    @HttpPost
    global static void postIssue() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        try {
            JIRAIssue newIssue = JIRAIssue.parse(req.requestBody.toString());

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
 
 
}