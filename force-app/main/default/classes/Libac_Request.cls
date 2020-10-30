/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public virtual class Libac_Request extends Libak_Map {
    
    /********************************************************************************
     *                             CONSTRUCTORS
    *******************************************************************************/

    public Libac_Request() {
        super();
    }

    public Libac_Request(Map<String, Object> requestMap) {
        super(requestMap);
    }
    
    public Libac_Request(String requestJSON) {
        super(requestJSON);
    }

    /********************************************************************************
     *                             PUBLIC METHODS
    *******************************************************************************/
}