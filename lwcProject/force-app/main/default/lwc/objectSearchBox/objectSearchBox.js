import { LightningElement, wire } from 'lwc';
import getAllObjectDetails from "@salesforce/apex/LWC_SchemaDataService.getAllObjectDetails";

const ALL_DATA_COLUMNS = {
    OBJECT_LABEL: { label: "Name", fieldName: "label" },
    OBJECT_API: { label: "API", fieldName: "apiName" },
}

export default class ObjectSearchBox extends LightningElement {

    objectList = []; 
    filteredObjectList = []; 
    wiredObjects = []; 
    isLoading = true;
    searchKey = '';
    dataColumns = [
        ALL_DATA_COLUMNS.OBJECT_LABEL,
        ALL_DATA_COLUMNS.OBJECT_API
    ];

    connectedCallback(){
       
    }

    @wire(getAllObjectDetails)
    objects(value) {
        this.wiredObjects = value;
        const { data, error } = value;
        if (data) {
            this.objectList = Object.keys(data).map(key => { return { label: key, apiName: data[key] }; });
            this.filteredObjectList = this.objectList;
            this.isLoading = false;
        } else if (error) {
            this.objectList = [];
            this.filteredObjectList = [];

        }
    }

    handleSearchChange(event) {
        this.searchKey = event.target.value.toLowerCase();
        if (this.searchKey) {
            this.filteredObjectList = this.objectList.filter(obj =>
                obj.label.toLowerCase().startsWith(this.searchKey)
            );
        }
        else {
            this.filteredObjectList = this.objectList;
        }
    }
}