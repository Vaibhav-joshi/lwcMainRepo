global inherited sharing class VB_TestBatch implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        //callFutureMethod('Start');
        return Database.getQueryLocator('SELECT Id from SVMXC__Service_Order__c Limit 1');
    }

    global void execute(Database.BatchableContext BC, List<Account> scope) {
        callFutureMethod('execute');
    }
    global void finish(Database.BatchableContext BC) {
        //callFutureMethod('finish');
    }
    private void callFutureMethod(String caller){
        try{
            System.debug('~~Exception - '+caller );
            VB_TestClassWithFutureMethod.iAmFutureMethod('Batch');
        }catch(Exception e){
            System.debug('~~Exception - '+caller + ' - ' + e.getMessage());
        }
        
    }
}