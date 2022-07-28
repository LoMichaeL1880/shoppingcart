package demo.dao.product;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Product;

public interface productDao {

	public static void add(Product p) 
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("shoppingcart");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();
        em.close();
        emf.close();
	}
	
	public static boolean productUpdate(String pid, String pname) //, int pprice, String psize, String pcolor, int pstock, String pintroduction, String pspecification, String puploaddate, int pamount, int category
	{
    	EntityManagerFactory emf = Persistence.createEntityManagerFactory("shoppingcart");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
         Query query = em.createQuery("update Product SET pname=:a  where pid=:b");
        query.setParameter("a", pname);
        query.setParameter("b", pid);
        int r=query.executeUpdate();
        boolean flag=true;
        if(r>0) {
        	System.out.println("update successfully");
        	flag=true;
        }
        else {
        	System.out.println("update failed");
        	flag=false;
        }
        em.getTransaction().commit();
        em.close();
        emf.close();
        return flag;
    }
	
	public static boolean studentDelete(int sid) 
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("shoppingcart");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Query query = em.createQuery("delete from Prodcutt where pid=:s");
        query.setParameter("s", sid);        
        int r=query.executeUpdate();
        boolean flag=true;
        if(r>0) 
        {
        	System.out.println("delete successfully");
        	flag=true;
        }
        else {
        	System.out.println("delete failed");
        	flag=false;
        }
        em.getTransaction().commit();
        em.close();
        emf.close();
        return flag;
	}
}
