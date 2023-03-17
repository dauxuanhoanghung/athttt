package com.athttt.controllers;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriUtils;

import com.athttt.entity.Users;
import com.athttt.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private UserService userDetailsService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@PostMapping("/authenticate")
	public String authenticate(@RequestBody String username, @RequestBody String password, HttpSession session,
			RedirectAttributes redirectAttributes) {	
		username = UriUtils.decode(username, StandardCharsets.UTF_8);
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

	@PostMapping("/register")
	public String registerHandler(@RequestBody String info, HttpServletRequest http) {
		info = UriUtils.decode(info, StandardCharsets.UTF_8);
		System.out.println(info);
		List<String> kav = Arrays.asList(info.split("&"));
		Map<String, String> infos = new HashMap<>();
		kav.forEach(e -> {
			String[] kv = e.split("=");
			if (kv.length > 1)
				infos.put(kv[0], kv[1]);
			System.out.println(kv[0] + " " + kv[1]);
		});
		Users u = userDetailsService.findUserByUsername(infos.getOrDefault("username", null));
		if (u != null) {
			System.out.println(u.getUsername());
			return "redirect:/login?register=true";
		} else {
			Users newUsers = new Users(null, infos.get("username"), infos.get("password"), 1,
					infos.get("username"), infos.get("account_number"), "USER", null, null);
			userDetailsService.insert(newUsers);
		}
		return "redirect:/login";
	}

	@GetMapping("/profile")
	public String showProfilePage(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Users currentUser = userDetailsService.findUserByUsername(authentication.getName());
		model.addAttribute("currentUser", currentUser);
		return "profile";
	}
}
