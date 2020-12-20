/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public virtual class Request extends NiceMap {

	/********************************************************************************
	 *                             CONSTRUCTORS
	 *******************************************************************************/

	public Request() {
		this(new Map < String, Object > ());
	}

	public Request(String requestJSON) {
		this((Map < String, Object > ) JSON.deserializeUntyped(requestJSON));
	}

	public Request(Map < String, Object > requestMap) {
		super(requestMap);
	}

	/********************************************************************************
	 *                             PUBLIC METHODS
	 *******************************************************************************/
}