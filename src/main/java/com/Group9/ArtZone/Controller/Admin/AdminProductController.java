package com.Group9.ArtZone.Controller.Admin;

import java.io.IOException;
import java.util.HashMap;
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

import com.Group9.ArtZone.Controller.User.BaseController;
import com.Group9.ArtZone.Entities.Product;
import com.Group9.ArtZone.Entities.SaleOrder;
import com.Group9.ArtZone.Services.CategoriesService;
import com.Group9.ArtZone.Services.ProductService;

@Controller
public class AdminProductController extends BaseController{

	@Autowired
	private CategoriesService categoriesService;

	@Autowired
	private ProductService productService;

	@RequestMapping(value = { "/Admin/Add product" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("products", new Product());
		model.addAttribute("category", categoriesService.findAll());
		return "Admin/add_product";
	}

	@RequestMapping(value = { "/Admin/Product table" }, method = RequestMethod.GET)
	public String table(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		model.addAttribute("category", categoriesService.findAll());
		model.addAttribute("products", productService.findAll());
		return "Admin/table/product";
	}

	// Add/Edit product
	@RequestMapping(value = { "/Admin/Add Product" }, method = RequestMethod.POST)
	public String addProducts(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @ModelAttribute("products") Product product,
			@RequestParam("productAvatar") MultipartFile productAvatar,
			@RequestParam("productImages") MultipartFile[] productImages) throws Exception {
		if (product.getId() != null && product.getId() > 0) {
			productService.edit(product, productAvatar, productImages);
		} else {
			productService.save(product, productAvatar, productImages);
		}
		return "redirect:/Admin/Product table";
	}

	// Edit product page
	@RequestMapping(value = { "/Admin/Edit-product" }, method = RequestMethod.GET)
	public String editProduct_Get(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		int proructId = Integer.parseInt(request.getParameter("id"));
		Product product = productService.getById(proructId);

		model.addAttribute("category", categoriesService.findAll());
		model.addAttribute("products", product);
		return "Admin/add_product";
	}

	// Delete product
	@RequestMapping(value = "/Admin/Delete_product", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteProduct(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response,@RequestBody Product product) throws Exception {
		productService.deletePro(product.getId());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("status", "Deleted!");
		return ResponseEntity.ok(jsonResult);
	}

	@RequestMapping(value = "/Admin/load_table_product", method = RequestMethod.GET)
	public String getDelete(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response ) {
		model.addAttribute("category", categoriesService.findAll());
		model.addAttribute("products", productService.findAll());
		
		return "Admin/table/list_pro";
	}
	@RequestMapping(value = { "/Admin/lock_product" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> lockOrder_ajax(final ModelMap model,
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@RequestBody Product product) {

		Map<String, Object> jsonResult = new HashMap<String, Object>();

		try {
			int productId = Integer.parseInt(request.getParameter("idPro"));
			Product pro=productService.getById(productId);
			
			//productService.delete(
			if(pro.getStatus()==Boolean.TRUE) {
				pro.setStatus(Boolean.FALSE);
				jsonResult.put("code", 200);
			}else {
				pro.setStatus(Boolean.TRUE);
				jsonResult.put("code", 300);
			}
			productService.saveOrUpdate(pro);
			//productService.deleteById(product.getId());
			
			
			jsonResult.put("status", "TC");

		} catch (Exception e) {
			jsonResult.put("code", 500);
			jsonResult.put("message", e.getMessage());
		}
		
		return ResponseEntity.ok(jsonResult);
	}
}
