/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public virtual class Libac_Response {
    private final Map<String, String> STATUSES = new Map<String, String>{
        'Success'   => 'Success',
        'Info'      => 'Info',
        'Error'     => 'Error'
    };
    public Map<String, Object> data = new Map<String, Object>();
    public String title;
    public String message;
    public String status;

    /********************************************************************************
     *                             CONSTRUCTORS
    *******************************************************************************/

    public Libac_Response() {
        this.title = STATUSES.get('Info');
        this.message = 'The response data is empty.';
        this.status = STATUSES.get('Info').toLowerCase();
    }

    public Libac_Response(Map<String, Object> responseDataMap) {
        this.data = responseDataMap == null ? this.data : responseDataMap;
        this.title = STATUSES.get('Success');
        this.message = '';
        this.status = STATUSES.get('Success').toLowerCase();
    }

    public Libac_Response(Map<String, Object> responseDataMap, String message) {
        this.data = responseDataMap == null ? this.data : responseDataMap;
        this.title = STATUSES.get('Success');
        this.message = message;
        this.status = STATUSES.get('Success').toLowerCase();
    }

    public Libac_Response(Exception err) {
        this.data = null;
        this.title = STATUSES.get('Error');
        this.message = err.getMessage();
        this.status = STATUSES.get('Error').toLowerCase();
    }
}
