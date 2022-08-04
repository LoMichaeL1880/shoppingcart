package demo.dao.banner;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Member;
import model.Orderdetail;
import model.Orderlist;


public class daoOrder {
	
	// query all order list
	public List<Orderlist> queryAll() {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT o FROM Orderlist o";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Orderlist.class);
		List<Orderlist> list = query.getResultList();
		return list;
	}
	
	// query order list by orderid
	public List<Orderlist> queryOrderlistById(String id){
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "select o from Orderlist o where o.orderid =: a";
		Query query = em.createQuery(jsql, Orderlist.class);
		query.setParameter("a", id);
		List<Orderlist> list = query.getResultList();
		return list;
	}
	
	// query order list by member
	public List<Orderlist> queryOrderlistByMember(Member m){
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "select o from Orderlist o where o.member =:a";
		
		try {
			Query query = em.createQuery(jsql, Orderlist.class);
			query.setParameter("a", m);
			List<Orderlist> list = query.getResultList();
			return list;
		}catch(Exception e) {
			System.out.println("Query Orderlist by member failed");
			e.printStackTrace();
			return null;
		}
	}
	
	// query order detail by id
	public List<Orderdetail> queryOrderDetailById(String id){
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT o FROM Orderdetail o where o.orderid = :a";
		try {
			Query query = em.createQuery(jsql, Orderdetail.class);
			query.setParameter("a", id);
			List<Orderdetail> list = query.getResultList();
			return list;
		}catch(Exception e) {
			System.out.println("Query Orderdetail by orderid failed");
			e.printStackTrace();
			return null;
		}
	}
	
	// insert order list
	public boolean insertOrderList(Orderlist o) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(o);
			em.getTransaction().commit();
			em.close();
			return true;
		}catch(Exception e) {
			System.out.println("Insert order list fail");
			return false;
		}
	}
	
	// insert order detail
	public boolean insertOrderDetail(Orderdetail o) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		try {
			em.getTransaction().begin();
			em.persist(o);
			em.getTransaction().commit();
			em.close();
			return true;
		}catch(Exception e) {
			System.out.println("Insert order detail fail");
			return false;
		}
	}
	
	// update order detail
	public boolean updateOrderDetail(Orderdetail o) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		try {
			em.getTransaction().begin();
			em.merge(o);
			em.getTransaction().commit();
			em.close();
			return true;
		}catch(Exception e) {
			System.out.println("Update order detail fail");
			return false;
		}
	}
	
	// delete Order by id
//	public static boolean deleteOrder(String id) {
//		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
//		em.getTransaction().begin();
//		String jsql = "delete from Order where orderid =:a";
//		boolean flag = true;
//		
//		Query query = em.createQuery(jsql);
//		query.setParameter("a", id);
//		int r = query.executeUpdate();
//		
//		if(r>0) {
//			flag=true;
//			em.getTransaction().commit();
//		} else {
//			flag=false;
//			em.getTransaction().rollback();
//		}
//		em.close();
//		
//		return flag;
//	}
	

}
