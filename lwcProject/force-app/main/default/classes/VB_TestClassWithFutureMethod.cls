public class VB_TestClassWithFutureMethod {

    // Define the future method
    @future(callout=true)
    public static void iAmFutureMethod(String caller) {
        System.debug('~~iAmFutureMethod, called from '+caller);
    }
}
