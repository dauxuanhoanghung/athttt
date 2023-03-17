/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.athttt.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author LENOVO
 */
@Entity
@Table(name = "users")
@NamedQueries({ @NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u"),
		@NamedQuery(name = "Users.findById", query = "SELECT u FROM Users u WHERE u.id = :id"),
		@NamedQuery(name = "Users.findByCreatedby", query = "SELECT u FROM Users u WHERE u.createdby = :createdby"),
		@NamedQuery(name = "Users.findByCreateddate", query = "SELECT u FROM Users u WHERE u.createddate = :createddate"),
		@NamedQuery(name = "Users.findByModifiedby", query = "SELECT u FROM Users u WHERE u.modifiedby = :modifiedby"),
		@NamedQuery(name = "Users.findByModifieddate", query = "SELECT u FROM Users u WHERE u.modifieddate = :modifieddate"),
		@NamedQuery(name = "Users.findByEmail", query = "SELECT u FROM Users u WHERE u.email = :email"),
		@NamedQuery(name = "Users.findByFullname", query = "SELECT u FROM Users u WHERE u.fullname = :fullname"),
		@NamedQuery(name = "Users.findByPassword", query = "SELECT u FROM Users u WHERE u.password = :password"),
		@NamedQuery(name = "Users.findByStatus", query = "SELECT u FROM Users u WHERE u.status = :status"),
		@NamedQuery(name = "Users.findByUsername", query = "SELECT u FROM Users u WHERE u.username = :username"),
		@NamedQuery(name = "Users.findByRole", query = "SELECT u FROM Users u WHERE u.role = :role") })
public class Users implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Long id;
	@Size(max = 255)
	@Column(name = "createdby")
	private String createdby;
	@Column(name = "createddate")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createddate;
	@Size(max = 255)
	@Column(name = "modifiedby")
	private String modifiedby;
	@Column(name = "modifieddate")
	@Temporal(TemporalType.TIMESTAMP)
	private Date modifieddate;
	// @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
	// message="Invalid email")//if the field contains email address consider using
	// this annotation to enforce field validation
	@Size(max = 255)
	@Column(name = "email")
	private String email;
	@Basic(optional = false)
	@NotNull
	@Size(min = 1, max = 255)
	@Column(name = "fullname")
	private String fullname;

	@Basic(optional = false)
	@Size(min = 1, max = 20)
	@Column(name = "account_number")
	private String accountNumber;

	
	@Basic(optional = false)
	@Size(min = 1, max = 10)
	@Column(name = "phone")
	private String phone;
	
	@Basic(optional = false)
	@Size(min = 1, max = 100)
	@Column(name = "address")
	private String address;
	
	
	@Basic(optional = false)
	@NotNull
	@Size(min = 1, max = 255)
	@Column(name = "password")
	private String password;
	@Basic(optional = false)
	@NotNull
	@Column(name = "status")
	private int status;
	@Basic(optional = false)
	@NotNull
	@Size(min = 1, max = 255)
	@Column(name = "username")
	private String username;
	@Size(max = 10)
	@Column(name = "role")
	private String role;
	@OneToMany(mappedBy = "userId")
	private List<Comment> commentList;
	@OneToMany(mappedBy = "userId")
	private List<Saleorder> saleorderList;

	public Users() {
	}

	public Users(Long id) {
		this.id = id;
	}

	public Users(Long id, String fullname, String password, int status, String username, String account_number, String role
			, String address, String phone) {
        this.id = id;
        this.fullname = fullname;
        this.password = password;
        this.status = status;
        this.username = username;
        this.accountNumber = account_number;
        this.address = address;
        this.phone = phone;
        this.role = role.equals("ADMIN") ? "ADMIN" : "USER" ;
    }
	public Users(Long id, String fullname, String password, int status, String username, String account_number) {
        this.id = id;
        this.fullname = fullname;
        this.password = password;
        this.status = status;
        this.username = username;
        this.accountNumber = account_number;
        this.role = "USER" ;
    }


	


	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCreatedby() {
		return createdby;
	}

	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}

	public Date getCreateddate() {
		return createddate;
	}

	public void setCreateddate(Date createddate) {
		this.createddate = createddate;
	}

	public String getModifiedby() {
		return modifiedby;
	}

	public void setModifiedby(String modifiedby) {
		this.modifiedby = modifiedby;
	}

	public Date getModifieddate() {
		return modifieddate;
	}

	public void setModifieddate(Date modifieddate) {
		this.modifieddate = modifieddate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public List<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

	public List<Saleorder> getSaleorderList() {
		return saleorderList;
	}

	public void setSaleorderList(List<Saleorder> saleorderList) {
		this.saleorderList = saleorderList;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (id != null ? id.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		// TODO: Warning - this method won't work in the case the id fields are not set
		if (!(object instanceof Users)) {
			return false;
		}
		Users other = (Users) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "com.athttt.entity.Users[ id=" + id + " ]";
	}

}
