/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public abstract class Libak_Processor {
    protected Libac_Request request;
    protected Libac_Response response;

    /********************************************************************************
     *                             PUBLIC METHODS
     *******************************************************************************/

    /**
     * Runs the process
     * @param  requestJSON { String } JSON
     * @return             { Libac_Response }
     */
    public virtual Libac_Response process(String requestJSON) {
        this.response = this.process(new Libac_Request(requestJSON));
        return this.response;
    }
    
    /**
     * Runs the process
     * @param  requestMap { Map<String, Object> }
     * @return            { Libac_Response }
     */
    public virtual Libac_Response process(Map<String, Object> requestMap) {
        this.response = this.process(new Libac_Request(requestMap));
        return this.response;
    }

    /**
     * Throws an error
     * @param  errorMessage { String }
     */
    public void throwError(String errorMessage){
        throw new Libak_ProcessorException(errorMessage);
    }

    /********************************************************************************
     *                             PRIVATE METHODS
     *******************************************************************************/
    
    /**
     * Method for the main logic in process
     * @param request { Libac_Request }
     * @return        { Libac_Response }
     */
    private abstract Libac_Response process(Libac_Request request);

    /********************************************************************************
     *                             EXCEPTION
     *******************************************************************************/

    public class Libak_ProcessorException extends Exception {}
}
