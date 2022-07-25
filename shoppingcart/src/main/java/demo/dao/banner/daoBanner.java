package demo.dao.banner;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.Banner;

public class daoBanner {
	public List<Banner> queryAll(){
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT b FROM Banner b";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Banner.class);
		List<Banner> list = query.getResultList();
		return list;
	}
}
