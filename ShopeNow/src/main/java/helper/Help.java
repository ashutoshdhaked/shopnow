package helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Help {

	public static Map<String,Long>  getCounts(SessionFactory factory) {
	Session session=factory.openSession();
		String q1 = "Select count(*) from UserData";
		String q2="Select count(*) from Product";
		Query query1=session.createQuery(q1);
		Query query2=session.createQuery(q2);
		Long userCount = (Long)query1.list().get(0);
		Long productCount = (Long)query2.list().get(0);
		Map<String,Long> map = new HashMap<>();
		map.put("userCount",userCount);
		map.put("productCount",productCount);
		session.close();
		return map;
	}
	
	
}
