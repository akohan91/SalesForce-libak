/**
 * @author Andrew Kohanovskij
 */
public virtual class Libac_Response {
    private final Map<String, String> VARIANTS = new Map<String, String>{
        'Success' => 'Success',
        'Info' => 'Info',
        'Error' => 'Error'
    };
    public Map<String, Object> data = new Map<String, Object>();
    public String title;
    public String message;
    public String variant;

    /********************************************************************************
     *                             CONSTRUCTORS
     *******************************************************************************/

    public Libac_Response() {
        this.title = VARIANTS.get('Info');
        this.message = 'The response data is empty.';
        this.variant = VARIANTS.get('Info').toLowerCase();
    }

    public Libac_Response(Map<String, Object> responseDataMap) {
        this.data = responseDataMap == null ? this.data : responseDataMap;
        this.title = VARIANTS.get('Success');
        this.message = '';
        this.variant = VARIANTS.get('Success').toLowerCase();
    }

    public Libac_Response(Map<String, Object> responseDataMap, String message) {
        this.data = responseDataMap == null ? this.data : responseDataMap;
        this.title = VARIANTS.get('Success');
        this.message = message;
        this.variant = VARIANTS.get('Success').toLowerCase();
    }

    public Libac_Response(Exception err) {
        this.data = null;
        this.title = VARIANTS.get('Error');
        this.message = err.getMessage();
        this.variant = VARIANTS.get('Error').toLowerCase();
    }
}
