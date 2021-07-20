package com.Group9.ArtZone.Controller.Admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Group9.ArtZone.Controller.User.BaseController;
import com.Group9.ArtZone.Entities.Product;
import com.Group9.ArtZone.Entities.SaleOrder;
import com.Group9.ArtZone.Entities.SaleOrder_Products;
import com.Group9.ArtZone.Services.ProductService;
import com.Group9.ArtZone.Services.SaleOderProductService;
import com.Group9.ArtZone.Services.SaleOrderService;
import com.Group9.ArtZone.Services.UsersService;

enum Stage{
	WAITTING,CHECK,SUCCESS;
}

@Controller
public class AdminOrderController extends BaseController{
	
	@Autowired
	SaleOrderService saleOrderService;
	
	@Autowired
	SaleOderProductService saleOrderProductService;
	
	@Autowired
	UsersService usersService;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = { "/Admin/Page_Order" }, method = RequestMethod.GET)
	public String Page_Order(final ModelMap model,
			final HttpServletRequest request,
			final HttpServletResponse response)
			throws IOException {
		
		model.addAttribute("order", saleOrderService.findAll());
		model.addAttribute("user", usersService.findAll());
		return "Admin/order";
	}
	@RequestMapping(value = { "/Admin/lock_saleOrder" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> lockOrder_ajax(final ModelMap model,
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@RequestBody SaleOrder saleOrder) {

		Map<String, Object> jsonResult = new HashMap<String, Object>();

		try {
			int saleOrderId = Integer.parseInt(request.getParameter("saleOrderId"));
			SaleOrder saleO=saleOrderService.getById(saleOrderId);
			
			//productService.delete(
			if(saleO.getStatus()==Boolean.TRUE) {
				saleO.setStatus(Boolean.FALSE);
				jsonResult.put("code", 200);
			}else {
				saleO.setStatus(Boolean.TRUE);
				jsonResult.put("code", 300);
			}
			saleOrderService.saveOrUpdate(saleO);
			//productService.deleteById(product.getId());
			
			
			jsonResult.put("status", "TC");

		} catch (Exception e) {
			jsonResult.put("code", 500);
			jsonResult.put("message", e.getMessage());
		}

		return ResponseEntity.ok(jsonResult);
	}
	@RequestMapping(value = { "/Admin/check_saleOrder" }, method = RequestMethod.GET)
	public  String checkOrder(final ModelMap model,
			final HttpServletRequest request, 
			final HttpServletResponse response
			) {
		int saleOrderId = Integer.parseInt(request.getParameter("id"));
		SaleOrder saleOrder = saleOrderService.getById(saleOrderId);
		List<Product> listPro=new ArrayList<Product>();
		List<SaleOrder_Products> listOrder= saleOrder.getListSaleOder_Product();
		for (SaleOrder_Products order : listOrder) {
			listPro.add(order.getProduct());
			model.addAttribute("stage", order.getStage());
		}
		
		
		model.addAttribute("saleOr", saleOrder);
		model.addAttribute("listOrder",listOrder);
		model.addAttribute("listPro", listPro);
		model.addAttribute("totalItems", listPro.size());
		return "Admin/order_product";
	}
}
