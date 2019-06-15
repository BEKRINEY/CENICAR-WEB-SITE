package util;


import module.*;
import module.Type;


import org.hibernate.HibernateException; 
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    public static final SessionFactory sessionFactory;

    static {
    	 try{
    		 sessionFactory = new AnnotationConfiguration().
                       configure("Hibernate.cfg.xml").
                     //  addPackage("module") //add package if used.
                       addAnnotatedClass(Type.class)
                       .addAnnotatedClass(Marque.class)
                        .addAnnotatedClass(Voiture.class)
                        .addAnnotatedClass(Utilisateur.class)
                         .addAnnotatedClass(Location.class)
                         .addAnnotatedClass(Payement.class)
                         .addAnnotatedClass(Offre.class)
                       .buildSessionFactory();
          }catch (Throwable ex) { 
             System.err.println("Failed to create sessionFactory object." + ex);
             throw new ExceptionInInitializerError(ex); 
          }
    }

   // public static final ThreadLocal session = new ThreadLocal();

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
