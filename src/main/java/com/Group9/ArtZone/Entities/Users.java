package com.Group9.ArtZone.Entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "tbl_users")
public class Users extends BaseEntity implements UserDetails{
	
	@Column (name = "username",length = 45,nullable = false)
	private String username;
	
	@Column (name = "password",length = 100,nullable = false)
	private String password;
	
	@Column (name = "email",length = 100,nullable = false)
	private String email;
	
	@Column (name = "display_name",length = 45,nullable = false)
	private String displayName;
	
	@Column (name = "fullname" ,length = 45,nullable = true)
	private String fullname;
	
	@Column (name = "avatar",length = 200, nullable = true)
	private String avatar;
	
	@Column (name = "background",length = 200, nullable = true)
	private String background;
	
	@Column (name = "phone",length = 45,nullable = true)
	private String phone;
	
	@Column (name = "address",length = 100,nullable = true)
	private String address;
	
	@Column (name = "des",length = 300,nullable = true)
	private String des;
	
	@Column (name = "company",length = 45,nullable = true)
	private String company;
	
	@Column(name = "created_by", nullable = true)
	private Integer createdBy;
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "user",fetch = FetchType.LAZY)
	private List<Product> listPro= new ArrayList<Product>();
	
	public void addProduct(Product product) {
		listPro.add(product);
		product.setUser(this);
	}

	public void deleteProduct(Product product) {
		listPro.remove(product);
		product.setUser(null);
	}
	
//	@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
//	@JoinTable(name = "tbl_users_roles",
//	joinColumns = @JoinColumn(name="user_id"),
//	inverseJoinColumns = @JoinColumn(name="role_id"))
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "listUsers")
	private List<Roles> listRoles=new ArrayList<Roles>();
	
	public void addRoles(Roles role) {
		role.getListUsers().add(this);
		listRoles.add(role);
	}
	public void removeRoles(Roles role) {
		role.getListUsers().remove(this);
		listRoles.remove(role);
	}
	
	public List<Roles> getListRoles() {
		return listRoles;
	}

	public void setListRoles(List<Roles> listRoles) {
		this.listRoles = listRoles;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getBackground() {
		return background;
	}
	public void setBackground(String background) {
		this.background = background;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPasswords() {
		return password;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return listRoles;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	@Override
	public boolean isEnabled() {
		
		return true;
	}
	@Override
	public String getPassword() {
		return password;
	}
	@Override
	public String getUsername() {
		return username;
	}
	public Integer getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public List<Product> getListPro() {
		return listPro;
	}

	public void setListPro(List<Product> listPro) {
		this.listPro = listPro;
	}
	
}
