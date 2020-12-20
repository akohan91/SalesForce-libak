/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
global with sharing abstract class Processor {

	/********************************************************************************
	 *                             PUBLIC METHODS
	 *******************************************************************************/

	/**
	 * Method for the main logic in process
	 * @param request { NiceMap }
	 * @return        { NiceMap }
	 */
	global abstract NiceMap process(NiceMap request);

	/********************************************************************************
	 *                             EXCEPTION
	 *******************************************************************************/

	global class ProcessorException extends Exception {}
}