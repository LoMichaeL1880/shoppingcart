package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the member database table.
 * 
 */
@Entity
@NamedQuery(name="Member.findAll", query="SELECT m FROM Member m")
public class Member implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String mid;

	private String account;

	private String address;

	@Temporal(TemporalType.DATE)
	private Date createdate;

	private String email;

	private String mname;

	private String password;

	private String phone;

	private String role;

	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="member")
	private List<Orderlist> orders;

	public Member() {
	}

	public String getMid() {
		return this.mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getCreatedate() {
		return this.createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMname() {
		return this.mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public List<Orderlist> getOrders() {
		return this.orders;
	}

	public void setOrders(List<Orderlist> orders) {
		this.orders = orders;
	}

	public Orderlist addOrder(Orderlist order) {
		getOrders().add(order);
		order.setMember(this);

		return order;
	}

	public Orderlist removeOrder(Orderlist order) {
		getOrders().remove(order);
		order.setMember(null);

		return order;
	}

	@Override
	public String toString() {
		return "Member [mid=" + mid + ", account=" + account + ", address=" + address + ", createdate=" + createdate
				+ ", email=" + email + ", mname=" + mname + ", password=" + password + ", phone=" + phone + ", role="
				+ role + ", orders=" + orders + "]";
	}

}