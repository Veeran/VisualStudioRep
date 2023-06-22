public class CS_Casehandler{

public static void casehandler(list<contact>contacts){
    List<Case> cases = new List<Case>();
    for(Contact con: contacts) {
    //Create a New case with Origin As New Contact (New Feture brnch)
    Case cas = new case();
    cas.Contactid = con.id;
    cas.Origin = 'New Contact';
    cas.Status = 'Working';
    cas.OwnerId = con.OwnerId;
    if(con.AccountId != null){
    cas.AccountId = con.AccountId;
    } 
    if(con.Level__c == 'Primary'){
    cas.Priority = 'High';
    }
    if(con.Level__c == 'Secondary'){
    cas.Priority = 'Medium';
    }
    if(con.Level__c == 'Tertiary'){
    cas.Priority = 'Low';
    }
    cases.add(cas);
    }
  // Checking List Size
  if(cases.size()>0) {
   insert cases;
}
}
}