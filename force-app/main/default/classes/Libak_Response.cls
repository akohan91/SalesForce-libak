/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public virtual class Libak_Response extends Libak_Map {
	protected String title;
	protected String message;
	protected String status;

	/********************************************************************************
	 *                             CONSTRUCTORS
	 *******************************************************************************/

	public Libak_Response(String responseJSON) {
		try {
			this((Map < String, Object > ) JSON.deserializeUntyped(responseJSON));
		} catch (Exception err) {
			this(err);
		}
	}

	public Libak_Response(Map < String, Object > responseDataMap) {
		this(responseDataMap, '');
	}

	public Libak_Response(Libak_RestResponse restResponse) {
		this(restResponse.data(), restResponse.message);
	}

	public Libak_Response(Map < String, Object > responseDataMap, String message) {
		this.data = responseDataMap == null ? this.data : responseDataMap;
		this.title = Response_Codes__c.getInstance().Success__c;
		this.message = message;
		this.status = Response_Codes__c.getInstance().Success__c.toLowerCase();
	}

	public Libak_Response(Exception err) {
		this.data = null;
		this.title = Response_Codes__c.getInstance().Error__c;
		this.message = err.getMessage();
		this.status = Response_Codes__c.getInstance().Error__c.toLowerCase();
	}
}