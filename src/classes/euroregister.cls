public class euroregister {

    List<Euro_Team__c> availableteams;
    Public List<Euro_Team__c> getavailableteams() {
        if(availableteams == null){
            availableteams = [SELECT ID,Name,Odds__c,User__c,User__r.Name from Euro_Team__c WHERE Dummy_Team__c=:false and User__c=:null ORDER BY Odds_Simple__c ASC, Name ASC];
        }
        return availableteams;
    }

    List<Euro_Team__c> takenteams;
    Public List<Euro_Team__c> gettakenteams() {
        if(takenteams == null){
            takenteams = [SELECT ID,Name,Odds__c,User__c,User__r.Name from Euro_Team__c WHERE Dummy_Team__c=:false and User__c!=null ORDER BY Odds_Simple__c ASC, Name ASC];
        }
        return takenteams;
    }
    
    List<Euro_Team__c> myteam;
    Public List<Euro_Team__c> getmyteam() {
        if(myteam== null){
            myteam = [SELECT Name,Odds__c,User__c,User__r.Name from Euro_Team__c WHERE Dummy_Team__c=:false and User__c=:UserInfo.getUserId() ORDER BY Odds_Simple__c ASC, Name ASC];
        }
        return myteam;
    }
    
    public pagereference selectmeateam() {
        Integer count = [SELECT COUNT() FROM Euro_Team__c where User__c=:null and Dummy_Team__c=:false];
        Integer rand = Math.floor(Math.random() * count).intValue();
        ID randomteam = [SELECT Id,Name FROM Euro_Team__c where User__c=:null and Dummy_Team__c=:false LIMIT 1 OFFSET :rand].id;
        PageReference redirect  = new PageReference('/apex/EuroSceptic?id=' +randomteam );
        redirect.setRedirect(true);
        return redirect;
    }
    
}