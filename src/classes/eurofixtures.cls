public class eurofixtures {

    List<Euro_Match__c> fixtures;
    public List<Euro_Match__c> getfixtures(){
        if(fixtures == null){
            fixtures = [SELECT ID, Name, Home_Team__r.Name, Home_Goals__c, Away_Team__r.Name, Away_Goals__c, Result__c, Kick_Off__c, Ground__c, Knockout_rounds__c, Euro_Group__r.Name from Euro_Match__c order by Kick_Off__c ASC];
        }
        return fixtures;
    }
    
    List<Euro_Team__c> myteam;
    Public List<Euro_Team__c> getmyteam() {
        if(myteam== null){
            myteam = [SELECT Name,Odds__c,User__c,User__r.Name from Euro_Team__c WHERE Dummy_Team__c=:false and User__c=:UserInfo.getUserId() ORDER BY Odds_Simple__c ASC, Name ASC];
        }
        return myteam;
    }
}