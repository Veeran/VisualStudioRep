public class Quint_AccountEmailHandler{

public static void emailhandlerforaccount(list<Account>accounts){
final String errMsg = 'The email already exists on another Account: ';
  Set< String > emailSet = new Set< String >();
  string emailstr;
  for( Account acc :accounts) 
  if(acc.Email__c!=null && acc.Email__c!= '')
  emailSet.add(acc.Email__c);

  Map< String,string> duplicateContactMap = new Map<String,string>();
  Id QnewsrecTypeId   = Account.sObjectType.getDescribe().getRecordTypeInfosByName().get('Q Newsletter Subscriber').getRecordTypeId();
  Id QmemberrecTypeId = Account.sObjectType.getDescribe().getRecordTypeInfosByName().get('Quintessentially Member').getRecordTypeId();
  Id QCorprecTypeId   = Account.sObjectType.getDescribe().getRecordTypeInfosByName().get('Corporate Member').getRecordTypeId();
  list<Account> accountslist =  [select Id,RecordtypeId, Email__c from Account where  Email__c= :emailSet];
    for( Account acc:accountslist){
    if(acc.RecordtypeId == QnewsrecTypeId){
    duplicateContactMap.put(acc.Email__c,acc.Id);
    system.debug(' Duplicate Contact Id 1 is' + duplicateContactMap);
    // Checking in Private Members 
    }else if(acc.RecordtypeId == QmemberrecTypeId){
    duplicateContactMap.put(acc.Email__c,acc.Id);
    system.debug(' Duplicate Contact Id 2 is' + duplicateContactMap);
    }else if(acc.RecordtypeId == QCorprecTypeId && acc.OK_for_Q_Newsletters__c == true){
    duplicateContactMap.put(acc.Email__c,acc.Id);
    system.debug(' Duplicate Contact Id 3 is' + duplicateContactMap);
    }else{
    }
    }

    for( Account c : accounts ){
    Id duplicateContactId = duplicateContactMap.get(c.Email__c);
    if(duplicateContactId != null){
      c.addError( errMsg + duplicateContactId );
   }
  }

}
}