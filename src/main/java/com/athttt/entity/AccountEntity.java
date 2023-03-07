package com.athttt.entity;

import com.athttt.annotation.Column;
import com.athttt.annotation.Entity;
import com.athttt.annotation.Table;

@Entity
@Table(name = "users")
public class AccountEntity extends BaseEntity{
	@Column(name = "username")
	private String username;
	@Column(name = "password")

	private String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
