package com.Group9.ArtZone.Services;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.Group9.ArtZone.Entities.SaleOrder;
import com.Group9.ArtZone.dto.SaleOrderModel;

@Service
public class SaleOrderService extends BaseService<SaleOrder>{
	@PersistenceContext
	EntityManager entityManager;
	
	@Override
	protected EntityManager em() {
		return entityManager;
	}
	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}
	
	@SuppressWarnings("unchecked")
	public List<SaleOrder> searchModel(SaleOrderModel searchModel){
		String sql = "SELECT * FROM tbl_saleorder s WHERE 1=1 s.status=1";
		return executeNativeSql(sql);
	}
	@Transactional(rollbackOn = Exception.class)
	public SaleOrder save(SaleOrder saleOrder) throws Exception {
		try {

			// SaleOrderProduct.setSeo(new Slugify().slugify(saleOrderProduct.get));

			// save to db
			SaleOrder saved = super.saveOrUpdate(saleOrder);
			return saved;
		} catch (Exception e) {
			throw e;
		}
	}
	
}
