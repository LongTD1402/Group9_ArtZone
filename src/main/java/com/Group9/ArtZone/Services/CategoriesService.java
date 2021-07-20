package com.Group9.ArtZone.Services;

import java.io.File;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.Group9.ArtZone.Conf.MVCConf;
import com.Group9.ArtZone.Entities.Category;

import com.Group9.ArtZone.dto.CategoriesModel;

@Service
public class CategoriesService extends BaseService<Category> {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	protected EntityManager em() {
		return entityManager;
	}

	@Override
	protected Class<Category> clazz() {
		return Category.class;
	}
	public List<Category> getAllParents() {
		String sql = "select * from tbl_category tc where tc.parent_id is null";
		return this.executeNativeSql(sql);
	}
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	@Transactional(rollbackOn = Exception.class)
	public Category saveCategory(Category category, MultipartFile categoryAvatar) throws Exception {
		try {
			if (!isEmptyUploadFile(categoryAvatar)) {
				categoryAvatar.transferTo(
						new File(MVCConf.ROOT_UPLOAD_PATH + "category/avatar/" + categoryAvatar.getOriginalFilename()));
				category.setAvatar("category/avatar/" + categoryAvatar.getOriginalFilename());
			}
			Category saved = super.saveOrUpdate(category);
			return saved;
		} catch (Exception e) {
			throw e;
		}
	}

	@Transactional(rollbackOn = Exception.class)
	public Category editCategory(Category category, MultipartFile categoryAvatar) throws Exception {
		try {
			Category categoryOnDb = super.getById(category.getId());
			if (!isEmptyUploadFile(categoryAvatar)) {
				new File(MVCConf.ROOT_UPLOAD_PATH + categoryOnDb.getAvatar()).delete();
				categoryAvatar.transferTo(
						new File(MVCConf.ROOT_UPLOAD_PATH + "category/avatar/" + categoryAvatar.getOriginalFilename()));
				category.setAvatar("category/avatar/" + categoryAvatar.getOriginalFilename());
			}else {
				category.setAvatar(categoryOnDb.getAvatar());
			}
			Category saved = super.saveOrUpdate(category);
			return saved;
		} catch (Exception e) {
			throw e;
		}
	}

	public List<Category> search(CategoriesModel searchModel) {

		String sql = "SELECT *FROM tbl_category c WHERE 1=1 and c.status=1";
		return this.executeNativeSql(sql);
	}
}
