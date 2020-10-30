/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public virtual class Libak_Request extends Libak_Map {
    
    /********************************************************************************
     *                             CONSTRUCTORS
    *******************************************************************************/

    public Libak_Request() {
        super();
    }

    public Libak_Request(Map<String, Object> requestMap) {
        super(requestMap);
    }
    
    public Libak_Request(String requestJSON) {
        super(requestJSON);
    }

    /********************************************************************************
     *                             PUBLIC METHODS
    *******************************************************************************/
}