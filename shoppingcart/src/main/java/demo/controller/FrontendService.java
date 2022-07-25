package demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import demo.dao.banner.daoBanner;
import model.Banner;

@Controller
@RequestMapping("/shopping")
public class FrontendService {

	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String FrontendHomePage(ModelMap model) {
		List<Banner> list = new daoBanner().queryAll();
		model.addAttribute("picList", list);
		return "frontend/home/index_1";
	}
}
