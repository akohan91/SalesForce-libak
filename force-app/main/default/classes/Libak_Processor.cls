/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public abstract class Libak_Processor {

    /********************************************************************************
     *                             PUBLIC METHODS
     *******************************************************************************/

    /**
     * Method for the main logic in process
     * @param request { Libak_Map }
     * @return        { Libak_Map }
     */
    public abstract Libak_Map process(Libak_Map request);

    /********************************************************************************
     *                             EXCEPTION
     *******************************************************************************/

    public class Libak_ProcessorException extends Exception {}
}