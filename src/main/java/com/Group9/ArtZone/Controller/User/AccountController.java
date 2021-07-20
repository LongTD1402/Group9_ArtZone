package com.Group9.ArtZone.Controller.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Group9.ArtZone.Entities.Roles;
import com.Group9.ArtZone.Entities.Users;
import com.Group9.ArtZone.Services.RolesService;
import com.Group9.ArtZone.Services.UsersService;
import com.Group9.ArtZone.dto.UsersModel;

@Controller
public class AccountController extends BaseController{

	@Autowired
	UsersService usersService;
	
	@Autowired
	RolesService rolesService;
	
	@RequestMapping(value = {"/signup" }, method = RequestMethod.GET)
	public String signup(final ModelMap model,//đối tượng trung gian giữa Controller và View
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException{
		
		return "User/signup";
	}
	@RequestMapping(value = { "/signup" }, method = RequestMethod.POST)
	public String addAccount(final ModelMap model,
			final HttpServletRequest request, 
			final HttpServletResponse response)
			throws Exception {

		String displayName = request.getParameter("display_name");
		String email = request.getParameter("email");
		if(email.isEmpty()) {
			model.addAttribute("NEmailE", "You have not entered your EMAIL !");
			return "User/signup";
		}
		UsersModel um= new UsersModel();
		um.setEmail(email);
		if (usersService.searchModel(um).size()>0) {
			model.addAttribute("EmailE", "Email already used!");
			return "User/signup";
		}
		
		String userName = request.getParameter("username");
		if(userName.isEmpty()) {
			model.addAttribute("NUserNE", "You have not entered your USER NAME !");
			return "User/signup";
		}
		String password = request.getParameter("password");
		if(password.isEmpty()) {
			model.addAttribute("NPassE", "You have not entered your PASSWORD !");
			return "User/signup";
		}
		String confirmPassword = request.getParameter("confirmPassword");

		Users user = new Users();
		user.setUsername(userName);;
		if (password.equals(confirmPassword)) {
			user.setPassword(new BCryptPasswordEncoder(4).encode(password));
		}else {
			model.addAttribute("repassE", "Reconfirm wrong password!");
			return "User/signup";
		}
		user.setEmail(email);
		
		user.setDisplayName(displayName);

		// Role
		Roles role = rolesService.getRoleByName("GUEST");
		user.addRoles(role);
		user.setCreatedDate(new Date());
		user.setBackground("user/default_background/default_background.png");
		user.setAvatar("user/default_avatar/—Pngtree—cat default avatar_5416936.png");
		usersService.saveOrUpdate(user);

		model.addAttribute("registerSuccess", "Sign Up Success!!");
		return "redirect:/login";
	}
}
