@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount(){
     	RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
           
        Account result =  [SELECT Id,Name, (select id, firstname, lastname from contacts)
                        FROM Account
                        WHERE Id = :accountId];
        return result;   
    }
}