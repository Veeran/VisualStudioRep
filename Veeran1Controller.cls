public class Veeran1Controller {
    
    @AuraEnabled
    public static String get_AccontSource(String recordId)
    {
        system.debug('record id = ' + recordid);
        Account record = [SELECT Id, Name, AccountSource From Account WHERE Id =: recordId];
        return record.AccountSource;
    }
}