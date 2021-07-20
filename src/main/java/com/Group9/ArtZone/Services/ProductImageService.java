package com.Group9.ArtZone.Services;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Service;

import com.Group9.ArtZone.Entities.Product_images;

@Service
public class ProductImageService extends BaseService<Product_images>{
	@PersistenceContext
	EntityManager entityManager;

	@Override
	protected EntityManager em() {
		return entityManager;
	}

	@Override
	protected Class<Product_images> clazz() {
		return Product_images.class;
	}
}
