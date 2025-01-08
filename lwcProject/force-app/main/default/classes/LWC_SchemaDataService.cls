public class LWC_SchemaDataService {
    @AuraEnabled(cacheable=true)
    public static Map<String, String> getAllObjectDetails(){
        Map<String, String> objectLabelsAndApiNames = new Map<String, String>(); 
        try {
            
            Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
            for (String sObjectType : gd.keySet()) { 
                Schema.SObjectType stype = gd.get(sObjectType); 
                Schema.DescribeSObjectResult descr = stype.getDescribe(); 
                String label = descr.getLabel(); 
                String apiName = descr.getName(); 
                objectLabelsAndApiNames.put(label, apiName); } 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return objectLabelsAndApiNames; 
    }
}