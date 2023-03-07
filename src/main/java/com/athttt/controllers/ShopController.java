package com.athttt.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.athttt.model.CategoryModel;
import com.athttt.model.ProductModel;
import com.athttt.service.CategoryService;
import com.athttt.service.ProductService;
import com.athttt.service.impl.CategoryServiceImpl;
import com.athttt.service.impl.ProductServiceImpl;

@Controller("/")
public class ShopController {

	ProductService productService = new ProductServiceImpl();
	CategoryService CategoryService = new CategoryServiceImpl();

	@RequestMapping("/")
	public String index(Model model, @RequestParam Map<String, Object> params,
			@RequestParam(name = "page", required = false, defaultValue = "1") String page) {

		List<ProductModel> products = productService.getProducts(params, Integer.valueOf(page));
		List<CategoryModel> categories = CategoryService.getCategories();
		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		for (ProductModel p : products) {
			System.out.println(p.getName());
		}
		return "shop";
	}

	@RequestMapping("/{id}")
	public String productDetails(Model model, @PathVariable("id") Integer id) {
		ProductModel product = productService.getProduct(id);
		model.addAttribute("product", product);
		return "shop";
	}
}
