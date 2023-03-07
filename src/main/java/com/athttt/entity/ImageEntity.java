package com.athttt.entity;

public class ImageEntity extends BaseEntity{
	private String url;
	private Integer product_id;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	
}
