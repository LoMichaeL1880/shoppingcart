package demo.dao.banner;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Orderdetail;
import model.Orderlist;


public class daoOrder {
	
	private void mian() {
		List<Orderdetail> list = new daoOrder().queryOrderDetailById("1");
		System.out.println(list);
	}
	
	// query all order list
	public List<Orderlist> queryAll() {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT o FROM Orderlist o";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Orderlist.class);
		List<Orderlist> list = query.getResultList();
		return list;
	}
	
	// query order by id
	public List<Orderlist> queryOrderlistById(String id){
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "select o from Orderlist o where o.orderid =: a";
		Query query = em.createQuery(jsql, Orderdetail.class);
		query.setParameter("a", id);
		List<Orderlist> list = query.getResultList();
		return list;
	}
	
	// query order detail by id
	public List<Orderdetail> queryOrderDetailById(String id){
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT o FROM Orderdetail o where o.orderid=:a";
		Query query = em.createQuery(jsql, Orderdetail.class);
		query.setParameter("a", id);
		List<Orderdetail> list = query.getResultList();
		return list;
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
