package demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import demo.dao.banner.daoBanner;
import model.Banner;

@Controller
@RequestMapping("/backend")
public class BackendService {

	@RequestMapping("/home")
	public String backendHomePage(ModelMap model) {
		return "backend/home/index";
	}
	
	
	/* ------ Banner ------ */
	
	// query banner list
	@RequestMapping(value="/banner", method=RequestMethod.GET)
	public String backendBanner(ModelMap model) {
		List<Banner> list = new daoBanner().queryAll();
		model.addAttribute("bannerList", list);
		return "backend/banner/banner";
	}
	// insert banner
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insertBanner(ModelMap model) {
		return "backend/banner/bannerinsert";
	}
	
	
	// update banner by id
	
	
	// delete banner by id
	@RequestMapping(value = "/remove/{picid}", method=RequestMethod.GET)
	public String deleteBanner(@PathVariable("picid") String id, ModelMap model) {
		boolean flag = daoBanner.deleteBanner(id);
		if(flag) {
			List<Banner> list = new daoBanner().queryAll();
			model.addAttribute("bannerList", list);
		}
		else {
			System.out.println("SQL fail");
		}
		return "redirect:/backend/home";
	}
	
}
