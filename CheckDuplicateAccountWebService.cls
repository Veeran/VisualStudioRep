@RestResource(urlMapping='/checkdupaccount')
global class CheckDuplicateAccountWebService {
    
    @HttpPost
    global static String checkDupAccountFromEmail(String Name,String Email,String RecordtypeId){ 
        List<String> sExistingAccountIds = new List<String>();
        List<Account> lExistingAccounts = new List<Account>();
        final String errMsg = 'The email already exists on another Account: ';
        
        system.debug(' name ' + Name +'   Email ' + Email +'   RecordType ' + RecordtypeId);
        //Get the Account Record types to check
        Id QnewsrecTypeId   = Account.sObjectType.getDescribe().getRecordTypeInfosByName().get('Q Newsletter Subscriber').getRecordTypeId();
        Id QmemberrecTypeId = Account.sObjectType.getDescribe().getRecordTypeInfosByName().get('Quintessentially Member').getRecordTypeId();
        Id QCorprecTypeId   = Account.sObjectType.getDescribe().getRecordTypeInfosByName().get('Corporate Member').getRecordTypeId(); 
        
        //Filter the accounts for given Email and RecordType
        
        String finalSOQL = 'SELECT Id,Name FROM Account WHERE Email__c=:Email AND ( RecordTypeId =: QnewsrecTypeId OR RecordTypeId=: QmemberrecTypeId OR (RecordTypeId=: QCorprecTypeId AND OK_for_Q_Newsletters__c=true)  )';
        
        system.debug(' SOQL - '+finalSOQL);
        
        try{
            lExistingAccounts = database.query(finalSOQL); 
            if(lExistingAccounts.size()>0) {            
                for(Account acnt:lExistingAccounts){                
                    sExistingAccountIds.add(acnt.Id);                
                }
                return errMsg+ String.join(sExistingAccountIds, ',');
            }        
            else {
                Account a = new Account();
                a.Name = Name;
                a.Email__c = Email;
                a.recordTypeId = RecordtypeId;
                insert a;
                return a.id; 
            }
        }catch(Exception e){
            
            return e.getMessage();
        }
        
        
    }
    
}