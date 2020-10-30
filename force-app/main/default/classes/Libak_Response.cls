/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public virtual class Libak_Response {
    public Map<String, Object> data = new Map<String, Object>();
    public String title;
    public String message;
    public String status;

    /********************************************************************************
     *                             CONSTRUCTORS
    *******************************************************************************/

    public Libak_Response() {
        this.title = Response_Codes__c.getInstance().Info__c;
        this.message = 'The response data is empty.';
        this.status = Response_Codes__c.getInstance().Info__c.toLowerCase();
    }
    
    public Libak_Response(String responseJSON) {
        try {
            this((Map<String, Object>) JSON.deserializeUntyped(responseJSON));
        } catch (Exception err) {
            this(err);
        }
    }
    
    public Libak_Response(Map<String, Object> responseDataMap) {
        this(responseDataMap, '');
    }

    public Libak_Response(Map<String, Object> responseDataMap, String message) {
        this.data = responseDataMap == null ? this.data : responseDataMap;
        this.title = Response_Codes__c.getInstance().Success__c;
        this.message = message;
        this.status = Response_Codes__c.getInstance().Success__c.toLowerCase();
    }

    public Libak_Response(Exception err) {
        this.data = null;
        this.title = Response_Codes__c.getInstance().Error__c;
        this.message = err.getMessage();
        this.status = Response_Codes__c.getInstance().Error__c.toLowerCase();
    }
}