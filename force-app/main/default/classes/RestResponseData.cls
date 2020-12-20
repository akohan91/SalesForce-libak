/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
global with sharing class RestResponseData extends NiceMap {
	global Integer statusCode;
	global Map < String, String > headers = new Map < String, String > ();
	global String message;

	/********************************************************************************
	 *                             CONSTRUCTORS
	 *******************************************************************************/

	global RestResponseData() {
		this(new Map < String, Object > ());
	}

	global RestResponseData(String responseDataJSON) {
		this((Map < String, Object > ) JSON.deserializeUntyped(responseDataJSON));
	}

	global RestResponseData(Map < String, Object > responseDataMap) {
		this(responseDataMap, '');
	}

	global RestResponseData(Map < String, Object > responseDataMap, String message) {
		super(responseDataMap);
		this.message = message;
	}
}