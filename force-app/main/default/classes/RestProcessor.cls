/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
global with sharing abstract class RestProcessor extends Processor {

	global override NiceMap process(NiceMap request) {
		return process((RestRequestData) request);
	}

	global NiceMap process(RestRequestData request) {
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

	global abstract RestResponseData handleGet(RestRequestData request);
	global abstract RestResponseData handlePost(RestRequestData request);
	global abstract RestResponseData handlePut(RestRequestData request);
	global abstract RestResponseData handlePatch(RestRequestData request);
	global abstract RestResponseData handleDelete(RestRequestData request);

	global class RestProcessorException extends Exception {}
}