package com.athttt.entity;

import com.athttt.annotation.Column;
import com.athttt.annotation.Entity;
import com.athttt.annotation.Table;

@Entity
@Table(name = "category")
public class CategoryEntity extends BaseEntity{
	@Column ( name = "name")
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
