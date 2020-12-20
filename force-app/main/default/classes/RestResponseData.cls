/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public class RestResponseData extends NiceMap {
	public Integer statusCode;
	public Map < String, String > headers = new Map < String, String > ();
	public String message;

	/********************************************************************************
	 *                             CONSTRUCTORS
	 *******************************************************************************/

	public RestResponseData() {
		this(new Map < String, Object > ());
	}

	public RestResponseData(String responseDataJSON) {
		this((Map < String, Object > ) JSON.deserializeUntyped(responseDataJSON));
	}

	public RestResponseData(Map < String, Object > responseDataMap) {
		this(responseDataMap, '');
	}

	public RestResponseData(Map < String, Object > responseDataMap, String message) {
		super(responseDataMap);
		this.message = message;
	}
}