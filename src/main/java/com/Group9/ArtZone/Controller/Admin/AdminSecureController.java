package com.Group9.ArtZone.Controller.Admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Group9.ArtZone.Controller.User.BaseController;
import com.Group9.ArtZone.Entities.Users;
import com.Group9.ArtZone.dto.Cart;
import com.Group9.ArtZone.dto.CartItem;

@Controller
public class AdminSecureController extends BaseController{

//	@Autowired
//	UserRepo userRepo;

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String login(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "login";
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
	@RequestMapping(value= {"/success"})
	public void loginPageRedirect(HttpServletRequest request, HttpServletResponse response, Authentication authResult)
			throws IOException, ServletException{
		Users u = (Users) authResult.getPrincipal();
		String role = u.getListRoles().get(0).getName();

		if (role.contains("ADMIN")) {
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/Admin"));
		} else {
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
			getTotalPrice(request);
			double totalPr=getTotalPrice(request);
			httpSession.setAttribute("totalItems", getTotalItems(request));
			httpSession.setAttribute("totalPrice", totalPr);
			response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/index"));
		}
	}

}
