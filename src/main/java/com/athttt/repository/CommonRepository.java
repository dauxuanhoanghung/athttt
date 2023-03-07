package com.athttt.repository;

import java.util.List;

public interface CommonRepository<T> {
	List<T> findAll();

	T findById(Integer id);

	List<T> findByCondition(String sql);

	Integer insert(Object object);

	void update(Object object);

	void delete(Integer id);
}
