@isTest 
private class eurofixturesTest {
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
    
    static testMethod void test_all_basic(){
        setupData();
        
        PageReference pageRef = Page.EuroFixtures;
        Test.setCurrentPage(pageRef);
        eurofixtures controller = new eurofixtures();
    
        controller.getfixtures();
        controller.getmyteam();
        
    }
}