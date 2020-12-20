/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public class RestRequestData extends NiceMap {
	public String httpMethod;
	public Map < String, String > params = new Map < String, String > ();
	public Map < String, String > headers = new Map < String, String > ();

	/********************************************************************************
	 *                             CONSTRUCTORS
	 *******************************************************************************/

	public RestRequestData(RestRequest request) {
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