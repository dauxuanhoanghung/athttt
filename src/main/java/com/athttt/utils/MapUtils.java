package com.athttt.utils;

public class MapUtils {
	public static <T> T getValueFromString(Object value, Class<T> tClass) {
		if (value == null)
			return null;
		else {
			if (tClass.getTypeName().equals("java.lang.Float")) {
				value = Float.valueOf(value.toString());
			}
			else if (tClass.getTypeName().equals("java.lang.Integer")) {
				value =  Integer.valueOf(value.toString());
			}
			return tClass.cast(value);
		}
	}
}
