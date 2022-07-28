package demo.dao.product;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Product;

public class daoProduct {

	public List<Product> queryAll(){
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT b FROM Product b";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Product.class);
		List<Product> list = query.getResultList();
		return list;
	}
	
	public static void add(Product s) 
	{
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("shoppingcart");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(s);
        em.getTransaction().commit();
        em.close();
        emf.close();
	}
	
	public static void delete(String id)
	{
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("shoppingcart");  
	    EntityManager em=emf.createEntityManager();  
	    em.getTransaction().begin();  
	    /*
	    String jsql = "delete from Product where picid =:a";
		boolean flag = true;		
		Query query = em.createQuery(jsql);
		query.setParameter("a", id);
		int r = query.executeUpdate();		
		if(r>0) {
			flag=true;
			em.getTransaction().commit();
		} else {
			flag=false;
			em.getTransaction().rollback();
		}		
		return flag;
		*/
	    Product p=em.find(Product.class, id);  
		em.remove(p);  
		em.getTransaction().commit();  
		emf.close();  
		em.close();  
	}
}
