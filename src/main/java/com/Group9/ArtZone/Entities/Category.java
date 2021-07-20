package com.Group9.ArtZone.Entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tbl_category")
public class Category extends BaseEntity{

		@Column(name="name",length = 100,nullable = false)
		private String name;
		
		@Column(name="description",length = 100,nullable = true)
		private String description;
		
		@Column(name = "avatar",length = 200,nullable = false)
		private String avatar;
		
		@Column(name = "seo", length = 1000, nullable = true)
		private String seo;
		
		@Column(name = "created_by", nullable = true)
		private Integer createdBy;
		//-----1-n Product----
		@OneToMany(cascade = CascadeType.ALL,mappedBy = "categories",fetch = FetchType.LAZY)
		private List<Product> listProduct= new ArrayList<Product>();
		
		@OneToMany(fetch = FetchType.LAZY,mappedBy = "parent",cascade = CascadeType.ALL)
		private List<Category> listCategory= new ArrayList<Category>();
		
		@ManyToOne(fetch = FetchType.LAZY)
		@JoinColumn(name = "parent_id")
		private Category parent;
//khi định nghĩa OnetoMany thì phải luôn phải định nghĩa 2 hàm quản lý list
		
		public void addProduct(Product products) {
			listProduct.add(products);
			products.setCategories(this);
		}
		public void deleteProduct(Product products) {
			listProduct.remove(products);
			products.setCategories(null);
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

		public String getSeo() {
			return seo;
		}

		public void setSeo(String seo) {
			this.seo = seo;
		}
		
		public List<Product> getListProduct() {
			return listProduct;
		}

		public void setListProduct(List<Product> listProduct) {
			this.listProduct = listProduct;
		}
		public List<Category> getListCategory() {
			return listCategory;
		}
		public void setListCategory(List<Category> listCategory) {
			this.listCategory = listCategory;
		}
		public Category getParent() {
			return parent;
		}
		public void setParent(Category parent) {
			this.parent = parent;
		}
		public String getAvatar() {
			return avatar;
		}
		public void setAvatar(String avatar) {
			this.avatar = avatar;
		}
		public Integer getCreatedBy() {
			return createdBy;
		}
		public void setCreatedBy(Integer createdBy) {
			this.createdBy = createdBy;
		}
		
		
}
