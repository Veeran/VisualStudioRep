public class createNewContactHelper{

@auraenabled
public static contact newContact(string parentAccountId,string firstName1,string lastName1){

system.debug('TEST LIGHTNING  + ');
Contact con = new Contact();
con.Firstname = firstName1;
con.Lastname = lastName1;
con.AccountId = parentAccountId;
insert con;
system.debug('TEST LIGHTNING 1  '  );

return con;
}

}