package com.Group9.ArtZone.Controller.User;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Group9.ArtZone.Entities.Product;
import com.Group9.ArtZone.Entities.SaleOrder;
import com.Group9.ArtZone.Entities.SaleOrder_Products;
import com.Group9.ArtZone.Entities.Users;
import com.Group9.ArtZone.Services.ProductService;
import com.Group9.ArtZone.Services.SaleOderProductService;
import com.Group9.ArtZone.Services.SaleOrderService;
import com.Group9.ArtZone.Services.UsersService;
import com.Group9.ArtZone.dto.Cart;
import com.Group9.ArtZone.dto.CartItem;
import com.Group9.ArtZone.dto.UsersModel;

@Controller
public class CartController extends BaseController {

	@Autowired
	ProductService productService;
	
	@Autowired
	SaleOderProductService saleOderProductService;
	
	@Autowired
	SaleOrderService saleOrderService;
	
	@Autowired
	UsersService usersService;
	@RequestMapping(value = { "/cart" }, method = RequestMethod.GET)
	public String cart(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Users u=new Users();
		if (principal instanceof UserDetails) { 
			u = (Users) principal;
		}
		UsersModel um=new UsersModel();
		um.setId(u.getId());
		List<Users> lu =usersService.searchModel(um);
		Users us=lu.get(0);
		model.addAttribute("user", us);
		return "User/cart";
	}

	
	//--------------------CART-ADD-----------------------------
	
	
	@RequestMapping(value = { "/cart_add" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem cartItem) {
		// lay doi tuong session
		// session tuong tu nhu la 1 map luu tren ram cua server
		HttpSession httpSession = request.getSession();

		// dinh nghia gio hang
		Cart cart = null;

		// kiem tra xem da co gio hang tren session
		if (httpSession.getAttribute("cart") != null) {
			// neu da ton tai gio hang thi lay ra tu session
			cart = (Cart) httpSession.getAttribute("cart");
		} else {
			cart = new Cart(); // khoi tao gio hang neu chua co
			httpSession.setAttribute("cart", cart); // luu gio hang tren session
		}

		// kiem tra item da co trong gio hang chua
		// lay tat ca cac san pham co trong gio hang
		List<CartItem> cartItems = cart.getCartItems();

		// bat dau kiem tra xem da ton tai chua
		boolean isExists = false;
		for (CartItem item : cartItems) {
			if (item.getProductId() == cartItem.getProductId()) {
				isExists = true;
			}
		}

		// neu khong ton tai san pham trong gio hang
		if (!isExists) {
			// lay thong tin san pham tu db
			Product productInDb = productService.getById(cartItem.getProductId());

			// thiet lap cac gia tri khac cua item
			cartItem.setProductName(productInDb.getTitle());
			cartItem.setPriceUnit(productInDb.getPrice());
			cartItem.setAvatar(productInDb.getAvatar());
			cartItem.setCategory(productInDb.getCategories().getName());
			cartItem.setSeo(productInDb.getSeo());
			// add san pham vao trong gio hang
			cart.getCartItems().add(cartItem);
		}

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));

		getTotalPrice(request);
		double totalPr=getTotalPrice(request);
		httpSession.setAttribute("totalItems", getTotalItems(request));
		httpSession.setAttribute("totalPrice", totalPr);
		return ResponseEntity.ok(jsonResult);
	}

	private double getTotalPrice(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		
		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();
		
		double totalPrice = 0;
		for (CartItem cartItem2 : cartItems) {
			totalPrice+=cartItem2.getPriceUnit().doubleValue();
		}
		return totalPrice;
	}

	private int getTotalItems(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("cart") == null) {
			return 0;
		}

		Cart cart = (Cart) httpSession.getAttribute("cart");
		List<CartItem> cartItems = cart.getCartItems();

		int total = cartItems.size();
		
		return total;
	}
	
	
	//----------------------CART-DELETE------------------------
	
	
	@RequestMapping(value = { "/cart_delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteItemInCart(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody CartItem cartItem) {
		HttpSession httpSession = request.getSession();

		Cart cart = (Cart) httpSession.getAttribute("cart");

		List<CartItem> cartItems = cart.getCartItems();
		Double totalPrice = 0d;
		
		for (int i = 0; i < cartItems.size(); i++) {
			if(cartItems.get(i).getProductId() == cartItem.getProductId()) {
				cartItems.remove(i);
				break;
			}
		}
		for (CartItem item : cartItems) {
			totalPrice += item.getPriceUnit().doubleValue();
		}
		
		httpSession.setAttribute("totalItems", getTotalItems(request));
		httpSession.setAttribute("totalPrice", totalPrice);
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("status", "TC");
		jsonResult.put("totalItems", getTotalItems(request));
		return ResponseEntity.ok(jsonResult);
	}
	
	//-----------------------CART-PAYMENT---------------------------------------
	
	private void resetCart(final HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("cart", new Cart());
		httpSession.setAttribute("totalItems", 0);
	}
	
	@RequestMapping(value = { "/cart_payment" }, method = RequestMethod.POST)
	public String cartPayment(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		
		HttpSession httpSession = request.getSession();
		Cart cart = (Cart) httpSession.getAttribute("cart");
		httpSession.setAttribute("totalItems", 0);
		List<CartItem> cartItems = cart.getCartItems();
		
		if (cartItems.size() == 0||cartItems.isEmpty()) {
			model.addAttribute("cartNull", "There are no products in your cart!");
			return "User/cart";
		}

		String customerName = null;
		String customerPhone = null;
		String customerEmail = null;
		String customerAddress=null;
		String customerId= null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) { // user đã đăng nhập -> lưu thông tin user vào saleorder
			Users u = (Users) principal;
			customerName = u.getFullname();
			customerPhone=u.getPhone();
			customerEmail = u.getEmail();
			customerAddress=u.getAddress();
			customerId=u.getId().toString();
		} else {
			return "/login";
		}
//		System.out.println("Full name:"+customerName);
//		System.out.println("Phone:"+customerPhone);
//		System.out.println("Email:"+customerEmail);
		SaleOrder saleOrder = new SaleOrder();
		saleOrder.setCode("ORDER-" + System.currentTimeMillis());
		saleOrder.setSeo("ORDER-" + System.currentTimeMillis());
		saleOrder.setCustomer_name(customerName);
		saleOrder.setCustomer_email(customerEmail);
		saleOrder.setCustomer_phone(customerPhone);
		saleOrder.setCustomer_address(customerAddress);
		saleOrder.setUser_id(Integer.parseInt(customerId));
		saleOrder.setTotal(new BigDecimal(0));

		BigDecimal totalPrice = BigDecimal.ZERO;

		for (CartItem item : cartItems) {
			Date date = new Date();
			SaleOrder_Products saleOrderProducts = new SaleOrder_Products();
			saleOrderProducts.setCreatedDate(date);
			saleOrderProducts.setProduct(productService.getById(item.getProductId()));
			saleOrderProducts.setStage("WAITTING");
			saleOrder.addSaleoder_products(saleOrderProducts);
			totalPrice = totalPrice.add(item.getPriceUnit());
		}
		saleOrder.setTotal(totalPrice);
		if(saleOrder.getCustomer_name()==null||saleOrder.getCustomer_email()==null||
				saleOrder.getCustomer_phone()==null||saleOrder.getCustomer_address()==null
				||saleOrder.getCustomer_name().length()==0||saleOrder.getCustomer_email().length()==0
				||saleOrder.getCustomer_phone().length()==0||saleOrder.getCustomer_address().length()==0) {
			model.addAttribute("inforNull", "Your name, address, email or phone number must not be missing !");
			return "User/cart";
		}
		saleOrder.setCreatedDate(new Date());
		saleOrderService.save(saleOrder);
		

//		try {
//			mailService.sendMailAfterOrderSuccess(customerEmail);sa
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//		}

		model.addAttribute("orderSuccess", "Chúc mừng bạn đã đặt hàng thành công, vui lòng kiểm tra email!");
		this.resetCart(request);
		return "redirect:/market";
	}
}
