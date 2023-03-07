package com.athttt.entity;

public class SaleOrderDetailsEntity {
	private Integer id;
	private String code;
	private Float  unitPrice;
	private Integer unitQuantity;
	private Integer order_id;
	private Integer product_id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Float getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Float unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Integer getUnitQuantity() {
		return unitQuantity;
	}
	public void setUnitQuantity(Integer unitQuantity) {
		this.unitQuantity = unitQuantity;
	}
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	
}
