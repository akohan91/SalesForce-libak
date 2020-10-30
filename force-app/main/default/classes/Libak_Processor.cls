/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public abstract class Libak_Processor {
    protected Libak_Request request;
    protected Libak_Response response;

    /********************************************************************************
     *                             PUBLIC METHODS
     *******************************************************************************/

    /**
     * Runs the process
     * @param  requestJSON { String } JSON
     * @return             { Libak_Response }
     */
    public virtual Libak_Response process(String requestJSON) {
        this.response = this.process(new Libak_Request(requestJSON));
        return this.response;
    }
    
    /**
     * Runs the process
     * @param  requestMap { Map<String, Object> }
     * @return            { Libak_Response }
     */
    public virtual Libak_Response process(Map<String, Object> requestMap) {
        this.response = this.process(new Libak_Request(requestMap));
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
     * @param request { Libak_Request }
     * @return        { Libak_Response }
     */
    public abstract Libak_Response process(Libak_Request request);

    /********************************************************************************
     *                             EXCEPTION
     *******************************************************************************/

    public class Libak_ProcessorException extends Exception {}
}