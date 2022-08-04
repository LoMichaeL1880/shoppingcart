package demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import demo.dao.member.memberDAO;
import model.*;

@Controller
@RequestMapping("/backend")
public class BackendMemberService {

// backend
	//paging 所有會員以分頁顯示
	@RequestMapping(value="/pagingMember",method = RequestMethod.GET)
	@ResponseBody  public String backendPagingMember(ModelMap model) {
		List<Member> list = new memberDAO().queryAll();
		model.addAttribute("memberList", list);
		return "/backend/account/pagingMember";  
	   }
	// query all member
	@RequestMapping(value="/member", method=RequestMethod.GET)
	public String backendMember(ModelMap model) {
		List<Member> list = new memberDAO().queryAll();
		model.addAttribute("memberList", list);
		return "/backend/account/member";
	}
	
	// 在backend的左列清單，點帳號權限修改，執行畫面跳轉
	@RequestMapping(value="/memberupdate", method=RequestMethod.GET)
	public String Memberpage(ModelMap model) {
			return "/backend/account/mainMember";
	
	
	}

	//按下新增會員的按鈕，新增資料到資料庫
	@RequestMapping(value="/addNewMember", method=RequestMethod.POST)
	//, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String MemberAdd(@RequestBody Member m, ModelMap model) {
		System.out.println(m);
		memberDAO.MemberAdd(m);
		
		List<Member> mm=new ArrayList<>();
		mm.add(m);
		model.addAttribute("memberList", mm);
		
			return "/backend/account/member";
	}
		
	// 更新現有會員的資料到資料庫
	@RequestMapping(value="/updateExistMember", method=RequestMethod.POST)
	public String ExistMemberUpdate(@RequestBody Member m, ModelMap model) {
			System.out.println(m);
			memberDAO.MemberUpdate(m);
			
			List<Member> mm2=new ArrayList<>();
			mm2.add(m);
			model.addAttribute("memberList",mm2);
			
			return "/backend/account/member";
	}
}
	
	// delete member by account
	/*@RequestMapping(value = "/memberupdate1", method=RequestMethod.GET)
	public String Memberdelete(@PathVariable("account") String account, ModelMap model) {
	boolean flag = memberDAO.MemberDelete(account);
	if(flag) {
		List<Member> list = new memberDAO().queryAll();
		model.addAttribute("memberList", list);
	}
	else {
		System.out.println("SQL fail");
	}
	return "redirect:/backend/account/mainMember";
	}
}
*/