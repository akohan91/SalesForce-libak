@RestResource(urlMapping='/*')
global without sharing class Libak_RestService {
    
    /********************************************************************************************************
     *                                      HANDLERS
    ********************************************************************************************************/

    @HttpGet 
    global static void handleGet() { handleRequest(); }
    @HttpPost 
    global static void handlePost() { handleRequest(); }
    @HttpPut 
    global static void handlePut() { handleRequest(); }
    @HttpPatch 
    global static void handlePatch() { handleRequest(); }
    @HttpDelete 
    global static void handleDelete() { handleRequest(); }


    /********************************************************************************************************
     *                                      PROCESS
    ********************************************************************************************************/

    public static void handleRequest() {
        try {
            String httpMethod = RestContext.request.httpMethod.toLowerCase();
            String requestURI = RestContext.request.requestURI;
            String processorName = requestURI.toLowerCase().substringAfter('/').replaceAll('/', '');
            Libak_Processor processor = Libak_ProcessorFactory.getInstance(processorName);

            Libak_RestRequest req;
            if (RestContext.request.requestBody == null || String.isBlank(RestContext.request.requestBody.toString())) {
                req = new Libak_RestRequest();
            } else {
                req = new Libak_RestRequest(RestContext.request.requestBody.toString());
            }
            if (RestContext.request.params != null) {
                req.params.putAll(RestContext.request.params);
            }
            if (RestContext.request.headers != null) {
                req.headers.putAll(RestContext.request.headers);
            }
            req.httpMethod = httpMethod;

            Libak_RestResponse resp = (Libak_RestResponse) processor.process(JSON.serialize(req));

            if (resp.headers != null && resp.headers.size() > 0) {
                for (String key : resp.headers.keySet()) {
                    RestContext.response.addHeader(key, resp.headers.get(key));
                }
            } else {
                jsonResponse();
            }
            setStatusCode(resp.statusCode);
            RestContext.response.responseBody = Blob.valueOf(JSON.serialize(new Libak_Response(resp.data, resp.message)));
        } catch (Exception err) {
            jsonResponse();
            RestContext.response.statusCode = 400;
            RestContext.response.responseBody = Blob.valueOf(JSON.serialize(new Libak_Response(err)));
        }
    }

    /********************************************************************************************************
     *                                      PRIVATE METHODS
    ********************************************************************************************************/
    
    /**
     * Adds 'Content-Type':'application/json' header
     */
    private static void jsonResponse() {
        RestContext.response.addHeader('Content-Type', 'application/json');
    }

    private static void setStatusCode(Integer statusCode) {
        RestContext.response.statusCode = statusCode != null ? statusCode : 200;
    }

    /********************************************************************************************************
     *                                      CLASSES
    ********************************************************************************************************/

    public class Libak_RestServiceException extends Exception {}
}
