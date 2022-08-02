package demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import demo.dao.member.memberDAO;
import model.Member;

@Controller
@RequestMapping("/shopping")
public class FrontendAccountService {
	
	// 進入註冊頁面
	@RequestMapping(value="/registerpage", method=RequestMethod.GET)
	public String registerPage() {
		return "personal_account/register";
	}
	
	// 執行註冊動作
	@RequestMapping(value="/register_2", method=RequestMethod.POST)
	public String registerAction(@RequestParam("registerobj") String m, ModelMap model) {
		Gson gson = new Gson();
		Member member = gson.fromJson(m, Member.class);
		
		// 尚未做帳號重複的判斷
		
		memberDAO.MemberAdd(member);
		Member afterInsertMember = memberDAO.queryByAccount(member.getAccount());
		model.addAttribute("member", afterInsertMember);
		
		return "personal_account/customer-account";
	}
	
	// 登入檢查
	@RequestMapping(value="/logincheck", method=RequestMethod.POST)
	public String loginCheck(@RequestParam("checkmemobj") String login, ModelMap model, HttpSession session) {
		Gson gson = new Gson();
		Member member = gson.fromJson(login, Member.class);
		member.setAccount(member.getEmail());
		if(memberDAO.queryByAccount2(member.getAccount())) {
			Member checkMember = memberDAO.queryByAccount(member.getAccount());
			if(checkMember.getPassword().equals(member.getPassword())) {
				System.out.println("true");
				session.setAttribute("login", member.getAccount());
				return "redirect:http://localhost:8080/shoppingcart/shopping/index";
			}else {
				System.out.println("pass false");
				return "redirect:http://localhost:8080/shoppingcart/shopping/index";
			}
		}else {
			System.out.println("flase");
			return "redirect:http://localhost:8080/shoppingcart/shopping/registerpage";
		}
	}
	
	// 會員畫面
	@RequestMapping(value="/customer-account", method=RequestMethod.GET)
	public String memberPage() {
		return "personal_account/customer-account";
	}
	// 會員資料更新
	@RequestMapping(value="/updatecustomer", method=RequestMethod.POST)
	@ResponseBody
	public String updateMember(@RequestBody Member m, ModelMap model) {
		System.out.println(m);
		// doing update code
		return "會員資料更新成功";
	}
	
	// 會員訂單畫面
	@RequestMapping(value="/customer-orders", method=RequestMethod.GET)
	public String customerOrders() {
		return "frontend/customer/customer-orders";
	}
	
	// 會員願望清單
	@RequestMapping(value="/customer-wishlist", method=RequestMethod.GET)
	public String customerWishlist() {
		return "frontend/customer/customer-wishlist";
	}
	
	
	// 會員登出
	@RequestMapping("/logout")
	public String logout(ModelMap model,HttpSession session) {
		session.removeAttribute("login");
		return "forward:index";
	}
	
}
