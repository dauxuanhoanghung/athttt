package com.athttt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping("/admin")
	public String getAdmin () {
		System.out.println("ABCDEF");
		return "admin";
	}
}
