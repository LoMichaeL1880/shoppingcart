package demo.dao.banner;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Banner;

public class daoBanner {
	// banner : query all
	public List<Banner> queryAll(){
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT b FROM Banner b";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Banner.class);
		List<Banner> list = query.getResultList();
		return list;
	}
	
	// banner : query by id
	public Banner queryById(String id) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT b FROM Banner b where picid =:a";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Banner.class);
		query.setParameter("a", id);
		List<Banner> list = query.getResultList();
		Banner b = list.get(0);
		return b;
	}
	
	// banner : insert banner
	public static void insertBanner(Banner b) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		em.getTransaction().begin();
		em.persist(b);
		em.getTransaction().commit();
		em.close();
	}
	
	// banner : update status
	// banner : delete banner by id
	public static boolean deleteBanner(String id) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		em.getTransaction().begin();
		String jsql = "delete from Banner where picid =:a";
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
}
