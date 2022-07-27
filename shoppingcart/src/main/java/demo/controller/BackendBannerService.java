package demo.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value="/uploadpic",method=RequestMethod.POST,consumes = {"multipart/form-data"})
	public ModelAndView uploadPic(@RequestParam("file") MultipartFile multipart,HttpSession session) throws Exception{
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
		return new ModelAndView("backend/banner/picuploadsuccess","picfilename",picname);
		//return picname;
	}
	
	@RequestMapping(value="/insertOK", method=RequestMethod.POST)
	@ResponseBody
	public String insertBannerOK(@RequestBody Banner b ,ModelMap model) {
		daoBanner.insertBanner(b);
		return "Insert Success";
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
