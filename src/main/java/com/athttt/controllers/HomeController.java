package com.athttt.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.athttt.entity.Users;
import com.athttt.service.UserService;

@Controller
@ControllerAdvice
public class HomeController {
	@Autowired
	private UserService userService;
	
	@ModelAttribute
	public void commonAttribute(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    if (authentication != null && authentication.isAuthenticated()) {
	        Users currentUser = userService.findUserByUsername(authentication.getName());
	        model.addAttribute("currentUser", currentUser);
	    }
	}
	
	@RequestMapping(path= { "/", "/home", "trang-chu" })
	public String index(Model model) {
		return "index";
	}

}
