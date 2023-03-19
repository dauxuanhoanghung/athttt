package com.athttt.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.athttt.entity.Product;
import com.athttt.request.ProductRequest;
import com.athttt.service.OrderService;
import com.athttt.service.ProductService;
import com.athttt.service.UserService;

@Controller
public class ShopController {
	@Autowired
	ProductService productService;

	@Autowired
	UserService userService;

	@Autowired
	OrderService orderService;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping("/shop")
	public String index(Model model, @RequestParam Map<String, String> searchMap,
			@RequestParam(value = "page", defaultValue = "1", required = false) String page,
			@RequestParam(value = "id", required = false) String id) {

		long productCount = productService.count();
		Long pages = (long) Math.ceil(productCount / 9.0);
		if (Long.parseLong(page) > pages) {
			page = "1";
		}
		List<Product> listProduct = productService.getProducts(searchMap, Integer.valueOf(page));
		model.addAttribute("productCount", productCount);
		model.addAttribute("totalPage", pages);
		model.addAttribute("products", listProduct);

		return "shop";
	}

	@RequestMapping("/shop/{id}")
	public String shopDetail() {
		return "shop-details";
	}

	@RequestMapping("/my-cart")
	public String myCart(Model model) {
		return "shopping-cart";
	}

	@RequestMapping("/checkout")
	public String checkout(Model model) {

		return "checkout";
	}

	@RequestMapping("/payment")
	public String payment(Model model, @RequestBody List<ProductRequest> productRequests, HttpSession session) {
		Float subtotal = 0f;
		for (ProductRequest product : productRequests) {
			Product targetProduct = productService.findProductById(product.getId());
			subtotal += (targetProduct.getPrice() * Integer.valueOf(product.getQuantity().toString()));
		}
		session.setAttribute("subtotal", subtotal);
		return "forward:/payment-test";
	}

	@RequestMapping("/payment-test")
	public String paymentTest(Model model, HttpSession session) {
		String att = session.getAttribute("subtotal").toString();
		model.addAttribute("subtotal", att);
		return "payment";
	}

}
