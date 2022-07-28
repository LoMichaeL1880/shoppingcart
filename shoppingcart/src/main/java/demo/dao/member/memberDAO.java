package demo.dao.member;

import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import model.Banner;
import model.Member;


public class memberDAO {
	public List<Member> queryAll() {
		
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT m FROM Member m";
		em.getTransaction().begin();
		//Query query = em.createQuery(jsql, Member.class);
		Query query=em.createNamedQuery("Member.findAll");
		List<Member> list = query.getResultList();
		return list;
	}
	
	public static void MemberAdd(Member m) {
		
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		
        em.getTransaction().begin();
        em.persist(m);        
        em.getTransaction().commit();
        em.close();
    }
	
	
	public static boolean MemberDelete(String account) {
				
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("shoppingcart");
        EntityManager em = emf.createEntityManager();

        em.getTransaction().begin();

        Query query = em.createQuery("delete from member where account=:a");
        query.setParameter("a", account);
        
        int r=query.executeUpdate();
        boolean flag=true;
        if(r>0) {
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

	/*public static boolean MemberUpdate(String account,String password) {
	   	EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
	    em.getTransaction().begin();
	    Query query = em.createQuery("update member SET password=:a  where account=:b");
	    query.setParameter("a", password);
	    query.setParameter("b", account);
	    
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
	  
	    return flag;
	 }*/
}


