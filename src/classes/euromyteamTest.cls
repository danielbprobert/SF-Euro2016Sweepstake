@isTest 
private class euromyteamTest {    
    static testMethod void test_all_basic(){
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        User u1 = new User(Alias = 'standt1',Country='United Kingdom',Email='demo1@randomdemodomain.com',EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',LocaleSidKey='en_US',ProfileId = p.Id,TimeZoneSidKey='America/Los_Angeles', UserName='dprobertdemo1@camfed.org');
        insert u1;
        
        Euro_Group__c eg = new Euro_Group__c(Name='Group A');
        insert eg;
        
        Euro_Team__c et1 = new Euro_Team__c(Name='France',Euro_Group__c=eg.id,User__c=u1.id,RegistrationChatterPostSent__c=true);
        insert et1;
        
        Euro_Team__c et2 = new Euro_Team__c(Name='England',Euro_Group__c=eg.id);
        insert et2;
        
        Euro_Match__c mt = new Euro_Match__c(Name='10 Jun',Home_Team__c=et1.id,Away_Team__c=et2.id,Euro_Group__c=eg.id,Result_Shared__c=true);
        insert mt;

        System.runAs(u1){
            PageReference pageRef = Page.EuroMyTeam;
            Test.setCurrentPage(pageRef);
            euromyteam controller = new euromyteam();
    
            controller.getfixtures();
            controller.getmyteam();
        }
    }
}