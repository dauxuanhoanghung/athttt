package com.athttt.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.athttt.entity.Users;
import com.athttt.repository.UserRepository;

@Service
public class UserService implements UserDetailsService {
	@Autowired
	UserRepository userRepository;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	public Users findUserById(Long id) {
		return userRepository.getOne(id);
	}

	public Users insert(Users newUser) {
		newUser.setPassword(bCryptPasswordEncoder.encode(newUser.getPassword()));
		return userRepository.save(newUser);
	}

	public List<Users> getAll() {
		return userRepository.findAll();
	}
	
	public Users findUserByUsername(String username) {
		return userRepository.findByUsername(username);
	}
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users u = userRepository.findByUsername(username);
		if (u == null) {
			throw new UsernameNotFoundException("Invalid username!!!");
		}

		Set<GrantedAuthority> authorities = new HashSet<>();
		authorities.add(new SimpleGrantedAuthority(u.getRole()));

		return new org.springframework.security.core.userdetails.User(u.getUsername(), u.getPassword(), authorities);
	}
	


}
