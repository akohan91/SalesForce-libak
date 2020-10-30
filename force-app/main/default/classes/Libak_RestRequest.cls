public class Libak_RestRequest extends Libak_Request {
    public String httpMethod;
    public Map<String, String> params = new Map<String, String>();
    public Map<String, String> headers = new Map<String, String>();

    /********************************************************************************
     *                             CONSTRUCTORS
    *******************************************************************************/

    public Libak_RestRequest() {
        super();
    }

    public Libak_RestRequest(String bodyJSON) {
        super(bodyJSON);
    }
}