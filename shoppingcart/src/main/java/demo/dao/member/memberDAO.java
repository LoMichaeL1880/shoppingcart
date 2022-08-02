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
	
	public static void main(String[] args) {
		if(memberDAO.queryByAccount2("snqqpy3849@gmail.com")) {
			System.out.println("true");;
		}else {
			System.out.println("false");
		}
	}
	
	
//Member query all
	public List<Member> queryAll() {
		
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT m FROM Member m";
		em.getTransaction().begin();
		//Query query = em.createQuery(jsql, Member.class);
		Query query=em.createNamedQuery("Member.findAll");
		List<Member> list = query.getResultList();
		return list;
	}

//Member Add
	public static void MemberAdd(Member m) {
		
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		
        em.getTransaction().begin();
        em.persist(m);        
        em.getTransaction().commit();
        em.close();
    }
	
//Member delete
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
	
// Member query by account
	public static Member queryByAccount(String account) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT m FROM Member m where m.account=:a";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Member.class);
		query.setParameter("a", account);
		List<Member> list = query.getResultList();
		if(list.size()!=0) {
			Member[] m = list.toArray(new Member[list.size()]);
			return m[0];
		}
		return null;
	}
	
	public static boolean queryByAccount2(String account) {
		EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
		String jsql = "SELECT m FROM Member m where m.account=:a";
		em.getTransaction().begin();
		Query query = em.createQuery(jsql, Member.class);
		query.setParameter("a", account);
		List<Member> list = query.getResultList();
		if(list.size()!=0) {
			return true;
		}
		return false;
	}
	
//Member update
	public static void MemberUpdate(Member m) {
	   	EntityManager em = Persistence.createEntityManagerFactory("shoppingcart").createEntityManager();
	    em.getTransaction().begin();
	    Member newM = queryByAccount(m.getAccount());
	    newM.setPassword(m.getPassword());
	    newM.setEmail(m.getEmail());
	    em.persist(m);
	    
	    em.getTransaction().commit();
	    em.close();
	  
	 }
}


