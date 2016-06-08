public class euroregisterrun {
    public Boolean initialised{get; set;}
    public Boolean youallreadyhaveateam {get; set;}
    public Boolean thisisyourteam {get; set;}
    public boolean success {get; set;}
    public boolean someonehasgotthisone {get; set;}
    public Euro_Team__c eurot;
    public euroregisterrun(ApexPages.StandardController controller) {
        initialised=false;
        youallreadyhaveateam=false;
        success=false;
        someonehasgotthisone=false;
        thisisyourteam=false;
        //controller.addFields(new List<String>{'ID','User__c'});
        this.eurot= (Euro_Team__c)controller.getRecord();
    }
    
    public void updateteam() {
        ID currentuserid = UserInfo.getUserId();
        if (!initialised) {
            if(eurot.User__c==null){
                List<Euro_Team__c> yourteams = [select id, user__c from Euro_Team__c where User__c=:currentuserid];
                if(yourteams.size()==0){
                    Euro_Team__c euroteam = new Euro_Team__c(id=eurot.id);
                        euroteam.User__c=currentuserid;
                    update euroteam;
                    initialised=true;
                    success=true;
                }
                if(yourteams.size()>0){
                    initialised=true;
                    youallreadyhaveateam=true;
                }
            }
            if(eurot.User__c!=null){
                if(eurot.User__c==currentuserid){
                    thisisyourteam=true;
                    initialised=true;
                }
                if(eurot.User__c!=currentuserid){
                    someonehasgotthisone=true;
                    initialised=true;
                }
            }
        }
    }       

}