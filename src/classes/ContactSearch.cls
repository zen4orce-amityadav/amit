public class ContactSearch { 
    public static List<Contact> searchForContacts(String ln,String mpa)
    {
        List<Contact> cont=[select id,Name from Contact where lastname=:ln and MailingPostalCode=:mpa];
        return cont;
        
    }
}