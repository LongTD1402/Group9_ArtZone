package com.Group9.ArtZone.Services;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.Group9.ArtZone.Conf.MVCConf;
import com.Group9.ArtZone.Entities.Product;
import com.Group9.ArtZone.Entities.Product_images;
import com.Group9.ArtZone.Entities.Roles;
import com.Group9.ArtZone.dto.RolesModel;
import com.github.slugify.Slugify;

@Service
public class RolesService extends BaseService<Roles>{
	@PersistenceContext
	EntityManager entityManager;

	@Override
	protected EntityManager em() {
		return entityManager;
	}

	@Override
	protected Class<Roles> clazz() {
		return Roles.class;
	}

	public Roles getRoleByName(String role) {
		String sql = "select * from tbl_roles r where r.name ='GUEST'";//" + role + "
		List<Roles> listRole=this.executeNativeSql(sql);
		if (listRole == null || listRole.size() <= 0) {
			return null;
		}else {
			return listRole.get(0);
		}
	}
	public Roles getRoleByNameP(String role) {
		String sql = "select * from tbl_roles r where r.name ='"+role+"'";
		List<Roles> listRole=this.executeNativeSql(sql);
		if (listRole == null || listRole.size() <= 0) {
			return null;
		}else {
			return listRole.get(0);
		}
	}
	public List<Roles> searchModel(RolesModel searchRole){
		String sql = "SELECT * FROM tbl_users u WHERE 1=1 u.status=1";
		return executeNativeSql(sql);
	}
}
