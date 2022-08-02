package demo.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import demo.dao.banner.daoOrder;
import demo.dao.product.daoProduct;
import model.Orderdetail;
import model.Product;

@Controller
@RequestMapping("/shopping")
public class FrontendCartService {	
	List<String> numofcart = new ArrayList<>();
	
	// 加入購物車
	@RequestMapping(value="/addtocart/{pid}",method=RequestMethod.GET)
	@ResponseBody
	public String addToCart(@PathVariable("pid") String id, ModelMap model, HttpSession session) {
		if(session.getAttribute("productincar") == null) {
			session.setAttribute("productincar", 0);
		}else {
			int addCart = (int) session.getAttribute("productincar");
			addCart ++;
			session.setAttribute("productincar", addCart);
		}		
		numofcart.add(id);
		session.setAttribute("numofcart", numofcart);		
		return "Add to Cart";
	}
	
	// 購物車
	@RequestMapping(value="/basket", method=RequestMethod.GET)
	public String basket(ModelMap model,HttpSession session) {
		List<String> plist = (List<String>) session.getAttribute("numofcart");
		
		Map<String,Integer> pMap = new HashMap<>();
		for(String key : plist) {
			if(pMap.containsKey(key)) {
				pMap.put(key, pMap.get(key)+1);
			}else {
				pMap.put(key, 1);
			}
		}
				
		List<Orderdetail> list = new ArrayList<>();
		for(int i=0; i<pMap.size(); i++) {
			Orderdetail od = new Orderdetail();
			String id = (String) pMap.keySet().toArray()[i];
			Product p = new daoProduct().queryById(id);
			od.setOrderid("tmp");
			od.setOrderid(id);
			od.setPrice(p.getPprice());
			od.setProduct(p);
			od.setQuantity(pMap.get(id));
			list.add(od);
			System.out.println(od.getProduct().getPname());
		}
		
		model.addAttribute("order", list);
		return "frontend/order_process/basket";
	}
	
	// 購物車 _ 開始流程 - 1
	@RequestMapping(value="/checkout1", method=RequestMethod.POST)
	public String checkout1() {
		return "frontend/order_process/checkout1";
	}
	
	// 購物車 _ 開始流程 - 4
	@RequestMapping(value="/checkout4", method=RequestMethod.POST)
	public String checkout4() {
		return "frontend/order_process/checkout4";
	}
	
	// 單一訂單明細
	@RequestMapping(value="/customer-order", method=RequestMethod.GET)
	public String customerOrder() {
		return "frontend/customer/customer-order";
	}
}
