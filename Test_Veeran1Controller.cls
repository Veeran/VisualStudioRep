@isTest 
private class Test_Veeran1Controller {
    static testMethod void method1() {
        Account acc = new Account(Name='Test Account', AccountSource='Q-web');
        insert acc;
        Veeran1Controller.get_AccontSource(acc.id);
    }
}