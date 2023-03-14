package com.athttt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.athttt.entity.Users;

public interface UserRepository extends JpaRepository<Users, Long>{
		
}
