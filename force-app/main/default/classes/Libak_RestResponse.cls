/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public class Libak_RestResponse extends Libak_Map {
    public Integer statusCode;
    public Map<String, String> headers = new Map<String, String>();
    public String message;

    /********************************************************************************
     *                             CONSTRUCTORS
    *******************************************************************************/

    public Libak_RestResponse() {
        this(new Map<String,Object>());
    }
    
    public Libak_RestResponse(String responseDataJSON) {
        this((Map<String, Object>) JSON.deserializeUntyped(responseDataJSON));
    }
    
    public Libak_RestResponse(Map<String, Object> responseDataMap) {
        this(responseDataMap, '');
    }
    
    public Libak_RestResponse(Map<String, Object> responseDataMap, String message) {
        super(responseDataMap);
        this.message = message;
    }
}