package com.athttt.request;

import java.util.List;

public class OrderRequest {
	
	private Long userID;
	private List<ProductRequest> products;
	
	public Long getUserID() {
		return userID;
	}
	public void setUserID(Long userID) {
		this.userID = userID;
	}
	public List<ProductRequest> getProducts() {
		return products;
	}
	public void setProducts(List<ProductRequest> products) {
		this.products = products;
	}

	
	
	
}
