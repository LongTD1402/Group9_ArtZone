package com.Group9.ArtZone.Controller.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Group9.ArtZone.Entities.Product;
import com.Group9.ArtZone.Services.CategoriesService;
import com.Group9.ArtZone.Services.ProductService;
import com.Group9.ArtZone.Services.UsersService;
import com.Group9.ArtZone.dto.Contact;
import com.Group9.ArtZone.dto.ProductSearchModel;


@Controller
public class HomeController extends BaseController {
	
	@Autowired
	private CategoriesService categoriesService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping(value = {"/","/index","/Trangchu" }, method = RequestMethod.GET)
	public String index(final ModelMap model,//đối tượng trung gian giữa Controller và View
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		List<Product> hotPro= new ArrayList<Product>();
		List<Product> activePro= getActiveProduct();
		for (Product product : activePro) {
			if(product.getIs_hot()==true) {
				hotPro.add(product);
			}
		}
		model.addAttribute("hotPro", hotPro);
		model.addAttribute("category", categoriesService.findAll());
		return "User/index";
	}
	@RequestMapping(value = {"/market" }, method = RequestMethod.GET)
	public String market(final ModelMap model,//đối tượng trung gian giữa Controller và View
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		List<Product> latestPro= new ArrayList<Product>();
		List<Product> activePro= getActiveProduct();
		for(int i=activePro.size()-1;i>=0;i--) {
			latestPro.add(activePro.get(i));
		}
		model.addAttribute("lastestPro", latestPro);
		model.addAttribute("category", categoriesService.findAll());
		return "User/market";
	}
	@RequestMapping(value = {"/detail/{productSeo}" }, method = RequestMethod.GET)
	public String detail(final ModelMap model,//đối tượng trung gian giữa Controller và View
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable ("productSeo") String productSeo) throws IOException{
		ProductSearchModel sm = new ProductSearchModel();
		sm.setProductSeo(productSeo);
		List<Product> listproduct = productService.search(sm);
		Product proSeo = listproduct.get(0);
		model.addAttribute("category", categoriesService.findAll());
		model.addAttribute("proSeo", proSeo);
		return "User/detail";
	}
	@RequestMapping(value = { "/subcrible_Ajax" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> subcrible_Ajax(final ModelMap model, 
			final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody Contact contact)
	{

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("code", 200);
		result.put("status", "Thành công!");
		return ResponseEntity.ok(result);
	}
	@RequestMapping(value = {"/category/{categorySeo}" }, method = RequestMethod.GET)
	public String category(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@PathVariable("categorySeo") String  categorySeo) throws IOException{
		ProductSearchModel sm = new ProductSearchModel();
		sm.setCategorySeo(categorySeo);
		List<Product> product = productService.search(sm);
		List<Product> latestPro= new ArrayList<Product>();
		for(int i=product.size()-1;i>=0;i--) {
			latestPro.add(product.get(i));
		}
		model.addAttribute("lastestPro", latestPro);
		model.addAttribute("category", categoriesService.findAll());
		model.addAttribute("product", product);
		return "User/market";
	}
	@RequestMapping(value = { "/search" }, method = RequestMethod.GET)
	public String search(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		String searchText = request.getParameter("searchText");

		ProductSearchModel sm = new ProductSearchModel();
		sm.setSearchText(searchText);
		List<Product> product = productService.search(sm);

		model.addAttribute("product", product);
		return "User/index";
	}
}
