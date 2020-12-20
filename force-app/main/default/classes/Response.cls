/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
global with sharing virtual class Response extends NiceMap {
	protected String title;
	protected String message;
	protected String status;

	/********************************************************************************
	 *                             CONSTRUCTORS
	 *******************************************************************************/

	global Response(String responseJSON) {
		try {
			this((Map < String, Object > ) JSON.deserializeUntyped(responseJSON));
		} catch (Exception err) {
			this(err);
		}
	}

	global Response(Map < String, Object > responseDataMap) {
		this(responseDataMap, '');
	}

	global Response(RestResponseData restResponse) {
		this(restResponse.data(), restResponse.message);
	}

	global Response(Map < String, Object > responseDataMap, String message) {
		this.data = responseDataMap == null ? this.data : responseDataMap;
		this.title = Response_Codes__c.getInstance().Success__c;
		this.message = message;
		this.status = Response_Codes__c.getInstance().Success__c.toLowerCase();
	}

	global Response(Exception err) {
		this.data = null;
		this.title = Response_Codes__c.getInstance().Error__c;
		this.message = err.getMessage();
		this.status = Response_Codes__c.getInstance().Error__c.toLowerCase();
	}

	global override String json() {
		return JSON.serialize(this);
	}
}