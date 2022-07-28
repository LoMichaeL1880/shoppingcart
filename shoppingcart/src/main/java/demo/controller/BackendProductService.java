package demo.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

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

import demo.dao.product.daoProduct;
import model.Product;
import com.google.gson.*;

@Controller
@RequestMapping("/backend")
public class BackendProductService {

	private static final String UPLOAD_DIRECTORY = "/img";
	
		@RequestMapping(value="/product", method=RequestMethod.GET)
		public String backendProduct(ModelMap model) {
			List<Product> list = new daoProduct().queryAll();
			model.addAttribute("productList", list);
			return "backend/product/product";
		}
		
		@RequestMapping(value="/addp", method=RequestMethod.GET)
		public String addProduct(ModelMap model) {
			return "backend/product/addp";
		}
		
		// upload picture
		@RequestMapping(value="/uploadpicture",method=RequestMethod.POST,consumes = {"multipart/form-data"})
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
			return new ModelAndView("backend/product/test","picfilename",multipart.getOriginalFilename());
			//return picname;
		}
		
		@RequestMapping(value= "/add", method= RequestMethod.POST)
		public String addProductToDB(@RequestBody Product product) {
			System.out.println(product.toString());
						
			return product.toString();
			
		}
		
		
		/*
		@RequestMapping(value = "/remove/{pid}", method=RequestMethod.GET)
		public String deleteProduct(@PathVariable("pid") String id, ModelMap model) {
			boolean flag = daoBanner.deleteBanner(id);
			if(flag) {
				List<Banner> list = new daoBanner().queryAll();
				model.addAttribute("bannerList", list);
			}
			else {
				System.out.println("SQL fail");
			}
			return "backend/product/product";
		}
		*/
}
