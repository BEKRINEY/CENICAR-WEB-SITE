package data_base;

import java.util.Date;
import java.util.List;






import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.sun.org.apache.regexp.internal.recompile;

import util.HibernateUtil;

public class  Services <E> {
	
	private static SessionFactory factory; 
	
	

	
	/**
	 * 
	 *  Génerique 
	 */
	
	public boolean add(E v){
   Session session =  HibernateUtil.getSessionFactory().getCurrentSession();	
	      Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         session.save(v); 
	         tx.commit();
	         return true;
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	         return false;
	      }
	    
	}
	
	public List<E> getAll(String _Class){
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx= null;
		try{
	    tx = session.beginTransaction();
		List<E> list= session.createQuery("from "+_Class).list();
		tx.commit();
		return list;
		}catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	         return null;
	      }
	}
	
	public boolean update(E entity){
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx= null;
		try{
	    tx = session.beginTransaction();
		session.update(entity);
		tx.commit();
		return true;
		}catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	         return false;
	      }
	}
	
	public boolean delete(Long id, Class<E> c){
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx= null;
		try{
	    tx = session.beginTransaction();
	    E u = (E) session.get(c, id);
		session.delete(u);
		session.getTransaction().commit();
		return true;
		}catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	         return false;
	      }
	}
	
	public E getById(Long id , Class<E> class1){
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		E u = null ;
		Transaction tx= null;

		try{
			  tx = session.beginTransaction();
			 u = (E) session.get(class1, id);
			session.getTransaction().commit();
	     return u;
		}catch (HibernateException e) {
	         e.printStackTrace(); 
	         return null;
		}
	}
	
	
	public List<E> getAllWhere(String _T , String cond){
		Session session =  HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction tx= null;
		try{
	    tx = session.beginTransaction();
		List<E> list= session.createQuery("from "+_T+" where "+cond).list();
		tx.commit();
		return list;
		}catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	         return null;
	      }
	}
	


}
