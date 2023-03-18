package com.athttt.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.athttt.entity.Category;
import com.athttt.repository.CategoryRepository;
import com.athttt.service.CategoryService;

@Controller
public class AdminController {
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping("/admin")
	public String getAdmin (Model model) {
		System.out.println("ABCDEF");
		List<Category> categories = categoryService.getAll();
		model.addAttribute("categories", categories);
		return "admin";
	}
	@RequestMapping("/admin/order")
	public String getOrder (Model model) {
		System.out.println("ABCDEF");
		List<Category> categories = categoryService.getAll();
		model.addAttribute("categories", categories);
		return "admin-order";
	}
	

}
