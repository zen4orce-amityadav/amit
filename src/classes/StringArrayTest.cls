public class StringArrayTest {
    public static List<String> generateStringArray(Integer n)
    {
        List<String> List1 = new List<String>();
        for(Integer i =0; i < n; ++i)
        {
            List1.add('Test ' + i);
        }
            system.debug('List'+List1);
        return List1;
    }
}