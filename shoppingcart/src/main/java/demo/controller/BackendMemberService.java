package demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import demo.dao.member.memberDAO;
import model.*;

@Controller
@RequestMapping("/backend")
public class BackendMemberService {

// backend
	// query all member
	@RequestMapping(value="/member", method=RequestMethod.GET)
	public String backendMember(ModelMap model) {
		List<Member> list = new memberDAO().queryAll();
		model.addAttribute("memberList", list);
		return "/backend/account/member";
	}
	
	// create new member 
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String Memberadd(ModelMap model) {
			return "/backend/account/mainMember";
	
	
	}

	// update password by account
	
	
	// delete member by account
	@RequestMapping(value = "/delete", method=RequestMethod.GET)
	public String Memberdelete(@PathVariable("account") String account, ModelMap model) {
	boolean flag = memberDAO.MemberDelete(account);
	if(flag) {
		List<Member> list = new memberDAO().queryAll();
		model.addAttribute("memberList", list);
	}
	else {
		System.out.println("SQL fail");
	}
	return "redirect:/backend/account/member";
	}
}
