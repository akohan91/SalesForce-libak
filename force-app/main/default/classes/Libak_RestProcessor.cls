public abstract class Libak_RestProcessor extends Libak_Processor{
    public override Libak_Response process(Libak_Request request) {
        switch on (String)request.value('httpMethod') {
            when 'get' {
                return handleGet(request);
            }
            when 'post' {
                return handlePost(request);
            }
            when 'put' {
                return handlePut(request);
            }
            when 'patch' {
                return handlePatch(request);
            }
            when 'delete' {
                return handleDelete(request);
            }
        }
		return null;
    }

    /********************************************************************************
     *                             ABSTRACT METHODS
    *******************************************************************************/
    
    public abstract Libak_Response handleGet(Libak_Request request);
    public abstract Libak_Response handlePost(Libak_Request request);
    public abstract Libak_Response handlePut(Libak_Request request);
    public abstract Libak_Response handlePatch(Libak_Request request);
    public abstract Libak_Response handleDelete(Libak_Request request);

    public class Libak_RestProcessorException extends Exception{}
}
