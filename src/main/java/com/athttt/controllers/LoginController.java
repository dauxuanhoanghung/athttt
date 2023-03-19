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
import com.athttt.utils.VigenereCipher;

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
			boolean isAdmin = userDetails.getAuthorities().stream()
					.anyMatch(authority -> authority.getAuthority().equals("ROLE_ADMIN")
							|| authority.getAuthority().equals("ADMIN"));
			// debug statement to check authorities
			System.out.println("User authorities: " + userDetails.getAuthorities());
			// redirect to appropriate page based on user role
			if (isAdmin) {
				return "redirect:/admin";
			} else {
				return "redirect:/shop";
			}

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
		Map<String, String> infos = this.splitResquestBody(info);
		if (!infos.get("password").equals(infos.get("confirm"))) {
			return "redirect:/login?register=true";
		}

		Users u = userDetailsService.findUserByUsername(infos.getOrDefault("username", null));
		if (u != null) {
			System.out.println(u.getUsername());
			return "redirect:/login?register=true";
		} else {
			Users newUsers = new Users(null, infos.get("username"), infos.get("password"), 1, infos.get("username"),
					infos.get("account_number"), "USER", null, null, infos.get("email"));
			userDetailsService.insert(newUsers);
		}
		return "redirect:/login";
	}

	@GetMapping("/profile")
	public String showProfilePage(Model model) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Users currentUser = userDetailsService.findUserByUsername(authentication.getName());
		if (currentUser.getAccountNumber() != null && !currentUser.getAccountNumber().isEmpty()) {
			currentUser.setAccountNumber(
					VigenereCipher.decrypt(currentUser.getAccountNumber(), currentUser.getUsername()));
		}
		model.addAttribute("currentUser", currentUser);

		return "profile";
	}

	@PostMapping("/profile")
	public String updateProfile(@RequestBody(required = false) String res, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Users currentUser = userDetailsService.findUserByUsername(authentication.getName());
		model.addAttribute("currentUser", currentUser);
		Map<String, String> infos = this.splitResquestBody(res);
		if (!infos.get("newPass").isEmpty() && !infos.get("confirmPass").isEmpty()
				&& !infos.get("currentPass").isEmpty()) { // có nhập cả 3
			if (!infos.get("newPass").equals(infos.get("confirmPass"))
					|| !bCryptPasswordEncoder.matches(infos.get("currentPass"), currentUser.getPassword())) {
				model.addAttribute("error", "Password không khớp");
			} else {
				model.addAttribute("success", "Update your information successful !!!");
				infos.put("id", currentUser.getId().toString());
				currentUser = userDetailsService.updateUsers(infos);
				if (currentUser.getAccountNumber() != null && !currentUser.getAccountNumber().isEmpty()) {
					System.out.println("username:" + currentUser.getUsername());
					System.out.println("account:" + currentUser.getAccountNumber());
					currentUser.setAccountNumber(
							VigenereCipher.decrypt(currentUser.getAccountNumber(), currentUser.getUsername()));
				}
			}
		} else if (infos.get("newPass").isEmpty() && infos.get("confirmPass").isEmpty()
				&& infos.get("currentPass").isEmpty()) {
			model.addAttribute("success", "Update your information successful !!!");
			infos.put("id", currentUser.getId().toString());
			currentUser = userDetailsService.updateUsers(infos);
			if (currentUser.getAccountNumber() != null && !currentUser.getAccountNumber().isEmpty()) {
				System.out.println("username:" + currentUser.getUsername());
				System.out.println("account:" + currentUser.getAccountNumber());
				currentUser.setAccountNumber(
						VigenereCipher.decrypt(currentUser.getAccountNumber(), currentUser.getUsername()));
			}
		} else {
			model.addAttribute("error", "Các field password cần đều phải nhập");
		}
		return "profile";
	}

	private Map<String, String> splitResquestBody(String res) {
		if (res != null) {
			res = UriUtils.decode(res, StandardCharsets.UTF_8).replace("+", " ");
			System.out.println(res);
			List<String> kav = Arrays.asList(res.split("&"));
			System.out.println(kav);
			Map<String, String> infos = new HashMap<>();
			kav.forEach(e -> {
				String[] kv = e.split("=");
				if (kv.length > 1)
					infos.put(kv[0], kv[1]);
				else
					infos.put(kv[0], "");
			});
			return infos;
		}
		return null;
	}
}
