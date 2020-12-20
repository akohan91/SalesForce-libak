/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
global with sharing virtual class Request extends NiceMap {

	/********************************************************************************
	 *                             CONSTRUCTORS
	 *******************************************************************************/

	global Request() {
		this(new Map < String, Object > ());
	}

	global Request(String requestJSON) {
		this((Map < String, Object > ) JSON.deserializeUntyped(requestJSON));
	}

	global Request(Map < String, Object > requestMap) {
		super(requestMap);
	}
}