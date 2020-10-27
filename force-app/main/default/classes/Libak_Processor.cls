/**
 * @author Andrew Kohanovskij
 */
public abstract class Libak_Processor {
    private Libac_Request request;
    private Libac_Response response;

    /**
     * Runs the process
     * @param request { Libac_Request }
     */
    public abstract Libac_Response process(Libac_Request request);

    /**
     * Runs the process
     * @param dataMap { Map<String, Object> dataMap }
     */
    public virtual Libac_Response process(Map<String, Object> dataMap) {
        return this.process(new Libac_Request(dataMap));
    }

    public void throwError(String errorMessage){
        throw new Libak_ProcessorException(errorMessage);
    }

    public class Libak_ProcessorException extends Exception {}
}
