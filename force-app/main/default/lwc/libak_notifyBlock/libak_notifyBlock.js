import { LightningElement, api} from 'lwc';

export default class Libak_notifyBlock extends LightningElement {
    isNotify;
    notifyData;

    /**
     * 
     * @param {Object} notifyData { 
     *  variant < 'success', 'error', 'warning', 'info' >
     *  title,
     *  message
     * } 
     */
    @api showNotification(notifyData) {
        this.isNotify = true;
        this.notifyData = {
            variant: notifyData.variant,
            theme: `slds-notify slds-notify_alert slds-theme_alert-texture slds-theme_${notifyData.variant}`,
            icon: `utility:${notifyData.variant}`,
            message: notifyData.message,
            title: notifyData.title
        }
    }

    handleClose(event) {
        this.isNotify = false;
        this.notifyData = null;
    }
}