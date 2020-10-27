/**
 * @author Andrew Kohanovskij
 */
public virtual class Libac_Response {
    public Map<String, Object> data = new Map<String, Object>();
    public String title;
    public String message;
    public String variant;

    public Libac_Response() {
        this.title = 'Info';
        this.message = 'The data is empty.';
        this.variant = 'info';
    }

    public Libac_Response(Map<String, Object> dataMap) {
        this.data = dataMap == null ? this.data : dataMap;
        this.title = 'Success';
        this.message = '';
        this.variant = 'success';
    }

    public Libac_Response(Map<String, Object> dataMap, String message) {
        this.data = dataMap == null ? this.data : dataMap;
        this.title = 'Success';
        this.message = message;
        this.variant = 'success';
    }

    public Libac_Response(Exception err) {
        this.data = null;
        this.title = 'Error';
        this.message = err.getMessage();
        this.variant = 'error';
    }
}
