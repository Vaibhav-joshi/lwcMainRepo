public class VB_ApexGoverorLimits {

    /* 
     public static String getLimitsForLogs(){
         String limitSTR; 
         limitSTR = '--------------Governer limit check start-------------------';
         limitSTR = limitSTR + '\n';
         limitSTR = limitSTR + getApexCPULimitForLogs() + getSoqlLimitForLogs() +getDmlLimitForLogs() + getHeapLimitForLogs() + getFutureLimitForLogs();
         limitSTR = limitSTR + '--------------Governer limit check END-------------------';
         limitSTR = limitSTR + '\n';
             
         return limitSTR;
         
     }
    
     public static String getApexCPULimitForLogs(){
         String limitSTR = 'Remaining CPU limit -: '+ (Limits.getLimitCpuTime() - Limits.getCpuTime ()) + ' ('+ Limits.getLimitCpuTime() + ' - ' + Limits.getCpuTime () +')';
         limitSTR = limitSTR + '\n';
         return limitSTR;
         //system.debug('~~Remaining CPU limit -: '+ (Limits.getLimitCpuTime() - Limits.getCpuTime ()) + ' ('+ Limits.getLimitCpuTime() + ' - ' + Limits.getCpuTime () +')');
     }
     
     public static String getSoqlLimitForLogs(){
         String limitSTR = 'Remaining SOQL limit -: '+ (Limits.getLimitQueries() - Limits.getQueries()) + ' ('+ Limits.getLimitQueries() + ' - ' + Limits.getQueries() +')';
         limitSTR = limitSTR + '\n';
         return limitSTR;
         //system.debug('~~Remaining SOQL limit -: '+ (Limits.getLimitQueries() - Limits.getQueries()) + ' ('+ Limits.getLimitQueries() + ' - ' + Limits.getQueries() +')');
     }
     
     public static String getDmlLimitForLogs(){
         
         String limitSTR = 'Remaining DML limit -: '+ (Limits.getLimitDMLRows() - Limits.getDMLStatements()) + ' ('+ Limits.getLimitDMLRows() + ' - ' + Limits.getDMLStatements() +')';
         limitSTR = limitSTR + '\n';
         return limitSTR;
         
         //system.debug('~~Remaining DML limit -: '+ (Limits.getLimitDMLRows() - Limits.getDMLStatements()) + ' ('+ Limits.getLimitDMLRows() + ' - ' + Limits.getDMLStatements() +')');
     }
    
     public static String getHeapLimitForLogs(){
         
         String limitSTR = 'Consumed Heap limit -: '+Limits.getHeapSize();
         limitSTR = limitSTR + '\n';
         limitSTR = limitSTR + 'Remaining Heap limit -: '+ (Limits.getLimitHeapSize() - Limits.getHeapSize()) + ' ('+ Limits.getLimitHeapSize() + ' - ' + Limits.getHeapSize() +')';
         limitSTR = limitSTR + '\n';
         return limitSTR;
         
         //system.debug('~~Consumed Heap limit -: '+Limits.getHeapSize());
         //system.debug('~~Remaining Heap limit -: '+ (Limits.getLimitHeapSize() - Limits.getHeapSize()) + ' ('+ Limits.getLimitHeapSize() + ' - ' + Limits.getHeapSize() +')');
     }
     
     public static String getFutureLimitForLogs(){
         
         String limitSTR = 'Remaining Future limit -: '+ Limits.getFutureCalls();
         limitSTR = limitSTR + '\n';
         return limitSTR;
         
         //system.debug('~~Remaining Future limit -: '+ Limits.getFutureCalls());
     }*/
     
 
     public static void checkLimits(String caller){
         system.debug('--------------------- ' + caller + ' start-------------------');
         checkApexCPULimit();
         checkSoqlLimit();
         checkDmlLimits();
         checkHeap();
         checkFutureLimit();
         system.debug('---------------------- '+ caller + ' end-------------------');
         
     }
     
     
     public static string returnAllLimits(String caller){
         String transactionLogs = '\n\n---------------------' + caller + ' limit print start-------------------';
         transactionLogs = transactionLogs + returnApexCPULimit();
         transactionLogs = transactionLogs + returnSoqlLimit();
         transactionLogs = transactionLogs + returnDmlLimits();
         transactionLogs = transactionLogs + returnHeapLimits();
         transactionLogs = transactionLogs + returnFutureLimits();
         transactionLogs = transactionLogs + '\n---------------------- '+ caller + ' limit print end-------------------\n';
         return transactionLogs;
  
     }
     
     
     public static void checkLimits(){
         system.debug('--------------------- start-------------------');
         checkApexCPULimit();
         checkSoqlLimit();
         checkDmlLimits();
         checkHeap();
         //checkFutureLimit();
         system.debug('---------------------- end-------------------');
         
     }
     
     
     public static void checkApexCPULimit(){
         system.debug('~~Remaining CPU limit -: '+ (Limits.getLimitCpuTime() - Limits.getCpuTime ()) + ' ('+ Limits.getLimitCpuTime() + ' - ' + Limits.getCpuTime () +')');
     }
     public static void checkApexQueuableLimit(){
         system.debug('~~Remaining CPU limit -: '+ (Limits.getLimitCpuTime() - Limits.getCpuTime ()) + ' ('+ Limits.getLimitCpuTime() + ' - ' + Limits.getCpuTime () +')');
     }
     
     public static void checkApexScheulableLimit(){
         system.debug('~~Remaining CPU limit -: '+ (Limits.getLimitCpuTime() - Limits.getCpuTime ()) + ' ('+ Limits.getLimitCpuTime() + ' - ' + Limits.getCpuTime () +')');
     }
     public static string returnApexCPULimit(){
         String cpuLimit = '\n~~Remaining CPU limit -: '+ (Limits.getLimitCpuTime() - Limits.getCpuTime ()) + ' ('+ Limits.getLimitCpuTime() + ' - ' + Limits.getCpuTime () +')';
         return cpuLimit;
     }
     
     public static void checkSoqlLimit(){
         system.debug('~~Remaining SOQL limit -: '+ (Limits.getLimitQueries() - Limits.getQueries()) + ' ('+ Limits.getLimitQueries() + ' - ' + Limits.getQueries() +')');
     }
     
     
     public static string returnSoqlLimit(){
         string soqlLimit = '\n~~Remaining SOQL limit -: '+ (Limits.getLimitQueries() - Limits.getQueries()) + ' ('+ Limits.getLimitQueries() + ' - ' + Limits.getQueries() +')';
         return soqlLimit;
     }
     
     public static void checkDmlLimits(){
         
         system.debug('~~Remaining DML limit -: '+ (Limits.getLimitDMLRows() - Limits.getDMLStatements()) + ' ('+ Limits.getLimitDMLRows() + ' - ' + Limits.getDMLStatements() +')');
     }
     
     
     public static string returnDmlLimits(){
         string dmlLimits = '\n~~Remaining DML limit -: '+ (Limits.getLimitDMLRows() - Limits.getDMLStatements()) + ' ('+ Limits.getLimitDMLRows() + ' - ' + Limits.getDMLStatements() +')';
         return dmlLimits;
     }
     
     public static void checkHeap(){
         
         Double consumedPercentage = (Double.valueOf(Limits.getHeapSize()) / Double.valueof(Limits.getLimitHeapSize())) * (100.0);
         
         system.debug('~~Consumed Heap limit -: '+Limits.getHeapSize() + ' i.e. - ' + consumedPercentage);
         system.debug('~~Remaining Heap limit -: '+ (Limits.getLimitHeapSize() - Limits.getHeapSize()) + ' ('+ Limits.getLimitHeapSize() + ' - ' + Limits.getHeapSize() +')');
     }
     
     
     public static string returnHeapLimits(){
         
         Double consumedPercentage = (Double.valueOf(Limits.getHeapSize()) / Double.valueof(Limits.getLimitHeapSize())) * (100.0);
         
         string heapLimits = '\n~~Consumed Heap limit -: '+Limits.getHeapSize() + ' i.e. - ' + consumedPercentage;
         heapLimits = heapLimits + '\n~~Remaining Heap limit -: '+ (Limits.getLimitHeapSize() - Limits.getHeapSize()) + ' ('+ Limits.getLimitHeapSize() + ' - ' + Limits.getHeapSize() +')';
         return heapLimits;
     }
     
     public static void checkFutureLimit(){
         
         system.debug('~~Remaining Future limit -: '+ Limits.getFutureCalls());
     }
     
     
     public static string returnFutureLimits(){
         string futureLimits = '\n~~Remaining Future limit -: '+ Limits.getFutureCalls();
         return futureLimits;
     }
     
     
 }