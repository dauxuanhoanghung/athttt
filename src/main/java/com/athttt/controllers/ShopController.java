package com.athttt.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.athttt.entity.Product;
import com.athttt.service.ProductService;

@Controller
public class ShopController {
	@Autowired
	ProductService productService;

	@RequestMapping("/shop")
	public String index(Model model , @RequestParam Map<String, Object> searchMap ,
            @RequestParam(value = "page", defaultValue = "1", required = false) String page,
            @RequestParam(value = "id", required = false) String id) {
		
		
		Long pages = (long) Math.ceil(productService.count()/9.0);
		if (Long.parseLong(page) > pages) {
            page = "1";
        }
		List<Product> listProduct = productService.getProducts(searchMap, Integer.valueOf(page));
		model.addAttribute("totalPage", pages);
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
