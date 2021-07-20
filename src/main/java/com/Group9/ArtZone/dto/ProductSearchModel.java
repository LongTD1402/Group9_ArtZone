package com.Group9.ArtZone.dto;

public class ProductSearchModel {
	
	private int categoryId;

	private String categorySeo;

	private String searchText;

	private String productSeo;
	
	private Boolean is_hot;
	
	private int user_id;
	
	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategorySeo() {
		return categorySeo;
	}

	public void setCategorySeo(String categorySeo) {
		this.categorySeo = categorySeo;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getProductSeo() {
		return productSeo;
	}

	public void setProductSeo(String productSeo) {
		this.productSeo = productSeo;
	}

	public Boolean getIs_hot() {
		return is_hot;
	}

	public void setIs_hot(Boolean is_hot) {
		this.is_hot = is_hot;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

}
