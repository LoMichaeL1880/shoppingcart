package demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestService {

	@RequestMapping("/hello")
	public String TestHello(ModelMap model) {
		return "index";
	}
}
