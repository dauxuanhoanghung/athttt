package com.athttt.service;

import java.util.List;
import java.util.Map;

import com.athttt.model.ProductModel;

public interface ProductService {
	List<ProductModel> getProducts(Map<String, Object> searchMap, Integer page);
	ProductModel getProduct(Integer id);
}
