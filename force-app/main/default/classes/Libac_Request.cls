/**
 * @author Andrew Kohanovskij
 */
public virtual class Libac_Request {
    public Map<String, Object> data = new Map<String, Object>();
    
    /********************************************************************************
     *                             CONSTRUCTORS
     *******************************************************************************/

    public Libac_Request(String requestJSON) {
        this.data = (Map<String, Object>) JSON.deserializeUntyped(requestJSON);
    }

    public Libac_Request(Map<String, Object> requestMap) {
        this.data = requestMap == null ? this.data : requestMap;
    }
}