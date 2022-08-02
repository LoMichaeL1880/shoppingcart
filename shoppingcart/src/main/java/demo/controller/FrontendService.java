package demo.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import demo.dao.banner.daoBanner;
import model.Banner;
import model.Product;

@Controller
@RequestMapping("/shopping")
public class FrontendService {
	// 首頁
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String FrontendHomePage(ModelMap model) {
		// carousel
		List<Banner> list = new daoBanner().queryAll();
		model.addAttribute("picList", list);
		
		// hot product list
		//List<Product> plist = select by some conditions
		//model.addAllAttributes("hotproduct",plist);
		
		// carousel-2
		//
		
		return "frontend/home/index_1";
	}
	

}
