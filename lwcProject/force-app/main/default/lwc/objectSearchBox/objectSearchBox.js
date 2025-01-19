import { LightningElement, wire } from 'lwc';
import getAllObjectDetails from '@salesforce/apex/LWC_SchemaDataService.getAllObjectDetails';

const ALL_DATA_COLUMNS = {
    OBJECT_LABEL: { label: 'Label', fieldName: 'label' },
    OBJECT_API: { label: 'API Name', fieldName: 'apiName' },
};

export default class ObjectSearchBox extends LightningElement {

    objectList = [];
    filteredObjectList = [];
    selectedObject = null;
    wiredObjects = [];
    searchKey = '';
    showDropdown = false;
    isLoading = true;

    @wire(getAllObjectDetails)
    objects({ data, error }) {
        if (data) {
            this.objectList = Object.keys(data).map(key => {
                return { label: key, apiName: data[key] };
            });
            this.filteredObjectList = this.objectList;
            this.isLoading = false;
        } else if (error) {
            this.objectList = [];
            this.filteredObjectList = [];
            console.error(error);
        }
    }

    handleSearchChange(event) {
        this.searchKey = event.target.value.toLowerCase();
        if (this.searchKey) {
            this.filteredObjectList = this.objectList.filter(obj =>
                obj.label.toLowerCase().startsWith(this.searchKey)
            );
            this.showDropdown = true;
        } else {
            this.filteredObjectList = [];
            this.showDropdown = false;
        }
    }

    handleObjectSelect(event) {
        const selectedApiName = event.target.dataset.id;
        this.selectedObject = this.objectList.find(obj => obj.apiName === selectedApiName);
        this.searchKey = this.selectedObject.label;
        this.showDropdown = false;
    }
}
