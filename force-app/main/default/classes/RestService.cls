/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
@RestResource(urlMapping = '/*')
global with sharing class RestService {

	/********************************************************************************************************
	 *                                      HANDLERS
	 ********************************************************************************************************/

	@HttpGet
	global static void handleGet() {
		handleRequest();
	}
	@HttpPost
	global static void handlePost() {
		handleRequest();
	}
	@HttpPut
	global static void handlePut() {
		handleRequest();
	}
	@HttpPatch
	global static void handlePatch() {
		handleRequest();
	}
	@HttpDelete
	global static void handleDelete() {
		handleRequest();
	}


	/********************************************************************************************************
	 *                                      PROCESS
	 ********************************************************************************************************/

	/**
	 * Redirects to the necessary handler class
	 * ProcessorFactory defines what class is used
	 */
	private static void handleRequest() {
		try {
			String httpMethod = RestContext.request.httpMethod.toLowerCase();
			String requestURI = RestContext.request.requestURI;
			String processorName = requestURI.toLowerCase().substringAfter('/').replaceAll('/', '');
			Processor processor = ProcessorFactory.getInstance(processorName);

			RestRequestData req = new RestRequestData(RestContext.request);

			RestResponseData resp = (RestResponseData) processor.process(req);

			if (resp.headers != null && resp.headers.size() > 0) {
				for (String key: resp.headers.keySet()) {
					RestContext.response.addHeader(key, resp.headers.get(key));
				}
			} else {
				jsonResponse();
			}
			setStatusCode(resp.statusCode);
			RestContext.response.responseBody = Blob.valueOf((new Response(resp).json()));
		} catch (Exception err) {
			jsonResponse();
			RestContext.response.statusCode = 400;
			RestContext.response.responseBody = Blob.valueOf((new Response(err).json()));
		}
	}

	/********************************************************************************************************
	 *                                      PRIVATE METHODS
	 ********************************************************************************************************/

	/**
	 * Adds 'Content-Type':'application/json' header
	 */
	private static void jsonResponse() {
		RestContext.response.addHeader('Content-Type', 'application/json');
	}

	private static void setStatusCode(Integer statusCode) {
		RestContext.response.statusCode = statusCode != null ? statusCode : 200;
	}

	/********************************************************************************************************
	 *                                      CLASSES
	 ********************************************************************************************************/

	public class RestServiceException extends Exception {}
}