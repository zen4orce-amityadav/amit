trigger opportunitynotificationalert on Opportunity (after insert,after update) {
    list<Opportunity> opplist= new list<Opportunity>();
  Opportunity ob  =[select Ownerid,owner.manager.id,owner.manager.email from Opportunity];
    for(Opportunity o : trigger.new)
    {
        if(o.amount > 25000)
        {
            id userid=o.ownerid;
           Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
// Set recipients to two contact IDs.
// Replace IDs with valid record IDs in your org.
list<emailtemplate> ets= new list<emailtemplate>();
emailtemplate et=[select id from emailtemplate where name='Opportunity'];
message.toAddresses = new String[] {'userid.email'};
message.settargetobjectid(ob.owner.manager.email);
message.setwhatid(o.id);            
//message.templateid(et.id);            
message.optOutPolicy = 'FILTER';
message.subject = 'send a mail';
message.plainTextBody = 'This is the message body.';
Messaging.SingleEmailMessage[] messages = 
    new List<Messaging.SingleEmailMessage> {message};
         Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
if (results[0].success) {
    System.debug('The email was sent successfully.');
} else {
    System.debug('The email failed to send: '
          + results[0].errors[0].message);
}
        }
    
    }    
}