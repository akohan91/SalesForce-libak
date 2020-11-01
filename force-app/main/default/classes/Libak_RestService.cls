/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
@RestResource(urlMapping = '/*')
global without sharing class Libak_RestService {

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
	 * Libak_ProcessorFactory defines what class is used 
	 */
	private static void handleRequest() {
		try {
			String httpMethod = RestContext.request.httpMethod.toLowerCase();
			String requestURI = RestContext.request.requestURI;
			String processorName = requestURI.toLowerCase().substringAfter('/').replaceAll('/', '');
			Libak_Processor processor = Libak_ProcessorFactory.getInstance(processorName);

			Libak_RestRequest req = new Libak_RestRequest(RestContext.request);

			Libak_RestResponse resp = (Libak_RestResponse) processor.process(req);

			if (resp.headers != null && resp.headers.size() > 0) {
				for (String key: resp.headers.keySet()) {
					RestContext.response.addHeader(key, resp.headers.get(key));
				}
			} else {
				jsonResponse();
			}
			setStatusCode(resp.statusCode);
			RestContext.response.responseBody = Blob.valueOf((new Libak_Response(resp).json()));
		} catch (Exception err) {
			jsonResponse();
			RestContext.response.statusCode = 400;
			RestContext.response.responseBody = Blob.valueOf((new Libak_Response(err).json()));
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

	public class Libak_RestServiceException extends Exception {}
}