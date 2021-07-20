package com.Group9.ArtZone.Entities;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="tbl_products")
public class Product extends BaseEntity{
	
	@Column(name = "title",length = 1000,nullable = false)
	private String title;
	
	@Column(name = "price",precision = 13,scale = 2,nullable = false)
	private BigDecimal price;
	
	@Column(name = "price_sale",precision = 13,scale = 2,nullable = true)
	private BigDecimal price_sale;
	
	@Column(name = "short_description",length = 3000,nullable = true)
	private String short_description;
	
	@Lob
	@Column(name = "detail_description",nullable = true, columnDefinition = "LONGTEXT")
	private String detail_description;
	
	@Column(name = "avatar",length = 200,nullable = true)
	private String avatar;
	
	@Column(name = "is_hot",nullable = true)
	private Boolean is_hot=Boolean.TRUE;
	
	@Column(name="seo",length = 1000,nullable = true)
	private String seo;
	
//	@Column(name = "owner",length = 45,nullable = false)
//	private String owner;
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "created_by")
	private Users user;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category categories;
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "products",fetch = FetchType.LAZY)
	private List<Product_images> listImage= new ArrayList<Product_images>();
	
	public void addImage(Product_images pro_images) {
		listImage.add(pro_images);
		pro_images.setProducts(this);
	}

	public void deleteImage(Product_images pro_images) {
		listImage.remove(pro_images);
		pro_images.setProducts(null);
	}
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "product",fetch = FetchType.LAZY)
	private List<SaleOrder_Products> listProSale= new ArrayList<SaleOrder_Products>();
	
	public void addProSale(SaleOrder_Products proSale) {
		listProSale.add(proSale);
		proSale.setProduct(this);
	}

	public void deleteProSale(SaleOrder_Products proSale) {
		listProSale.remove(proSale);
		proSale.setProduct(null);
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getPrice_sale() {
		return price_sale;
	}

	public void setPrice_sale(BigDecimal price_sale) {
		this.price_sale = price_sale;
	}

	public String getShort_description() {
		return short_description;
	}

	public void setShort_description(String short_description) {
		this.short_description = short_description;
	}

	public String getDetail_description() {
		return detail_description;
	}

	public void setDetail_description(String detail_description) {
		this.detail_description = detail_description;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Boolean getIs_hot() {
		return is_hot;
	}

	public void setIs_hot(Boolean is_hot) {
		this.is_hot = is_hot;
	}


	public Category getCategories() {
		return categories;
	}

	public void setCategories(Category categories) {
		this.categories = categories;
	}

	public List<Product_images> getListImage() {
		return listImage;
	}

	public void setListImage(List<Product_images> listImage) {
		this.listImage = listImage;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public List<SaleOrder_Products> getListProSale() {
		return listProSale;
	}

	public void setListProSale(List<SaleOrder_Products> listProSale) {
		this.listProSale = listProSale;
	}

//	public String getOwner() {
//		return owner;
//	}
//
//	public void setOwner(String owner) {
//		this.owner = owner;
//	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}
	
}
