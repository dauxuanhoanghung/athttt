package com.athttt.converter;

public abstract class BaseConverter<T> {
	public abstract Object entityToModel (T object, Class<?> tClass);
}
