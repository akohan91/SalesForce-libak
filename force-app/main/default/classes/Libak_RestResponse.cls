public class Libak_RestResponse extends Libak_Response {
    public Integer statusCode;
    public Map<String, String> headers = new Map<String, String>();

    /********************************************************************************
     *                             CONSTRUCTORS
    *******************************************************************************/

    public Libak_RestResponse() {
        super();
    }
    public Libak_RestResponse(String responseDataJSON) {
        super(responseDataJSON);
    }
    public Libak_RestResponse(Map<String, Object> responseDataMap) {
        super(responseDataMap);
    }
    public Libak_RestResponse(Map<String, Object> responseDataMap, String message) {
        super(responseDataMap, message);
    }
    public Libak_RestResponse(Exception err) {
        super(err);
    }
}