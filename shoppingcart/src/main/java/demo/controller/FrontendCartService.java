package demo.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import demo.dao.banner.daoOrder;
import demo.dao.member.memberDAO;
import demo.dao.product.daoProduct;
import model.Member;
import model.OrderTmp;
import model.Orderdetail;
import model.Orderlist;
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
			od.setPrice(p.getPprice());
			od.setProduct(p);
			od.setQuantity(pMap.get(id));			
			list.add(od);
		}
		
		model.addAttribute("order", list);
		return "frontend/order_process/basket";
	}
	
	// 購物車 _ 開始流程 - 1
	@RequestMapping(value="/checkout1", method=RequestMethod.POST)
	public String checkout1(@RequestParam("sendorder") String ot, ModelMap model, HttpSession session) {
		// 購買人		
		String account = (String) session.getAttribute("login");
		Member m = new memberDAO().queryByAccount(account);		
		model.addAttribute("member", m);
		
		// 訂單存到暫存類
		Gson gson = new Gson();
		OrderTmp[] otmp = gson.fromJson(ot, OrderTmp[].class);
		session.setAttribute("ordertmp", otmp);
		
		return "frontend/order_process/checkout1";
	}
	
	// 購物車 _ 開始流程 - 4
	@RequestMapping(value="/checkout4", method=RequestMethod.POST)
	public String checkout4(@RequestParam("sendmember") String sd, ModelMap model, HttpSession session) {
		
		// 更新客戶內容(更新收寄人)
		String account = (String) session.getAttribute("login");
		Member orAccount = new memberDAO().queryByAccount(account);
		
		Gson gson = new Gson();
		Member updateData = gson.fromJson(sd, Member.class);
		
		orAccount.setMname(updateData.getMname());
		orAccount.setAddress(updateData.getAddress());
		orAccount.setPhone(updateData.getPhone());
		orAccount.setEmail(updateData.getEmail());
		
		new memberDAO().MemberUpdate(orAccount);
		
		// 將 Ordertmp 解析出元素
		OrderTmp[] otmp = (OrderTmp[]) session.getAttribute("ordertmp");
					
		// 寫入 Orderlist
		Orderlist ol = new Orderlist();
		System.out.println(otmp[0].getOrderid());
		ol.setOrderid(otmp[0].getOrderid());
		ol.setMember(orAccount);
		ol.setTotalprice(otmp[0].getTotal());
		ol.setOrderdate(otmp[0].getOrderdate());
		new daoOrder().insertOrderList(ol);
		
		// 寫入 Orderdetail，並放入 model 中給下一頁使用
		List<Orderdetail> odlist = new ArrayList<>();
		for(int i=0; i<otmp.length; i++) {
			Orderdetail od = new Orderdetail();
			od.setOrderid(otmp[i].getOrderid());
			od.setPrice(otmp[i].getPrice());
			od.setQuantity(otmp[i].getQuantity());
			Product p = new daoProduct().queryById(otmp[i].getPid());
			od.setProduct(p);
			od.setId(""+Math.random());
			new daoOrder().insertOrderDetail(od);
			odlist.add(od);
		}
		model.addAttribute("order", odlist);
		
		return "frontend/order_process/checkout4";
	}
	
	// 購物車結束
	@RequestMapping(value="/cartfinish", method=RequestMethod.GET)
	public String cartFinish(ModelMap model,HttpSession session) {
		String account = (String) session.getAttribute("login");
		Member m = new memberDAO().queryByAccount(account);
		List<Orderlist> list = new daoOrder().queryOrderlistByMember(m);
		session.removeAttribute("numofcart");
		session.removeAttribute("productincar");
		model.addAttribute("orderList", list);
		return "frontend/customer/customer-orders";
	}
	
	// 單一訂單明細
	@RequestMapping(value="/customer-order/{orderid}", method=RequestMethod.GET)
	public String customerOrder(@PathVariable("orderid") String oid, ModelMap model) {
		List<Orderdetail> list = new daoOrder().queryOrderDetailById(oid);
		model.addAttribute("orderdetail", list);
		
//		String orderid = list.get(0).getOrderid();
//		model.addAttribute("orderid", orderid);
		
//		String orderdate = list.get(0).getOrder().getOrderdate();
//		model.addAttribute("orderdate", orderdate);
		
		return "frontend/customer/customer-order";
	}
}
