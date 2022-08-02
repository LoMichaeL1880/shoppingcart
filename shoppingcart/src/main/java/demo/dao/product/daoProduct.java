package demo.dao.product;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Category;
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
	
	public List<Product> querySelling(){
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT b FROM Product b where b.status =:a";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Product.class);
		String status="selling";
		query.setParameter("a", status);
		List<Product> list = query.getResultList();
		return list;
	}
	
	public List<Product> queryStopSelling(){
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT b FROM Product b where b.status =:a";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Product.class);
		String status="stopselling";
		query.setParameter("a", status);
		List<Product> list = query.getResultList();
		return list;
	}
	
	public static Product queryById(String id) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT b FROM Product b where b.pid =:a";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Product.class);
		query.setParameter("a", id);
		List<Product> list = query.getResultList();
		Product p = list.get(0);
		return p;
	}
		
	public static List<Product> queryByCategory(String name){
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT b FROM Product b where b.category.name =:a";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Product.class);
		query.setParameter("a", name);
		List<Product> list = query.getResultList();
		return list;	
	}
	
	public static List<Product> queryBySellingCategory(String name){
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT b FROM Product b where b.category.name =:a AND b.status=:c";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Product.class);
		query.setParameter("a", name);
		query.setParameter("c", "selling");
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
	
	public static void updateProduct(Product p) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		
		System.out.println(p.toString());
		Product pr =em.find(Product.class, p.getPid());
		em.getTransaction().begin();
		pr.setPname(p.getPname());
		pr.setPprice(p.getPprice());
		pr.setPsize(p.getPsize());
		pr.setPcolor(p.getPcolor());
		pr.setPstock(p.getPstock());
		pr.setPintroduction(p.getPintroduction());
		pr.setPspecification(p.getPspecification());
		pr.setPuploaddate(p.getPuploaddate());
		pr.setPamount(p.getPamount());
		pr.setCategory(p.getCategory());
		pr.setPpicpath(p.getPpicpath());		
		pr.setPuploaddate(p.getPuploaddate());
		pr.setStatus("selling");
		System.out.println(p.toString());
		em.merge(pr);//新增=presist  修改=merge
		em.getTransaction().commit();
		em.close();
	}
	
	public static void deleteProduct(Product p) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();		
		Product pr =em.find(Product.class, p.getPid());
		em.getTransaction().begin();		
		pr.setPuploaddate(p.getPuploaddate());
		pr.setStatus(p.getStatus());
		System.out.println(p.toString());
		em.merge(pr);//新增=presist  修改=merge
		em.getTransaction().commit();
		em.close();
	}
	
	public static void turnSellingProduct(Product p) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();		
		Product pr =em.find(Product.class, p.getPid());
		em.getTransaction().begin();		
		pr.setPuploaddate(p.getPuploaddate());
		pr.setStatus(p.getStatus());
		System.out.println(p.toString());
		em.merge(pr);//新增=presist  修改=merge
		em.getTransaction().commit();
		em.close();
	}
	
	/*
	public static boolean deleteProduct(String id) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		em.getTransaction().begin();
		String jsql = "delete from Product where pid =:a";
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
		em.close();		
		return flag;
	}
	*/
 /*	
	public static void delete(String id)
	{
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("shoppingcart");  
	    EntityManager em=emf.createEntityManager();  
	    em.getTransaction().begin();  
	   
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
	
	    Product p=em.find(Product.class, id);  
		em.remove(p);  
		em.getTransaction().commit();  
		emf.close();  
		em.close();  
	}
*/
	
	/*
	public static boolean checkId(String id)
	{
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT from Product where pid =:a";
		boolean flag = true;		
		Query query = em.createQuery(jsql);
		query.setParameter("a", id);
		int r = query.executeUpdate();		
		if(r>0) {
			flag=true;
			//em.getTransaction().commit();
		} else {
			flag=false;
			//em.getTransaction().rollback();
		}		
		return flag;		
	}
	*/
}
