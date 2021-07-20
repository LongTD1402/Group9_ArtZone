package com.Group9.ArtZone.Entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_contact")
public class Contact extends BaseEntity{
	
	@Column(name = "full_name",length = 45,nullable = false)
	private String full_name;
	
	@Column(name = "email",length = 45,nullable = false)
	private String email;
	
	@Column(name = "request_type",length = 45,nullable = true)
	private String request_type;
	
	@Column(name = "message",length = 1000,nullable = false)
	private String message;
	
	@Column(name = "created_by", nullable = true)
	private Integer createdBy;
	
	

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String fullname) {
		this.full_name = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRequest_type() {
		return request_type;
	}

	public void setRequest_type(String request_type) {
		this.request_type = request_type;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	
	
}
