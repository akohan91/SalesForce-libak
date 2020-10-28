import { LightningElement, api} from 'lwc';

export default class Libak_notifyBlock extends LightningElement {
    isNotify;
    notifyData;

    /**
     * @param {Object} request { 
     *  status < 'success', 'error', 'warning', 'info' >
     *  title,
     *  message
     * } 
     */
    @api showNotification(request) {
        this.isNotify = true;
        this.notifyData = {
            variant: request.status,
            theme: `slds-notify slds-notify_alert slds-theme_alert-texture slds-theme_${request.status}`,
            icon: `utility:${request.status}`,
            message: request.message,
            title: request.title
        }
    }

    handleClose(event) {
        this.isNotify = false;
        this.notifyData = null;
    }
}