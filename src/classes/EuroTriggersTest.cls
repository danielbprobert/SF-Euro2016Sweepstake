@isTest 
private class EuroTriggersTest {
    private static Euro_Group__c eg;
    private static Euro_Team__c et1;
    private static Euro_Team__c et2;
    private static Euro_Match__c mt;
    
    private static void setupData(){
        eg = new Euro_Group__c(Name='Group A');
        insert eg;
        
        et1 = new Euro_Team__c(Name='France',Euro_Group__c=eg.id);
        insert et1;
        
        et2 = new Euro_Team__c(Name='England',Euro_Group__c=eg.id);
        insert et2;
        
        mt = new Euro_Match__c(Name='10 Jun',Home_Team__c=et1.id,Away_Team__c=et2.id,Euro_Group__c=eg.id,Result_Shared__c=true);
        insert mt;

    }
    
    static testMethod void test_homewin(){
        setupData();
        
        mt.Home_Goals__c=2;
        mt.Away_Goals__c=1;
        mt.Result__c=true;
        update mt;
        
        integer homepoints = [select count() from Euro_Team__c where Name=:'France' and Group_Points__c=:3];
        system.assertequals(1,homepoints);
        integer awaypoints = [select count() from Euro_Team__c where Name=:'England' and Group_Points__c=:0];
        system.assertequals(1,awaypoints);
    }
    
    static testMethod void test_awaywin(){
        setupData();
        
        mt.Home_Goals__c=2;
        mt.Away_Goals__c=3;
        mt.Result__c=true;
        update mt;
        
        integer homepoints = [select count() from Euro_Team__c where Name=:'France' and Group_Points__c=:0];
        system.assertequals(1,homepoints);
        integer awaypoints = [select count() from Euro_Team__c where Name=:'England' and Group_Points__c=:3];
        system.assertequals(1,awaypoints);
    
    }
    
    static testMethod void test_draw(){
        setupData();
        
        mt.Home_Goals__c=2;
        mt.Away_Goals__c=2;
        mt.Result__c=true;
        update mt;
        
        integer homepoints = [select count() from Euro_Team__c where Name=:'France' and Group_Points__c=:1];
        system.assertequals(1,homepoints);
        integer awaypoints = [select count() from Euro_Team__c where Name=:'England' and Group_Points__c=:1];
        system.assertequals(1,awaypoints);
    
    }
}