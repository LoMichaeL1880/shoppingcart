package demo.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import demo.dao.banner.daoBanner;
import model.Banner;

@Controller
@RequestMapping("/backend")
public class BackendBannerService {
	
	private static final String UPLOAD_DIRECTORY = "/img";
	
	/* ------ Banner ------ */
	
	// query banner list
//	@RequestMapping(value="/banner", method=RequestMethod.GET)
//	public String backendBanner(ModelMap model) {
//		List<Banner> list = new daoBanner().queryAll();
//		model.addAttribute("bannerList", list);
//		return "backend/banner/banner";
//	}
	
	// PagedListHolder
	@RequestMapping(value="/banner", method=RequestMethod.GET)
	public String backendBanner(ModelMap model) {
		int start = 0;
		int num = 3;
		List<Banner> list = daoBanner.queryForPagination(start, num);
		model.addAttribute("bannerList", list);
		
		List<Banner> listAll = new daoBanner().queryAll();
		int count = listAll.size();
		
		int page = count/num;
		if(count%num !=0) {
			page = page+1;
		}
		model.addAttribute("pagenum", page);
		
		return "backend/banner/banner";
	}
	
	// BootpagPanigation
	@RequestMapping(value="/bannerpagination",method=RequestMethod.POST)
	public String bootpagPagination(@RequestParam String pagenum, ModelMap model) {	
		Integer num = Integer.parseInt(pagenum);
		int pageofnum = 3;
		int start = (num-1)*pageofnum;
		List<Banner> bannerList = new daoBanner().queryForPagination(start, pageofnum);
		for(Banner b : bannerList) {
			System.out.println(b);
		}
		model.addAttribute("bannerList", bannerList);

		return "backend/banner/responsebanner";
	}
	
	/* --- insert banner ---*/
	// insert banner
	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public String insertBanner(ModelMap model) {		
		return "backend/banner/bannerinsert";
	}
	// upload picture
	@RequestMapping(value="/uploadpic",method=RequestMethod.POST,consumes = {"multipart/form-data"})
	@ResponseBody
	public StringBuilder uploadPic(@RequestParam("file") MultipartFile multipart,HttpSession session) throws Exception{
		StringBuilder picname = new StringBuilder("../img/");
		try {
			ServletContext context = session.getServletContext();
			String path = context.getRealPath(UPLOAD_DIRECTORY);
			File tmpFile = new File(path);
			if (!tmpFile.exists()) {
				tmpFile.mkdir();
			}
			String filename = multipart.getOriginalFilename();
			System.out.println(path + File.separator + filename);
			BufferedOutputStream stream = new BufferedOutputStream(
					new FileOutputStream(new File(path + File.separator + filename)));
			stream.write(multipart.getBytes());
			stream.flush();
			stream.close();
			picname.append(filename);
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(multipart.getOriginalFilename());
		//return new ModelAndView("backend/banner/picuploadsuccess","picfilename",multipart.getOriginalFilename());
		return picname;
	}
	// insert data
	@RequestMapping(value="/insertOK", method=RequestMethod.POST)
	@ResponseBody
	public String insertBannerOK(@RequestBody Banner b ,ModelMap model) {
		daoBanner.insertBanner(b);
		return "Insert Success";
	}
	
	/* --- update data ---*/
	// update banner by id
	@RequestMapping(value="/update/{picid}")
	public String updateBanner(@PathParam("picid") String id, ModelMap model) {
		Banner b = null;
		try {
			b = daoBanner.queryById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("objBanner", b);
		return "redirect:backend/banner/updateBanner";
	}
	
	@RequestMapping(value="/updateOK", method=RequestMethod.POST)
	@ResponseBody
	public String updateBannerOK(@RequestBody Banner b ,ModelMap model) {
		daoBanner.updateBanner(b);
		return "Update Success";
	}
	
	
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
		return "backend/banner/banner";
	}
}
