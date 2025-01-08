import { api } from 'lwc';
import { LightningModal } from 'lightning/modal';

export default class GenericAddEditModal extends LightningModal {
    @api fieldList;
    @api recordId;
    @api objectApiName;
    @api modalHeader;
}