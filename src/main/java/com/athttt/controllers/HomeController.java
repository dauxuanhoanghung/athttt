package com.athttt.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String index(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String name = authentication.getName();
		System.out.println(name);
		if (name != null) {
			model.addAttribute("name", name);
		}
		return "index";
	}

	@RequestMapping("/welcome")
	public String wel() {
		return "welcome";
	}


	
}
