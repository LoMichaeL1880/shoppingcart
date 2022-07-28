package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the product database table.
 * 
 */
@Entity
@NamedQuery(name="Product.findAll", query="SELECT p FROM Product p")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String pid;

	private int pamount;

	private String pcolor;

	private String pintroduction;

	private String pname;

	private String ppicpath;

	private int pprice;

	private String psize;

	private String pspecification;

	private int pstock;

	@Temporal(TemporalType.DATE)
	private Date puploaddate;

	//bi-directional many-to-one association to Orderdetail
	@OneToMany(mappedBy="product")
	private List<Orderdetail> orderdetails;

	//bi-directional many-to-one association to Category
	@ManyToOne
	@JoinColumn(name="categoryid")
	private Category category;

	public Product() {
	}

	public String getPid() {
		return this.pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public int getPamount() {
		return this.pamount;
	}

	public void setPamount(int pamount) {
		this.pamount = pamount;
	}

	public String getPcolor() {
		return this.pcolor;
	}

	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}

	public String getPintroduction() {
		return this.pintroduction;
	}

	public void setPintroduction(String pintroduction) {
		this.pintroduction = pintroduction;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPpicpath() {
		return this.ppicpath;
	}

	public void setPpicpath(String ppicpath) {
		this.ppicpath = ppicpath;
	}

	public int getPprice() {
		return this.pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public String getPsize() {
		return this.psize;
	}

	public void setPsize(String psize) {
		this.psize = psize;
	}

	public String getPspecification() {
		return this.pspecification;
	}

	public void setPspecification(String pspecification) {
		this.pspecification = pspecification;
	}

	public int getPstock() {
		return this.pstock;
	}

	public void setPstock(int pstock) {
		this.pstock = pstock;
	}

	public Date getPuploaddate() {
		return this.puploaddate;
	}

	public void setPuploaddate(Date puploaddate) {
		this.puploaddate = puploaddate;
	}

	public List<Orderdetail> getOrderdetails() {
		return this.orderdetails;
	}

	public void setOrderdetails(List<Orderdetail> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public Orderdetail addOrderdetail(Orderdetail orderdetail) {
		getOrderdetails().add(orderdetail);
		orderdetail.setProduct(this);

		return orderdetail;
	}

	public Orderdetail removeOrderdetail(Orderdetail orderdetail) {
		getOrderdetails().remove(orderdetail);
		orderdetail.setProduct(null);

		return orderdetail;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString()
	{
		return pid+","+pname+","+pprice+","+psize+","+pcolor+","+pstock+","+pintroduction+","+pspecification+","+pamount;
		
	}
}