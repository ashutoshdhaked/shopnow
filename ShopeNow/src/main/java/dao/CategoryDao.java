package dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import entities.Category;

public class CategoryDao {
  private SessionFactory factory;
  public CategoryDao(SessionFactory factory) {
	  this.factory=factory;
  }
  
  public int  saveCategory(Category cat) {
	  int cardId =0;
	  try {
		  Session session= this.factory.openSession();
		  Transaction tx = session.beginTransaction();
		   cardId =(int)session.save(cat);
		  tx.commit();
		  session.close();
		  return cardId;
	  }
	  catch (Exception e) {
		e.printStackTrace();
	   }
	  return cardId; 
	  
  }
  public List<Category> getCategories(){
	  Session s = this.factory.openSession();
	   Query<Category> query = s.createQuery("from Category");
	   List<Category> list = query.list();
	   s.close();
	  return list;
  }
  
  public Category getCategory(int cid) {
	  Category c = null;
	  try {
		  Session session = this.factory.openSession();
		  c = session.get(Category.class, cid);
		  session.close();
	  }
	  catch(Exception e) {
		  e.printStackTrace();
	  }
	  
	return c;  
  }
  
}
