trigger DeDupeCheck on Lead (before insert,after insert,before update) {
    
     if(Trigger.isBefore){
  
        if(Trigger.isInsert)
    {
           dedupcheckHandler.dedupcheckLeads(Trigger.new);
    }
}
}