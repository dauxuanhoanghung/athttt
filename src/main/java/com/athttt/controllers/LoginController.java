package com.athttt.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.athttt.entity.LoginForm;
import com.athttt.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private UserService userDetailsService;

	@PostMapping("/authenticate")
	public String authenticate(@RequestBody String username, @RequestBody String password, HttpSession session,
			RedirectAttributes redirectAttributes) {
//		String username = loginForm.getUsername();
//		String password = loginForm.getPassword();
		System.out.println(username);
		password = username.substring(username.lastIndexOf("=") + 1);
		username = username.substring(username.indexOf("=") + 1, username.indexOf("&"));
		System.out.println(username);
		System.out.println(password);
//		return "index";
		try {
			// authenticate user
			Authentication authentication = authenticationManager
					.authenticate(new UsernamePasswordAuthenticationToken(username, password));

			// set authentication in SecurityContext
			SecurityContextHolder.getContext().setAuthentication(authentication);

			// load user details from UserDetailsService
			UserDetails userDetails = userDetailsService.loadUserByUsername(username);

			// set user details in session
			session.setAttribute("userDetails", userDetails);

			return "redirect:/";
		} catch (BadCredentialsException e) {
			redirectAttributes.addFlashAttribute("error", "Invalid username or password");
			return "redirect:/login";
		}
	}

	@RequestMapping("/login")
	public String auth() {
		return "login";
	}
}
