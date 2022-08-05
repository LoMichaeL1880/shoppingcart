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
	public static Banner queryById(String id) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT b FROM Banner b where picid =:a";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Banner.class);
		query.setParameter("a", id);
		List<Banner> list = query.getResultList();
		Banner b = list.get(0);
		return b;
	}
	
	// banner : query for pagination
	public static List<Banner> queryForPagination(int start,int num){
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "select b from Banner b ";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql);
		List<Banner> list = query.setFirstResult(start).setMaxResults(num).getResultList();
		em.getTransaction().commit();
		em.close();
		return list;
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
	public static void updateBanner(Banner b) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		em.getTransaction().begin();
		Banner b2 = daoBanner.queryById(b.getPicid());
		b2.setPicname(b.getPicname());
		b2.setHyperlink(b.getHyperlink());
		b2.setPath(b.getPath());
		em.persist(b2);
		em.getTransaction().commit();
		em.close();
	}
	
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
