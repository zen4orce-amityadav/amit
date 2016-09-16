trigger dedupecheck1 on Lead (before insert) {
list<lead> lt=new list<lead>();
    lt= [select id,email,phone from lead where email!=null and phone!=null];
    for(lead lts: trigger.new)
    {
        for(lead l1 : lt)
        {
        	if(l1.email==lts.email && l1.phone==lts.phone)
        	{
            	lts.adderror('they record already exist');
        	}
        	//lts.put(lt.email,lt.phone);
        }
    }
}