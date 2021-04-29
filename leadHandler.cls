public class leadHandler{

public static void customerCountupdateonLead(list<lead>leads,map<Id,lead>oldrecordsmap){
 
    Set<Id> setAccountIds = new Set<Id>();
    for(lead ld: leads){
        if(ld.Company__c != null){
        setAccountIds.add(ld.Company__c);
    }
  }
    List<Contact> contacts = [Select Id,Name from Contact Where AccountId IN: setAccountIds];
    system.debug( 'Contacts in Account are   '   + contacts.size());
      
    for(lead a: leads){
    if(a.Company__c != null){
        a.Customer_Count__c = contacts.size();
        }else{
       a.Customer_Count__c = null;
        }
    }
    
     }
  }