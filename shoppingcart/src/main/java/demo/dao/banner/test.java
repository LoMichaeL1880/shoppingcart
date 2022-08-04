package demo.dao.banner;

import java.util.List;

import model.Orderdetail;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<Orderdetail> list = new daoOrder().queryOrderDetailById("order2208040845");
		System.out.println(list);
		for(Orderdetail o : list) {
			System.out.println(o.getOrderid() + "/" + o.getPrice() + "/" + o.getProduct());
		}

	}

}
