@isTest 
private class euroregisterTest {    
    static testMethod void test_all_basic(){
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        User u1 = new User(Alias = 'standt1',Country='United Kingdom',Email='demo1@randomdemodomain.com',EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',LocaleSidKey='en_US',ProfileId = p.Id,TimeZoneSidKey='America/Los_Angeles', UserName='dprobertdemo1@camfed.org');
        insert u1;
        
        Euro_Group__c eg = new Euro_Group__c(Name='Group A');
        insert eg;
        
        Euro_Team__c et1 = new Euro_Team__c(Name='France',Euro_Group__c=eg.id,RegistrationChatterPostSent__c=true);
        insert et1;
        
        Euro_Team__c et2 = new Euro_Team__c(Name='England',Euro_Group__c=eg.id);
        insert et2;
        
        Euro_Team__c et3 = new Euro_Team__c(Name='Germany',Euro_Group__c=eg.id);
        insert et3;
        


        System.runAs(u1){
            
            PageReference pageRef = Page.EuroRegister;
            

            Test.setCurrentPage(pageRef);
            euroregister controller = new euroregister();
    
            controller.getavailableteams();
            controller.gettakenteams();
            controller.getmyteam();
            controller.selectmeateam();
        }
    }
}