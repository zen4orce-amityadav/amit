public class dedupcheckHandler {
 public Static void dedupcheckLeads(List<Lead> newList )
    {
    Map<String, Lead> leadMap = new Map<String, Lead>();
    for(Lead l  : [select id,Email,Phone from Lead where email != null AND Phone != null]) 
    {
       if(l.Email != null && l.Phone != null)
       {
         leadMap.put(l.Email+l.Phone,l);
       }
    }
  

    for (Lead lead :newList )
    {
       if(lead.Email !=null || lead.Phone !=null)
       {
            if (leadMap.containsKey(lead.Email+lead.Phone))
            {
                lead.addError('Record already exists');
            }
            leadMap.put(lead.Email+lead.Phone,lead);
       }
    }
    
 
           
    }
}