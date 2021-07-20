package com.Group9.ArtZone.Controller.Admin;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Group9.ArtZone.Conf.MVCConf;
import com.Group9.ArtZone.Controller.User.BaseController;
import com.Group9.ArtZone.Entities.Product;
import com.Group9.ArtZone.Entities.Roles;
import com.Group9.ArtZone.Entities.Users;
import com.Group9.ArtZone.Services.RolesService;
import com.Group9.ArtZone.Services.UsersService;
import com.Group9.ArtZone.dto.UsersModel;


@Controller
public class AdminUserController extends BaseController{
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private RolesService rolesService;
	
	@RequestMapping(value = { "/Admin/Manage_User" }, method = RequestMethod.GET)
	public String manage_user(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("users", usersService.findAll());
		return "Admin/manage_users";
	}
	@RequestMapping(value = { "/Admin/user_admin_detail" }, method = RequestMethod.GET)
	public String userDetail(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		int userId = Integer.parseInt(request.getParameter("id"));
		Users user = usersService.getById(userId);

		model.addAttribute("roles", rolesService.findAll());
		model.addAttribute("userD", user);
		return "Admin/table/user_admin_detail";
	}
	
	@RequestMapping(value = { "/Admin/user_admin_detail" }, method = RequestMethod.POST)
	public String editUser(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response
			) throws Exception {
		int userId = Integer.parseInt(request.getParameter("userId"));
		UsersModel um =new UsersModel();
		um.setId(userId);
		List<Users> lUser =usersService.searchModel(um);
		Users user =lUser.get(0);
		String roleA=request.getParameter("roleA");
		Roles ra=rolesService.getRoleByNameP(roleA);
		if(ra!=null) {
			user.addRoles(ra);
		}
		
//		String roleR=request.getParameter("roleR");
//		Roles rr=rolesService.getRoleByNameP(roleR);
//		if(user.getListRoles().size()<2 && rr!=null) {
//			user.removeRoles(rr);
//		}
		user.setUpdatedDate(new Date());
		usersService.saveOrUpdate(user);
		return "redirect:/Admin/Manage_User";
	}
	
	@RequestMapping(value = { "/Admin/lock_user" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> lockUser_ajax(final ModelMap model,
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@RequestBody Users user) {

		Map<String, Object> jsonResult = new HashMap<String, Object>();

		try {
			int userId = Integer.parseInt(request.getParameter("idUser"));
			Users u=usersService.getById(userId);
			
			//productService.delete(
			if(u.getStatus()==Boolean.TRUE) {
				u.setStatus(Boolean.FALSE);
				jsonResult.put("code", 200);
			}else {
				u.setStatus(Boolean.TRUE);
				jsonResult.put("code", 300);
			}
			usersService.saveOrUpdate(u);
			//productService.deleteById(product.getId());
			
			
			jsonResult.put("status", "TC");

		} catch (Exception e) {
			jsonResult.put("code", 500);
			jsonResult.put("message", e.getMessage());
		}
		
		return ResponseEntity.ok(jsonResult);
	}
}
