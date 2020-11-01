import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'

export default class Libak_Base extends LightningElement {
	/** @property {Boolean} */
	isBusy;

	/***********************************************************************************
	 *                                  METHODS
	 ***********************************************************************************/

	/**
	 * Method shows the toast message
	 * @param {Object} request { 
	 *  status < 'success', 'error', 'warning', 'info' > 
	 *  title, 
	 *  message, 
	 * }
	 */
	showToast(request) {
		const event = new ShowToastEvent({
			title: request.title,
			message: request.message,
			variant: request.status,
		});
		this.dispatchEvent(event);
	}


}