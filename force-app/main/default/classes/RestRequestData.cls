/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
global with sharing class RestRequestData extends NiceMap {
	global String httpMethod;
	global Map < String, String > params = new Map < String, String > ();
	global Map < String, String > headers = new Map < String, String > ();

	/********************************************************************************
	 *                             CONSTRUCTORS
	 *******************************************************************************/

	global RestRequestData(RestRequest request) {
		this.httpMethod = request.httpMethod.toLowerCase();

		if (request.requestBody != null && String.isNotBlank(request.requestBody.toString())) {
			super(request.requestBody.toString());
		}

		if (request.params != null) {
			this.params.putAll(request.params);
		}

		if (request.headers != null) {
			this.headers.putAll(request.headers);
		}
	}
}