package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.UserData;

public class UserDao {
	
	private SessionFactory factory;
	public UserDao(SessionFactory factory) {
		this.factory = factory;
	}
    // get user by email and password
	
	public UserData getUserByEmailAndPassword(String email , String password) {
		UserData user = null;
		try {
			String query = "from UserData where userEmail =:e and userPassword =:p";
			Session session = this.factory.openSession();
		Query q= session.createQuery(query);
		q.setParameter("e",email);
		q.setParameter("p",password);
		user = (UserData) q.uniqueResult();
		session.close();
		}
		catch(Exception e) {
		e.printStackTrace();	
		}
		return user;		
	}
	
	public UserData getUserByEmail(String email) {
		UserData user = null;
		try {
			String query = "from UserData where userEmail =:e ";
			Session session = this.factory.openSession();
		Query q= session.createQuery(query);
		q.setParameter("e",email);
		user = (UserData) q.uniqueResult();
		session.close();
		}
		catch(Exception e) {
		e.printStackTrace();	
		}
		return user;		
	}
	
	public boolean updatePasswordByEmail(String email, String newPassword) {
        Session session = null;
        Transaction transaction = null;
        try {
        	String query = "from UserData where userEmail =:e ";
            session = this.factory.openSession();
            transaction = session.beginTransaction();
            Query q= session.createQuery(query);
            q.setParameter("e",email);
    	    UserData user = (UserData) q.uniqueResult();
            

            if (user != null) {
             user.setUserPassword(newPassword);
             session.update(user);
                }

           transaction.commit();
           session.close();
           return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
            
        } finally {
            if (session != null) {
                session.close();
            }
            
        }
	
    }
	
	
}
