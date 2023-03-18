package com.athttt.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.athttt.entity.Category;
import com.athttt.entity.Product;
import com.athttt.service.CategoryService;
import com.athttt.service.ProductService;

@Controller
public class AdminController {

	@Autowired
	CategoryService categoryService;

	@Autowired
	ProductService productService;

	@RequestMapping("/admin")
	public String getAdmin(Model model, 
			@RequestParam(required = false, defaultValue = "1", name = "page") String page
			, @RequestParam Map<String, String> searchMap) {
		long productCount = productService.count();
		Long pages = (long) Math.ceil(productCount / 9.0);
		if (Long.parseLong(page) > pages) {
			page = "1";
		}
		List<Category> categories = categoryService.getAll();
		List<Product> products = productService.getProducts(searchMap, Integer.valueOf(page));
		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		model.addAttribute("totalPage", pages);
		return "admin";
	}

	@RequestMapping("/admin/order")
	public String getOrder(Model model) {
		System.out.println("ABCDEF");
		List<Category> categories = categoryService.getAll();
		model.addAttribute("categories", categories);
		return "admin-order";
	}

}
