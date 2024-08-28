@isTest
public class AccountManagerTest {
   @isTest 
    static void testGetAccountById() {
        Account newacc = new Account(Name = 'Test Account 1');
        insert newacc;
        Contact newcon = new Contact(accountid=newacc.Id, firstname='sai', lastname='aditya');
        insert newcon;
        
        Id recordId = newacc.Id;
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://developercom228-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account acc = AccountManager.getAccount();
        // Verify results
        System.assert(acc != null);
        System.assertEquals(recordId, acc.Id);
    }
}