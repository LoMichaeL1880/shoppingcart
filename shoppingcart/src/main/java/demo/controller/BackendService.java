package demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import demo.dao.banner.daoBanner;
import model.Banner;

@Controller
@RequestMapping("/backend")
public class BackendService {

	@RequestMapping("/home")
	public String backendHomePage(ModelMap model) {
		return "backend/home/index";
	}
	@RequestMapping(value="/banner", method=RequestMethod.GET)
	@ResponseBody
	public String backendBanner(ModelMap model) {
		List<Banner> list = new daoBanner().queryAll();
		model.addAttribute("bannerList", list);
		return "backend/banner/banner";
	}
}
