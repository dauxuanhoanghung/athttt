package com.athttt.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.athttt.entity.Product;
import com.athttt.service.ProductService;

@Controller
public class ShopController {
	@Autowired
	ProductService productService ;
	
	@RequestMapping("/shop")
	public String index(Model model) {
		List<Product> listProduct =  productService.getAllProduct();
		model.addAttribute("products", listProduct);
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
