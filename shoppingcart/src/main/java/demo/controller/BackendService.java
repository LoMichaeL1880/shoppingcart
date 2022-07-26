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
}
