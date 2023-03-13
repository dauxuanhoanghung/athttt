package com.athttt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.athttt.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>{
	
}
