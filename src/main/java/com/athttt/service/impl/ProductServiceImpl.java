package com.athttt.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.athttt.converter.ProductConverter;
import com.athttt.entity.ProductEntity;
import com.athttt.model.ProductModel;
import com.athttt.repository.ProductRepository;
import com.athttt.repository.impl.ProductRepositoryImpl;
import com.athttt.service.ProductService;
import com.athttt.utils.ValidateUtils;

@Service
public class ProductServiceImpl implements ProductService {

	ProductRepository productRepository = new ProductRepositoryImpl();
	ProductConverter productConverter = new ProductConverter();
	
	@Override
	public List<ProductModel> getProducts(Map<String, Object> searchMap, Integer page) {
		System.out.println("page service" + page);
		List<ProductEntity> listProductEntity = productRepository.getProducts(searchMap, page);
		if (!ValidateUtils.isNotEmpty(listProductEntity)) return new ArrayList<>();
		// convert ProductEntity to Product Model
		List<ProductModel> listProductModel = new ArrayList<>();
		listProductEntity.forEach(item -> {
			ProductModel target = productConverter.entityToModel(item, ProductModel.class);
			listProductModel.add(target);
		});
		return listProductModel;
	}
	public  ProductModel getProduct(Integer id) {
		if (id == null) return null;
		ProductEntity productEntity = productRepository.getById(id);
		ProductModel productModel = productConverter.entityToModel(productEntity, ProductModel.class);
		return productModel;
	}
//	public static void main(String[] args) {
//		ProductService s = new ProductServiceImpl();
//		ProductModel productModel = s.getProduct(3);
//		System.out.println(productModel.getName());
//	}
}
