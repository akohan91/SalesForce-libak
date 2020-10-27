/**
 * @author Andrew Kohanovskij
 */
public class Libak_ProcessorFactory {

    /**
     * Creates instance of Proccessor
     * @param processorName { String }
     */
    public static Libak_Processor getInstance(String processorName) {
        return getInstance(processorName, 'No Processor Type with Name: ' + processorName);
    }
    
    /**
     * Creates instance of Proccessor
     * @param processorName { String }
     * @param errorMessage  { String }
     */
    public static Libak_Processor getInstance(String processorName, String errorMessage) {
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

    public class Libak_ProcessorFactoryException extends Exception {}
}