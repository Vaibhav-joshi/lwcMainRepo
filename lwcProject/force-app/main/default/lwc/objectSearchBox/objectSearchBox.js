import { LightningElement, wire } from 'lwc';
import getAllObjectDetails from "@salesforce/apex/LWC_SchemaDataService.getAllObjectDetails";

const ALL_DATA_COLUMNS = {
    OBJECT_LABEL: { label: "Name", fieldName: "label" },
    OBJECT_API: { label: "API", fieldName: "apiName" },
}

export default class ObjectSearchBox extends LightningElement {

    objectList = [];
    wiredObjects = [];
    dataColumns = [
        ALL_DATA_COLUMNS.OBJECT_LABEL,
        ALL_DATA_COLUMNS.OBJECT_API
    ];

    @wire(getAllObjectDetails)
    objects(value) {
        this.wiredObjects = value;
        const { data, error } = value;
        if (data) {
            this.objectList = Object.keys(data).map(key => { return { label: key, apiName: data[key] }; });
        } else if (error) {
            this.objectList = [];

        }
    }
}