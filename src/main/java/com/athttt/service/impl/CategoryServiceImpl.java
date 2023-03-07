package com.athttt.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.athttt.converter.CategoryConverter;
import com.athttt.entity.CategoryEntity;
import com.athttt.model.CategoryModel;
import com.athttt.repository.CategoryRepository;
import com.athttt.repository.impl.CategoryRepositoryImpl;
import com.athttt.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {

	CategoryRepository categoryRepository = new CategoryRepositoryImpl();
	CategoryConverter categoryConverter = new CategoryConverter();
	@Override
	public List<CategoryModel> getCategories() {
		// TODO Auto-generated method stub
		List<CategoryEntity> categoriesEntity = categoryRepository.findAll();
		List<CategoryModel> categoriesModel = new ArrayList<>();
		
		for (CategoryEntity ca : categoriesEntity) {
			categoriesModel.add(categoryConverter.entityToModel(ca, CategoryModel.class));
		}
		return categoriesModel;
	}
	
}
