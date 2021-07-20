package com.Group9.ArtZone.dto;

import java.math.BigDecimal;

public class CartItem {
	private int productId;
	private String productName;
	//private int quanlity;
	private BigDecimal priceUnit;
	private String avatar;
	private String category;
	private String seo;
	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

//	public int getQuanlity() {
//		return quanlity;
//	}
//
//	public void setQuanlity(int quanlity) {
//		this.quanlity = quanlity;
//	}

	public BigDecimal getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}
	
}
