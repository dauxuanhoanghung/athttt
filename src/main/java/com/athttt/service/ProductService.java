package com.athttt.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.athttt.entity.Product;
import com.athttt.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired
	private ProductRepository productRepository ;
	
	public List<Product> getAllProduct(){
		return productRepository.findAll();
	}
	
    public Long count() {
        return productRepository.count();
    }

    public List<Product> getProducts(Map<String, Object> searchMap, Integer page) {
        Pageable pageable = PageRequest.of(page - 1, 9);
        Page<Product> productPage = productRepository.findAll(pageable);
        List<Product> productList = productPage.getContent();
        return productList;
    }
	
}
