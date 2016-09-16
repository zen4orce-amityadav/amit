trigger addingtaskonlead on Lead (after insert) {
   list<task> tasklist=new list<task>();
 for (lead l : [SELECT Id,NAME FROM lead
                         WHERE Id IN :Trigger.New ]){
     tasklist.add(new task(subject='new task',whoid=l.id));
}
   if(tasklist.size() >0)
{
    insert tasklist;
}
}