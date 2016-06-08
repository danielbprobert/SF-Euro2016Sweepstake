trigger EuroTrigger on Euro_Match__c (after update) {
    EuroTriggers.matchmanagement(trigger.new);
}