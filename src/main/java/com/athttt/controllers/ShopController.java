package com.athttt.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.athttt.entity.Product;
import com.athttt.entity.Saleorder;
import com.athttt.entity.Saleorderdetails;
import com.athttt.entity.Users;
import com.athttt.request.OrderRequest;
import com.athttt.request.ProductRequest;
import com.athttt.service.OrderService;
import com.athttt.service.ProductService;
import com.athttt.service.UserService;
import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

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
	public String index(Model model, @RequestParam Map<String, Object> searchMap,
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

	@RequestMapping("/my-register")
	public String getRegister() {
		Users newUser = new Users(null, "Hùng vip", "123456", 1, "hung12", "0123456465");
		userService.insert(newUser);
		System.out.println("HHEEEE");
		return "redirect:/";
	}


}
