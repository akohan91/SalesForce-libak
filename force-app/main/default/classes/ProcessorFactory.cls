/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 * The class is used to create an instancee of Processor class by class name
 */
public with sharing class ProcessorFactory {

	/********************************************************************************
	 *                             PUBLIC METHODS
	 *******************************************************************************/

	/**
	 * Creates instance of Proccessor
	 * @param  processorName { String }
	 * @return               { Processor }
	 */
	public static Processor getInstance(String processorName) {
		return getInstance(processorName, 'No Processor Type with Name: ' + processorName);
	}

	/**
	 * Creates instance of Proccessor
	 * @param  processorName { String }
	 * @param  errorMessage  { String }
	 * @return               { Processor }
	 */
	private static Processor getInstance(String processorName, String errorMessage) {
		Type processorType = Type.forName(processorName);
		if (processorType == null) {
			throw new ProcessorFactoryException(errorMessage);
		}

		Processor processor = (Processor) processorType.newInstance();
		if (processor == null) {
			throw new ProcessorFactoryException('Unable to create Processor instance of type name: ' + processorName);
		}

		return processor;
	}

	/********************************************************************************
	 *                             EXCEPTION
	 *******************************************************************************/

	public class ProcessorFactoryException extends Exception {}
}