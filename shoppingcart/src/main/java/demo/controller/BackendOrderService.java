package demo.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import demo.dao.banner.daoOrder;
import model.Order;

@Controller
@RequestMapping("/backend")
public class BackendOrderService {
	
	// query order list
	@RequestMapping(value="/order", method=RequestMethod.GET)
	public String orderController(ModelMap model) {
		List<Order> list = new daoOrder().queryAll();
		model.addAttribute("orderList", list);
		return "backend/orders/order";
	}

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index() {
		return "cart/cartindex";
	}

	@RequestMapping(value = "buy/{id}", method = RequestMethod.GET)
	public String buy(@PathVariable("id") String id, HttpSession session) {
		Order order = new Order();
		if (session.getAttribute("cart") == null) {
			List<Order> cart = new ArrayList<Order>();
			cart.add(new Order(order.find(id), 1));
			session.setAttribute("cart", cart);
		} else {
			List<Order> cart = (List<order>) session.getAttribute("cart");
			int index = this.exists(id, cart);
			if (index == -1) {
				cart.add(new Order(order.find(id), 1));
			} else {
				int quantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quantity);
			}
			session.setAttribute("cart", cart);
		}
		return "redirect:/cart/index";
	}

	@RequestMapping(value = "remove/{id}", method = RequestMethod.GET)
	public String remove(@PathVariable("id") String id, HttpSession session) {
		ProductModel productModel = new ProductModel();
		List<Order> cart = (List<Order>) session.getAttribute("cart");
		int index = this.exists(id, cart);
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/cart/index";
	}

	private int exists(String id, List<Item> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getId().equalsIgnoreCase(id)) {
				return i;
			}
		}
		return -1;
	}

	//update order list
   /* @RequestMapping(value = "/orderUpdate", method = RequestMethod.POST)
    public ModelAndView processFormUpdate(@ModelAttribute Customer cus) throws SQLException {
       ModelAndView model = new ModelAndView("redirect:/customerRetrieveAll");
       dao.save(cus);             
       return model;
    }
    //delete order list
    @RequestMapping(value = "/orderDelete", method = RequestMethod.GET)
    public ModelAndView deleteCustomer(@RequestParam(value="id", required=false, defaultValue="1") Long id) {
       ModelAndView model = new ModelAndView("redirect:/customerRetrieveAll");
       daoOrder.delete(id);
       return model;
    }*/



}
