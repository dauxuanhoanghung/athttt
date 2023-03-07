package com.athttt.converter;

import org.modelmapper.ModelMapper;

import com.athttt.entity.ProductEntity;
import com.athttt.model.ProductModel;

public class ProductConverter extends BaseConverter<ProductEntity> {
	private ModelMapper modelMapper = new ModelMapper();

	@Override
	public ProductModel entityToModel(ProductEntity productEntity, Class<?> tClass) {

		ProductModel productModel = modelMapper.map(productEntity, ProductModel.class);
		productModel.setId(productEntity.getId());
		productModel.setCategory(productEntity.getCategoryId());
		return productModel;
	}

}
