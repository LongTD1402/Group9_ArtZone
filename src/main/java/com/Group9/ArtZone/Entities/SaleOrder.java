package com.Group9.ArtZone.Entities;

import java.math.BigDecimal;
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
@Table(name = "tbl_saleorder")
public class SaleOrder extends BaseEntity{
	
	@Column(name = "code",length = 45,nullable = false)
	private String code;
	
	@Column(name = "user_id",length = 11,nullable = true)
	private Integer user_id;
	
	@Column(name = "total", precision = 13,scale = 2,nullable = true)
	private BigDecimal total;
	
	@Column(name = "customer_name",length = 100, nullable = true)
	private String customer_name;
	
	@Column(name = "seo",length = 100,nullable = true)
	private String seo;
	
	@Column(name = "customer_phone",length = 100,nullable = true)
	private String customer_phone;
	
	@Column(name = "customer_email",length = 100,nullable = true)
	private String customer_email;
	
	@Column(name = "customer_address",length = 100,nullable = true)
	private String customer_address;
	
	@Column(name = "created_by", nullable = true)
	private Integer createdBy;
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "saleorder",fetch = FetchType.LAZY)
	private List<SaleOrder_Products> listSaleOder_Product=new ArrayList<SaleOrder_Products>();
	
	public void addSaleoder_products(SaleOrder_Products saleoder_product) {
		listSaleOder_Product.add(saleoder_product);
		saleoder_product.setSaleorder(this);
	}
	
	public void deleteSaleoder_products(SaleOrder_Products saleoder_product){
		listSaleOder_Product.remove(saleoder_product);
		saleoder_product.setSaleorder(null);
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public String getCustomer_phone() {
		return customer_phone;
	}

	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public List<SaleOrder_Products> getListSaleOder_Product() {
		return listSaleOder_Product;
	}

	public void setListSaleOder_Product(List<SaleOrder_Products> listSaleOder_Product) {
		this.listSaleOder_Product = listSaleOder_Product;
	}

	public String getCustomer_address() {
		return customer_address;
	}

	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

}
