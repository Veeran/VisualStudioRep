@istest
public class CS_casehandler_test{

public static testmethod void casehandlertest(){

Account acc = new Account();
acc.name = 'GVK Industries';
insert acc;


User u = new user();
u.LastName = 'Krish';
u.FirstName = 'ram';
u.Alias = 'rkrish';
u.ProfileId = [SELECT Id FROM Profile WHERE Name = 'system administrator'].Id;
u.CommunityNickname = 'krish.ram';
u.TimeZoneSidKey = 'GMT';
u.EmailEncodingKey = 'UTF-8';
u.LanguageLocaleKey = 'en_US';
u.LocaleSidKey = 'en_US';
u.email = 'test@gmail.com';
u.username = 'krish@nucleus-cf.co.uk';
insert u;

contact con  = new contact();
con.lastname = 'Test';
con.Level__c = 'Secondary';
con.AccountId = acc.Id;
con.OwnerId = u.Id;

contact cont  = new contact();
cont.lastname = 'James';
cont.Level__c = 'Primary';
cont.AccountId = acc.Id;
cont.OwnerId = u.Id;

contact conn  = new contact();
conn.lastname = 'Test';
conn.Level__c = 'Tertiary';
conn.AccountId = acc.Id;
conn.OwnerId = u.Id;

test.starttest();

insert con;
system.assert(con.Id != null);
system.assert(con.AccountId != null);
system.assert(U.Id!= null);
system.assert(con.OwnerId != null);
case cas = new case();
cas.origin = 'New Contact'; 
cas.ContactId = con.Id;
cas.AccountId = acc.Id;
cas.Priority = 'High';
cas.Origin = 'New Contact';
cas.Status = 'Working';
cas.OwnerId = con.OwnerId;
insert cas;


insert cont;
system.assert(cont.Id != null);
system.assert(cont.AccountId != null);
system.assert(U.Id!= null);
system.assert(cont.OwnerId != null);
case cse = new case();
cse.origin = 'New Contact'; 
cse.ContactId = cont.Id;
cse.AccountId = acc.Id;
cse.Priority = 'Medium';
cse.Origin = 'New Contact';
cse.Status = 'Working';
cse.OwnerId = cont.OwnerId;
insert cse;


insert conn;
system.assert(conn.Id != null);
system.assert(conn.AccountId != null);
system.assert(U.Id!= null);
system.assert(conn.OwnerId != null);
case cs = new case();
cs.origin = 'New Contact'; 
cs.ContactId = conn.Id;
cs.AccountId = acc.Id;
cs.Priority = 'Low';
cs.Origin = 'New Contact';
cs.Status = 'Working';
cs.OwnerId = conn.OwnerId;
insert cs;

test.stoptest();
system.assertequals(cs.ContactId,conn.Id);
system.assertequals(cse.ContactId,cont.Id);
system.assertequals(cas.ContactId,con.Id);


}
}