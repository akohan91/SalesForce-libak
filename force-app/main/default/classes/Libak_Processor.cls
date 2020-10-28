/**
 * @author Andrew Kohanovskij
 */
public abstract class Libak_Processor {
    protected Libac_Request request;
    protected Libac_Response response;

    /********************************************************************************
     *                             PUBLIC METHODS
     *******************************************************************************/

    /**
     * Runs the process
     * @param dataMap { String } JSON
     */
    public virtual Libac_Response process(String requestJSON) {
        this.response = this.process(new Libac_Request(requestJSON));
        return this.response;
    }
    
    /**
     * Runs the process
     * @param dataMap { Map<String, Object> }
     */
    public virtual Libac_Response process(Map<String, Object> dataMap) {
        this.response = this.process(new Libac_Request(dataMap));
        return this.response;
    }

    public void throwError(String errorMessage){
        throw new Libak_ProcessorException(errorMessage);
    }

    /********************************************************************************
     *                             PRIVATE METHODS
     *******************************************************************************/
    
    /**
     * Method for the main logic in process
     * @param request { Libac_Request }
     */
    private abstract Libac_Response process(Libac_Request request);

    /********************************************************************************
     *                             EXCEPTION
     *******************************************************************************/

    public class Libak_ProcessorException extends Exception {}
}
