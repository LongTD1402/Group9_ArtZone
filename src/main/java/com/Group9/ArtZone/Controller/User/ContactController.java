package com.Group9.ArtZone.Controller.User;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Group9.ArtZone.Entities.Contact;
import com.Group9.ArtZone.Services.ContactService;

@Controller
public class ContactController extends BaseController{
	
	@Autowired
	private ContactService contactService;
	@RequestMapping(value = { "/Contact_us" }, method = RequestMethod.GET)
	public String contact(final ModelMap model, 
			final HttpServletRequest request, 
			final HttpServletResponse response)
			throws IOException {
		model.addAttribute("contact", new Contact());
		return "User/contact_us";
	}
	
	@RequestMapping(value = { "/Contact Us-SPForm" }, method = RequestMethod.POST)
	public String contact_SPForm(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("contact") Contact contact) throws IOException {
		
		if(contact.getFull_name().isEmpty()){
			model.addAttribute("NFullname", "You have not entered your FUll NAME !");
			return "User/contact_us";
		}
		if(contact.getEmail().isEmpty()){
			model.addAttribute("NEmail", "You have not entered your EMAIL !");
			return "User/contact_us";
		}
		if(contact.getMessage().isEmpty()){
			model.addAttribute("NMess", "You have not entered your MESSAGE !");
			return "User/contact_us";
		}
		contact.setCreatedDate(new Date());
		contactService.saveOrUpdate(contact);
		
		return "User/index";
	}
}
