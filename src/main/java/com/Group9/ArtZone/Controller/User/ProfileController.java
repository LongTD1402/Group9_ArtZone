package com.Group9.ArtZone.Controller.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Group9.ArtZone.Entities.Product;
import com.Group9.ArtZone.Entities.Users;
import com.Group9.ArtZone.Services.CategoriesService;
import com.Group9.ArtZone.Services.ProductService;
import com.Group9.ArtZone.Services.UsersService;
import com.Group9.ArtZone.dto.ProductSearchModel;
import com.Group9.ArtZone.dto.UsersModel;

@Controller
public class ProfileController extends BaseController{
	
	@Autowired
	private UsersService usersService;
	
	@Autowired 
	private CategoriesService categoriesService;
 	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = {"/profile" }, method = RequestMethod.GET)
	public String view(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Users u=new Users();
		if (principal instanceof UserDetails) { // user đã đăng nhập
			u = (Users) principal;
		}
		UsersModel um=new UsersModel();
		um.setId(u.getId());
		List<Users> lu =usersService.searchModel(um);
		Users us=lu.get(0);
		ProductSearchModel psm=new ProductSearchModel();
		psm.setUser_id(us.getId());
		model.addAttribute("proUser", productService.searchProbyUserId(psm));
		model.addAttribute("user", us);
		return "User/user_profile/profile";
	}
	
	@RequestMapping(value = {"/edit_profile" }, method = RequestMethod.GET)
	public String edit(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Users u=new Users();
		if (principal instanceof UserDetails) { // user đã đăng nhập
			u = (Users) principal;
		}
		UsersModel um=new UsersModel();
		um.setId(u.getId());
		List<Users> lu =usersService.searchModel(um);
		Users us=lu.get(0);
		model.addAttribute("user", us);
		return "User/user_profile/edit_profile";
	}
	@RequestMapping(value = {"/edit_profile" }, method = RequestMethod.POST)
	public String save(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response,
			@ModelAttribute("user") Users user,
			@RequestParam("userAvatar") MultipartFile userAvatar,
			@RequestParam("userBackground") MultipartFile userBackground) throws Exception{
		if(user.getFullname()==null||user.getEmail()==null||
				user.getPhone()==null||user.getAddress()==null) {
			model.addAttribute("inforNull", "Your name, address, email or phone number must not be missing !");
			return "User/user_profile/edit_profile";
		}
		usersService.edit(user, userAvatar, userBackground);
		usersService.saveProfile(user);
		return "redirect:/edit_profile";
	}
	@RequestMapping(value = { "/add_product" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("products", new Product());
		model.addAttribute("category", categoriesService.findAll());
		return "User/user_profile/collab_add_product";
	}
	@RequestMapping(value = { "/Add_product_collab" }, method = RequestMethod.POST)
	public String addProducts(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("products") Product product,
			@RequestParam("productAvatar") MultipartFile productAvatar,
			@RequestParam("productImages") MultipartFile[] productImages) throws Exception {
		if (product.getId() != null && product.getId() > 0) {
			productService.edit(product, productAvatar, productImages);
		} else {
			productService.save(product, productAvatar, productImages);
		}
		return "redirect:/profile";
	}
}
