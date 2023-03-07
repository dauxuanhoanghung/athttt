package com.athttt.entity;

import java.sql.Date;

import com.athttt.annotation.Column;
import com.athttt.annotation.Entity;

@Entity
public class BaseEntity {
	@Column(name = "id")
	private int id;
	@Column(name = "createddate")
	private Date createdDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
}
