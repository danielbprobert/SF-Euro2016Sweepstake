public class eurodetails {

    List<Euro_Group__c> eurogroups;
    Public List<Euro_Group__c> geteurogroups() {
        if(eurogroups == null) {
            eurogroups = [select Name, (SELECT Name,Home_Team__r.Name,Away_Goals__c,Home_Goals__c,Result__c,Away_Team__r.Name,Kick_Off__c,Ground__c FROM Euro_Matches__r order by Name ASC),(SELECT Name,Group_Won__c,Group_Points__c,Group_Played__c,Group_Lost__c,Group_Goals_For__c,Group_Goals_Against__c,Group_Goal_Difference__c,Group_Drawn__c,User__c from Euro_Teams__r ORDER BY Group_Points__c DESC,Group_Goal_Difference__c DESC,Group_Goals_For__c DESC)  from Euro_Group__c order by Name ASC];
        }
        return eurogroups;
    }
    
    List<Euro_Match__c> roundof16;
    Public List<Euro_Match__c> getroundof16() {
        if(roundof16 == null) {
            roundof16 = [SELECT Name,Home_Team__r.Name,Away_Goals__c,Home_Goals__c,Result__c,Away_Team__r.Name,Kick_Off__c,Ground__c FROM Euro_Match__c where Knockout_rounds__c=:'Round of 16' order by Name ASC];
        }
        return roundof16;
    }
    
    List<Euro_Match__c> quarters;
    Public List<Euro_Match__c> getquarters() {
        if(quarters == null) {
            quarters = [SELECT Name,Home_Team__r.Name,Away_Goals__c,Home_Goals__c,Result__c,Away_Team__r.Name,Kick_Off__c,Ground__c FROM Euro_Match__c where Knockout_rounds__c=:'Quarter-finals' order by Name ASC];
        }
        return quarters;
    }
    
    List<Euro_Match__c> semis;
    Public List<Euro_Match__c> getsemis() {
        if(semis == null) {
            semis = [SELECT Name,Home_Team__r.Name,Away_Goals__c,Home_Goals__c,Result__c,Away_Team__r.Name,Kick_Off__c,Ground__c FROM Euro_Match__c where Knockout_rounds__c=:'Semi-finals' order by Name ASC];
        }
        return semis;
    }
    
    List<Euro_Match__c> grandfinal;
    Public List<Euro_Match__c> getgrandfinal() {
        if(grandfinal == null) {
            grandfinal = [SELECT Name,Home_Team__r.Name,Away_Goals__c,Home_Goals__c,Result__c,Away_Team__r.Name,Kick_Off__c,Ground__c FROM Euro_Match__c where Knockout_rounds__c=:'Final' order by Name ASC];
        }
        return grandfinal;
    }
    
    List<Euro_Team__c> myteam;
    Public List<Euro_Team__c> getmyteam() {
        if(myteam== null){
            myteam = [SELECT Name,Odds__c,User__c,User__r.Name from Euro_Team__c WHERE Dummy_Team__c=:false and User__c=:UserInfo.getUserId() ORDER BY Odds_Simple__c ASC, Name ASC];
        }
        return myteam;
    }
}