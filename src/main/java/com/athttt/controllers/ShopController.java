package com.athttt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShopController {
	@RequestMapping("/shop")
	public String index() {
		return "shop";
	}
	@RequestMapping("/shop/{id}")
	public String shopDetail() {
		return "shop-details";
	}
	@RequestMapping("/my-cart")
	public String myCart() {
		return "shopping-cart";
	}
	
	@RequestMapping("/checkout")
	public String checkout() {
		return "checkout";
	}
}
