package com.athttt.enums;

public enum SpecialSearchParamsEnum {
	MINPRICE("minPrice"), MAXPRICE("maxPrice"), CATEGORY("categoryId");

	private final String value;

	SpecialSearchParamsEnum(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
}
