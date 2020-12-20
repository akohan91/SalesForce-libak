/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public with sharing abstract class Processor {

	/********************************************************************************
	 *                             PUBLIC METHODS
	 *******************************************************************************/

	/**
	 * Method for the main logic in process
	 * @param request { NiceMap }
	 * @return        { NiceMap }
	 */
	public abstract NiceMap process(NiceMap request);

	/********************************************************************************
	 *                             EXCEPTION
	 *******************************************************************************/

	public class ProcessorException extends Exception {}
}