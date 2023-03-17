package com.athttt.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.athttt.entity.Product;
import com.athttt.entity.Users;
import com.athttt.service.ProductService;
import com.athttt.service.UserService;

@Controller
public class ShopController {
	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService;
	
	@Autowired 
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("/shop")
	public String index(Model model , @RequestParam Map<String, Object> searchMap ,
            @RequestParam(value = "page", defaultValue = "1", required = false) String page,
            @RequestParam(value = "id", required = false) String id) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    if (authentication != null && authentication.isAuthenticated()) {
	        Users currentUser = userService.findUserByUsername(authentication.getName());
	        model.addAttribute("currentUser", currentUser);
	    }
		
	    long productCount = productService.count();
		Long pages = (long) Math.ceil(productCount/9.0);
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
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    if (authentication != null && authentication.isAuthenticated()) {
	        Users currentUser = userService.findUserByUsername(authentication.getName());
	        model.addAttribute("currentUser", currentUser);
	    }
		return "shopping-cart";
	}

	@RequestMapping("/checkout")
	public String checkout(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    if (authentication != null && authentication.isAuthenticated()) {
	        Users currentUser = userService.findUserByUsername(authentication.getName());
	        model.addAttribute("currentUser", currentUser);
	    }
		return "checkout";
	}
	

	@RequestMapping("/my-register")
	public String getRegister() {
		Users newUser = new Users(null, "Hùng vip", "123456", 1, "hung12", "0123456465");
		userService.insert(newUser);
		System.out.println("HHEEEE");
		return "redirect:/";
	}
	
	@RequestMapping("/bc")
	public String gx() {
		String username = "hung11";
		String password = "123456";
		Users u = userService.findUserByUsername(username);
		if ( u != null) {
			System.out.println(u.getUsername());
			System.out.println(u.getPassword());
			System.out.println(bCryptPasswordEncoder.encode(password));
			System.out.println(bCryptPasswordEncoder.matches(password, u.getPassword()));
		}
		
		
		return "checkout2";
	}
}
