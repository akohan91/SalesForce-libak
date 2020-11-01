/**
 * @author Andrew Kohanovskij <akohan91@gmail.com>
 */
public virtual class Libak_Request extends Libak_Map {

	/********************************************************************************
	 *                             CONSTRUCTORS
	 *******************************************************************************/

	public Libak_Request() {
		this(new Map < String, Object > ());
	}

	public Libak_Request(String requestJSON) {
		this((Map < String, Object > ) JSON.deserializeUntyped(requestJSON));
	}

	public Libak_Request(Map < String, Object > requestMap) {
		super(requestMap);
	}

	/********************************************************************************
	 *                             PUBLIC METHODS
	 *******************************************************************************/
}