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
import com.Group9.ArtZone.Entities.Category;
import com.Group9.ArtZone.Services.CategoriesService;

@Controller
public class AdminCategoryController extends BaseController{

	@Autowired
	private CategoriesService categoriesService;

	// Category
	@RequestMapping(value = { "/Admin/Add_category" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("category", new Category());
		model.addAttribute("categories", categoriesService.findAll());
		return "Admin/add_categories";
	}

	// List-Category
	@RequestMapping(value = { "/Admin/Category_table" }, method = RequestMethod.GET)
	public String table(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("category", new Category());
		model.addAttribute("cate", categoriesService.findAll());
		return "Admin/table/category";
	}

	// Add-Category
	@RequestMapping(value = { "/Admin/Add_category" }, method = RequestMethod.POST)
	public String addCategory(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("category") Category category,
			@RequestParam("categoryAvatar") MultipartFile categoryAvatar) throws Exception {
		if (category.getId() != null && category.getId() > 0) {
			categoriesService.editCategory(category, categoryAvatar);
		} else {
			categoriesService.saveCategory(category, categoryAvatar);
		}
		return "redirect:/Admin/Category_table";
	}

	// Edit-Category
	@RequestMapping(value = { "/Admin/Edit_category" }, method = RequestMethod.GET)
	public String editCategory(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		Category category = categoriesService.getById(categoryId);

		model.addAttribute("category", category);
		model.addAttribute("categories", categoriesService.findAll());
		return "Admin/add_categories";
	}
}
