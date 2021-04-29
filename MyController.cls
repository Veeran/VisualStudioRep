public class MyController {
Account account;
public PageReference save() {
try{
update account;
}
catch(DmlException ex){
ApexPages.addMessages(ex);
}
//return null;
PageReference redirectSuccess = new ApexPages.StandardController(Account).view();

return (redirectSuccess);

}


public String getName() {
return 'MyController';
}
public Account getAccount() {
if(account == null)
account = [select id, name, Newsletter__c from Account
where id = :ApexPages.currentPage().getParameters().get('id')];
return account;
}
}