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
     * @param {Object} toastData { 
     *  variant < 'success', 'error', 'warning', 'info' > 
     *  title, 
     *  message, 
     * }
     */
    showToast(toastData) {
        const event = new ShowToastEvent({
            title: toastData.title,
            message: toastData.message,
            variant: toastData.variant,
        });
        this.dispatchEvent(event);
    }
}