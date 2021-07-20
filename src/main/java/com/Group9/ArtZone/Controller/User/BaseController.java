package com.Group9.ArtZone.Controller.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.Group9.ArtZone.Entities.Category;
import com.Group9.ArtZone.Entities.Product;
import com.Group9.ArtZone.Entities.Roles;
import com.Group9.ArtZone.Entities.Users;
import com.Group9.ArtZone.Services.CategoriesService;
import com.Group9.ArtZone.Services.ProductService;
import com.Group9.ArtZone.Services.UsersService;
import com.Group9.ArtZone.dto.ProductSearchModel;
import com.Group9.ArtZone.dto.UsersModel;

public abstract class BaseController {
	@Autowired
	private CategoriesService categoriesService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UsersService usersService;
	
	@ModelAttribute("userLogined")
	public Users getUserLogined() {
		Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(userLogined != null && userLogined instanceof UserDetails) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Users u=new Users();
			if (principal instanceof UserDetails) { // user đã đăng nhập
				u = (Users) principal;
			}
			UsersModel um=new UsersModel();
			um.setId(u.getId());
			List<Users> lu =usersService.searchModel(um);
			return lu.get(0);
		}
		return null;
	}
	@ModelAttribute("product")
	public List<Product> getActiveProduct(){
		ProductSearchModel sm =new ProductSearchModel();
		sm.setSearchText(null);
		return productService.search(sm);
	}
	@ModelAttribute("isActive")
	public Boolean getActive() {
		boolean isActive= false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Users u=new Users();
		if (principal instanceof UserDetails) { // user đã đăng nhập
			u = (Users) principal;
			if(u.getStatus()==true) {
				isActive=true;
			}else {
				isActive=false;
			}
		}
		return isActive;
	}
	@ModelAttribute("isAdmin")
	public Boolean getAdmin() {
		boolean isAdmin= false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Users u=new Users();
		String ad="ADMIN";
		if (principal instanceof UserDetails) { // user đã đăng nhập
			u = (Users) principal;
			List<Roles> listRole= u.getListRoles();
			for (Roles roles : listRole) {
				if(roles.getName().compareTo(ad)==0) {
					isAdmin=true;
					break;
				}
			}
		}
		return isAdmin;
		
	}
	@ModelAttribute("isCollab")
	public Boolean getCollab() {
		boolean isCollab= false;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Users u=new Users();
		String co="COLLAB";
		if (principal instanceof UserDetails) { // user đã đăng nhập
			u = (Users) principal;
			List<Roles> listRole= u.getListRoles();
			for (Roles roles : listRole) {
				if(roles.getName().compareTo(co)==0) {
					isCollab=true;
					break;
				}
			}
		}
		return isCollab;
		
	}
//	@ModelAttribute("menus")
//	public String getCategories() {
//		return this.buildMenu();
//	}
//	private String buildMenu() {
//		StringBuilder menu = new StringBuilder();
//
//		// danh sach menu cha
//		List<Category> categories = categoriesService.getAllParents();
//		
//		for (Category c : categories) {
//			menu.append("<li> <a>" + c.getName() + "</a>");
//			
//			if (c.getChilds() != null && !c.getChilds().isEmpty()) {
//				recursiveMenu(menu, c.getChilds());
//			}
//			
//			menu.append("</li>");
//		}
//
//		return menu.toString();
//	}
//	
//	private void recursiveMenu(StringBuilder menu, Set<Categories> childs) {
//		menu.append("<ul>");
//		for (Category c : childs) {
//			menu.append("<li>" + c.getName() + "</a>");
//			if (c.getChilds() != null && !c.getChilds().isEmpty()) {
//				recursiveMenu(menu, c.getChilds());
//				menu.append("</li>");
//			} else {
//				menu.append("</li>");
//			}
//		}
//		menu.append("</ul>");
//	}
}
