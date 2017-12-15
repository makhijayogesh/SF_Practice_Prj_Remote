public class Map_Example {
    Map<Integer,String> m;
    Public Map_Example()
    {
    	m=new Map<Integer,String>();
    	m.put(1,'First Map Value');
        m.put(2,'Second Map Value');
    }
	public void Display()
    {
 		System.debug('In Debug');
        System.assertEquals(True,m.containsKey(1),'on success nothing displays');
        String s=m.get(1);
        System.debug('The value of first key is ='+s);
    
    }
}