package com.Group9.ArtZone.Controller.Admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Group9.ArtZone.Controller.User.BaseController;
import com.Group9.ArtZone.Entities.Contact;
import com.Group9.ArtZone.Entities.Product;
import com.Group9.ArtZone.Services.ContactService;

@Controller
public class AdminContactController extends BaseController{

	@Autowired
	private ContactService contactService;
	
	@RequestMapping(value = {"/Admin/contact"},method = RequestMethod.GET)
	public String contactAdmin(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response) 
					throws IOException{
		model.addAttribute("contact", contactService.findAll());
		return "Admin/contact_admin";
	}
	@RequestMapping(value = {"/Admin/contact_detail"},method = RequestMethod.GET)
	public String contactDetail(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response) 
					throws IOException{
		int contactId = Integer.parseInt(request.getParameter("id"));
		Contact con = contactService.getById(contactId);
		model.addAttribute("con", con);
		model.addAttribute("contact", contactService.findAll());
		return "Admin/contact_detail";
	}
}
