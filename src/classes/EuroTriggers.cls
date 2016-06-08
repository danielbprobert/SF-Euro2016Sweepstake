public class EuroTriggers {

    public static void matchmanagement(List<Euro_Match__c> lstmatches){
        for(Euro_Match__c match:lstmatches){
            // PERFORM GROUP STAGE MANAGEMENT
            if(match.Result__c==true && match.Euro_Group__c!=null){
                // get a list of home teams
               List<Euro_Team__c> hometeam = [select id,Group_Goals_For__c,Group_Goals_Against__c,Group_Played__c,Group_Drawn__c,Group_Won__c,Group_Lost__c from Euro_Team__c where ID=:match.Home_Team__c];
                // get a list of away teams
              List<Euro_Team__c> awayteam = [select id,Group_Goals_For__c,Group_Goals_Against__c,Group_Played__c,Group_Drawn__c,Group_Won__c,Group_Lost__c from Euro_Team__c where ID=:match.Away_Team__c];
                
                // loop through home teams              
              for(Euro_Team__c ht:hometeam){
                ht.Group_Goals_For__c = ht.Group_Goals_For__c+match.Home_Goals__c;
                ht.Group_Goals_Against__c = ht.Group_Goals_Against__c+match.Away_Goals__c;
                ht.Group_Played__c = ht.Group_Played__c+1;
                if(match.Home_Goals__c==match.Away_Goals__c){
                    ht.Group_Drawn__c = ht.Group_Drawn__c+1;
                }
                if(match.Home_Goals__c>match.Away_Goals__c){
                    ht.Group_Won__c = ht.Group_Won__c+1;
                }
                if(match.Home_Goals__c<match.Away_Goals__c){
                    ht.Group_Lost__c = ht.Group_Lost__c+1;
                }
                update ht;
              }
                // loop through away teams
              for(Euro_Team__c at:awayteam){
                at.Group_Goals_For__c = at.Group_Goals_For__c+match.Away_Goals__c;
                at.Group_Goals_Against__c = at.Group_Goals_Against__c+match.Home_Goals__c;
                at.Group_Played__c = at.Group_Played__c+1;
                if(match.Home_Goals__c==match.Away_Goals__c){
                    at.Group_Drawn__c = at.Group_Drawn__c+1;
                }
                if(match.Home_Goals__c<match.Away_Goals__c){
                    at.Group_Won__c = at.Group_Won__c+1;
                }
                if(match.Home_Goals__c>match.Away_Goals__c){
                    at.Group_Lost__c = at.Group_Lost__c+1;
                }
                update at;
              }
            }
        }
    }
}