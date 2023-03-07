package com.athttt.repository;

import java.util.List;
import java.util.Map;

import com.athttt.entity.ProductEntity;

public interface ProductRepository extends CommonRepository<ProductEntity>{
	public List<ProductEntity> getProducts(Map<String, Object> searchMap, Integer page);
	ProductEntity getById(Integer id); 
}
