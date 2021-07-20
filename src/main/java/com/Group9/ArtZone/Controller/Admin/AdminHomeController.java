package com.Group9.ArtZone.Controller.Admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Group9.ArtZone.Controller.User.BaseController;

@Controller
public class AdminHomeController extends BaseController {
	
	@RequestMapping(value = {"/Admin","/Admin/Index-admin"},method = RequestMethod.GET)
	public String index(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response) 
					throws IOException{
		return "Admin/index_admin";
	}
}
