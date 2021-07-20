package com.Group9.ArtZone.Services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;

import com.Group9.ArtZone.Entities.SaleOrder_Products;
import com.Group9.ArtZone.dto.SaleOder_ProductModel;

@Service
public class SaleOderProductService extends BaseService<SaleOrder_Products>{
	
	@PersistenceContext
	EntityManager entityManager;
	
	@Override
	protected EntityManager em() {
		return entityManager;
	}
	@Override
	protected Class<SaleOrder_Products> clazz() {
		return SaleOrder_Products.class;
	}
	public List<SaleOrder_Products> search(SaleOder_ProductModel searchModel) {
		String sql = "SELECT * FROM tbl_saleorder_products s WHERE 1=1 and s.status=1"; //Câu lệnh sql dùng để chọn tất cả sản phẩm có trong database
		
		// tim kiem san pham theo categoryId
		if (searchModel.getSaleOder_ProductId() > 0) {  //kiểm tra id (id luôn >0)
			sql += " and s.category_id = " + searchModel.getSaleOder_ProductId();
		}

		return executeNativeSql(sql);
	}
}
