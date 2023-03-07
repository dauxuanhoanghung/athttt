package com.athttt.repository.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.athttt.constant.SystemConstant;
import com.athttt.entity.ProductEntity;
import com.athttt.enums.SpecialSearchParamsEnum;
import com.athttt.repository.ProductRepository;
import com.athttt.utils.MapUtils;
import com.athttt.utils.QueryBuilderUtils;
import com.athttt.utils.ValidateUtils;

public class ProductRepositoryImpl extends CommonRepositoryImpl<ProductEntity> implements ProductRepository {

	@Override
	public List<ProductEntity> getProducts(Map<String, Object> searchMap, Integer page) {
		List<ProductEntity> productEntities = new ArrayList<>();
//		if (ValidateUtils.isEmptyMap(searchMap)) {
//			return super.findAll();
//		}
		StringBuilder fromStatement = buildFromStatment(searchMap);
		StringBuilder whereStatement = buildSpecialField(searchMap).append(buildNormalField(searchMap));
		StringBuilder query = new StringBuilder("SELECT p.*").append(fromStatement).append(whereStatement)
				.append(buildPanigate(page));

		System.out.println(query.toString());
		productEntities = super.findByCondition(query.toString());
		return productEntities;
	}

	public String buildPanigate(Integer page) {
		int size = SystemConstant.PAGE_SIZE / 2;
		int skip = size * (page - 1);
		return String.format("%nLIMIT %s OFFSET %s", size, skip);
	}

	public StringBuilder buildFromStatment(Map<String, Object> searchMap) {
//		List<String> params = getSpecialSearchParams();
		StringBuilder fromStatement = new StringBuilder("\nFROM Product p");
		for (String key : searchMap.keySet()) {
			if (key.equals("categoryId")) {
				fromStatement.append("\nJOIN Category c ON p.category_id = c.id");
			}
		}
		return fromStatement;

	}

	public StringBuilder buildSpecialField(Map<String, Object> searchMap) {
		StringBuilder whereStatement = new StringBuilder(SystemConstant.WHERE_ONE_EQUALS_ONE);

		Float minPrice = MapUtils.getValueFromString(searchMap.getOrDefault("minPrice", null), Float.class);
		Float maxPrice = MapUtils.getValueFromString(searchMap.getOrDefault("maxPrice", null), Float.class);

		if (minPrice != null || maxPrice != null) {
			whereStatement.append(QueryBuilderUtils.withBetween("p.price", minPrice, maxPrice));
		}

		Integer categoryId = MapUtils.getValueFromString(searchMap.getOrDefault("categoryId", null), Integer.class);

		if (categoryId != null) {
			whereStatement
					.append(QueryBuilderUtils.withOperator("p.category_id", categoryId, SystemConstant.EQUAL_OPERATOR));
		}
		return whereStatement;
	}

	public StringBuilder buildNormalField(Map<String, Object> searchMap) {
		StringBuilder whereStatement = new StringBuilder();
		List<String> specialParams = getSpecialSearchParams();
		for (String key : searchMap.keySet()) {
			if (!key.equals("page") && !specialParams.contains(key.toString().toLowerCase())) {
				Object value = searchMap.get(key);
				if (value instanceof String) {
					whereStatement.append(QueryBuilderUtils.withLike("p." + key.toString(), value.toString()));
				} else {
					whereStatement.append(QueryBuilderUtils.withOperator("p." + key.toString(), value,
							SystemConstant.EQUAL_OPERATOR));
				}
			}

		}
		return whereStatement;
	}

	private List<String> getSpecialSearchParams() {
		List<String> params = new ArrayList<>();

		for (SpecialSearchParamsEnum item : SpecialSearchParamsEnum.values()) {
			params.add(item.getValue().toLowerCase());
		}

		return params;
	}

	@Override
	public ProductEntity getById(Integer id) {
		// TODO Auto-generated method stub
		return super.findById(id);
	}

}
