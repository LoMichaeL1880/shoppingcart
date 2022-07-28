package demo.dao.banner;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.Query;


import model.Order;

public class daoOrder {

	public List<Order> queryAll() {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT o from Order o";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Order.class);
		List<Order> list = query.getResultList();
		return list;
		
	}
	// banner : delete Order by id
		public static boolean deleteOrder(String id) {
			EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
			em.getTransaction().begin();
			String jsql = "delete from Order where orderid =:a";
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
		public static void delete(Long id) {
			// TODO Auto-generated method stub
			
		}

}
