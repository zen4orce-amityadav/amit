trigger ClosedOpportunityTrigger on Opportunity (after insert,after update){
list<task> tasklist=new list<task>();
 for (Opportunity opp : [SELECT Id,NAME FROM Opportunity
                         WHERE Id IN :Trigger.New AND  stagename='Closed Won']){
     tasklist.add(new task(subject='Follow Up Test Task',whatid=opp.id));
}
   if(tasklist.size() >0)
{
    insert tasklist;
}
}