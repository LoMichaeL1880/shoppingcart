package demo.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import model.Category;
import model.Product;
import com.google.gson.*;

@Controller
@RequestMapping("/backend")
public class BackendProductService {

	private static final String UPLOAD_DIRECTORY = "/img";
//跳轉業面	
	
		//跳轉至全部產品的頁面
		@RequestMapping(value="/product", method=RequestMethod.GET)
		public String backendProduct(ModelMap model) {
			List<Product> list = new daoProduct().queryAll();
			model.addAttribute("productList", list);
			return "backend/product/product";
		}
		
		//跳轉至查詢頁面
		@RequestMapping(value="/queryproduct", method=RequestMethod.GET)
		public String queryProduct(ModelMap model) {
			List<Product> list = null;
			model.addAttribute("queryproductList", list);
			return "backend/product/queryproduct";
		}
		
		//使用PID跳轉至修改產品內容
		@RequestMapping(value="/updateproduct/{pid}" , method=RequestMethod.GET)
		public String updateProduct(@PathVariable("pid") String id, Model model) {
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
		
		//跳轉至販售中產品頁面
		@RequestMapping(value="/sellingproduct", method=RequestMethod.GET)
		public String backendsellingProduct(ModelMap model) {
			List<Product> list = new daoProduct().querySelling();
			model.addAttribute("productList", list);
			return "backend/product/sellingproduct";
		}
		
		//跳轉至停售產品頁面
		@RequestMapping(value="/stopsellingproduct", method=RequestMethod.GET)
		public String backendstopsellingProduct(ModelMap model) {
			List<Product> list = new daoProduct().queryStopSelling();
			model.addAttribute("productList", list);
			return "backend/product/stopsellingproduct";
		}
		
		//跳轉至新增產品頁面
		@RequestMapping(value="/addp", method=RequestMethod.GET)
		public String addProduct(ModelMap model) {
			return "backend/product/addp";
		}
		
//功能		
		
		//依PID查詢
		@RequestMapping(value= "/findbypid", method= RequestMethod.POST)
		public String findbypid(@RequestBody Product p, ModelMap model) {			
			System.out.println(p.getPid());
			Product product = daoProduct.queryById(p.getPid());
			System.out.println(product.toString());
			List<Product> list = Arrays.asList(product);
			model.addAttribute("queryproductList", list);	
			return "backend/product/queryproduct";
		}
		
		//依Category查詢
				@RequestMapping(value= "/findbycategory", method= RequestMethod.POST)
				public String findbycategory(@RequestBody Category c, ModelMap model) {	
					System.out.println(c.getName());
					List<Product> list= daoProduct.queryByCategory(c.getName());
					model.addAttribute("queryproductList", list);	
					return "backend/product/queryproduct";
				}
				//依販賣中Category查詢
				@RequestMapping(value= "/findbysellingcategory", method= RequestMethod.POST)
				public String findbysellingcategory(@RequestBody Category c, ModelMap model) {	
					System.out.println(c.getName());
					List<Product> list= daoProduct.queryBySellingCategory(c.getName());
					model.addAttribute("queryproductList", list);	
					return "backend/product/queryproduct";
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
		
		//新增產品
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

	
		
		//修改
		@RequestMapping(value="/updated", method=RequestMethod.POST)
		@ResponseBody
		public String updateProductOK(@RequestBody Product p ,ModelMap model) {
			Timestamp uploadtime;
			LocalDateTime nowtime = (LocalDateTime.now());
			uploadtime = Timestamp.valueOf(nowtime);	
			p.setPuploaddate(uploadtime);
			p.setStatus("selling");
			daoProduct.updateProduct(p);			
			return "Update Success";
		}
		
		//將產品狀態改為下架
		@RequestMapping(value = "/stopselling/{pid}", method=RequestMethod.GET)
		public static String stopSellingProduct(@PathVariable("pid") String id, ModelMap model) {			
			try {
				Product p = daoProduct.queryById(id);
				Timestamp uploadtime;
				LocalDateTime nowtime = (LocalDateTime.now());
				uploadtime = Timestamp.valueOf(nowtime);	
				p.setPuploaddate(uploadtime);
				p.setStatus("stopselling");
				daoProduct.deleteProduct(p);
				List<Product> list = new daoProduct().queryStopSelling();
				model.addAttribute("productList", list);				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "backend/product/stopsellingproduct";
		}
		
		//將產品狀態改為上架
		@RequestMapping(value = "/selling/{pid}", method=RequestMethod.GET)
		public static String SellingProduct(@PathVariable("pid") String id, ModelMap model) {
				try {
				Product p = daoProduct.queryById(id);
				Timestamp uploadtime;
				LocalDateTime nowtime = (LocalDateTime.now());
				uploadtime = Timestamp.valueOf(nowtime);	
				p.setPuploaddate(uploadtime);
				p.setStatus("selling");
				daoProduct.turnSellingProduct(p);
				List<Product> list = new daoProduct().queryStopSelling();
				model.addAttribute("productList", list);				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "backend/product/sellingproduct";
		}
		
		/*
		//依上架時間查詢
		@RequestMapping(value= "/findbyuploadtime", method= RequestMethod.POST)
		public String findbyuploadtime(@RequestBody Object o, ModelMap model) {			
			System.out.println(o);
			Product product = daoProduct.queryById(o.getPid());
			System.out.println(product.toString());
			List<Product> list = Arrays.asList(product);
			model.addAttribute("queryproductList", list);	
			return "backend/product/queryproduct";
		}
*/
		
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
			return "backend/product/stopsellingproduct";
		}
		*/

		
		
}
