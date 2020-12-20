/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public with sharing virtual class Response extends NiceMap {
	protected String title;
	protected String message;
	protected String status;

	/********************************************************************************
	 *                             CONSTRUCTORS
	 *******************************************************************************/

	public Response(String responseJSON) {
		try {
			this((Map < String, Object > ) JSON.deserializeUntyped(responseJSON));
		} catch (Exception err) {
			this(err);
		}
	}

	public Response(Map < String, Object > responseDataMap) {
		this(responseDataMap, '');
	}

	public Response(RestResponseData restResponse) {
		this(restResponse.data(), restResponse.message);
	}

	public Response(Map < String, Object > responseDataMap, String message) {
		this.data = responseDataMap == null ? this.data : responseDataMap;
		this.title = Response_Codes__c.getInstance().Success__c;
		this.message = message;
		this.status = Response_Codes__c.getInstance().Success__c.toLowerCase();
	}

	public Response(Exception err) {
		this.data = null;
		this.title = Response_Codes__c.getInstance().Error__c;
		this.message = err.getMessage();
		this.status = Response_Codes__c.getInstance().Error__c.toLowerCase();
	}
}