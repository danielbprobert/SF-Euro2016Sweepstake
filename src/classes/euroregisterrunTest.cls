@isTest 
private class euroregisterrunTest {    
    static testMethod void test_default(){
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
            
            ApexPages.standardController controller = new ApexPages.standardController(et3);
            euroregisterrun pag = new euroregisterrun(controller);
            pag.updateteam();
        }
    }
    static testMethod void test_alreadyhasateam(){
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        User u1 = new User(Alias = 'standt1',Country='United Kingdom',Email='demo1@randomdemodomain.com',EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',LocaleSidKey='en_US',ProfileId = p.Id,TimeZoneSidKey='America/Los_Angeles', UserName='dprobertdemo1@camfed.org');
        insert u1;
        
        Euro_Group__c eg = new Euro_Group__c(Name='Group A');
        insert eg;
        
        Euro_Team__c et1 = new Euro_Team__c(Name='France',Euro_Group__c=eg.id,RegistrationChatterPostSent__c=true);
        insert et1;
        
        Euro_Team__c et2 = new Euro_Team__c(Name='England',Euro_Group__c=eg.id,User__c=u1.id);
        insert et2;
        
        Euro_Team__c et3 = new Euro_Team__c(Name='Germany',Euro_Group__c=eg.id);
        insert et3;
        


        System.runAs(u1){
            
            ApexPages.standardController controller = new ApexPages.standardController(et3);
            euroregisterrun pag = new euroregisterrun(controller);
            pag.updateteam();
        }
    }
    static testMethod void test_currentteam(){
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        User u1 = new User(Alias = 'standt1',Country='United Kingdom',Email='demo1@randomdemodomain.com',EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',LocaleSidKey='en_US',ProfileId = p.Id,TimeZoneSidKey='America/Los_Angeles', UserName='dprobertdemo1@camfed.org');
        insert u1;
        
        Euro_Group__c eg = new Euro_Group__c(Name='Group A');
        insert eg;
        
        Euro_Team__c et1 = new Euro_Team__c(Name='France',Euro_Group__c=eg.id,RegistrationChatterPostSent__c=true);
        insert et1;
        
        Euro_Team__c et2 = new Euro_Team__c(Name='England',Euro_Group__c=eg.id);
        insert et2;
        
        Euro_Team__c et3 = new Euro_Team__c(Name='Germany',Euro_Group__c=eg.id,User__c=u1.id);
        insert et3;
        


        System.runAs(u1){
            
            ApexPages.standardController controller = new ApexPages.standardController(et3);
            euroregisterrun pag = new euroregisterrun(controller);
            pag.updateteam();
        }
    }
    static testMethod void test_someoneelseregistered(){
        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];
        User u1 = new User(Alias = 'standt1',Country='United Kingdom',Email='demo1@randomdemodomain.com',EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',LocaleSidKey='en_US',ProfileId = p.Id,TimeZoneSidKey='America/Los_Angeles', UserName='dprobertdemo1@camfed.org');
        insert u1;
        User u2 = new User(Alias = 'standt2',Country='United Kingdom',Email='demo2@randomdemodomain.com',EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',LocaleSidKey='en_US',ProfileId = p.Id,TimeZoneSidKey='America/Los_Angeles', UserName='dprobertdemo2@camfed.org');
        insert u2;
        
        Euro_Group__c eg = new Euro_Group__c(Name='Group A');
        insert eg;
        
        Euro_Team__c et1 = new Euro_Team__c(Name='France',Euro_Group__c=eg.id,RegistrationChatterPostSent__c=true);
        insert et1;
        
        Euro_Team__c et2 = new Euro_Team__c(Name='England',Euro_Group__c=eg.id);
        insert et2;
        
        Euro_Team__c et3 = new Euro_Team__c(Name='Germany',Euro_Group__c=eg.id,User__c=u2.id);
        insert et3;
        


        System.runAs(u1){
            
            ApexPages.standardController controller = new ApexPages.standardController(et3);
            euroregisterrun pag = new euroregisterrun(controller);
            pag.updateteam();
        }
    }
}