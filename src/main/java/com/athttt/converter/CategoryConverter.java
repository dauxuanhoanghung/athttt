package com.athttt.converter;

import org.modelmapper.ModelMapper;

import com.athttt.entity.CategoryEntity;
import com.athttt.model.CategoryModel;

public class CategoryConverter extends BaseConverter<CategoryEntity> {
	private ModelMapper modelMapper = new ModelMapper();

	@Override
	public CategoryModel entityToModel(CategoryEntity categoryEntity, Class<?> tClass) {

		CategoryModel categoryModel = modelMapper.map(categoryEntity, CategoryModel.class);
		categoryModel.setId(categoryEntity.getId());
		return categoryModel;
	}

}