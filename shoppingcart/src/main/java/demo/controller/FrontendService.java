package demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shopping")
public class FrontendService {

	@RequestMapping("/index")
	public String FrontendHomePage(ModelMap model) {
		return "frontend/home/index_1";
	}
}
