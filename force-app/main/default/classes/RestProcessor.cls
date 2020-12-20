/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public with sharing abstract class RestProcessor extends Processor {

	public override NiceMap process(NiceMap request) {
		return process((RestRequestData) request);
	}

	public NiceMap process(RestRequestData request) {
		switch on(String) request.httpMethod {
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

	public abstract RestResponseData handleGet(RestRequestData request);
	public abstract RestResponseData handlePost(RestRequestData request);
	public abstract RestResponseData handlePut(RestRequestData request);
	public abstract RestResponseData handlePatch(RestRequestData request);
	public abstract RestResponseData handleDelete(RestRequestData request);

	public class RestProcessorException extends Exception {}
}