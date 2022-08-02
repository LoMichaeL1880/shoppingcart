package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the order database table.
 * 
 */
@Entity
@NamedQuery(name="Order.findAll", query="SELECT o FROM Orderlist o")
public class Orderlist implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String orderid;

	@Lob
	private String comments;

	@Temporal(TemporalType.DATE)
	private Date deliverdate;

	private String ordercol;

	@Temporal(TemporalType.DATE)
	private Date orderdate;

	private String status;

	private int totalprice;

	//bi-directional many-to-one association to Member
	@ManyToOne
	@JoinColumn(name="mid")
	private Member member;

	//bi-directional one-to-one association to Orderdetail
	@OneToOne
	@JoinColumn(name="orderid", insertable=false, updatable=false)
	private Orderdetail orderdetail;

	public Orderlist() {
	}

	public String getOrderid() {
		return this.orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getDeliverdate() {
		return this.deliverdate;
	}

	public void setDeliverdate(Date deliverdate) {
		this.deliverdate = deliverdate;
	}

	public String getOrdercol() {
		return this.ordercol;
	}

	public void setOrdercol(String ordercol) {
		this.ordercol = ordercol;
	}

	public Date getOrderdate() {
		return this.orderdate;
	}

	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getTotalprice() {
		return this.totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public Member getMember() {
		return this.member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Orderdetail getOrderdetail() {
		return this.orderdetail;
	}

	public void setOrderdetail(Orderdetail orderdetail) {
		this.orderdetail = orderdetail;
	}

}