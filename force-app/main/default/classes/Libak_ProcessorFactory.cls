/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 * The class is used to create an instancee of Libak_Processor class by class name
 */
public class Libak_ProcessorFactory {

	/********************************************************************************
	 *                             PUBLIC METHODS
	 *******************************************************************************/

	/**
	 * Creates instance of Proccessor
	 * @param  processorName { String }
	 * @return               { Libak_Processor }
	 */
	public static Libak_Processor getInstance(String processorName) {
		return getInstance(processorName, 'No Processor Type with Name: ' + processorName);
	}

	/**
	 * Creates instance of Proccessor
	 * @param  processorName { String }
	 * @param  errorMessage  { String }
	 * @return               { Libak_Processor }
	 */
	private static Libak_Processor getInstance(String processorName, String errorMessage) {
		Type processorType = Type.forName(processorName);
		if (processorType == null) {
			throw new Libak_ProcessorFactoryException(errorMessage);
		}

		Libak_Processor processor = (Libak_Processor) processorType.newInstance();
		if (processor == null) {
			throw new Libak_ProcessorFactoryException('Unable to create Processor instance of type name: ' + processorName);
		}

		return processor;
	}

	/********************************************************************************
	 *                             EXCEPTION
	 *******************************************************************************/

	public class Libak_ProcessorFactoryException extends Exception {}
}