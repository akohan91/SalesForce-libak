/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public abstract class Libak_RestProcessor extends Libak_Processor{
    
    public override Libak_Map process(Libak_Map request) {
        return process((Libak_RestRequest) request);
    }

    public Libak_Map process(Libak_RestRequest request) {
        switch on (String)request.httpMethod {
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
    
    public abstract Libak_RestResponse handleGet(Libak_RestRequest request);
    public abstract Libak_RestResponse handlePost(Libak_RestRequest request);
    public abstract Libak_RestResponse handlePut(Libak_RestRequest request);
    public abstract Libak_RestResponse handlePatch(Libak_RestRequest request);
    public abstract Libak_RestResponse handleDelete(Libak_RestRequest request);

    public class Libak_RestProcessorException extends Exception{}
}
