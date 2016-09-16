public class AccountHandler {
    public static Account insertNewAccount(String name)
    {
        try {
    Account acct = new Account(Name=name);
            insert acct;
            system.debug('Acct'+acct);
            return acct;       
        }
        catch (DmlException e) {
    
            System.debug('The String is empty String ' + e.getMessage());
            return null;
       }
        
        
    }
    

}