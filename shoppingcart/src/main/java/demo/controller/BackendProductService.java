package demo.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
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
		
		@RequestMapping(value="/sellingproduct", method=RequestMethod.GET)
		public String backendsellingProduct(ModelMap model) {
			List<Product> list = new daoProduct().querySelling();
			model.addAttribute("productList", list);
			return "backend/product/sellingproduct";
		}
		
		@RequestMapping(value="/stopsellingproduct", method=RequestMethod.GET)
		public String backendstopsellingProduct(ModelMap model) {
			List<Product> list = new daoProduct().queryStopSelling();
			model.addAttribute("productList", list);
			return "backend/product/stopsellingproduct";
		}
		
		@RequestMapping(value="/addp", method=RequestMethod.GET)
		public String addProduct(ModelMap model) {
			return "backend/product/addp";
		}
		
		// upload picture
		@RequestMapping(value="/uploadpicture",method=RequestMethod.POST,consumes = {"multipart/form-data"})
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
			//return new ModelAndView("backend/product/test","picfilename",multipart.getOriginalFilename());
			return picname;
		}
		
		@RequestMapping(value= "/add", method= RequestMethod.POST)
		@ResponseBody
		public String addProductToDB(@RequestBody Product product) {
			
			
			
			Timestamp uploadtime;
			LocalDateTime nowtime = (LocalDateTime.now());
			uploadtime = Timestamp.valueOf(nowtime);	
			product.setPuploaddate(uploadtime);
			product.setStatus("selling");
			System.out.println(product.toString());
			daoProduct.add(product);
			return "Product Added";
			
		}
		
		@RequestMapping(value="/updateproduct/{pid}")
		public String updateBanner(@PathParam("pid") String id, ModelMap model) {
			System.out.println(id);
			Product p = null;
			try {
				p = daoProduct.queryById(id);
				System.out.println(p.toString());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("objProduct", p);
			return "backend/product/updateProduct";
		}
		
		@RequestMapping(value="/updated", method=RequestMethod.POST)
		@ResponseBody
		public String updateProductOK(@RequestBody Product p ,ModelMap model) {
			daoProduct.updateProduct(p);
			return "Update Success";
		}
		
		/*
		@RequestMapping(value= "/checkId", method= RequestMethod.POST)
		@ResponseBody
		public String checkId(@RequestBody String id) {
			String respond="";
			boolean flag=false;
			flag = daoProduct.checkId(id);
			if(flag==true)
			{
				respond = "ID exist";
			}
			else
			{
				respond="ID Checked";
			}
			return respond;
		}
		
		@RequestMapping(value = "/delete/{pid}", method=RequestMethod.GET)
		public String deleteProduct(@PathVariable("pid") String id, ModelMap model) {
			boolean flag = daoProduct.deleteProduct(id);
			if(flag) {
				List<Product> list = new daoProduct().queryAll();
				model.addAttribute("PrductList", list);
			}
			else {
				System.out.println("SQL fail");
			}
			return "backend/product/product";
		}
		*/

		@RequestMapping(value = "/stopselling/{pid}", method=RequestMethod.GET)
		public static void stopSellingProduct(@PathVariable("pid") String id, ModelMap model) {
			Product p = null;
			try {
				p = daoProduct.queryById(id);
				p.setStatus("stopselling");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
}
