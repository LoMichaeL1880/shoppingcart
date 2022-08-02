package demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import demo.dao.product.daoProduct;
import model.Product;

@Controller
@RequestMapping("/shopping")
public class FrontendProductService {
	// 產品 list
	@RequestMapping(value="/category", method=RequestMethod.GET)
	public String productList(ModelMap model, HttpSession session) {
		List<Product> p = new daoProduct().queryAll();
		model.addAttribute("productlist", p);
		return "frontend/products/category";
	}
	
	// 產品 detail
	@RequestMapping(value="/detail/{pid}", method=RequestMethod.GET)
	public String productDetail(@PathVariable("pid") String id, ModelMap model, HttpSession session) {
		Product p = new daoProduct().queryById(id);
		model.addAttribute("productdetail", p);
		return "frontend/products/detail";
	}
	
}
