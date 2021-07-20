package com.Group9.ArtZone.Entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

@Entity
@Table(name = "tbl_roles")
public class Roles extends BaseEntity implements GrantedAuthority{

	@Column (name = "name",length = 45,nullable = false)
	private String name;
	
	@Column (name = "description",length = 45,nullable = false)
	private String description;
	
	@Column(name = "created_by", nullable = true)
	private Integer createdBy;
	
//	@ManyToMany(cascade = CascadeType.ALL, mappedBy = "listRoles",fetch = FetchType.EAGER)
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_users_roles",
			joinColumns = @JoinColumn(name = "role_id")
			, inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<Users> listUsers= new ArrayList<Users>();
	
	public List<Users> getListUsers() {
		return listUsers;
	}
	
	public void addUser(Users user) {
		user.getListRoles().add(this);
		listUsers.add(user);
	}

	public void delateUser(Users user) {
		user.getListRoles().remove(this);
		listUsers.remove(user);
		
	}
	public void setListUsers(List<Users> listUsers) {
		this.listUsers = listUsers;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return name;
	}
}
