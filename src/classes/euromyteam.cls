public class euromyteam {
    
    public Euro_Team__c myteam;
    public Euro_Team__c getmyteam(){
        return myteam;
    }
    public euromyteam(){
    try {
        myteam = [SELECT ID, NAME FROM Euro_Team__c where User__c=:UserInfo.getUserId()];
        }
        catch(Exception ex) {
            myteam = null;
        }
    }

    List<Euro_Match__c> fixtures;
    public List<Euro_Match__c> getfixtures() {
        if(fixtures == null) {
            fixtures = [SELECT Name,Knockout_rounds__c,Euro_Group__r.Name,Home_Team__r.Name,Away_Goals__c,Home_Goals__c,Result__c,Away_Team__r.Name,Kick_Off__c,Ground__c FROM Euro_Match__c WHERE Home_Team__c=:myteam.id or Away_Team__c=:myteam.id];
        }
        return fixtures;
    }
}