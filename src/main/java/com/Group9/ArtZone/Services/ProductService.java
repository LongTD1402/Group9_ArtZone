package com.Group9.ArtZone.Services;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.Group9.ArtZone.Conf.MVCConf;
import com.Group9.ArtZone.Entities.Product;
import com.Group9.ArtZone.Entities.Product_images;
import com.Group9.ArtZone.Entities.Roles;
import com.Group9.ArtZone.Entities.Users;
import com.Group9.ArtZone.dto.ProductSearchModel;
import com.github.slugify.Slugify;

@Service
public class ProductService extends BaseService<Product> {
	@PersistenceContext
	EntityManager entityManager;

	@Autowired
	ProductImageService productImageService;

	@Override
	protected EntityManager em() {
		return entityManager;
	}

	@Override
	protected Class<Product> clazz() {
		return Product.class;
	}

	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	@Transactional(rollbackOn = Exception.class)
	public Product edit(Product product, MultipartFile avatar, MultipartFile[] pictures) throws Exception {
		try {
			// lay thong tin san pham trong db.
			Product productOnDb = super.getById(product.getId());

			// avatar
			if (!isEmptyUploadFile(avatar)) {
				// xoa avatar cu di
				new File(MVCConf.ROOT_UPLOAD_PATH + productOnDb.getAvatar()).delete();

				// add avartar moi
				avatar.transferTo(
						new File(MVCConf.ROOT_UPLOAD_PATH + "product/avatar/" + avatar.getOriginalFilename()));
				product.setAvatar("product/avatar/" + avatar.getOriginalFilename());
			} else {
				// su dung lai avatar cu
				product.setAvatar(productOnDb.getAvatar());
			}

			// product images
			if (!isEmptyUploadFile(pictures)) {
				// xoa danh sach anh cu di
				List<Product_images> productImagesOnDb = productOnDb.getListImage();
				for (Product_images pic : productImagesOnDb) {
					new File(MVCConf.ROOT_UPLOAD_PATH + pic.getPath()).delete();
//					product.deleteProductImages(pic);
					productImageService.delete(pic);
				}

				// update danh sach anh moi
				for (MultipartFile pic : pictures) {
					pic.transferTo(new File(MVCConf.ROOT_UPLOAD_PATH + "product/images/" + pic.getOriginalFilename()));

					Product_images pi = new Product_images();
					pi.setPath("product/images/" + pic.getOriginalFilename());
					pi.setTitle(pic.getOriginalFilename());
					product.addImage(pi);
				}
			}
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Users u=new Users();
			if (principal instanceof UserDetails) { // user đã đăng nhập
				u = (Users) principal;
			}
			product.setUser(productOnDb.getUser());
			product.setUpdatedBy(u.getId());
			product.setUpdatedDate(new Date());
			product.setSeo(new Slugify().slugify(product.getTitle()));
			// save to db
			Product saved = super.saveOrUpdate(product);
			return saved;
		} catch (Exception e) {
			throw e;
		}
	}

	@Transactional(rollbackOn = Exception.class)
	public void deletePro(int id) throws Exception {
		try {
			Product productOnDb = super.getById(id);
			new File(MVCConf.ROOT_UPLOAD_PATH + productOnDb.getAvatar()).delete();
			List<Product_images> productImagesOnDb = productOnDb.getListImage();
			for (Product_images pic : productImagesOnDb) {
				new File(MVCConf.ROOT_UPLOAD_PATH + pic.getPath()).delete();
//					product.deleteProductImages(pic);
				productImageService.delete(pic);
			}

			delete(productOnDb);
		} catch (Exception e) {
			throw e;
		}

	}

	@Transactional(rollbackOn = Exception.class)
	public Product save(Product product, MultipartFile avatar, MultipartFile[] images) throws Exception {
		try {
			if (!isEmptyUploadFile(avatar)) {
				avatar.transferTo(
						new File(MVCConf.ROOT_UPLOAD_PATH + "product/avatar/" + avatar.getOriginalFilename()));
				product.setAvatar("product/avatar/" + avatar.getOriginalFilename());
			}
			if (!isEmptyUploadFile(images)) {
				for (MultipartFile multipartFile : images) {
					multipartFile.transferTo(new File(
							MVCConf.ROOT_UPLOAD_PATH + "product/images/" + multipartFile.getOriginalFilename()));
					Product_images pi = new Product_images();
					pi.setPath("product/images/" + multipartFile.getOriginalFilename());
					pi.setTitle(multipartFile.getOriginalFilename());
					product.addImage(pi);
				}
			}
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Users u=new Users();
			if (principal instanceof UserDetails) { // user đã đăng nhập
				u = (Users) principal;
			}
			product.setUser(u);
			product.setIs_hot(false);
			product.setCreatedDate(new Date());
			product.setSeo(new Slugify().slugify(product.getTitle()));
			List<Roles> r= u.getListRoles();
			int c=0;
			String collab="COLLAB";
			for (Roles roles : r) {
				if(roles.getName().compareTo(collab)==0) {
					c++;
				}
			}
			if(c>0) {
				product.setStatus(false);
			}else {
				product.setStatus(true);
			}
			Product saved = super.saveOrUpdate(product);
			return saved;
		} catch (Exception e) {
			throw e;
		}
	}
	public List<Product> search(ProductSearchModel searchModel) {
		String sql = "SELECT * FROM tbl_products p WHERE 1=1 and p.status=1"; //Câu lệnh sql dùng để chọn tất cả sản phẩm có trong database
		
		// tim kiem san pham theo categoryId
		if (searchModel.getCategoryId() > 0) {  //kiểm tra id (id luôn >0)
			sql += " and p.category_id = " + searchModel.getCategoryId();
		}

		// tim kiem san pham theo categorySeo
		if (!StringUtils.isEmpty(searchModel.getCategorySeo())) {  //Kiểm tra categorySeo có rỗng hay không
			sql += " and p.category_id in (select id from tbl_category c where c.seo = '" + searchModel.getCategorySeo()
					+ "')";
		}
		//Tim kiem san pham theo productSeo
		if (!StringUtils.isEmpty(searchModel.getProductSeo())) { 
			sql += " and p.seo ='"+searchModel.getProductSeo()+"'";
		}
		// tim kiem san pham theo seachText
		if (!StringUtils.isEmpty(searchModel.getSearchText())) {   //Kiểm tra searchText có rỗng hay không
			sql += " and (p.title like '%" + searchModel.getSearchText() + "%'" + " or p.detail_description like '%"
					+ searchModel.getSearchText() + "%'" + " or p.short_description like '%"
					+ searchModel.getSearchText() + "%')";
		}
		
		return executeNativeSql(sql);
	}
	public List<Product> searchProbyUserId(ProductSearchModel searchModel){
		String sql = "SELECT * FROM tbl_products p WHERE 1=1 ";
		if(searchModel.getUser_id()>0) {
			sql += " and p.created_by = " + searchModel.getUser_id();
		}
		return executeNativeSql(sql);
	}
}
