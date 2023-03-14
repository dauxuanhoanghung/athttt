package com.athttt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.athttt.entity.Users;
import com.athttt.repository.UserRepository;

@Service
public class UserSerivce {
	@Autowired
	UserRepository userRepository ;
	
	public Users findUserById (Long id ) {
		return userRepository.getOne(id) ;
	}
	
	public Users insert(Users newUser) {
		return userRepository.save(newUser);
	}
	
	public List<Users> getAll () {
		return userRepository.findAll();
	}
	
	
}
