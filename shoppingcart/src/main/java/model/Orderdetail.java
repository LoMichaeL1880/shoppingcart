package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the orderdetail database table.
 * 
 */
@Entity
@NamedQuery(name="Orderdetail.findAll", query="SELECT o FROM Orderdetail o")
public class Orderdetail implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	private String id;
	
	private String orderid;

	private int price;

	private int quantity;

	//bi-directional one-to-one association to Order
	@OneToOne(mappedBy="orderdetail")
	private Orderlist orderlist;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="pid")
	private Product product;

	public Orderdetail() {
	}

	public String getOrderid() {
		return this.orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public int getPrice() {
		return this.price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Orderlist getOrder() {
		return this.orderlist;
	}

	public void setOrder(Orderlist orderlist) {
		this.orderlist = orderlist;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}